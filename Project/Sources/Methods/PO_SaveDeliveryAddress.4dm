//%attributes = {}
If (False:C215)
	//Project Method Name:      PO_SaveDeliveryAddress
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
	C_LONGINT:C283($_l_AddedItemID; $_l_AddressTypeID; $_l_AddressTypeRow; $_l_ListID; PO_l_AdhocMod)
	C_TEXT:C284($_t_oldMethodName; PO_t_AddressLine1; PO_t_AddressLine2; PO_t_Country; PO_t_County; PO_t_PostalCode; PO_t_Town)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PO_SaveDeliveryAddress")

If (PO_t_AddressLine1#"") | (PO_t_AddressLine2#"") | (PO_t_Town#"") | (PO_t_County#"") | (PO_t_PostalCode#"") | (PO_t_Country#"")
	//There is an address entered
	If ([PURCHASE_ORDERS:57]x_DeliveryAddressID:20>0)
		//there is a saved address
		//the address is modified
		READ WRITE:C146([AddressRecords:125])
		QUERY:C277([AddressRecords:125]; [AddressRecords:125]X_ID:1=[PURCHASE_ORDERS:57]x_DeliveryAddressID:20)
		
		[AddressRecords:125]AddressLine1:6:=PO_t_AddressLine1
		[AddressRecords:125]AddressLine2:7:=PO_t_AddressLine2
		[AddressRecords:125]Country:11:=PO_t_Country
		[AddressRecords:125]County_State:9:=PO_t_County
		[AddressRecords:125]Postal_Code:10:=PO_t_PostalCode
		[AddressRecords:125]Town_City:8:=PO_t_Town
		DB_SaveRecord(->[AddressRecords:125])
		READ ONLY:C145([AddressRecords:125])
		
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
		
		$_l_AddressTypeID:=CO_al_AddressTypes{$_l_AddressTypeRow}
		//no saved address
		READ WRITE:C146([AddressRecords:125])
		CREATE RECORD:C68([AddressRecords:125])
		[AddressRecords:125]AddressLine1:6:=PO_t_AddressLine1
		[AddressRecords:125]AddressLine2:7:=PO_t_AddressLine2
		[AddressRecords:125]Country:11:=PO_t_Country
		[AddressRecords:125]County_State:9:=PO_t_County
		[AddressRecords:125]Postal_Code:10:=PO_t_PostalCode
		[AddressRecords:125]Town_City:8:=PO_t_Town
		If ([PURCHASE_ORDERS:57]x_ID:21=0)
			[PURCHASE_ORDERS:57]x_ID:21:=AA_GetNextID(->[PURCHASE_ORDERS:57]x_ID:21)
		End if 
		[AddressRecords:125]X_OwnerRecordID:5:=[PURCHASE_ORDERS:57]x_ID:21
		[AddressRecords:125]X_OwnerTableID:4:=Table:C252(->[PURCHASE_ORDERS:57])
		[AddressRecords:125]AddressClassID:2:=$_l_AddressTypeID
		[AddressRecords:125]AddressClass:3:=CO_at_AddressTypes{$_l_AddressTypeRow}
		DB_SaveRecord(->[AddressRecords:125])
		[PURCHASE_ORDERS:57]x_DeliveryAddressID:20:=[AddressRecords:125]X_ID:1
		
		UNLOAD RECORD:C212([AddressRecords:125])
		READ ONLY:C145([AddressRecords:125])
	End if 
Else 
	If (PO_l_AdhocMod=1)
		[ORDERS:24]X_DeliveryAddressID:59:=0
		[ORDERS:24]Deliver_To:31:=""
	End if 
End if 
ERR_MethodTrackerReturn("PO_SaveDeliveryAddress"; $_t_oldMethodName)
