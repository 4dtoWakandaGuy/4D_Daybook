If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 30/09/2013 19:03
	//Method Name: Trigger:CURRENCY_RATES
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	
	//End Project method Amendments
End if 
$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [CURRENCY_RATES]")

C_TEXT:C284($_t_oldMethodName)

$0:=0
$_l_event:=Trigger event:C369
<>SYS_bo_inTrigger:=True:C214
Case of 
		
		
	: ($_l_event=On Saving New Record Event:K3:1)  //WT - audit for saving new record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [CURRENCY_RATES]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer  // 12/03/04 PB
			
			If ([CURRENCY_RATES:72]X_ID:6=0)
				[CURRENCY_RATES:72]X_ID:6:=AA_GetNextID(->[CURRENCY_RATES:72]X_ID:6)
			End if 
			
			
			AUTO_AUDIT(->[CURRENCY_RATES:72]; Field:C253(->[CURRENCY_RATES:72]X_ID:6); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
		End if 
	: ($_l_event=On Saving Existing Record Event:K3:2)  //WT - audit for saving old/existing record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [CURRENCY_RATES]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer  // 12/03/04 PB
			
			If ([CURRENCY_RATES:72]X_ID:6=0)
				If ([CURRENCY_RATES:72]Currency_From:1#"")
					[CURRENCY_RATES:72]X_ID:6:=AA_GetNextID(->[CURRENCY_RATES:72]X_ID:6)
				End if 
			End if 
			
			AUTO_AUDIT(->[CURRENCY_RATES:72]; Field:C253(->[CURRENCY_RATES:72]X_ID:6); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
		End if 
	: ($_l_event=On Deleting Record Event:K3:3)  //WT - audit for deleting record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [CURRENCY_RATES]"; $_l_event)
		If (DB_TableTriggerEnabled)
			
			If ([CURRENCY_RATES:72]X_ID:6=0)
				[CURRENCY_RATES:72]X_ID:6:=AA_GetNextID(->[CURRENCY_RATES:72]X_ID:6)
			End if 
			AUTO_AUDIT_DEL(->[CURRENCY_RATES:72]; Field:C253(->[CURRENCY_RATES:72]X_ID:6); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
		End if 
End case 
<>SYS_bo_inTrigger:=False:C215


ERR_MethodTrackerReturn("TRIGGER [CURRENCY_RATES]"; $_t_oldMethodName)
