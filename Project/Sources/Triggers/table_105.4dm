If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 30/09/2013 19:03
	//Method Name: Trigger:USER_SETS
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	
	//End Project method Amendments
End if 
$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [USER_SETS]")

C_TEXT:C284($_t_oldMethodName)
$0:=0
$_l_event:=Trigger event:C369
Case of 
		
		
	: ($_l_event=On Saving New Record Event:K3:1)  //WT - audit for saving new record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [USER_SETS]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer  // 12/03/04 PB
			If ([USER_SETS:105]x_RecID:1=0)
				[USER_SETS:105]x_RecID:1:=AA_GetNextID(->[USER_SETS:105]x_RecID:1)
			End if 
			AUTO_AUDIT(->[USER_SETS:105]; Field:C253(->[USER_SETS:105]SET_ID:3); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
		End if 
		
	: ($_l_event=On Saving Existing Record Event:K3:2)  //WT - audit for saving old/existing record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [USER_SETS]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer  // 12/03/04 PB
			If ([USER_SETS:105]x_RecID:1=0)
				[USER_SETS:105]x_RecID:1:=AA_GetNextID(->[USER_SETS:105]x_RecID:1)
			End if 
			AUTO_AUDIT(->[USER_SETS:105]; Field:C253(->[USER_SETS:105]SET_ID:3); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
		End if 
	: ($_l_event=On Deleting Record Event:K3:3)  //WT - audit for deleting record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [USER_SETS]"; $_l_event)
		If (DB_TableTriggerEnabled)
			AUTO_AUDIT_DEL(->[USER_SETS:105]; Field:C253(->[USER_SETS:105]SET_ID:3); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
			
		End if 
End case 



ERR_MethodTrackerReturn("TRIGGER [USER_SETS]"; $_t_oldMethodName)
