//%attributes = {}

If (False:C215)
	//Project Method Name:      JC_JSTotalArraysInit
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
	//ARRAY TEXT(JS_at_TotInvExlTC;0)
	//ARRAY TEXT(JS_at_TotInvIncTC;0)
	//ARRAY TEXT(JS_at_TotLeftHandLabel;0)
	//ARRAY TEXT(JS_at_TotQuotedTime;0)
	//ARRAY TEXT(JS_at_TotWIPCost;0)
	//ARRAY TEXT(JS_at_TotWIPTC;0)
	//ARRAY TEXT(JS_at_TotWIPTime;0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JC_JSTotalArraysInit")

//
//added 14/03/07 -kmw
//
//
$_t_oldMethodName:=ERR_MethodTracker("JC_JSTotalArraysInit")



ARRAY TEXT:C222(JS_at_TotLeftHandLabel; 0)  //Row headings will be Sales, Cost (cost as in cost value to company), Margin and Margin %
//
//time totals
ARRAY TEXT:C222(JS_at_TotQuotedTime; 0)  //Sales
ARRAY TEXT:C222(JS_at_TotBudgetTime; 0)  //Sales, Cost (cost as in cost value to company)
ARRAY TEXT:C222(JS_at_TotActualTime; 0)  //Sales, Cost (cost as in cost value to company)
ARRAY TEXT:C222(JS_at_TotWIPTime; 0)  //Sales, Cost (cost as in cost value to company)
//
//cost totals (costs as in materials/items used (non-labour))
ARRAY TEXT:C222(JS_at_TotBudgetCost; 0)  //Sales, Cost (cost as in cost value to company)
ARRAY TEXT:C222(JS_at_TotActualCost; 0)  //Sales, Cost (cost as in cost value to company)
ARRAY TEXT:C222(JS_at_TotWIPCost; 0)  //Sales, Cost (cost as in cost value to company)
//
//combined totals
ARRAY TEXT:C222(JS_at_TotBudgetTC; 0)  //Sales, Cost (cost as in cost value to company), Margin and Margin %
ARRAY TEXT:C222(JS_at_TotActualTC; 0)  //Sales, Cost (cost as in cost value to company), Margin and Margin %
ARRAY TEXT:C222(JS_at_TotWIPTC; 0)  //Sales, Cost (cost as in cost value to company), Margin and Margin %
ARRAY TEXT:C222(JS_at_TotInvExlTC; 0)  //Sales
ARRAY TEXT:C222(JS_at_TotInvIncTC; 0)  //Sales
//
//
ERR_MethodTrackerReturn("JC_JSTotalArraysInit"; $_t_oldMethodName)