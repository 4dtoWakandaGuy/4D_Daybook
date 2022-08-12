//%attributes = {}
If (False:C215)
	//Project Method Name:      JC_UpdateJSBudgetTC
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
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

//added kmw


$_t_oldMethodName:=ERR_MethodTracker("JC_UpdateJSBudgetTC")



[JOB_STAGES:47]JS_Budget_Sales_Amount:37:=[JOB_STAGES:47]AT_Budget_Sales_Amount:8+[JOB_STAGES:47]JC_Budget_Sales_Amount:33
[JOB_STAGES:47]JS_Budget_Cost_Amount:38:=[JOB_STAGES:47]JT_Budget_Cost_Amount:30+[JOB_STAGES:47]JC_Budget_Cost_Amount:34

[JOB_STAGES:47]JS_Budget_Margin:41:=[JOB_STAGES:47]JS_Budget_Sales_Amount:37-[JOB_STAGES:47]JS_Budget_Cost_Amount:38

If ([JOB_STAGES:47]JS_Budget_Sales_Amount:37>0)
	[JOB_STAGES:47]JS_Budget_Margin_PC:42:=([JOB_STAGES:47]JS_Budget_Margin:41/[JOB_STAGES:47]JS_Budget_Sales_Amount:37)*100
Else 
	[JOB_STAGES:47]JS_Budget_Margin_PC:42:=0
End if 
ERR_MethodTrackerReturn("JC_UpdateJSBudgetTC"; $_t_oldMethodName)