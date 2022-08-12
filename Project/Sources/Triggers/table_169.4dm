If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 30/09/2013 19:03
	//Method Name: Trigger:PURCHASE_ORDERS_ITEMS
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	
	//End Project method Amendments
End if 
$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [PURCHASE_ORDERS_ITEMS]")

$_l_event:=Trigger event:C369
Case of 
	: ($_l_event=On Saving New Record Event:K3:1)
		If ([PURCHASE_ORDERS_ITEMS:169]ID:17=0)
			[PURCHASE_ORDERS_ITEMS:169]ID:17:=AA_GetNextID(->[PURCHASE_ORDERS_ITEMS:169]ID:17)
		End if 
		
	: ($_l_event=On Saving Existing Record Event:K3:2)
		If ([PURCHASE_ORDERS_ITEMS:169]ID:17=0)
			[PURCHASE_ORDERS_ITEMS:169]ID:17:=AA_GetNextID(->[PURCHASE_ORDERS_ITEMS:169]ID:17)
		End if 
End case 

ERR_MethodTrackerReturn("TRIGGER [PURCHASE_ORDERS_ITEMS]"; $_t_oldMethodName)
