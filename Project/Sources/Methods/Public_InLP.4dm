//%attributes = {}
If (False:C215)
	//Project Method Name:      Public_InLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/10/2010 19:57
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(MOD_al_ModuleBarNum;0)
	//ARRAY LONGINT(MOD_al_ModuleBarOffsets;0)
	C_BOOLEAN:C305(DB_bo_NoLoad; DB_bo_RecordModified; PAL_bo_ButtonSubFunction)
	C_LONGINT:C283($_l_ButtonNumber; $_l_Event; $_l_ModuleRow; $1; DB_l_ButtonClickedFunction; DB_l_WindowCurrentModule; ModuleNumber; PAL_but_LastRecord; PAL_but_PreviousRecord; PAL_but_NextRecord; PAL_but_FirstRecord)
	C_TEXT:C284(<>SYS_t_DefaultTelFormat; $_t_oldMethodName; $_t_PalletButtonName; BAR_t_Button; COM_t_TelephoneNumberFormat; DB_t_CUrrentInputMenuRef; DB_T_CurrentInputWindowMenu; PAL_BUTTON; vCompName; vTel; WIN_t_CurrentInputForm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Public_InLP")
Minor_LP(->[PUBLICATIONS:52]Publication_Code:1; ->[PUBLICATIONS:52]Publication_Name:2; ->[PUBLICATIONS:52]; "Publications"; "1"; "Public_InLPB"; "")
If (Count parameters:C259>=1)
	$_l_Event:=$1
Else 
	$_l_Event:=Form event code:C388
End if 

Case of 
		
	: ($_l_Event=On Header:K2:17) | ($_l_Event=On Resize:K2:27)
		//WS_AutoscreenSize (2;260;590)
	: ($_l_Event=On Activate:K2:9)
		DB_SetInputFormMenu(Table:C252(->[PUBLICATIONS:52]); "Public_in")
		SD2_SetDiaryPopup
		If (Records in selection:C76([PUBLICATIONS:52])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
	: ($_l_Event=On Menu Selected:K2:14)
		DB_SetInputFormMenu(Table:C252(->[PUBLICATIONS:52]); "Public_in")
		
		If (Records in selection:C76([PUBLICATIONS:52])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		DB_SetnewToolBar
		OpenHelp(Table:C252(->[PUBLICATIONS:52]); WIN_t_CurrentInputForm)
		Public_InLPB
		OpenHelp(Table:C252(->[PUBLICATIONS:52]); "Public_in")
		WS_AutoscreenSize(2; 300; 590)
		INT_SetInput(Table:C252(->[PUBLICATIONS:52]); WIN_t_CurrentInputForm)
		SD2_SetDiaryPopup
		DB_SetInputFormMenu(Table:C252(->[PUBLICATIONS:52]); "Public_in")
		If (Records in selection:C76([PUBLICATIONS:52])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
	: ($_l_Event=On Data Change:K2:15)
		Case of 
			: (Modified:C32([PUBLICATIONS:52]Company_Code:3))
				Check_Company(->[PUBLICATIONS:52]Company_Code:3; ->[PUBLICATIONS:52]Contact_Code:4; ->[PUBLICATIONS:52])
				
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
				Check_ContDef(->[PUBLICATIONS:52]Company_Code:3; ->[PUBLICATIONS:52]Contact_Code:4)
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[PUBLICATIONS:52]Company_Code:3)
			: (Modified:C32([PUBLICATIONS:52]Contact_Code:4))
				Check_Contact(->[PUBLICATIONS:52]Contact_Code:4; ->[PUBLICATIONS:52]Company_Code:3; ->[PUBLICATIONS:52])
				
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[PUBLICATIONS:52]Contact_Code:4)
			: (Modified:C32([PUBLICATIONS:52]Circulation:5))
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[PUBLICATIONS:52]Circulation:5)
			: (Modified:C32([PUBLICATIONS:52]Format:6))
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[PUBLICATIONS:52]Format:6)
			: (Modified:C32([PUBLICATIONS:52]Publication_Type:7))
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[PUBLICATIONS:52]Publication_Type:7)
			: (Modified:C32([PUBLICATIONS:52]Frequency:8))
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[PUBLICATIONS:52]Frequency:8)
		End case 
	: ($_l_Event=On Clicked:K2:4)
		Case of 
				
			: (BAR_t_Button#"")
				$_l_ButtonNumber:=Num:C11(BAR_t_Button)
				If ($_l_ButtonNumber>1)
					ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_ButtonNumber-1}
					$_l_ModuleRow:=Find in array:C230(MOD_al_ModuleBarNum; ModuleNumber)
					DB_SetBrowserBarSelection($_l_ModuleRow; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
					DB_SetInputFormMenu(Table:C252(->[PUBLICATIONS:52]); "Public_in")
					
				End if 
				BAR_t_Button:=""
			: (PAL_BUTTON#"")
				$_t_PalletButtonName:=PAL_BUTTON
				PAL_BUTTON:=""
				DB_HandleInputFormButtons($_t_PalletButtonName)
				PAL_bo_ButtonSubFunction:=False:C215
			Else 
				Projects_InLPD
		End case 
	: ($_l_Event=On Outside Call:K2:11)
		Case of 
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("FormWindows"))
				If (DB_t_CUrrentInputMenuRef#"") & (DB_T_CurrentInputWindowMenu#"")
					DB_T_CurrentInputWindowMenu:=DB_BuildWIndowsMenu(DB_T_CurrentInputWindowMenu)
					SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
				End if 
				DB_l_ButtonClickedFunction:=0
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Subfunction"))
				DB_l_ButtonClickedFunction:=0
				DB_SubFunctionHandler
		End case 
End case 
ERR_MethodTrackerReturn("Public_InLP"; $_t_oldMethodName)