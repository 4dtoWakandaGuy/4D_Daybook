If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 30/09/2013 19:03
	//Method Name: Trigger:TRANSACTION_BATCH_ITEMS
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	
	//End Project method Amendments
End if 
$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [TRANSACTION_BATCH_ITEMS]")

$_l_event:=Trigger event:C369
Case of 
	: ($_l_event=On Saving New Record Event:K3:1)
		If ([TRANSACTION_BATCH_ITEMS:155]ID:30=0)
			[TRANSACTION_BATCH_ITEMS:155]ID:30:=AA_GetNextID(->[TRANSACTION_BATCH_ITEMS:155]ID:30)
		End if 
		
	: ($_l_event=On Saving Existing Record Event:K3:2)
		If ([TRANSACTION_BATCH_ITEMS:155]ID:30=0)
			[TRANSACTION_BATCH_ITEMS:155]ID:30:=AA_GetNextID(->[TRANSACTION_BATCH_ITEMS:155]ID:30)
		End if 
End case 

ERR_MethodTrackerReturn("TRIGGER [TRANSACTION_BATCH_ITEMS]"; $_t_oldMethodName)
