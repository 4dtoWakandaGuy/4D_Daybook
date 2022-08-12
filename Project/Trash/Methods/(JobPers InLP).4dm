//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      JobPers InLP
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
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_Event)
	C_TEXT:C284($_t_oldMethodName; vPerson; WIN_t_CurrentInputForm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JobPers InLP")
//JobPers InLP
$_l_Event:=Form event code:C388

Case of 
	: ($_l_Event=On Data Change:K2:15)
		If (Modified record:C314([JOB PERSONNEL:48]))
			Case of 
				: (Modified:C32([JOB PERSONNEL:48]Person:3))
					Check_MinorNC(->[JOB PERSONNEL:48]Person:3; "Person"; ->[PERSONNEL:11]; ->[PERSONNEL:11]Initials:1; ->[PERSONNEL:11]Name:2)
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
				: (Modified:C32([JOB PERSONNEL:48]JT_Budget_Units:4))
					JobPers_InCalc
					Macro_AccTypePt(->[JOB PERSONNEL:48]JT_Budget_Units:4)
				: (Modified:C32([JOB PERSONNEL:48]JT_Actual_Units:5))
					JobPers_InCalc
					Macro_AccTypePt(->[JOB PERSONNEL:48]JT_Actual_Units:5)
				: (Modified:C32([JOB PERSONNEL:48]JT_Sales_Rate:7))
					JobPers_InCalc
					Macro_AccTypePt(->[JOB PERSONNEL:48]JT_Sales_Rate:7)
				: (Modified:C32([JOB PERSONNEL:48]JT_Cost_Rate:9))
					JobPers_InCalc
					Macro_AccTypePt(->[JOB PERSONNEL:48]JT_Cost_Rate:9)
				: (Modified:C32([JOB PERSONNEL:48]JT_Act_Sales_Amount:6))
					[JOB PERSONNEL:48]JT_Sales_Rate:7:=Gen_Round(([JOB PERSONNEL:48]JT_Act_Sales_Amount:6/[JOB PERSONNEL:48]JT_Actual_Units:5); 2; 1)
					JobPers_InCalc
					Macro_AccTypePt(->[JOB PERSONNEL:48]JT_Act_Sales_Amount:6)
				: (Modified:C32([JOB PERSONNEL:48]JT_Actual_Cost_Amount:10))
					[JOB PERSONNEL:48]JT_Cost_Rate:9:=Gen_Round(([JOB PERSONNEL:48]JT_Actual_Cost_Amount:10/[JOB PERSONNEL:48]JT_Actual_Units:5); 2; 1)
					JobPers_InCalc
					Macro_AccTypePt(->[JOB PERSONNEL:48]JT_Actual_Cost_Amount:10)
				: (Modified:C32([JOB PERSONNEL:48]JT_Budget_Sales_Amount:8))
					[JOB PERSONNEL:48]JT_Sales_Rate:7:=Gen_Round(([JOB PERSONNEL:48]JT_Budget_Sales_Amount:8/[JOB PERSONNEL:48]JT_Budget_Units:4); 2; 1)
					JobPers_InCalc
					Macro_AccTypePt(->[JOB PERSONNEL:48]JT_Budget_Sales_Amount:8)
				: (Modified:C32([JOB PERSONNEL:48]JT_Budget_Cost_Amount:11))
					[JOB PERSONNEL:48]JT_Cost_Rate:9:=Gen_Round(([JOB PERSONNEL:48]JT_Budget_Cost_Amount:11/[JOB PERSONNEL:48]JT_Budget_Units:4); 2; 1)
					JobPers_InCalc
					Macro_AccTypePt(->[JOB PERSONNEL:48]JT_Budget_Cost_Amount:11)
			End case 
		End if 
		RELATE ONE:C42([JOB PERSONNEL:48]Person:3)
		vPerson:=[PERSONNEL:11]Name:2
		If ([JOBS:26]Budget_TR:28)
			//the sales and cost amounts can probably still be altered if user changes the rates but this might be considered ok anyway given that the same values would be arrived at via a totals re-calc from times was done (because at the moemnt the recalc uses these rates also)
			OBJECT SET ENTERABLE:C238([JOB PERSONNEL:48]JT_Budget_Units:4; False:C215)
			OBJECT SET ENTERABLE:C238([JOB PERSONNEL:48]JT_Budget_Sales_Amount:8; False:C215)
			OBJECT SET ENTERABLE:C238([JOB PERSONNEL:48]JT_Budget_Cost_Amount:11; False:C215)
		End if 
		If ([JOBS:26]Actual_TR:29)
			//the sales and cost amounts can probably still be altered if user changes the rates but this might be considered ok anyway given that the same values would be arrived at via a totals re-calc from times was done (because at the moemnt the recalc uses these rates also)
			OBJECT SET ENTERABLE:C238([JOB PERSONNEL:48]JT_Actual_Units:5; False:C215)
			OBJECT SET ENTERABLE:C238([JOB PERSONNEL:48]JT_Act_Sales_Amount:6; False:C215)
			OBJECT SET ENTERABLE:C238([JOB PERSONNEL:48]JT_Actual_Cost_Amount:10; False:C215)
		End if 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[JOB PERSONNEL:48]); WIN_t_CurrentInputForm)
		If ([JOB PERSONNEL:48]Job_Code:1="")
			[JOB PERSONNEL:48]Job_Code:1:=[JOBS:26]Job_Code:1
			[JOB PERSONNEL:48]Stage_Code:2:=[JOB_STAGES:47]Stage_Code:2
		End if 
		//If ([JOBS]Budget TR)
		//SET ENTERABLE([JOB PERSONNEL]JT Budget Units;False)
		//SET ENTERABLE([JOB PERSONNEL]JT Bud Sales Am;False)
		//SET ENTERABLE([JOB PERSONNEL]JT Bud Cost Am;False)
		//End if
		//If ([JOBS]Actual TR)
		//SET ENTERABLE([JOB PERSONNEL]JT Actual Units;False)
		//SET ENTERABLE([JOB PERSONNEL]JT Act Sales Am;False)
		//SET ENTERABLE([JOB PERSONNEL]JT Act Cost Am;False)
		//End if
		//*************added 26/01/07 -kmw, should be safe to query  jobs etc because i think job personnel detail screen always loaded in its own Process_Now**************
		QUERY:C277([JOBS:26]; [JOBS:26]Job_Code:1=[JOB PERSONNEL:48]Job_Code:1)
		QUERY:C277([JOB_STAGES:47]; [JOB_STAGES:47]Job_Code:1=[JOBS:26]Job_Code:1; *)
		QUERY:C277([JOB_STAGES:47];  & ; [JOB_STAGES:47]Job_Stage_code:52=[JOB PERSONNEL:48]Job_stage_Code:17)
		QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=[JOB PERSONNEL:48]Person:3)
		vPerson:=[PERSONNEL:11]Name:2
		//***********************************************************************************************************************
		
		//************************** moved to here 23/03/07 -kmw (so that the job record is loaded befor ethe check - probably used to work anyway but got broken when we shifted job personnel into their own process) ***************************
		If ([JOBS:26]Budget_TR:28)
			OBJECT SET ENTERABLE:C238([JOB PERSONNEL:48]JT_Budget_Units:4; False:C215)
			OBJECT SET ENTERABLE:C238([JOB PERSONNEL:48]JT_Budget_Sales_Amount:8; False:C215)
			OBJECT SET ENTERABLE:C238([JOB PERSONNEL:48]JT_Budget_Cost_Amount:11; False:C215)
		End if 
		If ([JOBS:26]Actual_TR:29)
			OBJECT SET ENTERABLE:C238([JOB PERSONNEL:48]JT_Actual_Units:5; False:C215)
			OBJECT SET ENTERABLE:C238([JOB PERSONNEL:48]JT_Act_Sales_Amount:6; False:C215)
			OBJECT SET ENTERABLE:C238([JOB PERSONNEL:48]JT_Actual_Cost_Amount:10; False:C215)
		End if 
		//***************************************************************************************************************************************************************************
		
		Macro_AccType("Load "+String:C10(Table:C252(->[JOB PERSONNEL:48])))
		
End case 
ERR_MethodTrackerReturn("JobPers InLP"; $_t_oldMethodName)