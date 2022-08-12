If (False:C215)
	//object Name: Object Name:      PUR_CreditorsStats.Variable11
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 11/11/2010 15:08
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; ACC_t_PeriodFrom)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ PUR_CreditorsStats.Variable11")

$_t_oldMethodName:=ERR_MethodTracker("OBJ PUR_CreditorsStats.Variable11"; Form event code:C388)
Check_MinorNC(->ACC_t_PeriodFrom; ""; ->[PERIODS:33]; ->[PERIODS:33]Period_Code:1; ->[PERIODS:33]Period_Name:2; "Period")
ERR_MethodTrackerReturn("OBJ PUR_CreditorsStats.Variable11"; $_t_oldMethodName)