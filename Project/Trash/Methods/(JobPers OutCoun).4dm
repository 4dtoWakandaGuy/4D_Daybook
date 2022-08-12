//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      JobPers OutCoun
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_REAL:C285($_r_ActualUnits; $_r_BudgetUnits; $_r_SalesAmounts)
	C_TEXT:C284($_t_oldMethodName; vRec; vText)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JobPers OutCoun")
$_r_BudgetUnits:=Sum:C1([JOB PERSONNEL:48]JT_Budget_Units:4)
$_r_ActualUnits:=Sum:C1([JOB PERSONNEL:48]JT_Actual_Units:5)
$_r_SalesAmounts:=Sum:C1([JOB PERSONNEL:48]JT_Act_Sales_Amount:6)
vText:=vText+"Budget: "+String:C10($_r_BudgetUnits)+vRec+"Actual: "+String:C10($_r_ActualUnits)+vRec+"Value: "+String:C10($_r_SalesAmounts; "|Accounts")+vRec
ERR_MethodTrackerReturn("JobPers OutCoun"; $_t_oldMethodName)