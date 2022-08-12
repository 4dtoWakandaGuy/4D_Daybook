If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 30/09/2013 19:03
	//Method Name: Trigger:x_QUERY_PARAMETERS
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	
	//End Project method Amendments
End if 
$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [x_QUERY_PARAMETERS]")

C_TEXT:C284($_t_oldMethodName)
$_l_event:=Trigger event:C369
$0:=0
<>SYS_bo_inTrigger:=True:C214

Case of 
	: ($_l_event=On Saving New Record Event:K3:1)
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [x_QUERY_PARAMETERS]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer  // 12/03/04 PB
			
			If ([x_QUERY_PARAMETERS:134]X_ID:1=0)
				[x_QUERY_PARAMETERS:134]X_ID:1:=AA_GetNextID(->[x_QUERY_PARAMETERS:134]X_ID:1)
			End if 
			
		End if 
	: ($_l_event=On Saving Existing Record Event:K3:2)
		NaNFixer  // 12/03/04 PB
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [x_QUERY_PARAMETERS]"; $_l_event)
		If (DB_TableTriggerEnabled)
			If ([x_QUERY_PARAMETERS:134]X_ID:1=0)
				[x_QUERY_PARAMETERS:134]X_ID:1:=AA_GetNextID(->[x_QUERY_PARAMETERS:134]X_ID:1)
			End if 
		End if 
End case 
ERR_MethodTrackerReturn("TRIGGER [x_QUERY_PARAMETERS]"; $_t_oldMethodName)
