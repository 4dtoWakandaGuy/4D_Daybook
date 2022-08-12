If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 30/09/2013 19:03
	//Method Name: Trigger:CONTACTS_RECORD_ANALYSIS
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	
	//End Project method Amendments
End if 
$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [CONTACTS_RECORD_ANALYSIS]")

$_l_event:=Trigger event:C369
Case of 
	: ($_l_event=On Saving New Record Event:K3:1)
		If ([CONTACTS_RECORD_ANALYSIS:144]ID:2=0)
			[CONTACTS_RECORD_ANALYSIS:144]ID:2:=AA_GetNextID(->[CONTACTS_RECORD_ANALYSIS:144]ID:2)
		End if 
		
	: ($_l_event=On Saving Existing Record Event:K3:2)
		If ([CONTACTS_RECORD_ANALYSIS:144]ID:2=0)
			[CONTACTS_RECORD_ANALYSIS:144]ID:2:=AA_GetNextID(->[CONTACTS_RECORD_ANALYSIS:144]ID:2)
		End if 
End case 

ERR_MethodTrackerReturn("TRIGGER [CONTACTS_RECORD_ANALYSIS]"; $_t_oldMethodName)
