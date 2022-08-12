If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 30/09/2013 19:03
	//Method Name: Trigger:REC_JOURNALS_DATES
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	
	//End Project method Amendments
End if 
$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [REC_JOURNALS_DATES]")

$_l_event:=Trigger event:C369
Case of 
	: ($_l_event=On Saving New Record Event:K3:1)
		If ([REC_JOURNALS_DATES:160]ID:3=0)
			[REC_JOURNALS_DATES:160]ID:3:=AA_GetNextID(->[REC_JOURNALS_DATES:160]ID:3)
		End if 
		
	: ($_l_event=On Saving Existing Record Event:K3:2)
		If ([REC_JOURNALS_DATES:160]ID:3=0)
			[REC_JOURNALS_DATES:160]ID:3:=AA_GetNextID(->[REC_JOURNALS_DATES:160]ID:3)
		End if 
End case 

ERR_MethodTrackerReturn("TRIGGER [REC_JOURNALS_DATES]"; $_t_oldMethodName)
