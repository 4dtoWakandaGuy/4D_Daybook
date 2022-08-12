//%attributes = {}
If (False:C215)
	//Project Method Name:      RR_ZenCartManager
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:     28/01/2011 13:44
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>ZenCartManagerProcess; $_l_CurrentWinRefOLD; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_WindowTop; $2; $3; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_TEXT:C284($_t_EventMethod; $_t_oldMethodName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("RR_ZenCartManager")


If (<>ZenCartManagerProcess=0)
	<>ZenCartManagerProcess:=Current process:C322
	
	Start_Process
	$_l_WindowBottom:=Screen height:C188-40
	$_l_WindowTop:=40
	If ($_l_WindowBottom<$_l_WindowTop)
		$_l_WindowBottom:=Screen height:C188-5
		$_l_WindowTop:=$_l_WindowBottom-400
	Else 
		If ($_l_WindowBottom>($_l_WindowTop+400))
			$_l_WindowBottom:=Screen height:C188-5
		End if 
	End if 
	$_l_WindowRight:=Screen width:C187-20
	$_l_WindowLeft:=40
	If ($_l_WindowRight<$_l_WindowLeft)
		$_l_WindowRight:=Screen width:C187
		$_l_WindowLeft:=Screen width:C187-400
	Else 
		If ($_l_WindowRight>($_l_WindowLeft+400))
			$_l_WindowRight:=Screen width:C187-100
		End if 
	End if 
	$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
	WIN_l_CurrentWinRef:=Open window:C153($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom; 4096; "Website Orders"; "CO_CloseNews")
	//INPUT FORM([DIARY];"CUMULUS")
	//INPUT FORM("RR_ZenCartWindow")
	WS_AutoscreenSize(3; 200; 100)
	$_t_EventMethod:=Method called on event:C705
	ON EVENT CALL:C190("")
	DIALOG:C40("RR_ZenCartWindow")
	CLOSE WINDOW:C154
	If ($_t_EventMethod#"")
		ON EVENT CALL:C190($_t_EventMethod)
	End if 
	WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
	<>ZenCartManagerProcess:=0
	Process_End
Else 
	SET PROCESS VARIABLE:C370(<>ZenCartManagerProcess; DB_l_HideWindow; 0)
	
	
	POST OUTSIDE CALL:C329(<>ZenCartManagerProcess)
	BRING TO FRONT:C326(<>ZenCartManagerProcess)
	
End if 
ERR_MethodTrackerReturn("RR_ZenCartManager"; $_t_oldMethodName)
