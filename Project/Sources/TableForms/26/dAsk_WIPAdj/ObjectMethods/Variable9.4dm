If (False:C215)
	//object Name: [JOBS]dAsk_WIPadj.Variable9
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
	C_LONGINT:C283($_l_PeriodID)
	C_TEXT:C284($_t_oldMethodName; vPeriod)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [JOBS].dAsk_WIPadj.Variable9"; Form event code:C388)
If (vPeriod="")
	$_l_PeriodID:=Check_Period
	Check_PerClose
	vPeriod:=[PERIODS:33]Period_Code:1
End if 
ERR_MethodTrackerReturn("OBJ [JOBS].dAsk_WIPadj.Variable9"; $_t_oldMethodName)
