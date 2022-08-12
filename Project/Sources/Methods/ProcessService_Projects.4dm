//%attributes = {}
If (False:C215)
	//Project Method Name:      ProcessService_Projects
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SP_Bo_PrefsLoaded; $_bo_Run; $0)
	C_LONGINT:C283(<>CB_SP_Projects; $_l_Process; $_l_TableNumber)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ProcessService_Projects")
//ProcessService_Projects

// 24/2/2004 NG
// Runs various methods called from trigger

Case of 
	: ([PROCESSES_TO_HANDLE:115]ServiceType:6="Pipeline Update")
		
		
		
		//$RecNum:=Find index key([PROJECTS]X_ID;[ProcessesToHandle]RecordNumber)
		//Cant use go to record in a transaction NG MAY 2004
		QUERY:C277([PROJECTS:89]; [PROJECTS:89]X_ID:11=[PROCESSES_TO_HANDLE:115]RecordNumber:7)
		If (Records in selection:C76([PROJECTS:89])=0)
			[PROCESSES_TO_HANDLE:115]Comments:3:="`Project record not found."
			[PROCESSES_TO_HANDLE:115]Status:2:=3
			DB_SaveRecord(->[PROCESSES_TO_HANDLE:115])
			$0:=True:C214
		Else 
			//GOTO RECORD([PROJECTS];$RecNum)  ` 26/02/03 pb
			$0:=True:C214
			$_l_TableNumber:=Table:C252(->[PROJECTS:89])
			
			$_bo_Run:=False:C215
			If (<>SP_Bo_PrefsLoaded)
				If (<>CB_SP_Projects=1)
					$_bo_Run:=True:C214
				End if 
			Else 
				$_bo_Run:=True:C214
			End if 
			If ($_bo_Run)
				$_l_Process:=New process:C317("SP_UpdatePipeline"; DB_ProcessMemoryinit(1); "Update Pipeline"; $_l_TableNumber; [PROJECTS:89]X_ID:11; [PROJECTS:89]Project_Code:1; [PROJECTS:89]State:9; 0; [PROJECTS:89]Company_Code:3; 0; [PROJECTS:89]Contact_Code:4; ""; 0; ""; "")
			End if 
		End if 
		
End case 
UNLOAD RECORD:C212([PROJECTS:89])
UNLOAD RECORD:C212([SALES_PROJECTION:113])
ERR_MethodTrackerReturn("ProcessService_Projects"; $_t_oldMethodName)
