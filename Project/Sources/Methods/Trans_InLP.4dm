//%attributes = {}
If (False:C215)
	//Project Method Name:      Trans_InLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/10/2010 14:14
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(TRNS_ad_StamentDate;0)
	//ARRAY LONGINT(MOD_al_ModuleBarNum;0)
	//ARRAY LONGINT(MOD_al_ModuleBarOffsets;0)
	C_BOOLEAN:C305($_bo_Resibable; DB_bo_NoLoad; DB_bo_RecordModified; PAL_bo_ButtonSubFunction)
	C_LONGINT:C283($_l_AreaBottom; $_l_AreaHeight; $_l_ButtonNumber; $_l_ButtonsHeight; $_l_ButtonsTop; $_l_ButtonsWidth; $_l_Event; $_l_LastButtonBottom; $_l_LastButtonLeft; $_l_LastButtonRight; $_l_LastButtonTop)
	C_LONGINT:C283($_l_LastFieldBottom; $_l_LastFieldLeft; $_l_LastFieldRight; $_l_LastFieldTop; $_l_LBBottom; $_l_LBLeft; $_l_LBRight; $_l_LBTop; $_l_MaxHeight; $_l_MaxWidth; $_l_MinHeight)
	C_LONGINT:C283($_l_ModuleRow; $_l_mouseButton; $_l_Mousex; $_l_Mousy; $_l_NewWindowBottom; $_l_PotentialWindowBottom; $_l_WindowBottom; $_l_WIndowHeight; $_l_WindowLeft; $_l_WindowRIght; $_l_WIndowTop)
	C_LONGINT:C283(DB_l_ButtonClickedFunction; DB_l_WindowCurrentModule; iCancel; iOK; ModuleNumber; PAL_but_FirstRecord; PAL_but_LastRecord; PAL_but_NextRecord; PAL_but_PreviousRecord)
	C_REAL:C285($1)
	C_TEXT:C284($_t_oldMethodName; $_t_PalletButtonName; BAR_t_Button; DB_t_CUrrentInputMenuRef; DB_T_CurrentInputWindowMenu; PAL_BUTTON; vButtDisTRANS; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Trans_InLP"; Form event code:C388)
//lp trans in
If (Count parameters:C259=0)
	$_l_Event:=Form event code:C388
Else 
	$_l_Event:=$1
End if 

Case of 
	: ($_l_Event=On Header:K2:17) | ($_l_Event=On Resize:K2:27)
		//WS_AutoscreenSize (2;420;580)
		//GET MOUSE($_l_Mousex;$_l_Mousy;$_l_mouseButton)
		If (DB_l_ButtonClickedFunction=0)
			DB_l_ButtonClickedFunction:=-1024
			POST OUTSIDE CALL:C329(Current process:C322)
			
		End if 
		
		
		
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		DB_SetnewToolBar
		OpenHelp(Table:C252(->[TRANSACTIONS:29]); "Trans_in")
		WS_AutoscreenSize(3; 555; 580)
		Trans_InLPB
		INT_SetInput(Table:C252(->[TRANSACTIONS:29]); WIN_t_CurrentInputForm)
		
		SD2_SetDiaryPopup
		In_ButtChkDis(->vButtDisTRANS)
		DB_SetInputFormMenu(Table:C252(->[TRANSACTIONS:29]); "Trans_in")
		If (Records in selection:C76([TRANSACTIONS:29])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
	: ($_l_Event=On Activate:K2:9)
		DB_SetInputFormMenu(Table:C252(->[TRANSACTIONS:29]); "Trans_in")
		OpenHelp(Table:C252(->[TRANSACTIONS:29]); WIN_t_CurrentInputForm)
		In_ButtChkDis(->vButtDisTRANS)
		SD2_SetDiaryPopup
		If (Records in selection:C76([TRANSACTIONS:29])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
	: ($_l_Event=On Menu Selected:K2:14)
		DB_SetInputFormMenu(Table:C252(->[TRANSACTIONS:29]); "Trans_in")
		If (Records in selection:C76([TRANSACTIONS:29])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		
	: ((($_l_Event=On Outside Call:K2:11) & (DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
		Case of 
			: (DB_l_ButtonClickedFunction=-1024)  //resize windows
				DB_l_ButtonClickedFunction:=0
				GET MOUSE:C468($_l_Mousex; $_l_Mousy; $_l_mouseButton)
				If ($_l_mouseButton=0)
					GET WINDOW RECT:C443($_l_WindowLeft; $_l_WIndowTop; $_l_WindowRIght; $_l_WindowBottom)
					OBJECT GET COORDINATES:C663(*; "oSaveButton"; $_l_LastButtonLeft; $_l_LastButtonTop; $_l_LastButtonRight; $_l_LastButtonBottom)
					If (Size of array:C274(TRNS_ad_StamentDate)>0)
						$_l_AreaHeight:=Size of array:C274(TRNS_ad_StamentDate)*20
						$_l_PotentialWindowBottom:=$_l_LastButtonBottom+$_l_AreaHeight
						If ($_l_AreaHeight<40)
							$_l_AreaHeight:=40
						End if 
						If ($_l_PotentialWindowBottom>(Screen height:C188-50))
							$_l_AreaBottom:=((Screen height:C188-50)-($_l_LastButtonBottom-$_l_LastButtonTop)-5)
							If ($_l_AreaBottom<$_l_LastFieldBottom-40)  //need to have at least 40 for the area
								$_l_AreaHeight:=40
							End if 
						End if 
						$_l_NewWindowBottom:=$_l_LastFieldBottom+10+$_l_AreaHeight+($_l_LastButtonBottom-$_l_LastButtonTop)+10  //bottom of last field plus a space plus the listbox area and then space for the buttons
						If ($_l_WindowBottom<$_l_NewWindowBottom)
							$_l_WindowBottom:=$_l_NewWindowBottom
							SET WINDOW RECT:C444($_l_WindowLeft; $_l_WIndowTop; $_l_WindowRIght; $_l_WIndowTop+$_l_WindowBottom)
						End if 
						OBJECT GET COORDINATES:C663(*; "oBankReconcilled"; $_l_LBLeft; $_l_LBTop; $_l_LBRight; $_l_LBBottom)
						If (($_l_LastButtonTop-5)>($_l_LBTop+$_l_AreaHeight))
							$_l_AreaHeight:=($_l_LastButtonTop-5)-$_l_LBTop
						End if 
						
						OBJECT SET COORDINATES:C1248(*; "oBankReconcilled"; $_l_LBLeft; $_l_LBTop; $_l_LBRight; $_l_LBTop+$_l_AreaHeight)
						OBJECT GET COORDINATES:C663(*; "oBankReconcilled"; $_l_LastFieldLeft; $_l_LastFieldTop; $_l_LastFieldRight; $_l_LastFieldBottom)
					Else 
						OBJECT GET COORDINATES:C663(*; "oChequeNumberFIeld"; $_l_LastFieldLeft; $_l_LastFieldTop; $_l_LastFieldRight; $_l_LastFieldBottom)
						GET WINDOW RECT:C443($_l_WindowLeft; $_l_WIndowTop; $_l_WindowRIght; $_l_WindowBottom)
						FORM GET VERTICAL RESIZING:C1078($_bo_Resibable; $_l_MinHeight; $_l_MaxHeight)
						FORM SET VERTICAL RESIZING:C893($_bo_Resibable; $_l_WindowBottom-$_l_WIndowTop; $_l_WindowBottom-$_l_WIndowTop)
						
					End if 
					//TRACE
					INT_setButtonsPosition
					If (False:C215)
						GET WINDOW RECT:C443($_l_WindowLeft; $_l_WIndowTop; $_l_WindowRIght; $_l_WindowBottom)
						$_l_WIndowHeight:=$_l_WindowBottom-$_l_WIndowTop
						$_l_ButtonsHeight:=$_l_LastButtonBottom-$_l_LastButtonTop
						$_l_ButtonsTop:=($_l_WIndowHeight-5)-$_l_ButtonsHeight
						TRACE:C157
						OBJECT SET COORDINATES:C1248(*; "oSaveButton"; $_l_LastButtonLeft; $_l_ButtonsTop; $_l_LastButtonRight; $_l_ButtonsTop+$_l_ButtonsHeight)
						$_l_ButtonsWidth:=$_l_LastButtonRight-$_l_LastButtonLeft
						$_l_LastButtonRight:=$_l_LastButtonLeft-2
						$_l_LastButtonLeft:=$_l_LastButtonRight-$_l_ButtonsWidth
						OBJECT SET COORDINATES:C1248(*; "oCancelButton"; $_l_LastButtonLeft; $_l_ButtonsTop; $_l_LastButtonRight; $_l_ButtonsTop+$_l_ButtonsHeight)
						$_l_LastButtonRight:=$_l_LastButtonLeft-2
						$_l_LastButtonLeft:=$_l_LastButtonRight-$_l_ButtonsWidth
						OBJECT SET COORDINATES:C1248(*; "oMinusButton"; $_l_LastButtonLeft; $_l_ButtonsTop; $_l_LastButtonRight; $_l_ButtonsTop+$_l_ButtonsHeight)
						$_l_LastButtonRight:=$_l_LastButtonLeft-2
						$_l_LastButtonLeft:=$_l_LastButtonRight-$_l_ButtonsWidth
						OBJECT SET COORDINATES:C1248(*; "oPlusButton"; $_l_LastButtonLeft; $_l_ButtonsTop; $_l_LastButtonRight; $_l_ButtonsTop+$_l_ButtonsHeight)
						$_l_LastButtonRight:=$_l_LastButtonLeft-2
						$_l_LastButtonLeft:=$_l_LastButtonRight-$_l_ButtonsWidth
						OBJECT SET COORDINATES:C1248(*; "oReportButton"; $_l_LastButtonLeft; $_l_ButtonsTop; $_l_LastButtonRight; $_l_ButtonsTop+$_l_ButtonsHeight)
						$_l_LastButtonRight:=$_l_LastButtonLeft-2
						$_l_LastButtonLeft:=$_l_LastButtonRight-$_l_ButtonsWidth
						OBJECT SET COORDINATES:C1248(*; "oQualitiesButton"; $_l_LastButtonLeft; $_l_ButtonsTop; $_l_LastButtonRight; $_l_ButtonsTop+$_l_ButtonsHeight)
						$_l_LastButtonRight:=$_l_LastButtonLeft-2
						$_l_LastButtonLeft:=$_l_LastButtonRight-$_l_ButtonsWidth
						OBJECT SET COORDINATES:C1248(*; "oCompanyButton"; $_l_LastButtonLeft; $_l_ButtonsTop; $_l_LastButtonRight; $_l_ButtonsTop+$_l_ButtonsHeight)
						$_l_LastButtonRight:=$_l_LastButtonLeft-2
						$_l_LastButtonLeft:=$_l_LastButtonRight-$_l_ButtonsWidth
						OBJECT SET COORDINATES:C1248(*; "oContactsButton"; $_l_LastButtonLeft; $_l_ButtonsTop; $_l_LastButtonRight; $_l_ButtonsTop+$_l_ButtonsHeight)
						$_l_LastButtonRight:=$_l_LastButtonLeft-2
						$_l_LastButtonLeft:=$_l_LastButtonRight-$_l_ButtonsWidth
						OBJECT SET COORDINATES:C1248(*; "oProductsButton"; $_l_LastButtonLeft; $_l_ButtonsTop; $_l_LastButtonRight; $_l_ButtonsTop+$_l_ButtonsHeight)
						$_l_LastButtonRight:=$_l_LastButtonLeft-2
						$_l_LastButtonLeft:=$_l_LastButtonRight-$_l_ButtonsWidth
						OBJECT SET COORDINATES:C1248(*; "oTimeManagerButton"; $_l_LastButtonLeft; $_l_ButtonsTop; $_l_LastButtonRight; $_l_ButtonsTop+$_l_ButtonsHeight)
						$_l_LastButtonRight:=$_l_LastButtonLeft-2
						$_l_LastButtonLeft:=$_l_LastButtonRight-$_l_ButtonsWidth
					End if 
				End if 
				
				
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("FormWindows"))
				If (DB_t_CUrrentInputMenuRef#"") & (DB_T_CurrentInputWindowMenu#"")
					DB_T_CurrentInputWindowMenu:=DB_BuildWIndowsMenu(DB_T_CurrentInputWindowMenu)
					SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
				End if 
				DB_l_ButtonClickedFunction:=0
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Subfunction"))
				DB_l_ButtonClickedFunction:=0
				DB_SubFunctionHandler
			Else 
				In_ButtCall(""; ""; ""; ->[TRANSACTIONS:29]; ->[TRANSACTIONS:29]Transaction_Type_Code:1; "Transactions"; "1"; "Trans_InLPB"; "Master"; "Trans_Sel"; ""; ->[IDENTIFIERS:16]; ->vButtDisTRANS)
		End case 
		
	: ($_l_Event=On Data Change:K2:15)
		If (Modified:C32([TRANSACTIONS:29]Reconciled:14))
			DB_bo_RecordModified:=True:C214
			Macro_AccTypePt(->[TRANSACTIONS:29]Reconciled:14)
		End if 
	: ($_l_Event=On Clicked:K2:4)
		Case of 
			: (BAR_t_Button#"")
				$_l_ButtonNumber:=Num:C11(BAR_t_Button)
				If ($_l_ButtonNumber>1)
					ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_ButtonNumber-1}
					$_l_ModuleRow:=Find in array:C230(MOD_al_ModuleBarNum; ModuleNumber)
					DB_SetBrowserBarSelection($_l_ModuleRow; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
					DB_SetInputFormMenu(Table:C252(->[TRANSACTIONS:29]); "Trans_in")
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
ERR_MethodTrackerReturn("Trans_InLP"; $_t_oldMethodName)
