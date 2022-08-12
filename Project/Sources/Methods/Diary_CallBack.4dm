//%attributes = {}
If (False:C215)
	//Project Method Name:      Diary_CallBack
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/04/2011 15:55
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283($_l_Event; vDY)
	C_TEXT:C284(<>SYS_t_DefaultTelFormat; $_t_oldMethodName; COM_t_TelephoneNumberFormat; DIA_t_actionName; vCompName; vContName; vExtn; vPerson; vProduct; vTel)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_CallBack")
//Diary_CallBack
$_l_Event:=Form event code:C388

Case of 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[DIARY:12]); "Diary_Appointments")
		DiarySetCode
		[DIARY:12]Company_Code:1:=[COMPANIES:2]Company_Code:1
		QUERY:C277([CONTACTS:1]; [CONTACTS:1]Company_Code:1=[COMPANIES:2]Company_Code:1)
		[DIARY:12]Contact_Code:2:=[CONTACTS:1]Contact_Code:2
		If ([DIARY:12]Person:8="")
			[DIARY:12]Person:8:=[COMPANIES:2]Sales_Person:29
			If ([DIARY:12]Person:8="")
				[DIARY:12]Person:8:=[COMPANIES:2]Taken_By:26
			End if 
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
		vContName:=[CONTACTS:1]Contact_Name:31
		vExtn:=[CONTACTS:1]Extn:9
		[DIARY:12]Date_Do_From:4:=<>DB_d_CurrentDate+1
		RELATE ONE:C42([DIARY:12]Person:8)
		vPerson:=[PERSONNEL:11]Name:2
		DIA_t_actionName:=""
		vProduct:=""
		Diary_Title
		vDY:=1
	: ($_l_Event=On Data Change:K2:15)
		Diary_InD
	: ($_l_Event=On Unload:K2:2)
		vDY:=0
End case 
ERR_MethodTrackerReturn("Diary_CallBack"; $_t_oldMethodName)
