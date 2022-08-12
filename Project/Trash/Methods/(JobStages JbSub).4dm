//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      JobStages JbSub
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
	C_BOOLEAN:C305(DB_bo_RecordModified)
	C_REAL:C285(vTot)
	C_TEXT:C284($_t_oldMethodName)
	C_TIME:C306(<>SYS_ti_DefaultTimeUnits)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JobStages JbSub")
Case of 
	: (Modified:C32([JOB_STAGES:47]Stage_Code:2))
		Check_MinorNC(->[JOB_STAGES:47]Stage_Code:2; "Stage"; ->[STAGES:45]; ->[STAGES:45]Stage_Code:1; ->[STAGES:45]Stage_Name:2)
		If ([JOB_STAGES:47]Stage_Code:2#"")
			If ([JOB_STAGES:47]Stage_Name:3="")
				[JOB_STAGES:47]Stage_Name:3:=[STAGES:45]Stage_Name:2
			End if 
			If ([JOB_STAGES:47]B_Client_Rate:12=0)
				[JOB_STAGES:47]B_Client_Rate:12:=[STAGES:45]Default_Client_Rate:5
				[JOB_STAGES:47]AS_Quoted_Amount:7:=Round:C94(([JOB_STAGES:47]B_Client_Rate:12*[JOB_STAGES:47]AT_Actual_Units:5); 2)
			End if 
			If ([JOB_STAGES:47]B_Applicant_Rate:13=0)
				[JOB_STAGES:47]B_Applicant_Rate:13:=[STAGES:45]Default_Applicant_Rate:6
				[JOB_STAGES:47]AT_Budget_Sales_Amount:8:=Round:C94(([JOB_STAGES:47]B_Applicant_Rate:13*[JOB_STAGES:47]AT_Actual_Units:5); 2)
			End if 
			vTot:=1
		End if 
	: (Modified:C32([JOB_STAGES:47]AT_Actual_Units:5))
		[JOB_STAGES:47]B_Actual_Hours:15:=Time:C179(Time string:C180([JOB_STAGES:47]AT_Actual_Units:5*<>SYS_ti_DefaultTimeUnits))
		vTot:=1
		[JOB_STAGES:47]AS_Quoted_Amount:7:=Round:C94(([JOB_STAGES:47]B_Client_Rate:12*[JOB_STAGES:47]AT_Actual_Units:5); 2)
		[JOB_STAGES:47]AT_Budget_Sales_Amount:8:=Round:C94(([JOB_STAGES:47]B_Applicant_Rate:13*[JOB_STAGES:47]AT_Actual_Units:5); 2)
	: (Modified:C32([JOB_STAGES:47]B_Actual_Hours:15))
		[JOB_STAGES:47]AT_Actual_Units:5:=Num:C11(String:C10([JOB_STAGES:47]B_Actual_Hours:15/<>SYS_ti_DefaultTimeUnits; "####0.000"))
		vTot:=1
		[JOB_STAGES:47]AS_Quoted_Amount:7:=Round:C94(([JOB_STAGES:47]B_Client_Rate:12*[JOB_STAGES:47]AT_Actual_Units:5); 2)
		[JOB_STAGES:47]AT_Budget_Sales_Amount:8:=Round:C94(([JOB_STAGES:47]B_Applicant_Rate:13*[JOB_STAGES:47]AT_Actual_Units:5); 2)
	: (Modified:C32([JOB_STAGES:47]B_Client_Rate:12))
		vTot:=1
		[JOB_STAGES:47]AS_Quoted_Amount:7:=Round:C94(([JOB_STAGES:47]B_Client_Rate:12*[JOB_STAGES:47]AT_Actual_Units:5); 2)
	: (Modified:C32([JOB_STAGES:47]AS_Quoted_Amount:7))
		vTot:=1
		[JOB_STAGES:47]B_Client_Rate:12:=Round:C94(([JOB_STAGES:47]AS_Quoted_Amount:7/[JOB_STAGES:47]AT_Actual_Units:5); 2)
	: (Modified:C32([JOB_STAGES:47]B_Applicant_Rate:13))
		vTot:=1
		[JOB_STAGES:47]AT_Budget_Sales_Amount:8:=Round:C94(([JOB_STAGES:47]B_Applicant_Rate:13*[JOB_STAGES:47]AT_Actual_Units:5); 2)
	: (Modified:C32([JOB_STAGES:47]AT_Budget_Sales_Amount:8))
		vTot:=1
		[JOB_STAGES:47]B_Applicant_Rate:13:=Round:C94(([JOB_STAGES:47]AT_Budget_Sales_Amount:8/[JOB_STAGES:47]AT_Actual_Units:5); 2)
	: (Modified:C32([JOB_STAGES:47]TAX_Code:14))
		Check_MinorNC(->[JOB_STAGES:47]TAX_Code:14; ""; ->[TAX_CODES:35]; ->[TAX_CODES:35]Tax_Code:1; ->[TAX_CODES:35]Tax_Rate:3; Term VATWT("VAT Code"))
		If ([JOB_STAGES:47]TAX_Code:14="")
			RELATE ONE:C42([JOBS:26]Company_Code:3)
			[JOB_STAGES:47]TAX_Code:14:=Gen_LPTax
		End if 
		DB_bo_RecordModified:=True:C214
End case 
ERR_MethodTrackerReturn("JobStages JbSub"; $_t_oldMethodName)