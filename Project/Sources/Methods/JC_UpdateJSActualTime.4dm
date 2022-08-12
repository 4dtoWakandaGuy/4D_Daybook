//%attributes = {}
If (False:C215)
	//Project Method Name:      JC_UpdateJSActualTime
	//------------------ Method Notes ------------------
	//added 09/02/07 kmw
	
	//updates current job stage's actual time totals based on actual totals on current selection of job stage personnel
	
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

$_t_oldMethodName:=ERR_MethodTracker("JC_UpdateJSActualTime")

[JOB_STAGES:47]JT_Actual_Sales_Amount:6:=Sum:C1([JOB PERSONNEL:48]JT_Act_Sales_Amount:6)
[JOB_STAGES:47]JT_Actual_Cost_Amount:29:=Sum:C1([JOB PERSONNEL:48]JT_Actual_Cost_Amount:10)
[JOB_STAGES:47]AT_Actual_Units:5:=Sum:C1([JOB PERSONNEL:48]JT_Actual_Units:5)
ERR_MethodTrackerReturn("JC_UpdateJSActualTime"; $_t_oldMethodName)