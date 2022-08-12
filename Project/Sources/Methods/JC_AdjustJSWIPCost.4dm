//%attributes = {}

If (False:C215)
	//Project Method Name:      JC_AdjustJSWIPCost
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
	C_BOOLEAN:C305($_bo_PostiveAjustment; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JC_AdjustJSWIPCost")

//added 20/03/07 -kmw (do WIP cost adjustments)

//NOTE: these adjustments having their own methods a bit of overkill but had originally thought there would be more than just cost WIP adjustments and that it woul dbe neccessary to do this from several places

$_t_oldMethodName:=ERR_MethodTracker("JC_AdjustJSWIPCost")
//
//
If (Count parameters:C259>0)
	$_bo_PostiveAjustment:=$1
Else 
	$_bo_PostiveAjustment:=True:C214
End if 

If ($_bo_PostiveAjustment)
	[JOB_STAGES:47]JC_WIP_Cost_Amount:44:=[JOB_STAGES:47]JC_WIP_Cost_Amount:44+[JOB_STAGES:47]JC_WIP_Cost_Amount_Adjusted:61
Else 
	[JOB_STAGES:47]JC_WIP_Cost_Amount:44:=[JOB_STAGES:47]JC_WIP_Cost_Amount:44-[JOB_STAGES:47]JC_WIP_Cost_Amount_Adjusted:61
End if 
ERR_MethodTrackerReturn("JC_AdjustJSWIPCost"; $_t_oldMethodName)