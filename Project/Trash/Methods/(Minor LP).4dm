//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Minor LP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/09/2010 17:23
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad; DB_bo_RecordModified; PAL_bo_ButtonSubFunction)
	C_LONGINT:C283($_l_ButtonClicked; $_l_Event; DB_l_ButtonClickedFunction; iCancel; iOK)
	C_POINTER:C301($1; $2; $3)
	C_TEXT:C284($_t_oldMethodName; $_t_PalletButtonName; $4; $5; $6; $7; $8; DB_t_CUrrentInputMenuRef; DB_T_CurrentInputWindowMenu; MOD_FieldValue; PAL_BUTTON)
	C_TEXT:C284(vButtDis; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Minor LP")
//lp Minor LP
$_l_Event:=Form event code:C388

Case of 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		DB_SetnewToolBar
		OpenHelp(Table:C252($1); WIN_t_CurrentInputForm)
		If ($1->#"")
			$1->:=Uppercase:C13($1->)
			GOTO OBJECT:C206($2->)
		End if 
		If (Count parameters:C259>7)
			vButtDis:=$8
		Else 
			vButtDis:="I  PMO  FSSSRCADT"
		End if 
		Input_Buttons($3; ->vButtDis)
		Macro_AccType("Load "+String:C10(Table:C252($3)))
		
		
		In_ButtChkDis(->vButtDis)
		
		SD2_SetDiaryPopup
	: ($_l_Event=On Activate:K2:9) | ($_l_Event=On Menu Selected:K2:14)
		
		
		SD2_SetDiaryPopup
		
		In_ButtChkDis(->vButtDis)
		
	: ((($_l_Event=On Outside Call:K2:11) & (DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
		$_l_ButtonClicked:=DB_l_ButtonClickedFunction
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
				
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Plus")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Minus")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Open"))
				
				
				inButtSubHandle(FORM Get current page:C276; $3)
				$_l_ButtonClicked:=0
				
			Else 
				
				In_ButtCall($7; ""; "Minor_DelSin"; $3; $1; $4; $5; $6; ""; ""; ""; ->[IDENTIFIERS:16]; ->vButtDis)
		End case 
		DB_l_ButtonClickedFunction:=$_l_ButtonClicked
	: ($_l_Event=On Data Change:K2:15) | ($_l_Event=On Clicked:K2:4)
		Case of 
			: (Modified:C32($1->))
				MOD_FieldValue:=""
				RemoveLeadTr(Uppercase:C13($1->); ->MOD_FieldValue)
				$1->:=Str_StripDel(MOD_FieldValue)
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt($1)
			: (Modified:C32($2->))
				$2->:=Uppers2($2->)
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt($2)
			Else 
				If (PAL_BUTTON#"")
					$_t_PalletButtonName:=PAL_BUTTON
					PAL_BUTTON:=""
					DB_HandleInputFormButtons($_t_PalletButtonName)
					PAL_bo_ButtonSubFunction:=False:C215
				End if 
		End case 
	: ($_l_Event=On Deactivate:K2:10)
		// PAUSE PROCESS(vProc)
End case 
ERR_MethodTrackerReturn("Minor LP"; $_t_oldMethodName)
