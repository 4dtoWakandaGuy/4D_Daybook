//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_CreateLinkedDiaryThread
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009`Method: SD2_CreateLinkedDiaryThread
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_JTClasses; 0)
	//ARRAY LONGINT(JOB_al_RelateAutoAdd;0)
	ARRAY TEXT:C222($_at_JTCodes; 0)
	//ARRAY TEXT(JOB_at_JobClassName;0)
	//ARRAY TEXT(JOB_at_JobCodes;0)
	//ARRAY TEXT(JOB_at_RelatedStageCodes;0)
	C_BOOLEAN:C305(<>SD2_ServiceCallCostingActive; $_bo_Create)
	C_DATE:C307(<>SD_D_serviceCallCostActiveFrom)
	C_LONGINT:C283($_l_Index; $_l_JobClassRow; $_l_JobTypeRow; $_l_TableNumber; $_l_TypeIndex; $0; $1; $2)
	C_TEXT:C284($_t_JobType; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_CreateLinkedDiaryThread")
//This method will run as the result of a call from the trigger of any table you like..as long as this table is set to handle the threading from that table
//Initially this will work from the Service calls, Jobs, and job stages tables.
//first we need to know which table
If (Count parameters:C259>=2)
	$_l_TableNumber:=$1
	Case of 
		: ($_l_TableNumber=Table:C252(->[SERVICE_CALLS:20]))
			If ($2>0)  // THE SERVICE CALL ID is set
				If ([SERVICE_CALLS:20]x_ID:27#$2)
					QUERY:C277([SERVICE_CALLS:20]; [SERVICE_CALLS:20]x_ID:27=$2)
				End if 
				QUERY:C277([xDiaryRelations:137]; [xDiaryRelations:137]xTableNUM:3=$_l_TableNumber; *)
				QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]xRecordID:4=$2)
				$_bo_Create:=False:C215
				If (Records in selection:C76([xDiaryRelations:137])=0)
					//NO LINKED DIARY THREAD EXISTS.
					//SO WE WILL CREATE THE THREAD..AND FIND ANY LINKED DIARY RECORDS WHERE
					//[DIARY]Call Code=[SERVICE CALLS]Call Code this will be very useful for linking up the old records!
					$_bo_Create:=True:C214
					
					//Now Put other diary records relating to this thread into the thread
				Else 
					//is the 'link' record in exisstance.
					RELATE ONE SELECTION:C349([xDiaryRelations:137]; [DIARY:12])
					QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Action_Code:9="SVS")
					If (Records in selection:C76([DIARY:12])=0)
						$_bo_Create:=True:C214
					Else 
						//Just make sure it is up to date
					End if 
				End if 
				If ($_bo_Create)
					CREATE RECORD:C68([DIARY:12])
					//ok so here we have a hard coded action..this action needs to exist in the actions table BUT
					// the action class ensures it is hidden fromt the user-so no modifications to the record
					SD2_CheckDefaultAction("SVS")
					[DIARY:12]Action_Code:9:="SVS"
					[DIARY:12]Action_Details:10:=[SERVICE_CALLS:20]Problem_Description:15
					[DIARY:12]Subject:63:="Service Call"+[SERVICE_CALLS:20]Call_Code:4
					//[DIARY]ThreadID:=AA_GetNextID (->[DIARY]ThreadID)  ` new thread was but changed in stock version?
					[DIARY:12]x_ID:50:=AA_GetNextID(->[DIARY:12]x_ID:50)  // new thread
					$0:=[DIARY:12]x_ID:50
					[DIARY:12]Call_Code:25:=[SERVICE_CALLS:20]Call_Code:4
					[DIARY:12]Company_Code:1:=[SERVICE_CALLS:20]Company_Code:1
					[DIARY:12]Contact_Code:2:=[SERVICE_CALLS:20]Contact_Code:2
					[DIARY:12]Date_Do_From:4:=[SERVICE_CALLS:20]Call_Date:5
					[DIARY:12]Time_Do_From:6:=[SERVICE_CALLS:20]Call_Time:6
					Trigger_setDiaryDateStamp
					Trigger_setDiaryTimeStamp
					DiarySetCode
					[DIARY:12]Display_Date_From:51:=[SERVICE_CALLS:20]Call_Date:5
					[DIARY:12]Display_Date_To:52:=!00-00-00!
					Trigger_setDiaryDisplayData
					[DIARY:12]Display_Time_From:53:=[SERVICE_CALLS:20]Call_Time:6
					[DIARY:12]Display_Time_To:54:=?00:00:00?
					[DIARY:12]Job_Code:19:=""  //because we will be creating the job too
					TRG_DiaryOrlDatetimeStamp
					
					[DIARY:12]Originator:23:=[SERVICE_CALLS:20]Person:11
					[DIARY:12]Person:8:=[SERVICE_CALLS:20]Person:11
					QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=[DIARY:12]Person:8)
					[DIARY:12]PersonID:56:=[PERSONNEL:11]Personnel_ID:48
					UNLOAD RECORD:C212([PERSONNEL:11])
					//[DIARY]Priority
					Diary_PersPrior
					DB_SaveRecord(->[DIARY:12])
					CREATE RECORD:C68([xDiaryRelations:137])
					[xDiaryRelations:137]xTableNUM:3:=$_l_TableNumber
					[xDiaryRelations:137]xRecordID:4:=$2
					[xDiaryRelations:137]XRecord_Code:5:=[SERVICE_CALLS:20]Call_Code:4
					[xDiaryRelations:137]xDiaryID:1:=[DIARY:12]x_ID:50
					DB_SaveRecord(->[xDiaryRelations:137])
					
					If (<>SD2_ServiceCallCostingActive)  // Service Call Job costing is active-
						If (<>SD_D_serviceCallCostActiveFrom>[SERVICE_CALLS:20]Call_Date:5)  // and the call is within the date.
							
							//Create a Job too for this service call
							If ([SERVICE_CALLS:20]CallTypeID:26=0)
								JOB_loadJobTypeClasses
								$_l_JobClassRow:=Find in array:C230(JOB_at_JobClassName; "Service Call Management")
								ALL RECORDS:C47([JOB_TYPES:65])
								SELECTION TO ARRAY:C260([JOB_TYPES:65]Type_Code:1; $_at_JTCodes; [JOB_TYPES:65]TypeClass:12; $_al_JTClasses)
								$_t_JobType:=""
								For ($_l_Index; 1; Size of array:C274($_al_JTClasses))
									If ($_al_JTClasses{$_l_Index} ?? $_l_JobClassRow)
										$_t_JobType:=$_at_JTCodes{$_l_Index}
										$_l_Index:=999999
									End if 
								End for 
							Else 
								//The job type will be determined by the service call type..the sc type is determined by the Contract type
							End if 
							
							//Here get the stages to auto-create
							QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[SERVICE_CALLS:20]Company_Code:1)
							JOB_LoadStageTypeLinks
							CREATE RECORD:C68([JOBS:26])
							[JOBS:26]Job_Type:21:=$_t_JobType
							Jobs_Code
							[JOBS:26]Job_Name:2:="Service Call "+[SERVICE_CALLS:20]Call_Code:4
							[JOBS:26]Contact_Code:4:=[SERVICE_CALLS:20]Contact_Code:2
							[JOBS:26]Company_Code:3:=[SERVICE_CALLS:20]Company_Code:1
							[JOBS:26]Start_Date:6:=[SERVICE_CALLS:20]Call_Date:5
							[JOBS:26]Person:19:=[SERVICE_CALLS:20]Person:11
							States_CUArr(->[JOBS:26]State:9)
							[JOBS:26]Terms:14:=[COMPANIES:2]SL_Terms:40
							[JOBS:26]x_ID:49:=AA_GetNextID(->[JOBS:26]x_ID:49)
							DB_SaveRecord(->[JOBS:26])
							//Create the header record for this in the diary here
							
							If ([JOBS:26]Job_Type:21#"")
								$_l_JobTypeRow:=Find in array:C230(JOB_at_JobCodes; [JOBS:26]Job_Type:21)  //NG This does not look correct
								If ($_l_JobTypeRow>0)
									For ($_l_TypeIndex; 1; Size of array:C274(JOB_al_RelateAutoAdd{$_l_JobTypeRow}))
										If (JOB_al_RelateAutoAdd{$_l_JobTypeRow}{$_l_Index}=1)
											//Create a job stage
											CREATE RECORD:C68([JOB_STAGES:47])
											[JOB_STAGES:47]Job_Code:1:=[JOBS:26]Job_Code:1
											[JOB_STAGES:47]Stage_Code:2:=JOB_at_RelatedStageCodes{$_l_JobTypeRow}{$_l_Index}
											QUERY:C277([STAGES:45]; [STAGES:45]Stage_Code:1=JOB_at_RelatedStageCodes{$_l_JobTypeRow}{$_l_Index})
											[JOB_STAGES:47]Stage_Name:3:=[STAGES:45]Stage_Name:2
											//here we will put in the rates for the job stage.
											//remember too in our new model each stage may have multiple diary items related to it
											//so we create a diary item belonging to the THREAD for the job
										End if 
									End for 
								End if 
								
							End if 
							//[JOBS]Currency Code
							
							//[JOBS]Job Type  `note that we now need to filter job types
						End if 
						
					End if 
				Else 
					$0:=[DIARY:12]x_ID:50
					
				End if 
				
			End if 
	End case 
End if 
ERR_MethodTrackerReturn("SD2_CreateLinkedDiaryThread"; $_t_oldMethodName)