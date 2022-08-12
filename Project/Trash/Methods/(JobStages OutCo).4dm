//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      JobStages OutCo
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
	C_REAL:C285($_r_ActualAmount; $_r_BudgetAmount; $_r_CostAmount; $_r_InvEXTax; $_r_QuotedAmount; $_r_SalesAmount)
	C_TEXT:C284($_t_oldMethodName; vRec; vText)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JobStages OutCo")
$_r_QuotedAmount:=Sum:C1([JOB_STAGES:47]AS_Quoted_Amount:7)
$_r_CostAmount:=Sum:C1([JOB_STAGES:47]AT_Budget_Sales_Amount:8)
$_r_InvEXTax:=Sum:C1([JOB_STAGES:47]AS_Invoice_Excluding_Tax:9)
$_r_BudgetAmount:=Sum:C1([JOB_STAGES:47]JT_Budget_Units:4)
$_r_ActualAmount:=Sum:C1([JOB_STAGES:47]AT_Actual_Units:5)
$_r_SalesAmount:=Sum:C1([JOB_STAGES:47]JT_Actual_Sales_Amount:6)
vText:=vText+"Quoted: "+String:C10($_r_QuotedAmount; "|Accounts")+vRec+"Cost: "+String:C10($_r_CostAmount; "|Accounts")+vRec+"Invoiced: "+String:C10($_r_InvEXTax; "|Accounts")+vRec
vText:=vText+"Budget: "+String:C10($_r_BudgetAmount)+vRec+"Actual: "+String:C10($_r_ActualAmount)+vRec+"Value: "+String:C10($_r_SalesAmount; "|Accounts")+vRec
ERR_MethodTrackerReturn("JobStages OutCo"; $_t_oldMethodName)