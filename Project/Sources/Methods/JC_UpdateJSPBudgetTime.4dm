//%attributes = {}
If (False:C215)
	//Project Method Name:      JC_UpdateJSPBudgetTime
	//------------------ Method Notes ------------------
	//added 09/02/07 kmw
	
	//updates current job stage personnel's budget time totals based on budget values on current selection of time/diary records
	
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

$_t_oldMethodName:=ERR_MethodTracker("JC_UpdateJSPBudgetTime")

$_l_RecordsinSelection:=Records in selection:C76([DIARY:12])
//
FIRST RECORD:C50([DIARY:12])
//
[JOB PERSONNEL:48]JT_Budget_Sales_Amount:8:=0
[JOB PERSONNEL:48]JT_Budget_Cost_Amount:11:=0
[JOB PERSONNEL:48]JT_Budget_Units:4:=0
//
For ($_l_Recordsindex; 1; $_l_RecordsinSelection)
	[JOB PERSONNEL:48]JT_Budget_Sales_Amount:8:=[JOB PERSONNEL:48]JT_Budget_Sales_Amount:8+([DIARY:12]Budget_Units:70*[DIARY:12]Charge_Rate:22)  //[DIARY]Value (there is currently no equiv budget field for actual value so just calc on the fly)
	[JOB PERSONNEL:48]JT_Budget_Cost_Amount:11:=[JOB PERSONNEL:48]JT_Budget_Cost_Amount:11+([DIARY:12]Budget_Units:70*[JOB PERSONNEL:48]JT_Cost_Rate:9)
	[JOB PERSONNEL:48]JT_Budget_Units:4:=[JOB PERSONNEL:48]JT_Budget_Units:4+[DIARY:12]Budget_Units:70
	NEXT RECORD:C51([DIARY:12])
End for 
ERR_MethodTrackerReturn("JC_UpdateJSPBudgetTime"; $_t_oldMethodName)