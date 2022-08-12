//%attributes = {}
If (False:C215)
	//Project Method Name:      JC_UpdateJSPActualTime
	//------------------ Method Notes ------------------
	//added 09/02/07 kmw
	
	//updates current job stage personnel's actual time totals based on actual values on current selection of time/diary records
	
	//relies on job stage personnel that is to be updated to be loaded
	//relies on time diary records belonging to that job stage personnel to be in current selection
	
	//used by section of process services functionality which is in turn set to run by triggers monitering changes in time diary values
	
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
	C_LONGINT:C283($_l_Recordsindex; $_l_RecordsinSelection)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JC_UpdateJSPActualTime")

$_l_RecordsinSelection:=Records in selection:C76([DIARY:12])
//
FIRST RECORD:C50([DIARY:12])
//
[JOB PERSONNEL:48]JT_Act_Sales_Amount:6:=0
[JOB PERSONNEL:48]JT_Actual_Cost_Amount:10:=0
[JOB PERSONNEL:48]JT_Actual_Units:5:=0
//
For ($_l_Recordsindex; 1; $_l_RecordsinSelection)
	[JOB PERSONNEL:48]JT_Act_Sales_Amount:6:=[JOB PERSONNEL:48]JT_Act_Sales_Amount:6+[DIARY:12]Value:16
	//[JOB PERSONNEL]JT Act Cost Am:=[JOB PERSONNEL]JT Act Cost Am+([DIARY]Units*[JOB PERSONNEL]JT Cost Rate)
	[JOB PERSONNEL:48]JT_Actual_Cost_Amount:10:=[JOB PERSONNEL:48]JT_Actual_Cost_Amount:10+[DIARY:12]Cost_Value:75
	[JOB PERSONNEL:48]JT_Actual_Units:5:=[JOB PERSONNEL:48]JT_Actual_Units:5+[DIARY:12]Units:20
	NEXT RECORD:C51([DIARY:12])
End for 
ERR_MethodTrackerReturn("JC_UpdateJSPActualTime"; $_t_oldMethodName)