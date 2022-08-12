//%attributes = {}
If (False:C215)
	//Project Method Name:      JC_UpdateJobActualTime
	//------------------ Method Notes ------------------
	//added 09/02/07 kmw
	
	//updates current job's actual time totals based on actual totals on current selection of job stages
	
	//relies on job that is to be updated to be loaded
	//relies on job stages belonging to that job to be in current selection
	
	//used on job input screen to keep on screen job totals correct immediately upon a change in a total on a job stage
	//used by section of process services functionality which is in turn set to run by triggers monitering changes in job stage totals
	
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

$_t_oldMethodName:=ERR_MethodTracker("JC_UpdateJobActualTime")

//
[JOBS:26]J_ Actual_Sales_Amount:17:=Sum:C1([JOB_STAGES:47]JT_Actual_Sales_Amount:6)
[JOBS:26]JT_Actual_Cost_Amount:31:=Sum:C1([JOB_STAGES:47]JT_Actual_Cost_Amount:29)
[JOBS:26]AT_Actual_Units:16:=Sum:C1([JOB_STAGES:47]AT_Actual_Units:5)
//
ERR_MethodTrackerReturn("JC_UpdateJobActualTime"; $_t_oldMethodName)