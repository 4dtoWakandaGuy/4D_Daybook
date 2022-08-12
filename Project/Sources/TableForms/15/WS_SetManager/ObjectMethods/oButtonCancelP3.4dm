If (False:C215)
	//object Name: [USER]WS_SetManager.Button10
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
	C_BOOLEAN:C305(SM_bo_Busy)
	C_TEXT:C284($_t_oldMethodName; SM_t_ScriptCode; SM_t_ScriptName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].WS_SetManager.Button10"; Form event code:C388)
SM_t_ScriptCode:=""
SM_t_ScriptName:=""
FORM GOTO PAGE:C247(1)
SM_bo_Busy:=False:C215
ERR_MethodTrackerReturn("OBJ [USER].WS_SetManager.Button10"; $_t_oldMethodName)