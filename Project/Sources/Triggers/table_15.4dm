If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 30/09/2013 19:03
	//Method Name: Trigger:USER
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	
	//End Project method Amendments
End if 
$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [USER]")

C_TEXT:C284($_t_oldMethodName)

$0:=0
$_l_event:=Trigger event:C369
Case of 
		
		
	: ($_l_event=On Saving New Record Event:K3:1)  //WT - audit for saving new record
		//testing a trigger change
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [USER]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer
			//  AUTO_AUDIT (->[USER];Field(->[USER]Organisation);Process_Name (Current process
			SET PROCESS VARIABLE:C370(-1; <>SYS_bo_PWActive; [USER:15]SinglePWsystem:235)
			$_l_Process:=New process:C317("PW_CheckUsers"; 128000; "Validate Password list")
		End if 
		
	: ($_l_event=On Saving Existing Record Event:K3:2)  //WT - audit for saving old/existing record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [USER]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer
			SET PROCESS VARIABLE:C370(-1; <>SYS_bo_PWActive; [USER:15]SinglePWsystem:235)
			$_l_Process:=New process:C317("PW_CheckUsers"; 128000; "Validate Password list")
		End if 
	: ($_l_event=On Deleting Record Event:K3:3)  //WT - audit for deleting record
		
End case 


ERR_MethodTrackerReturn("TRIGGER [USER]"; $_t_oldMethodName)
