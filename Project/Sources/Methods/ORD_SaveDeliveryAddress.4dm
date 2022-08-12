//%attributes = {}
If (False:C215)
	//Project Method Name:      ORD_SaveDeliveryAddress
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
	C_LONGINT:C283($_l_AddedItemID; $_l_AddressTypeID; $_l_AddressTypeRow; $_l_ListID; ORD_l_AdhocMod)
	C_TEXT:C284($_t_oldMethodName; ORD_t_AddressLine1; ORD_t_AddressLine2; ORD_t_Country; ORD_t_County; ORD_t_PostalCode; ORD_t_Town)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ORD_SaveDeliveryAddress")

If (ORD_t_AddressLine1#"") | (ORD_t_AddressLine2#"") | (ORD_t_Town#"") | (ORD_t_County#"") | (ORD_t_PostalCode#"") | (ORD_t_Country#"")
	
	If ([ORDERS:24]X_DeliveryAddressID:59>0)
		//there is a saved address
		//the address is modified
		READ WRITE:C146([AddressRecords:125])
		QUERY:C277([AddressRecords:125]; [AddressRecords:125]X_ID:1=[ORDERS:24]X_DeliveryAddressID:59)
		
		[AddressRecords:125]AddressLine1:6:=ORD_t_AddressLine1
		[AddressRecords:125]AddressLine2:7:=ORD_t_AddressLine2
		[AddressRecords:125]Country:11:=ORD_t_Country
		[AddressRecords:125]County_State:9:=ORD_t_County
		[AddressRecords:125]Postal_Code:10:=ORD_t_PostalCode
		[AddressRecords:125]Town_City:8:=ORD_t_Town
		DB_SaveRecord(->[AddressRecords:125])
		READ ONLY:C145([AddressRecords:125])
		[ORDERS:24]Deliver_To:31:=[AddressRecords:125]FormattedAddress:12
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
		[AddressRecords:125]AddressLine1:6:=ORD_t_AddressLine1
		[AddressRecords:125]AddressLine2:7:=ORD_t_AddressLine2
		[AddressRecords:125]Country:11:=ORD_t_Country
		[AddressRecords:125]County_State:9:=ORD_t_County
		[AddressRecords:125]Postal_Code:10:=ORD_t_PostalCode
		[AddressRecords:125]Town_City:8:=ORD_t_Town
		If ([ORDERS:24]x_ID:58=0)
			[ORDERS:24]x_ID:58:=AA_GetNextID(->[ORDERS:24]x_ID:58)
		End if 
		[AddressRecords:125]X_OwnerRecordID:5:=[ORDERS:24]x_ID:58
		[AddressRecords:125]X_OwnerTableID:4:=Table:C252(->[ORDERS:24])
		[AddressRecords:125]AddressClassID:2:=$_l_AddressTypeID
		[AddressRecords:125]AddressClass:3:=CO_at_AddressTypes{$_l_AddressTypeRow}
		DB_SaveRecord(->[AddressRecords:125])
		[ORDERS:24]X_DeliveryAddressID:59:=[AddressRecords:125]X_ID:1
		[ORDERS:24]Deliver_To:31:=[AddressRecords:125]FormattedAddress:12
		UNLOAD RECORD:C212([AddressRecords:125])
		READ ONLY:C145([AddressRecords:125])
	End if 
Else 
	If (ORD_l_AdhocMod=1)
		[ORDERS:24]X_DeliveryAddressID:59:=0
		[ORDERS:24]Deliver_To:31:=""
	End if 
End if 
ORD_l_AdhocMod:=0
ERR_MethodTrackerReturn("ORD_SaveDeliveryAddress"; $_t_oldMethodName)
