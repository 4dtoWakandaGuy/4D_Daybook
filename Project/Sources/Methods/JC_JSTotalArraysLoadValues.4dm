//%attributes = {}

If (False:C215)
	//Project Method Name:      JC_JSTotalArraysLoadValues
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(JS_at_TotActualCost;0)
	//ARRAY TEXT(JS_at_TotActualTC;0)
	//ARRAY TEXT(JS_at_TotActualTime;0)
	//ARRAY TEXT(JS_at_TotBudgetCost;0)
	//ARRAY TEXT(JS_at_TotBudgetTC;0)
	//ARRAY TEXT(JS_at_TotBudgetTime;0)
	//ARRAY TEXT(JS_at_TotInvExclTC;0)
	//ARRAY TEXT(JS_at_TotInvInclTC;0)
	//ARRAY TEXT(JS_at_TotLeftHandLabel;0)
	//ARRAY TEXT(JS_at_TotQuotedTime;0)
	//ARRAY TEXT(JS_at_TotWIPCost;0)
	//ARRAY TEXT(JS_at_TotWIPTC;0)
	//ARRAY TEXT(JS_at_TotWIPTime;0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JC_JSTotalArraysLoadValues")

//
//added 14/03/07 -kmw
//
//
$_t_oldMethodName:=ERR_MethodTracker("JC_JSTotalArraysLoadValues")



