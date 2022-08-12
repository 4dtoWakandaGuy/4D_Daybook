//%attributes = {}
If (False:C215)
	//Project Method Name:      Countries_InLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  14/10/2010 22:14
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
	C_LONGINT:C283($_l_ButtonNumber; $_l_Event; $_l_ModuleRow; DB_l_ButtonClickedFunction; DB_l_WindowCurrentModule; iCancel; iOK; ModuleNumber; PAL_but_FirstRecord; PAL_but_LastRecord; PAL_but_NextRecord)
	C_LONGINT:C283(PAL_but_PreviousRecord)
	C_REAL:C285($1)
	C_TEXT:C284($_t_oldMethodName; $_t_PalletButtonName; BAR_t_Button; DB_t_CUrrentInputMenuRef; DB_T_CurrentInputWindowMenu; PAL_BUTTON; vButtDisCOUNTRIES; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Countries_InLP")
If (Count parameters:C259=0)
	$_l_Event:=Form event code:C388
Else 
	$_l_Event:=$1
End if 

Case of 
	: ($_l_Event=On Resize:K2:27)
		WS_AutoscreenSize(2; 268; 560)
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		DB_SetnewToolBar
		OpenHelp(Table:C252(->[COUNTRIES:73]); "Country_in")
		//CCM_ISOCurrencyCodes ("Country")
		DM_ReadISOCountries
		DM_GetISOCurrencies
		WS_AutoscreenSize(2; 240; 560)
		INT_SetInput(Table:C252(->[COUNTRIES:73]); WIN_t_CurrentInputForm)
		
		Countries_InLPB
		
		DB_SetInputFormMenu(Table:C252(->[COUNTRIES:73]); "Country_In")
		If (Records in selection:C76([COUNTRIES:73])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		SD2_SetDiaryPopup
		In_ButtChkDis(->vButtDisCOUNTRIES)
		
	: ($_l_Event=On Activate:K2:9)
		DB_SetInputFormMenu(Table:C252(->[COUNTRIES:73]); "Country_In")
		OpenHelp(Table:C252(->[COUNTRIES:73]); "Country_in")
		If (Records in selection:C76([COUNTRIES:73])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		
		In_ButtChkDis(->vButtDisCOUNTRIES)
		
	: ((($_l_Event=On Outside Call:K2:11) & (DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
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
				//$Action:=0
			Else 
				
				In_ButtCall(""; ""; "Minor_DelSin"; ->[COUNTRIES:73]; ->[COUNTRIES:73]COUNTRY_CODE:1; "Countries"; "1 2"; "Countries_InLPB"; ""; ""; ""; ->[IDENTIFIERS:16]; ->vButtDisCOUNTRIES)
		End case 
		
	: ($_l_Event=On Data Change:K2:15) | ($_l_Event=On Clicked:K2:4) | ($_l_Event=On Menu Selected:K2:14) | ($_l_Event=On Plug in Area:K2:16)
		Case of 
			: (BAR_t_Button#"")
				
				$_l_ButtonNumber:=Num:C11(BAR_t_Button)
				If ($_l_ButtonNumber>1)
					ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_ButtonNumber-1}
					$_l_ModuleRow:=Find in array:C230(MOD_al_ModuleBarNum; ModuleNumber)
					DB_SetBrowserBarSelection($_l_ModuleRow; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
					DB_SetInputFormMenu(Table:C252(->[COUNTRIES:73]); "Country_In")
					
					
				End if 
				BAR_t_Button:=""
				
				
			: (PAL_BUTTON#"")
				$_t_PalletButtonName:=PAL_BUTTON
				PAL_BUTTON:=""
				DB_HandleInputFormButtons($_t_PalletButtonName)
				PAL_bo_ButtonSubFunction:=False:C215
			: (Modified:C32([COUNTRIES:73]COUNTRY_CODE:1))
				[COUNTRIES:73]COUNTRY_CODE:1:=Uppers2([COUNTRIES:73]COUNTRY_CODE:1)
				Macro_AccTypePt(->[COUNTRIES:73]COUNTRY_CODE:1)
				DB_bo_RecordModified:=True:C214
				[COUNTRIES:73]Export:3:=Export_Stamp2([COUNTRIES:73]Export:3)
			: (Modified:C32([COUNTRIES:73]Address_Format:2))
				Check_Minor(->[COUNTRIES:73]Address_Format:2; "Type"; ->[ADDRESS_FORMATS:74]; ->[ADDRESS_FORMATS:74]Format_Code:1; ->[ADDRESS_FORMATS:74]Format_Name:2; "Types In")
				Macro_AccTypePt(->[COUNTRIES:73]Address_Format:2)
				DB_bo_RecordModified:=True:C214
				[COUNTRIES:73]Export:3:=Export_Stamp2([COUNTRIES:73]Export:3)
			: (Modified:C32([COUNTRIES:73]Default_TAX:4))
				Check_MinorNC(->[COUNTRIES:73]Default_TAX:4; ""; ->[TAX_CODES:35]; ->[TAX_CODES:35]Tax_Code:1; ->[TAX_CODES:35]Tax_Rate:3; Term_VATWT("VAT Code"))
				Macro_AccTypePt(->[COUNTRIES:73]Default_TAX:4)
				DB_bo_RecordModified:=True:C214
			: ($_l_Event=On Menu Selected:K2:14)
				DB_SetInputFormMenu(Table:C252(->[COUNTRIES:73]); "Country_In")
				If (Records in selection:C76([COUNTRIES:73])<=1)
					OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
					OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
					OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
					OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
					DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
					DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
				End if 
				
				In_ButtChkDis(->vButtDisCOUNTRIES)
		End case 
	: ($_l_Event=On Clicked:K2:4)
		If (PAL_BUTTON#"")
			$_t_PalletButtonName:=PAL_BUTTON
			PAL_BUTTON:=""
			DB_HandleInputFormButtons($_t_PalletButtonName)
			PAL_bo_ButtonSubFunction:=False:C215
		End if 
	: ($_l_Event=On Deactivate:K2:10)
		//PAUSE PROCESS(vProc)
End case 
ERR_MethodTrackerReturn("Countries_InLP"; $_t_oldMethodName)
