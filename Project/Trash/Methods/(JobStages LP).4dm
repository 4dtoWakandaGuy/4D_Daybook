//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      JobStages LP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/10/2010 16:20
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_TEXT($_t_PalletButtonName)
	C_BOOLEAN:C305(PAL_bo_ButtonSubFunction; DB_bo_RecordModified)
	C_REAL:C285(vTot; vTot2; vTot3)
	C_TEXT:C284($_t_oldMethodName; $SC; PAL_BUTTON)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JobStages LP")
//Job StagesLP
Case of 
	: (Modified:C32([JOB_STAGES:47]Stage_Code:2))
		Check_Sec(->[JOB_STAGES:47]Stage_Code:2; ->[JOB_STAGES:47]JS_Locked:16)
		If (OK=1)
			Check_MinorNC(->[JOB_STAGES:47]Stage_Code:2; "Stage"; ->[STAGES:45]; ->[STAGES:45]Stage_Code:1; ->[STAGES:45]Stage_Name:2)
			If ([JOB_STAGES:47]Stage_Code:2#"")
				$SC:=[JOB_STAGES:47]Stage_Code:2  //NOTE THIS SHOULD USE QUERY DESTINATION
				DB_SaveRecord(->[JOB_STAGES:47])
				CUT NAMED SELECTION:C334([JOB_STAGES:47]; "$JS")
				QUERY:C277([JOB_STAGES:47]; [JOB_STAGES:47]Job_Code:1=[JOBS:26]Job_Code:1; *)
				QUERY:C277([JOB_STAGES:47];  & ; [JOB_STAGES:47]Stage_Code:2=$SC)
				If (Records in selection:C76([JOB_STAGES:47])>1)
					Gen_Alert("That Stage Code has already been used on this Job"; "Try again")
					USE NAMED SELECTION:C332("$JS")
					[JOB_STAGES:47]Stage_Code:2:=""
					DB_SaveRecord(->[JOB_STAGES:47])
					GOTO OBJECT:C206([JOB_STAGES:47]Stage_Code:2)
				Else 
					USE NAMED SELECTION:C332("$JS")
				End if 
			End if 
			If (([JOB_STAGES:47]Stage_Code:2#"") & ([STAGES:45]Stage_Name:2#""))  //ERROR HERE
				[JOB_STAGES:47]Stage_Name:3:=[STAGES:45]Stage_Name:2
			End if 
			DB_bo_RecordModified:=True:C214
			Macro_AccTypePt(->[JOB_STAGES:47]Stage_Code:2)
		End if 
	: (Modified:C32([JOB_STAGES:47]Stage_Name:3))
		Check_Sec(->[JOB_STAGES:47]Stage_Name:3; ->[JOB_STAGES:47]JS_Locked:16)
		If (OK=1)
			Macro_AccTypePt(->[JOB_STAGES:47]Stage_Name:3)
		End if 
	: (Modified:C32([JOB_STAGES:47]JT_Budget_Units:4))
		Check_Sec(->[JOB_STAGES:47]Invoice_Number:10; ->[JOB_STAGES:47]JS_Locked:16)
		If (OK=1)
			vTot3:=1
			DB_bo_RecordModified:=True:C214
			Macro_AccTypePt(->[JOB_STAGES:47]JT_Budget_Units:4)
		End if 
	: (Modified:C32([JOB_STAGES:47]AT_Actual_Units:5))
		Check_Sec(->[JOB_STAGES:47]AT_Actual_Units:5; ->[JOB_STAGES:47]JS_Locked:16)
		If (OK=1)
			vTot3:=1
			DB_bo_RecordModified:=True:C214
			Macro_AccTypePt(->[JOB_STAGES:47]AT_Actual_Units:5)
		End if 
	: (Modified:C32([JOB_STAGES:47]JT_Actual_Sales_Amount:6))
		Check_Sec(->[JOB_STAGES:47]JT_Actual_Sales_Amount:6; ->[JOB_STAGES:47]JS_Locked:16)
		If (OK=1)
			vTot3:=1
			DB_bo_RecordModified:=True:C214
			Macro_AccTypePt(->[JOB_STAGES:47]JT_Actual_Sales_Amount:6)
		End if 
	: (Modified:C32([JOB_STAGES:47]JS_Quoted_Qty:46))
		Check_Sec(->[JOB_STAGES:47]JS_Quoted_Qty:46; ->[JOB_STAGES:47]JS_Locked:16)
		If (OK=1)
			[JOB_STAGES:47]AS_Quoted_Amount:7:=Gen_Round(([JOB_STAGES:47]JS_Quoted_Price:47*[JOB_STAGES:47]JS_Quoted_Qty:46); 2; 2)
			vTot3:=1
			DB_bo_RecordModified:=True:C214
			Macro_AccTypePt(->[JOB_STAGES:47]JS_Quoted_Qty:46)
		End if 
	: (Modified:C32([JOB_STAGES:47]JS_Quoted_Price:47))
		Check_Sec(->[JOB_STAGES:47]JS_Quoted_Price:47; ->[JOB_STAGES:47]JS_Locked:16)
		If (OK=1)
			[JOB_STAGES:47]AS_Quoted_Amount:7:=Gen_Round(([JOB_STAGES:47]JS_Quoted_Price:47*[JOB_STAGES:47]JS_Quoted_Qty:46); 2; 2)
			vTot3:=1
			DB_bo_RecordModified:=True:C214
			Macro_AccTypePt(->[JOB_STAGES:47]JS_Quoted_Price:47)
		End if 
	: (Modified:C32([JOB_STAGES:47]AS_Quoted_Amount:7))
		Check_Sec(->[JOB_STAGES:47]AS_Quoted_Amount:7; ->[JOB_STAGES:47]JS_Locked:16)
		If (OK=1)
			[JOB_STAGES:47]JS_Quoted_Price:47:=Gen_Round(([JOB_STAGES:47]AS_Quoted_Amount:7/[JOB_STAGES:47]JS_Quoted_Qty:46); 2; 1)
			vTot3:=1
			DB_bo_RecordModified:=True:C214
			Macro_AccTypePt(->[JOB_STAGES:47]AS_Quoted_Amount:7)
		End if 
	: (vTot=1)
		JobStages_InT3
	: (vTot2=1)
		JobStages_InTo
	: (Modified:C32([JOB_STAGES:47]Invoice_Number:10))
		Check_Sec(->[JOB_STAGES:47]Invoice_Number:10; ->[JOB_STAGES:47]JS_Locked:16)
		If (OK=1)
			[JOB_STAGES:47]Invoice_Number:10:=Uppercase:C13([JOB_STAGES:47]Invoice_Number:10)
			RELATE ONE:C42([JOB_STAGES:47]Invoice_Number:10)
			If (Records in selection:C76([INVOICES:39])>0)
				Gen_Alert("You cannot add items to existing Invoices"; "Cancel")
				[JOB_STAGES:47]Invoice_Number:10:=Old:C35([JOB_STAGES:47]Invoice_Number:10)
			End if 
			Macro_AccTypePt(->[JOB_STAGES:47]Invoice_Number:10)
		End if 
		DB_bo_RecordModified:=True:C214
	: (Modified:C32([JOB_STAGES:47]TAX_Code:14))
		Check_MinorNC(->[JOB_STAGES:47]TAX_Code:14; ""; ->[TAX_CODES:35]; ->[TAX_CODES:35]Tax_Code:1; ->[TAX_CODES:35]Tax_Rate:3; Term VATWT("VAT Code"))
		If ([JOB_STAGES:47]TAX_Code:14="")
			RELATE ONE:C42([JOBS:26]Company_Code:3)
			[JOB_STAGES:47]TAX_Code:14:=Gen_LPTax
		End if 
		DB_bo_RecordModified:=True:C214
		Macro_AccTypePt(->[JOB_STAGES:47]TAX_Code:14)
		//****************************** added 15/03/07 -kmw ******************************
	: (Modified:C32([JOB_STAGES:47]AT_Budget_Sales_Amount:8))
		JC_JobTotalArraysLoadValues
	: (Modified:C32([JOB_STAGES:47]JT_Budget_Cost_Amount:30))
		JC_JobTotalArraysLoadValues
	: (Modified:C32([JOB_STAGES:47]JT_Actual_Sales_Amount:6))
		JC_JobTotalArraysLoadValues
	: (Modified:C32([JOB_STAGES:47]JT_Actual_Cost_Amount:29))
		JC_JobTotalArraysLoadValues
	: (Modified:C32([JOB_STAGES:47]JT_WIP_Sales_Amount:56))
		JC_JobTotalArraysLoadValues
	: (Modified:C32([JOB_STAGES:47]JT_WIP_Cost_Amount:43))
		JC_JobTotalArraysLoadValues
	: (Modified:C32([JOB_STAGES:47]JC_Budget_Sales_Amount:33))
		JC_JobTotalArraysLoadValues
	: (Modified:C32([JOB_STAGES:47]JC_Budget_Cost_Amount:34))
		JC_JobTotalArraysLoadValues
	: (Modified:C32([JOB_STAGES:47]JC_Actual_Sales_Amount:31))
		JC_JobTotalArraysLoadValues
	: (Modified:C32([JOB_STAGES:47]JC_Actual_Cost_Amount:32))
		JC_JobTotalArraysLoadValues
	: (Modified:C32([JOB_STAGES:47]JC_WIP_Sales_Amount:57))
		JC_JobTotalArraysLoadValues
	: (Modified:C32([JOB_STAGES:47]JC_WIP_Cost_Amount:44))
		JC_JobTotalArraysLoadValues
	: (Modified:C32([JOB_STAGES:47]AS_Quoted_Amount:7))
		JC_JobTotalArraysLoadValues
	: (Modified:C32([JOB_STAGES:47]JS_Budget_Sales_Amount:37))
		JC_JobTotalArraysLoadValues
	: (Modified:C32([JOB_STAGES:47]JS_Budget_Cost_Amount:38))
		JC_JobTotalArraysLoadValues
	: (Modified:C32([JOB_STAGES:47]JS_Budget_Margin:41))
		JC_JobTotalArraysLoadValues
	: (Modified:C32([JOB_STAGES:47]JS_Budget_Margin_PC:42))
		JC_JobTotalArraysLoadValues
	: (Modified:C32([JOB_STAGES:47]JS_Actual_Sales_Amount:35))
		JC_JobTotalArraysLoadValues
	: (Modified:C32([JOB_STAGES:47]JS_Actual_Cost_Amount:36))
		JC_JobTotalArraysLoadValues
	: (Modified:C32([JOB_STAGES:47]JS_Actual_Margin:39))
		JC_JobTotalArraysLoadValues
	: (Modified:C32([JOB_STAGES:47]JS_Actual_Margin_PC:40))
		JC_JobTotalArraysLoadValues
	: (Modified:C32([JOB_STAGES:47]JS_WIP_Sales_Amount:58))
		JC_JobTotalArraysLoadValues
	: (Modified:C32([JOB_STAGES:47]JS_WIP_Cost_Amount:45))
		JC_JobTotalArraysLoadValues
	: (Modified:C32([JOB_STAGES:47]JS_WIP_Margin:59))
		JC_JobTotalArraysLoadValues
	: (Modified:C32([JOB_STAGES:47]JS_WIP_MarginPC:60))
		JC_JobTotalArraysLoadValues
	Else 
		
		If (PAL_BUTTON#"")
			$_t_PalletButtonName:=PAL_BUTTON
			PAL_BUTTON:=""
			DB_HandleInputFormButtons($_t_PalletButtonName)
			PAL_bo_ButtonSubFunction:=False:C215
		End if 
		//******************************************************************************
End case 
ERR_MethodTrackerReturn("JobStages LP"; $_t_oldMethodName)