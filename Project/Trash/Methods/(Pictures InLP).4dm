//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Pictures InLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/10/2010 16:46
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
	C_LONGINT:C283($_l_ButtonNumber; $_l_Event; $_l_ModuleRow; DB_l_ButtonClickedFunction; DB_l_WindowCurrentModule; iCancel; iOK; ModuleNumber; PAL_BUTTON_10; PAL_BUTTON_7; PAL_BUTTON_8)
	C_LONGINT:C283(PAL_BUTTON_9)
	C_TEXT:C284($_t_oldMethodName; $_t_PalletButtonName; BAR_t_Button; DB_t_CUrrentInputMenuRef; DB_T_CurrentInputWindowMenu; PAL_BUTTON; vButtDisPICTURES; WIN_t_CurrentInputForm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Pictures InLP")
$_l_Event:=Form event code:C388

Case of 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[PICTURES:85]); WIN_t_CurrentInputForm)
		Pictures_InLPB
		In_ButtChkDis(->vButtDisPICTURES)
		
		DB_SetInputFormMenu(Table:C252(->[PICTURES:85]); "Pictures In13")
		If (Records in selection:C76([PICTURES:85])<=1)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_8; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_7; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_9; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_10; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		
	: ($_l_Event=On Activate:K2:9)
		DB_SetInputFormMenu(Table:C252(->[PICTURES:85]); "Pictures In13")
		OpenHelp(Table:C252(->[PICTURES:85]); WIN_t_CurrentInputForm)
		
		In_ButtChkDis(->vButtDisPICTURES)
		
		If (Records in selection:C76([PICTURES:85])<=1)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_8; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_7; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_9; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_10; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
	: ($_l_Event=On Menu Selected:K2:14)
		DB_SetInputFormMenu(Table:C252(->[PICTURES:85]); "Pictures In13")
		In_ButtChkDis(->vButtDisPICTURES)
		If (Records in selection:C76([PICTURES:85])<=1)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_8; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_7; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_9; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_10; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
	: ((($_l_Event=On Outside Call:K2:11) & (DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
		Case of 
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("FormWindows"))
				If (DB_t_CUrrentInputMenuRef#"") & (DB_T_CurrentInputWindowMenu#"")
					DB_T_CurrentInputWindowMenu:=DB_BuildWIndowsMenu(DB_T_CurrentInputWindowMenu)
					SET_MENU BAR(DB_t_CUrrentInputMenuRef)
				End if 
				DB_l_ButtonClickedFunction:=0
			: (DB_l_ButtonClickedFunction=902)
				DB_l_ButtonClickedFunction:=0
				DB_SubFunctionHandler
			Else 
				In_ButtCall(""; ""; "Minor_DelSin"; ->[PICTURES:85]; ->[PICTURES:85]Picture_Code:1; "Pictures"; "1"; "Pictures_InLPB"; ""; ""; ""; ->[IDENTIFIERS:16]; ->vButtDisPICTURES)
		End case 
	: ($_l_Event=On Data Change:K2:15)
		Case of 
			: (Modified:C32([PICTURES:85]Picture_Code:1))
				RemoveLeadTr(Uppers2([PICTURES:85]Picture_Code:1); ->[PICTURES:85]Picture_Code:1)
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[PICTURES:85]Picture_Code:1)
			: (Modified:C32([PICTURES:85]Picture_Name:2))
				[PICTURES:85]Picture_Name:2:=Uppers2([PICTURES:85]Picture_Name:2)
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[PICTURES:85]Picture_Name:2)
			: (Modified:C32([PICTURES:85]Format:4))
				[PICTURES:85]Format:4:=Substring:C12([PICTURES:85]Format:4; 1; 1)
				// SET FORMAT([PICTURES]Picture;[PICTURES]Format)
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[PICTURES:85]Format:4)
		End case 
	: ($_l_Event=On Clicked:K2:4)
		Case of 
			: (BAR_t_Button#"")
				$_l_ButtonNumber:=Num:C11(BAR_t_Button)
				If ($_l_ButtonNumber>1)
					ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_ButtonNumber-1}
					$_l_ModuleRow:=Find in array:C230(MOD_al_ModuleBarNum; ModuleNumber)
					DB_SetBrowserBarSelection($_l_ModuleRow; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
					DB_SetInputFormMenu(Table:C252(->[PICTURES:85]); "Pictures In13")
				End if 
				BAR_t_Button:=""
			: (PAL_BUTTON#"")
				$_t_PalletButtonName:=PAL_BUTTON
				PAL_BUTTON:=""
				DB_HandleInputFormButtons($_t_PalletButtonName)
				PAL_bo_ButtonSubFunction:=False:C215
		End case 
		
	: ($_l_Event=On Deactivate:K2:10)
		//PAUSE PROCESS(vProc)
End case 
ERR_MethodTrackerReturn("Pictures InLP"; $_t_oldMethodName)