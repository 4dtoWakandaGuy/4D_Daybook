If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 30/09/2013 19:03
	//Method Name: Trigger:PERSONNEL_GROUPS
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	
	//End Project method Amendments
End if 
$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [PERSONNEL_GROUPS]")

C_TEXT:C284($_t_oldMethodName)

$0:=0
$_l_event:=Trigger event:C369
<>SYS_bo_inTrigger:=True:C214
Case of 
		
		
	: ($_l_event=On Saving New Record Event:K3:1)  //WT - audit for saving new record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [PERSONNEL_GROUPS]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer
			db_CheckMyUnique(->[PERSONNEL_GROUPS:92]Group_Code:1; 0)
			If ([PERSONNEL_GROUPS:92]x_ID:12=0)
				<>SYS_bo_inTrigger:=True:C214
				[PERSONNEL_GROUPS:92]x_ID:12:=AA_GetNextID(->[PERSONNEL_GROUPS:92]x_ID:12)
			End if 
			AUTO_AUDIT(->[PERSONNEL_GROUPS:92]; Field:C253(->[PERSONNEL_GROUPS:92]Group_Code:1); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
		End if 
	: ($_l_event=On Saving Existing Record Event:K3:2)  //WT - audit for saving old/existing record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [PERSONNEL_GROUPS]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer
			db_CheckMyUnique(->[PERSONNEL_GROUPS:92]Group_Code:1; 1)
			
			If ([PERSONNEL_GROUPS:92]x_ID:12=0)
				<>SYS_bo_inTrigger:=True:C214
				[PERSONNEL_GROUPS:92]x_ID:12:=AA_GetNextID(->[PERSONNEL_GROUPS:92]x_ID:12)
			End if 
			
			
			AUTO_AUDIT(->[PERSONNEL_GROUPS:92]; Field:C253(->[PERSONNEL_GROUPS:92]Group_Code:1); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
		End if 
	: ($_l_event=On Deleting Record Event:K3:3)  //WT - audit for deleting record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [PERSONNEL_GROUPS]"; $_l_event)
		If (DB_TableTriggerEnabled)
			AUTO_AUDIT_DEL(->[PERSONNEL_GROUPS:92]; Field:C253(->[PERSONNEL_GROUPS:92]Group_Code:1); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
		End if 
		
End case 
ERR_MethodTrackerReturn("TRIGGER [PERSONNEL_GROUPS]"; $_t_oldMethodName)
