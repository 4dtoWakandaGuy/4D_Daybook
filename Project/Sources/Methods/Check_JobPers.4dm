//%attributes = {}
If (False:C215)
	//Project Method Name:      Check_JobPers
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
	C_REAL:C285(vTot)
	C_TEXT:C284($_t_oldMethodName; SD_t_DiaryPersonName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Check_JobPers")
//Check_JobPers
If (([DIARY:12]Job_Code:19#"") & ([DIARY:12]Person:8#"") & ([DIARY:12]Stage_Code:21#""))
	
	If (False:C215)  //kmw 02/04/07 - use new JC method to find Job Personnel record
		QUERY:C277([JOB PERSONNEL:48]; [JOB PERSONNEL:48]Person:3=[DIARY:12]Person:8; *)
		QUERY:C277([JOB PERSONNEL:48];  & ; [JOB PERSONNEL:48]Job_Code:1=[DIARY:12]Job_Code:19; *)
		QUERY:C277([JOB PERSONNEL:48];  & ; [JOB PERSONNEL:48]Stage_Code:2=[DIARY:12]Stage_Code:21)
	End if 
	JC_FindJSPFromTimeDiary  //kmw 02/04/07 - use new JC method to find Job Personnel record
	
	If (Records in selection:C76([JOB PERSONNEL:48])>0)
		[DIARY:12]Charge_Rate:22:=[JOB PERSONNEL:48]JT_Sales_Rate:7
		[DIARY:12]Cost_Rate:74:=[JOB PERSONNEL:48]JT_Cost_Rate:9  //added 30/03/07 -kmw
	Else 
		// Gen_Confirm ([DIARY]Person+" will be allocated to "+[DIARY]Job Code+""
		//, Stage "+[DIARY]Stage Code+" when you post this Time entry";"OK")
		//  If (OK=1)
		//   READ WRITE([JOB PERSONNEL])
		//    CREATE RECORD([JOB PERSONNEL])
		//   [JOB PERSONNEL]Person:=[DIARY]Person
		//   [JOB PERSONNEL]Charge Rate:=[PERSONNEL]Charge Rate
		//   [JOB PERSONNEL]Job Code:=[DIARY]Job Code
		//   [JOB PERSONNEL]Stage Code:=[DIARY]Stage Code
		//   DB_SaveRecord(->[JOB PERSONNEL])
		//   READ ONLY([JOB PERSONNEL])
		//   UNLOAD RECORD([JOB PERSONNEL])
		//  End if
		If ([PERSONNEL:11]Initials:1#[DIARY:12]Person:8)
			RELATE ONE:C42([DIARY:12]Person:8)
			SD_t_DiaryPersonName:=[PERSONNEL:11]Name:2
		End if 
		
		If ((DB_GetModuleSettingByNUM(Module_PriceTable))>1)  //see also JobPers_InLP
			If ([JOBS:26]Job_Code:1#[DIARY:12]Job_Code:19)
				RELATE ONE:C42([DIARY:12]Job_Code:19)
			End if 
			QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Company_Code:8=[JOBS:26]Company_Code:3; *)
			QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Product_Code:1="*Job Stage "+[DIARY:12]Stage_Code:21)
			If (Records in selection:C76([PRICE_TABLE:28])=0)
				QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Company_Code:8=[JOBS:26]Company_Code:3; *)
				QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Product_Code:1="*Job")
			End if 
			If (Records in selection:C76([PRICE_TABLE:28])>0)
				[DIARY:12]Charge_Rate:22:=Gen_Round(([PERSONNEL:11]Sales_Rate:5*((100-[PRICE_TABLE:28]Price_Discount:3)/100)); 2; 2)
				[DIARY:12]Cost_Rate:74:=Gen_Round(([PERSONNEL:11]Cost_Rate:30*((100-[PRICE_TABLE:28]Price_Discount:3)/100)); 2; 2)  //added 30/03/07 -kmw
			Else 
				[DIARY:12]Charge_Rate:22:=[PERSONNEL:11]Sales_Rate:5
				[DIARY:12]Cost_Rate:74:=[PERSONNEL:11]Cost_Rate:30  //added 30/03/07 -kmw
			End if 
		Else 
			[DIARY:12]Charge_Rate:22:=[PERSONNEL:11]Sales_Rate:5
			[DIARY:12]Cost_Rate:74:=[PERSONNEL:11]Cost_Rate:30  //added 30/03/07 -kmw
		End if 
		
	End if 
	[DIARY:12]Value:16:=Round:C94(([DIARY:12]Charge_Rate:22*[DIARY:12]Units:20); 2)
	[DIARY:12]Cost_Value:75:=Round:C94(([DIARY:12]Cost_Rate:74*[DIARY:12]Units:20); 2)  //added 30/03/07 -kmw
	vTot:=1
End if 
ERR_MethodTrackerReturn("Check_JobPers"; $_t_oldMethodName)