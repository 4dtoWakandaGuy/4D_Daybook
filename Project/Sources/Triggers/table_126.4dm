If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 30/09/2013 19:03
	//Method Name: Trigger:XInvoiceAllocation
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	
	//End Project method Amendments
End if 
$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [XInvoiceAllocation]")

C_TEXT:C284($_t_oldMethodName)
$_l_event:=Trigger event:C369
$0:=0
Case of 
	: ($_l_event=On Saving New Record Event:K3:1)
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [XInvoiceAllocation]"; Trigger event:C369)
		If (DB_TableTriggerEnabled)
			NaNFixer  // 12/03/04 PB
			If ([XInvoiceAllocation:126]x_ID:1=0)
				[XInvoiceAllocation:126]x_ID:1:=AA_GetNextID(->[XInvoiceAllocation:126]x_ID:1)
			End if 
		End if 
		If ([XInvoiceAllocation:126]xAllocationDate:6=!00-00-00!) | ([XInvoiceAllocation:126]XPeriodCode:9="")
			ProcessServices_CreateRecord(->[INVOICES:39]; ->[XInvoiceAllocation:126]x_ID:1; "CheckAllocationDate")
		End if 
		
	: ($_l_event=On Saving Existing Record Event:K3:2)
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [XInvoiceAllocation]"; Trigger event:C369)
		If (DB_TableTriggerEnabled)
			NaNFixer  // 12/03/04 PB
		End if 
		If ([XInvoiceAllocation:126]xAllocationDate:6=!00-00-00!) | ([XInvoiceAllocation:126]XPeriodCode:9="")
			ProcessServices_CreateRecord(->[INVOICES:39]; ->[XInvoiceAllocation:126]x_ID:1; "CheckAllocationDate")
		End if 
End case 
ERR_MethodTrackerReturn("TRIGGER [XInvoiceAllocation]"; $_t_oldMethodName)
