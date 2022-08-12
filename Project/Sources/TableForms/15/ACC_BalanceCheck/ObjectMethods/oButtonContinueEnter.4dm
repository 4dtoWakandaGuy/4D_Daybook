If (False:C215)
	//object Name: [USER]ACC_BalanceCheck.Variable11
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:11
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(ACC_bo_CheckAccounts)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].ACC_BalanceCheck.Variable11"; Form event code:C388)
ACC_bo_CheckAccounts:=True:C214
CANCEL:C270
ERR_MethodTrackerReturn("OBJ [USER].ACC_BalanceCheck.Variable11"; $_t_oldMethodName)