If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 30/09/2013 19:03
	//Method Name: Trigger:SERVICE_CALLS_PRODUCTS
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	
	//End Project method Amendments
End if 
$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [SERVICE_CALLS_PRODUCTS]")

$_l_event:=Trigger event:C369
Case of 
	: ($_l_event=On Saving New Record Event:K3:1)
		If ([SERVICE_CALLS_PRODUCTS:152]ID:7=0)
			[SERVICE_CALLS_PRODUCTS:152]ID:7:=AA_GetNextID(->[SERVICE_CALLS_PRODUCTS:152]ID:7)
		End if 
		
	: ($_l_event=On Saving Existing Record Event:K3:2)
		If ([SERVICE_CALLS_PRODUCTS:152]ID:7=0)
			[SERVICE_CALLS_PRODUCTS:152]ID:7:=AA_GetNextID(->[SERVICE_CALLS_PRODUCTS:152]ID:7)
		End if 
End case 

ERR_MethodTrackerReturn("TRIGGER [SERVICE_CALLS_PRODUCTS]"; $_t_oldMethodName)
