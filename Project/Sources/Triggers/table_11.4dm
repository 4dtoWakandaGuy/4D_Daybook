If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 30/09/2013 19:03
	//Method Name: Trigger:PERSONNEL
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	
	//End Project method Amendments
End if 
$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [PERSONNEL]")

C_TEXT:C284($_t_oldMethodName)

$0:=0
$_l_event:=Trigger event:C369
<>SYS_bo_inTrigger:=True:C214
Case of 
		
		
	: ($_l_event=On Saving New Record Event:K3:1)  //WT - audit for saving new record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [PERSONNEL]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer
			
			db_CheckMyUnique(->[PERSONNEL:11]Initials:1; 0)
			db_CheckMyUnique(->[PERSONNEL:11]Name:2; 0)
			//  AUTO_AUDIT (->[USER];Field(->[USER]Organisation);Process_Name (Current process
			
			//$_l_Process:=New Process("PW_CheckUsers";128000;"Validate Password list")
			$_l_Process:=New process:C317("PW_ChangePW"; 128000; "Update Password list"; [PERSONNEL:11]Initials:1; [PERSONNEL:11]Person_Identity:13; [PERSONNEL:11]Personnel_ID:48)
			If ([PERSONNEL:11]Personnel_ID:48=0)
				[PERSONNEL:11]Personnel_ID:48:=AA_GetNextID(->[PERSONNEL:11]Personnel_ID:48)
			End if 
			
		End if 
		
	: ($_l_event=On Saving Existing Record Event:K3:2)  //WT - audit for saving old/existing record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [PERSONNEL]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer
			
			db_CheckMyUnique(->[PERSONNEL:11]Initials:1; 1)
			db_CheckMyUnique(->[PERSONNEL:11]Name:2; 1)
			
			If ([PERSONNEL:11]Personnel_ID:48=0)
				[PERSONNEL:11]Personnel_ID:48:=AA_GetNextID(->[PERSONNEL:11]Personnel_ID:48)
			End if 
			
			
			$_l_Process:=New process:C317("PW_ChangePW"; 128000; "Update Password list"; [PERSONNEL:11]Initials:1; [PERSONNEL:11]Person_Identity:13; [PERSONNEL:11]Personnel_ID:48)
			
		End if 
	: ($_l_event=On Deleting Record Event:K3:3)  //WT - audit for deleting record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [PERSONNEL]"; $_l_event)
		If (DB_TableTriggerEnabled)
			// AUTO_AUDIT_DEL (->[USER];Field(->[USER]Organisation);Process_Name (Current proc
		End if 
		
End case 



ERR_MethodTrackerReturn("TRIGGER [PERSONNEL]"; $_t_oldMethodName)
