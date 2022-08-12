If (False:C215)
	//object Name: [USER]User_In.Check Box15
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
	C_BOOLEAN:C305(JC_bo_PostBudgetTime)
	C_LONGINT:C283(SYS_cb_PostBudgetTime)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.Check Box15"; Form event code:C388)
If (SYS_cb_PostBudgetTime=1)
	JC_bo_PostBudgetTime:=True:C214
Else 
	JC_bo_PostBudgetTime:=False:C215
End if 
ERR_MethodTrackerReturn("OBJ [USER].User_In.Check Box15"; $_t_oldMethodName)
