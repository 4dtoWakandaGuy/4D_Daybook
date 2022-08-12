If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 30/09/2013 19:03
	//Method Name: Trigger:SERVICE_CALLS
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	
	//End Project method Amendments
End if 
$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [SERVICE_CALLS]")

C_TEXT:C284($_t_oldMethodName)

$0:=0
$_l_event:=Trigger event:C369
Case of 
		
		
	: ($_l_event=On Saving New Record Event:K3:1)  //WT - audit for saving new record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [SERVICE_CALLS]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer
			db_CheckMyUnique(->[SERVICE_CALLS:20]Call_Code:4; 0)
			AUTO_AUDIT(->[SERVICE_CALLS:20]; Field:C253(->[SERVICE_CALLS:20]Call_Code:4); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
			If ([SERVICE_CALLS:20]x_ID:27=0)
				If ([SERVICE_CALLS:20]Call_Code:4#"")
					[SERVICE_CALLS:20]x_ID:27:=AA_GetNextID(->[SERVICE_CALLS:20]x_ID:27)
				End if 
			End if 
		End if 
	: ($_l_event=On Saving Existing Record Event:K3:2)  //WT - audit for saving old/existing record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [SERVICE_CALLS]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer
			db_CheckMyUnique(->[SERVICE_CALLS:20]Call_Code:4; 1)
			AUTO_AUDIT(->[SERVICE_CALLS:20]; Field:C253(->[SERVICE_CALLS:20]Call_Code:4); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
			If ([SERVICE_CALLS:20]x_ID:27=0)
				If ([SERVICE_CALLS:20]Call_Code:4#"")
					[SERVICE_CALLS:20]x_ID:27:=AA_GetNextID(->[SERVICE_CALLS:20]x_ID:27)
				End if 
			End if 
			
		End if 
	: ($_l_event=On Deleting Record Event:K3:3)  //WT - audit for deleting record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [SERVICE_CALLS]"; $_l_event)
		If (DB_TableTriggerEnabled)
			AUTO_AUDIT_DEL(->[SERVICE_CALLS:20]; Field:C253(->[SERVICE_CALLS:20]Call_Code:4); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
		End if 
		
End case 


ERR_MethodTrackerReturn("TRIGGER [SERVICE_CALLS]"; $_t_oldMethodName)
