//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_Getaddress
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 11/12/2009 14:18`Method: DB_Getaddress
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(CO_al_AddressTypes;0)
	//ARRAY TEXT(CO_at_AddressTypes;0)
	C_LONGINT:C283($_l_AddedItemID; $_l_AddressType; $_l_AddressTypeRow; $_l_CompanyID; $_l_ListID; $_l_TableNumber)
	C_TEXT:C284($_t_Address; $_t_oldMethodName; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_Getaddress")
//this method will get an address
//for the current loaded record
//pass an address type (String)
//if the value is not found the mailing address is returned as default
ARRAY TEXT:C222(CO_at_AddressTypes; 0)
ARRAY LONGINT:C221(CO_al_AddressTypes; 0)
$_l_ListID:=AA_GetListbyName("Address Types")
AA_LoadListbyID($_l_ListID; ->CO_at_AddressTypes; ->CO_al_AddressTypes; False:C215)
//that loads the address types
//make sure the following 3 types exist
$_l_AddressTypeRow:=Find in array:C230(CO_at_AddressTypes; "Shipping Address")
If ($_l_AddressTypeRow<0)
	$_l_AddressTypeRow:=Find in array:C230(CO_at_AddressTypes; "Mailing Address")
	If ($_l_AddressTypeRow>0)
		READ WRITE:C146([LIST_ITEMS:95])
		QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=CO_al_AddressTypes{$_l_AddressTypeRow})
		[LIST_ITEMS:95]List_Name:1:="Shipping Address"
		DB_SaveRecord(->[LIST_ITEMS:95])
		READ ONLY:C145([LIST_ITEMS:95])
		AA_LoadListbyID($_l_ListID; ->CO_at_AddressTypes; ->CO_al_AddressTypes; False:C215)
	Else 
		
		$_l_AddedItemID:=AA_ListAddItembyID($_l_ListID; "Shipping Address")
		AA_LoadListbyID($_l_ListID; ->CO_at_AddressTypes; ->CO_al_AddressTypes; False:C215)
	End if 
End if 
$_l_AddressTypeRow:=Find in array:C230(CO_at_AddressTypes; "Invoice Address")
If ($_l_AddressTypeRow<0)
	$_l_AddedItemID:=AA_ListAddItembyID($_l_ListID; "Invoice Address")
	AA_LoadListbyID($_l_ListID; ->CO_at_AddressTypes; ->CO_al_AddressTypes; False:C215)
End if 
$_l_AddressTypeRow:=Find in array:C230(CO_at_AddressTypes; "Registered Address")
If ($_l_AddressTypeRow<0)
	$_l_AddedItemID:=AA_ListAddItembyID($_l_ListID; "Registered Address")
	AA_LoadListbyID($_l_ListID; ->CO_at_AddressTypes; ->CO_al_AddressTypes; False:C215)
End if 
$_l_CompanyID:=[COMPANIES:2]x_ID:63
$_l_TableNumber:=Table:C252(->[COMPANIES:2])
$_l_AddressTypeRow:=Find in array:C230(CO_at_AddressTypes; $1)
If ($_l_AddressTypeRow<0)
	$_l_AddressTypeRow:=Find in array:C230(CO_at_AddressTypes; "Shipping Address")
End if 
$_l_AddressType:=CO_al_AddressTypes{$_l_AddressTypeRow}
QUERY:C277([AddressRecords:125]; [AddressRecords:125]AddressClassID:2=$_l_AddressType; *)
QUERY:C277([AddressRecords:125];  & ; [AddressRecords:125]X_OwnerTableID:4=$_l_TableNumber; *)
QUERY:C277([AddressRecords:125];  & ; [AddressRecords:125]X_OwnerRecordID:5=$_l_CompanyID)
If (Records in selection:C76([AddressRecords:125])>=1)
	$_t_Address:=[AddressRecords:125]FormattedAddress:12
	
Else 
	//no record
	$_l_AddressTypeRow:=Find in array:C230(CO_at_AddressTypes; "Shipping Address")
	$_l_AddressType:=CO_al_AddressTypes{$_l_AddressTypeRow}
	QUERY:C277([AddressRecords:125]; [AddressRecords:125]AddressClassID:2=$_l_AddressType; *)
	QUERY:C277([AddressRecords:125];  & ; [AddressRecords:125]X_OwnerTableID:4=$_l_TableNumber; *)
	QUERY:C277([AddressRecords:125];  & ; [AddressRecords:125]X_OwnerRecordID:5=$_l_CompanyID)
	If (Records in selection:C76([AddressRecords:125])>=1)
		$_t_Address:=[AddressRecords:125]FormattedAddress:12
	Else 
		//no record
		If ($1="Invoice Address") & (([COMPANIES:2]Invoice_Address_Line_One:18#"") | ([COMPANIES:2]Invoice_Address_Line_Two:19#"") | ([COMPANIES:2]Invoice_Town:20#"") | ([COMPANIES:2]Invoice_County:21#"") | ([COMPANIES:2]Invoice_Postcode:22#"") | ([COMPANIES:2]Invoice_Country:23#""))
			$_t_Address:=WS_BUILDADDRESS([COMPANIES:2]Invoice_Address_Line_One:18; [COMPANIES:2]Invoice_Address_Line_Two:19; [COMPANIES:2]Invoice_Town:20; [COMPANIES:2]Invoice_County:21; [COMPANIES:2]Invoice_Postcode:22; [COMPANIES:2]Invoice_Country:23)
		Else 
			$_t_Address:=[COMPANIES:2]ADDRESS:60
		End if 
		
		$0:=$_t_Address
		
	End if 
	
End if 
ERR_MethodTrackerReturn("DB_Getaddress"; $_t_oldMethodName)