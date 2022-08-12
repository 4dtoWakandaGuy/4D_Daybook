If (False:C215)
	//object Name: [USER]WS_SetManager.Button9
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/04/2011 09:02
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(SM_bo_Busy)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].WS_SetManager.Button9"; Form event code:C388)
SM_bo_Busy:=True:C214
SM_SaveModifiedList

SMdeleteLIST
SM_ListItemShared(0)
SM_bo_Busy:=False:C215
ERR_MethodTrackerReturn("OBJ [USER].WS_SetManager.Button9"; $_t_oldMethodName)