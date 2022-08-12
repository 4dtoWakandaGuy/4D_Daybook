//%attributes = {}
If (False:C215)
	//Project Method Name:      Jobs_InvWIP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  28/11/2010 21:25
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_UpdateCosts; $_bo_UpdateStageCosts; $_bo_WipPosted)
	C_TEXT:C284(<>WIP_t_CIPTRANS; <>WIP_t_TRPTrans; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Jobs_InvWIP")
//Jobs_InvWIP

If (OK=1)
	If (([JOB_STAGES:47]Invoice_Number:10#[INVOICES:39]Invoice_Number:1) & ([INVOICES:39]Invoice_Date:4#!00-00-00!))
		DB_lockFile(->[JOB_STAGES:47])
		APPLY TO SELECTION:C70([JOB_STAGES:47]; [JOB_STAGES:47]Invoice_Number:10:=[INVOICES:39]Invoice_Number:1)
		
		AA_CheckFileUnlockedByTableNUM(Table:C252(->[JOB_STAGES:47]))
	End if 
	If ((DB_GetModuleSettingByNUM(Module_NominalLedger)>0) & (<>WIP_t_TRPTrans#"") & (<>WIP_t_CIPTRANS#"") & ([JOBS:26]Use_WIP:47))
		StartTransaction
		Jobs_WIPStart("WIP Posting on creating Sales Invoice"; [INVOICES:39]Invoice_Date:4)
		
		$_bo_UpdateCosts:=False:C215
		FIRST RECORD:C50([JOB_STAGES:47])
		While ((Not:C34(End selection:C36([JOB_STAGES:47]))) & (OK=1))
			$_bo_UpdateStageCosts:=False:C215
			If ([JOB_STAGES:47]JT_WIP_Cost_Amount:43#0)
				Jobs_InvWIP2(<>WIP_t_TRPTrans; "WIP Invoice Reversal: Stage "+[JOB_STAGES:47]Stage_Code:2+" TR"; [JOB_STAGES:47]JT_WIP_Cost_Amount:43; [INVOICES:39]Invoice_Date:4; [INVOICES:39]Period_Code:13)
				[JOBS:26]JT_WIP_Cost_Amount:43:=Round:C94(([JOBS:26]JT_WIP_Cost_Amount:43-[JOB_STAGES:47]JT_WIP_Cost_Amount:43); 2)
				[JOB_STAGES:47]JT_WIP_Cost_Amount:43:=0
				$_bo_UpdateStageCosts:=True:C214
			End if 
			If ([JOB_STAGES:47]JC_WIP_Cost_Amount:44#0)
				Jobs_InvWIP2(<>WIP_t_CIPTRANS; "WIP Invoice Reversal: Stage "+[JOB_STAGES:47]Stage_Code:2+" CI"; [JOB_STAGES:47]JC_WIP_Cost_Amount:44; [INVOICES:39]Invoice_Date:4; [INVOICES:39]Period_Code:13)
				[JOBS:26]JC_WIP_Cost_Amount:44:=Round:C94(([JOBS:26]JC_WIP_Cost_Amount:44-[JOB_STAGES:47]JC_WIP_Cost_Amount:44); 2)
				[JOB_STAGES:47]JC_WIP_Cost_Amount:44:=0
				$_bo_UpdateStageCosts:=True:C214
			End if 
			If ($_bo_UpdateStageCosts)
				[JOB_STAGES:47]JS_WIP_Cost_Amount:45:=0
				$_bo_UpdateCosts:=True:C214
				DB_SaveRecord(->[JOB_STAGES:47])
			End if 
			NEXT RECORD:C51([JOB_STAGES:47])
		End while 
		
		If (OK=1)
			If ([JOBS:26]JC_WIP_Job_Cost_Amount:46#0)
				QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Job_Code:34=[JOBS:26]Job_Code:1; *)
				QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Job_Stage:35=""; *)
				QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Invoice_Number:17=[INVOICES:39]Invoice_Number:1)
				If (Records in selection:C76([ORDER_ITEMS:25])>0)
					Jobs_InvWIP2(<>WIP_t_CIPTRANS; "WIP Invoice Reversal: No Stage CI"; [JOBS:26]JC_WIP_Job_Cost_Amount:46; [INVOICES:39]Invoice_Date:4; [INVOICES:39]Period_Code:13)
					[JOBS:26]JC_WIP_Cost_Amount:44:=Round:C94(([JOBS:26]JC_WIP_Cost_Amount:44-[JOBS:26]JC_WIP_Job_Cost_Amount:46); 2)
					[JOBS:26]JC_WIP_Job_Cost_Amount:46:=0
					$_bo_UpdateCosts:=True:C214
				End if 
			End if 
			
			If (OK=1)
				If ($_bo_UpdateCosts)
					[JOBS:26]JS_WIP_Cost_Amount:45:=Round:C94(([JOBS:26]JT_WIP_Cost_Amount:43+[JOBS:26]JC_WIP_Cost_Amount:44+[JOBS:26]JC_WIP_Job_Cost_Amount:46); 2)
					DB_SaveRecord(->[JOBS:26])
					AA_CheckFileUnlocked(->[JOBS:26]x_ID:49)
				End if 
				
				If (OK=1)
					$_bo_WipPosted:=Jobs_WIPEnd
					If ($_bo_WipPosted)
						//VALIDATE TRANSACTION
						Transact_End(True:C214)
					Else 
						//CANCEL TRANSACTION
						Transact_End(False:C215)
					End if 
				Else 
					Gen_Alert("Posting of the Works in Progress has been cancelled!")
					//CANCEL TRANSACTION
					Transact_End(False:C215)
				End if 
			Else 
				Gen_Alert("Posting of the Works in Progress has been cancelled!")
				//CANCEL TRANSACTION
				Transact_End(False:C215)
			End if 
		Else 
			Gen_Alert("Posting of the Works in Progress has been cancelled!")
			//CANCEL TRANSACTION
			Transact_End(False:C215)
			
			
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Jobs_InvWIP"; $_t_oldMethodName)