//%attributes = {}
If (False:C215)
	//Project Method Name:      Postcodes_InLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/10/2010 17:40
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
	C_LONGINT:C283($_l_ButtonNumber; $_l_Event; $_l_ModuleRow; DB_l_ButtonClickedFunction; DB_l_WindowCurrentModule; iCancel; iOK; ModuleNumber; PAL_but_LastRecord; PAL_but_PreviousRecord; PAL_but_NextRecord)
	C_LONGINT:C283(PAL_but_FirstRecord)
	C_TEXT:C284($_t_oldMethodName; $_t_PalletButtonName; BAR_t_Button; DB_t_CUrrentInputMenuRef; DB_T_CurrentInputWindowMenu; PAL_BUTTON; vButtDisPC; WIN_t_CurrentInputForm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Postcodes_InLP")
//Postcodes_InLP
$_l_Event:=Form event code:C388


Case of 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[POSTAL_CODES:50]); WIN_t_CurrentInputForm)
		Postcodes_InLPB
		In_ButtChkDis(->vButtDisPC)
		
		DB_SetInputFormMenu(Table:C252(->[POSTAL_CODES:50]); "PostalCode_In")
		If (Records in selection:C76([POSTAL_CODES:50])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		
	: ($_l_Event=On Activate:K2:9)
		DB_SetInputFormMenu(Table:C252(->[POSTAL_CODES:50]); "PostalCode_In")
		OpenHelp(Table:C252(->[POSTAL_CODES:50]); WIN_t_CurrentInputForm)
		
		In_ButtChkDis(->vButtDisPC)
		
		If (Records in selection:C76([POSTAL_CODES:50])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
	: ($_l_Event=On Menu Selected:K2:14)
		DB_SetInputFormMenu(Table:C252(->[POSTAL_CODES:50]); "PostalCode_In")
		In_ButtChkDis(->vButtDisPC)
		If (Records in selection:C76([POSTAL_CODES:50])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
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
				In_ButtCall(""; ""; "Minor_DelSinEx"; ->[POSTAL_CODES:50]; ->[POSTAL_CODES:50]Postal_Code_From:1; "Postcodes"; "1 2"; "Postcodes_InLPB"; ""; ""; ""; ->[IDENTIFIERS:16]; ->vButtDisPC)
		End case 
	: ($_l_Event=On Data Change:K2:15)
		Case of 
			: (Modified:C32([POSTAL_CODES:50]Postal_Code_From:1))
				[POSTAL_CODES:50]Postal_Code_From:1:=Uppercase:C13([POSTAL_CODES:50]Postal_Code_From:1)
				[POSTAL_CODES:50]Export:3:=Export_Stamp2([POSTAL_CODES:50]Export:3)
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[POSTAL_CODES:50]Postal_Code_From:1)
			: (Modified:C32([POSTAL_CODES:50]Postal_Code_To:4))
				[POSTAL_CODES:50]Postal_Code_To:4:=Uppercase:C13([POSTAL_CODES:50]Postal_Code_To:4)
				[POSTAL_CODES:50]Export:3:=Export_Stamp2([POSTAL_CODES:50]Export:3)
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[POSTAL_CODES:50]Postal_Code_To:4)
			: (Modified:C32([POSTAL_CODES:50]Area_Code:2))
				Check_Minor(->[POSTAL_CODES:50]Area_Code:2; "Area"; ->[AREAS:3]; ->[AREAS:3]Area_Code:1; ->[AREAS:3]Area_Name:2; "Areas In")
				[POSTAL_CODES:50]Export:3:=Export_Stamp2([POSTAL_CODES:50]Export:3)
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[POSTAL_CODES:50]Area_Code:2)
		End case 
	: ($_l_Event=On Clicked:K2:4)
		Case of 
			: (BAR_t_Button#"")
				$_l_ButtonNumber:=Num:C11(BAR_t_Button)
				If ($_l_ButtonNumber>1)
					ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_ButtonNumber-1}
					$_l_ModuleRow:=Find in array:C230(MOD_al_ModuleBarNum; ModuleNumber)
					DB_SetBrowserBarSelection($_l_ModuleRow; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
					DB_SetInputFormMenu(Table:C252(->[POSTAL_CODES:50]); "PostalCode_In")
					
				End if 
				BAR_t_Button:=""
			: (PAL_BUTTON#"")
				$_t_PalletButtonName:=PAL_BUTTON
				PAL_BUTTON:=""
				DB_HandleInputFormButtons($_t_PalletButtonName)
				PAL_bo_ButtonSubFunction:=False:C215
		End case 
	: ($_l_Event=On Deactivate:K2:10)
		// PAUSE PROCESS(vProc)
End case 
ERR_MethodTrackerReturn("Postcodes_InLP"; $_t_oldMethodName)