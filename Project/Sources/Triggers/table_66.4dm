If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 30/09/2013 19:03
	//Method Name: Trigger:DELETIONS
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	
	//End Project method Amendments
End if 
$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [DELETIONS]")

C_TEXT:C284($_t_oldMethodName)

$0:=0
$_l_event:=Trigger event:C369
<>SYS_bo_inTrigger:=True:C214
Case of 
		
		
	: ($_l_event=On Saving New Record Event:K3:1)  //WT - audit for saving new record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [DELETIONS]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer  // 12/03/04 PB
			If ([DELETIONS:66]xRec_ID:3=0)
				If ([DELETIONS:66]Text:1#"")
					[DELETIONS:66]xRec_ID:3:=AA_GetNextID(->[DELETIONS:66]xRec_ID:3)
				End if 
				
			End if 
			AUTO_AUDIT(->[DELETIONS:66]; Field:C253(->[DELETIONS:66]xRec_ID:3); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
		End if 
	: ($_l_event=On Saving Existing Record Event:K3:2)  //WT - audit for saving old/existing record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [DELETIONS]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer  // 12/03/04 PB
			If ([DELETIONS:66]xRec_ID:3=0)
				[DELETIONS:66]xRec_ID:3:=AA_GetNextID(->[DELETIONS:66]xRec_ID:3)
			End if 
			AUTO_AUDIT(->[DELETIONS:66]; Field:C253(->[DELETIONS:66]xRec_ID:3); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
		End if 
	: ($_l_event=On Deleting Record Event:K3:3)  //WT - audit for deleting record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [DELETIONS]"; $_l_event)
		If (DB_TableTriggerEnabled)
			If ([DELETIONS:66]xRec_ID:3=0)
				[DELETIONS:66]xRec_ID:3:=AA_GetNextID(->[DELETIONS:66]xRec_ID:3)
			End if 
			AUTO_AUDIT_DEL(->[DELETIONS:66]; Field:C253(->[DELETIONS:66]xRec_ID:3); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
		End if 
		
End case 
<>SYS_bo_inTrigger:=False:C215
ERR_MethodTrackerReturn("TRIGGER [DELETIONS]"; $_t_oldMethodName)
