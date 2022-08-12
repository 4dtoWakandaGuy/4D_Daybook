//%attributes = {}
If (False:C215)
	//Project Method Name:      Diary_InB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:              08/05/2010 15:40
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vDY)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; <>PER_t_CurrentUserName; <>SYS_t_DefaultTelFormat; $_t_EnquiriesMenuName; $_t_FunctionsMenuName; $_t_HistoryMenuName; $_t_oldMethodName; $_t_ViewsMenuName; COM_t_TelephoneNumberFormat; DB_t_CallOnCloseorSave; DB_t_CurrentFormUsage)
	C_TEXT:C284(DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; SD_t_DiaryResultCodeOLD; vButtDisDry; vCompName; vContName; vJob; vPerson; vStage; vTel; vTitle)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_InB")
//Diary_InB
Diary_InB2
If ([COMPANIES:2]Company_Code:1#[DIARY:12]Company_Code:1)
	RELATE ONE:C42([DIARY:12]Company_Code:1)
End if 
If ([CONTACTS:1]Contact_Code:2#[DIARY:12]Contact_Code:2)
	RELATE ONE:C42([DIARY:12]Contact_Code:2)
End if 
vCompName:=[COMPANIES:2]Company_Name:2
vTel:=[COMPANIES:2]Telephone:9
If ([COMPANIES:2]Country:8#"")
	If ([COUNTRIES:73]COUNTRY_CODE:1#[COMPANIES:2]Country:8)
		QUERY:C277([COUNTRIES:73]; [COUNTRIES:73]COUNTRY_CODE:1=[COMPANIES:2]Country:8)
		COM_t_TelephoneNumberFormat:=[COUNTRIES:73]Telephone_Format:7
	End if 
Else 
	COM_t_TelephoneNumberFormat:=<>SYS_t_DefaultTelFormat
End if 
If (COM_t_TelephoneNumberFormat#"")
	OBJECT SET FORMAT:C236(vTel; COM_t_TelephoneNumberFormat)
End if 
vContName:=CON_BuildContactNameandJobTitle


If ([DIARY:12]Person:8#<>PER_t_CurrentUserInitials) & ([DIARY:12]Person:8#"")
	RELATE ONE:C42([DIARY:12]Person:8)
	vPerson:=[PERSONNEL:11]Name:2
Else 
	[DIARY:12]Person:8:=<>PER_t_CurrentUserInitials
	RELATE ONE:C42([DIARY:12]Person:8)
	vPerson:=[PERSONNEL:11]Name:2
	vPerson:=<>PER_t_CurrentUserName
End if 
If ((Read only state:C362([DIARY:12])) | (Locked:C147([DIARY:12])))
	OBJECT SET ENTERABLE:C238(vTitle; False:C215)
End if 
If ((DB_GetModuleSettingByNUM(Module_JobCosting)<2))
	
	OBJECT SET ENTERABLE:C238([DIARY:12]Job_Code:19; False:C215)
	OBJECT SET ENTERABLE:C238([DIARY:12]Stage_Code:21; False:C215)
	vJob:=""
Else 
	If ([JOBS:26]Job_Code:1#[DIARY:12]Job_Code:19)
		RELATE ONE:C42([DIARY:12]Job_Code:19)
	End if 
	vJob:=[JOBS:26]Job_Name:2
	If (DB_t_CurrentFormUsage="Time")
		RELATE ONE:C42([DIARY:12]Stage_Code:21)
		vStage:=[STAGES:45]Stage_Name:2
	End if 
End if 
If ((DB_GetModuleSettingByNUM(Module_Enquiries)<2) & (DB_GetModuleSettingByNUM(Module_SalesOrders)<2))
	OBJECT SET ENTERABLE:C238([DIARY:12]Order_Code:26; False:C215)
End if 
If ((DB_GetModuleSettingByNUM(Module_ServiceCentre))<2)
	OBJECT SET ENTERABLE:C238([DIARY:12]Call_Code:25; False:C215)
End if 
If ((DB_GetModuleSettingByNUM(Module_Macros))<2)
	OBJECT SET ENTERABLE:C238([DIARY:12]Script_Code:29; False:C215)
End if 

If ([DIARY:12]Action_Code:9="")
	GOTO OBJECT:C206([DIARY:12]Company_Code:1)
Else 
	If ([DIARY:12]Result_Code:11#"")
		GOTO OBJECT:C206([DIARY:12]Result_Description:12)
		HIGHLIGHT TEXT:C210([DIARY:12]Result_Description:12; 32000; 32000)
	Else 
		GOTO OBJECT:C206([DIARY:12]Result_Code:11)
	End if 
End if 
Diary_Title
$_t_ViewsMenuName:=Get localized string:C991("Menu_View")
$_t_HistoryMenuName:=Get localized string:C991("Menu_History")
$_t_FunctionsMenuName:=Get localized string:C991("Menu_Functions")

If ((DB_GetModuleSettingByNUM(Module_ServiceCentre))<2)
	DB_MenuAction($_t_ViewsMenuName; Get localized string:C991("MenuItem_ServiceCall"); 3; "")
	DB_MenuAction($_t_HistoryMenuName; Get localized string:C991("MenuItem_Call"); 3; "")
	DB_MenuAction($_t_HistoryMenuName; Get localized string:C991("MenuItem_CallAction"); 3; "")
End if 
If ((DB_GetModuleSettingByNUM(Module_JobCosting))<2)
	DB_MenuAction($_t_ViewsMenuName; Get localized string:C991("MenuItem_Job"); 3; "")
	DB_MenuAction($_t_HistoryMenuName; Get localized string:C991("MenuItem_Job"); 3; "")
	DB_MenuAction($_t_HistoryMenuName; Get localized string:C991("MenuItem_JobAction"); 3; "")
End if 
If ((DB_GetModuleSettingByNUM(Module_WPManager))<2)
	DB_MenuAction($_t_HistoryMenuName; ""; 3; "")
	DB_MenuAction($_t_HistoryMenuName; Get localized string:C991("MenuItem_Document"); 3; "")
	
Else 
	If ((DB_GetModuleSettingByNUM(Module_WPManager))=3)
		DB_MenuAction(Get localized string:C991("Menu_Document"); Get localized string:C991("MenuItem_NewDocument"); 3; "")
	End if 
End if 
If ((DB_GetModuleSettingByNUM(Module_Enquiries))<2)
	DB_MenuAction($_t_ViewsMenuName; Get localized string:C991("MenuItem_EnquiryWriter"); 3; "")
End if 

$_t_EnquiriesMenuName:=Get localized string:C991("MenuItem_EnquiryWriter")
$_t_EnquiriesMenuName:=Term_OrdWT($_t_EnquiriesMenuName)
If ($_t_EnquiriesMenuName#Get localized string:C991("MenuItem_EnquiryWriter"))
	DB_MenuAction($_t_ViewsMenuName; Get localized string:C991("MenuItem_EnquiryWriter"); 1; Term_OrdWT("SalesBook"))
End if 

If ((DB_GetModuleSettingByNUM(Module_SalesOrders))<2)
	DB_MenuAction($_t_ViewsMenuName; Get localized string:C991("MenuItem_Order"); 3; "")
	DB_MenuAction($_t_HistoryMenuName; Get localized string:C991("MenuItem_Order"); 3; "")
	DB_MenuAction($_t_HistoryMenuName; Get localized string:C991("MenuItem_OrderAction"); 3; "")
	
End if 
If ((DB_GetModuleSettingByNUM(Module_JobCosting))<2)
	DB_MenuAction($_t_ViewsMenuName; Get localized string:C991("MenuItem_Job"); 3; "")
End if 

If ((DB_GetModuleSettingByNUM(1))=5)
	DB_MenuAction($_t_FunctionsMenuName; Get localized string:C991("MenuItem_SwitchAccess"); 3; "")
	
End if 
SD_SetSourceButtons
SD_t_DiaryResultCodeOLD:=[DIARY:12]Result_Code:11
vDY:=1
vButtDisDry:="I  PMO   SSSRCAD "
Input_Buttons(->[DIARY:12]; ->vButtDisDry)
DB_t_CallOnCloseorSave:="R:Diary_InLPA"
Gen_FindVars
Macro_AccType("Load "+String:C10(Table:C252(->[DIARY:12])))
ERR_MethodTrackerReturn("Diary_InB"; $_t_oldMethodName)