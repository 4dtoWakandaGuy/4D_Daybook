//%attributes = {}
If (False:C215)
	//Project Method Name:      Periods InLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   29/11/2010 15:02
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
	C_LONGINT:C283(PAL_BUTTON_9; vAdd)
	C_TEXT:C284($_t_oldMethodName; $_t_PalletButtonName; BAR_t_Button; DB_t_CUrrentInputMenuRef; DB_T_CurrentInputWindowMenu; PAL_BUTTON; vButtDisPeriods; WIN_t_CurrentInputForm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Periods InLP")
//lp Periods in
$_l_Event:=Form event code:C388


Case of 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		DB_SetnewToolBar
		OpenHelp(Table:C252(->[PERIODS:33]); WIN_t_CurrentInputForm)
		If ([PERIODS:33]Period_Code:1#"")
			GOTO OBJECT:C206([PERIODS:33]Period_Name:2)
		End if 
		If (vAdd=1)
			[PERIODS:33]Profit_Posted:9:=True:C214
		End if 
		vButtDisPeriods:="I  PMO  FSSSRCADT"
		Macro_AccType("Load "+String:C10(Table:C252(->[PERIODS:33])))
		
		Input_Buttons(->[PERIODS:33]; ->vButtDisPeriods)
		In_ButtChkDis(->vButtDisPeriods)
		
		DB_SetInputFormMenu(Table:C252(->[PERIODS:33]); "Period_In")
		If (Records in selection:C76([PERIODS:33])<=1)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_8; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_7; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_9; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_10; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
	: ($_l_Event=On Activate:K2:9)
		DB_SetInputFormMenu(Table:C252(->[PERIODS:33]); "Period_In")
		OpenHelp(Table:C252(->[PERIODS:33]); WIN_t_CurrentInputForm)
		
		In_ButtChkDis(->vButtDisPeriods)
		
		If (Records in selection:C76([PERIODS:33])<=1)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_8; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_7; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_9; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_10; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
	: ($_l_Event=On Menu Selected:K2:14)
		DB_SetInputFormMenu(Table:C252(->[PERIODS:33]); "Period_In")
		In_ButtChkDis(->vButtDisPeriods)
		If (Records in selection:C76([PERIODS:33])<=1)
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
					SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
				End if 
				DB_l_ButtonClickedFunction:=0
			: (DB_l_ButtonClickedFunction=902)
				DB_l_ButtonClickedFunction:=0
				DB_SubFunctionHandler
			Else 
				In_ButtCall(""; ""; "Periods_InDel"; ->[PERIODS:33]; ->[PERIODS:33]Period_Code:1; "Periods"; "1 3 4"; ""; ""; ""; ""; ->[IDENTIFIERS:16]; ->vButtDisPeriods)
		End case 
	: ($_l_Event=On Data Change:K2:15)
		Case of 
			: (Modified:C32([PERIODS:33]Period_Code:1))
				If (Old:C35([PERIODS:33]Period_Code:1)#"")
					QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Period_Code:4=Old:C35([PERIODS:33]Period_Code:1))
					If (Records in selection:C76([ACCOUNT_BALANCES:34])>0)
						Gen_Alert("That Period Code has been used and cannot be changed"; "Cancel")
						[PERIODS:33]Period_Code:1:=Old:C35([PERIODS:33]Period_Code:1)
					Else 
						RemoveLeadTr(Uppercase:C13([PERIODS:33]Period_Code:1); ->[PERIODS:33]Period_Code:1)
					End if 
				Else 
					RemoveLeadTr(Uppercase:C13([PERIODS:33]Period_Code:1); ->[PERIODS:33]Period_Code:1)
				End if 
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[PERIODS:33]Period_Code:1)
			: (Modified:C32([PERIODS:33]Period_Name:2))
				[PERIODS:33]Period_Name:2:=Uppers2([PERIODS:33]Period_Name:2)
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[PERIODS:33]Period_Name:2)
			: (Modified:C32([PERIODS:33]NL_Closed:5))
				If ([PERIODS:33]NL_Closed:5)
					[PERIODS:33]SL_Closed:7:=True:C214
					[PERIODS:33]PL_Closed:8:=True:C214
				End if 
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[PERIODS:33]NL_Closed:5)
			: (Modified:C32([PERIODS:33]SL_Closed:7))
				If ([PERIODS:33]NL_Closed:5)
					[PERIODS:33]SL_Closed:7:=True:C214
				End if 
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[PERIODS:33]SL_Closed:7)
			: (Modified:C32([PERIODS:33]PL_Closed:8))
				If ([PERIODS:33]NL_Closed:5)
					[PERIODS:33]PL_Closed:8:=True:C214
				End if 
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[PERIODS:33]PL_Closed:8)
		End case 
	: ($_l_Event=On Deactivate:K2:10)
	: ($_l_Event=On Clicked:K2:4)
		Case of 
			: (BAR_t_Button#"")
				$_l_ButtonNumber:=Num:C11(BAR_t_Button)
				If ($_l_ButtonNumber>1)
					ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_ButtonNumber-1}
					$_l_ModuleRow:=Find in array:C230(MOD_al_ModuleBarNum; ModuleNumber)
					DB_SetBrowserBarSelection($_l_ModuleRow; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
					DB_SetInputFormMenu(Table:C252(->[PERIODS:33]); "Period_In")
					
				End if 
				BAR_t_Button:=""
			: (PAL_BUTTON#"")
				$_t_PalletButtonName:=PAL_BUTTON
				PAL_BUTTON:=""
				DB_HandleInputFormButtons($_t_PalletButtonName)
				PAL_bo_ButtonSubFunction:=False:C215
		End case 
		//PAUSE PROCESS(vProc)
End case 
ERR_MethodTrackerReturn("Periods InLP"; $_t_oldMethodName)