//%attributes = {}
If (False:C215)
	//Project Method Name:      ProcessService_Diary
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/09/2009 18:01
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(DM_al_DataSources;0)
	//ARRAY TEXT(DM_at_DataSources;0)
	C_BOOLEAN:C305($_bo_PostActual; $_bo_PostBudget; $_bo_PostWIP; $0; JC_bo_ActivateProcessServices; JC_bo_PostActualTime; JC_bo_PostBudgetTime; JC_bo_PostWIP)
	C_LONGINT:C283($_l_DataSourceRow; $_l_Delim1Pos; $_l_Delim2Pos; $_l_DiaryXID; $_l_ItemID; $_l_JobPersonID; $_l_ListID; $_l_Process; $_l_TableNumber)
	C_TEXT:C284(<>WIP_t_TRPTrans; <>WIP_t_TRWTrans; $_t_CompositeKey; $_t_DiaryJobCode; $_t_DiaryPersonCode; $_t_DiaryStageCode; $_t_JobCode; $_t_JobPersonCode; $_t_JobStageCode; $_t_oldMethodName; $_t_TransactionTypeCode)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ProcessService_Diary")
//ProcessService_Diary
// 16/04/02 pb
// Runs various methods called from trigger

Case of 
	: ([PROCESSES_TO_HANDLE:115]ServiceType:6="DMwebReceive")
		//TRACE
		
		//WE ARE NOT GOING TO PROCESS THE RECORD HERE!
		ARRAY LONGINT:C221(DM_al_DataSources; 0)
		ARRAY TEXT:C222(DM_at_DataSources; 0)
		ALERT:C41("from PROcessService_Diary")
		$_l_ListID:=AA_LoadListByName("Defined Data Sources"; ->DM_at_DataSources; ->DM_al_DataSources)
		$_l_DataSourceRow:=Find in array:C230(DM_at_DataSources; "Daybook Webserver")
		If ($_l_DataSourceRow<0)
			$_l_ItemID:=AA_ListAddItembyID($_l_ListID; "Daybook Webserver")
		End if 
		$_l_Process:=New process:C317("DM_DataRetreiveManager"; 512000; "Data RetreiveManager"; *)
		[PROCESSES_TO_HANDLE:115]Status:2:=-1
		DB_SaveRecord(->[PROCESSES_TO_HANDLE:115])
		$0:=True:C214
	: ([PROCESSES_TO_HANDLE:115]ServiceType:6="LinkItem")  //diary record remains  in read only mode
		QUERY:C277([DIARY:12]; [DIARY:12]x_ID:50=[PROCESSES_TO_HANDLE:115]RecordNumber:7)
		If (Records in selection:C76([DIARY:12])=0)
			[PROCESSES_TO_HANDLE:115]Comments:3:="Diary record not found."
			[PROCESSES_TO_HANDLE:115]Status:2:=3
			DB_SaveRecord(->[PROCESSES_TO_HANDLE:115])
			$0:=True:C214
		Else 
			$0:=WS_LINKDIARYITEM([DIARY:12]Diary_Code:3; [DIARY:12]Person:8)
		End if 
		
	: ([PROCESSES_TO_HANDLE:115]ServiceType:6="SendSMS")  // added 08/05/02 pb
		$0:=ProcessService_SendSMS
	: ([PROCESSES_TO_HANDLE:115]ServiceType:6="Set Reminder")  //
		READ ONLY:C145([DIARY:12])
		QUERY:C277([DIARY:12]; [DIARY:12]x_ID:50=[PROCESSES_TO_HANDLE:115]RecordNumber:7)
		If (Records in selection:C76([DIARY:12])=0)
			[PROCESSES_TO_HANDLE:115]Comments:3:="Diary record not found."
			[PROCESSES_TO_HANDLE:115]Status:2:=3
			DB_SaveRecord(->[PROCESSES_TO_HANDLE:115])
			$0:=True:C214
		Else 
			$0:=SD_Addtoreminders([DIARY:12]Diary_Code:3; [DIARY:12]Person:8)
		End if 
		SD_SendtoWorflow([DIARY:12]Diary_Code:3; [DIARY:12]Person:8)
	: ([PROCESSES_TO_HANDLE:115]ServiceType:6="UpdateWorkflow")  //
		//this is called when a record is created or modified-note the same thing happens when we set reminder now
		READ ONLY:C145([DIARY:12])
		QUERY:C277([DIARY:12]; [DIARY:12]x_ID:50=[PROCESSES_TO_HANDLE:115]RecordNumber:7)
		If (Records in selection:C76([DIARY:12])=0)
			[PROCESSES_TO_HANDLE:115]Comments:3:="Diary record not found."
			[PROCESSES_TO_HANDLE:115]Status:2:=3
			DB_SaveRecord(->[PROCESSES_TO_HANDLE:115])
			$0:=True:C214
		Else 
			$0:=SD_Addtoreminders([DIARY:12]Diary_Code:3; [DIARY:12]Person:8)
		End if 
		SD_SendtoWorflow([DIARY:12]Diary_Code:3; [DIARY:12]Person:8)
	: ([PROCESSES_TO_HANDLE:115]ServiceType:6="Remove Reminder")  //
		READ ONLY:C145([DIARY:12])
		QUERY:C277([DIARY:12]; [DIARY:12]x_ID:50=[PROCESSES_TO_HANDLE:115]RecordNumber:7)
		If (Records in selection:C76([DIARY:12])=0)
			[PROCESSES_TO_HANDLE:115]Comments:3:="Diary record not found."
			[PROCESSES_TO_HANDLE:115]Status:2:=3
			DB_SaveRecord(->[PROCESSES_TO_HANDLE:115])
			$0:=True:C214
		Else 
			$0:=SD_Addtoreminders([DIARY:12]Diary_Code:3; [DIARY:12]Person:8; False:C215)
		End if 
		
		SD_SendtoWorflow([DIARY:12]Diary_Code:3; [DIARY:12]Person:8)
		
		
	: ([PROCESSES_TO_HANDLE:115]ServiceType:6="JCAddDiary") | ([PROCESSES_TO_HANDLE:115]ServiceType:6="JCModDiary")  //added 27/02/07 -kmw
		If (JC_bo_ActivateProcessServices)
			$_l_DiaryXID:=[PROCESSES_TO_HANDLE:115]RecordNumber:7
			BLOB TO VARIABLE:C533([PROCESSES_TO_HANDLE:115]Data5Blob:12; $_t_CompositeKey)
			$_l_Delim1Pos:=Position:C15("*|Delim1|*"; $_t_CompositeKey)
			$_l_Delim2Pos:=Position:C15("*|Delim2|*"; $_t_CompositeKey)
			$_t_DiaryPersonCode:=Substring:C12($_t_CompositeKey; 1; ($_l_Delim1Pos-1))
			$_t_DiaryJobCode:=Substring:C12($_t_CompositeKey; ($_l_Delim1Pos+10); (($_l_Delim2Pos)-($_l_Delim1Pos+10)))
			$_t_DiaryStageCode:=Substring:C12($_t_CompositeKey; ($_l_Delim2Pos+10))
			
			READ WRITE:C146([JOB PERSONNEL:48])
			READ ONLY:C145([xDiaryRelations:137])
			
			JC_FindJSPFromTimeDiary($_l_DiaryXID; $_t_DiaryPersonCode; $_t_DiaryJobCode; $_t_DiaryStageCode)
			
			READ ONLY:C145([DIARY:12])
			
			READ ONLY:C145([JOBS:26])  //added 05/03/07 -kmw
			QUERY:C277([JOBS:26]; [JOBS:26]Job_Code:1=$_t_DiaryJobCode)  //added 05/03/07 -kmw
			If (Records in selection:C76([JOBS:26])>0)  //added 07/03/07 -kmw
				$_bo_PostActual:=[JOBS:26]Actual_TR:29  //added 05/03/07 -kmw
				$_bo_PostBudget:=[JOBS:26]Budget_TR:28  //added 05/03/07 -kmw
				$_bo_PostWIP:=[JOBS:26]Use_WIP:47  //added 07/03/07 -kmw
			Else   //SHOULDN'T HAPPEN!! (no job yet exists for this diary) However since it has - Make sure that whether we post to budget, actual and/or wip is decided in the same way as these values will be on the automatically created job that is to come
				JC_LoadPrefs  //added 07/03/07 -kmw
				$_bo_PostActual:=JC_bo_PostActualTime  //added 07/03/07 -kmw
				$_bo_PostBudget:=JC_bo_PostBudgetTime  //added 07/03/07 -kmw
				$_bo_PostWIP:=JC_bo_PostWIP  //added 07/03/07 -kmw
			End if 
			
			Case of 
				: ($_bo_PostActual=False:C215) & ($_bo_PostBudget=False:C215)  //added 05/03/07 -kmw
					$0:=True:C214
					
				: (Records in selection:C76([JOB PERSONNEL:48])>1)  //SHOULDN'T HAPPEN!!!!!!!!!!!!!! (but may as well load the first job personnel found?)
					
					If (Check_Locked(->[JOB PERSONNEL:48]; 1))
						$0:=True:C214
					Else   //job personnel locked so return false to let it have another go later
						[PROCESSES_TO_HANDLE:115]Comments:3:="Awaiting Record Lock"  //added kmw 02/03/07
						[PROCESSES_TO_HANDLE:115]Status:2:=-99  //added kmw 02/03/07 (ProcessServices detects and resets -99 to status 1)
						DB_SaveRecord(->[PROCESSES_TO_HANDLE:115])  //added kmw 02/03/07
						$0:=False:C215
					End if 
					
				: (Records in selection:C76([JOB PERSONNEL:48])=1)  //one job stage personnel record found so load it
					If (Check_Locked(->[JOB PERSONNEL:48]; 1))
						$0:=True:C214
					Else   //job personnel locked so return false to let it have another go later
						[PROCESSES_TO_HANDLE:115]Comments:3:="Awaiting Record Lock"  //added kmw 02/03/07
						[PROCESSES_TO_HANDLE:115]Status:2:=-99  //added kmw 02/03/07 (ProcessServices detects and resets -99 to status 1)
						DB_SaveRecord(->[PROCESSES_TO_HANDLE:115])  //added kmw 02/03/07
						$0:=False:C215
					End if 
					
				Else   //none found so create a new one using composite key values based on current diary record
					QUERY:C277([DIARY:12]; [DIARY:12]x_ID:50=$_l_DiaryXID)
					JC_AddJSPAsResultOfTimeDiary
					$0:=True:C214
			End case 
			
			If ($0=True:C214) & (($_bo_PostActual) | ($_bo_PostBudget))  //Job Personnel successfully loaded or a new one was created
				
				JC_UpdateJSPAllTotals
				
				DB_SaveRecord(->[JOB PERSONNEL:48])  //the above update routines don't actually issue a save so do so now
				
				
				READ ONLY:C145([JOB PERSONNEL:48])
				
				$_l_DiaryXID:=[PROCESSES_TO_HANDLE:115]RecordNumber:7
				$_l_JobPersonID:=[JOB PERSONNEL:48]X_ID:14
				
				$_l_TableNumber:=Table:C252(->[JOB PERSONNEL:48])
				//
				READ ONLY:C145([xDiaryRelations:137])
				QUERY:C277([xDiaryRelations:137]; [xDiaryRelations:137]xTableNUM:3=$_l_TableNumber; *)
				QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]xDiaryID:1=$_l_DiaryXID; *)
				QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]xRecordID:4=$_l_JobPersonID)
				
				Case of 
					: (Records in selection:C76([xDiaryRelations:137])=0)
						JC_AddDiaryTimeJSPRelation($_l_DiaryXID; $_l_JobPersonID)
					: (Records in selection:C76([xDiaryRelations:137])=1)
						//do nothing
					: (Records in selection:C76([xDiaryRelations:137])>1)  //shouldn't happen
						//TRACE
						//do nothing
				End case 
				
				
			End if 
			
			If ($_bo_PostWIP) & (<>WIP_t_TRPTrans#"") & (<>WIP_t_TRWTrans#"")  //added 09/03/07 -kmw
				JC_FindJSPFromTimeDiary($_l_DiaryXID; $_t_DiaryPersonCode; $_t_DiaryJobCode; $_t_DiaryStageCode)
				JC_FindJSFromJSP
				If (Records in selection:C76([JOB_STAGES:47])=0)
					$_t_TransactionTypeCode:=<>WIP_t_TRPTrans  //job stage for this job personnel has not yet been created so obviously can't have been invoiced yet
				Else 
					If ([JOB_STAGES:47]Invoice_Number:10="") | ([JOB_STAGES:47]Invoice_Number:10="N")
						$_t_TransactionTypeCode:=<>WIP_t_TRPTrans
					Else 
						$_t_TransactionTypeCode:=<>WIP_t_TRWTrans
					End if 
				End if 
				If ([PROCESSES_TO_HANDLE:115]ServiceType:6="JCModDiary")
					JC_PostReverseToWIP($_l_DiaryXID; $_t_TransactionTypeCode)
				End if 
				JC_PostToWIP($_l_DiaryXID; $_t_TransactionTypeCode)
			End if 
		Else 
			$0:=True:C214
		End if 
		//
	: ([PROCESSES_TO_HANDLE:115]ServiceType:6="JCDelDiary")  //added 28/02/07 -kmw
		//
		If (JC_bo_ActivateProcessServices)
			$_l_DiaryXID:=[PROCESSES_TO_HANDLE:115]RecordNumber:7
			BLOB TO VARIABLE:C533([PROCESSES_TO_HANDLE:115]Data5Blob:12; $_t_CompositeKey)
			$_l_Delim1Pos:=Position:C15("*|Delim1|*"; $_t_CompositeKey)
			$_l_Delim2Pos:=Position:C15("*|Delim2|*"; $_t_CompositeKey)
			$_t_DiaryPersonCode:=Substring:C12($_t_CompositeKey; 1; ($_l_Delim1Pos-1))
			$_t_DiaryJobCode:=Substring:C12($_t_CompositeKey; ($_l_Delim1Pos+10); (($_l_Delim2Pos)-($_l_Delim1Pos+10)))
			$_t_DiaryStageCode:=Substring:C12($_t_CompositeKey; ($_l_Delim2Pos+10))
			
			READ WRITE:C146([JOB PERSONNEL:48])
			READ ONLY:C145([xDiaryRelations:137])
			
			JC_FindJSPFromTimeDiary($_l_DiaryXID; $_t_JobPersonCode; $_t_JobCode; $_t_JobStageCode)
			
			READ ONLY:C145([DIARY:12])
			
			READ ONLY:C145([JOBS:26])
			QUERY:C277([JOBS:26]; [JOBS:26]Job_Code:1=$_t_DiaryJobCode)  //added 05/03/07 -kmw
			If (Records in selection:C76([JOBS:26])>0)
				$_bo_PostActual:=[JOBS:26]Actual_TR:29  //added 05/03/07 -kmw
				$_bo_PostBudget:=[JOBS:26]Budget_TR:28  //added 05/03/07 -kmw
				$_bo_PostWIP:=[JOBS:26]Use_WIP:47  //added 07/03/07 -kmw
			Else   //SHOULDN'T HAPPEN!! (that no job yet exists for this diary) However since it has - Make sure that whether we post to budget, actual and/or wip is decided in the same way as these values will be decided on the automatically created job that is to come
				JC_LoadPrefs  //added 07/03/07 -kmw
				$_bo_PostActual:=JC_bo_PostActualTime  //added 07/03/07 -kmw
				$_bo_PostBudget:=JC_bo_PostBudgetTime  //added 07/03/07 -kmw
				$_bo_PostWIP:=JC_bo_PostWIP  //added 07/03/07 -kmw
			End if 
			
			
			Case of 
				: ($_bo_PostActual=False:C215) & ($_bo_PostBudget=False:C215)  //added 05/03/07 -kmw
					$0:=True:C214
					
				: (Records in selection:C76([JOB PERSONNEL:48])>1)  //SHOULDN'T HAPPEN!!!!!!!!!!!!!! (but may as well load the first job Stage found?)
					
					If (Check_Locked(->[JOB PERSONNEL:48]; 1))
						$0:=True:C214
					Else   //job personnel locked so return false to let it have another go later
						[PROCESSES_TO_HANDLE:115]Comments:3:="Awaiting Record Lock"  //added kmw 02/03/07
						[PROCESSES_TO_HANDLE:115]Status:2:=-99  //added kmw 02/03/07 (ProcessServices detects and resets -99 to status 1)
						DB_SaveRecord(->[PROCESSES_TO_HANDLE:115])  //added kmw 02/03/07
						$0:=False:C215
					End if 
					
				: (Records in selection:C76([JOB PERSONNEL:48])=1)  //one job stage personnel record found so load it
					If (Check_Locked(->[JOB PERSONNEL:48]; 1))
						$0:=True:C214
					Else   //job personnel locked so return false to let it have another go later
						[PROCESSES_TO_HANDLE:115]Comments:3:="Awaiting Record Lock"  //added kmw 02/03/07
						[PROCESSES_TO_HANDLE:115]Status:2:=-99  //added kmw 02/03/07 (ProcessServices detects and resets -99 to status 1)
						DB_SaveRecord(->[PROCESSES_TO_HANDLE:115])  //added kmw 02/03/07
						$0:=False:C215
					End if 
					
				Else   //none found so do nothing
					//do nothing
					$0:=True:C214
			End case 
			
			If ($0=True:C214) & (Records in selection:C76([JOB PERSONNEL:48])>0) & (($_bo_PostActual) | ($_bo_PostBudget))  //Job Personnel successfully found and loaded
				
				JC_UpdateJSPAllTotals
				
				DB_SaveRecord(->[JOB PERSONNEL:48])  //the above update routines don't actually issue a save so do so now
				
				READ ONLY:C145([JOB PERSONNEL:48])
				
				$_l_DiaryXID:=[PROCESSES_TO_HANDLE:115]RecordNumber:7
				$_l_JobPersonID:=[JOB PERSONNEL:48]X_ID:14
				
				//JC_DelDiaryTimeJSPRelation
				JC_DelDiaryTimeJSPRelation($_l_DiaryXID; $_l_JobPersonID)  //corrected bug where wasn't passing either of the two parameters 27/03/07 -kmw
				
			End if 
			
			If ($_bo_PostWIP) & (<>WIP_t_TRPTrans#"") & (<>WIP_t_TRWTrans#"")  //added 09/03/07 -kmw
				JC_FindJSPFromTimeDiary($_l_DiaryXID; $_t_DiaryPersonCode; $_t_DiaryJobCode; $_t_DiaryStageCode)
				JC_FindJSFromJSP
				If ([JOB_STAGES:47]Invoice_Number:10="") | ([JOB_STAGES:47]Invoice_Number:10="N")
					$_t_TransactionTypeCode:=<>WIP_t_TRPTrans
				Else 
					$_t_TransactionTypeCode:=<>WIP_t_TRWTrans
				End if 
				JC_PostReverseToWIP($_l_DiaryXID; $_t_TransactionTypeCode)
			End if 
		Else 
			$0:=True:C214
		End if 
	: ([PROCESSES_TO_HANDLE:115]ServiceType:6="***NOTUSED***JCAddJSP")  //added 26/02/07 -kmw
		READ ONLY:C145([DIARY:12])
		QUERY:C277([DIARY:12]; [DIARY:12]x_ID:50=[PROCESSES_TO_HANDLE:115]RecordNumber:7)
		READ WRITE:C146([JOB PERSONNEL:48])
		CREATE RECORD:C68([JOB PERSONNEL:48])
		[JOB PERSONNEL:48]Person:3:=[DIARY:12]Person:8
		[JOB PERSONNEL:48]Job_Code:1:=[DIARY:12]Job_Code:19
		[JOB PERSONNEL:48]Stage_Code:2:=[DIARY:12]Stage_Code:21
		[JOB PERSONNEL:48]Job_stage_Code:17:=[DIARY:12]Stage_Code:21  //[DIARY]job Stage Code `(no [diary]job stage code as yet)
		//********************** cheeky way of setting initial total on job stage record ********************
		//can get away with this because we know there is only one job personnel record on the job personal and that it is also the only job personnel record in the current selection
		READ ONLY:C145([JOBS:26])
		QUERY:C277([JOBS:26]; [JOBS:26]Job_Code:1=[JOB PERSONNEL:48]Job_Code:1)  //so we know if the job this job personnel belongs to allows posting actual or budget figures
		
		If ([JOBS:26]Actual_TR:29)
			JC_UpdateJSPActualTime  //use current selection of diary records to update actual totals on job personnel
		End if 
		If ([JOBS:26]Budget_TR:28)
			JC_UpdateJSPBudgetTime  //use current selection of diary records to update budget totals on job personnel
		End if 
		//********************************************************************************
		DB_SaveRecord(->[JOB PERSONNEL:48])
		READ ONLY:C145([JOB PERSONNEL:48])
		
		ProcessServices_CreateRecord(->[DIARY:12]; ->[DIARY:12]x_ID:50; "JCAddTimeJSPRelation")  //adds record and sets initial total
		
		$0:=True:C214
End case 

UNLOAD RECORD:C212([DIARY:12])
UNLOAD RECORD:C212([PERSONNEL:11])
UNLOAD RECORD:C212([DIARY_ITEMOWNERS:106])
UNLOAD RECORD:C212([COMPANIES:2])
UNLOAD RECORD:C212([JOB PERSONNEL:48])  //added 26/02/07 -kmw (cen be newly created or modified)
UNLOAD RECORD:C212([xDiaryRelations:137])  //added 27/02/07 -kmw (can be newly created)

UNLOAD RECORD:C212([JOBS:26])  //added 27/02/07 -kmw (just in case)
ERR_MethodTrackerReturn("ProcessService_Diary"; $_t_oldMethodName)
