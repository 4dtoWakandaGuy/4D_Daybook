//%attributes = {}

If (False:C215)
	//Project Method Name:      CO_AddressManager
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(CO_al_AddressRecordIDs;0)
	//ARRAY LONGINT(CO_al_AddressType;0)
	//ARRAY LONGINT(CO_al_AddressTypes;0)
	//ARRAY LONGINT(CO_al_ExistingAddressReference;0)
	//ARRAY LONGINT(CO_al_ExistingAddressTypes;0)
	//ARRAY TEXT(CO_at_AddressLine1;0)
	//ARRAY TEXT(CO_at_AddressLine2;0)
	//ARRAY TEXT(CO_at_AddressType;0)
	//ARRAY TEXT(CO_at_AddressTypes;0)
	//ARRAY TEXT(CO_at_Country;0)
	//ARRAY TEXT(CO_at_County;0)
	//ARRAY TEXT(CO_at_EXISTINGADDRESSTYPES;0)
	//ARRAY TEXT(CO_at_FormattedAddress;0)
	//ARRAY TEXT(CO_at_PostalCode;0)
	//ARRAY TEXT(CO_at_Town;0)
	C_BOOLEAN:C305($_bo_DoNotSetFields)
	C_LONGINT:C283($_l_AddedItemID; $_l_AddressID; $_l_AddressRow; $_l_AddressRow2; $_l_AddressRow3; $_l_index; $_l_ListID; $_l_NextElement; B_ClipBoardBUTTON; cb_Edit; CUR_l_SelectedAddressTypeRow)
	C_PICTURE:C286(COM_pic_ClipBoardPICT)
	C_REAL:C285($1; $2; $3)
	C_TEXT:C284(<>DB_t_Address1Label; <>DB_t_Address2Label; <>DB_t_CountryLabel; <>DB_t_CountyLabel; <>DB_t_PostcodeLabel; <>DB_t_TownLabel; $_t_oldMethodName; COM_t_AddressLine1; COM_t_AddressLine2; COM_t_Country; COM_t_County)
	C_TEXT:C284(COM_t_DisplayAddress; COM_t_PostalCode; COM_t_Town; DB_t_Address1Label; DB_t_Address2Label; DB_t_CountryLabel; DB_t_CountyLabel; DB_t_PostcodeLabel; DB_t_TownLabel)
End if 
//Code Starts Here


//method CO_addressManager
$_t_oldMethodName:=ERR_MethodTracker("CO_AddressManager")

