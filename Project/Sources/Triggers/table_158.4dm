If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 30/09/2013 19:03
	//Method Name: Trigger:PURCHASE_INVOICE_ITEMS
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	
	//End Project method Amendments
End if 
$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [PURCHASE_INVOICE_ITEMS]")

$_l_event:=Trigger event:C369
Case of 
	: ($_l_event=On Saving New Record Event:K3:1)
		If ([PURCHASE_INVOICE_ITEMS:158]ID:16=0)
			[PURCHASE_INVOICE_ITEMS:158]ID:16:=AA_GetNextID(->[PURCHASE_INVOICE_ITEMS:158]ID:16)
		End if 
		
	: ($_l_event=On Saving Existing Record Event:K3:2)
		If ([PURCHASE_INVOICE_ITEMS:158]ID:16=0)
			[PURCHASE_INVOICE_ITEMS:158]ID:16:=AA_GetNextID(->[PURCHASE_INVOICE_ITEMS:158]ID:16)
		End if 
End case 

ERR_MethodTrackerReturn("TRIGGER [PURCHASE_INVOICE_ITEMS]"; $_t_oldMethodName)
