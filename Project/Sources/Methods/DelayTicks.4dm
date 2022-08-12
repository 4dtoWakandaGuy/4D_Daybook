//%attributes = {}

If (False:C215)
	//Project Method Name:      DelayTicks
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
	C_BOOLEAN:C305(<>SYS_bo_QuitCalled)
	C_LONGINT:C283($_l_ApplicationType; $_l_Delay; $_l_EndTicks; $_l_StartTicks)
	C_REAL:C285($1)
	C_TEXT:C284($_t_oldMethodName; $_t_ProcessName)
	C_TIME:C306($_ti_CurrentTime; $_ti_EndTIme)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DelayTicks")

//$_t_oldMethodName:=ERR_MethodTracker ("DelayTicks")
// DelayTicks
// Delays processing for a certain no. of ticks

// useful for when you need to delay something in the User process

// 25/04/02 pb

// parameters: $1=the no. of ticks to wait
If (Count parameters:C259>=1)
	If ($1<1)
		$_l_Delay:=2
	Else 
		$_l_Delay:=$1
	End if 
Else 
	
	$_l_Delay:=2
End if 

$_l_StartTicks:=Tickcount:C458
$_l_EndTicks:=$_l_StartTicks+$_l_Delay
$_t_ProcessName:=Process_Name(Current process:C322)
$_l_ApplicationType:=Application type:C494
If ($_l_Delay>=60)
	$_ti_CurrentTime:=Current time:C178*1
	
	$_ti_EndTIme:=$_ti_CurrentTime+($_l_Delay/60)
	
	If ($_ti_EndTIme<$_ti_CurrentTime)
		$_ti_EndTIme:=$_ti_CurrentTime+60
	End if 
	While ($_ti_CurrentTime<$_ti_EndTIme)
		If (<>SYS_bo_QuitCalled)
			$_l_Delay:=1
			$_ti_EndTIme:=$_ti_CurrentTime
		End if 
		DELAY PROCESS:C323(Current process:C322; $_l_Delay)
		$_t_ProcessName:=Process_Name(Current process:C322)
		If ($_l_ApplicationType#4D Server:K5:6)
			If ($_t_ProcessName="Application process") | ($_t_ProcessName="Application_process")
				IDLE:C311
				$_ti_CurrentTime:=Current time:C178*1
			Else 
				$_ti_CurrentTime:=$_ti_EndTIme
			End if 
		Else 
			$_ti_CurrentTime:=$_ti_EndTIme
		End if 
		
	End while 
Else 
	If ($_l_EndTicks<$_l_StartTicks)
		$_l_EndTicks:=$_l_StartTicks+10
	End if 
	While ($_l_StartTicks<$_l_EndTicks)
		If (<>SYS_bo_QuitCalled)
			$_l_Delay:=1
			$_l_EndTicks:=$_l_StartTicks
		End if 
		DELAY PROCESS:C323(Current process:C322; $_l_Delay)
		$_t_ProcessName:=Process_Name(Current process:C322)
		If ($_l_ApplicationType#4D Server:K5:6)
			If ($_t_ProcessName="Application process")
				IDLE:C311
				$_l_StartTicks:=Tickcount:C458
			Else 
				$_l_StartTicks:=$_l_EndTicks
			End if 
		Else 
			$_l_StartTicks:=$_l_EndTicks
		End if 
		
	End while 
End if   //ERR_MethodTrackerReturn ("DelayTicks";$_t_oldMethodName)