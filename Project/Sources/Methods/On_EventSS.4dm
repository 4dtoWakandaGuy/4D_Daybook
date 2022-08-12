//%attributes = {}

If (False:C215)
	//Project Method Name:      On_EventSS
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
	C_BOOLEAN:C305($_bo_NoTrack; SYS_bo_NoTrack)
	C_LONGINT:C283(<>SYS_l_CancelProcess; $_l_ScreenSaverProcess)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("On_EventSS")

//$_t_oldMethodName:=ERR_MethodTracker ("On_EventSS")
$_bo_NoTrack:=SYS_bo_NoTrack  //11/03/09 v631b120p -kmw
SYS_bo_NoTrack:=True:C214
$_l_ScreenSaverProcess:=Process_No("$ScreenSaveWin")
If ($_l_ScreenSaverProcess>0)
	//◊Option:=(((Modifiers\2048)%2)=1)
	FILTER EVENT:C321
	<>SYS_l_CancelProcess:=$_l_ScreenSaverProcess
	POST OUTSIDE CALL:C329($_l_ScreenSaverProcess)
Else 
	//TRACE
	ON EVENT CALL:C190("")
	Start_Event
End if 
SYS_bo_NoTrack:=$_bo_NoTrack
//ERR_MethodTrackerReturn ("On_EventSS";$_t_oldMethodName)