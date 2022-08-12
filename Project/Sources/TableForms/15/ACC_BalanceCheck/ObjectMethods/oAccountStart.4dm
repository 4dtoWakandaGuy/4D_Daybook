If (False:C215)
	//object Method Name: Object Name:      [USER].ACC_BalanceCheck.Variable4
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
	C_TEXT:C284($_t_oldMethodName; ACC_t_AccountStart)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].ACC_BalanceCheck.Variable4"; Form event code:C388)

Check_MinorNC(->ACC_t_AccountStart; ""; ->[ACCOUNTS:32]; ->[ACCOUNTS:32]Account_Code:2; ->[ACCOUNTS:32]Account_Name:3; "Account")  //6
If (ACC_t_AccountStart#"")
	ACC_l_AllAccounts:=0
End if 
ERR_MethodTrackerReturn("OBJ [USER].ACC_BalanceCheck.Variable4"; $_t_oldMethodName)
