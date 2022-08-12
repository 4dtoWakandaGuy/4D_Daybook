//%attributes = {}
If (False:C215)
	//Project Method Name:      JC_UpdateJobActualCost
	//------------------ Method Notes ------------------
	//added 09/02/07 kmw
	
	//updates current job's actual cost totals based on actual totals on current selection of job stages
	
	//relies on job that is to be updated to be loaded
	//relies on job stages belonging to that job to be in current selection
	//relies on correct (actual) order items belonging to that job (but that do not belong to a specific job stage) to be in the current selection
	
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
	C_LONGINT:C283($_l_Recordsindex; $_l_RecordsinSelection)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JC_UpdateJobActualCost")

//
[JOBS:26]JC_Actual_Sales_Amount:32:=Sum:C1([JOB_STAGES:47]JC_Actual_Sales_Amount:31)+Sum:C1([ORDER_ITEMS:25]Sales_Amount:7)
[JOBS:26]AC_Actual_Cost_Amount:10:=Sum:C1([JOB_STAGES:47]JC_Actual_Cost_Amount:32)+Sum:C1([ORDER_ITEMS:25]Cost_Amount:15)
//
If (False:C215)
	//
	[JOBS:26]JC_Actual_Sales_Amount:32:=0
	[JOBS:26]AC_Actual_Cost_Amount:10:=0
	//
	//
	$_l_RecordsinSelection:=Records in selection:C76([JOB_STAGES:47])
	//
	FIRST RECORD:C50([JOB_STAGES:47])
	//
	For ($_l_Recordsindex; 1; $_l_RecordsinSelection)
		[JOBS:26]JC_Actual_Sales_Amount:32:=[JOBS:26]JC_Actual_Sales_Amount:32+[JOB_STAGES:47]JC_Actual_Sales_Amount:31
		[JOBS:26]AC_Actual_Cost_Amount:10:=[JOBS:26]AC_Actual_Cost_Amount:10+[JOB_STAGES:47]JC_Actual_Cost_Amount:32
		NEXT RECORD:C51([JOB_STAGES:47])
	End for 
	//
	//
	$_l_RecordsinSelection:=Records in selection:C76([ORDER_ITEMS:25])
	//
	FIRST RECORD:C50([ORDER_ITEMS:25])
	//
	For ($_l_Recordsindex; 1; $_l_RecordsinSelection)
		If ([ORDER_ITEMS:25]State:46="A")
			[JOBS:26]JC_Actual_Sales_Amount:32:=[JOBS:26]JC_Actual_Sales_Amount:32+[ORDER_ITEMS:25]Sales_Amount:7
			[JOBS:26]AC_Actual_Cost_Amount:10:=[JOBS:26]AC_Actual_Cost_Amount:10+[ORDER_ITEMS:25]Cost_Amount:15
		End if 
		NEXT RECORD:C51([ORDER_ITEMS:25])
	End for 
	//
End if 
ERR_MethodTrackerReturn("JC_UpdateJobActualCost"; $_t_oldMethodName)