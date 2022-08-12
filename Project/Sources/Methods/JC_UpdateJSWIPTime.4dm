//%attributes = {}

If (False:C215)
	//Project Method Name:      JC_UpdateJSWIPTime
	//------------------ Method Notes ------------------
	//added 07/03/07 kmw
	
	//updates current job stage's WIP time totals based on WIP totals on current selection of job stage personnel
	
	//relies on job stage that is to be updated to be loaded
	//relies on job stage personnel belonging to that job stage to be in current selection
	
	//used on job stage input screen to keep on screen job stage totals correct immediately upon a change in a total on a job stage personnel
	//used by section of process services functionality which is in turn set to run by triggers monitering changes in job personnel totals
	
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

$_t_oldMethodName:=ERR_MethodTracker("JC_UpdateJSWIPTime")




$_l_RecordsinSelection:=Records in selection:C76([JOB PERSONNEL:48])
//
FIRST RECORD:C50([JOB PERSONNEL:48])
//
[JOB_STAGES:47]JT_WIP_Sales_Amount:56:=0
[JOB_STAGES:47]JT_WIP_Cost_Amount:43:=0
[JOB_STAGES:47]JT_WIP_Units:55:=0
//
If ([JOB_STAGES:47]Invoice_Number:10="") | ([JOB_STAGES:47]Invoice_Number:10="N")
	For ($_l_Recordsindex; 1; $_l_RecordsinSelection)
		[JOB_STAGES:47]JT_WIP_Sales_Amount:56:=[JOB_STAGES:47]JT_WIP_Sales_Amount:56+[JOB PERSONNEL:48]JT_WIP_Sales_Amount:20
		[JOB_STAGES:47]JT_WIP_Cost_Amount:43:=[JOB_STAGES:47]JT_WIP_Cost_Amount:43+[JOB PERSONNEL:48]JT_WIP_Cost_Amount:19
		[JOB_STAGES:47]JT_WIP_Units:55:=[JOB_STAGES:47]JT_WIP_Units:55+[JOB PERSONNEL:48]JT_WIP_Units:21
		NEXT RECORD:C51([JOB PERSONNEL:48])
	End for 
End if 

//
JC_AdjustJSWIPTime  //added 20/03/07 -kmw (do WIP cost adjustments)
ERR_MethodTrackerReturn("JC_UpdateJSWIPTime"; $_t_oldMethodName)