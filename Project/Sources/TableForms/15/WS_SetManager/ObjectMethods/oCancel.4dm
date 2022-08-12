If (False:C215)
	//object Name: [USER]WS_SetManager.Button4
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
	//Array Text(<>DB_at_TableNames;0)
	C_BOOLEAN:C305(SM_bo_Busy)
	C_LONGINT:C283(WS_l_ContextID)
	C_TEXT:C284($_t_oldMethodName; WS_t_ContextLabel)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].WS_SetManager.Button4"; Form event code:C388)
<>DB_at_TableNames:=0
WS_t_ContextLabel:=""
WS_l_ContextID:=0
FORM GOTO PAGE:C247(1)
SM_bo_Busy:=False:C215
ERR_MethodTrackerReturn("OBJ [USER].WS_SetManager.Button4"; $_t_oldMethodName)