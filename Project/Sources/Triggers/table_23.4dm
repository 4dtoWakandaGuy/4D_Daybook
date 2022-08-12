If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 30/09/2013 19:03
	//Method Name: Trigger:SOLUTIONS
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	
	//End Project method Amendments
End if 
$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [SOLUTIONS]")

C_TEXT:C284($_t_oldMethodName)

$0:=0
$_l_event:=Trigger event:C369
Case of 
		
		
	: ($_l_event=On Saving New Record Event:K3:1)  //WT - audit for saving new record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [SOLUTIONS]"; $_l_event)
		If (DB_TableTriggerEnabled)
			db_CheckMyUnique(->[SOLUTIONS:23]Solution_Code:1; 0)
			
			AUTO_AUDIT(->[SOLUTIONS:23]; Field:C253(->[SOLUTIONS:23]Solution_Code:1); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
		End if 
	: ($_l_event=On Saving Existing Record Event:K3:2)  //WT - audit for saving old/existing record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [SOLUTIONS]"; $_l_event)
		If (DB_TableTriggerEnabled)
			db_CheckMyUnique(->[SOLUTIONS:23]Solution_Code:1; 1)
			AUTO_AUDIT(->[SOLUTIONS:23]; Field:C253(->[SOLUTIONS:23]Solution_Code:1); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
		End if 
	: ($_l_event=On Deleting Record Event:K3:3)  //WT - audit for deleting record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [SOLUTIONS]"; $_l_event)
		If (DB_TableTriggerEnabled(->[SOLUTIONS:23]))
			
			AUTO_AUDIT_DEL(->[SOLUTIONS:23]; Field:C253(->[SOLUTIONS:23]Solution_Code:1); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
		End if 
		
End case 
ERR_MethodTrackerReturn("TRIGGER [SOLUTIONS]"; $_t_oldMethodName)
