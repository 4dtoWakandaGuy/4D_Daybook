//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Gen AskField
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
	C_BOOLEAN:C305(<>SYS_bo_CurrentWindowModal)
	C_LONGINT:C283($_l_CurrentWinRefOLD; $_l_ScreenCentreVertical; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_TEXT:C284($_t_oldMethodName; vConfirm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen AskField")
//Gen AskField
<>SYS_bo_CurrentWindowModal:=True:C214
$_l_ScreenCentreVertical:=Screen width:C187/2
vConfirm:=""
$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
WIN_l_CurrentWinRef:=Open window:C153($_l_ScreenCentreVertical-156; 110; $_l_ScreenCentreVertical+156; 274)
DIALOG:C40([COMPANIES:2]; "dAsk Field")
CLOSE WINDOW:C154
WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
<>SYS_bo_CurrentWindowModal:=False:C215
ERR_MethodTrackerReturn("Gen AskField"; $_t_oldMethodName)