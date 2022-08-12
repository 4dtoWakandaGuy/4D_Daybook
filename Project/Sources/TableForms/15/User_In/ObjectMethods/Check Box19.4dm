If (False:C215)
	//object Name: [USER]User_In.Check Box19
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DSPLY_bo_DisplayProgressBars)
	C_LONGINT:C283(Sys_l_DisplayProgressBars)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.Check Box19"; Form event code:C388)
If (Sys_l_DisplayProgressBars=1)
	DSPLY_bo_DisplayProgressBars:=True:C214
Else 
	DSPLY_bo_DisplayProgressBars:=False:C215
End if 
ERR_MethodTrackerReturn("OBJ [USER].User_In.Check Box19"; $_t_oldMethodName)
