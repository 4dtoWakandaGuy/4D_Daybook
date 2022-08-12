If (False:C215)
	//object Name: [COMPANIES]WS_TOOLBAR.Variable5
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>MenuFront)
	C_LONGINT:C283(<>MenuProc; $_l_Process)
	C_TEXT:C284($_t_oldMethodName)
	C_TIME:C306(vTime)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].WS_TOOLBAR.Variable5"; Form event code:C388)
//If (vTime<=Current time-)  `(vTime+†00:00:01†)
//$_l_Process:=ZScrnSav_Proc
//Else
BRING TO FRONT:C326(<>MenuProc)
<>MenuFront:=True:C214
Gen_SetModCol

vTime:=Current time:C178
//End if
ERR_MethodTrackerReturn("OBJ:WS_TOOLBAR,xCount"; $_t_oldMethodName)