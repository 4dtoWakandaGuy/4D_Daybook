If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 30/09/2013 19:03
	//Method Name: Trigger:TRANS_MULTI
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	
	//End Project method Amendments
End if 
$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [TRANS_MULTI]")

C_TEXT:C284($_t_oldMethodName)
$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [TRANS_MULTI]"; Trigger event:C369)
$0:=0



$_l_event:=Trigger event:C369
Case of 
	: ($_l_event=On Saving New Record Event:K3:1)
		If (DB_TableTriggerEnabled)
			NaNFixer  // 12/03/04 PB
			If ([TRANS_MULTI:128]x_ID:1=0)
				[TRANS_MULTI:128]x_ID:1:=AA_GetNextID(->[TRANS_MULTI:128]x_ID:1)
			End if 
		End if 
	: ($_l_event=On Saving Existing Record Event:K3:2)
		If (DB_TableTriggerEnabled)
			NaNFixer  // 12/03/04 PB
		End if 
		
End case 


ERR_MethodTrackerReturn("TRIGGER [TRANS_MULTI]"; $_t_oldMethodName)
