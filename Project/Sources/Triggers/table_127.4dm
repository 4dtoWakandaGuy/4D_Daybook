If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 30/09/2013 19:03
	//Method Name: Trigger:XOrder_revisions
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	
	//End Project method Amendments
End if 
$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [XOrder_revisions]")

C_TEXT:C284($_t_oldMethodName)
$_l_event:=Trigger event:C369
$0:=0

Case of 
	: ($_l_event=On Saving New Record Event:K3:1)
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [XOrder_revisions]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer  // 12/03/04 PB
			If ([XOrder_revisions:127]X_ID:1=0)
				[XOrder_revisions:127]X_ID:1:=AA_GetNextID(->[XOrder_revisions:127]X_ID:1)
			End if 
		End if 
		
End case 
ERR_MethodTrackerReturn("TRIGGER [XOrder_revisions]"; $_t_oldMethodName)
