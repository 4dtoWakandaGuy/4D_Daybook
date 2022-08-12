If (False:C215)
	//object Name: [USER]SP_ChooseAutoFiLL.Variable18
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
	C_LONGINT:C283(SP_l_BasedOnResults; SP_l_BasedOnTarget; SP_l_Continue)
	C_REAL:C285(SP_R_AFTargetAmount2; SP_R_AFTargetAmount3)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SP_ChooseAutoFiLL.Variable18"; Form event code:C388)
If (SP_R_AFTargetAmount2#0) | (SP_R_AFTargetAmount3#0)
	If (SP_l_BasedOnTarget=0) & (SP_l_BasedOnResults=0)
		Gen_Alert("You must select which figures to use for these targets")
	Else 
		SP_l_Continue:=1
		CANCEL:C270
	End if 
	
Else 
	Gen_Alert("You must enter the increment for these targets")
End if 
ERR_MethodTrackerReturn("OBJ [USER].SP_ChooseAutoFiLL.Variable18"; $_t_oldMethodName)
