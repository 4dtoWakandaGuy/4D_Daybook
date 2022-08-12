If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 30/09/2013 19:03
	//Method Name: Trigger:ADDRESS_FORMATS
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	
	//End Project method Amendments
End if 
$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [ADDRESS_FORMATS]")


$0:=0
$_l_event:=Trigger event:C369
C_TEXT:C284($_t_oldMethodName)
Case of 
		
		
	: ($_l_event=On Saving New Record Event:K3:1)  //WT - audit for saving new record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [ADDRESS_FORMATS]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer  // 12/03/04 PB
			AUTO_AUDIT(->[ADDRESS_FORMATS:74]; Field:C253(->[ADDRESS_FORMATS:74]Format_Code:1); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
		End if 
	: ($_l_event=On Saving Existing Record Event:K3:2)  //WT - audit for saving old/existing record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [ADDRESS_FORMATS]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer  // 12/03/04 PB
			AUTO_AUDIT(->[ADDRESS_FORMATS:74]; Field:C253(->[ADDRESS_FORMATS:74]Format_Code:1); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
		End if 
	: ($_l_event=On Deleting Record Event:K3:3)  //WT - audit for deleting record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [ADDRESS_FORMATS]"; $_l_event)
		If (DB_TableTriggerEnabled)
			AUTO_AUDIT_DEL(->[ADDRESS_FORMATS:74]; Field:C253(->[ADDRESS_FORMATS:74]Format_Code:1); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
		End if 
End case 
ERR_MethodTrackerReturn("TRIGGER [ADDRESS_FORMATS]"; $_t_oldMethodName)
