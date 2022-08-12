//%attributes = {}
If (False:C215)
	//Project Method Name:      JOB_PrintJobStages
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  15/11/2010 14:54
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_WorkinProgress)
	C_LONGINT:C283($_l_OK; DB_l_CurrentDisplayedForm)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentContext)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JOB_PrintJobStages")
CREATE SET:C116([JOB_STAGES:47]; "$temp")
If (Records in set:C195("ListboxSet0")>0)
	USE SET:C118("ListboxSet0")
End if 
If (OK=1) & (Records in selection:C76([JOB_STAGES:47])>0)
	
	If (Not:C34(SR_ReportOK("JobStList")))
		//Gen_Confirm ("Please choose Print Settings of 90% Portrait to include WIP figure
		$_bo_WorkinProgress:=True:C214
		$_l_OK:=PRINT_SetSIZE("A4"; "P"; "JobStagesList")
		
		If ($_l_OK>=0)
			If ($_bo_WorkinProgress)
				FORM SET OUTPUT:C54([JOB_STAGES:47]; "JobStages_List_90")
			Else 
				FORM SET OUTPUT:C54([JOB_STAGES:47]; "JobStages_List")
			End if 
			
			ORDER BY:C49([JOB_STAGES:47]; [JOB_STAGES:47]Job_Code:1; >; [JOB_STAGES:47]Stage_Code:2; >)
			BREAK LEVEL:C302(1)
			ACCUMULATE:C303([JOB_STAGES:47]AT_Budget_Sales_Amount:8; [JOB_STAGES:47]AS_Quoted_Amount:7; [JOB_STAGES:47]AS_Invoice_Excluding_Tax:9; [JOB_STAGES:47]AT_Actual_Units:5; [JOB_STAGES:47]JT_Actual_Sales_Amount:6; [JOB_STAGES:47]JT_Budget_Units:4; [JOB_STAGES:47]JT_Actual_Cost_Amount:29; [JOB_STAGES:47]JT_Budget_Cost_Amount:30; [JOB_STAGES:47]JC_Actual_Sales_Amount:31; [JOB_STAGES:47]JC_Actual_Cost_Amount:32; [JOB_STAGES:47]JC_Budget_Sales_Amount:33; [JOB_STAGES:47]JC_Budget_Cost_Amount:34; [JOB_STAGES:47]JS_Actual_Sales_Amount:35; [JOB_STAGES:47]JS_Actual_Cost_Amount:36; [JOB_STAGES:47]JS_Budget_Sales_Amount:37; [JOB_STAGES:47]JS_Budget_Cost_Amount:38; [JOB_STAGES:47]JS_Actual_Margin:39; [JOB_STAGES:47]JS_Budget_Margin:41; [JOB_STAGES:47]JT_WIP_Cost_Amount:43; [JOB_STAGES:47]JC_WIP_Cost_Amount:44; [JOB_STAGES:47]JS_WIP_Cost_Amount:45)
			PRINT SELECTION:C60([JOB_STAGES:47])
			PRT_SetPrinterPaperOptions("JobStagesList")  //NG June 2005
		End if 
	End if 
End if 

USE SET:C118("$temp")
DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
ERR_MethodTrackerReturn("JOB_PrintJobStages"; $_t_oldMethodName)