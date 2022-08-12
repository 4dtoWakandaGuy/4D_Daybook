//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Record_BarStop
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/11/2009 09:54
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>RecRecord; <>SCPT_bo_NoAutoScripts)
	C_LONGINT:C283(<>SCPT_l_currentScriptProcess; <>SCPT_l_PlayerActive; <>SYS_l_CancelProcess; ch1; xMinus; xPlus; xSearch; xSelect; xSort)
	C_TEXT:C284($_t_oldMethodName; vStatus)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Record_BarStop")
If (<>SCPT_bo_NoAutoScripts=False:C215)
	PLAY:C290("Short Off"; 0)
End if 
xMinus:=1
OBJECT SET ENABLED:C1123(xPlus; True:C214)
OBJECT SET ENABLED:C1123(xSearch; True:C214)
OBJECT SET ENABLED:C1123(xSelect; True:C214)
xPlus:=0
ch1:=0
xSearch:=0
If (vStatus="Rec@")
	ON EVENT CALL:C190("")
	Start_Event
End if 
If (vStatus="Play@")
	If (Process state:C330(<>SCPT_l_PlayerActive)>=0)
		RESUME PROCESS:C320(<>SCPT_l_PlayerActive)
		
		<>SCPT_l_PlayerActive:=0
		If (<>SCPT_l_currentScriptProcess=Frontmost process:C327(*))
			<>SYS_l_CancelProcess:=<>SCPT_l_currentScriptProcess
		End if 
	End if 
End if 
If (xSort=1)
	ZRecord_Edit
	xSelect:=1
End if 
<>RecRecord:=False:C215
vStatus:="Stop"
xMinus:=0
ERR_MethodTrackerReturn("Record_BarStop"; $_t_oldMethodName)
