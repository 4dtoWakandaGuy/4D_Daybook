If (False:C215)
	//object Method Name: Object Name:      DB_OutputForm.oCBFunctionButton
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:03
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(DB_but_CBFunction1)
	C_REAL:C285(DB_l_Setting)
	C_TEXT:C284($_t_oldMethodName; DB_t_CBFunction1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ DB_OutputForm.oCBFunctionButton"; Form event code:C388)

If (DB_t_CBFunction1#"")
	DB_l_Setting:=DB_but_CBFunction1
	//EXECUTE FORMULA(DB_t_CBFunction1)
	EXECUTE METHOD:C1007(DB_t_CBFunction1)
	
End if 
ERR_MethodTrackerReturn("OBJ DB_OutputForm.oCBFunctionButton"; $_t_oldMethodName)
