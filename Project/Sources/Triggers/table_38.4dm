If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 30/09/2013 19:03
	//Method Name: Trigger:RECURRING_JOURNALS
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	
	//End Project method Amendments
End if 
$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [RECURRING_JOURNALS]")

C_TEXT:C284($_t_oldMethodName)

$0:=0
$_l_event:=Trigger event:C369
<>SYS_bo_inTrigger:=True:C214
Case of 
		
		
	: ($_l_event=On Saving New Record Event:K3:1)  //WT - audit for saving new record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [RECURRING_JOURNALS]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer
			If ([RECURRING_JOURNALS:38]x_ID:15=0)
				[RECURRING_JOURNALS:38]x_ID:15:=AA_GetNextID(->[RECURRING_JOURNALS:38]x_ID:15)
			End if 
			AUTO_AUDIT(->[RECURRING_JOURNALS:38]; Field:C253(->[RECURRING_JOURNALS:38]x_ID:15); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
		End if 
	: ($_l_event=On Saving Existing Record Event:K3:2)  //WT - audit for saving old/existing record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [RECURRING_JOURNALS]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer
			If ([RECURRING_JOURNALS:38]x_ID:15=0)
				[RECURRING_JOURNALS:38]x_ID:15:=AA_GetNextID(->[RECURRING_JOURNALS:38]x_ID:15)
			End if 
			AUTO_AUDIT(->[RECURRING_JOURNALS:38]; Field:C253(->[RECURRING_JOURNALS:38]x_ID:15); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
		End if 
	: ($_l_event=On Deleting Record Event:K3:3)  //WT - audit for deleting record
		If ([RECURRING_JOURNALS:38]x_ID:15=0)
			[RECURRING_JOURNALS:38]x_ID:15:=AA_GetNextID(->[RECURRING_JOURNALS:38]x_ID:15)
		End if 
		AUTO_AUDIT_DEL(->[RECURRING_JOURNALS:38]; Field:C253(->[RECURRING_JOURNALS:38]x_ID:15); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
		
End case 
<>SYS_bo_inTrigger:=False:C215


ERR_MethodTrackerReturn("TRIGGER [RECURRING_JOURNALS]"; $_t_oldMethodName)
