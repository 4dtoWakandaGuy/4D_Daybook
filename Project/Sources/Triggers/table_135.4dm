If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 23/12/2013 11:40
	//Method Name: Trigger on [XReportsExecutor]
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	
	//End Project method Amendments
End if 

Case of 
	: ($_l_event=On Saving New Record Event:K3:1)
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [XReportsExecutor]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer  // 12/03/04 PB
			
			If ([XReportsExecutor:135]x_ID:1=0)
				[XReportsExecutor:135]x_ID:1:=AA_GetNextID(->[XReportsExecutor:135]x_ID:1)
			End if 
			
		End if 
	: ($_l_event=On Saving Existing Record Event:K3:2)
		NaNFixer  // 12/03/04 PB
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [XReportsExecutor]"; $_l_event)
		If (DB_TableTriggerEnabled)
			If ([XReportsExecutor:135]x_ID:1=0)
				[XReportsExecutor:135]x_ID:1:=AA_GetNextID(->[XReportsExecutor:135]x_ID:1)
			End if 
		End if 
End case 

ERR_MethodTrackerReturn("TRIGGER  [XReportsExecutor]"; $_t_oldMethodName)