//%attributes = {}
If (False:C215)
	//Project Method Name:      AddTypes_InLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  22/09/2010 14:27
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
	C_LONGINT:C283($_l_ButtonNumber; $_l_Event; $_l_ModulePosition; DB_l_WindowCurrentModule; ModuleNumber; PAL_but_FirstRecord; PAL_but_LastRecord; PAL_but_NextRecord; PAL_but_PreviousRecord)
	C_REAL:C285($1)
	C_TEXT:C284($_t_oldMethodName; $_t_PalletteButtonName; BAR_t_Button; DB_t_CUrrentInputMenuRef; PAL_BUTTON; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("AddTypes_InLP")
Minor_LP_Ex(->[ADDRESS_FORMATS:74]Format_Code:1; ->[ADDRESS_FORMATS:74]Format_Name:2; ->[ADDRESS_FORMATS:74]Export:10; ->[ADDRESS_FORMATS:74]; "Address Formats"; "1"; "AddTypes_InLPB")
If (Count parameters:C259>=1)
	$_l_Event:=Form event code:C388
End if 

Case of 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		DB_SetnewToolBar
		OpenHelp(Table:C252(->[ADDRESS_FORMATS:74]); "Types_in")
		WS_AutoscreenSize(2; 450; 575)
		INT_SetInput(Table:C252(->[ADDRESS_FORMATS:74]); WIN_t_CurrentInputForm)
		AddTypes_InLPB
		SD2_SetDiaryPopup
		DB_SetInputFormMenu(Table:C252(->[ADDRESS_FORMATS:74]); "Types_in")
		If (Records in selection:C76([ADDRESS_FORMATS:74])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		
	: ($_l_Event=On Data Change:K2:15) | ($_l_Event=On Clicked:K2:4)
		Case of 
			: (BAR_t_Button#"")
				
				$_l_ButtonNumber:=Num:C11(BAR_t_Button)
				If ($_l_ButtonNumber>1)
					ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_ButtonNumber-1}
					$_l_ModulePosition:=Find in array:C230(MOD_al_ModuleBarNum; ModuleNumber)
					DB_SetBrowserBarSelection($_l_ModulePosition; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
					DB_SetInputFormMenu(Table:C252(->[ADDRESS_FORMATS:74]); "Types_in")
				End if 
				BAR_t_Button:=""
			: (PAL_BUTTON#"")
				$_t_PalletteButtonName:=PAL_BUTTON
				PAL_BUTTON:=""
				DB_HandleInputFormButtons($_t_PalletteButtonName)
				PAL_bo_ButtonSubFunction:=False:C215
				
			: (Modified:C32([ADDRESS_FORMATS:74]Address_1_Name:3))
				[ADDRESS_FORMATS:74]Address_1_Name:3:=Uppers3([ADDRESS_FORMATS:74]Address_1_Name:3)
				DB_bo_RecordModified:=True:C214
				[ADDRESS_FORMATS:74]Export:10:=Export_Stamp2([ADDRESS_FORMATS:74]Export:10)
			: (Modified:C32([ADDRESS_FORMATS:74]Address_2_Name:4))
				[ADDRESS_FORMATS:74]Address_2_Name:4:=Uppers3([ADDRESS_FORMATS:74]Address_2_Name:4)
				DB_bo_RecordModified:=True:C214
				[ADDRESS_FORMATS:74]Export:10:=Export_Stamp2([ADDRESS_FORMATS:74]Export:10)
			: (Modified:C32([ADDRESS_FORMATS:74]Town_Name:5))
				[ADDRESS_FORMATS:74]Town_Name:5:=Uppers3([ADDRESS_FORMATS:74]Town_Name:5)
				DB_bo_RecordModified:=True:C214
				[ADDRESS_FORMATS:74]Export:10:=Export_Stamp2([ADDRESS_FORMATS:74]Export:10)
			: (Modified:C32([ADDRESS_FORMATS:74]County_Name:6))
				[ADDRESS_FORMATS:74]County_Name:6:=Uppers3([ADDRESS_FORMATS:74]County_Name:6)
				DB_bo_RecordModified:=True:C214
				[ADDRESS_FORMATS:74]Export:10:=Export_Stamp2([ADDRESS_FORMATS:74]Export:10)
			: (Modified:C32([ADDRESS_FORMATS:74]Postcode_Name:7))
				[ADDRESS_FORMATS:74]Postcode_Name:7:=Uppers3([ADDRESS_FORMATS:74]Postcode_Name:7)
				DB_bo_RecordModified:=True:C214
				[ADDRESS_FORMATS:74]Export:10:=Export_Stamp2([ADDRESS_FORMATS:74]Export:10)
			: (Modified:C32([ADDRESS_FORMATS:74]Country_Name:8))
				[ADDRESS_FORMATS:74]Country_Name:8:=Uppers3([ADDRESS_FORMATS:74]Country_Name:8)
				DB_bo_RecordModified:=True:C214
				[ADDRESS_FORMATS:74]Export:10:=Export_Stamp2([ADDRESS_FORMATS:74]Export:10)
			: (Modified:C32([ADDRESS_FORMATS:74]Check_PostalCode:14))
				DB_bo_RecordModified:=True:C214
				[ADDRESS_FORMATS:74]Export:10:=Export_Stamp2([ADDRESS_FORMATS:74]Export:10)
			: (Modified:C32([ADDRESS_FORMATS:74]Enforce_PostalCode:15))
				DB_bo_RecordModified:=True:C214
				[ADDRESS_FORMATS:74]Export:10:=Export_Stamp2([ADDRESS_FORMATS:74]Export:10)
		End case 
	: ($_l_Event=On Clicked:K2:4)
		If (PAL_BUTTON#"")
			$_t_PalletteButtonName:=PAL_BUTTON
			PAL_BUTTON:=""
			DB_HandleInputFormButtons($_t_PalletteButtonName)
			PAL_bo_ButtonSubFunction:=False:C215
		End if 
	: ($_l_Event=On Activate:K2:9)
		DB_SetInputFormMenu(Table:C252(->[ADDRESS_FORMATS:74]); "Types_in")
		SD2_SetDiaryPopup
		If (Records in selection:C76([ADDRESS_FORMATS:74])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
	: ($_l_Event=On Menu Selected:K2:14)
		DB_SetInputFormMenu(Table:C252(->[ADDRESS_FORMATS:74]); "Types_in")
		SD2_SetDiaryPopup
		If (Records in selection:C76([ADDRESS_FORMATS:74])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
End case 
ERR_MethodTrackerReturn("AddTypes_InLP"; $_t_oldMethodName)
