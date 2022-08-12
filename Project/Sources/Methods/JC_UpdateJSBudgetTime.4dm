//%attributes = {}
If (False:C215)
	//Project Method Name:      JC_UpdateJSBudgetTime
	//------------------ Method Notes ------------------
	//added 09/02/07 kmw
	
	//updates current job stage's budget time totals based on budget totals on current selection of job stage personnel
	
	//relies on job stage that is to be updated to be loaded
	//relies on job stage personnel belonging to that job stage to be in current selection
	
	//used on job stage input screen to keep on screen job stage totals correct immediately upon a change in a total on a job stage personnel
	//used by section of process services functionality which is in turn set to run by triggers monitering changes in job personnel totals
	
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

$_t_oldMethodName:=ERR_MethodTracker("JC_UpdateJSBudgetTime")

[JOB_STAGES:47]AT_Budget_Sales_Amount:8:=Sum:C1([JOB PERSONNEL:48]JT_Budget_Sales_Amount:8)
[JOB_STAGES:47]JT_Budget_Cost_Amount:30:=Sum:C1([JOB PERSONNEL:48]JT_Budget_Cost_Amount:11)
[JOB_STAGES:47]JT_Budget_Units:4:=Sum:C1([JOB PERSONNEL:48]JT_Budget_Units:4)
ERR_MethodTrackerReturn("JC_UpdateJSBudgetTime"; $_t_oldMethodName)