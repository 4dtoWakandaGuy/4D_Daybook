//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      JobStages List
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/02/2010 16:30
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Continue; $_bo_WorkinProgress)
	C_LONGINT:C283($_l_OK; vA; vAB; vC; vCalls; vCM; vContr; vD; vF; vJ; vNo)
	C_LONGINT:C283(vO; vP; vPu; vR; vRE; vST; vTR)
	C_TEXT:C284($_t_CurrentOutputform; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JobStages List")
//JobStages List
$_t_CurrentOutputform:=WIN_t_CurrentOutputform
Start_Process
$_bo_Continue:=JobStages_File
While (vJ=1) & ($_bo_Continue)
	JobStages_Sel
	If (vJ=1)
		If (Records in selection:C76([JOB_STAGES:47])>0)
			CREATE SET:C116([JOB_STAGES:47]; "Master")
			vNo:=Records in selection:C76([JOB_STAGES:47])
			DB_t_CurrentFormUsage:="Print"
			Open_Pro_Window("Job Stages List"; 0; 1; ->[JOB_STAGES:47]; WIN_t_CurrentOutputform)
			FS_SetFormSort(WIN_t_CurrentOutputform)
			WIn_SetFormSize(1; ->[JOB_STAGES:47]; WIN_t_CurrentOutputform)
			DISPLAY SELECTION:C59([JOB_STAGES:47]; *)
			If (OK=1)
				If (Not:C34(SR_ReportOK("JobStList")))
					//Gen_Confirm ("Please choose Print Settings of 90% Portrait to include WIP figure
					$_bo_WorkinProgress:=True:C214
					$_l_OK:=PRINT_SetSIZE("A4"; "P"; "JobStagesList")
					
					If ($_l_OK>=0)
						If ($_bo_WorkinProgress)
							FORM SET OUTPUT:C54([JOB_STAGES:47]; "JobStages_List_90")
						Else 
							FORM SET OUTPUT:C54([JOB_STAGES:47]; "JobStages List")
						End if 
						
						ORDER BY:C49([JOB_STAGES:47]; [JOB_STAGES:47]Job_Code:1; >; [JOB_STAGES:47]Stage_Code:2; >)
						BREAK LEVEL:C302(1)
						ACCUMULATE:C303([JOB_STAGES:47]AT_Budget_Sales_Amount:8; [JOB_STAGES:47]AS_Quoted_Amount:7; [JOB_STAGES:47]AS_Invoice_Excluding_Tax:9; [JOB_STAGES:47]AT_Actual_Units:5; [JOB_STAGES:47]JT_Actual_Sales_Amount:6; [JOB_STAGES:47]JT_Budget_Units:4; [JOB_STAGES:47]JT_Actual_Cost_Amount:29; [JOB_STAGES:47]JT_Budget_Cost_Amount:30; [JOB_STAGES:47]JC_Actual_Sales_Amount:31; [JOB_STAGES:47]JC_Actual_Cost_Amount:32; [JOB_STAGES:47]JC_Budget_Sales_Amount:33; [JOB_STAGES:47]JC_Budget_Cost_Amount:34; [JOB_STAGES:47]JS_Actual_Sales_Amount:35; [JOB_STAGES:47]JS_Actual_Cost_Amount:36; [JOB_STAGES:47]JS_Budget_Sales_Amount:37; [JOB_STAGES:47]JS_Budget_Cost_Amount:38; [JOB_STAGES:47]JS_Actual_Margin:39; [JOB_STAGES:47]JS_Budget_Margin:41; [JOB_STAGES:47]JT_WIP_Cost_Amount:43; [JOB_STAGES:47]JC_WIP_Cost_Amount:44; [JOB_STAGES:47]JS_WIP_Cost_Amount:45)
						PRINT SELECTION:C60([JOB_STAGES:47])
						PRT_SetPrinterPaperOptions("JobStagesList")  //NG June 2005
					End if 
				End if 
			End if 
			Close_ProWin
			vJ:=0
		Else 
			Gen_None("Job Stages"; ->vJ)
		End if 
	End if 
End while 
Process_End
WIN_t_CurrentOutputform:=$_t_CurrentOutputform
ERR_MethodTrackerReturn("JobStages List"; $_t_oldMethodName)