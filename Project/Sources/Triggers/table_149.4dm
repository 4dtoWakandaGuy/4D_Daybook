If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 30/09/2013 19:03
	//Method Name: Trigger:PERSONNEL_DIARY_ACCESS
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	
	//End Project method Amendments
End if 
$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [PERSONNEL_DIARY_ACCESS]")

$_l_event:=Trigger event:C369
Case of 
	: ($_l_event=On Saving New Record Event:K3:1)
		If ([PERSONNEL_DIARY_ACCESS:149]ID:3=0)
			[PERSONNEL_DIARY_ACCESS:149]ID:3:=AA_GetNextID(->[PERSONNEL_DIARY_ACCESS:149]ID:3)
		End if 
		
	: ($_l_event=On Saving Existing Record Event:K3:2)
		If ([PERSONNEL_DIARY_ACCESS:149]ID:3=0)
			[PERSONNEL_DIARY_ACCESS:149]ID:3:=AA_GetNextID(->[PERSONNEL_DIARY_ACCESS:149]ID:3)
		End if 
End case 

ERR_MethodTrackerReturn("TRIGGER [PERSONNEL_DIARY_ACCESS]"; $_t_oldMethodName)
