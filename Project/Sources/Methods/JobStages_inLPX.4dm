//%attributes = {}
If (False:C215)
	//Project Method Name:      JobStages_inLPX
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/09/2009 11:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>JSStartFinishTime; DB_bo_RecordModified)
	C_LONGINT:C283($_l_event; $_l_Hour; $_l_isUnique; $_l_Minutes)
	C_POINTER:C301($1)
	C_REAL:C285(vTot3)
	C_TEXT:C284($_t_oldMethodName; $_t_StageCode; $2)
	C_TIME:C306(<>SYS_ti_DefaultTimeUnits)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JobStages_inLPX")
//Contacts_InLPX
//Note that the fields with nothing in the case statement
//either had nothing in the JobStages_LP or just set the modified flag and ran the macro
//VT4 was used to indicate the stage had modified which caused elements in the during phase of the parent form to execute.
//in the remodel these are done in ALmodBookingStage etc so not needed

Case of 
	: ($1=(->[JOB_STAGES:47]AS_Invoice_Excluding_Tax:9))
		
	: ($1=(->[JOB_STAGES:47]AS_Invoice_Including_Tax:28))
	: ($1=(->[JOB_STAGES:47]AS_Quoted_Amount:7))
		//vT4:=1  ` This variable probably needs to change
		//Code from JobStages BkSub
		[JOB_STAGES:47]B_Client_Rate:12:=Round:C94(([JOB_STAGES:47]AS_Quoted_Amount:7/[JOB_STAGES:47]AT_Actual_Units:5); 2)
		
		//NOTE HOW SIGNIFICANTLY DIFFERENT THESE ARE!!!
		//Code from JobStages_LP
		//NAN Code needed here..maybe this should only calc the JS quoted Price if JS quoted Qty>0
		
		[JOB_STAGES:47]JS_Quoted_Price:47:=Gen_Round(([JOB_STAGES:47]AS_Quoted_Amount:7/[JOB_STAGES:47]JS_Quoted_Qty:46); 2; 1)
		vTot3:=1  // This variable probably needs to change
		DB_bo_RecordModified:=True:C214  // This variable probably needs to change
		//
		
		
		
	: ($1=(->[JOB_STAGES:47]AT_Actual_Units:5))
		//Code from JobStages_LP
		Check_Sec(->[JOB_STAGES:47]AT_Actual_Units:5; ->[JOB_STAGES:47]JS_Locked:16)
		//Code from JobStages BkSub
		//NOTE this code is not implemented in JobStages_LP!!
		//Check Where ◊TimeUnit is set!
		//Significant Change here
		<>JSStartFinishTime:=False:C215
		
		If (<>JSStartFinishTime=False:C215)
			[JOB_STAGES:47]B_Actual_Hours:15:=Time:C179(Time string:C180([JOB_STAGES:47]AT_Actual_Units:5*<>SYS_ti_DefaultTimeUnits))
		End if 
		
		//vT4:=1  ` This variable probably needs to change
		[JOB_STAGES:47]AS_Quoted_Amount:7:=Round:C94(([JOB_STAGES:47]B_Client_Rate:12*[JOB_STAGES:47]AT_Actual_Units:5); 2)
		[JOB_STAGES:47]AT_Budget_Sales_Amount:8:=Round:C94(([JOB_STAGES:47]B_Applicant_Rate:13*[JOB_STAGES:47]AT_Actual_Units:5); 2)
		
	: ($1=(->[JOB_STAGES:47]AT_Budget_Sales_Amount:8))
		//Note THIS Field NOT Handled in JobStages_LP
		//Code from JobStages BkSub
		//vT4:=1  ` This variable probably needs to change
		[JOB_STAGES:47]B_Applicant_Rate:13:=Round:C94(([JOB_STAGES:47]AT_Budget_Sales_Amount:8/[JOB_STAGES:47]AT_Actual_Units:5); 2)
		
	: ($1=(->[JOB_STAGES:47]X_Actual_Hours_Entry:51)) | ($1=(->[JOB_STAGES:47]X_actual_Minutes:53))  // ($1=(->[JOB STAGES]B Actual Hours))
		//the amount entered is seen as seconds!!
		Case of 
			: ($1=(->[JOB_STAGES:47]X_Actual_Hours_Entry:51))
				If ([JOB_STAGES:47]X_Actual_Hours_Entry:51>24)
					[JOB_STAGES:47]X_Actual_Hours_Entry:51:=24
				End if 
			: ($1=(->[JOB_STAGES:47]X_actual_Minutes:53))
				If ([JOB_STAGES:47]X_actual_Minutes:53>60)
					[JOB_STAGES:47]X_actual_Minutes:53:=60
				End if 
				
		End case 
		
		[JOB_STAGES:47]B_Actual_Hours:15:=(([JOB_STAGES:47]X_Actual_Hours_Entry:51*60)+[JOB_STAGES:47]X_actual_Minutes:53)
		
		//[JOB STAGES]B Actual Hours:=([JOB STAGES]xActualHoursEntry*60)*60
		//Note THIS Field NOT Handled in JobStages_LP
		//Code from JobStages BkSub
		//NOTE NAN Code will be needed here
		[JOB_STAGES:47]AT_Actual_Units:5:=Num:C11(String:C10([JOB_STAGES:47]B_Actual_Hours:15/<>SYS_ti_DefaultTimeUnits; "####0.000"))
		//vT4:=1  ` This variable probably needs to change
		[JOB_STAGES:47]AS_Quoted_Amount:7:=Round:C94(([JOB_STAGES:47]B_Client_Rate:12*[JOB_STAGES:47]AT_Actual_Units:5); 2)
		[JOB_STAGES:47]AT_Budget_Sales_Amount:8:=Round:C94(([JOB_STAGES:47]B_Applicant_Rate:13*[JOB_STAGES:47]AT_Actual_Units:5); 2)
		
	: ($1=(->[JOB_STAGES:47]B_Agency_Amount:19))
	: ($1=(->[JOB_STAGES:47]B_Agency_Total_Amount:24))
		
	: ($1=(->[JOB_STAGES:47]B_Agency_TAX_Amount:27))
	: ($1=(->[JOB_STAGES:47]B_Allowance_Amount:21))
	: ($1=(->[JOB_STAGES:47]B_Applicant_Rate:13))
		//Note THIS Field NOT Handled in JobStages_LP
		//Code from JobStages BkSub
		//vT4:=1  ` This variable probably needs to change
		[JOB_STAGES:47]AT_Budget_Sales_Amount:8:=Round:C94(([JOB_STAGES:47]B_Applicant_Rate:13*[JOB_STAGES:47]AT_Actual_Units:5); 2)
		
	: ($1=(->[JOB_STAGES:47]B_Applicant_TAX:17))
		//Note THIS Field NOT Handled in JobStages_LP
		
		Check_MinorNC(->[JOB_STAGES:47]B_Applicant_TAX:17; ""; ->[TAX_CODES:35]; ->[TAX_CODES:35]Tax_Code:1; ->[TAX_CODES:35]Tax_Rate:3; Term_VATWT("VAT Code"))
		
		Check_MinorNC(->[JOB_STAGES:47]B_Applicant_TAX:17; ""; ->[TAX_CODES:35]; ->[TAX_CODES:35]Tax_Code:1; ->[TAX_CODES:35]Tax_Rate:3; Term_VATWT("VAT Code"); $2)
		
		
		If ([JOB_STAGES:47]B_Applicant_TAX:17="")
			[JOB_STAGES:47]B_Applicant_TAX:17:=Gen_LPTax
		End if 
		
	: ($1=(->[JOB_STAGES:47]B_Applicant_FEU_Amount:26))
	: ($1=(->[JOB_STAGES:47]B_Applicant_TAX_Amount:23))
		
	: ($1=(->[JOB_STAGES:47]B_Client_Rate:12))
		//Note THIS Field NOT Handled in JobStages_LP
		//Code from JobStages BkSub
		//vT4:=1  ` This variable probably needs to change
		[JOB_STAGES:47]AS_Quoted_Amount:7:=Round:C94(([JOB_STAGES:47]B_Client_Rate:12*[JOB_STAGES:47]AT_Actual_Units:5); 2)
		
	: ($1=(->[JOB_STAGES:47]B_Client_Total_Amount:25))
	: ($1=(->[JOB_STAGES:47]B_Client_Tax_Amount:22))
	: ($1=(->[JOB_STAGES:47]B_FA_Commision_Amount:20))
	: ($1=(->[JOB_STAGES:47]B_Fee_Rate:18))
	: ($1=(->[JOB_STAGES:47]Description:48))
	: ($1=(->[JOB_STAGES:47]Invoice_Number:10))
		//Code from JobStages_LP
		[JOB_STAGES:47]Invoice_Number:10:=Uppercase:C13([JOB_STAGES:47]Invoice_Number:10)
		RELATE ONE:C42([JOB_STAGES:47]Invoice_Number:10)
		If (Records in selection:C76([INVOICES:39])>0)
			Gen_Alert("You cannot add items to existing Invoices"; "Cancel")
			[JOB_STAGES:47]Invoice_Number:10:=Old:C35([JOB_STAGES:47]Invoice_Number:10)
		End if 
	: ($1=(->[JOB_STAGES:47]JC_Actual_Cost_Amount:32))
	: ($1=(->[JOB_STAGES:47]JC_Actual_Sales_Amount:31))
	: ($1=(->[JOB_STAGES:47]JC_Budget_Cost_Amount:34))
	: ($1=(->[JOB_STAGES:47]JC_Budget_Sales_Amount:33))
	: ($1=(->[JOB_STAGES:47]JC_WIP_Cost_Amount:44))
	: ($1=(->[JOB_STAGES:47]Job_Code:1))
	: ($1=(->[JOB_STAGES:47]JS_Actual_Cost_Amount:36))
	: ($1=(->[JOB_STAGES:47]JS_Actual_Margin:39))
	: ($1=(->[JOB_STAGES:47]JS_Actual_Margin_PC:40))
	: ($1=(->[JOB_STAGES:47]JS_Actual_Sales_Amount:35))
	: ($1=(->[JOB_STAGES:47]JS_Budget_Cost_Amount:38))
	: ($1=(->[JOB_STAGES:47]JS_Budget_Margin:41))
	: ($1=(->[JOB_STAGES:47]JS_Budget_Margin_PC:42))
	: ($1=(->[JOB_STAGES:47]JS_Budget_Sales_Amount:37))
	: ($1=(->[JOB_STAGES:47]JS_Quoted_Price:47))
		Check_Sec(->[JOB_STAGES:47]JS_Quoted_Price:47; ->[JOB_STAGES:47]JS_Locked:16)
		//Code from JobStages_LP
		
		[JOB_STAGES:47]AS_Quoted_Amount:7:=Gen_Round(([JOB_STAGES:47]JS_Quoted_Price:47*[JOB_STAGES:47]JS_Quoted_Qty:46); 2; 2)
		vTot3:=1
		DB_bo_RecordModified:=True:C214
		
	: ($1=(->[JOB_STAGES:47]JS_Quoted_Qty:46))
		//Code from JobStages_LP
		Check_Sec(->[JOB_STAGES:47]JS_Quoted_Qty:46; ->[JOB_STAGES:47]JS_Locked:16)
		[JOB_STAGES:47]AS_Quoted_Amount:7:=Gen_Round(([JOB_STAGES:47]JS_Quoted_Price:47*[JOB_STAGES:47]JS_Quoted_Qty:46); 2; 2)
		vTot3:=1
		DB_bo_RecordModified:=True:C214
	: ($1=(->[JOB_STAGES:47]JS_WIP_Cost_Amount:45))
	: ($1=(->[JOB_STAGES:47]JS_Locked:16))
	: ($1=(->[JOB_STAGES:47]JT_Actual_Cost_Amount:29))
	: ($1=(->[JOB_STAGES:47]JT_Actual_Sales_Amount:6))
		Check_Sec(->[JOB_STAGES:47]JT_Actual_Sales_Amount:6; ->[JOB_STAGES:47]JS_Locked:16)
		If (OK=1)
			vTot3:=1
			DB_bo_RecordModified:=True:C214
			
		End if 
	: ($1=(->[JOB_STAGES:47]JT_Budget_Cost_Amount:30))
	: ($1=(->[JOB_STAGES:47]JT_Budget_Units:4))
		Check_Sec(->[JOB_STAGES:47]Invoice_Number:10; ->[JOB_STAGES:47]JS_Locked:16)
		If (OK=1)
			vTot3:=1
			DB_bo_RecordModified:=True:C214
		End if 
		
	: ($1=(->[JOB_STAGES:47]JT_WIP_Cost_Amount:43))
	: ($1=(->[JOB_STAGES:47]Print_Description:49))
		
	: ($1=(->[JOB_STAGES:47]Required_Date:50))
	: ($1=(->[JOB_STAGES:47]Stage_Code:2))
		//`Code from JobStages_LP
		//Check_Sec (->[JOB STAGES]Stage Code;->[JOB STAGES]JS_Locked)
		
		//`Code from Jobstages BKSub
		
		Check_MinorNC(->[JOB_STAGES:47]Stage_Code:2; "Stage"; ->[STAGES:45]; ->[STAGES:45]Stage_Code:1; ->[STAGES:45]Stage_Name:2)
		
		Check_MinorNC(->[JOB_STAGES:47]Stage_Code:2; "Stage"; ->[STAGES:45]; ->[STAGES:45]Stage_Code:1; ->[STAGES:45]Stage_Name:2)
		
		
		If ([JOB_STAGES:47]Stage_Code:2#"")
			//`the following is an assimilation what was in JobStages_LP
			$_l_isUnique:=0
			SET QUERY DESTINATION:C396(3; $_l_isUnique)
			$_t_StageCode:=[JOB_STAGES:47]Stage_Code:2
			//`end assimilation
			QUERY:C277([JOB_STAGES:47]; [JOB_STAGES:47]Job_Code:1=[JOBS:26]Job_Code:1; *)
			QUERY:C277([JOB_STAGES:47];  & ; [JOB_STAGES:47]Stage_Code:2=$_t_StageCode)
			SET QUERY DESTINATION:C396(0)
			If ($_l_isUnique>0)
				Gen_Alert("That Stage Code has already been used on this Job"; "Try again")
				[JOB_STAGES:47]Stage_Code:2:=""
			End if 
			If ([JOB_STAGES:47]Stage_Code:2#"")
				//`end assimilation
				If ([JOB_STAGES:47]Stage_Name:3="")
					[JOB_STAGES:47]Stage_Name:3:=[STAGES:45]Stage_Name:2
				End if 
				If ([JOB_STAGES:47]B_Client_Rate:12=0)
					[JOB_STAGES:47]B_Client_Rate:12:=[STAGES:45]Default_Client_Rate:5
				End if 
				If ([JOB_STAGES:47]B_Applicant_Rate:13=0)
					[JOB_STAGES:47]B_Applicant_Rate:13:=[STAGES:45]Default_Applicant_Rate:6
				End if 
				//vT4:=1  ` This variable to change
				//Additional code from JobStages_LP
				//Macro_AccTypePt (->[JOB STAGES]Stage Code)` This call at end of case
				//end additional code
				
			End if 
		End if 
		
		//```````````
		
		
	: ($1=(->[JOB_STAGES:47]Stage_Name:3))
		Check_Sec(->[JOB_STAGES:47]Stage_Name:3; ->[JOB_STAGES:47]JS_Locked:16)
	: ($1=(->[JOB_STAGES:47]TAX_Code:14))
		//`Code from Jobstages BKSub
		
		Check_MinorNC(->[JOB_STAGES:47]TAX_Code:14; ""; ->[TAX_CODES:35]; ->[TAX_CODES:35]Tax_Code:1; ->[TAX_CODES:35]Tax_Rate:3; Term_VATWT("VAT Code"))
		If ([JOB_STAGES:47]TAX_Code:14="")
			
			Gen_LPTax
		End if 
End case 
If ([JOB_STAGES:47]B_Actual_Hours:15>0)
	
	$_l_Minutes:=([JOB_STAGES:47]B_Actual_Hours:15*1)/60
	$_l_Hour:=Int:C8($_l_Minutes/60)
	$_l_Minutes:=$_l_Minutes-($_l_Hour*60)
	[JOB_STAGES:47]X_Actual_Hours_Entry:51:=$_l_Hour
	[JOB_STAGES:47]X_actual_Minutes:53:=$_l_Minutes
End if 


Macro_AccTypePt($1)
ERR_MethodTrackerReturn("JobStages_inLPX"; $_t_oldMethodName)