//%attributes = {}

If (False:C215)
	//Project Method Name:      JC_UpdateJSPWIPTime
	//------------------ Method Notes ------------------
	//added 07/03/07 kmw
	
	//updates current job stage personnel's WIP time totals based on actual values on current selection of time/diary records
	
	//relies on job stage personnel that is to be updated to be loaded
	//relies on time diary records belonging to that job stage personnel to be in current selection
	
	//used by section of process services functionality which is in turn set to run by triggers monitering changes in time diary values
	
	//NOTE: JSP WIP figures are identical to JSP actual values up until the Job Stage they belong to is invoiced at which point they become zero
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

$_t_oldMethodName:=ERR_MethodTracker("JC_UpdateJSPWIPTime")


$_l_RecordsinSelection:=Records in selection:C76([DIARY:12])
//
FIRST RECORD:C50([DIARY:12])
//
[JOB PERSONNEL:48]JT_WIP_Sales_Amount:20:=0
[JOB PERSONNEL:48]JT_WIP_Cost_Amount:19:=0
[JOB PERSONNEL:48]JT_WIP_Units:21:=0
//
READ ONLY:C145([JOB_STAGES:47])
JC_FindJSFromJSP
//
If ([JOB_STAGES:47]Invoice_Number:10="") | ([JOB_STAGES:47]Invoice_Number:10="N")
	For ($_l_Recordsindex; 1; $_l_RecordsinSelection)
		[JOB PERSONNEL:48]JT_WIP_Sales_Amount:20:=[JOB PERSONNEL:48]JT_WIP_Sales_Amount:20+[DIARY:12]Value:16
		[JOB PERSONNEL:48]JT_WIP_Cost_Amount:19:=[JOB PERSONNEL:48]JT_WIP_Cost_Amount:19+([DIARY:12]Units:20*[JOB PERSONNEL:48]JT_Cost_Rate:9)
		[JOB PERSONNEL:48]JT_WIP_Units:21:=[JOB PERSONNEL:48]JT_WIP_Units:21+[DIARY:12]Units:20
		NEXT RECORD:C51([DIARY:12])
	End for 
End if 
ERR_MethodTrackerReturn("JC_UpdateJSPWIPTime"; $_t_oldMethodName)