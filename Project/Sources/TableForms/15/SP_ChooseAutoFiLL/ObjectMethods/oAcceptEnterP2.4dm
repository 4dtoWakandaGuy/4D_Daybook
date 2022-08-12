If (False:C215)
	//object Name: [USER]SP_ChooseAutoFiLL.Variable15
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
	C_LONGINT:C283(SP_l_Continue)
	C_REAL:C285(SP_R_AFTargetAmount)
	C_TEXT:C284($_t_oldMethodName; SP_t_FCurrencyCode)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SP_ChooseAutoFiLL.Variable15"; Form event code:C388)
If (SP_t_FCurrencyCode#"") & (SP_R_AFTargetAmount>0)
	SP_l_Continue:=1
	CANCEL:C270
Else 
	Gen_Alert("You must enter a currency and an amount")
End if 
ERR_MethodTrackerReturn("OBJ [USER].SP_ChooseAutoFiLL.Variable15"; $_t_oldMethodName)
