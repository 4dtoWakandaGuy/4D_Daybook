//%attributes = {}

If (False:C215)
	//Project Method Name:      JC_JobTotalArraysLoadValues
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
	//ARRAY TEXT(JOB_at_TotActualCost;0)
	//ARRAY TEXT(JOB_at_TotActualTC;0)
	//ARRAY TEXT(JOB_at_TotActualTime;0)
	//ARRAY TEXT(JOB_at_TotBudgetCost;0)
	//ARRAY TEXT(JOB_at_TotBudgetTC;0)
	//ARRAY TEXT(JOB_at_TotBudgetTime;0)
	//ARRAY TEXT(JOB_at_TotInvExclTC;0)
	//ARRAY TEXT(JOB_at_TotInvInclTC;0)
	//ARRAY TEXT(JOB_at_TotLeftHandLabel;0)
	//ARRAY TEXT(JOB_at_TotQuotedTime;0)
	//ARRAY TEXT(JOB_at_TotWIPCost;0)
	//ARRAY TEXT(JOB_at_TotWIPTC;0)
	//ARRAY TEXT(JOB_at_TotWIPTime;0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JC_JobTotalArraysLoadValues")

//
//added 13/03/07 -kmw
//
//
$_t_oldMethodName:=ERR_MethodTracker("JC_JobTotalArraysLoadValues")



ARRAY TEXT:C222(JOB_at_TotLeftHandLabel; 4)  //Row headings will be Sales, Cost (cost as in cost value to company), Margin and Margin %
//
//time totals
ARRAY TEXT:C222(JOB_at_TotQuotedTime; 4)  //Sales
ARRAY TEXT:C222(JOB_at_TotBudgetTime; 4)  //Sales, Cost (cost as in cost value to company)
ARRAY TEXT:C222(JOB_at_TotActualTime; 4)  //Sales, Cost (cost as in cost value to company)
ARRAY TEXT:C222(JOB_at_TotWIPTime; 4)  //Sales, Cost (cost as in cost value to company)
//
//cost totals (costs as in materials/items used (non-labour))
ARRAY TEXT:C222(JOB_at_TotBudgetCost; 4)  //Sales, Cost (cost as in cost value to company)
ARRAY TEXT:C222(JOB_at_TotActualCost; 4)  //Sales, Cost (cost as in cost value to company)
ARRAY TEXT:C222(JOB_at_TotWIPCost; 4)  //Sales, Cost (cost as in cost value to company)
//
//combined totals
ARRAY TEXT:C222(JOB_at_TotBudgetTC; 4)  //Sales, Cost (cost as in cost value to company), Margin and Margin %
ARRAY TEXT:C222(JOB_at_TotActualTC; 4)  //Sales, Cost (cost as in cost value to company), Margin and Margin %
ARRAY TEXT:C222(JOB_at_TotWIPTC; 4)  //Sales, Cost (cost as in cost value to company), Margin and Margin %
ARRAY TEXT:C222(JOB_at_TotInvExclTC; 4)  //Sales
ARRAY TEXT:C222(JOB_at_TotInvInclTC; 4)  //Sales
//
//
JOB_at_TotLeftHandLabel{1}:="Sales"
JOB_at_TotLeftHandLabel{2}:="Cost"
JOB_at_TotLeftHandLabel{3}:="Margin"
JOB_at_TotLeftHandLabel{4}:="Margin %"
//
//
JOB_at_TotQuotedTime{1}:=String:C10([JOBS:26]AS_Quoted_Amount:11; "|Accounts")  //this field should probably be renamed "JT Quoted Am"...an S seems to usually signifies that field is combo of a Time (T) and a Cost (C) but according to manual and based on where it was placed on the screen this field is meant to be used as only a Time total.
JOB_at_TotQuotedTime{2}:="N/A"
JOB_at_TotQuotedTime{3}:="N/A"
JOB_at_TotQuotedTime{4}:="N/A"
//
JOB_at_TotBudgetTime{1}:=String:C10([JOBS:26]JT_Bud_Sales_Amount:23; "|Accounts")
JOB_at_TotBudgetTime{2}:=String:C10([JOBS:26]JT_Budget_Cost_Amount:30; "|Accounts")
JOB_at_TotBudgetTime{3}:=""
JOB_at_TotBudgetTime{4}:=""
JC_GetMarginAndMarginPercent(JOB_at_TotBudgetTime{1}; JOB_at_TotBudgetTime{2}; ->JOB_at_TotBudgetTime{3}; ->JOB_at_TotBudgetTime{4})
//
JOB_at_TotActualTime{1}:=String:C10([JOBS:26]J_ Actual_Sales_Amount:17; "|Accounts")
JOB_at_TotActualTime{2}:=String:C10([JOBS:26]JT_Actual_Cost_Amount:31; "|Accounts")
JOB_at_TotActualTime{3}:=""
JOB_at_TotActualTime{4}:=""
JC_GetMarginAndMarginPercent(JOB_at_TotActualTime{1}; JOB_at_TotActualTime{2}; ->JOB_at_TotActualTime{3}; ->JOB_at_TotActualTime{4})
//
JOB_at_TotWIPTime{1}:=String:C10([JOBS:26]JT_WIP_Sales_Amount:52; "|Accounts")
JOB_at_TotWIPTime{2}:=String:C10([JOBS:26]JT_WIP_Cost_Amount:43; "|Accounts")
JOB_at_TotWIPTime{3}:=""
JOB_at_TotWIPTime{4}:=""
JC_GetMarginAndMarginPercent(JOB_at_TotWIPTime{1}; JOB_at_TotWIPTime{2}; ->JOB_at_TotWIPTime{3}; ->JOB_at_TotWIPTime{4})
//
//
JOB_at_TotBudgetCost{1}:=String:C10([JOBS:26]JC_Budget_Sales_ Amount:33; "|Accounts")
JOB_at_TotBudgetCost{2}:=String:C10([JOBS:26]JC_Budget_Cost_Amount:34; "|Accounts")

