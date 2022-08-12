//%attributes = {}
If (False:C215)
	//Project Method Name: Companies_InLP
	//------------------ Method Notes ------------------
	//------------------ Revision Control ----------------
	//Date Created: 08/08/2010 17:02
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(COM_LB_FurtherAnalysis;0)
	//ARRAY BOOLEAN(GEN_lb_ItemsArea;0)
	//ARRAY LONGINT(CO_al_ViewTableToTable;0)
	//ARRAY LONGINT(CO_al_ViewTabsSettings;0)
	//ARRAY LONGINT(CO_al_ViewTabsStates;0)
	//ARRAY LONGINT(COM_al_CompanyTabPage;0)
	//ARRAY LONGINT(COM_al_EditMode;0)
	//ARRAY LONGINT(MOD_al_ModuleBarNum;0)
	//ARRAY LONGINT(MOD_al_ModuleBarOffsets;0)
	//ARRAY LONGINT(SD_al_RecordSelection;0)
	//ARRAY POINTER(COM_aptr_LBItemsSetup;0)
	//ARRAY POINTER(QUAL_aptr_Information;0)
	//ARRAY TEXT(CO_at_ViewTabsFormName;0)
	//ARRAY TEXT(CO_at_ViewTabsFormSettings;0)
	//ARRAY TEXT(CO_at_ViewTabsLabels;0)
	//ARRAY TEXT(COM_at_CompanyTab;0)
	//ARRAY TEXT(COM_at_EditMode;0)
	//ARRAY TEXT(COm_at_TabNames;0)
	C_BOOLEAN:C305(CO_bo_ChangePage; CO_bo_ChangeTab; COM_bo_AddingFurther; COM_bo_DiaryEntered; DB_bo_NoLoad; DB_bo_ViewsOption; PAL_bo_ButtonSubFunction; vFromIn)
	C_LONGINT:C283($_l_BestHeight; $_l_BestWidth; $_l_ButtonNumber; $_l_CallledFromProcess; $_l_CharacterPosition; $_l_CountCharacters; $_l_CurrentFormPage; $_l_Event; $_l_FirstButtonRight; $_l_Index; $_l_ModuleRow)
	C_LONGINT:C283($_l_NewProcess; $_l_Size; $_l_Value; $_l_WInBottom; $_l_WIndowWIdth; $_l_WInLeft; $_l_WinRight; $_l_WinTOp; $m2; COM_l_Callback; DB_l_ButtonClickedFunction)
	C_LONGINT:C283(DB_l_WindowCurrentModule; iCancel; iOK; ModuleNumber; PAL_but_FirstRecord; PAL_but_LastRecord; PAL_but_NextRecord; PAL_but_PreviousRecord; SD2_l_CallingProcess; SD2_l_TableNum; vAccessSwNo)
	C_PICTURE:C286(COM_Pi_EditMode)
	C_POINTER:C301($_ptr_ArrayReferences; $_ptr_ListboxSetup; $_ptr_Table)
	C_TEXT:C284($_t_CharacterString; $_t_CurrentTabTitle; $_t_DummyTab; $_t_oldMethodName; $_t_PalletButtonName; $_t_ReferencedTabTitle; $_t_SubItemName; $_t_Value; BAR_t_Button; COM_t_AddressLine2; COM_t_COntext)
	C_TEXT:C284(COM_t_FalseTab; DB_t_Address1Label; DB_t_Address2Label; DB_t_CountryLabel; DB_t_CountyLabel; DB_t_CUrrentInputMenuRef; DB_T_CurrentInputWindowMenu; DB_t_DiaryCode; DB_t_PostcodeLabel; DB_t_TownLabel; IP_t_MessageReplySTR)
	C_TEXT:C284(IP_t_MessageReplyTXT; PAL_BUTTON; SD2_t_TabFunction; vButtDisCom; WIN_t_CurrentInputForm; WS_S1; WS_S2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Companies_InLP")
//Companies_InLP
$_l_Event:=Form event code:C388

Case of 
	: ($_l_Event=On Resize:K2:27)
		
		
		
		
		LBI_Scrollonresize(->GEN_lb_ItemsArea)
		LBI_Scrollonresize(->COM_LB_FurtherAnalysis)
		INT_SetInput(Table:C252(->[COMPANIES:2]); WIN_t_CurrentInputForm)
		
	: ($_l_Event=On Header:K2:17)  // ($_l_Event=On Resize )
		
		
		
		
		// WS_AutoscreenSize (2;375;553)
		
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[COMPANIES:2]); "Company_In")
		ARRAY TEXT:C222(CO_at_ViewTabsLabels; 0)
		ARRAY LONGINT:C221(CO_al_ViewTabsSettings; 0)
		ARRAY LONGINT:C221(CO_al_ViewTabsStates; 0)
		ARRAY TEXT:C222(CO_at_ViewTabsFormName; 0)
		ARRAY TEXT:C222(CO_at_ViewTabsFormSettings; 0)
		ARRAY LONGINT:C221(CO_al_ViewTableToTable; 0)
		
		WS_AutoscreenSize(1; 375; 800; Table name:C256(->[COMPANIES:2])+"_"+WIN_t_CurrentInputForm)
		
		WS_S1:="vat*"
		WS_S2:="*FIELD1"
		COM_bo_DiaryEntered:=False:C215
		ARRAY TEXT:C222(COM_at_CompanyTab; 3)
		ARRAY LONGINT:C221(COM_al_CompanyTabPage; 3)
		OBJECT SET FONT STYLE:C166(COM_at_CompanyTab; 1)
		OBJECT SET FONT SIZE:C165(COM_at_CompanyTab; 10)
		COM_al_CompanyTabPage{1}:=1
		COM_al_CompanyTabPage{2}:=2
		COM_al_CompanyTabPage{3}:=3
		COM_at_CompanyTab{1}:=" Address"
		COM_at_CompanyTab{2}:="Analysis"
		COM_at_CompanyTab{3}:="Financial"
		COM_at_CompanyTab:=1
		ARRAY TEXT:C222(COM_at_EditMode; 0)
		ARRAY LONGINT:C221(COM_al_EditMode; 0)
		LBi_SetListBoxOptions(->COM_at_EditMode; ->COM_al_EditMode; ->COM_Pi_EditMode; True:C214)
		
		
		//   vBefore2C:=True  `have to be unique variables for main files cos otherwise ru
		//    Gen_PostKey (1;92;256)  ` background window!
		//: (vBefore2C)
		//  vBefore2C:=False
		Companies_InLPß("B")
		SD2_SetDiaryPopup(->CO_al_ViewTableToTable; ->CO_at_ViewTabsLabels; ->COm_at_TabNames)
		//INT_SetInput(Table(->[COMPANIES]); WIN_t_CurrentInputForm)
		
		
		$_l_CountCharacters:=0
		$_t_CharacterString:=""
		For ($_l_Size; 1; Size of array:C274(CO_at_ViewTabsLabels))
			$_t_CharacterString:=$_t_CharacterString+(" "*6)+CO_at_ViewTabsLabels{$_l_Size}+(" "*6)
		End for 
		$_t_Value:=COM_t_AddressLine2
		COM_t_AddressLine2:=$_t_CharacterString
		OBJECT GET BEST SIZE:C717(COM_t_AddressLine2; $_l_BestWidth; $_l_BestHeight)
		//OBJECT GET BEST SIZE
		COM_t_AddressLine2:=$_t_Value
		TRACE:C157
		GET WINDOW RECT:C443($_l_WInLeft; $_l_WinTOp; $_l_WinRight; $_l_WInBottom)
		$_l_WIndowWIdth:=$_l_WinRight-$_l_WInLeft
		If ($_l_WIndowWIdth<$_l_BestWidth)
			SET WINDOW RECT:C444($_l_WInLeft; $_l_WinTOp; $_l_WInLeft+$_l_BestWidth; $_l_WInBottom)
			
		End if 
		If (Size of array:C274(CO_at_ViewTabsLabels)>0)
			If (CO_at_ViewTabsLabels=0)
				CO_at_ViewTabsLabels:=1
			End if 
			$_t_CurrentTabTitle:=CO_at_ViewTabsLabels{CO_at_ViewTabsLabels}
			Repeat 
				If ($_t_CurrentTabTitle[[1]]=" ")
					$_t_CurrentTabTitle:=Substring:C12($_t_CurrentTabTitle; 2)
				End if 
			Until ($_t_CurrentTabTitle[[1]]#" ")
			$_l_CharacterPosition:=Position:C15("("; $_t_CurrentTabTitle)
			If ($_l_CharacterPosition>0)
				$_t_CurrentTabTitle:=Substring:C12($_t_CurrentTabTitle; 1; $_l_CharacterPosition-1)
			End if 
		Else 
			$_t_CurrentTabTitle:=""
		End if 
		DB_SetInputFormMenu(Table:C252(->[COMPANIES:2]); "Company_In"; $_t_CurrentTabTitle)
		If ($_t_CurrentTabTitle#"")
			DB_MenuAction("View"; $_t_CurrentTabTitle; 4; "18"; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		If (Records in selection:C76([COMPANIES:2])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		If (Size of array:C274(COM_at_CompanyTab)>0)
			$_t_CurrentTabTitle:=COM_at_CompanyTab{COM_at_CompanyTab}
			If ($_t_CurrentTabTitle#"")
				Repeat 
					If ($_t_CurrentTabTitle[[1]]=" ")
						$_t_CurrentTabTitle:=Substring:C12($_t_CurrentTabTitle; 2)
					End if 
				Until ($_t_CurrentTabTitle[[1]]#" ")
				For ($_l_Index; 1; Size of array:C274(COM_at_CompanyTab))
					If (COM_at_CompanyTab#$_l_Index)
						$_t_ReferencedTabTitle:=COM_at_CompanyTab{$_l_Index}
						Repeat 
							If ($_t_ReferencedTabTitle[[1]]=" ")
								$_t_ReferencedTabTitle:=Substring:C12($_t_ReferencedTabTitle; 2)
							End if 
						Until ($_t_ReferencedTabTitle[[1]]#" ")
						DB_MenuAction("View"; $_t_ReferencedTabTitle; 4; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
					End if 
				End for 
				DB_MenuAction("View"; $_t_CurrentTabTitle; 4; "18"; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			End if 
		End if 
		If (DB_bo_ViewsOption)
			DB_MenuAction("View"; "Open Views In New Window"; 4; "18"; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		Else 
			DB_MenuAction("View"; "Open Views In New Window"; 4; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		If (COM_t_COntext="Workflow")
			GET PROCESS VARIABLE:C371(COM_l_Callback; DB_t_DiaryCode; DB_t_DiaryCode)
			If (DB_t_DiaryCode#"")
				$_l_NewProcess:=New process:C317("WF_LaunchCompanionWindow"; 128000; "Call Companion"; Current process:C322; DB_t_DiaryCode)
				
			End if 
			
			
		End if 
		//INT_SetInput(Table(->[COMPANIES]); WIN_t_CurrentInputForm)
		//$_l_FirstButtonRight:=INT_setButtonsPosition
		POST OUTSIDE CALL:C329(Current process:C322)
	: (($_l_Event=On Activate:K2:9) | (vFromIn))
		
		
		
		
		If (Size of array:C274(CO_at_ViewTabsLabels)>0)
			If (CO_at_ViewTabsLabels=0)
				CO_at_ViewTabsLabels:=1
			End if 
			$_t_CurrentTabTitle:=CO_at_ViewTabsLabels{CO_at_ViewTabsLabels}
			Repeat 
				If ($_t_CurrentTabTitle[[1]]=" ")
					$_t_CurrentTabTitle:=Substring:C12($_t_CurrentTabTitle; 2)
				End if 
			Until ($_t_CurrentTabTitle[[1]]#" ")
			$_l_CharacterPosition:=Position:C15("("; $_t_CurrentTabTitle)
			If ($_l_CharacterPosition>0)
				$_t_CurrentTabTitle:=Substring:C12($_t_CurrentTabTitle; 1; $_l_CharacterPosition-1)
			End if 
		Else 
			$_t_CurrentTabTitle:=""
		End if 
		DB_SetInputFormMenu(Table:C252(->[COMPANIES:2]); "Company_In"; $_t_CurrentTabTitle)
		If ($_t_CurrentTabTitle#"")
			DB_MenuAction("View"; $_t_CurrentTabTitle; 4; "18"; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		
		OpenHelp(Table:C252(->[COMPANIES:2]); "Company_In")
		SD2_SetDiaryPopup(->CO_al_ViewTableToTable; ->CO_at_ViewTabsLabels; ->COm_at_TabNames)
		
		If (vAccessSwNo=-1)
			vAccessSwNo:=0
		Else 
			vFromIn:=After:C31
		End if 
		$_ptr_ListboxSetup:=->COM_aptr_LBItemsSetup
		If (Size of array:C274($_ptr_ListboxSetup->)>=9)
			$_ptr_ArrayReferences:=$_ptr_ListboxSetup->{9}
			If (Size of array:C274($_ptr_ArrayReferences->)>10)
				$_t_SubItemName:=$_ptr_ArrayReferences->{10}
				Case of 
					: (FORM Get current page:C276=1)
						
						If (CO_al_ViewTableToTable{CO_at_ViewTabsLabels}=Table:C252(->[CUSTOM_FIELDS:98]))
							
							In_ButtChkDis(->vButtDisCom; "Company")
						Else 
							If (CO_al_ViewTableToTable{CO_at_ViewTabsLabels}=Table:C252(->[CONTACTS:1])) | (CO_al_ViewTableToTable{CO_at_ViewTabsLabels}=Table:C252(->[DIARY:12]))
								In_ButtChkDis(->vButtDisCom; "Company"; $_t_SubItemName)
							Else 
								In_ButtChkDis(->vButtDisCom; "Company")
							End if 
						End if 
						
					: (FORM Get current page:C276=2)
						In_ButtChkDis(->vButtDisCom; "Company"; "Further Analysis")
					: (FORM Get current page:C276=5)
						In_ButtChkDis(->vButtDisCom; "Contact"; "Further Analysis")
					Else 
						In_ButtChkDis(->vButtDisCom; "Company")
				End case 
			End if 
		Else 
			In_ButtChkDis(->vButtDisCom)
			
		End if 
		If (Records in selection:C76([COMPANIES:2])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		If (DB_bo_ViewsOption)
			DB_MenuAction("View"; "Open Views In New Window"; 4; "18"; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		Else 
			DB_MenuAction("View"; "Open Views In New Window"; 4; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		INT_SetInput(Table:C252(->[COMPANIES:2]); WIN_t_CurrentInputForm)
		
		
	: ($_l_Event=On Outside Call:K2:11)
		//Gen_Alert ("Outside Call")
		
		
		
		
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
				
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Plus")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Minus")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Open"))
				
				//$Press:=DB L_ButtonClickedFunction
				inButtSubHandle(FORM Get current page:C276; ->[COMPANIES:2])
				
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Get Company Name"))
				IP_t_MessageReplySTR:=[COMPANIES:2]Company_Name:2
				DB_l_ButtonClickedFunction:=0
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Get Address"))
				IP_t_MessageReplyTXT:=[COMPANIES:2]ADDRESS:60
				DB_l_ButtonClickedFunction:=0
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Enter Related Diary"))
				//Contextual enter to diary
				// This should behave as if the user had clicked on that tab and then went +
				DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Plus")
				COM_t_FalseTab:=SD2_t_TabFunction
				SD2_t_TabFunction:=""
				inButtSubHandle(FORM Get current page:C276; ->[COMPANIES:2])
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("View Related Diary"))
				ARRAY LONGINT:C221(SD_al_RecordSelection; 0)
				
				//Here we must select the records and put them in a longint array then pass them back to the calling process
				If (SD2_l_CallingProcess>0)
					$_l_CallledFromProcess:=SD2_l_CallingProcess
					SD2_l_CallingProcess:=0
					$_t_DummyTab:=SD2_t_TabFunction
					$_l_CharacterPosition:=Position:C15("View "; $_t_DummyTab)
					If ($_l_CharacterPosition>0)
						$_t_DummyTab:=Substring:C12($_t_DummyTab; $_l_CharacterPosition+Length:C16("View "); Length:C16($_t_DummyTab))
					End if 
					SD2_t_TabFunction:=""
					CREATE SET:C116([DIARY:12]; "COMcurrentDiary")  //Just to make sure we keep the selection
					
					
					
					
					COM_SelectDiaryRecords($_t_DummyTab)
					LONGINT ARRAY FROM SELECTION:C647([DIARY:12]; SD_al_RecordSelection)
					VARIABLE TO VARIABLE:C635($_l_CallledFromProcess; SD_al_RecordSelection; SD_al_RecordSelection)
					SD2_l_TableNum:=2
					SET PROCESS VARIABLE:C370($_l_CallledFromProcess; SD2_l_TableNum; SD2_l_TableNum)
					
					ARRAY LONGINT:C221(SD_al_RecordSelection; 0)
					
				End if 
				DB_l_ButtonClickedFunction:=0
			: (((DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
				$_l_CurrentFormPage:=FORM Get current page:C276
				Case of 
					: ($_l_CurrentFormPage=1)
						$_ptr_Table:=->[CONTACTS:1]
						$_ptr_ListboxSetup:=->COM_aptr_LBItemsSetup
					: (($_l_CurrentFormPage=2) | ($_l_CurrentFormPage=3))
						$_ptr_Table:=->[IDENTIFIERS:16]
						$_ptr_ListboxSetup:=->COM_aptr_LBItemsSetup
						If (COM_bo_AddingFurther)
							SAVE RECORD:C53([COMPANIES_RECORD_ANALYSIS:146])
							COM_bo_AddingFurther:=False:C215
						End if 
						
						
						
						
						
					: ($_l_CurrentFormPage=4)  //This is not used
						$_ptr_Table:=->[INFORMATION:55]
						$_ptr_ListboxSetup:=->QUAL_aptr_Information
				End case 
				If (COM_bo_AddingFurther)
					DB_SaveRecord(->[COMPANIES_RECORD_ANALYSIS:146])
					COM_bo_AddingFurther:=False:C215
				End if 
				In_ButtCall("P:Companies_InLPA:C:Companies_InCan"; ""; "Companies_InDel"; ->[COMPANIES:2]; ->[COMPANIES:2]Company_Code:1; "Companies"; "1"; "Companies_InLPß"; "CMaster"; "Comp_Sel"; "Companies_InTel"; $_ptr_Table; ->vButtDisCom; $_ptr_ListboxSetup; True:C214)
				
				DB_l_ButtonClickedFunction:=0
		End case 
		//DB_l_ButtonClickedFunction:=0
		
	: ($_l_Event=On Data Change:K2:15) | ($_l_Event=On Clicked:K2:4) | ($_l_Event=On Menu Selected:K2:14) | ($_l_Event=On Plug in Area:K2:16)
		
		
		
		
		
		Case of 
			: (CO_bo_ChangeTab=True:C214)
				DB_CompanyViewsTab
				CO_bo_ChangeTab:=False:C215
				
				
			: (BAR_t_Button#"")
				//Gen_Alert ("Bar Button Call"+BAR_t_Button)
				
				$_l_ButtonNumber:=Num:C11(BAR_t_Button)
				If ($_l_ButtonNumber>1)
					ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_ButtonNumber-1}
					$_l_ModuleRow:=Find in array:C230(MOD_al_ModuleBarNum; ModuleNumber)
					DB_SetBrowserBarSelection($_l_ModuleRow; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
					If (Size of array:C274(CO_at_ViewTabsLabels)>0)
						If (CO_at_ViewTabsLabels=0)
							CO_at_ViewTabsLabels:=1
						End if 
						$_t_CurrentTabTitle:=CO_at_ViewTabsLabels{CO_at_ViewTabsLabels}
						Repeat 
							If ($_t_CurrentTabTitle[[1]]=" ")
								$_t_CurrentTabTitle:=Substring:C12($_t_CurrentTabTitle; 2)
							End if 
						Until ($_t_CurrentTabTitle[[1]]#" ")
						$_l_CharacterPosition:=Position:C15("("; $_t_CurrentTabTitle)
						If ($_l_CharacterPosition>0)
							$_t_CurrentTabTitle:=Substring:C12($_t_CurrentTabTitle; 1; $_l_CharacterPosition-1)
						End if 
					Else 
						$_t_CurrentTabTitle:=""
					End if 
					DB_SetInputFormMenu(Table:C252(->[COMPANIES:2]); "Company_In"; $_t_CurrentTabTitle)
					If ($_t_CurrentTabTitle#"")
						DB_MenuAction("View"; $_t_CurrentTabTitle; 4; "18"; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
					End if 
					
				End if 
				BAR_t_Button:=""
			: (PAL_BUTTON#"")
				//Gen_Alert ("Bar Button Call"+PAL_BUTTON)
				
				$_t_PalletButtonName:=PAL_BUTTON
				PAL_BUTTON:=""
				DB_HandleInputFormButtons($_t_PalletButtonName)
				PAL_bo_ButtonSubFunction:=False:C215
			Else 
				Companies_InLPD
				If ($_l_Event=On Menu Selected:K2:14)
					
					
					
					
					If (Size of array:C274(CO_at_ViewTabsLabels)>0)
						If (CO_at_ViewTabsLabels=0)
							CO_at_ViewTabsLabels:=1
						End if 
						$_t_CurrentTabTitle:=CO_at_ViewTabsLabels{CO_at_ViewTabsLabels}
						Repeat 
							If ($_t_CurrentTabTitle[[1]]=" ")
								$_t_CurrentTabTitle:=Substring:C12($_t_CurrentTabTitle; 2)
							End if 
						Until ($_t_CurrentTabTitle[[1]]#" ")
						$_l_CharacterPosition:=Position:C15("("; $_t_CurrentTabTitle)
						If ($_l_CharacterPosition>0)
							$_t_CurrentTabTitle:=Substring:C12($_t_CurrentTabTitle; 1; $_l_CharacterPosition-1)
						End if 
					Else 
						$_t_CurrentTabTitle:=""
					End if 
					DB_SetInputFormMenu(Table:C252(->[COMPANIES:2]); "Company_In"; $_t_CurrentTabTitle)
					If ($_t_CurrentTabTitle#"")
						DB_MenuAction("View"; $_t_CurrentTabTitle; 4; "18"; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
					End if 
					
					OpenHelp(Table:C252(->[COMPANIES:2]); "Company_In")
					SD2_SetDiaryPopup(->CO_al_ViewTableToTable; ->CO_at_ViewTabsLabels; ->COm_at_TabNames)
					
					If (vAccessSwNo=-1)
						vAccessSwNo:=0
					Else 
						vFromIn:=After:C31
					End if 
					If (Size of array:C274(COM_aptr_LBItemsSetup)>=9)
						$_ptr_ArrayReferences:=COM_aptr_LBItemsSetup{9}
						If (Size of array:C274($_ptr_ArrayReferences->)>10)
							$_t_SubItemName:=$_ptr_ArrayReferences->{10}
							Case of 
								: (FORM Get current page:C276=1)
									
									If (CO_al_ViewTableToTable{CO_at_ViewTabsLabels}=Table:C252(->[CUSTOM_FIELDS:98]))
										
										In_ButtChkDis(->vButtDisCom; "Company")
									Else 
										If (CO_al_ViewTableToTable{CO_at_ViewTabsLabels}=Table:C252(->[CONTACTS:1])) | (CO_al_ViewTableToTable{CO_at_ViewTabsLabels}=Table:C252(->[DIARY:12]))
											In_ButtChkDis(->vButtDisCom; "Company"; $_t_SubItemName)
										Else 
											In_ButtChkDis(->vButtDisCom; "Company")
										End if 
									End if 
									
								: (FORM Get current page:C276=2)
									In_ButtChkDis(->vButtDisCom; "Company"; "Further Analysis")
								: (FORM Get current page:C276=5)
									In_ButtChkDis(->vButtDisCom; "Contact"; "Further Analysis")
								Else 
									In_ButtChkDis(->vButtDisCom; "Company")
							End case 
						End if 
					Else 
						In_ButtChkDis(->vButtDisCom)
						
					End if 
					If (Records in selection:C76([COMPANIES:2])<=1)
						OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
						OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
						OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
						OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
						DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
						DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
					End if 
					If (DB_bo_ViewsOption)
						DB_MenuAction("View"; "Open Views In New Window"; 4; "18"; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
					Else 
						DB_MenuAction("View"; "Open Views In New Window"; 4; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
					End if 
					
				End if 
		End case 
		
	: ($_l_Event=On Deactivate:K2:10)
		
		
		
		
		//PAUSE PROCESS(vProc)
End case 
ERR_MethodTrackerReturn("Companies_InLP"; $_t_oldMethodName)
