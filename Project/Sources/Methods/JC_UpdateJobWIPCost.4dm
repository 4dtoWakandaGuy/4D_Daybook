//%attributes = {}

If (False:C215)
	//Project Method Name:      JC_UpdateJobWIPCost
	//------------------ Method Notes ------------------
	
	//added 09/02/07 kmw
	
	//updates current job's WIP cost totals based on WIP totals on current selection of job stages and current selection of order items
	
	//relies on job that is to be updated to be loaded
	//relies on job stages belonging to that job to be in current selection
	//relies on correct (actual) order items belonging to that job (but that do not belong to a specific job stage) to be in the current selection
	
	//used on job input screen to keep on screen job totals correct immediately upon a change in a total on a job stage
	//used by section of process services functionality which is in turn set to run by triggers monitering changes in job stage totals
	
	//NOTE: Job Cost WIP figures should equal total of Cost WIP values for JSP's that belong to that Job + total of non-invoiced Cost Itemss that belong direct to that Job (ie those not connected to a specific Job Stage on that Job)
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

$_t_oldMethodName:=ERR_MethodTracker("JC_UpdateJobWIPCost")


//
//
//
[JOBS:26]JC_WIP_Sales_Amount:53:=0
[JOBS:26]JC_WIP_Cost_Amount:44:=0


//
//
$_l_RecordsinSelection:=Records in selection:C76([JOB_STAGES:47])
//
FIRST RECORD:C50([JOB_STAGES:47])
//
For ($_l_Recordsindex; 1; $_l_RecordsinSelection)  //NOTE: here we don't need to check if each job stage is invoiced because we are totaling Job Stage WIP values not Job Stage Actual values (unlike Actual values, WIP values will have been set to 0 for any Job Stage that is invoiced)
	[JOBS:26]JC_WIP_Sales_Amount:53:=[JOBS:26]JC_WIP_Sales_Amount:53+[JOB_STAGES:47]JC_WIP_Sales_Amount:57
	[JOBS:26]JC_WIP_Cost_Amount:44:=[JOBS:26]JC_WIP_Cost_Amount:44+[JOB_STAGES:47]JC_WIP_Cost_Amount:44
	NEXT RECORD:C51([JOB_STAGES:47])
End for 
//
//
$_l_RecordsinSelection:=Records in selection:C76([ORDER_ITEMS:25])
//
FIRST RECORD:C50([ORDER_ITEMS:25])
//
For ($_l_Recordsindex; 1; $_l_RecordsinSelection)
	If ([ORDER_ITEMS:25]Invoice_Number:17="") | ([ORDER_ITEMS:25]Invoice_Number:17="N")
		[JOBS:26]JC_WIP_Sales_Amount:53:=[JOBS:26]JC_WIP_Sales_Amount:53+[ORDER_ITEMS:25]Sales_Amount:7
		[JOBS:26]JC_WIP_Cost_Amount:44:=[JOBS:26]JC_WIP_Cost_Amount:44+[ORDER_ITEMS:25]Cost_Amount:15
	End if 
	NEXT RECORD:C51([ORDER_ITEMS:25])
End for 
//
JC_AdjustJobWIPCost  //added 20/03/07 -kmw (do WIP cost adjustments)
ERR_MethodTrackerReturn("JC_UpdateJobWIPCost"; $_t_oldMethodName)