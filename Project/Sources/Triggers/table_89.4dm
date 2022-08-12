
If (False:C215)
	//Table Name:      Trigger on [PROJECTS]
	//------------------ Trigger Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  02/12/2019
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 

//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SP_Bo_PrefsLoaded; $_bo_Run)
	C_LONGINT:C283(<>CB_SP_Projects; $_l_event; $_l_Process; $_l_Retries; $_l_TableNumber; $0)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_oldMethodName)
End if 
//Code Starts Here
If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 30/09/2013 19:03
	//Method Name: Trigger:PROJECTS
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	
	//End Project method Amendments
End if 
$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [PROJECTS]")

C_TEXT:C284($_t_oldMethodName)

$0:=0
$_l_event:=Trigger event:C369
Case of 
		
		
	: ($_l_event=On Saving New Record Event:K3:1)  //WT - audit for saving new record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [PROJECTS]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer
			db_CheckMyUnique(->[PROJECTS:89]Project_Code:1; 0)
			AUTO_AUDIT(->[PROJECTS:89]; Field:C253(->[PROJECTS:89]Project_Code:1); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
			If ([PROJECTS:89]X_ID:11=0)
				If ([PROJECTS:89]Project_Code:1#"")
					[PROJECTS:89]X_ID:11:=AA_GetNextID(->[PROJECTS:89]X_ID:11)
				End if 
				
			End if 
			C_LONGINT:C283($_l_TableNumber)
			$_l_TableNumber:=Table:C252(->[PROJECTS:89])
			C_LONGINT:C283($_l_TableNumber; <>CB_SP_Projects)
			C_BOOLEAN:C305(<>SP_Bo_PrefsLoaded)
			$_l_TableNumber:=Table:C252(->[PROJECTS:89])
			$_bo_Run:=False:C215
			$_l_Retries:=0
			While (Test semaphore:C652("PipelineLoad"))
				$_l_Retries:=$_l_Retries+1
				DelayTicks($_l_Retries*2)
			End while 
			
			If (<>SP_Bo_PrefsLoaded)
				If (<>CB_SP_Projects=1)
					$_bo_Run:=True:C214
				End if 
			Else 
				$_bo_Run:=True:C214
			End if 
			If ($_bo_Run)
				ProcessServices_CreateRecord(->[PROJECTS:89]; ->[PROJECTS:89]X_ID:11; "Pipeline Update")
				If (False:C215)
					$_l_Process:=New process:C317("SP_UpdatePipeline"; DB_ProcessMemoryinit(1); "Update Pipeline"; $_l_TableNumber; [PROJECTS:89]X_ID:11; [PROJECTS:89]Project_Code:1; [PROJECTS:89]State:9; 0; [PROJECTS:89]Company_Code:3; 0; [PROJECTS:89]Contact_Code:4; ""; 0; ""; "")
				End if 
			End if 
		End if 
	: ($_l_event=On Saving Existing Record Event:K3:2)  //WT - audit for saving old/existing record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [PROJECTS]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer
			db_CheckMyUnique(->[PROJECTS:89]Project_Code:1; 1)
			If ([PROJECTS:89]X_ID:11=0)
				[PROJECTS:89]X_ID:11:=AA_GetNextID(->[PROJECTS:89]X_ID:11)
			End if 
			AUTO_AUDIT(->[PROJECTS:89]; Field:C253(->[PROJECTS:89]Project_Code:1); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
			C_LONGINT:C283($_l_TableNumber)
			$_l_TableNumber:=Table:C252(->[PROJECTS:89])
			C_LONGINT:C283($_l_TableNumber; <>CB_SP_Projects)
			C_BOOLEAN:C305(<>SP_Bo_PrefsLoaded)
			$_l_TableNumber:=Table:C252(->[PROJECTS:89])
			$_bo_Run:=False:C215
			$_l_Retries:=0
			While (Test semaphore:C652("PipelineLoad"))
				$_l_Retries:=$_l_Retries+1
				DelayTicks($_l_Retries*2)
			End while 
			If (<>SP_Bo_PrefsLoaded)
				If (<>CB_SP_Projects=1)
					$_bo_Run:=True:C214
				End if 
			Else 
				$_bo_Run:=True:C214
			End if 
			If ($_bo_Run)
				ProcessServices_CreateRecord(->[PROJECTS:89]; ->[PROJECTS:89]X_ID:11; "Pipeline Update")
				If (False:C215)
					$_l_Process:=New process:C317("SP_UpdatePipeline"; DB_ProcessMemoryinit(1); "Update Pipeline"; $_l_TableNumber; [PROJECTS:89]X_ID:11; [PROJECTS:89]Project_Code:1; [PROJECTS:89]State:9; 0; [PROJECTS:89]Company_Code:3; 0; [PROJECTS:89]Contact_Code:4; ""; 0; ""; "")
				End if 
			End if 
		End if 
	: ($_l_event=On Deleting Record Event:K3:3)  //WT - audit for deleting record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [PROJECTS]"; $_l_event)
		If (DB_TableTriggerEnabled)
			AUTO_AUDIT_DEL(->[PROJECTS:89]; Field:C253(->[PROJECTS:89]Project_Code:1); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
		End if 
		
End case 
ERR_MethodTrackerReturn("TRIGGER [PROJECTS]"; $_t_oldMethodName)
