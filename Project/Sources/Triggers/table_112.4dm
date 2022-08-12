If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 30/09/2013 19:03
	//Method Name: Trigger:x_ListUsage
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	
	//End Project method Amendments
End if 
$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [x_ListUsage]")

C_TEXT:C284($_t_oldMethodName)
$_l_event:=Trigger event:C369
$0:=0
Case of 
	: ($_l_event=On Saving New Record Event:K3:1)
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [x_ListUsage]"; $_l_event)
		If (DB_TableTriggerEnabled(->[x_ListUsage:112]))
			NaNFixer  // 12/03/04 PB
			C_POINTER:C301(SS_P_FIeldPtr)
			SS_P_Fieldptr:=->[x_ListUsage:112]x_ID:1
			If (SS_P_Fieldptr->=0)
				<>SYS_bo_inTrigger:=True:C214
				SS_P_Fieldptr->:=AA_GetNextID(SS_P_Fieldptr)
			End if 
		End if 
		
		
	: ($_l_event=On Saving Existing Record Event:K3:2)
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [x_ListUsage]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer  // 12/03/04 PB
		End if 
End case 
ERR_MethodTrackerReturn("TRIGGER [x_ListUsage]"; $_t_oldMethodName)
