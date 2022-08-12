//%attributes = {}
If (False:C215)
	//Project Method Name:      ProcessService_JobStages
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
	C_BOOLEAN:C305($_bo_PostActual; $_bo_PostBudget; $0)
	C_LONGINT:C283($_l_JSXIS)
	C_TEXT:C284(<>WIP_t_TRPTrans; $_t_JSJobCode; $_t_oldMethodName; $_t_RecordOperation)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ProcessService_JobStages")
//ProcessService_JobStages
//Added 20/02/07 - kmw
//Runs various functionality called from trigger

Case of 
	: ([PROCESSES_TO_HANDLE:115]ServiceType:6="JCAddJS") | ([PROCESSES_TO_HANDLE:115]ServiceType:6="JCModJS")  //added 28/02/07 -kmw
		//
		$_l_JSXIS:=[PROCESSES_TO_HANDLE:115]RecordNumber:7
		BLOB TO VARIABLE:C533([PROCESSES_TO_HANDLE:115]Data5Blob:12; $_t_JSJobCode)
		//
		READ WRITE:C146([JOBS:26])
		
		JC_FindJobFromJS($_l_JSXIS; $_t_JSJobCode)  //find and make current the passed job stage's job
		
		$_bo_PostActual:=[JOBS:26]Actual_TR:29  //added 05/03/07 -kmw
		$_bo_PostBudget:=[JOBS:26]Budget_TR:28  //added 05/03/07 -kmw
		
		Case of 
			: ($_bo_PostActual=False:C215) & ($_bo_PostBudget=False:C215)  //added 05/03/07 -kmw
				$0:=True:C214
				
			: (Records in selection:C76([JOBS:26])>1)  //SHOULDN'T HAPPEN!!!!!!!!!!!!!! (but may as well load the first job found?)
				
				If (Check_Locked(->[JOBS:26]; 1))
					$0:=True:C214
				Else   //job locked so return false to let it have another go later
					[PROCESSES_TO_HANDLE:115]Comments:3:="Awaiting Record Lock"  //added kmw 02/03/07
					[PROCESSES_TO_HANDLE:115]Status:2:=-99  //added kmw 02/03/07 (ProcessServices detects and resets -99 to status 1)
					DB_SaveRecord(->[PROCESSES_TO_HANDLE:115])  //added kmw 02/03/07
					$0:=False:C215
				End if 
				
			: (Records in selection:C76([JOBS:26])=1)  //one job record found so load it
				If (Check_Locked(->[JOBS:26]; 1))
					$0:=True:C214
				Else   //job locked so return false to let it have another go later
					[PROCESSES_TO_HANDLE:115]Comments:3:="Awaiting Record Lock"  //added kmw 02/03/07
					[PROCESSES_TO_HANDLE:115]Status:2:=-99  //added kmw 02/03/07 (ProcessServices detects and resets -99 to status 1)
					DB_SaveRecord(->[PROCESSES_TO_HANDLE:115])  //added kmw 02/03/07
					$0:=False:C215
				End if 
				
			Else   //none found so create a new one using job stage code and composite key values based on current job personnel record
				QUERY:C277([JOB_STAGES:47]; [JOB_STAGES:47]x_ID:54=$_l_JSXIS)
				JC_AddJobAsResultOfJS
				$0:=True:C214
		End case 
		
		If ($0=True:C214) & (($_bo_PostActual) | ($_bo_PostBudget))  //Job successfully loaded or a new one was created
			READ ONLY:C145([JOB_STAGES:47])
			READ ONLY:C145([ORDER_ITEMS:25])
			//
			JC_UpdateJobAllTotals
			//
			DB_SaveRecord(->[JOBS:26])  //the above update routines don't actually issue a save so do so now
			UNLOAD RECORD:C212([JOBS:26])
			READ ONLY:C145([JOBS:26])
			
		End if 
		
		
	: ([PROCESSES_TO_HANDLE:115]ServiceType:6="JCDelJS")  //added 28/02/07 -kmw
		//
		$_l_JSXIS:=[PROCESSES_TO_HANDLE:115]RecordNumber:7
		BLOB TO VARIABLE:C533([PROCESSES_TO_HANDLE:115]Data5Blob:12; $_t_JSJobCode)
		//
		READ WRITE:C146([JOBS:26])
		
		JC_FindJobFromJS($_l_JSXIS; $_t_JSJobCode)  //find and make current the passed job stage's job
		
		$_bo_PostActual:=[JOBS:26]Actual_TR:29  //added 05/03/07 -kmw
		$_bo_PostBudget:=[JOBS:26]Budget_TR:28  //added 05/03/07 -kmw
		
		Case of 
			: ($_bo_PostActual=False:C215) & ($_bo_PostBudget=False:C215)  //added 05/03/07 -kmw
				$0:=True:C214
				
			: (Records in selection:C76([JOBS:26])>1)  //SHOULDN'T HAPPEN!!!!!!!!!!!!!! (but may as well load the first job found?)
				
				If (Check_Locked(->[JOBS:26]; 1))
					$0:=True:C214
				Else   //job stage locked so return false to let it have another go later
					[PROCESSES_TO_HANDLE:115]Comments:3:="Awaiting Record Lock"  //added kmw 02/03/07
					[PROCESSES_TO_HANDLE:115]Status:2:=-99  //added kmw 02/03/07 (ProcessServices detects and resets -99 to status 1)
					DB_SaveRecord(->[PROCESSES_TO_HANDLE:115])  //added kmw 02/03/07
					$0:=False:C215
				End if 
				
			: (Records in selection:C76([JOBS:26])=1)  //one job record found so load it
				If (Check_Locked(->[JOBS:26]; 1))
					$0:=True:C214
				Else   //job stage locked so return false to let it have another go later
					[PROCESSES_TO_HANDLE:115]Comments:3:="Awaiting Record Lock"  //added kmw 02/03/07
					[PROCESSES_TO_HANDLE:115]Status:2:=-99  //added kmw 02/03/07 (ProcessServices detects and resets -99 to status 1)
					DB_SaveRecord(->[PROCESSES_TO_HANDLE:115])  //added kmw 02/03/07
					$0:=False:C215
				End if 
				
			Else   //none found so do nothing
				//do nothing
				$0:=True:C214
		End case 
		
		If ($0=True:C214) & (Records in selection:C76([JOBS:26])>0) & (($_bo_PostActual) | ($_bo_PostBudget))  //Job successfully found and loaded
			READ ONLY:C145([JOB_STAGES:47])
			READ ONLY:C145([ORDER_ITEMS:25])
			//
			JC_UpdateJobAllTotals
			//
			DB_SaveRecord(->[JOBS:26])  //the above update routines don't actually issue a save so do so now
			UNLOAD RECORD:C212([JOBS:26])
			READ ONLY:C145([JOBS:26])
			
		End if 
		
	: ([PROCESSES_TO_HANDLE:115]ServiceType:6="***NOTUSED***JCUpdateJSTotals")
		READ WRITE:C146([JOB_STAGES:47])
		QUERY:C277([JOB_STAGES:47]; [JOB_STAGES:47]x_ID:54=[PROCESSES_TO_HANDLE:115]RecordNumber:7)
		If (Records in selection:C76([JOB_STAGES:47])=0)
			[PROCESSES_TO_HANDLE:115]Comments:3:="Job Stage record not found."
			[PROCESSES_TO_HANDLE:115]Status:2:=3
			DB_SaveRecord(->[PROCESSES_TO_HANDLE:115])
			$0:=True:C214
		Else 
			If (Check_Locked(->[JOB_STAGES:47]; 1))
				READ ONLY:C145([JOB PERSONNEL:48])
				READ ONLY:C145([ORDER_ITEMS:25])
				READ ONLY:C145([JOBS:26])
				//***********get correct selection of personnel records and update job stage actual and budget time totals ***********
				If ([JOB_STAGES:47]Job_Stage_code:52#"")
					QUERY:C277([JOB PERSONNEL:48]; [JOB PERSONNEL:48]Job_stage_Code:17=[JOB_STAGES:47]Job_Stage_code:52)
				Else 
					QUERY:C277([JOB PERSONNEL:48]; [JOB PERSONNEL:48]Job_Code:1=[JOB_STAGES:47]Job_Code:1; *)
					QUERY:C277([JOB PERSONNEL:48];  & ; [JOB PERSONNEL:48]Stage_Code:2=[JOB_STAGES:47]Stage_Code:2)
				End if 
				QUERY:C277([JOBS:26]; [JOBS:26]Job_Code:1=[JOB PERSONNEL:48]Job_Code:1)  //so we know if the job this job personnel belongs to allows posting actual or budget figures
				If ([JOBS:26]Actual_TR:29)
					JC_UpdateJSActualTime  //use current selection of job personnel records to update actual totals on job stage
				End if 
				If ([JOBS:26]Budget_TR:28)
					JC_UpdateJSBudgetTime  //use current selection of job personnel records to update budget totals on job stage
				End if 
				//*********************************************************************************
				//***********get correct selection of actual order items and update job stage actual costs ***********
				If ([JOB_STAGES:47]Job_Stage_code:52#"")
					QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Job_Stage_Code:60=[JOB_STAGES:47]Job_Stage_code:52)
				Else 
					QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Job_Code:34=[JOB_STAGES:47]Job_Code:1; *)
					QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Job_Stage:35=[JOB_STAGES:47]Stage_Code:2)
				End if 
				QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]State:46="A")
				JC_UpdateJSActualCost
				//**********************************************************************
				//***********get correct selection of budget order items and update job stage budget costs ***********
				If ([JOB_STAGES:47]Job_Stage_code:52#"")
					QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Job_Stage_Code:60=[JOB_STAGES:47]Job_Stage_code:52)
				Else 
					QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Job_Code:34=[JOB_STAGES:47]Job_Code:1; *)
					QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Job_Stage:35=[JOB_STAGES:47]Stage_Code:2)
				End if 
				QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]State:46="B")
				JC_UpdateJSBudgetCost
				//**********************************************************************
				DB_SaveRecord(->[JOB_STAGES:47])  //the above update routines don't actually issue a save so do so now
				$0:=True:C214
			Else   //job stage locked so return false to let it have another go later
				$0:=False:C215
			End if 
		End if 
		READ ONLY:C145([JOB_STAGES:47])
		
	: ([PROCESSES_TO_HANDLE:115]ServiceType:6="***NOTUSED***JCAddJob")  //added 26/02/07 -kmw
		
		READ ONLY:C145([JOB_STAGES:47])
		QUERY:C277([JOB_STAGES:47]; [JOB_STAGES:47]x_ID:54=[PROCESSES_TO_HANDLE:115]RecordNumber:7)
		READ WRITE:C146([JOBS:26])
		CREATE RECORD:C68([JOBS:26])
		[JOBS:26]Job_Code:1:=[JOB_STAGES:47]Job_Code:1
		//********************** cheeky way of setting initial total on job record ********************
		//can get away with this because we know there is only one job stage record on the job and that it is also the only job stage record in the current selection
		
		//***********get correct selection of job stages and update job stage actual and budget time totals ***********
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
		
		DB_SaveRecord(->[JOB_STAGES:47])
		READ ONLY:C145([JOB_STAGES:47])
		$0:=True:C214
	: ([PROCESSES_TO_HANDLE:115]ServiceType:6="***NOTUSED***")
		QUERY:C277([DIARY:12]; [DIARY:12]x_ID:50=[PROCESSES_TO_HANDLE:115]RecordNumber:7)  //kmw - what if its a new diary record but it doesn't yet "exist"? (...e.g...process service record created and process services detects it and begins executing this code before trigger can finish and allow diary to be created) or does record always exist by the time triger on save executed? or does trigger freeze any further server processing while it is working?
		If (Records in selection:C76([DIARY:12])=0)
			[PROCESSES_TO_HANDLE:115]Comments:3:="Diary record not found."
			[PROCESSES_TO_HANDLE:115]Status:2:=3
			DB_SaveRecord(->[PROCESSES_TO_HANDLE:115])
			$0:=True:C214
		Else 
			//◊WIPTRPTrans:= ??
			$_t_RecordOperation:="Create"
			If (JC_TimeUpdateTotals([DIARY:12]x_ID:50; $_t_RecordOperation))
				$0:=True:C214
				If (<>WIP_t_TRPTrans#"")
					$0:=JC_TimeUpdateWIP([DIARY:12]x_ID:50; $_t_RecordOperation)
					
				End if 
			Else 
				$0:=False:C215
			End if 
		End if 
		
	: ([PROCESSES_TO_HANDLE:115]ServiceType:6="***NOTUSED***")
		QUERY:C277([DIARY:12]; [DIARY:12]x_ID:50=[PROCESSES_TO_HANDLE:115]RecordNumber:7)
		//need to check here if this diary record is a Time recording.
		If (Records in selection:C76([DIARY:12])=0)
			[PROCESSES_TO_HANDLE:115]Comments:3:="Diary record not found."
			[PROCESSES_TO_HANDLE:115]Status:2:=3
			DB_SaveRecord(->[PROCESSES_TO_HANDLE:115])
			$0:=True:C214
		Else 
			//◊WIPTRPTrans:= ??
			$_t_RecordOperation:="Update"
			If (JC_TimeUpdateTotals([DIARY:12]x_ID:50; $_t_RecordOperation))
				$0:=True:C214
				If (<>WIP_t_TRPTrans#"")
					$0:=JC_TimeUpdateWIP([DIARY:12]x_ID:50; $_t_RecordOperation)
				End if 
			Else 
				$0:=False:C215
			End if 
		End if 
		
	: ([PROCESSES_TO_HANDLE:115]ServiceType:6="***NOTUSED***")
		$_t_RecordOperation:="Delete"
		
End case 
UNLOAD RECORD:C212([ORDER_ITEMS:25])
UNLOAD RECORD:C212([JOB PERSONNEL:48])
UNLOAD RECORD:C212([JOB_STAGES:47])
UNLOAD RECORD:C212([JOBS:26])
ERR_MethodTrackerReturn("ProcessService_JobStages"; $_t_oldMethodName)
