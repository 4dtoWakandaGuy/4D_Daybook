If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 30/09/2013 19:03
	//Method Name: Trigger:DATA_AUDITS
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	
	//End Project method Amendments
End if 
$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [DATA_AUDITS]")

C_TEXT:C284($_t_oldMethodName)

$0:=0
$_l_event:=Trigger event:C369
<>SYS_bo_inTrigger:=True:C214
//this is the only table not to write an audit on
Case of 
		
		
	: ($_l_event=On Saving New Record Event:K3:1)  //WT - audit for saving new record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [DATA_AUDITS]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer  // 12/03/04 PB
			
			If ([DATA_AUDITS:102]X_ID:1=0)
				If ([DATA_AUDITS:102]X_ID:1#[DATA_AUDITS:102]X_ID:1)
					[DATA_AUDITS:102]X_ID:1:=AA_GetNextID(->[DATA_AUDITS:102]X_ID:1)
				End if 
				
				
			End if 
		End if 
	: ($_l_event=On Saving Existing Record Event:K3:2)  //WT - audit for saving old/existing record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [DATA_AUDITS]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer  // 12/03/04 PB
			
			If ([DATA_AUDITS:102]X_ID:1=0)
				[DATA_AUDITS:102]X_ID:1:=AA_GetNextID(->[DATA_AUDITS:102]X_ID:1)
			End if 
		End if 
		
	: ($_l_event=On Deleting Record Event:K3:3)  //WT - audit for deleting record
End case 
<>SYS_bo_inTrigger:=False:C215
ERR_MethodTrackerReturn("TRIGGER [DATA_AUDITS]"; $_t_oldMethodName)
