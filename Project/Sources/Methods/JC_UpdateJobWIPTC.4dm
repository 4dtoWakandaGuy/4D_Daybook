//%attributes = {}

If (False:C215)
	//Project Method Name:      JC_UpdateJobWIPTC
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

$_t_oldMethodName:=ERR_MethodTracker("JC_UpdateJobWIPTC")

//added 07/03/07 -kmw


$_t_oldMethodName:=ERR_MethodTracker("JC_UpdateJobWIPTC")


[JOBS:26]JS_WIP_Sales_Amount:54:=[JOBS:26]JT_WIP_Sales_Amount:52+[JOBS:26]JC_WIP_Sales_Amount:53
[JOBS:26]JS_WIP_Cost_Amount:45:=[JOBS:26]JT_WIP_Cost_Amount:43+[JOBS:26]JC_WIP_Cost_Amount:44

//JC_AdjustJobWIPTC   `added 20/03/07 -kmw (do WIP cost adjustments)
//removed TC adjustment because adjustments should have already been accounted for at lower level

[JOBS:26]JS_WIP_Margin:55:=[JOBS:26]JS_WIP_Sales_Amount:54-[JOBS:26]JS_WIP_Cost_Amount:45

If ([JOBS:26]JS_WIP_Sales_Amount:54>0)
	[JOBS:26]JS_WIP_MarginPC:56:=([JOBS:26]JS_WIP_Margin:55/[JOBS:26]JS_WIP_Sales_Amount:54)*100
Else 
	[JOBS:26]JS_WIP_MarginPC:56:=0
End if 
ERR_MethodTrackerReturn("JC_UpdateJobWIPTC"; $_t_oldMethodName)