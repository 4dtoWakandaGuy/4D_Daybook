//%attributes = {}

If (False:C215)
	//Project Method Name:      JC_UpdateJobWIPTime
	//------------------ Method Notes ------------------
	//added 07/03/07 kmw
	
	//updates current Job's WIP time totals based on WIP totals on current selection of job stages
	
	//relies on Job that is to be updated to be loaded
	//relies on Job stages belonging to that job to be in current selection
	
	//used on Job input screen to keep on screen job totals correct immediately upon a change in a total on a job stage
	//used by section of process services functionality which is in turn set to run by triggers monitering changes in job stage totals
	
	//NOTE: Job Time WIP figures should equal total of non-invoiced Time Actual values for JSP's that belong to that Job (which is of course equal to total of Time WIP values for JSP's that belong to that Job )
	//
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Recordsindex; $_l_RecordsinSelection)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JC_UpdateJobWIPTime")

$_l_RecordsinSelection:=Records in selection:C76([JOB_STAGES:47])
//
FIRST RECORD:C50([JOB_STAGES:47])
//
[JOBS:26]JT_WIP_Sales_Amount:52:=0
[JOBS:26]JT_WIP_Cost_Amount:43:=0
[JOBS:26]JT_WIP_Units:51:=0
//
For ($_l_Recordsindex; 1; $_l_RecordsinSelection)
	If ([JOB_STAGES:47]Invoice_Number:10="") | ([JOB_STAGES:47]Invoice_Number:10="N")
		[JOBS:26]JT_WIP_Sales_Amount:52:=[JOBS:26]JT_WIP_Sales_Amount:52+[JOB_STAGES:47]JT_WIP_Sales_Amount:56
		[JOBS:26]JT_WIP_Cost_Amount:43:=[JOBS:26]JT_WIP_Cost_Amount:43+[JOB_STAGES:47]JT_WIP_Cost_Amount:43
		[JOBS:26]JT_WIP_Units:51:=[JOBS:26]JT_WIP_Units:51+[JOB_STAGES:47]JT_WIP_Units:55
	End if 
	NEXT RECORD:C51([JOB_STAGES:47])
End for 
//
JC_AdjustJobWIPTime  //added 20/03/07 -kmw (do WIP cost adjustments)
ERR_MethodTrackerReturn("JC_UpdateJobWIPTime"; $_t_oldMethodName)