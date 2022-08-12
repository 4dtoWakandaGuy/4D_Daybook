If (False:C215)
	//object Name: [USER]User_In.Variable52
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 16:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_WindowTop; $_l_CurrentWinRefOLD; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.Variable52"; Form event code:C388)
GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
HIDE WINDOW:C436

//this will alllow the user to set up preferences for handling accounts problems
$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef

Open window:C153($_l_WindowLeft; $_l_WindowTop; $_l_WindowLeft; $_l_WindowTop; -1984)
DIALOG:C40([USER:15]; "ACC_PreferencesSetup")

CLOSE WINDOW:C154
WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
SHOW WINDOW:C435
ERR_MethodTrackerReturn("OBJ:User_In,BaccountsErrors"; $_t_oldMethodName)