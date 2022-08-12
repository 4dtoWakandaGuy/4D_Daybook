If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 30/09/2013 19:02
	//Method Name: Trigger:COMPANIES
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	
	//End Project method Amendments
End if 
$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [COMPANIES]")

C_TEXT:C284($_t_oldMethodName)
$0:=0
$_l_event:=Trigger event:C369
<>SYS_bo_inTrigger:=True:C214
Case of 
		
		
	: ($_l_event=On Saving New Record Event:K3:1)  //WT - audit for saving new record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [COMPANIES]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer  // 12/03/04 PB
			
			db_CheckMyUnique(->[COMPANIES:2]Company_Code:1; 0)
			
			[COMPANIES:2]ADDRESS:60:=WS_BUILDADDRESS
			AUTO_AUDIT(->[COMPANIES:2]; Field:C253(->[ORDERS:24]Order_Code:3); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
			
			If ([COMPANIES:2]x_ID:63=0)
				If ([COMPANIES:2]Company_Code:1#"")
					[COMPANIES:2]x_ID:63:=AA_GetNextID(->[COMPANIES:2]x_ID:63)
				End if 
			End if 
			[COMPANIES:2]Phonetic_Name:64:=DB_BuildSoundex(DB_CompanyNameClean([COMPANIES:2]Company_Name:2))
			COM_CommentstoDiary(->[COMPANIES:2]Comments:30)
		End if 
		
		
	: ($_l_event=On Saving Existing Record Event:K3:2)  //WT - audit for saving old/existing record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [COMPANIES]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer  // 12/03/04 PB
			db_CheckMyUnique(->[COMPANIES:2]Company_Code:1; 1)
			
			[COMPANIES:2]ADDRESS:60:=WS_BUILDADDRESS
			AUTO_AUDIT(->[COMPANIES:2]; Field:C253(->[ORDERS:24]Order_Code:3); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
			
			If ([COMPANIES:2]x_ID:63=0)
				[COMPANIES:2]x_ID:63:=AA_GetNextID(->[COMPANIES:2]x_ID:63)
			End if 
			[COMPANIES:2]Phonetic_Name:64:=DB_BuildSoundex(DB_CompanyNameClean([COMPANIES:2]Company_Name:2))
		End if 
		
	: ($_l_event=On Deleting Record Event:K3:3)  //WT - audit for deleting record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [COMPANIES]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer  // 12/03/04 PB
			
			AUTO_AUDIT_DEL(->[COMPANIES:2]; Field:C253(->[ORDERS:24]Order_Code:3); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
			
		End if 
		
End case 


ERR_MethodTrackerReturn("TRIGGER [COMPANIES]"; $_t_oldMethodName)
