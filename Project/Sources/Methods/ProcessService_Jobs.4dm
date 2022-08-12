//%attributes = {}
If (False:C215)
	//Project Method Name:      ProcessService_Jobs
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
	C_LONGINT:C283(<>CB_SP_Jobs; $_l_Process; $_l_TableNumber)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ProcessService_Jobs")
//ProcessService_Jobs
// 24/2/2004
// Runs various methods called from trigger

Case of 
	: ([PROCESSES_TO_HANDLE:115]ServiceType:6="***NOTUSED***JCUpdateJobTotals")  //Added 21/02/07 - kmw
		If (False:C215)
			READ WRITE:C146([JOBS:26])
			QUERY:C277([JOBS:26]; [JOBS:26]x_ID:49=[PROCESSES_TO_HANDLE:115]RecordNumber:7)
			If (Records in selection:C76([JOBS:26])=0)
				[PROCESSES_TO_HANDLE:115]Comments:3:="Job record not found."
				[PROCESSES_TO_HANDLE:115]Status:2:=3
				DB_SaveRecord(->[PROCESSES_TO_HANDLE:115])
				$0:=True:C214
			Else 
				If (Check_Locked(->[JOBS:26]; 1))
					READ ONLY:C145([JOB_STAGES:47])
					READ ONLY:C145([ORDER_ITEMS:25])
					//***********get correct selection of job stages and update job actual and budget time totals ***********
					QUERY:C277([JOB_STAGES:47]; [JOB_STAGES:47]Job_Code:1=[JOBS:26]Job_Code:1)
					If ([JOBS:26]Actual_TR:29)
						JC_UpdateJobActualTime  //use current selection of job stage records to update actual totals on job
					End if 
					If ([JOBS:26]Budget_TR:28)
						JC_UpdateJobBudgetTime  //use current selection of job stage records to update budget totals on job
					End if 
					//*********************************************************************************
					//***********already have required correct selection of job stages but also get correct selection of actual order items and update job actual costs ***********
					QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Job_Code:34=[JOBS:26]Job_Code:1; *)
					QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Job_Stage_Code:60=""; *)
					QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]State:46="A")
					JC_UpdateJobActualCost
					//**********************************************************************
					//***********already have required correct selection of job stages but also get correct selection of budget order items and update job budget costs ***********
					QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Job_Code:34=[JOBS:26]Job_Code:1; *)
					QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Job_Stage_Code:60=""; *)
					QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]State:46="B")
					JC_UpdateJobBudgetCost
					//**********************************************************************
					DB_SaveRecord(->[JOBS:26])  //the above update routines don't actually issue a save so do so now
					$0:=True:C214
				Else   //job locked so return false to let it have another go later
					$0:=False:C215
				End if 
			End if 
			READ ONLY:C145([JOBS:26])
			
		Else 
			$0:=True:C214
		End if 
	: ([PROCESSES_TO_HANDLE:115]ServiceType:6="Pipeline Update")
		
		
		
		//Cant use goto record in TRANSACTION
		QUERY:C277([JOBS:26]; [JOBS:26]x_ID:49=[PROCESSES_TO_HANDLE:115]RecordNumber:7)
		If (Records in selection:C76([JOBS:26])=0)
			[PROCESSES_TO_HANDLE:115]Comments:3:="`job record not found."
			[PROCESSES_TO_HANDLE:115]Status:2:=3
			DB_SaveRecord(->[PROCESSES_TO_HANDLE:115])
			$0:=True:C214
		Else 
			// RECORD([JOBS];$RecNum)  ` 26/02/03 pb
			$0:=True:C214
			$_l_TableNumber:=Table:C252(->[JOBS:26])
			
			$_bo_Run:=False:C215
			If (<>SP_Bo_PrefsLoaded)
				If (<>CB_SP_Jobs=1)
					$_bo_Run:=True:C214
				End if 
			Else 
				$_bo_Run:=True:C214
			End if 
			If ($_bo_Run)
				$_l_Process:=New process:C317("SP_UpdatePipeline"; DB_ProcessMemoryinit(1); "Update Pipeline"; $_l_TableNumber; [JOBS:26]x_ID:49; [JOBS:26]Job_Code:1; [JOBS:26]State:9; 0; [JOBS:26]Company_Code:3; 0; [JOBS:26]Contact_Code:4; ""; 0; ""; "")
			End if 
		End if 
		
End case 
UNLOAD RECORD:C212([JOBS:26])
UNLOAD RECORD:C212([SALES_PROJECTION:113])
ERR_MethodTrackerReturn("ProcessService_Jobs"; $_t_oldMethodName)
