//%attributes = {}
If (False:C215)
	//Project Method Name:      EN_cumulusShow
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:    25/03/2011 11:14 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_WindowTop; $2; $3; $_l_CurrentWinRefOLD; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_TEXT:C284($_t_oldMethodName; $1; $Insert)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("EN_cumulusShow")


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
WIN_l_CurrentWinRef:=Open window:C153($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom; 4096; "Advertising Assets"; "CO_CloseNews")
//INPUT FORM([DIARY];"CUMULUS")
//INPUT FORM("RR_ZenCartWindow")
WS_AutoscreenSize(3; 300; 600)
DIALOG:C40("EN_Cumulus")

CLOSE WINDOW:C154
WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD

Process_End
ERR_MethodTrackerReturn("EN_cumulusShow"; $_t_oldMethodName)