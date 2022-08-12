//%attributes = {}
If (False:C215)
	//Project Method Name:      JC_UpdateJSBudgetCost
	//------------------ Method Notes ------------------
	//added 09/02/07 kmw
	
	//updates current job stages's budget cost totals based on values on current selection of order items/costs
	
	//relies on job stage that is to be updated to be loaded
	//relies on correct (budget) order item costs belonging to that job stage to be in current selection
	
	//used on job input screen to keep on screen job totals correct immediately upon a change in a total on a job stage
	//used by section of process services functionality which is in turn set to run by triggers monitering changes in order item values
	
	//
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

$_t_oldMethodName:=ERR_MethodTracker("JC_UpdateJSBudgetCost")

[JOB_STAGES:47]JC_Budget_Sales_Amount:33:=Sum:C1([ORDER_ITEMS:25]Sales_Amount:7)
[JOB_STAGES:47]JC_Budget_Cost_Amount:34:=Sum:C1([ORDER_ITEMS:25]Cost_Amount:15)
//
ERR_MethodTrackerReturn("JC_UpdateJSBudgetCost"; $_t_oldMethodName)