//If (◊Buttpress#"")
If (Count parameters:C259=0)
	//initialise
	DB_t_Address1Label:=<>DB_t_Address1Label
	DB_t_Address2Label:=<>DB_t_Address2Label
	
	DB_t_TownLabel:=<>DB_t_TownLabel
	DB_t_CountyLabel:=<>DB_t_CountyLabel
	OBJECT SET PLACEHOLDER:C1295(*; "oCounty"; DB_t_CountyLabel)
	OBJECT SET PLACEHOLDER:C1295(*; "oCounty2"; DB_t_CountyLabel)
	OBJECT SET PLACEHOLDER:C1295(*; "oCountyInvoice"; "Invoice "+DB_t_CountyLabel)
	OBJECT SET PLACEHOLDER:C1295(*; "oCounty1"; "Registered "+DB_t_CountyLabel)
	DB_t_PostcodeLabel:=<>DB_t_PostcodeLabel
	OBJECT SET PLACEHOLDER:C1295(*; "oPostalCode"; DB_t_PostcodeLabel)
	OBJECT SET PLACEHOLDER:C1295(*; "oPostalCode2"; DB_t_PostcodeLabel)
	OBJECT SET PLACEHOLDER:C1295(*; "oPostCodeInvoice"; "Invoice "+DB_t_PostcodeLabel)
	OBJECT SET PLACEHOLDER:C1295(*; "oPostalCode1"; "Registered "+DB_t_PostcodeLabel)
	
	DB_t_CountryLabel:=<>DB_t_CountryLabel
	OBJECT SET PLACEHOLDER:C1295(*; "oCountry"; DB_t_CountryLabel)
	OBJECT SET PLACEHOLDER:C1295(*; "oCountry2"; DB_t_CountryLabel)
	OBJECT SET PLACEHOLDER:C1295(*; "oCountryInvoice"; "Invioce "+DB_t_CountryLabel)
	OBJECT SET PLACEHOLDER:C1295(*; "oCountry1"; "Registered "+DB_t_CountryLabel)
	ARRAY TEXT:C222(CO_at_AddressTypes; 0)
	ARRAY LONGINT:C221(CO_al_AddressTypes; 0)
	$_l_ListID:=AA_GetListbyName("Address Types")
	AA_LoadListbyID($_l_ListID; ->CO_at_AddressTypes; ->CO_al_AddressTypes; False:C215)
	//that loads the address types
	//make sure the following 3 types exist
	$_l_AddressRow2:=Find in array:C230(CO_at_AddressTypes; "Shipping Address")
	If ($_l_AddressRow2<0)
		$_l_AddressRow2:=Find in array:C230(CO_at_AddressTypes; "Mailing Address")
		If ($_l_AddressRow2>0)
			READ WRITE:C146([LIST_ITEMS:95])
			QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=CO_al_AddressTypes{$_l_AddressRow2})
			[LIST_ITEMS:95]List_Entry:2:="Shipping Address"
			DB_SaveRecord(->[LIST_ITEMS:95])
			READ ONLY:C145([LIST_ITEMS:95])
			AA_LoadListbyID($_l_ListID; ->CO_at_AddressTypes; ->CO_al_AddressTypes; False:C215)
		Else 
			
			$_l_AddedItemID:=AA_ListAddItembyID($_l_ListID; "Shipping Address")
			AA_LoadListbyID($_l_ListID; ->CO_at_AddressTypes; ->CO_al_AddressTypes; False:C215)
		End if 
	End if 
	$_l_AddressRow2:=Find in array:C230(CO_at_AddressTypes; "Invoice Address")
	If ($_l_AddressRow2<0)
		$_l_AddedItemID:=AA_ListAddItembyID($_l_ListID; "Invoice Address")
		AA_LoadListbyID($_l_ListID; ->CO_at_AddressTypes; ->CO_al_AddressTypes; False:C215)
	End if 
	$_l_AddressRow2:=Find in array:C230(CO_at_AddressTypes; "Registered Address")
	If ($_l_AddressRow2<0)
		$_l_AddedItemID:=AA_ListAddItembyID($_l_ListID; "Registered Address")
		AA_LoadListbyID($_l_ListID; ->CO_at_AddressTypes; ->CO_al_AddressTypes; False:C215)
	End if 
	//Now load any addresses for this company
	ARRAY LONGINT:C221(CO_al_AddressRecordIDs; 0)
	ARRAY TEXT:C222(CO_at_AddressLine1; 0)
	ARRAY TEXT:C222(CO_at_AddressLine2; 0)
	ARRAY TEXT:C222(CO_at_Town; 0)
	ARRAY TEXT:C222(CO_at_County; 0)
	ARRAY TEXT:C222(CO_at_PostalCode; 0)
	ARRAY TEXT:C222(CO_at_Country; 0)
	ARRAY LONGINT:C221(CO_al_AddressType; 0)
	ARRAY TEXT:C222(CO_at_AddressType; 0)
	ARRAY TEXT:C222(CO_at_FormattedAddress; 0)
	$_bo_DoNotSetFields:=False:C215
	If ([COMPANIES:2]x_ID:63>0)
		QUERY:C277([AddressRecords:125]; [AddressRecords:125]X_OwnerTableID:4=Table:C252(->[COMPANIES:2]); *)
		QUERY:C277([AddressRecords:125];  & ; [AddressRecords:125]X_OwnerRecordID:5=[COMPANIES:2]x_ID:63)
		SELECTION TO ARRAY:C260([AddressRecords:125]X_ID:1; CO_al_AddressRecordIDs; [AddressRecords:125]AddressClassID:2; CO_al_AddressType; [AddressRecords:125]AddressClass:3; CO_at_AddressType; [AddressRecords:125]AddressLine1:6; CO_at_AddressLine1; [AddressRecords:125]AddressLine2:7; CO_at_AddressLine2; [AddressRecords:125]Town_City:8; CO_at_Town; [AddressRecords:125]County_State:9; CO_at_County; [AddressRecords:125]Postal_Code:10; CO_at_PostalCode; [AddressRecords:125]Country:11; CO_at_Country; [AddressRecords:125]FormattedAddress:12; CO_at_FormattedAddress)
		If ([COMPANIES:2]Address_Line_one:3#"") | ([COMPANIES:2]Address_Line_two:4#"") | ([COMPANIES:2]Town_or_City:5#"") | ([COMPANIES:2]County_or_State:6#"") | ([COMPANIES:2]Postal_Code:7#"") | ([COMPANIES:2]Country:8#"")
			$_l_AddressRow2:=Find in array:C230(CO_at_AddressTypes; "Shipping Address")
			$_l_AddressRow:=Find in array:C230(CO_al_AddressType; CO_al_AddressTypes{$_l_AddressRow2})
			If ($_l_AddressRow<0)
				//There is no standard address stored so just create the array
				//The is an address-but remember to not make the fields invisible
				$_bo_DoNotSetFields:=True:C214
				APPEND TO ARRAY:C911(CO_at_AddressLine1; [COMPANIES:2]Address_Line_one:3)
				APPEND TO ARRAY:C911(CO_at_AddressLine2; [COMPANIES:2]Address_Line_two:4)
				APPEND TO ARRAY:C911(CO_at_Town; [COMPANIES:2]Town_or_City:5)
				APPEND TO ARRAY:C911(CO_at_County; [COMPANIES:2]County_or_State:6)
				APPEND TO ARRAY:C911(CO_at_PostalCode; [COMPANIES:2]Postal_Code:7)
				APPEND TO ARRAY:C911(CO_at_Country; [COMPANIES:2]Country:8)
				APPEND TO ARRAY:C911(CO_al_AddressType; CO_al_AddressTypes{$_l_AddressRow2})
				APPEND TO ARRAY:C911(CO_at_AddressType; CO_at_AddressTypes{$_l_AddressRow2})
				APPEND TO ARRAY:C911(CO_at_FormattedAddress; WS_BUILDADDRESS)  //Replace string([COMPANIES]ADDRESS;Char(13);Char(10))
				APPEND TO ARRAY:C911(CO_al_AddressRecordIDs; 0)
				
				
				
			End if 
		End if 
		If ([COMPANIES:2]Invoice_Address_Line_One:18#"") | ([COMPANIES:2]Invoice_Address_Line_Two:19#"") | ([COMPANIES:2]Invoice_Town:20#"") | ([COMPANIES:2]Invoice_County:21#"") | ([COMPANIES:2]Invoice_Postcode:22#"") | ([COMPANIES:2]Invoice_Country:23#"")
			$_l_AddressRow2:=Find in array:C230(CO_at_AddressTypes; "Invoice Address")
			$_l_AddressRow:=Find in array:C230(CO_al_AddressType; CO_al_AddressTypes{$_l_AddressRow2})
			If ($_l_AddressRow<0)
				//There is no INVOICE address RECORD stored so just create the array
				//The is an address
				APPEND TO ARRAY:C911(CO_at_AddressLine1; [COMPANIES:2]Invoice_Address_Line_One:18)
				APPEND TO ARRAY:C911(CO_at_AddressLine2; [COMPANIES:2]Invoice_Address_Line_Two:19)
				APPEND TO ARRAY:C911(CO_at_Town; [COMPANIES:2]Invoice_Town:20)
				APPEND TO ARRAY:C911(CO_at_County; [COMPANIES:2]Invoice_County:21)
				APPEND TO ARRAY:C911(CO_at_PostalCode; [COMPANIES:2]Invoice_Postcode:22)
				APPEND TO ARRAY:C911(CO_at_Country; [COMPANIES:2]Invoice_Country:23)
				APPEND TO ARRAY:C911(CO_al_AddressType; CO_al_AddressTypes{$_l_AddressRow2})
				APPEND TO ARRAY:C911(CO_at_AddressType; CO_at_AddressTypes{$_l_AddressRow2})
				APPEND TO ARRAY:C911(CO_al_AddressRecordIDs; 0)
				APPEND TO ARRAY:C911(CO_at_FormattedAddress; WS_BUILDADDRESS([COMPANIES:2]Invoice_Address_Line_One:18; [COMPANIES:2]Invoice_Address_Line_Two:19; [COMPANIES:2]Invoice_Town:20; [COMPANIES:2]Invoice_County:21; [COMPANIES:2]Invoice_Postcode:22; [COMPANIES:2]Invoice_Country:23))
				
				
			End if 
			
		End if 
		
	End if 
	$_l_AddressRow2:=Find in array:C230(CO_at_AddressTypes; "Shipping Address")
	CUR_l_SelectedAddressTypeRow:=0
	//TRACE
	$_bo_DoNotSetFields:=False:C215
	If ($_l_AddressRow2>0)
		CUR_l_SelectedAddressTypeRow:=Find in array:C230(CO_al_AddressType; CO_al_AddressTypes{$_l_AddressRow2})  //1 or 2 or 3
		If (CUR_l_SelectedAddressTypeRow<0)
			$_l_AddressRow2:=Find in array:C230(CO_at_AddressTypes; "Shipping Address")
			If ($_l_AddressRow2>0)
				$_l_AddressID:=CO_al_AddressTypes{$_l_AddressRow2}
				If ($_l_AddressID>0)
					$_l_AddressRow3:=Find in array:C230(CO_al_AddressType; $_l_AddressID)
					If ($_l_AddressRow3<0)
						$_bo_DoNotSetFields:=True:C214
						APPEND TO ARRAY:C911(CO_at_AddressLine1; COM_t_AddressLine1)
						APPEND TO ARRAY:C911(CO_at_AddressLine2; COM_t_AddressLine2)
						APPEND TO ARRAY:C911(CO_al_AddressType; CO_al_AddressTypes{$_l_AddressRow2})
						APPEND TO ARRAY:C911(CO_at_AddressType; CO_at_AddressTypes{$_l_AddressRow2})
						APPEND TO ARRAY:C911(CO_at_Town; "")
						APPEND TO ARRAY:C911(CO_at_County; "")
						APPEND TO ARRAY:C911(CO_at_PostalCode; "")
						APPEND TO ARRAY:C911(CO_at_Country; "")
						APPEND TO ARRAY:C911(CO_al_AddressRecordIDs; -(AA_GetNextIDinMethod(->[AddressRecords:125]X_ID:1)))
						APPEND TO ARRAY:C911(CO_at_FormattedAddress; WS_BUILDADDRESS([COMPANIES:2]Invoice_Address_Line_One:18; [COMPANIES:2]Invoice_Address_Line_Two:19; [COMPANIES:2]Invoice_Town:20; [COMPANIES:2]Invoice_County:21; [COMPANIES:2]Invoice_Postcode:22; [COMPANIES:2]Invoice_Country:23))
						CUR_l_SelectedAddressTypeRow:=Size of array:C274(CO_al_AddressType)  // 1 or 2 or 3
						
						
					Else 
						CUR_l_SelectedAddressTypeRow:=$_l_AddressRow3
					End if 
				End if 
			End if 
		End if 
	Else 
		
	End if 
	If (CUR_l_SelectedAddressTypeRow>0) & ($_bo_DoNotSetFields=False:C215)  //1 or 2 or 3
		OBJECT SET VISIBLE:C603(*; "oAddressLine1Label@"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oAddressLine2Label@"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oTownLabel@"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oCountyLabel@"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oPostcodeLabel@"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oCountryLabel"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oAddressLine1var@"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oAddressLine2Var@"; False:C215)
		//OBJECT SET VISIBLE(COM_t_AddressLine1;False)
		//OBJECT SET VISIBLE(COM_t_AddressLine2;False)
		OBJECT SET VISIBLE:C603(*; "oTown@"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oCounty@"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oPostalCode@"; False:C215)
		
		OBJECT SET VISIBLE:C603(*; "oCountry@"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oCompanyAddress1"; True:C214)
		//````
		COM_t_AddressLine1:=CO_at_AddressLine1{CUR_l_SelectedAddressTypeRow}
		COM_t_AddressLine2:=CO_at_AddressLine2{CUR_l_SelectedAddressTypeRow}
		COM_t_Town:=CO_at_Town{CUR_l_SelectedAddressTypeRow}
		COM_t_County:=CO_at_County{CUR_l_SelectedAddressTypeRow}
		COM_t_PostalCode:=CO_at_PostalCode{CUR_l_SelectedAddressTypeRow}
		COM_t_Country:=CO_at_Country{CUR_l_SelectedAddressTypeRow}
		COM_t_DisplayAddress:=CO_at_FormattedAddress{CUR_l_SelectedAddressTypeRow}
	Else 
		OBJECT SET VISIBLE:C603(*; "oAddressLine1Label@"; True:C214)
		OBJECT SET VISIBLE:C603(*; "oAddressLine2Label@"; True:C214)
		OBJECT SET VISIBLE:C603(*; "oTownLabel@"; True:C214)
		OBJECT SET VISIBLE:C603(*; "oCountyLabel@"; True:C214)
		OBJECT SET VISIBLE:C603(*; "oPostcodeLabel@"; True:C214)
		OBJECT SET VISIBLE:C603(*; "oCountryLabel"; True:C214)
		OBJECT SET VISIBLE:C603(*; "oAddressLine1var@"; True:C214)
		OBJECT SET VISIBLE:C603(*; "oAddressLine2Var@"; True:C214)
		//OBJECT SET VISIBLE(COM_t_AddressLine1;False)
		//OBJECT SET VISIBLE(COM_t_AddressLine2;False)
		OBJECT SET VISIBLE:C603(*; "oTown@"; True:C214)
		OBJECT SET VISIBLE:C603(*; "oCounty@"; True:C214)
		OBJECT SET VISIBLE:C603(*; "oPostalCode@"; True:C214)
		OBJECT SET VISIBLE:C603(*; "oCountry@"; True:C214)
		OBJECT SET VISIBLE:C603(*; "oCompanyAddress1"; False:C215)
		COM_t_AddressLine1:=""
		COM_t_AddressLine2:=""
		COM_t_Town:=""
		COM_t_County:=""
		COM_t_PostalCode:=""
		COM_t_Country:=""
		COM_t_DisplayAddress:=""
		cb_Edit:=1
		OBJECT SET VISIBLE:C603(B_ClipBoardBUTTON; False:C215)
		OBJECT SET VISIBLE:C603(COM_pic_ClipBoardPICT; False:C215)
		
	End if 
	//NOW SET THE POP-UP
	ARRAY TEXT:C222(CO_at_EXISTINGADDRESSTYPES; 0)
	ARRAY LONGINT:C221(CO_al_ExistingAddressTypes; 0)
	ARRAY LONGINT:C221(CO_al_ExistingAddressReference; 0)
	//BY DEFAULT THIS WILL HAVE THE 3 ADDRESS TYPES
	ARRAY TEXT:C222(CO_at_EXISTINGADDRESSTYPES; 3)
	ARRAY LONGINT:C221(CO_al_ExistingAddressTypes; 3)
	ARRAY LONGINT:C221(CO_al_ExistingAddressReference; 3)
	DB_t_Address1Label:=CO_at_ExistingAddressTypes{1}
	CO_at_ExistingAddressTypes{1}:="Shipping Address"
	CO_al_ExistingAddressTypes{1}:=CO_al_AddressTypes{Find in array:C230(CO_at_AddressTypes; "Shipping Address")}
	CO_al_ExistingAddressReference{1}:=Find in array:C230(CO_al_AddressType; CO_al_ExistingAddressTypes{1})
	
	CO_at_ExistingAddressTypes{2}:="Invoice Address"
	CO_al_ExistingAddressTypes{2}:=CO_al_AddressTypes{Find in array:C230(CO_at_AddressTypes; "Invoice Address")}
	CO_al_ExistingAddressReference{2}:=Find in array:C230(CO_al_AddressType; CO_al_ExistingAddressTypes{2})
	If (CO_al_ExistingAddressReference{2}=-1)
		CO_al_ExistingAddressReference{2}:=-2
	End if 
	
	CO_at_ExistingAddressTypes{3}:="Registered Address"
	CO_al_ExistingAddressTypes{3}:=CO_al_AddressTypes{Find in array:C230(CO_at_AddressTypes; "Registered Address")}
	CO_al_ExistingAddressReference{3}:=Find in array:C230(CO_al_AddressType; CO_al_ExistingAddressTypes{3})
	If (CO_al_ExistingAddressReference{3}=-1)
		CO_al_ExistingAddressReference{3}:=-3
	End if 
	DB_t_Address1Label:=CO_at_ExistingAddressTypes{1}
	
	$_l_NextElement:=4
	If (Size of array:C274(CO_al_AddressType)>3)
		//there are more than 3 address types for this record
		For ($_l_index; 1; Size of array:C274(CO_al_AddressType))
			$_l_AddressRow2:=Find in array:C230(CO_al_ExistingAddressTypes; CO_al_AddressType{$_l_index})
			If ($_l_AddressRow2<0)
				//add this one one
				ARRAY TEXT:C222(CO_at_EXISTINGADDRESSTYPES; $_l_NextElement)
				ARRAY LONGINT:C221(CO_al_ExistingAddressTypes; $_l_NextElement)
				ARRAY LONGINT:C221(CO_al_ExistingAddressReference; $_l_NextElement)
				$_l_AddressRow:=Find in array:C230(CO_al_AddressTypes; CO_al_AddressType{$_l_index})
				CO_at_ExistingAddressTypes{$_l_NextElement}:=CO_at_AddressTypes{$_l_AddressRow}
				CO_al_ExistingAddressTypes{$_l_NextElement}:=CO_al_AddressTypes{$_l_AddressRow}
				CO_al_ExistingAddressReference{$_l_NextElement}:=Find in array:C230(CO_al_AddressType; CO_al_AddressType{$_l_index})
				
				
			End if 
			
		End for 
		
	End if 
	
	
	If (Size of array:C274(CO_at_AddressTypes)>Size of array:C274(CO_at_ExistingAddressTypes))
		For ($_l_index; 1; Size of array:C274(CO_at_AddressTypes))
			$_l_AddressRow2:=Find in array:C230(CO_at_ExistingAddressTypes; CO_at_AddressTypes{$_l_index})
			If ($_l_AddressRow2<0)
				APPEND TO ARRAY:C911(CO_at_ExistingAddressTypes; CO_at_AddressTypes{$_l_index})
				APPEND TO ARRAY:C911(CO_al_ExistingAddressTypes; CO_al_AddressTypes{$_l_index})
				APPEND TO ARRAY:C911(CO_al_ExistingAddressReference; 0)
				
			End if 
			
		End for 
		APPEND TO ARRAY:C911(CO_at_ExistingAddressTypes; "-")
		APPEND TO ARRAY:C911(CO_al_ExistingAddressTypes; 0)
		APPEND TO ARRAY:C911(CO_al_ExistingAddressReference; 0)
		APPEND TO ARRAY:C911(CO_at_ExistingAddressTypes; "Add Address Type")
		APPEND TO ARRAY:C911(CO_al_ExistingAddressTypes; 999)
		APPEND TO ARRAY:C911(CO_al_ExistingAddressReference; 0)
		
		//PUT AN ADD ITEM ON THE END
	Else 
		
		APPEND TO ARRAY:C911(CO_at_ExistingAddressTypes; "-")
		APPEND TO ARRAY:C911(CO_al_ExistingAddressTypes; 0)
		APPEND TO ARRAY:C911(CO_al_ExistingAddressReference; 0)
		APPEND TO ARRAY:C911(CO_at_ExistingAddressTypes; "Add Address Type")
		APPEND TO ARRAY:C911(CO_al_ExistingAddressTypes; 999)
		APPEND TO ARRAY:C911(CO_al_ExistingAddressReference; 0)
	End if 
Else 
	Case of 
		: (Count parameters:C259>=3)
			CO_addressManager2($1; $2; $3)
		: (Count parameters:C259>=2)
			CO_addressManager2($1; $2; 0)
		: (Count parameters:C259>=1)
			CO_addressManager2($1; 0; 0)
	End case 
	
	
End if 

//End if
ERR_MethodTrackerReturn("CO_AddressManager"; $_t_oldMethodName)

