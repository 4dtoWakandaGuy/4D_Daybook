If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 30/09/2013 19:03
	//Method Name: Trigger:PURCHASE_INVOICES
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	
	//End Project method Amendments
End if 
$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [PURCHASE_INVOICES]")

C_TEXT:C284($_t_oldMethodName)

$0:=0
$_l_event:=Trigger event:C369
Case of 
		
		
	: ($_l_event=On Saving New Record Event:K3:1)  //WT - audit for saving new record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [PURCHASE_INVOICES]"; $_l_event)
		If (DB_TableTriggerEnabled)
			If ([PURCHASE_INVOICES:37]x_ID:35=0)
				If ([PURCHASE_INVOICES:37]Purchase_Code:1#"")
					[PURCHASE_INVOICES:37]x_ID:35:=AA_GetNextID(->[PURCHASE_INVOICES:37]x_ID:35)
				End if 
			End if 
			NaNFixer
			db_CheckMyUnique(->[PURCHASE_INVOICES:37]Purchase_Code:1; 0)
			If ([PURCHASE_INVOICES:37]Total_Invoiced:7#0)
				[PURCHASE_INVOICES:37]Total_Due:9:=Gen_Round(([PURCHASE_INVOICES:37]Total_Invoiced:7-[PURCHASE_INVOICES:37]Total_Paid:8); 2; 2)
			Else 
				[PURCHASE_INVOICES:37]Total_Due:9:=0
			End if 
			
			AUTO_AUDIT(->[PURCHASE_INVOICES:37]; Field:C253(->[PURCHASE_INVOICES:37]Purchase_Code:1); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
		End if 
	: ($_l_event=On Saving Existing Record Event:K3:2)  //WT - audit for saving old/existing record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [PURCHASE_INVOICES]"; $_l_event)
		If (DB_TableTriggerEnabled)
			If ([PURCHASE_INVOICES:37]x_ID:35=0)
				If ([PURCHASE_INVOICES:37]Purchase_Code:1#"")
					[PURCHASE_INVOICES:37]x_ID:35:=AA_GetNextID(->[PURCHASE_INVOICES:37]x_ID:35)
				End if 
			End if 
			
			NaNFixer
			
			db_CheckMyUnique(->[PURCHASE_INVOICES:37]Purchase_Code:1; 1)
			AUTO_AUDIT(->[PURCHASE_INVOICES:37]; Field:C253(->[PURCHASE_INVOICES:37]Purchase_Code:1); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
		End if 
	: ($_l_event=On Deleting Record Event:K3:3)  //WT - audit for deleting record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [PURCHASE_INVOICES]"; $_l_event)
		If (DB_TableTriggerEnabled)
			AUTO_AUDIT_DEL(->[PURCHASE_INVOICES:37]; Field:C253(->[PURCHASE_INVOICES:37]Purchase_Code:1); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
		End if 
		
End case 
ERR_MethodTrackerReturn("TRIGGER [PURCHASE_INVOICES]"; $_t_oldMethodName)
