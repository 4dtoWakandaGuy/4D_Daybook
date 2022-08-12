//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name: Diary_InLP
	//------------------ Method Notes ------------------
	//------------------ Revision Control ----------------
	//Date Created: 
	//Created BY: 
	//Date Modified: 
	//Modified By 
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(MOD_al_ModuleBarNum;0)
	//ARRAY LONGINT(MOD_al_ModuleBarOffsets;0)
	//ARRAY TEXT(<>SD3_at_HistoryRelation;0)
	//ARRAY TEXT(CO_at_ViewTabsLabels;0)
	C_BOOLEAN:C305(<>AutoFind; <>DB_bo_AutoOut; DB_bo_NoLoad; PAL_bo_ButtonSubFunction)
	C_LONGINT:C283(<>AutoProc; $_l_ActionBestHeight; $_l_ActionBestWidth; $_l_AdesBottom; $_l_AdesLeft; $_l_AdesRight; $_l_AdesTop; $_l_ButtonBottom; $_l_ButtonLeft; $_l_ButtonNumber; $_l_ButtonRight)
	C_LONGINT:C283($_l_buttonTop; $_l_CharacterPosition; $_l_Event; $_l_LabelBottom; $_l_LabelHeight; $_l_LabelLeft; $_l_LabelRight; $_l_LabelTop; $_l_MenuSelected; $_l_ModuleRow; $_l_NextLeft)
	C_LONGINT:C283($_l_NextObjectTop; $_l_OLBOttom; $_l_OLLeft; $_l_OLRight; $_l_OLTop; $_l_required; $_l_Space; $_l_TextBottom; $_l_TextLeft; $_l_TextRIght; $_l_TextTop)
	C_LONGINT:C283($_l_VertResize; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_windowTop; $mb; DB_l_ButtonClickedFunction; DB_l_WindowCurrentModule; iCancel; iOK; ModuleNumber)
	C_TEXT:C284(<>AutoFile; <>CallCode; <>JobCode; <>OrderCode; $_t_MenuName; $_t_oldMethodName; $_t_PalletButtonName; $_t_TabName; BAR_t_Button; DB_t_CUrrentInputMenuRef; DB_T_CurrentInputWindowMenu)
	C_TEXT:C284(PAL_BUTTON; vButtDisDry; WIN_t_CurrentInputForm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_InLP")

$_l_Event:=Form event code:C388
//Diary_InLP
Case of 
	: ($_l_Event=On Activate:K2:9)
		OpenHelp(Table:C252(->[DIARY:12]); WIN_t_CurrentInputForm)
		
		
		In_ButtChkDis(->vButtDisDry)
		DB_SetInputFormMenu(Table:C252(->[DIARY:12]); WIN_t_CurrentInputForm)
		
		
	: ((($_l_Event=On Outside Call:K2:11) & (DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
		
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
				
				//$Press:=DB L_ButtonClickedFunction
				inButtSubHandle(FORM Get current page:C276; ->[DIARY:12])
				
				
				
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Enter Related Diary"))
				//this would add a threaded action
				
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("View Related Diary"))
				//this would get other actions in the same thread
				TRACE:C157
				
			: (((DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
				
				In_ButtCall("Diary_InLPA"; "Diary_InLPCan"; "Minor_DelSinEx"; ->[DIARY:12]; ->[DIARY:12]Diary_Code:3; "Diary"; "3 9"; "Diary_InB"; "DMaster"; "Diary_Sel"; ""; ->[IDENTIFIERS:16]; ->vButtDisDry)
				
				
		End case 
		
		
		
	: ($_l_Event=On Menu Selected:K2:14)
		If (Menu selected:C152#0)
			$_l_MenuSelected:=Menu selected:C152
			$_l_MenuSelected:=$_l_MenuSelected\65536
			$_t_MenuName:=Get menu title:C430($_l_MenuSelected)
			If ("History"=$_t_MenuName)
				If (Modified record:C314([DIARY:12]))
					Diary_PersPrior
					DB_SaveRecord(->[DIARY:12])
					AA_CheckFileUnlocked(->[DIARY:12]x_ID:50)
				End if 
				<>SD3_at_HistoryRelation:=Diary_HistFind(($_l_MenuSelected%65536)+1)
				If (<>SD3_at_HistoryRelation>0)
					<>DB_bo_AutoOut:=True:C214
					<>AutoFind:=True:C214
					<>AutoProc:=Record number:C243([DIARY:12])
					<>AutoFile:="Diary"
					ZDiary_Mod
				Else 
					<>SD3_at_HistoryRelation:=1
				End if 
			End if 
		End if 
		
		///
	: ($_l_Event=On Data Change:K2:15) | ($_l_Event=On Clicked:K2:4) | ($_l_Event=On Menu Selected:K2:14) | ($_l_Event=On Plug in Area:K2:16)
		
		
		
		
		
		Case of 
				
				
				
			: (BAR_t_Button#"")
				
				$_l_ButtonNumber:=Num:C11(BAR_t_Button)
				If ($_l_ButtonNumber>1)
					ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_ButtonNumber-1}
					$_l_ModuleRow:=Find in array:C230(MOD_al_ModuleBarNum; ModuleNumber)
					DB_SetBrowserBarSelection($_l_ModuleRow; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
					If (Size of array:C274(CO_at_ViewTabsLabels)>0)
						If (CO_at_ViewTabsLabels=0)
							CO_at_ViewTabsLabels:=1
						End if 
						$_t_TabName:=CO_at_ViewTabsLabels{CO_at_ViewTabsLabels}
						Repeat 
							If ($_t_TabName[[1]]=" ")
								$_t_TabName:=Substring:C12($_t_TabName; 2)
							End if 
						Until ($_t_TabName[[1]]#" ")
						$_l_CharacterPosition:=Position:C15("("; $_t_TabName)
						If ($_l_CharacterPosition>0)
							$_t_TabName:=Substring:C12($_t_TabName; 1; $_l_CharacterPosition-1)
						End if 
					Else 
						$_t_TabName:=""
					End if 
					DB_SetInputFormMenu(Table:C252(->[DIARY:12]); "Diary_In13"; $_t_TabName)
					If ($_t_TabName#"")
						DB_MenuAction("View"; $_t_TabName; 4; "18"; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
					End if 
					
				End if 
				BAR_t_Button:=""
			: (PAL_BUTTON#"")
				$_t_PalletButtonName:=PAL_BUTTON
				PAL_BUTTON:=""
				DB_HandleInputFormButtons($_t_PalletButtonName)
				PAL_bo_ButtonSubFunction:=False:C215
			Else 
				Diary_InD
				If ($_l_Event=On Menu Selected:K2:14)
					
					
					
				End if 
		End case 
		
		
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[DIARY:12]); WIN_t_CurrentInputForm)
		INT_SetInput(Table:C252(->[DIARY:12]); WIN_t_CurrentInputForm)
		Diary_InB
		If (False:C215)
			If (Form current page:K67:6=2) | ([DIARY:12]Done:14)  //this is. 'done' item
				OBJECT GET COORDINATES:C663(*; "oDescriptionLabel"; $_l_LabelLeft; $_l_LabelTop; $_l_LabelRight; $_l_LabelBottom)
				$_l_LabelHeight:=$_l_LabelBottom-$_l_LabelTop
				OBJECT GET BEST SIZE:C717(*; "oActionDetailsP2"; $_l_ActionBestWidth; $_l_ActionBestHeight)
				Case of 
					: ($_l_ActionBestHeight>100)
						$_l_ActionBestHeight:=100
					: ($_l_ActionBestHeight<37)
						$_l_ActionBestHeight:=37
				End case 
				OBJECT GET COORDINATES:C663(*; "oActionDetailsP2"; $_l_AdesLeft; $_l_AdesTop; $_l_AdesRight; $_l_AdesBottom)
				OBJECT SET COORDINATES:C1248(*; "oActionDetailsP2"; $_l_AdesLeft; $_l_AdesTop; $_l_AdesRight; $_l_AdesTop+$_l_ActionBestHeight)
				$_l_NextObjectTop:=($_l_AdesTop+$_l_ActionBestHeight)+10
				
				If ([DIARY:12]Public:44)
					OBJECT SET VISIBLE:C603(*; "oPublicLabel"; True:C214)
					OBJECT SET VISIBLE:C603(*; "oPublicField"; True:C214)
					OBJECT SET COORDINATES:C1248(*; "oPublicLabel"; 2; $_l_NextObjectTop; $_l_LabelRight; $_l_NextObjectTop+$_l_LabelHeight)
					OBJECT SET COORDINATES:C1248(*; "oPublicField"; $_l_AdesLeft; $_l_NextObjectTop; $_l_AdesLeft+12; $_l_NextObjectTop+12)
					$_l_NextObjectTop:=($_l_AdesTop+12)+10
					
				Else 
					OBJECT SET VISIBLE:C603(*; "oPublicLabel"; False:C215)
					OBJECT SET VISIBLE:C603(*; "oPublicField"; False:C215)
				End if 
				If ([DIARY:12]Document_Code:15#"")
					OBJECT SET VISIBLE:C603(*; "oDocumentLabel"; True:C214)
					OBJECT SET VISIBLE:C603(*; "oDocumentCodeField"; True:C214)
					OBJECT SET VISIBLE:C603(*; "oDocumentTitleField"; True:C214)
					OBJECT SET COORDINATES:C1248(*; "oDocumentLabel"; 2; $_l_NextObjectTop; $_l_LabelRight; $_l_NextObjectTop+$_l_LabelHeight)
					OBJECT SET COORDINATES:C1248(*; "oDocumentCodeField"; $_l_AdesLeft; $_l_NextObjectTop; $_l_AdesLeft+133; $_l_NextObjectTop+14)
					OBJECT SET COORDINATES:C1248(*; "oDocumentTitleField"; ($_l_AdesLeft+133+5); $_l_NextObjectTop; $_l_AdesRight)
					$_l_NextObjectTop:=($_l_NextObjectTop+14)+10
				Else 
					OBJECT SET VISIBLE:C603(*; "oDocumentLabel"; False:C215)
					OBJECT SET VISIBLE:C603(*; "oDocumentCodeField"; False:C215)
					OBJECT SET VISIBLE:C603(*; "oDocumentTitleField"; False:C215)
				End if 
				If ([DIARY:12]Script_Code:29#"")
					OBJECT SET VISIBLE:C603(*; "oscriptLinkButton"; True:C214)
					
					OBJECT SET VISIBLE:C603(*; "oscriptLabel"; True:C214)
					OBJECT SET VISIBLE:C603(*; "oScriptCodeField"; True:C214)
					OBJECT SET COORDINATES:C1248(*; "oscriptLinkButton"; 2; $_l_NextObjectTop; $_l_LabelRight; $_l_NextObjectTop+$_l_LabelHeight)
					
					OBJECT SET COORDINATES:C1248(*; "oscriptLabel"; 2; $_l_NextObjectTop; $_l_LabelRight; $_l_NextObjectTop+$_l_LabelHeight)
					OBJECT SET COORDINATES:C1248(*; "oScriptCodeField"; $_l_AdesLeft; $_l_NextObjectTop; $_l_AdesLeft+133; $_l_NextObjectTop+14)
					$_l_NextObjectTop:=($_l_NextObjectTop+14)+10
				Else 
					OBJECT SET VISIBLE:C603(*; "oscriptLinkButton"; False:C215)
					OBJECT SET VISIBLE:C603(*; "oscriptLabel"; False:C215)
					OBJECT SET VISIBLE:C603(*; "oScriptCodeField"; False:C215)
				End if 
				OBJECT SET COORDINATES:C1248(*; "oOutcomeLabel"; 2; $_l_NextObjectTop; $_l_LabelRight; $_l_NextObjectTop+$_l_LabelHeight)
				OBJECT SET COORDINATES:C1248(*; "oOutcomeFIeld"; $_l_AdesLeft; $_l_NextObjectTop; $_l_AdesLeft+133; $_l_NextObjectTop+14)
				OBJECT SET COORDINATES:C1248(*; "oOutcomeTitle"; ($_l_AdesLeft+133+5); $_l_NextObjectTop; $_l_AdesRight)
				$_l_NextObjectTop:=($_l_NextObjectTop+14)+10
				
				
				//Available Space for Result
				$_l_required:=0
				If ([DIARY:12]Units:20>0) | ([DIARY:12]Value:16>0)
					$_l_required:=14+10
					
				End if 
				If ([DIARY:12]Job_Code:19#"") | ([DIARY:12]Stage_Code:21#"")
					$_l_required:=$_l_required+14+10
				End if 
				If ([DIARY:12]Order_Code:26#"")
					$_l_required:=$_l_required+14+10
				End if 
				If ([DIARY:12]Call_Code:25#"")
					$_l_required:=$_l_required+14+10
				End if 
				If ([DIARY:12]Product_Code:13#"")
					$_l_required:=$_l_required+14+10
				End if 
				OBJECT GET COORDINATES:C663(*; "Invisible Button4"; $_l_ButtonLeft; $_l_buttonTop; $_l_ButtonRight; $_l_ButtonBottom)
				$_l_Space:=($_l_buttonTop-$_l_NextObjectTop)-$_l_required
				Case of 
					: ($_l_Space<37)
						$_l_Space:=37
				End case 
				OBJECT GET COORDINATES:C663(*; "oResultDescriptionP2"; $_l_TextLeft; $_l_TextTop; $_l_TextRIght; $_l_TextBottom)
				OBJECT GET BEST SIZE:C717(*; "oResultDescriptionP2"; $_l_ActionBestWidth; $_l_ActionBestHeight)
				Case of 
					: ($_l_ActionBestHeight>$_l_Space)
						$_l_ActionBestHeight:=$_l_Space
					: ($_l_ActionBestHeight<37)
						$_l_ActionBestHeight:=37
					Else 
						$_l_ActionBestHeight:=$_l_Space
				End case 
				OBJECT SET COORDINATES:C1248(*; "oDescriptionLabel"; 2; $_l_NextObjectTop; $_l_LabelRight; $_l_NextObjectTop+$_l_LabelHeight)
				OBJECT SET COORDINATES:C1248(*; "oResultDescriptionP2"; $_l_AdesLeft; $_l_NextObjectTop; $_l_AdesRight; $_l_NextObjectTop+$_l_ActionBestHeight)
				$_l_NextObjectTop:=($_l_NextObjectTop+$_l_ActionBestHeight)+10
				If ([DIARY:12]Units:20>0)
					OBJECT SET VISIBLE:C603(*; "oTimeUnitsLabel"; True:C214)
					OBJECT SET VISIBLE:C603(*; "oTimeUnitsFIeld"; True:C214)
					OBJECT SET COORDINATES:C1248(*; "oTimeUnitsLabel"; 2; $_l_NextObjectTop; $_l_LabelRight; $_l_NextObjectTop+$_l_LabelHeight)
					OBJECT SET COORDINATES:C1248(*; "oTimeUnitsFIeld"; $_l_AdesLeft; $_l_NextObjectTop; $_l_AdesLeft+100; $_l_NextObjectTop+14)
					If ([DIARY:12]Value:16>0)
						$_l_NextLeft:=($_l_AdesLeft+100)+5
						OBJECT SET VISIBLE:C603(*; "oValueLabel"; False:C215)
						OBJECT SET VISIBLE:C603(*; "oDiaryValueField"; False:C215)
						OBJECT SET COORDINATES:C1248(*; "oValueLabel"; $_l_NextLeft; $_l_NextObjectTop; $_l_NextLeft+$_l_LabelRight-2; $_l_NextObjectTop+$_l_LabelHeight)
						$_l_NextLeft:=$_l_NextLeft+$_l_LabelRight-2+5
						OBJECT SET COORDINATES:C1248(*; "oDiaryValueField"; $_l_NextLeft; $_l_NextObjectTop; $_l_NextLeft+100; $_l_NextObjectTop+14)
						
					Else 
						OBJECT SET VISIBLE:C603(*; "oValueLabel"; False:C215)
						OBJECT SET VISIBLE:C603(*; "oDiaryValueField"; False:C215)
						
					End if 
					$_l_NextObjectTop:=($_l_NextObjectTop+14)+10
					
				Else 
					OBJECT SET VISIBLE:C603(*; "oTimeUnitsLabel"; False:C215)
					OBJECT SET VISIBLE:C603(*; "oTimeUnitsFIeld"; False:C215)
					If ([DIARY:12]Value:16>0)
						OBJECT SET VISIBLE:C603(*; "oValueLabel"; True:C214)
						OBJECT SET VISIBLE:C603(*; "oDiaryValueField"; True:C214)
						OBJECT SET COORDINATES:C1248(*; "oValueLabel"; 2; $_l_NextObjectTop; $_l_LabelRight; $_l_NextObjectTop+$_l_LabelHeight)
						OBJECT SET COORDINATES:C1248(*; "oDiaryValueField"; $_l_AdesLeft; $_l_NextObjectTop; $_l_AdesLeft+100; $_l_NextObjectTop+14)
						$_l_NextObjectTop:=($_l_NextObjectTop+14)+10
						
					Else 
						OBJECT SET VISIBLE:C603(*; "oValueLabel"; False:C215)
						OBJECT SET VISIBLE:C603(*; "oDiaryValueField"; False:C215)
						
					End if 
					
				End if 
				If ([DIARY:12]Job_Code:19#"")
					OBJECT SET VISIBLE:C603(*; "oJobStageLabel"; True:C214)
					OBJECT SET VISIBLE:C603(*; "oJobCodeField"; True:C214)
					OBJECT SET VISIBLE:C603(*; "oJobStageField"; True:C214)
					OBJECT SET VISIBLE:C603(*; "oJobStageName"; True:C214)
					OBJECT SET COORDINATES:C1248(*; "oJobStageLabel"; 2; $_l_NextObjectTop; $_l_LabelRight; $_l_NextObjectTop+$_l_LabelHeight)
					OBJECT SET COORDINATES:C1248(*; "oJobStageField"; $_l_AdesLeft; $_l_NextObjectTop; $_l_AdesLeft+100; $_l_NextObjectTop+14)
					OBJECT SET COORDINATES:C1248(*; "oJobStageField"; $_l_AdesLeft+100+5; $_l_NextObjectTop; $_l_AdesLeft+100+5+100; $_l_NextObjectTop+14)
					OBJECT SET COORDINATES:C1248(*; "oJobStageName"; ($_l_AdesLeft+100+5); $_l_NextObjectTop; $_l_AdesRight)
					$_l_NextObjectTop:=($_l_NextObjectTop+14)+10
					
				Else 
					OBJECT SET VISIBLE:C603(*; "oJobStageLabel"; False:C215)
					OBJECT SET VISIBLE:C603(*; "oJobCodeField"; False:C215)
					OBJECT SET VISIBLE:C603(*; "oJobStageField"; False:C215)
					OBJECT SET VISIBLE:C603(*; "oJobStageName"; False:C215)
					
					
				End if 
				If ([DIARY:12]Order_Code:26#"")
					OBJECT SET VISIBLE:C603(*; "oOrderCodeLabel"; True:C214)
					OBJECT SET VISIBLE:C603(*; "oOrderCodeField"; True:C214)
					OBJECT SET COORDINATES:C1248(*; "oOrderCodeLabel"; 2; $_l_NextObjectTop; $_l_LabelRight; $_l_NextObjectTop+$_l_LabelHeight)
					OBJECT SET COORDINATES:C1248(*; "oOrderCodeField"; $_l_AdesLeft; $_l_NextObjectTop; $_l_AdesLeft+100; $_l_NextObjectTop+14)
					$_l_NextObjectTop:=($_l_NextObjectTop+14)+10
				Else 
					OBJECT SET VISIBLE:C603(*; "oOrderCodeLabel"; False:C215)
					OBJECT SET VISIBLE:C603(*; "oOrderCodeField"; False:C215)
					
				End if 
				If ([DIARY:12]Product_Code:13#"")
					OBJECT SET VISIBLE:C603(*; "oProductCodeLabel"; True:C214)
					OBJECT SET VISIBLE:C603(*; "oProductCodeField"; True:C214)
					OBJECT SET VISIBLE:C603(*; "oProductName"; True:C214)
					OBJECT SET COORDINATES:C1248(*; "oProductCodeLabel"; 2; $_l_NextObjectTop; $_l_LabelRight; $_l_NextObjectTop+$_l_LabelHeight)
					OBJECT SET COORDINATES:C1248(*; "oProductCodeField"; $_l_AdesLeft; $_l_NextObjectTop; $_l_AdesLeft+100; $_l_NextObjectTop+14)
					OBJECT SET COORDINATES:C1248(*; "oProductName"; $_l_AdesLeft+100; $_l_NextObjectTop; $_l_AdesRight; $_l_NextObjectTop+14)
					
					$_l_NextObjectTop:=($_l_NextObjectTop+14)+10
				Else 
					OBJECT SET VISIBLE:C603(*; "oProductCodeLabel"; True:C214)
					OBJECT SET VISIBLE:C603(*; "oProductCodeField"; True:C214)
					OBJECT SET VISIBLE:C603(*; "oProductName"; True:C214)
				End if 
				If ([DIARY:12]Call_Code:25#"")
					OBJECT SET VISIBLE:C603(*; "oServiceCodeLabel"; True:C214)
					OBJECT SET VISIBLE:C603(*; "oServiceCodeField"; True:C214)
					OBJECT SET COORDINATES:C1248(*; "oProductCodeLabel"; 2; $_l_NextObjectTop; $_l_LabelRight; $_l_NextObjectTop+$_l_LabelHeight)
					OBJECT SET COORDINATES:C1248(*; "oProductCodeField"; $_l_AdesLeft; $_l_NextObjectTop; $_l_AdesLeft+100; $_l_NextObjectTop+14)
					
				Else 
					OBJECT SET VISIBLE:C603(*; "oServiceCodeLabel"; False:C215)
					OBJECT SET VISIBLE:C603(*; "oServiceCodeField"; False:C215)
					
				End if 
			Else 
				OBJECT GET COORDINATES:C663(*; "oDescriptionLabel"; $_l_LabelLeft; $_l_LabelTop; $_l_LabelRight; $_l_LabelBottom)
				$_l_LabelHeight:=$_l_LabelBottom-$_l_LabelTop
				OBJECT GET BEST SIZE:C717(*; "oActionDetailsP2"; $_l_ActionBestWidth; $_l_ActionBestHeight)
				Case of 
					: ($_l_ActionBestHeight>200)
						$_l_ActionBestHeight:=200
					: ($_l_ActionBestHeight<100)
						$_l_ActionBestHeight:=100
				End case 
				OBJECT GET COORDINATES:C663(*; "oActionDetailsP1"; $_l_AdesLeft; $_l_AdesTop; $_l_AdesRight; $_l_AdesBottom)
				OBJECT SET COORDINATES:C1248(*; "oActionDetailsP1"; $_l_AdesLeft; $_l_AdesTop; $_l_AdesRight; $_l_AdesTop+$_l_ActionBestHeight)
				$_l_NextObjectTop:=($_l_AdesTop+$_l_ActionBestHeight)+10
				////
				OBJECT SET VISIBLE:C603(*; "oPublicLabel"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oPublicField"; True:C214)
				OBJECT SET COORDINATES:C1248(*; "oPublicLabel"; 2; $_l_NextObjectTop; $_l_LabelRight; $_l_NextObjectTop+$_l_LabelHeight)
				OBJECT SET COORDINATES:C1248(*; "oPublicField"; $_l_AdesLeft; $_l_NextObjectTop; $_l_AdesLeft+12; $_l_NextObjectTop+12)
				$_l_NextObjectTop:=($_l_AdesTop+12)+10
				///
				OBJECT SET VISIBLE:C603(*; "oDocumentLabel"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oDocumentCodeField"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oDocumentTitleField"; True:C214)
				OBJECT SET COORDINATES:C1248(*; "oDocumentLabel"; 2; $_l_NextObjectTop; $_l_LabelRight; $_l_NextObjectTop+$_l_LabelHeight)
				OBJECT SET COORDINATES:C1248(*; "oDocumentCodeField"; $_l_AdesLeft; $_l_NextObjectTop; $_l_AdesLeft+133; $_l_NextObjectTop+14)
				OBJECT SET COORDINATES:C1248(*; "oDocumentTitleField"; ($_l_AdesLeft+133+5); $_l_NextObjectTop; $_l_AdesRight)
				$_l_NextObjectTop:=($_l_NextObjectTop+14)+10
				OBJECT SET VISIBLE:C603(*; "oscriptLinkButton"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oscriptLabel"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oScriptCodeField"; True:C214)
				OBJECT SET COORDINATES:C1248(*; "oscriptLinkButton"; 2; $_l_NextObjectTop; $_l_LabelRight; $_l_NextObjectTop+$_l_LabelHeight)
				OBJECT SET COORDINATES:C1248(*; "oscriptLabel"; 2; $_l_NextObjectTop; $_l_LabelRight; $_l_NextObjectTop+$_l_LabelHeight)
				OBJECT SET COORDINATES:C1248(*; "oScriptCodeField"; $_l_AdesLeft; $_l_NextObjectTop; $_l_AdesLeft+133; $_l_NextObjectTop+14)
				$_l_NextObjectTop:=($_l_NextObjectTop+14)+10
				OBJECT SET VISIBLE:C603(*; "oOutcomeTitle"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oOutcomeLabel"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oOutcomeFIeld"; True:C214)
				
				OBJECT SET COORDINATES:C1248(*; "oOutcomeLabel"; 2; $_l_NextObjectTop; $_l_LabelRight; $_l_NextObjectTop+$_l_LabelHeight)
				OBJECT SET COORDINATES:C1248(*; "oOutcomeFIeld"; $_l_AdesLeft; $_l_NextObjectTop; $_l_AdesLeft+133; $_l_NextObjectTop+14)
				$_l_NextObjectTop:=($_l_NextObjectTop+14)+10
				$_l_required:=(14+10)*5
				
				OBJECT GET COORDINATES:C663(*; "Invisible Button4"; $_l_ButtonLeft; $_l_buttonTop; $_l_ButtonRight; $_l_ButtonBottom)
				$_l_Space:=($_l_buttonTop-$_l_NextObjectTop)-$_l_required
				Case of 
					: ($_l_Space<37)
						$_l_Space:=37
				End case 
				OBJECT GET COORDINATES:C663(*; "oResultDescriptionP2"; $_l_TextLeft; $_l_TextTop; $_l_TextRIght; $_l_TextBottom)
				OBJECT GET BEST SIZE:C717(*; "oResultDescriptionP2"; $_l_ActionBestWidth; $_l_ActionBestHeight)
				Case of 
					: ($_l_ActionBestHeight>$_l_Space)
						$_l_ActionBestHeight:=$_l_Space
					: ($_l_ActionBestHeight<100)
						$_l_ActionBestHeight:=100
					Else 
						$_l_ActionBestHeight:=$_l_Space
				End case 
				OBJECT SET COORDINATES:C1248(*; "oDescriptionLabel"; 2; $_l_NextObjectTop; $_l_LabelRight; $_l_NextObjectTop+$_l_LabelHeight)
				OBJECT SET COORDINATES:C1248(*; "oResultDescriptionP1"; $_l_AdesLeft; $_l_NextObjectTop; $_l_AdesRight; $_l_NextObjectTop+$_l_ActionBestHeight)
				$_l_NextObjectTop:=($_l_NextObjectTop+$_l_ActionBestHeight)+10
				If (DB_GetModuleSettingByNUM(Module_JobCosting)>=2)
					
					OBJECT SET VISIBLE:C603(*; "oTimeUnitsLabel"; True:C214)
					OBJECT SET VISIBLE:C603(*; "oTimeUnitsFIeld"; True:C214)
					OBJECT SET COORDINATES:C1248(*; "oTimeUnitsLabel"; 2; $_l_NextObjectTop; $_l_LabelRight; $_l_NextObjectTop+$_l_LabelHeight)
					OBJECT SET COORDINATES:C1248(*; "oTimeUnitsFIeld"; $_l_AdesLeft; $_l_NextObjectTop; $_l_AdesLeft+100; $_l_NextObjectTop+14)
					If ([DIARY:12]Value:16>0)
						$_l_NextLeft:=($_l_AdesLeft+100)+5
						OBJECT SET VISIBLE:C603(*; "oValueLabel"; True:C214)
						OBJECT SET VISIBLE:C603(*; "oDiaryValueField"; True:C214)
						OBJECT SET COORDINATES:C1248(*; "oValueLabel"; $_l_NextLeft; $_l_NextObjectTop; $_l_NextLeft+$_l_LabelRight-2; $_l_NextObjectTop+$_l_LabelHeight)
						$_l_NextLeft:=$_l_NextLeft+$_l_LabelRight-2+5
						OBJECT SET COORDINATES:C1248(*; "oDiaryValueField"; $_l_NextLeft; $_l_NextObjectTop; $_l_NextLeft+100; $_l_NextObjectTop+14)
						
					Else 
						OBJECT SET VISIBLE:C603(*; "oValueLabel"; False:C215)
						OBJECT SET VISIBLE:C603(*; "oDiaryValueField"; False:C215)
						
					End if 
					$_l_NextObjectTop:=($_l_NextObjectTop+14)+10
					
				Else 
					OBJECT SET VISIBLE:C603(*; "oTimeUnitsLabel"; False:C215)
					OBJECT SET VISIBLE:C603(*; "oTimeUnitsFIeld"; False:C215)
					OBJECT SET VISIBLE:C603(*; "oValueLabel"; False:C215)
					OBJECT SET VISIBLE:C603(*; "oDiaryValueField"; False:C215)
					
					
					
				End if 
				If (DB_GetModuleSettingByNUM(Module_JobCosting)>=2)
					OBJECT SET VISIBLE:C603(*; "oJobStageLabel"; True:C214)
					OBJECT SET VISIBLE:C603(*; "oJobCodeField"; True:C214)
					OBJECT SET VISIBLE:C603(*; "oJobStageField"; True:C214)
					OBJECT SET VISIBLE:C603(*; "oJobStageName"; True:C214)
					OBJECT SET COORDINATES:C1248(*; "oJobStageLabel"; 2; $_l_NextObjectTop; $_l_LabelRight; $_l_NextObjectTop+$_l_LabelHeight)
					OBJECT SET COORDINATES:C1248(*; "oJobStageField"; $_l_AdesLeft; $_l_NextObjectTop; $_l_AdesLeft+100; $_l_NextObjectTop+14)
					OBJECT SET COORDINATES:C1248(*; "oJobStageField"; $_l_AdesLeft+100+5; $_l_NextObjectTop; $_l_AdesLeft+100+5+100; $_l_NextObjectTop+14)
					OBJECT SET COORDINATES:C1248(*; "oJobStageName"; ($_l_AdesLeft+100+5); $_l_NextObjectTop; $_l_AdesRight)
					$_l_NextObjectTop:=($_l_NextObjectTop+14)+10
					
				Else 
					OBJECT SET VISIBLE:C603(*; "oJobStageLabel"; False:C215)
					OBJECT SET VISIBLE:C603(*; "oJobCodeField"; False:C215)
					OBJECT SET VISIBLE:C603(*; "oJobStageField"; False:C215)
					OBJECT SET VISIBLE:C603(*; "oJobStageName"; False:C215)
					
					
				End if 
				If (DB_GetModuleSettingByNUM(Module_SalesOrders)>=2)
					OBJECT SET VISIBLE:C603(*; "oOrderCodeLabel"; True:C214)
					OBJECT SET VISIBLE:C603(*; "oOrderCodeField"; True:C214)
					OBJECT SET COORDINATES:C1248(*; "oOrderCodeLabel"; 2; $_l_NextObjectTop; $_l_LabelRight; $_l_NextObjectTop+$_l_LabelHeight)
					OBJECT SET COORDINATES:C1248(*; "oOrderCodeField"; $_l_AdesLeft; $_l_NextObjectTop; $_l_AdesLeft+100; $_l_NextObjectTop+14)
					$_l_NextObjectTop:=($_l_NextObjectTop+14)+10
				Else 
					OBJECT SET VISIBLE:C603(*; "oOrderCodeLabel"; False:C215)
					OBJECT SET VISIBLE:C603(*; "oOrderCodeField"; False:C215)
					
				End if 
				If (DB_GetModuleSettingByNUM(Module_Products)>=2)
					OBJECT SET VISIBLE:C603(*; "oProductCodeLabel"; True:C214)
					OBJECT SET VISIBLE:C603(*; "oProductCodeField"; True:C214)
					OBJECT SET VISIBLE:C603(*; "oProductName"; True:C214)
					OBJECT SET COORDINATES:C1248(*; "oProductCodeLabel"; 2; $_l_NextObjectTop; $_l_LabelRight; $_l_NextObjectTop+$_l_LabelHeight)
					OBJECT SET COORDINATES:C1248(*; "oProductCodeField"; $_l_AdesLeft; $_l_NextObjectTop; $_l_AdesLeft+100; $_l_NextObjectTop+14)
					OBJECT SET COORDINATES:C1248(*; "oProductName"; $_l_AdesLeft+100; $_l_NextObjectTop; $_l_AdesRight; $_l_NextObjectTop+14)
					
					$_l_NextObjectTop:=($_l_NextObjectTop+14)+10
				Else 
					OBJECT SET VISIBLE:C603(*; "oProductCodeLabel"; False:C215)
					OBJECT SET VISIBLE:C603(*; "oProductCodeField"; False:C215)
					OBJECT SET VISIBLE:C603(*; "oProductName"; False:C215)
				End if 
				If (DB_GetModuleSettingByNUM(Module_ServiceCentre)>=2)
					OBJECT SET VISIBLE:C603(*; "oServiceCodeLabel"; True:C214)
					OBJECT SET VISIBLE:C603(*; "oServiceCodeField"; True:C214)
					OBJECT SET COORDINATES:C1248(*; "oProductCodeLabel"; 2; $_l_NextObjectTop; $_l_LabelRight; $_l_NextObjectTop+$_l_LabelHeight)
					OBJECT SET COORDINATES:C1248(*; "oProductCodeField"; $_l_AdesLeft; $_l_NextObjectTop; $_l_AdesLeft+100; $_l_NextObjectTop+14)
					
				Else 
					OBJECT SET VISIBLE:C603(*; "oServiceCodeLabel"; False:C215)
					OBJECT SET VISIBLE:C603(*; "oServiceCodeField"; False:C215)
					
				End if 
				
				
				
				
				
			End if 
			If ($_l_NextObjectTop<($_l_buttonTop-50))
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				$_l_VertResize:=$_l_WindowBottom-($_l_NextObjectTop+40)
				//RESIZE FORM WINDOW(0;-$_l_VertResize)
			End if 
			
		End if 
		DB_SetInputFormMenu(Table:C252(->[DIARY:12]); WIN_t_CurrentInputForm)
		
	: ($_l_Event=On Outside Call:K2:11)
		Gen_OutsideCoCo(->[DIARY:12]Company_Code:1; ->[DIARY:12]Contact_Code:2)
		If ((<>OrderCode#"") & ([DIARY:12]Order_Code:26=""))
			[DIARY:12]Order_Code:26:=<>OrderCode
		End if 
		If ((<>JobCode#"") & ([DIARY:12]Job_Code:19=""))
			[DIARY:12]Job_Code:19:=<>JobCode
		End if 
		If ((<>CallCode#"") & ([DIARY:12]Call_Code:25=""))
			[DIARY:12]Call_Code:25:=<>CallCode
		End if 
		
		Diary_InLPM
		<>AutoProc:=0
	: ($_l_Event=On Deactivate:K2:10)
		// PAUSE PROCESS(vProc)
	: ($_l_Event=On Resize:K2:27)
		DIARY_in_SetObjectPositions
End case 
ERR_MethodTrackerReturn("Diary_InLP"; $_t_oldMethodName)