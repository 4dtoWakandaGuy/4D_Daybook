//%attributes = {}
If (False:C215)
	//Project Method Name:      JC_UpdateJobBudgetCost
	//------------------ Method Notes ------------------
	//added 09/02/07 kmw
	
	//updates current job's budget cost totals based on budget totals on current selection of job stages
	
	//relies on job that is to be updated to be loaded
	//relies on job stages belonging to that job to be in current selection
	//relies on correct (budget) order items belonging to that job (but that do not belong to a specific job stage) to be in the current selection
	
	//used on job input screen to keep on screen job totals correct immediately upon a change in a total on a job stage
	//used by section of process services functionality which is in turn set to run by triggers monitering changes in job stage totals
	
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

$_t_oldMethodName:=ERR_MethodTracker("JC_UpdateJobBudgetCost")
[JOBS:26]JC_Budget_Sales_ Amount:33:=Sum:C1([JOB_STAGES:47]JC_Budget_Sales_Amount:33)+Sum:C1([ORDER_ITEMS:25]Sales_Amount:7)
[JOBS:26]JC_Budget_Cost_Amount:34:=Sum:C1([JOB_STAGES:47]JC_Budget_Cost_Amount:34)+Sum:C1([ORDER_ITEMS:25]Cost_Amount:15)
ERR_MethodTrackerReturn("JC_UpdateJobBudgetCost"; $_t_oldMethodName)