If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 30/09/2013 19:03
	//Method Name: Trigger:CONTRACTS_CONTACTS
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	
	//End Project method Amendments
End if 
$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [CONTRACTS_CONTACTS]")

$_l_event:=Trigger event:C369
Case of 
	: ($_l_event=On Saving New Record Event:K3:1)
		If ([CONTRACTS_CONTACTS:151]ID:2=0)
			[CONTRACTS_CONTACTS:151]ID:2:=AA_GetNextID(->[CONTRACTS_CONTACTS:151]ID:2)
		End if 
		
	: ($_l_event=On Saving Existing Record Event:K3:2)
		If ([CONTRACTS_CONTACTS:151]ID:2=0)
			[CONTRACTS_CONTACTS:151]ID:2:=AA_GetNextID(->[CONTRACTS_CONTACTS:151]ID:2)
		End if 
End case 

ERR_MethodTrackerReturn("TRIGGER [CONTRACTS_CONTACTS]"; $_t_oldMethodName)
