If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 30/09/2013 19:03
	//Method Name: Trigger:PURCHASE_ORDERS
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	
	//End Project method Amendments
End if 
$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [PURCHASE_ORDERS]")

C_TEXT:C284($_t_oldMethodName)

$0:=0
$_l_event:=Trigger event:C369
Case of 
		
		
	: ($_l_event=On Saving New Record Event:K3:1)  //WT - audit for saving new record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [PURCHASE_ORDERS]"; $_l_event)
		If (DB_TableTriggerEnabled)
			If ([PURCHASE_ORDERS:57]x_ID:21=0)
				If ([PURCHASE_ORDERS:57]Purchase_Order_Number:2#"")
					[PURCHASE_ORDERS:57]x_ID:21:=AA_GetNextID(->[PURCHASE_ORDERS:57]x_ID:21)
				End if 
			End if 
			NaNFixer
			db_CheckMyUnique(->[PURCHASE_ORDERS:57]Purchase_Order_Number:2; 0)
			AUTO_AUDIT(->[PURCHASE_ORDERS:57]; Field:C253(->[PURCHASE_ORDERS:57]Purchase_Order_Number:2); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
		End if 
	: ($_l_event=On Saving Existing Record Event:K3:2)  //WT - audit for saving old/existing record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [PURCHASE_ORDERS]"; $_l_event)
		If (DB_TableTriggerEnabled)
			If ([PURCHASE_ORDERS:57]x_ID:21=0)
				If ([PURCHASE_ORDERS:57]Purchase_Order_Number:2#"")
					[PURCHASE_ORDERS:57]x_ID:21:=AA_GetNextID(->[PURCHASE_ORDERS:57]x_ID:21)
				End if 
			End if 
			NaNFixer
			db_CheckMyUnique(->[PURCHASE_ORDERS:57]Purchase_Order_Number:2; 1)
			AUTO_AUDIT(->[PURCHASE_ORDERS:57]; Field:C253(->[PURCHASE_ORDERS:57]Purchase_Order_Number:2); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
		End if 
	: ($_l_event=On Deleting Record Event:K3:3)  //WT - audit for deleting record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [PURCHASE_ORDERS]"; $_l_event)
		If (DB_TableTriggerEnabled)
			AUTO_AUDIT_DEL(->[PURCHASE_ORDERS:57]; Field:C253(->[PURCHASE_ORDERS:57]Purchase_Order_Number:2); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
		End if 
		
End case 
ERR_MethodTrackerReturn("TRIGGER [PURCHASE_ORDERS]"; $_t_oldMethodName)
