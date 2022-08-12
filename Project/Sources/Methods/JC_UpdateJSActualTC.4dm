//%attributes = {}
If (False:C215)
	//Project Method Name:      JC_UpdateJSActualTC
	//------------------ Method Notes ------------------
	
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

//added kmw


$_t_oldMethodName:=ERR_MethodTracker("JC_UpdateJSActualTC")


[JOB_STAGES:47]JS_Actual_Sales_Amount:35:=[JOB_STAGES:47]JT_Actual_Sales_Amount:6+[JOB_STAGES:47]JC_Actual_Sales_Amount:31
[JOB_STAGES:47]JS_Actual_Cost_Amount:36:=[JOB_STAGES:47]JT_Actual_Cost_Amount:29+[JOB_STAGES:47]JC_Actual_Cost_Amount:32

[JOB_STAGES:47]JS_Actual_Margin:39:=[JOB_STAGES:47]JS_Actual_Sales_Amount:35-[JOB_STAGES:47]JS_Actual_Cost_Amount:36

If ([JOB_STAGES:47]JS_Actual_Sales_Amount:35>0)
	[JOB_STAGES:47]JS_Actual_Margin_PC:40:=([JOB_STAGES:47]JS_Actual_Margin:39/[JOB_STAGES:47]JS_Actual_Sales_Amount:35)*100
Else 
	[JOB_STAGES:47]JS_Actual_Margin_PC:40:=0
End if 
ERR_MethodTrackerReturn("JC_UpdateJSActualTC"; $_t_oldMethodName)