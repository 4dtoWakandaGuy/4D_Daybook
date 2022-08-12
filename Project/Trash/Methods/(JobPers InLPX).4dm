//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      JobPers_InLPX
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 17:28
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JobPers_InLPX")
//JobPers_InLP

Case of 
	: ($1=(->[JOB PERSONNEL:48]Person:3))
		Check_MinorNC(->[JOB PERSONNEL:48]Person:3; "Person"; ->[PERSONNEL:11]; ->[PERSONNEL:11]Initials:1; ->[PERSONNEL:11]Name:2)
		[JOB PERSONNEL:48]X_Job_Person_Name:12:=[PERSONNEL:11]Name:2
		If ((DB_GetModuleSettingByNUM(Module_PriceTable))>1)  //see also Check_JobPers
			QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Company_Code:8=[JOBS:26]Company_Code:3; *)
			QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Product_Code:1="*Job Stage "+[JOB_STAGES:47]Stage_Code:2)
			If (Records in selection:C76([PRICE_TABLE:28])=0)
				QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Company_Code:8=[JOBS:26]Company_Code:3; *)
				QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Product_Code:1="*Job")
			End if 
			If (Records in selection:C76([PRICE_TABLE:28])>0)
				[JOB PERSONNEL:48]JT_Sales_Rate:7:=Gen_Round(([PERSONNEL:11]Sales_Rate:5*((100-[PRICE_TABLE:28]Price_Discount:3)/100)); 2; 2)
			Else 
				[JOB PERSONNEL:48]JT_Sales_Rate:7:=[PERSONNEL:11]Sales_Rate:5
			End if 
		Else 
			[JOB PERSONNEL:48]JT_Sales_Rate:7:=[PERSONNEL:11]Sales_Rate:5
		End if 
		[JOB PERSONNEL:48]JT_Cost_Rate:9:=[PERSONNEL:11]Cost_Rate:30
		JobPers_InCalc
		Macro_AccTypePt(->[JOB PERSONNEL:48]Person:3)
	: ($1=(->[JOB PERSONNEL:48]JT_Budget_Units:4))
		JobPers_InCalc
		Macro_AccTypePt(->[JOB PERSONNEL:48]JT_Budget_Units:4)
	: ($1=(->[JOB PERSONNEL:48]JT_Actual_Units:5))
		JobPers_InCalc
		Macro_AccTypePt(->[JOB PERSONNEL:48]JT_Actual_Units:5)
	: ($1=(->[JOB PERSONNEL:48]JT_Sales_Rate:7))
		JobPers_InCalc
		Macro_AccTypePt(->[JOB PERSONNEL:48]JT_Sales_Rate:7)
	: ($1=(->[JOB PERSONNEL:48]JT_Cost_Rate:9))
		JobPers_InCalc
		Macro_AccTypePt(->[JOB PERSONNEL:48]JT_Cost_Rate:9)
	: ($1=(->[JOB PERSONNEL:48]JT_Act_Sales_Amount:6))
		[JOB PERSONNEL:48]JT_Sales_Rate:7:=Gen_Round(([JOB PERSONNEL:48]JT_Act_Sales_Amount:6/[JOB PERSONNEL:48]JT_Actual_Units:5); 2; 1)
		JobPers_InCalc
		Macro_AccTypePt(->[JOB PERSONNEL:48]JT_Act_Sales_Amount:6)
	: ($1=(->[JOB PERSONNEL:48]JT_Actual_Cost_Amount:10))
		[JOB PERSONNEL:48]JT_Cost_Rate:9:=Gen_Round(([JOB PERSONNEL:48]JT_Actual_Cost_Amount:10/[JOB PERSONNEL:48]JT_Actual_Units:5); 2; 1)
		JobPers_InCalc
		Macro_AccTypePt(->[JOB PERSONNEL:48]JT_Actual_Cost_Amount:10)
	: ($1=(->[JOB PERSONNEL:48]JT_Budget_Sales_Amount:8))
		[JOB PERSONNEL:48]JT_Sales_Rate:7:=Gen_Round(([JOB PERSONNEL:48]JT_Budget_Sales_Amount:8/[JOB PERSONNEL:48]JT_Budget_Units:4); 2; 1)
		JobPers_InCalc
		Macro_AccTypePt(->[JOB PERSONNEL:48]JT_Budget_Sales_Amount:8)
	: ($1=(->[JOB PERSONNEL:48]JT_Budget_Cost_Amount:11))
		[JOB PERSONNEL:48]JT_Cost_Rate:9:=Gen_Round(([JOB PERSONNEL:48]JT_Budget_Cost_Amount:11/[JOB PERSONNEL:48]JT_Budget_Units:4); 2; 1)
		JobPers_InCalc
		Macro_AccTypePt(->[JOB PERSONNEL:48]JT_Budget_Cost_Amount:11)
End case 
ERR_MethodTrackerReturn("JobPers_InLPX"; $_t_oldMethodName)