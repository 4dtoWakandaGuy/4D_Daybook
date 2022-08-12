//%attributes = {}
If (False:C215)
	//Project Method Name:      INV_SaveDeliveryAddress
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(CO_al_AddressTypes;0)
	//ARRAY TEXT(CO_at_AddressTypes;0)
	C_LONGINT:C283($_l_AddedItemID; $_l_AddressTypeClass; $_l_AddressTypeRow; $_l_ListID; INV_l_AdhocMod)
	C_TEXT:C284($_t_oldMethodName; INV_t_AddressLine1; INV_t_AddressLine2; INV_t_Country; INV_t_County; INV_t_PostalCode; INV_t_Town)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("INV_SaveDeliveryAddress")

If (INV_t_AddressLine1#"") | (INV_t_AddressLine2#"") | (INV_t_Town#"") | (INV_t_County#"") | (INV_t_PostalCode#"") | (INV_t_Country#"")
	
	If ([INVOICES:39]x_DeliveryAddressID:48>0)
		//there is a saved address
		//the address is modified
		READ WRITE:C146([AddressRecords:125])
		QUERY:C277([AddressRecords:125]; [AddressRecords:125]X_ID:1=[INVOICES:39]x_DeliveryAddressID:48)
		
		[AddressRecords:125]AddressLine1:6:=INV_t_AddressLine1
		[AddressRecords:125]AddressLine2:7:=INV_t_AddressLine2
		[AddressRecords:125]Country:11:=INV_t_Country
		[AddressRecords:125]County_State:9:=INV_t_County
		[AddressRecords:125]Postal_Code:10:=INV_t_PostalCode
		[AddressRecords:125]Town_City:8:=INV_t_Town
		DB_SaveRecord(->[AddressRecords:125])
		READ ONLY:C145([AddressRecords:125])
		[INVOICES:39]Deliver_To:32:=[AddressRecords:125]FormattedAddress:12
	Else 
		ARRAY TEXT:C222(CO_at_AddressTypes; 0)
		ARRAY LONGINT:C221(CO_al_AddressTypes; 0)
		$_l_ListID:=AA_GetListbyName("Address Types")
		AA_LoadListbyID($_l_ListID; ->CO_at_AddressTypes; ->CO_al_AddressTypes; False:C215)
		$_l_AddressTypeRow:=Find in array:C230(CO_at_AddressTypes; "Delivery Address")
		If ($_l_AddressTypeRow<0)
			$_l_AddedItemID:=AA_ListAddItembyID($_l_ListID; "Delivery Address")
			AA_LoadListbyID($_l_ListID; ->CO_at_AddressTypes; ->CO_al_AddressTypes; False:C215)
		End if 
		$_l_AddressTypeRow:=Find in array:C230(CO_at_AddressTypes; "Delivery Address")
		
		$_l_AddressTypeClass:=CO_al_AddressTypes{$_l_AddressTypeRow}
		//no saved address
		READ WRITE:C146([AddressRecords:125])
		CREATE RECORD:C68([AddressRecords:125])
		[AddressRecords:125]AddressLine1:6:=INV_t_AddressLine1
		[AddressRecords:125]AddressLine2:7:=INV_t_AddressLine2
		[AddressRecords:125]Country:11:=INV_t_Country
		[AddressRecords:125]County_State:9:=INV_t_County
		[AddressRecords:125]Postal_Code:10:=INV_t_PostalCode
		[AddressRecords:125]Town_City:8:=INV_t_Town
		If ([INVOICES:39]X_ID:49=0)
			[INVOICES:39]X_ID:49:=AA_GetNextID(->[INVOICES:39]X_ID:49)
		End if 
		[AddressRecords:125]X_OwnerRecordID:5:=[INVOICES:39]X_ID:49
		[AddressRecords:125]X_OwnerTableID:4:=Table:C252(->[INVOICES:39])
		[AddressRecords:125]AddressClassID:2:=$_l_AddressTypeClass
		[AddressRecords:125]AddressClass:3:=CO_at_AddressTypes{$_l_AddressTypeRow}
		DB_SaveRecord(->[AddressRecords:125])
		[INVOICES:39]x_DeliveryAddressID:48:=[AddressRecords:125]X_ID:1
		[INVOICES:39]Deliver_To:32:=[AddressRecords:125]FormattedAddress:12
		UNLOAD RECORD:C212([AddressRecords:125])
		READ ONLY:C145([AddressRecords:125])
	End if 
Else 
	If (INV_l_AdhocMod=1)
		[INVOICES:39]x_DeliveryAddressID:48:=0
		[INVOICES:39]Deliver_To:32:=""
	End if 
End if 
INV_l_AdhocMod:=0
ERR_MethodTrackerReturn("INV_SaveDeliveryAddress"; $_t_oldMethodName)