JOB_at_TotBudgetCost{3}:=""
JOB_at_TotBudgetCost{4}:=""
JC_GetMarginAndMarginPercent(JOB_at_TotBudgetCost{1}; JOB_at_TotBudgetCost{2}; ->JOB_at_TotBudgetCost{3}; ->JOB_at_TotBudgetCost{4})
//
JOB_at_TotActualCost{1}:=String:C10([JOBS:26]JC_Actual_Sales_Amount:32; "|Accounts")
JOB_at_TotActualCost{2}:=String:C10([JOBS:26]AC_Actual_Cost_Amount:10; "|Accounts")
JOB_at_TotActualCost{3}:=""
JOB_at_TotActualCost{4}:=""
JC_GetMarginAndMarginPercent(JOB_at_TotActualCost{1}; JOB_at_TotActualCost{2}; ->JOB_at_TotActualCost{3}; ->JOB_at_TotActualCost{4})
//
JOB_at_TotWIPCost{1}:=String:C10([JOBS:26]JC_WIP_Sales_Amount:53; "|Accounts")
JOB_at_TotWIPCost{2}:=String:C10([JOBS:26]JC_WIP_Cost_Amount:44; "|Accounts")
JOB_at_TotWIPCost{3}:=""
JOB_at_TotWIPCost{4}:=""
JC_GetMarginAndMarginPercent(JOB_at_TotWIPCost{1}; JOB_at_TotWIPCost{2}; ->JOB_at_TotWIPCost{3}; ->JOB_at_TotWIPCost{4})
//
//
JOB_at_TotBudgetTC{1}:=String:C10([JOBS:26]JS_Budget_Sales_Amount:37; "|Accounts")
JOB_at_TotBudgetTC{2}:=String:C10([JOBS:26]JS_Budget_Cost_Amount:38; "|Accounts")
JOB_at_TotBudgetTC{3}:=String:C10([JOBS:26]JS_Budget_Margin:41; "|Accounts")
JOB_at_TotBudgetTC{4}:=String:C10([JOBS:26]JS_Bud_Margin_PC:42; "|PercentNZ")
//
JOB_at_TotActualTC{1}:=String:C10([JOBS:26]JS_Actual_Sales_Amount:35; "|Accounts")
JOB_at_TotActualTC{2}:=String:C10([JOBS:26]JS_Actual_Cost_Amount:36; "|Accounts")
JOB_at_TotActualTC{3}:=String:C10([JOBS:26]JS_Actual_Margin:39; "|Accounts")
JOB_at_TotActualTC{4}:=String:C10([JOBS:26]JS_Actual_Margin_PC:40; "|PercentNZ")
//
JOB_at_TotWIPTC{1}:=String:C10([JOBS:26]JS_WIP_Sales_Amount:54; "|Accounts")
JOB_at_TotWIPTC{2}:=String:C10([JOBS:26]JS_WIP_Cost_Amount:45; "|Accounts")
JOB_at_TotWIPTC{3}:=String:C10([JOBS:26]JS_WIP_Margin:55; "|Accounts")
JOB_at_TotWIPTC{4}:=String:C10([JOBS:26]JS_WIP_MarginPC:56; "|PercentNZ")
//
JOB_at_TotInvExclTC{1}:=String:C10([JOBS:26]AS_Invoice_Excluding_Tax:12; "|Accounts")
JOB_at_TotInvExclTC{2}:="N/A"
JOB_at_TotInvExclTC{3}:="N/A"
JOB_at_TotInvExclTC{4}:="N/A"
//
JOB_at_TotInvInclTC{1}:=String:C10([JOBS:26]AS_Invoice_Including_Tax:13; "|Accounts")
JOB_at_TotInvInclTC{2}:="N/A"
JOB_at_TotInvInclTC{3}:="N/A"
JOB_at_TotInvInclTC{4}:="N/A"
//
ERR_MethodTrackerReturn("JC_JobTotalArraysLoadValues"; $_t_oldMethodName)