//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Macros_InLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/12/2013 18:27
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(MOD_al_ModuleBarNum;0)
	//ARRAY LONGINT(MOD_al_ModuleBarOffsets;0)
	C_BOOLEAN:C305(DB_bo_NoLoad; DB_bo_RecordModified; MAC_bo_NoButtons; PAL_bo_ButtonSubFunction)
	C_LONGINT:C283(<>SCPT_l_RecordEdit; $_l_ButtonNumber; $_l_Event; $_l_ModulePosition; $_l_ScriptLength; DB_l_ButtonClickedFunction; DB_l_WindowCurrentModule; iCancel; iOK; ModuleNumber; PAL_BUTTON_10)
	C_LONGINT:C283(PAL_BUTTON_7; PAL_BUTTON_8; PAL_BUTTON_9)
	C_TEXT:C284($_t_oldMethodName; $_t_PalletButtonName; BAR_t_Button; DB_t_CUrrentInputMenuRef; DB_T_CurrentInputWindowMenu; PAL_BUTTON; vButtDisSCRIPT; WIN_t_CurrentInputForm)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("Macros_InLP")

AA_DBNormaliseFieldNames
$_l_Event:=Form event code:C388
Case of 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[SCRIPTS:80]); WIN_t_CurrentInputForm)
		If (WIN_t_CurrentInputForm#"Macro_RestrictedEntry")
			WS_AutoscreenSize(1; 0; 550; Table name:C256(->[SCRIPTS:80])+"_"+WIN_t_CurrentInputForm)
		End if 
		Macros_InLPB
		In_ButtChkDis(->vButtDisSCRIPT)
		If (WIN_t_CurrentInputForm#"Macro_RestrictedEntry")
			DB_SetInputFormMenu(Table:C252(->[SCRIPTS:80]); "scripts In13")
		End if 
		If (Records in selection:C76([SCRIPTS:80])<=1)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_8; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_7; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_9; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_10; False:C215)
			If (WIN_t_CurrentInputForm#"Macro_RestrictedEntry")
				DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
				DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			End if 
		End if 
	: ($_l_Event=On Activate:K2:9)
		
		
		
		DB_SetInputFormMenu(Table:C252(->[SCRIPTS:80]); "scripts In13")
		OpenHelp(Table:C252(->[SCRIPTS:80]); WIN_t_CurrentInputForm)
		If (Records in selection:C76([SCRIPTS:80])<=1)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_8; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_7; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_9; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_10; False:C215)
			If (WIN_t_CurrentInputForm#"Macro_RestrictedEntry")
				
				DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
				DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			End if 
		End if 
		
		In_ButtChkDis(->vButtDisSCRIPT)
	: ($_l_Event=On Menu Selected:K2:14)
		
		DB_SetInputFormMenu(Table:C252(->[SCRIPTS:80]); "scripts In13")
		If (Records in selection:C76([SCRIPTS:80])<=1)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_8; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_7; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_9; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_10; False:C215)
			If (WIN_t_CurrentInputForm#"Macro_RestrictedEntry")
				DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
				DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			End if 
		End if 
		In_ButtChkDis(->vButtDisSCRIPT)
	: ($_l_Event=On Outside Call:K2:11)
		Case of 
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("FormWindows"))
				If (DB_t_CUrrentInputMenuRef#"") & (DB_T_CurrentInputWindowMenu#"")
					DB_T_CurrentInputWindowMenu:=DB_BuildWIndowsMenu(DB_T_CurrentInputWindowMenu)
					SET_MENU BAR(DB_t_CUrrentInputMenuRef)
				End if 
				DB_l_ButtonClickedFunction:=0
				
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Subfunction"))
				DB_l_ButtonClickedFunction:=0
				DB_SubFunctionHandler
			: (DB_l_ButtonClickedFunction#0) | (iOK=1) | (iCancel=1)
				In_ButtCall("Macros_InLPA"; ""; "Minor_DelSin"; ->[SCRIPTS:80]; ->[SCRIPTS:80]Script_Code:1; "Recordings"; "1"; "Macros_InLPB"; ""; "Macros_Sel"; ""; ->[IDENTIFIERS:16]; ->vButtDisSCRIPT)
				
			Else 
				
				If ((<>SCPT_l_RecordEdit=0) & (vAdd=0) & ([SCRIPTS:80]Script_Code:1#""))
					Macros_InLPA
					ACCEPT:C269
				End if 
		End case 
		
	: ($_l_Event=On Data Change:K2:15)
		//NG November 2007  I have disabled the calls to Macro_AccTypePt..these could never have worked because running a macro would cause this macro to unload. They could only run a macro in another process or loaded into an array
		//I have replaced them with a different call in which the scripts associated with the scripts table are loaded into arrays(this is done at the start of the macro editing process
		Case of 
			: (Modified:C32([SCRIPTS:80]Script_Code:1))
				RemoveLeadTr(Uppers2([SCRIPTS:80]Script_Code:1); ->[SCRIPTS:80]Script_Code:1)
				If (([SCRIPTS:80]Script_Code:1="ITX @") | ([SCRIPTS:80]Script_Code:1="IMA @") | ([SCRIPTS:80]Script_Code:1="ITO @") | ([SCRIPTS:80]Script_Code:1="IRE @"))
					[SCRIPTS:80]Script_Code:1:=Uppercase:C13(Substring:C12([SCRIPTS:80]Script_Code:1; 1; 4))+Substring:C12([SCRIPTS:80]Script_Code:1; 5; Length:C16([SCRIPTS:80]Script_Code:1))
					If ([SCRIPTS:80]Script_Code:1#"ITO @")
						[SCRIPTS:80]Same_Process:6:=True:C214
					End if 
					[SCRIPTS:80]Person:5:=""
					If ([SCRIPTS:80]Script_Code:1="IMA @")
						$_l_ScriptLength:=Length:C16([SCRIPTS:80]Script_Code:1)
						[SCRIPTS:80]Script_Code:1:=Str_IMAChars([SCRIPTS:80]Script_Code:1)
						If (Length:C16([SCRIPTS:80]Script_Code:1)#$_l_ScriptLength)
							Gen_Alert("Certain characters are not allowed in IMA script_codes,"+" and have been stripped out.")
						End if 
						If (Length:C16([SCRIPTS:80]Script_Code:1)<7)
							Gen_Alert("IMA scripts should have Code with at least 3 characters after the IMA and space."; "Try again")
							GOTO OBJECT:C206([SCRIPTS:80]Script_Code:1)
						End if 
					End if 
				End if 
				DB_bo_RecordModified:=True:C214
				[SCRIPTS:80]Modified_Date:10:=Current date:C33
				//Macro_AccTypePt (->[scripts]script_code)
			: (Modified:C32([SCRIPTS:80]Script_Group:9))
				Check_Lists(->[SCRIPTS:80]Script_Group:9; "Script_Groups")
				DB_bo_RecordModified:=True:C214
				[SCRIPTS:80]Modified_Date:10:=Current date:C33
				//Macro_AccTypePt (->[scripts]Script_Group)
			: (Modified:C32([SCRIPTS:80]Script_Name:2))
				[SCRIPTS:80]Script_Name:2:=Uppers2([SCRIPTS:80]Script_Name:2)
				DB_bo_RecordModified:=True:C214
				[SCRIPTS:80]Modified_Date:10:=Current date:C33
				//Macro_AccTypePt (->[scripts]Script_Name)
			: (Modified:C32([SCRIPTS:80]Recording_Text:4))
				DB_bo_RecordModified:=True:C214
				[SCRIPTS:80]Modified_Date:10:=Current date:C33
				//Macro_AccTypePt (->[scripts]Recording Text)
			: (Modified:C32([SCRIPTS:80]Keystroke:3))
				If ([SCRIPTS:80]Keystroke:3#"S@")
					[SCRIPTS:80]Background:7:=False:C215
				End if 
				DB_bo_RecordModified:=True:C214
				[SCRIPTS:80]Modified_Date:10:=Current date:C33
				//Macro_AccTypePt (->[scripts]Keystroke)
			: (Modified:C32([SCRIPTS:80]Person:5))
				Check_MinorNC(->[SCRIPTS:80]Person:5; "Person"; ->[PERSONNEL:11]; ->[PERSONNEL:11]Initials:1; ->[PERSONNEL:11]Name:2)
				DB_bo_RecordModified:=True:C214
				[SCRIPTS:80]Modified_Date:10:=Current date:C33
				//Macro_AccTypePt (->[scripts]Person)
			: (Modified:C32([SCRIPTS:80]Same_Process:6))
				If ([SCRIPTS:80]Same_Process:6)
					[SCRIPTS:80]Background:7:=False:C215
				End if 
				DB_bo_RecordModified:=True:C214
				[SCRIPTS:80]Modified_Date:10:=Current date:C33
				//Macro_AccTypePt (->[scripts]Same Process)
			: (Modified:C32([SCRIPTS:80]Background:7))
				If (([SCRIPTS:80]Keystroke:3#"S@") | ([SCRIPTS:80]Same_Process:6))
					Gen_Alert("Background scripts can only be used on Startup in a New Process"; "Cancel")
					[SCRIPTS:80]Background:7:=False:C215
				End if 
				DB_bo_RecordModified:=True:C214
				[SCRIPTS:80]Modified_Date:10:=Current date:C33
				//Macro_AccTypePt (->[scripts]Background)
			: (Modified:C32([SCRIPTS:80]Modified_Date:10))
				DB_bo_RecordModified:=True:C214
				//Macro_AccTypePt (->[scripts]Modified Date)
		End case 
	: ($_l_Event=On Clicked:K2:4)
		Case of 
			: (BAR_t_Button#"")
				
				$_l_ButtonNumber:=Num:C11(BAR_t_Button)
				If ($_l_ButtonNumber>1)
					ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_ButtonNumber-1}
					$_l_ModulePosition:=Find in array:C230(MOD_al_ModuleBarNum; ModuleNumber)
					DB_SetBrowserBarSelection($_l_ModulePosition; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
					DB_SetInputFormMenu(Table:C252(->[SCRIPTS:80]); "scripts In13")
					
					
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
ERR_MethodTrackerReturn("scripts InLP"; $_t_oldMethodName)