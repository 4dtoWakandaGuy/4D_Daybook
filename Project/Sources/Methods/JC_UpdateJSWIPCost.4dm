//%attributes = {}

If (False:C215)
	//Project Method Name:      JC_UpdateJSWIPCost
	//------------------ Method Notes ------------------
	
	//added 07/03/07 kmw
	
	//updates current job stages's WIP cost totals based on WIP values on current selection of order items/costs
	
	//relies on job stage that is to be updated to be loaded
	//relies on correct (actual) order item costs belonging to that job stage to be in current selection
	
	//used on job input screen to keep on screen job totals correct immediately upon a change in a total on a job stage
	//used by section of process services functionality which is in turn set to run by triggers monitering changes in order item values
	
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

$_t_oldMethodName:=ERR_MethodTracker("JC_UpdateJSWIPCost")



$_l_RecordsinSelection:=Records in selection:C76([ORDER_ITEMS:25])
//
FIRST RECORD:C50([ORDER_ITEMS:25])
//
[JOB_STAGES:47]JC_WIP_Sales_Amount:57:=0
[JOB_STAGES:47]JC_WIP_Cost_Amount:44:=0
//
For ($_l_Recordsindex; 1; $_l_RecordsinSelection)
	If ([ORDER_ITEMS:25]Invoice_Number:17="") | ([ORDER_ITEMS:25]Invoice_Number:17="N")
		[JOB_STAGES:47]JC_WIP_Sales_Amount:57:=[JOB_STAGES:47]JC_WIP_Sales_Amount:57+[ORDER_ITEMS:25]Sales_Amount:7
		[JOB_STAGES:47]JC_WIP_Cost_Amount:44:=[JOB_STAGES:47]JC_WIP_Cost_Amount:44+[ORDER_ITEMS:25]Cost_Amount:15
	End if 
	NEXT RECORD:C51([ORDER_ITEMS:25])
End for 

JC_AdjustJSWIPCost  //added 20/03/07 -kmw (do WIP cost adjustments)
ERR_MethodTrackerReturn("JC_UpdateJSWIPCost"; $_t_oldMethodName)