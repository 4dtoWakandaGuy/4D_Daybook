If (False:C215)
	//object Name: [USER]ACC_BalanceCheck.Check Box1
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
	C_LONGINT:C283(ACC_l_checkexistance; ACC_l_CreateExistance)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].ACC_BalanceCheck.Check Box1"; Form event code:C388)
If (ACC_l_CreateExistance=1)
	ACC_l_checkexistance:=1
End if 
ERR_MethodTrackerReturn("OBJ [USER].ACC_BalanceCheck.Check Box1"; $_t_oldMethodName)
