If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 30/09/2013 19:03
	//Method Name: Trigger:EMAIL_ATTACHMENTS
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	
	//End Project method Amendments
End if 
$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [EMAIL_ATTACHMENTS]")

C_TEXT:C284($_t_oldMethodName)

$0:=0
$_l_event:=Trigger event:C369
Case of 
		
		
	: ($_l_event=On Saving New Record Event:K3:1)
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [EMAIL_ATTACHMENTS]"; $_l_event)
		If (DB_TableTriggerEnabled)
			//the above is done so we can set it
			NaNFixer  // 12/03/04 PB
			If ([EMAIL_ATTACHMENTS:103]FileNo:5=0)
				[EMAIL_ATTACHMENTS:103]FileNo:5:=AA_GetNextID(->[EMAIL_ATTACHMENTS:103]FileNo:5)
			End if 
		End if 
	: ($_l_event=On Saving Existing Record Event:K3:2)
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [EMAIL_ATTACHMENTS]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer  // 12/03/04 PB
			If ([EMAIL_ATTACHMENTS:103]FileNo:5=0)
				[EMAIL_ATTACHMENTS:103]FileNo:5:=AA_GetNextID(->[EMAIL_ATTACHMENTS:103]FileNo:5)
			End if 
		End if 
	: ($_l_event=On Deleting Record Event:K3:3)
		
End case 
ERR_MethodTrackerReturn("TRIGGER [EMAIL_ATTACHMENTS]"; $_t_oldMethodName)
