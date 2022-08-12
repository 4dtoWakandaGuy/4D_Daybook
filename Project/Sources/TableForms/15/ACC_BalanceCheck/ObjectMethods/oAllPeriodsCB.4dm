If (False:C215)
	//object Name: [USER]ACC_BalanceCheck.Check Box6
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
	C_LONGINT:C283(ACC_l_AllPeriods)
	C_TEXT:C284($_t_oldMethodName; ACC_t_PeriodEnd; ACC_t_PeriodStart)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].ACC_BalanceCheck.Check Box6"; Form event code:C388)
If (ACC_l_AllPeriods=1)
	ACC_t_PeriodStart:=""
	ACC_t_PeriodEnd:=""
End if 
ERR_MethodTrackerReturn("OBJ [USER].ACC_BalanceCheck.Check Box6"; $_t_oldMethodName)
