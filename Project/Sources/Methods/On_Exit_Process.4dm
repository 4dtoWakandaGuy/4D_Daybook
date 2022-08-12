//%attributes = {}
If (False:C215)
	//Project Method Name:      On_Exit_Process
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2013 12:28
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By 
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>SYS_al_ModifiedTable;0)
	C_BOOLEAN:C305(<>holdQuit; <>LIC_bo_skipVersionControlOnExit; <>ProcessServicesActive; <>SM_isHidden; <>SM_OUTPUTDELAY; <>SYS_bo_DataChangeLog; <>SYS_bo_QuitCalled; $_bo_Exit)
	C_LONGINT:C283(<>ButtProc; <>newSetsProcess; <>ProcessServicesActiveCOUNT; $_l_ApplicationType; $_l_CurrentTime; $_l_Process; $_l_ProcessState; $_l_ProcessTime; $_l_Repeats; $_l_TableIndex; DB_l_SetTimeOut)
	C_TEXT:C284($_t_oldMethodName; $_t_oldMethodName2; $_t_processName)
	C_TIME:C306($_ti_Time)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("On_Exit_Process")


If (<>holdQuit)
	Repeat 
		DelayTicks(10)
	Until (<>holdQuit=False:C215)
	FLUSH CACHE:C297
	
End if 

If (Not:C34(<>SYS_bo_QuitCalled))  //& (Compiled application)
	<>SYS_bo_QuitCalled:=True:C214
	
	
	While (Not:C34(QuitCheckUserProcsRunning))
		IDLE:C311
		
		$_l_CurrentTime:=Current time:C178*1
		Repeat 
			If (QuitCheckUserProcsRunning)
				$_l_CurrentTime:=$_l_CurrentTime-((60*60)+60)
				DelayTicks(60)
			End if 
		Until ((Current time:C178*1)>($_l_CurrentTime+(60*60)))
	End while 
	//NG Feb 2005..end other processes
	
End if 
$_l_ApplicationType:=Application type:C494
DB_l_SetTimeOut:=20*60  //20 seconds for testing 20 mins for real


If ($_l_ApplicationType=4D Remote mode:K5:5)
	UNREGISTER CLIENT:C649
	$_t_oldMethodName2:=ERR_MethodTracker("UregisterClient")
	
End if 

<>SYS_bo_QuitCalled:=True:C214
<>SYS_bo_QuitCalled:=True:C214  // 09/05/02 pb

PROCESS PROPERTIES:C336(<>NewSetsProcess; $_t_processName; $_l_ProcessState; $_l_ProcessTime)
If ($_t_processName#"Set Manager")
	<>newSetsProcess:=0
Else 
	If ($_l_ProcessState<0)
		<>newSetsProcess:=0
	End if 
End if 

If (<>newSetsProcess>0)
	<>SM_OUTPUTDELAY:=True:C214
	PROCESS PROPERTIES:C336(<>newSetsProcess; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)  // 30/05/02 pb
	If ($_l_ProcessState>=0)  // 30/05/02 pb
		SET PROCESS VARIABLE:C370(<>newSetsProcess; SM_l_MonitorCall; 9999)
		POST OUTSIDE CALL:C329(<>newSetsProcess)
		$_l_Repeats:=0
		Repeat 
			IDLE:C311
			//BEEP
			POST OUTSIDE CALL:C329(<>newSetsProcess)
			$_l_Repeats:=$_l_Repeats+1
			If ($_l_Repeats>100)
				<>SM_isHidden:=False:C215
				If (<>NewSetsProcess>0)
					SHOW PROCESS:C325(<>NewSetsProcess)
					BRING TO FRONT:C326(<>NewSetsProcess)
				End if 
			End if 
		Until (<>SM_OUTPUTDELAY=False:C215) | (<>newSetsProcess=0)
	End if 
End if 

If (Not:C34(Undefined:C82(<>SYS_al_ModifiedTable)))
	
	If (Application type:C494<4)
		//FSetting_savePreferences (◊user;->◊FS_at_FormReferences;->◊FS_al_FormSortDirection;->◊FS_al_FormSortFieldNum;->◊FS_al_FormSortTableNum;->◊FS_at_FormSortvariable;->◊FS_S55_FormSortTextLabelName;->◊FS_S55_FormSortvariableLabelNam)
		If (False:C215)
			$_t_oldMethodName2:=ERR_MethodTracker("SaveFormSettings")
			$_l_Process:=New process:C317("FSetting_savePreferences"; 256000; "Save form settings"; *)
			Repeat 
				If (Process state:C330($_l_Process)>=0)
					DelayTicks(30)
					
				End if 
				
			Until (Process state:C330($_l_Process)<0)
		End if 
		$_t_oldMethodName2:=ERR_MethodTracker("Checkuserst")
		$_l_Process:=New process:C317("PW_CHECKUSERS"; 256000; "Saving Passwords")
		Repeat 
			If (Process state:C330($_l_Process)>=0)
				DelayTicks(30)
				
			End if 
			
		Until (Process state:C330($_l_Process)<0)
		
		If (<>SYS_bo_DataChangeLog)
			$_t_oldMethodName2:=ERR_MethodTracker("Datalog")
			
			Repeat 
				IDLE:C311  // 25/04/02 pb
				
				$_bo_Exit:=True:C214
				For ($_l_TableIndex; 1; Size of array:C274(<>SYS_al_ModifiedTable))
					IDLE:C311
					If (<>SYS_al_ModifiedTable{$_l_TableIndex}>0)
						$_bo_Exit:=False:C215
						
					End if 
				End for 
				
				If ($_bo_Exit=False:C215)
					CONFIRM:C162("Shut Down is delayed whilst data-logs are written"; "Wait"; "Exit now")
					If (ok=0)
						$_bo_Exit:=True:C214
					Else 
						$_ti_Time:=Current time:C178
						Repeat 
							
							DelayTicks(60)  // 'cos  doesn't work in User process
						Until (Current time:C178>=$_ti_Time+60)
						
					End if 
				End if 
			Until ($_bo_Exit=True:C214)
			
		End if 
	Else 
		If (False:C215)
			$_t_oldMethodName2:=ERR_MethodTracker("SaveFormSettings")
			$_l_Process:=New process:C317("FSetting_savePreferences"; 256000; "Save form settings"; *)
			Repeat 
				If (Process state:C330($_l_Process)>=0)
					DelayTicks(30)
					
				End if 
				
			Until (Process state:C330($_l_Process)<0)
		End if 
		
	End if 
End if 
$_t_oldMethodName2:=ERR_MethodTracker("ProcessesActive")

If (ApplicationType_isSingleUser)  // 16/4/0
	While (<>ProcessServicesActive) | (<>ProcessServicesActiveCOUNT>0)  //16/4/02 pb
		
		DelayTicks(60)  // 'cos  doesn't work in User process
	End while 
End if 
$_t_oldMethodName2:=ERR_MethodTracker("Splash")
SPLASH_UPDATE("Finishing ..."; 100; -1; False:C215)  //-1 as $3 will stop splash screen

If (Not:C34(<>LIC_bo_skipVersionControlOnExit))
	$_t_oldMethodName2:=ERR_MethodTracker("Version")
	VER_ONEXIT
	
End if 
ERR_MethodTrackerReturn("On_Exit_Process"; $_t_oldMethodName)
