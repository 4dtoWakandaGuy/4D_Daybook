//%attributes = {}
If (False:C215)
	//Project Method Name:      Letters_inLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/12/2009 14:59`Method: Letters_inLP
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(CB_saveasTemplate)
	//C_UNKNOWN(iCancel)
	//C_UNKNOWN(iOK)
	//C_UNKNOWN(ModuleNumber)
	//C_UNKNOWN(PAL_BUTTON)
	//C_UNKNOWN(PAL_but_LastRecord)
	//C_UNKNOWN(PAL_but_NextRecord)
	//C_UNKNOWN(PAL_but_FirstRecord)
	//C_UNKNOWN(vButtDisDOC)
	//C_UNKNOWN(vLetterCode)
	//ARRAY LONGINT(MOD_al_ModuleBarNum;0)
	//ARRAY LONGINT(MOD_al_ModuleBarOffsets;0)
	C_BOOLEAN:C305(DB_bo_RecordModified; DOC_bo_DOCUserPassword; DOC_bo_PDFPreventCopy; DOC_bo_PDFPreventEdit; DOC_bo_PDFPreventPrinting; DOC_bo_FromDiary; PAL_bo_ButtonSubFunction; PDF_bo_IsLicenced; DB_bo_NoLoad; DB_bo_RecordModified; DOC_bo_DOCUserPassword)
	C_BOOLEAN:C305(DOC_bo_PDFPreventCopy; DOC_bo_PDFPreventEdit; DOC_bo_PDFPreventPrinting; PAL_bo_ButtonSubFunction; PDF_bo_IsLicenced)
	C_LONGINT:C283($_l_Event; $_l_ModuleRow; $_l_Process; CB_saveasTemplate; DB_l_ButtonClickedFunction; DB_l_WindowCurrentModule; iCancel; iOK; ModuleNumber; PAL_but_LastRecord; PAL_but_NextRecord)
	C_LONGINT:C283(PAL_but_FirstRecord; $_l_ButtonNumber; $_l_Event; $_l_ModuleRow; $_l_Process; DB_l_ButtonClickedFunction; DB_l_WindowCurrentModule; PAL_but_PreviousRecord)
	C_TEXT:C284($_t_oldMethodName; $_t_PalletButtonName; BAR_t_Button; DB_t_CUrrentInputMenuRef; DB_T_CurrentInputWindowMenu; PAL_BUTTON; vButtDisDOC; vLetterCode; WIN_t_CurrentInputForm; <>LetCode; $_t_oldMethodName)
	C_TEXT:C284($_t_PalletButtonName; BAR_t_Button; DB_t_CUrrentInputMenuRef; DB_T_CurrentInputWindowMenu; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Letters_inLP")
$_l_Event:=Form event code:C388



Case of 
	: ($_l_Event=On Activate:K2:9) & (Not:C34(DB_bo_NoLoad))
		
		
		DB_SetInputFormMenu(Table:C252(->[DOCUMENTS:7]); "Letters_inW")
		OpenHelp(Table:C252(->[DOCUMENTS:7]); WIN_t_CurrentInputForm)
		
		In_ButtChkDis(->vButtDisDOC)
		
		If (Records in selection:C76([DOCUMENTS:7])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
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
				
			: (((DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
				
				If (PDF_bo_IsLicenced)
					If (DOC_bo_PDFPreventCopy) | (DOC_bo_PDFPreventEdit) | (DOC_bo_PDFPreventPrinting) | (DOC_bo_DOCUserPassword)
						SET BLOB SIZE:C606([DOCUMENTS:7]PDF_Options:31; 0)
						VARIABLE TO BLOB:C532(DOC_bo_PDFPreventCopy; [DOCUMENTS:7]PDF_Options:31; *)
						VARIABLE TO BLOB:C532(DOC_bo_PDFPreventEdit; [DOCUMENTS:7]PDF_Options:31; *)
						VARIABLE TO BLOB:C532(DOC_bo_PDFPreventPrinting; [DOCUMENTS:7]PDF_Options:31; *)
						VARIABLE TO BLOB:C532(DOC_bo_DOCUserPassword; [DOCUMENTS:7]PDF_Options:31; *)
					End if 
				End if 
				In_ButtCall("Letter_Text"; ""; "Minor_DelSinEx"; ->[DOCUMENTS:7]; ->[DOCUMENTS:7]Document_Code:1; "Documents"; "1"; "Letters_inLPB"; "Master"; "Letters_Sel"; ""; ->[IDENTIFIERS:16]; ->vButtDisDOC)
		End case 
		If (CB_saveasTemplate=1)
			$_l_Process:=New process:C317("DS_MakeTemplateFromDocument"; 128000; "Auto Create Template"; [DOCUMENTS:7]Document_Code:1)
			
		End if 
		
	: ($_l_Event=On Deactivate:K2:10)
		
		
		//PAUSE PROCESS(vProc)
	: ($_l_Event=On Clicked:K2:4) | ($_l_Event=On Double Clicked:K2:5) | ($_l_Event=On Menu Selected:K2:14) | ($_l_Event=On Data Change:K2:15) | ($_l_Event=On Plug in Area:K2:16)
		
		
		Case of 
			: (BAR_t_Button#"")
				
				$_l_ButtonNumber:=Num:C11(BAR_t_Button)
				If ($_l_ButtonNumber>1)
					ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_ButtonNumber-1}
					$_l_ModuleRow:=Find in array:C230(MOD_al_ModuleBarNum; ModuleNumber)
					DB_SetBrowserBarSelection($_l_ModuleRow; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
					DB_SetInputFormMenu(Table:C252(->[DOCUMENTS:7]); "Letters_inW")
					
				End if 
				BAR_t_Button:=""
			: (PAL_BUTTON#"")
				$_t_PalletButtonName:=PAL_BUTTON
				PAL_BUTTON:=""
				DB_HandleInputFormButtons($_t_PalletButtonName)
				PAL_bo_ButtonSubFunction:=False:C215
				
			: (Modified:C32([DOCUMENTS:7]Document_Code:1))
				RemoveLeadTr(Uppers2([DOCUMENTS:7]Document_Code:1); ->[DOCUMENTS:7]Document_Code:1)
				vLetterCode:=[DOCUMENTS:7]Document_Code:1
				[DOCUMENTS:7]Export:6:=Export_Stamp2([DOCUMENTS:7]Export:6)
				DB_bo_RecordModified:=True:C214
				<>LetCode:=[DOCUMENTS:7]Document_Code:1
				Gen_AutoProc
				Macro_AccTypePt(->[DOCUMENTS:7]Document_Code:1)
			: (Modified:C32([DOCUMENTS:7]Heading:2))
				[DOCUMENTS:7]Export:6:=Export_Stamp2([DOCUMENTS:7]Export:6)
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[DOCUMENTS:7]Heading:2)
			: (Modified:C32([DOCUMENTS:7]Text:3))
				[DOCUMENTS:7]Export:6:=Export_Stamp2([DOCUMENTS:7]Export:6)
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[DOCUMENTS:7]Text:3)
			: (Modified:C32([DOCUMENTS:7]Write_:5))
				[DOCUMENTS:7]Export:6:=Export_Stamp2([DOCUMENTS:7]Export:6)
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[DOCUMENTS:7]Write_:5)
			: (Modified:C32([DOCUMENTS:7]Document_Font:7))
				SetFontsByPointerParameter([DOCUMENTS:7]Document_Font_Size:8; [DOCUMENTS:7]Document_Font:7; 0; ->[DOCUMENTS:7]Heading:2; ->[DOCUMENTS:7]Text:3)
				
				//Set_FontsFS ("[DOCUMENTS]Heading+[DOCUMENTS]Text";[DOCUMENTS]FDocument_Font;[DOCUMENTS]iDocument_Font_Size)
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[DOCUMENTS:7]Document_Font:7)
			: (Modified:C32([DOCUMENTS:7]Document_Font_Size:8))
				SetFontsByPointerParameter([DOCUMENTS:7]Document_Font_Size:8; [DOCUMENTS:7]Document_Font:7; 0; ->[DOCUMENTS:7]Heading:2; ->[DOCUMENTS:7]Text:3)
				
				//Set_FontsFS ("[DOCUMENTS]Heading+[DOCUMENTS]Text";[DOCUMENTS]FDocument_Font;[DOCUMENTS]iDocument_Font_Size)
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[DOCUMENTS:7]Document_Font_Size:8)
			: (Modified:C32([DOCUMENTS:7]Person:10))
				Check_MinorNC(->[DOCUMENTS:7]Person:10; "Person"; ->[PERSONNEL:11]; ->[PERSONNEL:11]Initials:1; ->[PERSONNEL:11]Name:2)
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[DOCUMENTS:7]Person:10)
			: ($_l_Event=On Menu Selected:K2:14)
				
				DB_SetInputFormMenu(Table:C252(->[DOCUMENTS:7]); "Letters_inW")
				In_ButtChkDis(->vButtDisDOC)
				If (Records in selection:C76([DOCUMENTS:7])<=1)
					OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
					OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
					OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
					OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
					DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
					DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
				End if 
		End case 
		
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		
		DB_SetnewToolBar
		OpenHelp(Table:C252(->[DOCUMENTS:7]); WIN_t_CurrentInputForm)
		If (WIN_t_CurrentInputForm="eMail_in")
			WS_AutoscreenSize(1; 0; 700; Table name:C256(->[DOCUMENTS:7])+"_"+WIN_t_CurrentInputForm)
		Else 
			WS_AutoscreenSize(1; 0; 700; Table name:C256(->[DOCUMENTS:7])+"_"+WIN_t_CurrentInputForm)
		End if 
		
		Letters_InLPB
		In_ButtChkDis(->vButtDisDOC)
		DB_SetInputFormMenu(Table:C252(->[DOCUMENTS:7]); "Letters_inW")
		
		If (Records in selection:C76([DOCUMENTS:7])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		
End case 
ERR_MethodTrackerReturn("Letters_inLP"; $_t_oldMethodName)
