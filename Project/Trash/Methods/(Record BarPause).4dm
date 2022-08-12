//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Record_BarPause
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
	C_BOOLEAN:C305(<>SCPT_bo_NoAutoScripts)
	C_LONGINT:C283(<>SCPT_l_PlayerActive; ch1)
	C_TEXT:C284($_t_oldMethodName; vStatus)
	C_TIME:C306(<>EvTime; $_ti_EventTime)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Record_BarPause")
If (vStatus="RecPaused")
	If (<>SCPT_bo_NoAutoScripts=False:C215)
		PLAY:C290("Mer Off"; 0)
	End if 
	ON EVENT CALL:C190("")
	ON EVENT CALL:C190("On_EventRec"; "$Events")
	vStatus:="Record"
	<>EvTime:=Current time:C178-vTime
	ch1:=0
Else 
	If (vStatus="PlayPaused")
		If (<>SCPT_bo_NoAutoScripts=False:C215)
			PLAY:C290("Mer Off"; 0)
		End if 
		BRING TO FRONT:C326(Frontmost process:C327(*))
		RESUME PROCESS:C320(<>SCPT_l_PlayerActive)
		vStatus:="Play"
		ch1:=0
	Else 
		If (vStatus="Record")
			If (<>SCPT_bo_NoAutoScripts=False:C215)
				PLAY:C290("Mer On"; 0)
			End if 
			ch1:=1
			// xPlus:=0
			ON EVENT CALL:C190("")
			Start_Event
			vStatus:="RecPaused"
			$_ti_EventTime:=Current time:C178
			vTime:=$_ti_EventTime-<>EvTime
		Else 
			If (vStatus="Play")
				If (<>SCPT_bo_NoAutoScripts=False:C215)
					PLAY:C290("Mer On"; 0)
				End if 
				ch1:=1
				//xSearch:=0
				PAUSE PROCESS:C319(<>SCPT_l_PlayerActive)
				vStatus:="PlayPaused"
			Else 
				If (<>SCPT_bo_NoAutoScripts=False:C215)
					PLAY:C290("Short On"; 0)
				End if 
				ch1:=0
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Record_BarPause"; $_t_oldMethodName)
