If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 30/09/2013 19:03
	//Method Name: Trigger:INVOICES_ALLOCATIONS
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	
	//End Project method Amendments
End if 
$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [INVOICES_ALLOCATIONS]")

$_l_event:=Trigger event:C369
Case of 
	: ($_l_event=On Saving New Record Event:K3:1)
		If ([INVOICES_ALLOCATIONS:162]ID:5=0)
			[INVOICES_ALLOCATIONS:162]ID:5:=AA_GetNextID(->[INVOICES_ALLOCATIONS:162]ID:5)
		End if 
		
	: ($_l_event=On Saving Existing Record Event:K3:2)
		If ([INVOICES_ALLOCATIONS:162]ID:5=0)
			[INVOICES_ALLOCATIONS:162]ID:5:=AA_GetNextID(->[INVOICES_ALLOCATIONS:162]ID:5)
		End if 
End case 

ERR_MethodTrackerReturn("TRIGGER [INVOICES_ALLOCATIONS]"; $_t_oldMethodName)
