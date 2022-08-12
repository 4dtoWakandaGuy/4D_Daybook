If (False:C215)
	//object Name: [USER]ACC_BalanceCheck.Check Box7
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
	C_LONGINT:C283(ACC_l_AllAccounts)
	C_TEXT:C284($_t_oldMethodName; ACC_t_AccountEnd; ACC_t_AccountStart)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].ACC_BalanceCheck.Check Box7"; Form event code:C388)
If (ACC_l_AllAccounts=1)
	ACC_t_AccountStart:=""
	ACC_t_AccountEnd:=""
End if 
ERR_MethodTrackerReturn("OBJ [USER].ACC_BalanceCheck.Check Box7"; $_t_oldMethodName)
