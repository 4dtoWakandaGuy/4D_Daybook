//%attributes = {}
If (False:C215)
	//Project Method Name:      JPR_inLPX
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
	//ARRAY REAL(JPR_ar_SalesRate;0)
	//ARRAY REAL(JPT_ar_CostRate;0)
	//ARRAY TEXT(JPR_at_JobRoles;0)
	C_BOOLEAN:C305(<>JST_PersonnelStaff)
	C_POINTER:C301($1; JST_P_null)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JPR_inLPX")
//NG April 2004
//this new method is to handle the entry of data into the arealist area
//on the job stage for personnel.
//it includes the significant change of allowing job personnel to be contacts
<>JST_PersonnelStaff:=False:C215

Case of 
	: ($1=(->[JOB PERSONNEL:48]Person:3))
		If (<>JST_PersonnelStaff)  //Job personnel are staff
			Check_MinorNC(->[JOB PERSONNEL:48]Person:3; "Person"; ->[PERSONNEL:11]; ->[PERSONNEL:11]Initials:1; ->[PERSONNEL:11]Name:2)
			If ((DB_GetModuleSettingByNUM(Module_PriceTable))>1)  //see also Check_JobPers"
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
		Else 
			//new concept NG April 2004
			//Job personnel being contacts
			Check_Contact(->[JOB PERSONNEL:48]Person:3; ->JST_P_null; ->[JOB PERSONNEL:48])
			If ([JOB PERSONNEL:48]Person:3#"")
				If ([JOB PERSONNEL:48]Person:3#[CONTACTS:1]Contact_Code:2)
					QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=[JOB PERSONNEL:48]Person:3)
					[JOB PERSONNEL:48]X_JobPersonnelContactID:13:=[CONTACTS:1]x_ID:33
				End if 
				ARRAY TEXT:C222(JPR_at_JobRoles; 0)  //to hold the roles
				ARRAY REAL:C219(JPR_ar_SalesRate; 0)  //to hold the Sales Rate
				ARRAY REAL:C219(JPT_ar_CostRate; 0)  //to hold the Cost Rate
				
				CON_GetCharges(->JPR_at_JobRoles; ->JPR_ar_SalesRate; ->JPT_ar_CostRate)
				If ([JOB PERSONNEL:48]x_Job_Role_ID:16=0)
					//Here select the job role
					
				End if 
				
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
			End if 
			
		End if 
		
	: ($1=(->[JOB PERSONNEL:48]JT_Budget_Units:4))
		JobPers_InCalc
	: ($1=(->[JOB PERSONNEL:48]JT_Actual_Units:5))
		JobPers_InCalc
	: ($1=(->[JOB PERSONNEL:48]JT_Sales_Rate:7))
		JobPers_InCalc
	: ($1=(->[JOB PERSONNEL:48]JT_Cost_Rate:9))
		JobPers_InCalc
	: ($1=(->[JOB PERSONNEL:48]JT_Act_Sales_Amount:6))
		[JOB PERSONNEL:48]JT_Sales_Rate:7:=Gen_Round(([JOB PERSONNEL:48]JT_Act_Sales_Amount:6/[JOB PERSONNEL:48]JT_Actual_Units:5); 2; 1)
		JobPers_InCalc
	: ($1=(->[JOB PERSONNEL:48]JT_Actual_Cost_Amount:10))
		[JOB PERSONNEL:48]JT_Cost_Rate:9:=Gen_Round(([JOB PERSONNEL:48]JT_Actual_Cost_Amount:10/[JOB PERSONNEL:48]JT_Actual_Units:5); 2; 1)
		JobPers_InCalc
	: ($1=(->[JOB PERSONNEL:48]JT_Budget_Sales_Amount:8))
		[JOB PERSONNEL:48]JT_Sales_Rate:7:=Gen_Round(([JOB PERSONNEL:48]JT_Budget_Sales_Amount:8/[JOB PERSONNEL:48]JT_Budget_Units:4); 2; 1)
		JobPers_InCalc
	: ($1=(->[JOB PERSONNEL:48]JT_Budget_Cost_Amount:11))
		[JOB PERSONNEL:48]JT_Cost_Rate:9:=Gen_Round(([JOB PERSONNEL:48]JT_Budget_Cost_Amount:11/[JOB PERSONNEL:48]JT_Budget_Units:4); 2; 1)
		JobPers_InCalc
End case 
Macro_AccTypePt($1)
ERR_MethodTrackerReturn("JPR_inLPX"; $_t_oldMethodName)