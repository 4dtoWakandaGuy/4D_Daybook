//%attributes = {}
If (False:C215)
	//Project Method Name:      QuitCheckUserProcsRunning
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/04/2010 13:39
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>PRC_al_ProcessNum;0)
	//ARRAY LONGINT(<>PRC_al_ProcessState;0)
	//ARRAY LONGINT(<>PRC_al_UniqueID;0)
	//ARRAY LONGINT(<>PRC_al_WindowReference;0)
	C_BOOLEAN:C305($_bo_Abort; $_bo_ProcessVisible; $0; DB_bo_AlertReply; DB_bo_AlertTimeOut; SD_bo_AlarmsEnd)
	C_LONGINT:C283(<>newSetsProcess; $_l_CountProcesses; $_l_DiaryManagerProcess; $_l_IgnoreProcess; $_l_ProcessIndex; $_l_ProcessRow; $_l_ProcessState; $_l_ProcessTime; $_l_UniqueProcessID; $_l_WindowReference; $_l_WindowRegisterRow)
	C_LONGINT:C283($_l_ProcessNumber; DB_l_SetTimeOut; SD3_l_DiaryActionNum; SM_l_MonitorCall)
	C_TEXT:C284($_t_oldMethodName; $_t_ProcessName; $_t_SDProcName)
End if 
//Code Starts Here

//``
$_t_oldMethodName:=ERR_MethodTracker("QuitCheckUserProcsRunning")
// QuitCheckUserProcsRunning
// 25/04/02 pb
// Returns TRUE if it is OK to quit; FALSE if not

//C_LONGINT($_l_Process)
//C_LONGINT($COUNT)

//ALERT("Hello 2")

$0:=True:C214
$_l_IgnoreProcess:=Process_No("$ScreenSaveWin")
If ($_l_IgnoreProcess=0)
	$_l_IgnoreProcess:=-999999
End if 
//Repeat
$_l_CountProcesses:=Count user processes:C343
$_l_DiaryManagerProcess:=0
PROC_SetProcess(0)  //Just to make sure this is inited
For ($_l_ProcessIndex; 1; $_l_CountProcesses)
	IDLE:C311
	$_l_WindowRegisterRow:=Find in array:C230(<>PRC_al_ProcessNum; $_l_ProcessIndex)
	If ($_l_WindowRegisterRow>0)
		$_l_WindowReference:=<>PRC_al_WindowReference{$_l_WindowRegisterRow}
		RESUME PROCESS:C320($_l_ProcessIndex)
		
		PROCESS PROPERTIES:C336($_l_ProcessIndex; $_t_SDProcName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible; $_l_UniqueProcessID)
		
		//   If ($$_l_ProcessState>0)
		$_bo_Abort:=False:C215
		If ($_l_ProcessState>=0) & ($_l_UniqueProcessID=<>PRC_al_UniqueID{$_l_WindowRegisterRow})  // 25/04/02 pb
			Case of 
				: ($_l_ProcessIndex=Current process:C322)
					//   : (Position("View SuperDiary";$_t_SDProcName)>0)
				: ((Position:C15("View SuperDiary"; $_t_SDProcName)>0) & ($_bo_ProcessVisible=False:C215))
					$_l_DiaryManagerProcess:=$_l_ProcessIndex
					If ($_l_DiaryManagerProcess>0)  // only stop the diary process if it is OK to shut down
						PROCESS PROPERTIES:C336($_l_DiaryManagerProcess; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)  // 30/05/02 pb
						If ($_l_ProcessState>=0)  // 30/05/02 pb
							SET PROCESS VARIABLE:C370($_l_DiaryManagerProcess; SD3_l_DiaryActionNum; -1)
							RESUME PROCESS:C320($_l_DiaryManagerProcess)
							POST OUTSIDE CALL:C329($_l_DiaryManagerProcess)
						End if 
						DelayTicks(60)
					End if 
					
				: ((Position:C15("View SuperDiary"; $_t_SDProcName)>0) & ($_bo_ProcessVisible))
					$_bo_Abort:=True:C214
				: (Position:C15("Macro FKey"; $_t_SDProcName)>0)
					
				: (Position:C15("Diary reminders"; $_t_SDProcName)>0)
					PROCESS PROPERTIES:C336($_l_ProcessIndex; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)  // 30/05/02 pb
					If ($_l_ProcessState>=0)  // 30/05/02 pb
						SET PROCESS VARIABLE:C370($_l_ProcessIndex; SD_bo_AlarmsEnd; True:C214)
						RESUME PROCESS:C320($_l_ProcessIndex)
						POST OUTSIDE CALL:C329($_l_ProcessIndex)
						DelayTicks(60)
					End if 
				: (Position:C15("Diary reminders"; $_t_SDProcName)>0)
				: (Position:C15("Set Manager"; $_t_SDProcName)>0)
					$_bo_Abort:=False:C215
					Repeat 
						SM_l_MonitorCall:=9999
						SET PROCESS VARIABLE:C370(<>newSetsProcess; SM_l_MonitorCall; SM_l_MonitorCall)
						POST OUTSIDE CALL:C329($_l_ProcessIndex)
						PROCESS PROPERTIES:C336($_l_ProcessIndex; $_t_SDProcName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible)
						DelayTicks(10)
					Until ($_l_ProcessState<0)
				: (Position:C15("Startup macros"; $_t_SDProcName)>0)  // 25/04/02 pb
					// ignore this dude
					
				: ($_l_ProcessIndex#$_l_IgnoreProcess)
					$_bo_Abort:=True:C214
					
			End case 
			
			If ($_bo_Abort)
				PROC_SetProcess(0)  //Just to make sure this is inited
				$_l_ProcessRow:=Find in array:C230(<>PRC_al_ProcessNum; $_l_ProcessIndex)
				If ($_l_ProcessRow>0)
					If (<>PRC_al_WindowReference{$_l_ProcessRow}#0) & (<>PRC_al_ProcessState{$_l_ProcessRow}>=0)
						
						RESUME PROCESS:C320($_l_ProcessIndex)
						//◊ButtPress:="OK"  ` not sure why this is needed ...
						POST OUTSIDE CALL:C329($_l_ProcessIndex)
						DelayTicks(10)  // not needed?
						SHOW PROCESS:C325($_l_ProcessIndex)
						BRING TO FRONT:C326($_l_ProcessIndex)
						DB_l_SetTimeOut:=120  //20 seconds for testing 20 mins for real
						DB_bo_AlertTimeOut:=True:C214
						DB_bo_AlertReply:=False:C215
						
						Gen_Alert("Please close all windows before you Quit!")
						If (Not:C34(DB_bo_AlertReply))
							$0:=False:C215
							
						End if 
						$_l_ProcessIndex:=$_l_CountProcesses
						DB_bo_AlertReply:=False:C215
					End if 
				End if 
			End if 
		End if 
		
	Else   // $_l_ProcessIndex was not found in ◊PRC_al_ProcessNum
		// never mind!
	End if   // find in array(◊PRC_al_ProcessNum;$_l_ProcessIndex)
	
End for   // count tasks
ERR_MethodTrackerReturn("QuitCheckUserProcsRunning"; $_t_oldMethodName)
