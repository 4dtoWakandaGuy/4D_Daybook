If (False:C215)
	//object Name: [USER]User_In.Check Box18
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
	C_BOOLEAN:C305(JC_bo_ActivateProcessServices)
	C_LONGINT:C283(SYS_l_ActivateProcessServices)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.Check Box18"; Form event code:C388)
If (SYS_l_ActivateProcessServices=1)
	JC_bo_ActivateProcessServices:=True:C214
Else 
	JC_bo_ActivateProcessServices:=False:C215
End if 
ERR_MethodTrackerReturn("OBJ [USER].User_In.Check Box18"; $_t_oldMethodName)
