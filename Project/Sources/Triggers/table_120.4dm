If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 30/09/2013 19:03
	//Method Name: Trigger:EW_ExportTables
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	
	//End Project method Amendments
End if 
$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [EW_ExportTables]")

C_TEXT:C284($_t_oldMethodName)
$0:=0

$_l_event:=Trigger event:C369


Case of 
	: ($_l_event=On Saving New Record Event:K3:1)
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [EW_ExportTables]"; $_l_event)
		If (DB_TableTriggerEnabled)
			
			NaNFixer  // 12/03/04 PB
		End if 
	: ($_l_event=On Saving Existing Record Event:K3:2)
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [EW_ExportTables]"; $_l_event)
		If (DB_TableTriggerEnabled)
			
			NaNFixer  // 12/03/04 PB
		End if 
	: ($_l_event=On Deleting Record Event:K3:3)
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [EW_ExportTables]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer  // 12/03/04 PB
			QUERY:C277([EW_StepActions:119]; [EW_StepActions:119]StepTableRecordNumber:1=[EW_ExportTables:120]RecordNumber:2)
			DELETE SELECTION:C66([EW_StepActions:119])
		End if 
End case 
ERR_MethodTrackerReturn("TRIGGER [EW_ExportTables]"; $_t_oldMethodName)
