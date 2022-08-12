If (False:C215)
	//object Name: [USER]LR_Setup.LR_l_EnableCHK
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
	C_BOOLEAN:C305(LR_bo_Enable)
	C_LONGINT:C283(LR_l_EnableCHK)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].LR_Setup.LR_l_EnableCHK"; Form event code:C388)

If (LR_l_EnableCHK=1)
	LR_bo_Enable:=True:C214
Else 
	LR_bo_Enable:=False:C215
End if 
ERR_MethodTrackerReturn("OBJ [USER].LR_Setup.LR_l_EnableCHK"; $_t_oldMethodName)
