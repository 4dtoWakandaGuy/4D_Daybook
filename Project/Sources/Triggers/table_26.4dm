
If (False:C215)
	//Table Name:      Trigger on [JOBS]
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
	C_LONGINT:C283(<>CB_SP_Jobs; $_l_event; $_l_Process; $_l_Retries; $_l_TableNumber; $0)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [JOBS]")

C_TEXT:C284($_t_oldMethodName)
$0:=0
$_l_event:=Trigger event:C369
Case of 
		
		
	: ($_l_event=On Saving New Record Event:K3:1)  //WT - audit for saving new record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [JOBS]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer
			
			db_CheckMyUnique(->[JOBS:26]Job_Code:1; 0)
			If ([JOBS:26]x_ID:49=0)
				If ([JOBS:26]Job_Code:1#"")
					[JOBS:26]x_ID:49:=AA_GetNextID(->[JOBS:26]x_ID:49)
				End if 
				
			End if 
			AUTO_AUDIT(->[JOBS:26]; Field:C253(->[JOBS:26]Job_Code:1); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
			C_LONGINT:C283($_l_TableNumber; <>CB_SP_Jobs)
			C_BOOLEAN:C305(<>SP_Bo_PrefsLoaded)
			$_l_TableNumber:=Table:C252(->[JOBS:26])
			$_bo_Run:=False:C215
			$_l_Retries:=0
			While (Test semaphore:C652("PipelineLoad"))
				$_l_Retries:=$_l_Retries+1
				DelayTicks($_l_Retries*2)
			End while 
			If (<>SP_Bo_PrefsLoaded)
				If (<>CB_SP_Jobs=1)
					$_bo_Run:=True:C214
				End if 
			Else 
				$_bo_Run:=True:C214
			End if 
			If ($_bo_Run)
				ProcessServices_CreateRecord(->[JOBS:26]; ->[JOBS:26]x_ID:49; "Pipeline Update")
				If (False:C215)
					$_l_Process:=New process:C317("SP_UpdatePipeline"; DB_ProcessMemoryinit(1); "Update Pipeline"; $_l_TableNumber; [JOBS:26]x_ID:49; [JOBS:26]Job_Code:1; [JOBS:26]State:9; 0; [JOBS:26]Company_Code:3; 0; [JOBS:26]Contact_Code:4; ""; 0; ""; "")
				End if 
			End if 
		End if 
	: ($_l_event=On Saving Existing Record Event:K3:2)  //WT - audit for saving old/existing record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [JOBS]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer
			
			db_CheckMyUnique(->[JOBS:26]Job_Code:1; 1)
			If ([JOBS:26]x_ID:49=0)
				[JOBS:26]x_ID:49:=AA_GetNextID(->[JOBS:26]x_ID:49)
			End if 
			AUTO_AUDIT(->[JOBS:26]; Field:C253(->[JOBS:26]Job_Code:1); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
			C_LONGINT:C283($_l_TableNumber)
			$_l_TableNumber:=Table:C252(->[JOBS:26])
			C_LONGINT:C283($_l_TableNumber; <>CB_SP_Jobs)
			C_BOOLEAN:C305(<>SP_Bo_PrefsLoaded)
			$_l_TableNumber:=Table:C252(->[JOBS:26])
			$_bo_Run:=False:C215
			$_l_Retries:=0
			While (Test semaphore:C652("PipelineLoad"))
				$_l_Retries:=$_l_Retries+1
				DelayTicks($_l_Retries*2)
			End while 
			If (<>SP_Bo_PrefsLoaded)
				If (<>CB_SP_Jobs=1)
					$_bo_Run:=True:C214
				End if 
			Else 
				$_bo_Run:=True:C214
			End if 
			If ($_bo_Run)
				ProcessServices_CreateRecord(->[JOBS:26]; ->[JOBS:26]x_ID:49; "Pipeline Update")
				If (False:C215)
					$_l_Process:=New process:C317("SP_UpdatePipeline"; DB_ProcessMemoryinit(1); "Update Pipeline"; $_l_TableNumber; [JOBS:26]x_ID:49; [JOBS:26]Job_Code:1; [JOBS:26]State:9; 0; [JOBS:26]Company_Code:3; 0; [JOBS:26]Contact_Code:4; ""; 0; ""; "")
				End if 
			End if 
		End if 
	: ($_l_event=On Deleting Record Event:K3:3)  //WT - audit for deleting record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [JOBS]"; $_l_event)
		If (DB_TableTriggerEnabled)
			AUTO_AUDIT_DEL(->[JOBS:26]; Field:C253(->[JOBS:26]Job_Code:1); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
		End if 
End case 


ERR_MethodTrackerReturn("TRIGGER [JOBS]"; $_t_oldMethodName)
