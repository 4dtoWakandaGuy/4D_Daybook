//%attributes = {}

If (False:C215)
	//Project Method Name:      Process_Manager
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>MenuFront; <>SYS_bo_QuitCalled)
	C_LONGINT:C283(<>AutoProc; <>MenuProc; $_l_BarProcess; $_l_CurrentProcess; $_l_CurrentTime; $_l_FrontMostProcess; $_l_LastMonitor)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Process_Manager")

While (Test semaphore:C652("$DuringLogin"))  //this is being used to prevent the menu stuff happening during startup
	DelayTicks
End while 

If (<>MenuProc=0)
	<>MenuProc:=1
End if 
$_l_CurrentProcess:=Current process:C322
$_l_LastMonitor:=Current time:C178*1
While (<>AutoProc#999999999) & (Not:C34(<>SYS_bo_QuitCalled))
	$_l_FrontMostProcess:=Frontmost process:C327(*)
	If (Process state:C330($_l_FrontMostProcess)=5)
		//RESUME PROCESS($_l_FrontMostProcess)
		
	End if 
	
	If (<>MenuFront)
		If ($_l_FrontMostProcess#<>MenuProc)
			<>MenuFront:=False:C215
			$_l_BarProcess:=Get_ProcessNumber("Modules_Palette")
			If ($_l_BarProcess#0)
				If (Application type:C494#4D Server:K5:6)
					//$_t_oldMethodName:=ERR_MethodTracker("Process_Manager")
					POST OUTSIDE CALL:C329($_l_BarProcess)
				End if 
			End if 
		End if 
	Else 
		If ($_l_FrontMostProcess=<>MenuProc)
			// If (Not(Semaphore("$ButtDis")))
			<>MenuFront:=True:C214
			
		End if 
		//end if
		//CLEAR SEMAPHORE("$ButtDis")
	End if 
	$_l_CurrentTime:=Current time:C178*1
	If ($_l_CurrentTime>($_l_LastMonitor+10)) | ($_l_CurrentTime<($_l_LastMonitor)) & (Not:C34(<>SYS_bo_QuitCalled))
		Process_Monitor
		
		$_l_LastMonitor:=Current time:C178*1
	End if 
	CLEAR SEMAPHORE:C144("$procArr")
	DelayTicks(60*5)  //3 seconds
End while 
ERR_MethodTrackerReturn("Process_Manager"; $_t_oldMethodName)