ARRAY TEXT:C222(JS_at_TotLeftHandLabel; 4)  //Row headings will be Sales, Cost (cost as in cost value to company), Margin and Margin %
//`
//time totals
ARRAY TEXT:C222(JS_at_TotQuotedTime; 4)  //Sales
ARRAY TEXT:C222(JS_at_TotBudgetTime; 4)  //Sales, Cost (cost as in cost value to company)
ARRAY TEXT:C222(JS_at_TotActualTime; 4)  //Sales, Cost (cost as in cost value to company)
ARRAY TEXT:C222(JS_at_TotWIPTime; 4)  //Sales, Cost (cost as in cost value to company)
//
//cost totals (costs as in materials/items used (non-labour))
ARRAY TEXT:C222(JS_at_TotBudgetCost; 4)  //Sales, Cost (cost as in cost value to company)
ARRAY TEXT:C222(JS_at_TotActualCost; 4)  //Sales, Cost (cost as in cost value to company)
ARRAY TEXT:C222(JS_at_TotWIPCost; 4)  //Sales, Cost (cost as in cost value to company)
//
//combined totals
ARRAY TEXT:C222(JS_at_TotBudgetTC; 4)  //Sales, Cost (cost as in cost value to company), Margin and Margin %
ARRAY TEXT:C222(JS_at_TotActualTC; 4)  //Sales, Cost (cost as in cost value to company), Margin and Margin %
ARRAY TEXT:C222(JS_at_TotWIPTC; 4)  //Sales, Cost (cost as in cost value to company), Margin and Margin %
ARRAY TEXT:C222(JS_at_TotInvExclTC; 4)  //Sales
ARRAY TEXT:C222(JS_at_TotInvInclTC; 4)  //Sales
//
//
JS_at_TotLeftHandLabel{1}:="Sales"
JS_at_TotLeftHandLabel{2}:="Cost"
JS_at_TotLeftHandLabel{3}:="Margin"
JS_at_TotLeftHandLabel{4}:="Margin %"
//
//
JS_at_TotQuotedTime{1}:=String:C10([JOB_STAGES:47]AS_Quoted_Amount:7; "|Accounts")
JS_at_TotQuotedTime{2}:="N/A"
JS_at_TotQuotedTime{3}:="N/A"
JS_at_TotQuotedTime{4}:="N/A"
//
JS_at_TotBudgetTime{1}:=String:C10([JOB_STAGES:47]AT_Budget_Sales_Amount:8; "|Accounts")
JS_at_TotBudgetTime{2}:=String:C10([JOB_STAGES:47]JT_Budget_Cost_Amount:30; "|Accounts")
JS_at_TotBudgetTime{3}:=""
JS_at_TotBudgetTime{4}:=""
JC_GetMarginAndMarginPercent(JS_at_TotBudgetTime{1}; JS_at_TotBudgetTime{2}; ->JS_at_TotBudgetTime{3}; ->JS_at_TotBudgetTime{4})
//
JS_at_TotActualTime{1}:=String:C10([JOB_STAGES:47]JT_Actual_Sales_Amount:6; "|Accounts")
JS_at_TotActualTime{2}:=String:C10([JOB_STAGES:47]JT_Actual_Cost_Amount:29; "|Accounts")
JS_at_TotActualTime{3}:=""
JS_at_TotActualTime{4}:=""
JC_GetMarginAndMarginPercent(JS_at_TotActualTime{1}; JS_at_TotActualTime{2}; ->JS_at_TotActualTime{3}; ->JS_at_TotActualTime{4})
//
JS_at_TotWIPTime{1}:=String:C10([JOB_STAGES:47]JT_WIP_Sales_Amount:56; "|Accounts")
JS_at_TotWIPTime{2}:=String:C10([JOB_STAGES:47]JT_WIP_Cost_Amount:43; "|Accounts")
JS_at_TotWIPTime{3}:=""
JS_at_TotWIPTime{4}:=""
JC_GetMarginAndMarginPercent(JS_at_TotWIPTime{1}; JS_at_TotWIPTime{2}; ->JS_at_TotWIPTime{3}; ->JS_at_TotWIPTime{4})
//
//
JS_at_TotBudgetCost{1}:=String:C10([JOB_STAGES:47]JC_Budget_Sales_Amount:33; "|Accounts")
JS_at_TotBudgetCost{2}:=String:C10([JOB_STAGES:47]JC_Budget_Cost_Amount:34; "|Accounts")
JS_at_TotBudgetCost{3}:=""
JS_at_TotBudgetCost{4}:=""
JC_GetMarginAndMarginPercent(JS_at_TotBudgetCost{1}; JS_at_TotBudgetCost{2}; ->JS_at_TotBudgetCost{3}; ->JS_at_TotBudgetCost{4})
//
JS_at_TotActualCost{1}:=String:C10([JOB_STAGES:47]JC_Actual_Sales_Amount:31; "|Accounts")
JS_at_TotActualCost{2}:=String:C10([JOB_STAGES:47]JC_Actual_Cost_Amount:32; "|Accounts")
JS_at_TotActualCost{3}:=""
JS_at_TotActualCost{4}:=""
JC_GetMarginAndMarginPercent(JS_at_TotActualCost{1}; JS_at_TotActualCost{2}; ->JS_at_TotActualCost{3}; ->JS_at_TotActualCost{4})
//
JS_at_TotWIPCost{1}:=String:C10([JOB_STAGES:47]JC_WIP_Sales_Amount:57; "|Accounts")
JS_at_TotWIPCost{2}:=String:C10([JOB_STAGES:47]JC_WIP_Cost_Amount:44; "|Accounts")
JS_at_TotWIPCost{3}:=""
JS_at_TotWIPCost{4}:=""
JC_GetMarginAndMarginPercent(JS_at_TotWIPCost{1}; JS_at_TotWIPCost{2}; ->JS_at_TotWIPCost{3}; ->JS_at_TotWIPCost{4})
//
//
JS_at_TotBudgetTC{1}:=String:C10([JOB_STAGES:47]JS_Budget_Sales_Amount:37; "|Accounts")
JS_at_TotBudgetTC{2}:=String:C10([JOB_STAGES:47]JS_Budget_Cost_Amount:38; "|Accounts")
JS_at_TotBudgetTC{3}:=String:C10([JOB_STAGES:47]JS_Budget_Margin:41; "|Accounts")
JS_at_TotBudgetTC{4}:=String:C10([JOB_STAGES:47]JS_Budget_Margin_PC:42; "|PercentNZ")
//
JS_at_TotActualTC{1}:=String:C10([JOB_STAGES:47]JS_Actual_Sales_Amount:35; "|Accounts")
JS_at_TotActualTC{2}:=String:C10([JOB_STAGES:47]JS_Actual_Cost_Amount:36; "|Accounts")
JS_at_TotActualTC{3}:=String:C10([JOB_STAGES:47]JS_Actual_Margin:39; "|Accounts")
JS_at_TotActualTC{4}:=String:C10([JOB_STAGES:47]JS_Actual_Margin_PC:40; "|PercentNZ")
//
JS_at_TotWIPTC{1}:=String:C10([JOB_STAGES:47]JS_WIP_Sales_Amount:58; "|Accounts")
JS_at_TotWIPTC{2}:=String:C10([JOB_STAGES:47]JS_WIP_Cost_Amount:45; "|Accounts")
JS_at_TotWIPTC{3}:=String:C10([JOB_STAGES:47]JS_WIP_Margin:59; "|Accounts")
JS_at_TotWIPTC{4}:=String:C10([JOB_STAGES:47]JS_WIP_MarginPC:60; "|PercentNZ")
//
JS_at_TotInvExclTC{1}:=String:C10([JOBS:26]AS_Invoice_Excluding_Tax:12; "|Accounts")
JS_at_TotInvExclTC{2}:="N/A"
JS_at_TotInvExclTC{3}:="N/A"
JS_at_TotInvExclTC{4}:="N/A"
//
JS_at_TotInvInclTC{1}:=String:C10([JOBS:26]AS_Invoice_Including_Tax:13; "|Accounts")
JS_at_TotInvInclTC{2}:="N/A"
JS_at_TotInvInclTC{3}:="N/A"
JS_at_TotInvInclTC{4}:="N/A"
//
ERR_MethodTrackerReturn("JC_JSTotalArraysLoadValues"; $_t_oldMethodName)