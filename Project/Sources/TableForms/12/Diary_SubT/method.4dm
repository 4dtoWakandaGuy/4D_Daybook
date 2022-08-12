If (False:C215)
	//Table Form Method Name: [DIARY]Diary_SubT
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SD_at_TrState;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284(<>DefPrior; <>PER_t_CurrentUserInitials; <>TimeAct; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
	C_TIME:C306(<>SYS_ti_DefaultTimeUnits)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [DIARY].Diary_SubT"; Form event code:C388)
//LP of Diary Layout: Diary_SubT
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Data Change:K2:15)
		If (Modified record:C314([DIARY:12]))
			Diary_InD
		End if 
		vHours:=Time:C179(Time string:C180([DIARY:12]Units:20*<>SYS_ti_DefaultTimeUnits))
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[DIARY:12]); "Diary_SubT")
		If ((DB_GetModuleSettingByNUM(1))=5)
			OBJECT SET ENTERABLE:C238([DIARY:12]Date_Do_From:4; False:C215)
			OBJECT SET ENTERABLE:C238([DIARY:12]Date_Do_To:33; False:C215)
			OBJECT SET ENTERABLE:C238([DIARY:12]Time_Do_From:6; False:C215)
			OBJECT SET ENTERABLE:C238([DIARY:12]Time_Do_To:35; False:C215)
		End if 
		DB_t_CurrentFormUsage:="Time"
		[DIARY:12]Action_Code:9:=<>TimeAct
		[DIARY:12]Result_Code:11:=[ORDERS:24]Taken_By:17
		[DIARY:12]Originator:23:=<>PER_t_CurrentUserInitials
		If (SD_at_TrState=1)
			[DIARY:12]Date_Do_From:4:=[ORDERS:24]Order_Date:4
			[DIARY:12]Date_Do_To:33:=[ORDERS:24]Order_Date:4
			[DIARY:12]Time_Do_From:6:=Current time:C178
			If ([DIARY:12]Result_Code:11#"")
				[DIARY:12]Time_Do_To:35:=[DIARY:12]Time_Do_From:6
			End if 
		Else 
			[DIARY:12]Date_Do_From:4:=<>DB_d_CurrentDate
			[DIARY:12]Date_Do_To:33:=<>DB_d_CurrentDate
			[DIARY:12]Date_Done_From:5:=[ORDERS:24]Order_Date:4
			[DIARY:12]Date_Done_To:34:=[ORDERS:24]Order_Date:4
			[DIARY:12]Time_Done_From:7:=Current time:C178
			If ([DIARY:12]Result_Code:11#"")
				[DIARY:12]Time_Done_To:36:=[DIARY:12]Time_Do_From:6
			End if 
			[DIARY:12]Done:14:=True:C214
		End if 
		[DIARY:12]Person:8:=[ORDERS:24]Person:5
		[DIARY:12]Job_Code:19:=[ORDERS:24]Your_Order_Number:10
		If ([DIARY:12]Job_Code:19#"")
			If ([JOBS:26]Job_Code:1#[DIARY:12]Job_Code:19)
				MESSAGES OFF:C175
				QUERY:C277([JOBS:26]; [JOBS:26]Job_Code:1=[DIARY:12]Job_Code:19)
				MESSAGES ON:C181
				
			End if 
			[DIARY:12]Company_Code:1:=[JOBS:26]Company_Code:3
			[DIARY:12]Contact_Code:2:=[JOBS:26]Contact_Code:4
		End if 
		[DIARY:12]Stage_Code:21:=[ORDERS:24]Source:18
		If ([DIARY:12]Stage_Code:21#"")
			Diary_InDStage
		End if 
		[DIARY:12]Diary_Code:3:=Substring:C12("*TR"+Gen_Unique; 1; 11)
		//+String(Num(Export_Stamp )+Num([DIARY]Job Code));1;11)
		[DIARY:12]Priority:17:=<>DefPrior
		// Diary_InB
		Diary_PersPrior
End case 
ERR_MethodTrackerReturn("FM [DIARY].Diary_SubT"; $_t_oldMethodName)
