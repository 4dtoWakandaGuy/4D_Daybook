//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Minor_LP Ex
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2013 12:26
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By 
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad; DB_bo_RecordModified; PAL_bo_ButtonSubFunction)
	C_LONGINT:C283($_l_Event; DB_l_ButtonClickedFunction; iCancel; iOK; vAdd)
	C_POINTER:C301($1; $2; $3; $4)
	C_TEXT:C284($_t_oldMethodName; $_t_oldMethodName2; $_t_PalletButtonName; $_t_Text; $5; $6; $7; DB_t_CUrrentInputMenuRef; DB_T_CurrentInputWindowMenu; PAL_BUTTON; vButtDis)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("Minor_LP Ex")

//lp Minor_LP Export_Stamp


$_l_Event:=Form event code:C388
Case of 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		DB_SetnewToolBar
		If (Is a variable:C294($1))
			$_t_Text:=$1->
		Else 
			If (Is field value Null:C964($1->))
				$_t_Text:=""
			Else 
				$_t_Text:=$1->
			End if 
		End if 
		If ($_t_Text#"")
			If (vAdd=1)
				$1->:=Uppercase:C13($_t_Text)
				$_t_Text:=$3->
				$3->:=Export_Stamp2($_t_Text)
			End if 
			GOTO OBJECT:C206($2->)
		End if 
		If ($7#"")
			$_t_oldMethodName2:=ERR_MethodTracker("EXECUTE: "+$7)
			EXECUTE FORMULA:C63($7)
		End if 
		vButtDis:="I  PMO  FSSSRCADT"
		Gen_InDisCode($1; ->vButtDis)
		Input_Buttons($4; ->vButtDis)
		Macro_AccType("Load "+String:C10(Table:C252($4)))
		SD2_SetDiaryPopup
		In_ButtChkDis(->vButtDis)
		
	: ($_l_Event=On Activate:K2:9) | ($_l_Event=On Menu Selected:K2:14)
		
		SD2_SetDiaryPopup
		
		In_ButtChkDis(->vButtDis)
		
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
				If ($7="@CU")
					In_ButtCall("Gen_CULPA"; ""; "Minor_DelSECU"; $4; $1; $5; $6; $7; ""; ""; ""; ->[IDENTIFIERS:16]; ->vButtDis)
				Else 
					In_ButtCall(""; ""; "Minor_DelSinEx"; $4; $1; $5; $6; $7; ""; ""; ""; ->[IDENTIFIERS:16]; ->vButtDis)
				End if 
		End case 
		
	: ($_l_Event=On Outside Call:K2:11)
		
		
	: ($_l_Event=On Data Change:K2:15)
		Case of 
			: (Modified:C32($1->))
				If (Is a variable:C294($1))
					$_t_Text:=$1->
				Else 
					If (Is field value Null:C964($1->))
						$_t_Text:=""
					Else 
						$_t_Text:=$1->
					End if 
				End if 
				
				$1->:=Str_StripDel(RemoveTrail2(Uppercase:C13($_t_Text)))
				If (Is a variable:C294($3))
					$_t_Text:=$3->
				Else 
					If (Is field value Null:C964($3->))
						$_t_Text:=""
					Else 
						$_t_Text:=$3->
					End if 
				End if 
				
				
				$3->:=Export_Stamp2($_t_Text)
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt($1)
			: (Modified:C32($2->))
				If (Is a variable:C294($2))
					$_t_Text:=$2->
				Else 
					If (Is field value Null:C964($2->))
						$_t_Text:=""
					Else 
						$_t_Text:=$2->
					End if 
				End if 
				
				$2->:=Uppers2($_t_Text)
				If (Is a variable:C294($3))
					$_t_Text:=$3->
				Else 
					If (Is field value Null:C964($3->))
						$_t_Text:=""
					Else 
						$_t_Text:=$3->
					End if 
				End if 
				
				$3->:=Export_Stamp2($_t_Text)
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
ERR_MethodTrackerReturn("Minor_LP Ex"; $_t_oldMethodName)
