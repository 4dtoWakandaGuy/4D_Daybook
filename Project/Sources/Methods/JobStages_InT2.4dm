//%attributes = {}
If (False:C215)
	//Project Method Name:      JobStages_InT2
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

$_t_oldMethodName:=ERR_MethodTracker("JobStages_InT2")

If (False:C215)  //blanked out 12/03/07 -kmw (totals now updated using new JC methods called from List Box object)
	//*********************************************************************************
	[JOB_STAGES:47]JS_Actual_Sales_Amount:35:=Gen_Round(([JOB_STAGES:47]JT_Actual_Sales_Amount:6+[JOB_STAGES:47]JC_Actual_Sales_Amount:31); 2; 2)
	[JOB_STAGES:47]JS_Actual_Cost_Amount:36:=Gen_Round(([JOB_STAGES:47]JT_Actual_Cost_Amount:29+[JOB_STAGES:47]JC_Actual_Cost_Amount:32); 2; 2)
	[JOB_STAGES:47]JS_Budget_Sales_Amount:37:=Gen_Round(([JOB_STAGES:47]AT_Budget_Sales_Amount:8+[JOB_STAGES:47]JC_Budget_Sales_Amount:33); 2; 2)
	[JOB_STAGES:47]JS_Budget_Cost_Amount:38:=Gen_Round(([JOB_STAGES:47]JT_Budget_Cost_Amount:30+[JOB_STAGES:47]JC_Budget_Cost_Amount:34); 2; 2)
	[JOB_STAGES:47]JS_Actual_Margin:39:=Gen_Round(([JOB_STAGES:47]JS_Actual_Sales_Amount:35-[JOB_STAGES:47]JS_Actual_Cost_Amount:36); 2; 2)
	If ([JOB_STAGES:47]JS_Actual_Sales_Amount:35#0)
		[JOB_STAGES:47]JS_Actual_Margin_PC:40:=Gen_Round((([JOB_STAGES:47]JS_Actual_Margin:39/[JOB_STAGES:47]JS_Actual_Sales_Amount:35)*100); 2; 4)
	Else 
		[JOB_STAGES:47]JS_Actual_Margin_PC:40:=0
	End if 
	[JOB_STAGES:47]JS_Budget_Margin:41:=Gen_Round(([JOB_STAGES:47]JS_Budget_Sales_Amount:37-[JOB_STAGES:47]JS_Budget_Cost_Amount:38); 2; 2)
	If ([JOB_STAGES:47]JS_Budget_Sales_Amount:37#0)
		[JOB_STAGES:47]JS_Budget_Margin_PC:42:=Gen_Round((([JOB_STAGES:47]JS_Budget_Margin:41/[JOB_STAGES:47]JS_Budget_Sales_Amount:37)*100); 2; 4)
	Else 
		[JOB_STAGES:47]JS_Budget_Margin_PC:42:=0
	End if 
	//*********************************************************************************
End if   //blanked out 12/03/07 -kmw (totals now updated using new JC methods called from List Box object)
ERR_MethodTrackerReturn("JobStages_InT2"; $_t_oldMethodName)