//%attributes = {}

If (False:C215)
	//Project Method Name:      JC_UpdateJSWIPTC
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JC_UpdateJSWIPTC")

//added 08/03/07 -kmw




[JOB_STAGES:47]JS_WIP_Sales_Amount:58:=[JOB_STAGES:47]JT_WIP_Sales_Amount:56+[JOB_STAGES:47]JC_WIP_Sales_Amount:57
[JOB_STAGES:47]JS_WIP_Cost_Amount:45:=[JOB_STAGES:47]JT_WIP_Cost_Amount:43+[JOB_STAGES:47]JC_WIP_Cost_Amount:44

//JC_AdjustJSWIPTC   `added 20/03/07 -kmw (do WIP cost adjustments)
//removed TC adjustment because adjustments should have already been accounted for at lower level

[JOB_STAGES:47]JS_WIP_Margin:59:=[JOB_STAGES:47]JS_WIP_Sales_Amount:58-[JOB_STAGES:47]JS_WIP_Cost_Amount:45

If ([JOB_STAGES:47]JS_WIP_Sales_Amount:58>0)
	[JOB_STAGES:47]JS_WIP_MarginPC:60:=([JOB_STAGES:47]JS_WIP_Margin:59/[JOB_STAGES:47]JS_WIP_Sales_Amount:58)*100
Else 
	[JOB_STAGES:47]JS_WIP_MarginPC:60:=0
End if 
ERR_MethodTrackerReturn("JC_UpdateJSWIPTC"; $_t_oldMethodName)