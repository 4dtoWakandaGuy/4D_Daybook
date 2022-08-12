//%attributes = {}
If (False:C215)
	//Project Method Name:      ProcessService_JobPersonnel
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
	ARRAY LONGINT:C221($_al_DiaryIDS; 0)
	C_BOOLEAN:C305($_bo_PostActual; $_bo_PostBudget; $0; JC_bo_PostActualTime; JC_bo_PostBudgetTime)
	C_DATE:C307($_d_DateCreated)
	C_LONGINT:C283($_l_Delimiter1Position; $_l_Delimiter2Position; $_l_JSPXID; $_l_NumberofRecords; $_l_NumofDiaryRelation; $_l_RecordNumber; $_l_TableNumber)
	C_TEXT:C284(<>TimeAct; <>WIP_t_TRPTrans; $_t_CompositeKey; $_t_JSPJobCode; $_t_JSPJobStageCode; $_t_JSPStageCode; $_t_oldMethodName; $_t_RecordOperation)
	C_TIME:C306($_ti_TimeCreated)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ProcessService_JobPersonnel")
//ProcessService_JobPersonnel
//Added 20/02/07 - kmw
//Runs various functionality called from trigger

Case of 
	: ([PROCESSES_TO_HANDLE:115]ServiceType:6="JCAddJSP") | ([PROCESSES_TO_HANDLE:115]ServiceType:6="JCModJSP")  //added 28/02/07 -kmw
		//
		$_l_JSPXID:=[PROCESSES_TO_HANDLE:115]RecordNumber:7
		BLOB TO VARIABLE:C533([PROCESSES_TO_HANDLE:115]Data5Blob:12; $_t_CompositeKey)
		$_l_Delimiter1Position:=Position:C15("*|Delim1|*"; $_t_CompositeKey)
		$_l_Delimiter2Position:=Position:C15("*|Delim2|*"; $_t_CompositeKey)
		$_t_JSPJobCode:=Substring:C12($_t_CompositeKey; 1; ($_l_Delimiter1Position-1))
		$_t_JSPStageCode:=Substring:C12($_t_CompositeKey; ($_l_Delimiter1Position+10); (($_l_Delimiter2Position)-($_l_Delimiter1Position+10)))
		$_t_JSPJobStageCode:=Substring:C12($_t_CompositeKey; ($_l_Delimiter2Position+10))
		//
		READ WRITE:C146([JOB_STAGES:47])
		
		JC_FindJSFromJSP($_l_JSPXID; $_t_JSPJobCode; $_t_JSPStageCode; $_t_JSPJobStageCode)
		
		QUERY:C277([JOBS:26]; [JOBS:26]Job_Code:1=$_t_JSPJobCode)  //added 05/03/07 -kmw
		If (Records in selection:C76([JOBS:26])>0)  //added 08/03/07 -kmw
			$_bo_PostActual:=[JOBS:26]Actual_TR:29  //added 05/03/07 -kmw
			$_bo_PostBudget:=[JOBS:26]Budget_TR:28  //added 05/03/07 -kmw
		Else   //SHOULDN'T HAPPEN!! (that no job yet exists for this Job Stage Personnel) However since it has - Make sure that whether we post to budget, actual and/or wip is decided in the same way as these values will be decided on the automatically created job that is to come
			JC_LoadPrefs  //added 08/03/07 -kmw
			$_bo_PostActual:=JC_bo_PostActualTime  //added 08/03/07 -kmw
			$_bo_PostBudget:=JC_bo_PostBudgetTime  //added 08/03/07 -kmw
		End if 
		
		Case of 
			: ($_bo_PostActual=False:C215) & ($_bo_PostBudget=False:C215)  //added 05/03/07 -kmw
				$0:=True:C214
				
			: (Records in selection:C76([JOB_STAGES:47])>1)  //SHOULDN'T HAPPEN!!!!!!!!!!!!!! (but may as well load the first job Stage found?)
				
				If (Check_Locked(->[JOB_STAGES:47]; 1))
					$0:=True:C214
				Else   //job stage locked so return false to let it have another go later
					[PROCESSES_TO_HANDLE:115]Comments:3:="Awaiting Record Lock"  //added kmw 02/03/07
					[PROCESSES_TO_HANDLE:115]Status:2:=-99  //added kmw 02/03/07 (ProcessServices detects and resets -99 to status 1)
					DB_SaveRecord(->[PROCESSES_TO_HANDLE:115])  //added kmw 02/03/07
					$0:=False:C215
				End if 
				
			: (Records in selection:C76([JOB_STAGES:47])=1)  //one job stage record found so load it
				If (Check_Locked(->[JOB_STAGES:47]; 1))
					$0:=True:C214
				Else   //job stage locked so return false to let it have another go later
					[PROCESSES_TO_HANDLE:115]Comments:3:="Awaiting Record Lock"  //added kmw 02/03/07
					[PROCESSES_TO_HANDLE:115]Status:2:=-99  //added kmw 02/03/07 (ProcessServices detects and resets -99 to status 1)
					DB_SaveRecord(->[PROCESSES_TO_HANDLE:115])  //added kmw 02/03/07
					$0:=False:C215
				End if 
				
			Else   //none found so create a new one using job stage code and composite key values based on current job personnel record
				QUERY:C277([JOB PERSONNEL:48]; [JOB PERSONNEL:48]X_ID:14=$_l_JSPXID)
				JC_AddJSAsResultOfJSP
				$0:=True:C214
		End case 
		
		If ($0=True:C214) & (($_bo_PostActual) | ($_bo_PostBudget))  //Job Stage successfully loaded or a new one was created
			READ ONLY:C145([JOB PERSONNEL:48])
			READ ONLY:C145([ORDER_ITEMS:25])
			READ ONLY:C145([JOBS:26])
			//
			JC_UpdateJSAllTotals
			//
			DB_SaveRecord(->[JOB_STAGES:47])  //the above update routines don't actually issue a save so do so now
			UNLOAD RECORD:C212([JOB_STAGES:47])
			READ ONLY:C145([JOB_STAGES:47])
			
		End if 
		
		//
	: ([PROCESSES_TO_HANDLE:115]ServiceType:6="JCDelJSP")  //added 28/02/07 -kmw
		//
		$_l_JSPXID:=[PROCESSES_TO_HANDLE:115]RecordNumber:7
		BLOB TO VARIABLE:C533([PROCESSES_TO_HANDLE:115]Data5Blob:12; $_t_CompositeKey)
		$_l_Delimiter1Position:=Position:C15("*|Delim1|*"; $_t_CompositeKey)
		$_l_Delimiter2Position:=Position:C15("*|Delim2|*"; $_t_CompositeKey)
		$_t_JSPJobCode:=Substring:C12($_t_CompositeKey; 1; ($_l_Delimiter1Position-1))
		$_t_JSPStageCode:=Substring:C12($_t_CompositeKey; ($_l_Delimiter1Position+10); (($_l_Delimiter2Position)-($_l_Delimiter1Position+10)))
		$_t_JSPJobStageCode:=Substring:C12($_t_CompositeKey; ($_l_Delimiter2Position+10))
		//
		READ WRITE:C146([JOB_STAGES:47])
		
		JC_FindJSFromJSP($_l_JSPXID; $_t_JSPJobCode; $_t_JSPStageCode; $_t_JSPJobStageCode)
		
		QUERY:C277([JOBS:26]; [JOBS:26]Job_Code:1=$_t_JSPJobCode)  //added 05/03/07 -kmw
		If (Records in selection:C76([JOBS:26])>0)  //added 08/03/07 -kmw
			$_bo_PostActual:=[JOBS:26]Actual_TR:29  //added 05/03/07 -kmw
			$_bo_PostBudget:=[JOBS:26]Budget_TR:28  //added 05/03/07 -kmw
		Else   //SHOULDN'T HAPPEN!! (that no job yet exists for this Job Stage Personnel) However since it has - Make sure that whether we post to budget, actual and/or wip is decided in the same way as these values will be decided on the automatically created job that is to come
			JC_LoadPrefs  //added 08/03/07 -kmw
			$_bo_PostActual:=JC_bo_PostActualTime  //added 08/03/07 -kmw
			$_bo_PostBudget:=JC_bo_PostBudgetTime  //added 08/03/07 -kmw
		End if 
		
		Case of 
			: ($_bo_PostActual=False:C215) & ($_bo_PostBudget=False:C215)  //added 05/03/07 -kmw
				$0:=True:C214
				
			: (Records in selection:C76([JOB_STAGES:47])>1)  //SHOULDN'T HAPPEN!!!!!!!!!!!!!! (but may as well load the first job Stage found?)
				
				If (Check_Locked(->[JOB_STAGES:47]; 1))
					$0:=True:C214
				Else   //job stage locked so return false to let it have another go later
					[PROCESSES_TO_HANDLE:115]Comments:3:="Awaiting Record Lock"  //added kmw 02/03/07
					[PROCESSES_TO_HANDLE:115]Status:2:=-99  //added kmw 02/03/07 (ProcessServices detects and resets -99 to status 1)
					DB_SaveRecord(->[PROCESSES_TO_HANDLE:115])  //added kmw 02/03/07
					$0:=False:C215
				End if 
				
			: (Records in selection:C76([JOB_STAGES:47])=1)  //one job stage record found so load it
				If (Check_Locked(->[JOB_STAGES:47]; 1))
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
		
		If ($0=True:C214) & (Records in selection:C76([JOB_STAGES:47])>0) & (($_bo_PostActual) | ($_bo_PostBudget))  //Job Stage successfully found and loaded
			READ ONLY:C145([JOB PERSONNEL:48])
			READ ONLY:C145([ORDER_ITEMS:25])
			READ ONLY:C145([JOBS:26])
			//
			JC_UpdateJSAllTotals
			//
			DB_SaveRecord(->[JOB_STAGES:47])  //the above update routines don't actually issue a save so do so now
			UNLOAD RECORD:C212([JOB_STAGES:47])
			READ ONLY:C145([JOB_STAGES:47])
			
		End if 
		
	: ([PROCESSES_TO_HANDLE:115]ServiceType:6="***NOTUSED***JCUpdateJSPTotals")
		
		READ WRITE:C146([JOB PERSONNEL:48])
		QUERY:C277([JOB PERSONNEL:48]; [JOB PERSONNEL:48]X_ID:14=[PROCESSES_TO_HANDLE:115]RecordNumber:7)
		If (Records in selection:C76([JOB PERSONNEL:48])=0)
			[PROCESSES_TO_HANDLE:115]Comments:3:="Job Personnel record not found."
			[PROCESSES_TO_HANDLE:115]Status:2:=3
			DB_SaveRecord(->[PROCESSES_TO_HANDLE:115])
			$0:=True:C214
		Else 
			If (Check_Locked(->[JOB PERSONNEL:48]; 1))
				READ ONLY:C145([xDiaryRelations:137])
				READ ONLY:C145([DIARY:12])
				READ ONLY:C145([JOBS:26])
				//***********get selection of diary records by finding relations between this job personnel and any diary records ***********
				$_l_TableNumber:=Table:C252(->[JOB PERSONNEL:48])
				
				QUERY:C277([xDiaryRelations:137]; [xDiaryRelations:137]xTableNUM:3=$_l_TableNumber; *)
				QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]xRecordID:4=[JOB PERSONNEL:48]X_ID:14)
				$_l_NumofDiaryRelation:=Records in selection:C76([xDiaryRelations:137])
				Case of 
					: ($_l_NumofDiaryRelation=0)
						REDUCE SELECTION:C351([DIARY:12]; 0)
					: ($_l_NumofDiaryRelation=1)
						QUERY:C277([DIARY:12]; [DIARY:12]x_ID:50=[xDiaryRelations:137]xDiaryID:1)
					Else 
						SELECTION TO ARRAY:C260([xDiaryRelations:137]xDiaryID:1; $_al_DiaryIDS)
						QUERY WITH ARRAY:C644([DIARY:12]x_ID:50; $_al_DiaryIDS)
				End case 
				//***************************************************************************************
				QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Action_Code:9=<>TimeAct)  //reduce down to just TIME diary records (at some point this will be made more complicated because there will be more than one time action code)
				QUERY:C277([JOBS:26]; [JOBS:26]Job_Code:1=[JOB PERSONNEL:48]Job_Code:1)  //so we know if the job this job personnel belongs to allows posting actual or budget figures
				If ([JOBS:26]Actual_TR:29)
					JC_UpdateJSPActualTime  //use current selection of diary records to update actual totals on job personnel
				End if 
				If ([JOBS:26]Budget_TR:28)
					JC_UpdateJSPBudgetTime  //use current selection of diary records to update budget totals on job personnel
				End if 
				DB_SaveRecord(->[JOB PERSONNEL:48])  //the above update routines don't actually issue a save so do so now
				$0:=True:C214
			Else   //job personnel locked so return false to let it have another go later
				$0:=False:C215
			End if 
		End if 
		READ ONLY:C145([JOB PERSONNEL:48])
		//
	: ([PROCESSES_TO_HANDLE:115]ServiceType:6="***NOTUSED***JCAddJS")  //added 26/02/07 -kmw
		READ ONLY:C145([JOB PERSONNEL:48])
		QUERY:C277([JOB PERSONNEL:48]; [JOB PERSONNEL:48]X_ID:14=[PROCESSES_TO_HANDLE:115]RecordNumber:7)
		READ WRITE:C146([JOB_STAGES:47])
		CREATE RECORD:C68([JOB_STAGES:47])
		[JOB_STAGES:47]Job_Code:1:=[JOB PERSONNEL:48]Job_Code:1
		[JOB_STAGES:47]Stage_Code:2:=[JOB PERSONNEL:48]Stage_Code:2
		[JOB_STAGES:47]Job_Stage_code:52:=[JOB PERSONNEL:48]Job_stage_Code:17
		
		//********************** cheeky way of setting initial total on job personnel record ********************
		//can get away with this because we know there is only one diary record on the job personal and that it is also the only diary record in the current selection
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
	: ([PROCESSES_TO_HANDLE:115]ServiceType:6="***NOTUSED***")
		//first find out if there's already another ProcessToHandle record scheduled to cause an update on this particular record (ideally we would be able to do the check for this in the trigger before we even created any unncessary ProcessToHandle records)
		$_l_RecordNumber:=[PROCESSES_TO_HANDLE:115]RecordNumber:7
		$_d_DateCreated:=[PROCESSES_TO_HANDLE:115]DateCreated:4
		$_ti_TimeCreated:=[PROCESSES_TO_HANDLE:115]TimeCreated:5
		SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_NumberofRecords)
		QUERY:C277([PROCESSES_TO_HANDLE:115]; [PROCESSES_TO_HANDLE:115]RecordNumber:7=$_l_NumberofRecords; *)
		QUERY:C277([PROCESSES_TO_HANDLE:115];  & ; [PROCESSES_TO_HANDLE:115]ServiceType:6="JCUpdateJSPTotals"; *)
		QUERY:C277([PROCESSES_TO_HANDLE:115];  & ; [PROCESSES_TO_HANDLE:115]Status:2=1; *)
		QUERY:C277([PROCESSES_TO_HANDLE:115];  & ; [PROCESSES_TO_HANDLE:115]DateCreated:4<$_d_DateCreated; *)
		QUERY:C277([PROCESSES_TO_HANDLE:115];  & ; [PROCESSES_TO_HANDLE:115]TimeCreated:5<$_ti_TimeCreated)
		SET QUERY DESTINATION:C396(Into current selection:K19:1)
		If ($_l_NumberofRecords=0)  // if no other
			
		Else 
			
		End if 
End case 
UNLOAD RECORD:C212([DIARY:12])
UNLOAD RECORD:C212([JOB PERSONNEL:48])
UNLOAD RECORD:C212([xDiaryRelations:137])
UNLOAD RECORD:C212([JOBS:26])
ERR_MethodTrackerReturn("ProcessService_JobPersonnel"; $_t_oldMethodName)
