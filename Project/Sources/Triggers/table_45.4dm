If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 30/09/2013 19:03
	//Method Name: Trigger:STAGES
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	
	//End Project method Amendments
End if 
$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [STAGES]")

C_TEXT:C284($_t_oldMethodName)
$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [STAGES]"; Trigger event:C369)
$0:=0
$_l_event:=Trigger event:C369
Case of 
		
		
	: ($_l_event=On Saving New Record Event:K3:1)
		If (DB_TableTriggerEnabled)
			NaNFixer  // 12/03/04 PB
			db_CheckMyUnique(->[STAGES:45]Stage_Code:1; 0)
			AUTO_AUDIT(->[STAGES:45]; Field:C253(->[STAGES:45]Stage_Code:1); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
		End if 
	: ($_l_event=On Saving Existing Record Event:K3:2)
		If (DB_TableTriggerEnabled)
			NaNFixer  // 12/03/04 PB
			db_CheckMyUnique(->[STAGES:45]Stage_Code:1; 1)
			AUTO_AUDIT(->[STAGES:45]; Field:C253(->[STAGES:45]Stage_Code:1); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
		End if 
	: ($_l_event=On Deleting Record Event:K3:3)  //WT - audit for deleting record
		If (DB_TableTriggerEnabled)
			AUTO_AUDIT_DEL(->[STAGES:45]; Field:C253(->[STAGES:45]Stage_Code:1); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
		End if 
		
End case 
ERR_MethodTrackerReturn("TRIGGER [STAGES]"; $_t_oldMethodName)
