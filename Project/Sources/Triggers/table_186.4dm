If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 30/09/2013 19:03
	//Method Name: Trigger:xServiceSalesItemLink
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	
	//End Project method Amendments
End if 
$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [xServiceSalesItemLink]")

$_l_event:=Trigger event:C369
$0:=0
Case of 
	: ($_l_event=On Saving New Record Event:K3:1)
		If (DB_TableTriggerEnabled)
			If ([xServiceSalesItemLink:186]x_ID:1=0)
				
				[xServiceSalesItemLink:186]x_ID:1:=AA_GetNextID(->[xServiceSalesItemLink:186]x_ID:1)
				
			End if 
		End if 
	: ($_l_event=On Saving Existing Record Event:K3:2)
		If (DB_TableTriggerEnabled)
			If ([xServiceSalesItemLink:186]x_ID:1=0)
				
				[xServiceSalesItemLink:186]x_ID:1:=AA_GetNextID(->[xServiceSalesItemLink:186]x_ID:1)
				
			End if 
		End if 
End case 
ERR_MethodTrackerReturn("TRIGGER [xServiceSalesItemLink]"; $_t_oldMethodName)
