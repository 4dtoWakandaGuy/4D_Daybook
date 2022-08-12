//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_Alert2Col
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 19:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_CurrentWindowModal; DB_bo_AlertReply; DB_bo_AlertTimeOut; SYS_bo_NoTrack)
	C_LONGINT:C283($_l_CurrentWinRefOLD; $_l_ScreenCentreVertical; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_TEXT:C284(<>ButtOK; $_t_oldMethodName; $1; $2; $3; vConfirm; vT)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_Alert2Col")
//Gen_Alert2col

<>SYS_bo_CurrentWindowModal:=True:C214
vConfirm:=$1
$_l_ScreenCentreVertical:=Screen width:C187/2
$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
WIN_l_CurrentWinRef:=Open window:C153($_l_ScreenCentreVertical-186; 110; $_l_ScreenCentreVertical+186; 336)
If (Count parameters:C259>1)
	<>ButtOK:=$2
Else 
	<>ButtOK:=""
End if 
vT:=$3
DIALOG:C40([COMPANIES:2]; "dAlert_2Col")
CLOSE WINDOW:C154
WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
<>SYS_bo_CurrentWindowModal:=False:C215
ERR_MethodTrackerReturn("Gen_Alert2Col"; $_t_oldMethodName)