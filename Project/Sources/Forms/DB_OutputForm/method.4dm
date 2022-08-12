//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(DB_lb_OutputArrays;0)
	//ARRAY BOOLEAN(DB_lb_Setsandselections;0)
	//ARRAY BOOLEAN(PRD_abo_Expanded;0)
	//ARRAY LONGINT(<>LB_al_FormTables;0)
	ARRAY LONGINT:C221($_al_SetClassID; 0)
	//ARRAY LONGINT(DB_al_ContextAccess;0)
	//ARRAY LONGINT(DB_al_ContextTableNumber;0)
	//ARRAY LONGINT(DB_al_SetID;0)
	//ARRAY LONGINT(DB_al_TabNavigation;0)
	//ARRAY LONGINT(MOD_al_ModuleBarNum;0)
	//ARRAY LONGINT(MOD_al_ModuleBarOffsets;0)
	//ARRAY LONGINT(PRD_al_ProductID;0)
	//ARRAY PICTURE(PRD_aPic_Expanded;0)
	//ARRAY POINTER(DB_apo_ContextPointers;0)
	//ARRAY POINTER(DB_aptr_ContextPointers;0)
	ARRAY REAL:C219($_ar_ReconciledValue; 0)
	ARRAY REAL:C219($_ar_TotalAccValue; 0)
	ARRAY REAL:C219($_ar_unreconciled; 0)
	//ARRAY TEXT(<>DB_at_LBViews;0)
	ARRAY TEXT:C222($_at_PersonInitials; 0)
	ARRAY TEXT:C222($_at_ProductCodes; 0)
	ARRAY TEXT:C222($_at_SetClass; 0)
	ARRAY TEXT:C222($_at_ViewedACCCodes; 0)
	ARRAY TEXT:C222($_at_ViewedCurCodes; 0)
	//ARRAY TEXT(DB_at_ConfigureOptions;0)
	//ARRAY TEXT(DB_at_ContextNames;0)
	//ARRAY TEXT(DB_at_ContextUsage;0)
	//ARRAY TEXT(DB_at_ExistingColumnButtons;0)
	//ARRAY TEXT(DB_at_MethodParameters;0)
	//ARRAY TEXT(DB_at_SetMethod;0)
	//ARRAY TEXT(DB_at_SetName;0)
	//ARRAY TEXT(DB_at_TabContext;0)
	//ARRAY TEXT(DB_at_TabNavigation;0)
	//ARRAY TEXT(PRD_at_STKHistoryName;0)
	//ARRAY TEXT(PRD_at_STKHistoryProducts;0)
	//ARRAY TEXT(SRCH_at_SearchOptions;0)
	C_BOOLEAN:C305(<>PER_bo_LbDefinitiionsInited; <>PER_bo_SystemSettingAccess; $_bo_NoScrollSet; DB_bo_AutorelationsTemp; DB_bo_BatchedRecordEntry; DB_bo_ButtonCall; DB_bo_Display; DB_bo_DisplayFilters; DB_bo_DisplaySelections; DB_bo_DisplayStats; DB_bo_FiltersActivated)
	C_BOOLEAN:C305(DB_bo_FiltersAvailable; DB_bo_FiltersTouched; DB_bo_HideModuleBar; DB_bo_InRecordListing; DB_bo_NoCacheReset; DB_bo_NoLoad; DB_bo_RecordsinNewProcess; DB_bo_RefreshScreen; DB_bo_ReturnSelection; DB_bo_SelectionsAvailable; DB_bo_ShowArrayBased)
	C_BOOLEAN:C305(DB_bo_ShowTabBar; DB_bo_SubWindowsOpen; Lay_bo_UpdateFilters)
	C_LONGINT:C283(<>ButtProc; <>NoStart; <>PER_l_CurrentUserID; <>SCPT_l_PaletteWIndow; $_l_AddMode; $_l_AreaWidth; $_l_BarProcess; $_l_BestHeight; $_l_BestWidth; $_l_buttonBottom; $_l_buttonLeft)
	C_LONGINT:C283($_l_ButtonNumber; $_l_buttonRight; $_l_buttonTop; $_l_CanceLeft; $_l_CBBottom; $_l_CBLeft; $_l_CBRight; $_l_CBTop; $_l_ClassRow; $_l_CountPersons; $_l_CurrentButtonNumber)
	C_LONGINT:C283($_l_CurrentDefsFormID; $_l_CurrentDisplayedForm; $_l_CurrentLevel; $_l_DropDownLeft; $_l_FieldNumber; $_l_FormEvent; $_l_GapBottom; $_l_GapLeft; $_l_gapRight; $_l_gapTop; $_l_Index)
	C_LONGINT:C283($_l_ItemReference; $_l_LeftPosition; $_l_ListingBottom; $_l_ListingLeft; $_l_ListingRight; $_l_ListingTop; $_l_ListItemParent; $_l_MaxButtons; $_l_ModuleRow; $_l_MouseButton; $_l_Mousex)
	C_LONGINT:C283($_l_Mousey; $_l_NarrowButtonCount; $_l_NarrowButtonWidth; $_l_Number; $_l_ObjectBottom; $_l_ObjectBottom2; $_l_ObjectLeft; $_l_ObjectLeft2; $_l_ObjectRight; $_l_ObjectRight2; $_l_ObjectTop)
	C_LONGINT:C283($_l_ObjectTop2; $_l_OldTable; $_l_Row; $_l_SearchLeft; $_l_SetsCount; $_l_SMShowScripts; $_l_SMSMonitorCall; $_l_TableNumber; $_l_Width; $_l_WindowBottom; $_l_WindowLeft)
	C_LONGINT:C283($_l_WindowRIght; $_l_WindowTop; $_l_WindowWidth; BarMod; DB_but_ClearFiltersButton; DB_l_ButtonClickedFunction; DB_l_CurrentDisplayedForm; DB_l_LBOutputForm; DB_l_MyTempMacro; DB_l_Navigatetoselected; DB_l_ReturnSelectionTable)
	C_LONGINT:C283(DB_l_TurnOnFilters; DB_l_UserFormAccess; DB_l_ViewType; DB_l_WindowCurrentModule; LAY_l_CurrentDefsFormID; LAY_l_CurrentDefsTable; MOD_l_CurrentModuleAccess; ModuleNumber; PAL_but_PreviousRecord; PAL_BUTTON_1; PAL_BUTTON_11)
	C_LONGINT:C283(PAL_BUTTON_13; PAL_BUTTON_14; PAL_BUTTON_15; PAL_BUTTON_18; PAL_BUTTON_2; PAL_BUTTON_286; PAL_BUTTON_287; PAL_BUTTON_288; PAL_BUTTON_289; PAL_BUTTON_290; PAL_BUTTON_3)
	C_LONGINT:C283(PAL_BUTTON_4; PAL_BUTTON_45; SM_l_ContextItemID; SM_l_MonitorCall; SM_l_ShowScripts; vAdd; vNo)
	C_OBJECT:C1216($_obj_LayoutConfirm; $_obj_WindowPrefs)
	C_PICTURE:C286($_pic_ExpandCollapse)
	C_POINTER:C301($_ptr_ArrayReferences; $_Ptr_CUrrentTable; $_ptr_FocusObject; $_ptr_FormReferences; $_ptr_ListboxArea; $_ptr_ListboxSetup; $_ptr_ReferencesArray; $_Ptr_SelectedTable; $_ptr_Table)
	C_REAL:C285(DB_l_newSetClass; SRCH_r_Timer; SRCH_r_TimerOLD)
	C_TEXT:C284($_t_ButtonName; $_t_ClickedFunction; $_t_CloseSaveMethod; $_t_CurrentContext; $_t_CurrentDefinitionsName; $_t_FormName; $_t_FormReferenceName; $_t_LayoutReference; $_t_MoveObjectName; $_t_NewSetName; $_t_OldMethodName)
	C_TEXT:C284($_t_ScriptCode; $_t_ScriptName; $_t_SearchValue; $_t_UserDefsName; $_t_VariableName; BAR_t_Button; DB_t_ButtonClickedFunction; DB_t_CallOnCloseorSave; DB_t_ClickedObjectName; DB_t_CurrentContext; DB_t_CurrentFormUsage)
	C_TEXT:C284(DB_t_CUrrentMenuReference; DB_T_CurrentWindowMenu; DB_t_FormUsage; DB_t_WindowFormPreference; LAY_t_CurrentDefsName; LAY_t_CurrentUserDefs; PAL_BUTTON; SD2_t_SearchCriteria; SD2_T_SearchValue; SRCH_t_SearchValue; SRCH_t_SearchValueOLD)
End if 
//Code Starts Here


$_t_OldMethodName:=ERR_MethodTracker("FM DB_OutputForm"; Form event code:C388)
$_l_FormEvent:=Form event code:C388
Case of 
		
		
		
	: ($_l_FormEvent=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		SET AUTOMATIC RELATIONS:C310(False:C215; False:C215)
		
		OBJECT SET VISIBLE:C603(*; "oFiltersActiveText"; False:C215)
		OBJECT SET ENABLED:C1123(*; "oClearFilters"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oFiltersMessage"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oLBReconcileMessage"; False:C215)
		ARRAY TEXT:C222(DB_at_ConfigureOptions; 0)
		ARRAY TEXT:C222(SRCH_at_SearchOptions; 0)
		
		DB_bo_FiltersTouched:=False:C215
		DB_bo_AutorelationsTemp:=False:C215
		DB_t_ClickedObjectName:=""
		
		If (DB_l_WindowCurrentModule>0)
			BarMod:=DB_l_WindowCurrentModule
			ModuleNumber:=BarMod
		End if 
		$_obj_WindowPrefs:=New object:C1471
		$_obj_WindowPrefs:=DB_GetWindowPrefs
		DB_SetnewToolBar
		DB_bo_NoCacheReset:=DB_BeforeFormLoad
		If (Not:C34(DB_bo_NoCacheReset))
			ARRAY POINTER:C280(DB_aptr_ContextPointers; 0)
			ARRAY TEXT:C222(DB_at_ContextNames; 0)
			ARRAY LONGINT:C221(DB_al_ContextTableNumber; 0)
			ARRAY TEXT:C222(DB_at_ContextUsage; 0)
			ARRAY LONGINT:C221(DB_al_ContextAccess; 0)
		End if 
		If (DB_l_ViewType=0)
			DB_l_ViewType:=1
		End if 
		
		If (Not:C34(DB_bo_FiltersAvailable))
			DB_bo_DisplayFilters:=False:C215
			OBJECT SET VISIBLE:C603(*; "oFiltersActiveText"; False:C215)
			OBJECT SET ENABLED:C1123(*; "oClearFilters"; False:C215)
		End if 
		DB_bo_InRecordListing:=True:C214
		If (DB_l_CurrentDisplayedForm=0)
			DB_l_CurrentDisplayedForm:=Table:C252(->[COMPANIES:2])
			DB_t_CurrentContext:=""
		End if 
		
		
		ARRAY TEXT:C222(DB_at_TabNavigation; 0)
		ARRAY LONGINT:C221(DB_al_TabNavigation; 0)
		ARRAY TEXT:C222(DB_at_TabContext; 0)
		DB_t_FormUsage:=DB_t_CurrentFormUsage
		DB_l_UserFormAccess:=MOD_l_CurrentModuleAccess  //note that the value may change as we go through tabs so we need to store the settings
		DB_SetFormTabs(DB_l_CurrentDisplayedForm; DB_t_CurrentContext; ->DB_at_TabNavigation; ->DB_al_TabNavigation; ->DB_at_TabContext)
		
		DB_SetFormLayout(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		//DB_SetFormHeaderButtons (DB_bo_ShowArrayBased)
		
		
		//ALERT("Stage 3")
		DB_SetFormmenu(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		DB_SetFormCache(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		
		//at this point we size the form based on the current selection. on tabbing we change the size to the width of the new form
		//ALERT("Stage 4")  //`but we only grow the height of the form on a selection change do not shrink it
		If (DB_bo_ShowArrayBased)
			DB_SetFormSize(DB_l_CurrentDisplayedForm; ->DB_lb_OutputArrays; 90; 60; DB_bo_DisplayFilters)
		Else 
			DB_SetFormSize(DB_l_CurrentDisplayedForm; ->DB_l_LBOutputForm; 90; 60; DB_bo_DisplayFilters)
		End if 
		
		
		
		DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		
		DB_SetFormMenuoptions
		//ALERT("Stage 8")
		DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		//ALERT("Stage 9")
		
		DB_HideShowSearch(DB_l_CurrentDisplayedForm)
		If (Is macOS:C1572)
			OBJECT GET COORDINATES:C663(*; "oSearchvalue"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			OBJECT GET COORDINATES:C663(*; "oSRCH_t_Prompt"; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
			OBJECT GET BEST SIZE:C717(*; "oSRCH_t_Prompt"; $_l_BestWidth; $_l_BestHeight)
			OBJECT MOVE:C664(*; "oSRCH_t_Prompt"; ($_l_ObjectLeft-10)-($_l_BestWidth+10); $_l_ObjectTop2; ($_l_ObjectLeft-10); $_l_ObjectBottom2; *)
		Else 
			OBJECT GET COORDINATES:C663(*; "oSearchvalue"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			OBJECT GET COORDINATES:C663(*; "oSRCH_t_Prompt"; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
			OBJECT GET BEST SIZE:C717(*; "oSRCH_t_Prompt"; $_l_BestWidth; $_l_BestHeight)
			OBJECT MOVE:C664(*; "oSRCH_t_Prompt"; ($_l_ObjectLeft-10)-($_l_BestWidth+10); $_l_ObjectTop2; ($_l_ObjectLeft-10); $_l_ObjectBottom2; *)
			
		End if 
		If (Not:C34(DB_bo_ShowTabBar)) | (Size of array:C274(DB_at_TabNavigation)=0)
			
			OBJECT SET VISIBLE:C603(*; "oNavigator"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oNavigateOption"; False:C215)
			OBJECT GET COORDINATES:C663(*; "oListboxOutputForm"; $_l_ListingLeft; $_l_ListingTop; $_l_ListingRight; $_l_ListingBottom)
			OBJECT SET COORDINATES:C1248(*; "oBackground"; $_l_ListingLeft; $_l_ListingTop-2; $_l_ListingRight; $_l_ListingBottom)
			OBJECT SET COORDINATES:C1248(*; "oInSheenTurquoise"; $_l_ListingLeft; $_l_ListingTop-2; $_l_ListingRight; $_l_ListingBottom)
			OBJECT SET COORDINATES:C1248(*; "oInSheenBlue"; $_l_ListingLeft; $_l_ListingTop-2; $_l_ListingRight; $_l_ListingBottom)
			OBJECT GET COORDINATES:C663(*; "oStrapHeader1"; $_l_GapLeft; $_l_gapTop; $_l_gapRight; $_l_GapBottom)
			//-<<OBJECT SET COORDINATES(*; "oStrapHeader@"; $_l_GapLeft; $_l_gapTop; $_l_gapRight; $_l_ListingTop-2)
			
		End if 
		//ALERT("Stage 10")
		DB_SetWindowTitle(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		GOTO OBJECT:C206(*; "oSearchvalue")
		
		If (DB_bo_ShowArrayBased)
			LBI_UpdateFooters(->DB_lb_OutputArrays; 0)
			LBI_Scrollonresize(->DB_lb_OutputArrays)
		Else 
			LBI_UpdateFooters(->DB_l_LBOutputForm; 3; DB_l_CurrentDisplayedForm)
			LBI_Scrollonresize(->DB_l_LBOutputForm)
		End if 
		CREATE EMPTY SET:C140(Table:C252(DB_l_CurrentDisplayedForm)->; "◊TempSet")
		SearchPicker SET HELP TEXT("oSearchvalue"; SD2_t_SearchCriteria)
		
	: ($_l_FormEvent=On Resize:K2:27)
		GET MOUSE:C468($_l_Mousex; $_l_Mousey; $_l_MouseButton)
		
		If ($_l_MouseButton=0)  //| (True)
			
			
			
			If (DB_bo_AutorelationsTemp)  //this is turned on if the user clicks to sort on a column in a different table
				
				
				
				
				DB_bo_AutorelationsTemp:=False:C215
				SET AUTOMATIC RELATIONS:C310(False:C215; False:C215)
			End if 
			If (Not:C34(DB_bo_HideModuleBar))
				//here the tool bar buttons that are blank need to be hidden and the position of the righ most button set. they seem to resize incorrectly
				$_l_MaxButtons:=Size of array:C274(MOD_al_ModuleBarOffsets)
				$_l_NarrowButtonCount:=0
				$_l_CurrentButtonNumber:=1
				$_l_LeftPosition:=121
				$_l_NarrowButtonWidth:=45
				For ($_l_Index; 1; $_l_MaxButtons)
					$_l_NarrowButtonCount:=$_l_NarrowButtonCount+1
					$_t_MoveObjectName:="oBarButton"+String:C10($_l_Index+$_l_CurrentButtonNumber)
					OBJECT MOVE:C664(*; $_t_MoveObjectName; $_l_LeftPosition; 1; $_l_LeftPosition+$_l_NarrowButtonWidth; 33; *)
					$_l_LeftPosition:=$_l_LeftPosition+$_l_NarrowButtonWidth
				End for 
			End if 
			
			DB_HideShowSearch(DB_l_CurrentDisplayedForm)
			
			If (DB_bo_ShowArrayBased)
				LBI_Scrollonresize(->DB_lb_OutputArrays)
				
			Else 
				LBI_Scrollonresize(->DB_l_LBOutputForm)
				
			End if 
			If ($_l_MouseButton=0)
				If (DB_bo_ShowArrayBased)
					DB_SetFormSize(DB_l_CurrentDisplayedForm; ->DB_lb_OutputArrays; 90; 60; DB_bo_DisplayFilters)
				Else 
					DB_SetFormSize(DB_l_CurrentDisplayedForm; ->DB_l_LBOutputForm; 90; 60; DB_bo_DisplayFilters)
				End if 
				DB_UpdateScreenInfo(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
			End if 
		End if 
	: ($_l_FormEvent=On Deactivate:K2:10)
		
		
		//here we may need to show the tool bar buttons
	: ($_l_FormEvent=On Activate:K2:9)
		
		
		If (DB_bo_AutorelationsTemp)  //this is turned on if the user clicks to sort on a column in a different table
			
			
			DB_bo_AutorelationsTemp:=False:C215
			SET AUTOMATIC RELATIONS:C310(False:C215; False:C215)
		End if 
		If (DB_bo_SubWindowsOpen=False:C215)
			DB_SetFormmenu(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
			DB_SetFormMenuoptions
			DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		End if 
		$_l_BarProcess:=Get_ProcessNumber("Modules_Palette")
		If ($_l_BarProcess>0)
			HIDE PROCESS:C324($_l_BarProcess)
		End if 
		If (<>ButtProc>0)
			HIDE PROCESS:C324(<>ButtProc)
		End if 
		If (<>SCPT_l_PaletteWIndow>0)
			While (Semaphore:C143("SCPT_TalkingToPalette"))
				DelayTicks(2)
			End while 
			SET PROCESS VARIABLE:C370(<>SCPT_l_PaletteWIndow; SCPT_l_ParentProcess; Current process:C322)
			SET PROCESS VARIABLE:C370(<>SCPT_l_PaletteWIndow; DB_l_CURRENTDISPLAYEDFORM; DB_l_CURRENTDISPLAYEDFORM)
			POST OUTSIDE CALL:C329(<>SCPT_l_PaletteWIndow)
			CLEAR SEMAPHORE:C144("SCPT_TalkingToPalette")
		End if 
		
		
	: ($_l_FormEvent=On Clicked:K2:4) | ($_l_FormEvent=On Data Change:K2:15)
		If (DB_bo_AutorelationsTemp)  //this is turned on if the user clicks to sort on a column in a different table
			
			
			
			
			DB_bo_AutorelationsTemp:=False:C215
			SET AUTOMATIC RELATIONS:C310(False:C215; False:C215)
		End if 
		$_bo_NoScrollSet:=False:C215
		
		PAL_BUTTON:=""
		PAL_BUTTON:=""
		Case of 
			: (BAR_t_Button#"")
				
				$_l_CurrentButtonNumber:=Num:C11(BAR_t_Button)
				If ($_l_CurrentButtonNumber>1)
					ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_CurrentButtonNumber-1}
					$_l_ModuleRow:=Find in array:C230(MOD_al_ModuleBarNum; ModuleNumber)
					
					DB_SetBrowserBarSelection($_l_ModuleRow; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
					DB_SetFormmenu(DB_l_CurrentDisplayedForm; DB_t_CurrentContext; True:C214)
					DB_SetFormMenuoptions
					DB_UpdateScreenInfo(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
				End if 
				BAR_t_Button:=""
			: (PAL_BUTTON_288=1)  //Next selection
				
				
				PAL_BUTTON_288:=0
				SEL_NextRecordsSelection
				DB_UpdateScreenInfo(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
			: (PAL_BUTTON_287=1)  //Previous selection
				
				
				PAL_but_PreviousRecord:=0
				SEL_PrevRecordsSelection
				DB_UpdateScreenInfo(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
			: (PAL_BUTTON_286=1)  //First selection
				
				
				PAL_BUTTON_286:=0
				SEL_PrevRecordsSelection(1)
				DB_UpdateScreenInfo(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
			: (PAL_BUTTON_289=1)  //Previous selection
				
				
				PAL_BUTTON_289:=0
				SEL_NextRecordsSelection(99999)
				DB_UpdateScreenInfo(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
			: (PAL_BUTTON_290=1)  //ReSET_MENU
				DB_SetFormmenu(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
				DB_SetFormMenuoptions
				DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
				DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
				$_l_BarProcess:=Get_ProcessNumber("Modules_Palette")
				If ($_l_BarProcess>0)
					HIDE PROCESS:C324($_l_BarProcess)
				End if 
				If (<>ButtProc>0)
					HIDE PROCESS:C324(<>ButtProc)
				End if 
				PAL_BUTTON_290:=0
				BRING TO FRONT:C326(Current process:C322)
			: (PAL_BUTTON_2=1)  //accept
				
				
				PAL_BUTTON_2:=0
				If (DB_bo_DisplaySelections)
					$_l_SetsCount:=Size of array:C274(DB_at_SetName)
					If (DB_al_SetID{$_l_SetsCount}=999999)  //new Record not saved
						
						
						Case of 
							: (DB_at_SetName{$_l_SetsCount}="New Set")
								$_t_NewSetName:=Gen_Request("Enter Name for new set"; "New Set")
								If (OK=1)
									DB_at_SetName{$_l_SetsCount}:=$_t_NewSetName
								End if 
							: (DB_at_SetName{$_l_SetsCount}="New Group")
								$_t_NewSetName:=Gen_Request("Enter Name for the new Group"; "New Group")
								If (OK=1)
									DB_at_SetName{$_l_SetsCount}:=$_t_NewSetName
								End if 
						End case 
						ARRAY TEXT:C222($_at_SetClass; 4)
						ARRAY LONGINT:C221($_al_SetClassID; 4)
						$_at_SetClass{1}:="Fixed List"
						$_at_SetClass{2}:="Dynamic List"
						$_at_SetClass{3}:="Fixed List with Dynamic Query"
						$_at_SetClass{4}:="Group"
						$_al_SetClassID{1}:=853
						$_al_SetClassID{2}:=854
						$_al_SetClassID{3}:=852
						$_al_SetClassID{4}:=855
						$_l_ListItemParent:=10000+DB_l_CurrentDisplayedForm
						$_l_ItemReference:=-(AA_GetNextIDinMethod(->SM_l_ContextItemID))
						DB_al_SetID{$_l_SetsCount}:=$_l_ItemReference
						DB_at_SetMethod{$_l_SetsCount}:="DB_SelectSet"
						DB_at_MethodParameters{$_l_SetsCount}:=String:C10($_l_ItemReference)
						$_l_ClassRow:=Find in array:C230($_al_SetClassID; DB_l_newSetClass)
						If (DB_l_newSetClass=0)
							DB_l_newSetClass:=853
						End if 
						SM_UpdateArrays("PER"; DB_at_SetName{$_l_SetsCount}; $_l_ItemReference; $_l_ListItemParent; ""; 0; $_at_SetClass{$_l_ClassRow}; $_al_SetClassID{$_l_ClassRow})
						Case of 
							: (DB_l_newSetClass=853)
								SM_saveSet("DB_NewSet"; $_l_ItemReference)
							: (DB_l_newSetClass=852) | (DB_l_newSetClass=854)
								If (DB_l_MyTempMacro=0)
									DB_l_MyTempMacro:=AA_GetNextID(->DB_l_MyTempMacro)
								End if 
								$_t_ScriptCode:=String:C10(DB_l_MyTempMacro; "######")
								$_t_ScriptName:="Data Query "+"Temp"
								READ WRITE:C146([SCRIPTS:80])
								QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1=$_t_ScriptCode)
								If (Records in selection:C76([SCRIPTS:80])=1)
									[SCRIPTS:80]Script_Code:1:=String:C10(DB_al_SetID{$_l_SetsCount})
									[SCRIPTS:80]Script_Name:2:="Data Query "+DB_at_SetName{$_l_SetsCount}
									DB_SaveRecord(->[SCRIPTS:80])
									
								End if 
						End case 
						//the above saves the data to the arrays. now save the arrays.
						//START TRANSACTION
						SM_UPDATEDATA
						LB_SetEnterable(->DB_lb_Setsandselections; False:C215; 0)
						
					End if 
					//if seleciton mananger displayed make sure we save sets changes.
				End if 
				
				//Here if we are in a transaction we can vailidate the transacton
				If (DB_bo_ReturnSelection)
					If (DB_l_CurrentDisplayedForm=DB_l_ReturnSelectionTable)
						$_Ptr_CUrrentTable:=Table:C252(DB_l_CurrentDisplayedForm)
						CREATE SET:C116($_Ptr_CUrrentTable->; "$Temp")
						If (Records in set:C195("ListboxSet0")>0)
							USE SET:C118("ListboxSet0")
							$_Ptr_SelectedTable:=Table:C252(DB_l_ReturnSelectionTable)
							COPY NAMED SELECTION:C331($_Ptr_SelectedTable->; "ReturnedSelection")
						Else 
							Gen_Confirm("Select All records?"; "Yes"; "No")
							If (OK=0)
								REDUCE SELECTION:C351($_Ptr_CUrrentTable->; 0)
							End if 
							$_Ptr_SelectedTable:=Table:C252(DB_l_ReturnSelectionTable)
							COPY NAMED SELECTION:C331($_Ptr_SelectedTable->; "ReturnedSelection")
						End if 
					End if 
				End if 
				If (In transaction:C397)
					Case of 
						: (DB_l_CurrentDisplayedForm=Table:C252(->[CONTACTS:1]))
							
							
							Case of 
								: ($_t_CurrentContext="Deduplicate")
									Gen_Confirm("Do you want to save any changes to the Duplicate State and Comments fields"+", and to confirm any deletions made?"; "Yes"; "No")
									Transact_End
							End case 
							
							
					End case 
				End if 
				$_t_FormReferenceName:="Output_"+String:C10(DB_l_CurrentDisplayedForm)+"_"+DB_t_CurrentContext
				INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_FormReferenceName)
				//FSetting_UpdateArray (WIN_t_CurrentOutputform;FS_l_SortDirection;FS_l_SortFieldNUM;FS_l_SortTableNUM;FS_t_SortVariableName;FS_t_SortFieldTXT;WT_t_SortFieldVARNAME)
				ACCEPT:C269
				PAL_BUTTON_2:=0
			: (PAL_BUTTON_1=1)
				PAL_BUTTON:=""
				//Hdere if we are in a transaction we cancel the transaction
				//FSetting_UpdateArray (WIN_t_CurrentOutputform;FS_l_SortDirection;FS_l_SortFieldNUM;FS_l_SortTableNUM;FS_t_SortVariableName;FS_t_SortFieldTXT;WT_t_SortFieldVARNAME)
				If (DB_bo_ReturnSelection)
					If (DB_l_CurrentDisplayedForm=DB_l_ReturnSelectionTable)
						$_Ptr_CUrrentTable:=Table:C252(DB_l_CurrentDisplayedForm)
						REDUCE SELECTION:C351($_Ptr_CUrrentTable->; 0)
						$_Ptr_SelectedTable:=Table:C252(DB_l_ReturnSelectionTable)
						COPY NAMED SELECTION:C331($_Ptr_SelectedTable->; "ReturnedSelection")
						
					End if 
				End if 
				
				CANCEL:C270
				PAL_BUTTON_1:=0
			: (PAL_BUTTON_4=1)
				PAL_BUTTON_4:=0
				PAL_BUTTON:=""
				//TRACE
				If (DB_bo_ShowArrayBased)
					Case of 
						: (DB_l_CurrentDisplayedForm=Table:C252(->[ACCOUNTS:32]))
							Gen_Confirm("Add New Account, or Account heading?"; "Account"; "Heading")
							$_t_SearchValue:=SRCH_t_SearchValue
							If (OK=0)
								$_l_CurrentDisplayedForm:=DB_l_CurrentDisplayedForm
								DB_l_CurrentDisplayedForm:=Table:C252(->[HEADINGS:84])
								DB_EnterNewRecord
								DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
								DB_l_CurrentDisplayedForm:=$_l_CurrentDisplayedForm
								//add a heading
								//now must refresh the arrays
							Else 
								//add an Account
								DB_EnterNewRecord
								DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
								
							End if 
							If ($_t_SearchValue#"")
								SRCH_StandardSearch(DB_l_CurrentDisplayedForm; SRCH_t_SearchValue; DB_t_CurrentContext)
							Else 
								ALL RECORDS:C47([ACCOUNTS:32])
							End if 
							$_Ptr_CurrentTable:=Table:C252(DB_l_CurrentDisplayedForm)
							
							If (Records in selection:C76($_Ptr_CurrentTable->)>0)
								SEL_UpdateRecordCache(DB_l_CurrentDisplayedForm)
							End if 
							Case of 
								: (DB_l_CurrentDisplayedForm=Table:C252(->[ACCOUNT_BALANCES:34]))
									If (DB_bo_ShowArrayBased)
										$_l_CurrentLevel:=LAY_LOADACCOUNTBALANCESARRAYS
									End if 
								: (DB_l_CurrentDisplayedForm=Table:C252(->[ACCOUNTS:32]))
									If (DB_bo_ShowArrayBased)
										LAY_LoadAccountsArrays(False:C215)
									End if 
								: (DB_l_CurrentDisplayedForm=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
									If (DB_bo_ShowArrayBased)
										DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]Product_Code:1; $_at_ProductCodes)
										QUERY WITH ARRAY:C644([PRODUCTS:9]Product_Code:1; $_at_ProductCodes)
										ARRAY BOOLEAN:C223(PRD_abo_Expanded; 0)
										SELECTION TO ARRAY:C260([PRODUCTS:9]Product_Code:1; PRD_at_STKHistoryProducts; [PRODUCTS:9]Product_Name:2; PRD_at_STKHistoryName; [PRODUCTS:9]X_ID:43; PRD_al_ProductID)
										ARRAY BOOLEAN:C223(PRD_abo_Expanded; Size of array:C274(PRD_at_STKHistoryProducts))
										//be careful when changing selection to respect the expanded status of items
										ARRAY PICTURE:C279(PRD_aPic_Expanded; 0)
										ARRAY PICTURE:C279(PRD_aPic_Expanded; Size of array:C274(PRD_at_STKHistoryProducts))
										//GET PICTURE FROM LIBRARY(403; $_pic_ExpandCollapse)  //410 for expanded
										$_pic_ExpandCollapse:=Get_Picture(403)
										
										For ($_l_Index; 1; Size of array:C274(PRD_aPic_Expanded))
											PRD_aPic_Expanded{$_l_Index}:=$_pic_ExpandCollapse
										End for 
									End if 
							End case 
							$_ptr_Table:=Table:C252(DB_l_CurrentDisplayedForm)
							SRCH_Applyfilterstoselection($_ptr_Table)
							DB_SetFormMenuoptions
							DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
							DB_SetWindowTitle(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)  //
							
							
							If (DB_bo_DisplayStats)
								//stats are displayed
								StatsView_Cal1
								StatsView_Cal2
							End if 
							OK:=1
					End case 
					
					
				Else 
					
					If (Count parameters:C259>=2)
						//There is a name for the context
						$_l_ModuleRow:=Find in array:C230(DB_at_ContextNames; DB_t_CurrentContext)
					Else 
						$_l_ModuleRow:=Find in array:C230(DB_al_ContextTableNumber; DB_l_CurrentDisplayedForm)
						
						//just use the table number-only one context
					End if 
					If ($_l_ModuleRow>0)
						$_ptr_ListboxSetup:=DB_aptr_ContextPointers{$_l_ModuleRow}
						//from this array we get the refs
						$_ptr_ReferencesArray:=$_ptr_ListboxSetup->{9}
						//the form name is in element 5
						$_t_FormName:=$_ptr_ReferencesArray->{5}
						//$Function:=DB_FormtoFunction ($_t_FormName)
						//now not needed because all data entry is via
						DB_EnterNewRecord
						DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
						
						
						//$_l_AddMode:=Vadd
						<>NoStart:=1  //NG March 2004 this was causing a prob
						
						
						//EXECUTE FORMULA($Function)
						//Cache_Update
						//vNo:=Records in selection($1->)
						//vAdd:=$_l_AddMode
						
						
						
						
						//add record. Here check the setting for edit in window. this will determine if we create a new process for the entry
						//here we look up the form to use for data entry from the array.
						
					End if 
					
				End if 
			: (PAL_BUTTON_3=1)  //delete
				
				
				PAL_BUTTON_3:=0
				DB_DeleteFromSelection
				DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
				PAL_BUTTON_3:=0
				If (DB_bo_DisplayStats)
					//stats are displayed
					StatsView_Cal1
					StatsView_Cal2
				End if 
			: (PAL_BUTTON_13=1)  //sort
				
				
				
				PAL_BUTTON_13:=0
				DB_SortrecordsFromSelection
				
				
			: (PAL_BUTTON_18=1)  //calc
				
				
				PAL_BUTTON_18:=0
				DB_CountrecordsFromSelection
			: (PAL_BUTTON_14=1)  //show/hide selection manager
				
				
				PAL_BUTTON_14:=0
				DB_SetselectionManager
			: (PAL_BUTTON_15=1)  //create repor
				
				
				PAL_BUTTON_15:=0
				DB_CreateReport
				//DB_SetFormmenu (DB_l_CurrentDisplayedForm;DB_t_CurrentContext)
				If (False:C215)  //DB_SetFormMenuoptions
					DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
					DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
					$_l_BarProcess:=Get_ProcessNumber("Modules_Palette")
					If ($_l_BarProcess>0)
						HIDE PROCESS:C324($_l_BarProcess)
					End if 
					If (<>ButtProc>0)
						HIDE PROCESS:C324(<>ButtProc)
					End if 
					DB_SetFormmenu(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
				End if 
				DB_bo_ButtonCall:=True:C214
				PAL_BUTTON_290:=1
				POST OUTSIDE CALL:C329(Current process:C322)
			: (PAL_BUTTON_11=1)
				PAL_BUTTON_11:=0
				//show subselection
				
				//Co_SelectrecordsFromSelection
				DB_SelectrecordsFromSelection
				$_bo_NoScrollSet:=True:C214
				
				DB_UpdateScreenInfo(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
			: (PAL_BUTTON_45=1)  //edit columns
				
				
				
				PAL_BUTTON_45:=0
				$_l_ModuleRow:=Find in array:C230(DB_al_ContextTableNumber; DB_l_CurrentDisplayedForm)
				If ($_l_ModuleRow>0)  //it shoud be!
					
					
					$_ptr_ListboxSetup:=DB_aptr_ContextPointers{$_l_ModuleRow}
					$_t_CurrentDefinitionsName:=""
					//edit the listbox area settings
					If ((<>PER_bo_SystemSettingAccess) & (<>PER_bo_LbDefinitiionsInited))
						//LBi_DelBckgrdElem ($_ptr_ListboxSetup)  `deletes elements from the Interproc arrays
						//LBi_pRefs4upd ($1)  `update the records to reflect changes to the arrays
						$_ptr_ListboxArea:=$_ptr_ListboxSetup->{1}
						$_ptr_ArrayReferences:=$_ptr_ListboxSetup->{9}
						$_t_CurrentDefinitionsName:=$_ptr_ArrayReferences->{6}
						//$Lay2:=DB_t_CurrentFormUsage2
						//$Lay3:=DB_t_CurrentFormUsage3
						$_l_AddMode:=vAdd
						$_l_Number:=vNo
						$_t_CurrentDefinitionsName:=$_ptr_ArrayReferences->{6}
						$_t_UserDefsName:=$_ptr_ArrayReferences->{7}
						LAY_l_CurrentDefsTable:=DB_l_CurrentDisplayedForm
						LAY_t_CurrentUserDefs:=$_ptr_ArrayReferences->{7}
						LAY_t_CurrentDefsName:=$_ptr_ArrayReferences->{6}
						$_l_CurrentDefsFormID:=Num:C11(Substring:C12($_t_CurrentDefinitionsName; 4))
						LAY_l_CurrentDefsFormID:=$_l_CurrentDefsFormID
						$_t_FormName:=LBI_GetLayoutName($_t_CurrentDefinitionsName)
						DB_t_WindowFormPreference:="Output_"+String:C10(DB_l_CurrentDisplayedForm)+"_"+DB_t_CurrentContext
						
						If ($_t_FormName="")
							LB_CheckLayouts(LAY_l_CurrentDefsTable)
							//TRACE
							$_l_Row:=Find in array:C230(<>LB_al_FormTables; LAY_l_CurrentDefsTable)
							If ($_l_Row>0)
								If ($_l_CurrentDefsFormID<=Size of array:C274(<>DB_at_LBViews{$_l_Row}))
									$_t_FormName:=<>DB_at_LBViews{$_l_Row}{$_l_CurrentDefsFormID}
								Else 
									$_t_FormName:=$_ptr_ArrayReferences->{9}
									//$_t_FormName:="??"
								End if 
							Else 
								$_t_FormName:="??"
							End if 
						End if 
						
						$_t_CloseSaveMethod:=DB_t_CallOnCloseorSave
						DB_t_CallOnCloseorSave:="DClose"
						Open_Pro_Window("Definitions for "+$_t_FormName; 0; 1; ->[LIST_LAYOUTS:96]; "Layouts_Out")
						//$_obj_LayoutConfirm:=FORM Convert to dynamic("LAYOUT_CONFIG")
						
						
						DIALOG:C40("LAYOUT_CONFIG")
						Close_ProWin
						If ($_t_UserDefsName="")
							Gen_Confirm("You have been editing the Default Listing Layout Definitions.  "+"You might therefore like to Delete all Personal Definitions"+" (ie those with Personnel Initials)"+" in order that they will revert to the Default."; "Keep them"; "Delete them")
							If (OK=0)
								Gen_Confirm("Are you sure you want to Delete the Personal Definitions?"; "No"; "Yes")
								If (OK=0)
									ALL RECORDS:C47([PERSONNEL:11])
									SELECTION TO ARRAY:C260([PERSONNEL:11]Initials:1; $_at_PersonInitials)
									$_l_CountPersons:=Size of array:C274($_at_PersonInitials)
									For ($_l_Index; 1; $_l_CountPersons)
										$_t_LayoutReference:=$_t_CurrentDefinitionsName+$_at_PersonInitials{$_l_Index}
										QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1=$_t_LayoutReference)
										DELETE SELECTION:C66([LIST_LAYOUTS:96])
									End for 
								End if 
							End if 
						End if 
						DB_t_CallOnCloseorSave:=$_t_CloseSaveMethod
						//LBi_EditListUpd ($_ptr_ListboxSetup)
						//TRACE
						
						DB_OutputUpdateColumns(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
						UNLOAD RECORD:C212([LIST_LAYOUTS:96])
						
						//vAdd:=$_l_AddMode
						//DB_t_CurrentFormUsage2:=$Lay2
						//DB_t_CurrentFormUsage3:=$Lay3
						//vNo:=$_l_Number
						//$ALMode:=0
						
						
					Else 
						
					End if 
				End if 
			: (DB_t_ClickedObjectName#"")
				Case of 
					: (DB_t_ClickedObjectName="DB_at_TabNavigation")
						//TRACE
						$_l_OldTable:=DB_l_CurrentDisplayedForm
						DB_l_CurrentDisplayedForm:=DB_al_TabNavigation{DB_at_TabNavigation}
						If (DB_at_TabContext{DB_at_TabNavigation}#"")
							DB_t_CurrentContext:=DB_at_TabContext{DB_at_TabNavigation}
						End if 
						//DB_l_Navigatetoselected:=1
						
						DB_SetFormTabs(DB_l_CurrentDisplayedForm; DB_t_CurrentContext; ->DB_at_TabNavigation; ->DB_al_TabNavigation; ->DB_at_TabContext)
						DB_SetFormLayout(DB_l_CurrentDisplayedForm; DB_t_CurrentContext; $_l_OldTable)
						DB_SetFormmenu(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
						//at this point we size the form based on the current selection. on tabbing we change the size to the width of the new form
						//`but we only grow the height of the form on a selection change do not shrink it
						If (DB_bo_ShowArrayBased)
							DB_SetFormSize(DB_l_CurrentDisplayedForm; ->DB_lb_OutputArrays; 90; 60; DB_bo_DisplayFilters)
						Else 
							DB_SetFormSize(DB_l_CurrentDisplayedForm; ->DB_l_LBOutputForm; 90; 60; DB_bo_DisplayFilters)
						End if 
						
						
						DB_SetFormCache(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
						DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
						DB_SetFormMenuoptions
						DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
						DB_HideShowSearch(DB_l_CurrentDisplayedForm)
						GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRIght; $_l_WindowBottom)
						$_l_WindowWidth:=$_l_WindowRIght-$_l_WindowLeft
						OBJECT GET COORDINATES:C663(DB_l_Navigatetoselected; $_l_CBLeft; $_l_CBTop; $_l_CBRight; $_l_CBBottom)
						OBJECT GET COORDINATES:C663(*; "oSearchvalue"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
						$_l_AreaWidth:=$_l_ObjectRight-$_l_ObjectLeft
						OBJECT MOVE:C664(*; "oSearchvalue"; ($_l_WindowWidth-10)-$_l_AreaWidth; $_l_ObjectTop; $_l_WindowWidth-10; $_l_ObjectBottom; *)
						//OBJECT MOVE(*;"oFocusRing";($_l_WindowWidth-10)-$_l_AreaWidth;$_l_ObjectTop;$_l_WindowWidth-10;$_l_ObjectBottom;*)
						//drop down 12 in and 23 wid
						$_l_DropDownLeft:=(($_l_WindowWidth-10)-$_l_AreaWidth)+12
						$_l_SearchLeft:=(($_l_WindowWidth-10)-$_l_AreaWidth)+38
						$_l_CanceLeft:=(($_l_WindowWidth-10)-$_l_AreaWidth)+(462-269)
						If (Is macOS:C1572)
							//OBJECT MOVE(*;"oSearchCriteriaButton";$_l_DropDownLeft;$_l_ObjectTop+8;$_l_DropDownLeft+23;$_l_ObjectBottom-5;*)
							//OBJECT MOVE(*;"oSearchvalue";$_l_SearchLeft;$_l_ObjectTop+9;$_l_SearchLeft+150;$_l_ObjectBottom-9;*)
							//OBJECT MOVE(*;"oSearchCriteria";$_l_SearchLeft;$_l_ObjectTop+9;$_l_SearchLeft+150;$_l_ObjectBottom-9;*)
							//OBJECT MOVE(*;"oSearchClearButton";$_l_CanceLeft;$_l_ObjectTop+9;$_l_CanceLeft+15;$_l_ObjectBottom-9;*)
							
							//OBJECT GET COORDINATES(*;"oRoundArea1";$_l_ObjectLeft;$_l_ObjectTop;$_l_ObjectRight;$_l_ObjectBottom)
						Else 
						End if 
						OBJECT GET COORDINATES:C663(*; "oSRCH_t_Prompt"; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
						OBJECT MOVE:C664(*; "oSRCH_t_Prompt"; $_l_CBRight+5; $_l_ObjectTop2; ($_l_ObjectLeft-10); $_l_ObjectBottom2; *)
						
						If (DB_bo_DisplayStats)
							//stats are displayed
							StatsView_Cal1
							StatsView_Cal2
						End if 
				End case 
				DB_t_ClickedObjectName:=""
			: (Lay_bo_UpdateFilters)
				
				Lay_bo_UpdateFilters:=False:C215
				SEL_CurrentRecordSelection
				$_ptr_Table:=Table:C252(DB_l_CurrentDisplayedForm)
				SRCH_Applyfilterstoselection($_ptr_Table)
				DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
				
				DB_SetWindowTitle(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
				OBJECT SET VISIBLE:C603(*; "oFiltersActiveText"; True:C214)
				OBJECT SET ENABLED:C1123(*; "oclearFilters"; True:C214)
				
				If (DB_bo_DisplayStats)
					//stats are displayed
					StatsView_Cal1
					StatsView_Cal2
				End if 
			Else 
				$_ptr_FocusObject:=Focus object:C278
				
				
				
				
				
				RESOLVE POINTER:C394($_ptr_FocusObject; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
				If ($_t_VariableName#"")
					Case of 
						: ($_t_VariableName="DB_at_SetName")
						: ($_t_VariableName="DB_at_TabNavigation")  //navigation bar
							
							
							//TRACE
							DB_SetFormTabs(DB_l_CurrentDisplayedForm; DB_t_CurrentContext; ->DB_at_TabNavigation; ->DB_al_TabNavigation; ->DB_at_TabContext)
							
							DB_SetFormLayout(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
							DB_SetFormmenu(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
							//at this point we size the form based on the current selection. on tabbing we change the size to the width of the new form
							//`but we only grow the height of the form on a selection change do not shrink it
							If (DB_bo_ShowArrayBased)
								DB_SetFormSize(DB_l_CurrentDisplayedForm; ->DB_lb_OutputArrays; 90; 60; DB_bo_DisplayFilters)
							Else 
								DB_SetFormSize(DB_l_CurrentDisplayedForm; ->DB_l_LBOutputForm; 90; 60; DB_bo_DisplayFilters)
							End if 
							
							
							DB_SetFormCache(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
							DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
							DB_SetFormMenuoptions
							DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
							DB_HideShowSearch(DB_l_CurrentDisplayedForm)
							GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRIght; $_l_WindowBottom)
							$_l_WindowWidth:=$_l_WindowRIght-$_l_WindowLeft
							If (Is macOS:C1572)
								OBJECT GET COORDINATES:C663(DB_l_Navigatetoselected; $_l_CBLeft; $_l_CBTop; $_l_CBRight; $_l_CBBottom)
								OBJECT GET COORDINATES:C663(*; "oSearchvalue"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
								$_l_AreaWidth:=$_l_ObjectRight-$_l_ObjectLeft
								//OBJECT MOVE(*;"oRoundArea1";($_l_WindowWidth-10)-$_l_AreaWidth;$_l_ObjectTop;$_l_WindowWidth-10;$_l_ObjectBottom;*)
								//OBJECT MOVE(*;"oFocusRing";($_l_WindowWidth-10)-$_l_AreaWidth;$_l_ObjectTop;$_l_WindowWidth-10;$_l_ObjectBottom;*)
								//drop down 12 in and 23 wid
								$_l_DropDownLeft:=(($_l_WindowWidth-10)-$_l_AreaWidth)+12
								$_l_SearchLeft:=(($_l_WindowWidth-10)-$_l_AreaWidth)+38
								$_l_CanceLeft:=(($_l_WindowWidth-10)-$_l_AreaWidth)+(462-269)
								OBJECT MOVE:C664(*; "oSearchCriteriaButton"; $_l_DropDownLeft; $_l_ObjectTop+8; $_l_DropDownLeft+23; $_l_ObjectBottom-5; *)
								//OBJECT MOVE(*;"oSearchvalue";$_l_SearchLeft;$_l_ObjectTop+9;$_l_SearchLeft+150;$_l_ObjectBottom-9;*)
								//OBJECT MOVE(*;"oSearchCriteria";$_l_SearchLeft;$_l_ObjectTop+9;$_l_SearchLeft+150;$_l_ObjectBottom-9;*)
								//OBJECT MOVE(*;"oSearchClearButton";$_l_CanceLeft;$_l_ObjectTop+9;$_l_CanceLeft+15;$_l_ObjectBottom-9;*)
								
								//OBJECT GET COORDINATES(*;"oRoundArea1";$_l_ObjectLeft;$_l_ObjectTop;$_l_ObjectRight;$_l_ObjectBottom)
							Else 
							End if 
							OBJECT GET COORDINATES:C663(*; "oSRCH_t_Prompt"; $_l_ObjectLeft2; $_l_ObjectTop2; $_l_ObjectRight2; $_l_ObjectBottom2)
							OBJECT MOVE:C664(*; "oSRCH_t_Prompt"; $_l_CBRight+5; $_l_ObjectTop2; ($_l_ObjectLeft-10); $_l_ObjectBottom2; *)
							If (DB_bo_DisplayStats)
								//stats are displayed
								StatsView_Cal1
								StatsView_Cal2
							End if 
					End case 
				Else 
				End if 
				
				
		End case 
		PAL_BUTTON:=""
		If (DB_bo_ShowArrayBased)
			LBI_UpdateFooters(->DB_lb_OutputArrays; 0)
			If (Not:C34($_bo_NoScrollSet))
				LBI_Scrollonresize(->DB_lb_OutputArrays)
			End if 
		Else 
			LBI_UpdateFooters(->DB_l_LBOutputForm; 3; DB_l_CurrentDisplayedForm)
			If (Not:C34($_bo_NoScrollSet))
				LBI_Scrollonresize(->DB_l_LBOutputForm)
			End if 
		End if 
		
	: ($_l_FormEvent=On Double Clicked:K2:5)
	: ($_l_FormEvent=On Menu Selected:K2:14)
		
		TRACE:C157
		
		
		
		If (DB_bo_AutorelationsTemp)  //this is turned on if the user clicks to sort on a column in a different table
			
			
			DB_bo_AutorelationsTemp:=False:C215
			SET AUTOMATIC RELATIONS:C310(False:C215; False:C215)
		End if 
		
		DB_SetFormmenu(DB_l_CurrentDisplayedForm; DB_t_CurrentContext; True:C214)
		DB_SetFormMenuoptions
		DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		$_l_BarProcess:=Get_ProcessNumber("Modules_Palette")
		If ($_l_BarProcess>0)
			HIDE PROCESS:C324($_l_BarProcess)
		End if 
		If (<>ButtProc>0)
			HIDE PROCESS:C324(<>ButtProc)
		End if 
		
	: ($_l_FormEvent=On After Edit:K2:43)
		If (DB_bo_AutorelationsTemp)  //this is turned on if the user clicks to sort on a column in a different table
			
			
			
			
			DB_bo_AutorelationsTemp:=False:C215
			SET AUTOMATIC RELATIONS:C310(False:C215; False:C215)
		End if 
		
		If (SD2_T_SearchValue#"")
			//SRCH_t_SearchValue:=SD2_T_SearchValue
			//SRCH_t_SearchValueOLD:=SRCH_t_SearchValue
			//SET TIMER(10)
		End if 
	: ($_l_FormEvent=On Outside Call:K2:11)
		TRACE:C157
		$_bo_NoScrollSet:=False:C215
		
		
		//TRACE
		If (DB_bo_AutorelationsTemp)  //this is turned on if the user clicks to sort on a column in a different table
			
			
			
			DB_bo_AutorelationsTemp:=False:C215
			SET AUTOMATIC RELATIONS:C310(False:C215; False:C215)
		End if 
		
		$_l_ButtonNumber:=DB_l_ButtonClickedFunction
		DB_l_ButtonClickedFunction:=0
		If ($_l_ButtonNumber=109)
			DB_bo_ButtonCall:=True:C214
			PAL_BUTTON_2:=1
		End if 
		Case of 
			: ($_l_ButtonNumber=902)
				DB_SubFunctionHandler
				DB_UpdateScreenInfo(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
			: ($_l_ButtonNumber=DB_GetButtonFunction("FormWindows"))
				If (DB_T_CurrentWindowMenu#"")
					DB_T_CurrentWindowMenu:=DB_BuildWIndowsMenu(DB_T_CurrentWindowMenu)
					//DELETE MENU ITEM(DB_t_CUrrentMenuReference;-1)
					//"Form Windows";DB_T_CurrentWindowMenu)
					//INSERT MENU ITEM(DB_t_CUrrentMenuReference;-1;"Form Windows";DB_T_CurrentWindowMenu)
					
					
					SET MENU BAR:C67(DB_t_CUrrentMenuReference)
				End if 
				
			: ($_l_ButtonNumber=DB_GetButtonFunction("M:"))
				$_t_ClickedFunction:=DB_t_ButtonClickedFunction
				If ($_t_ClickedFunction#"")
					
					DB_t_ButtonClickedFunction:=""
					
					If ((DB_GetModuleSettingByNUM(Module_Macros))>1)
						If ($_t_ClickedFunction="F:@")  //So F key functions dont think they are called from the palette
							
							
							
							
							Macro(Substring:C12($_t_ClickedFunction; 3; 15))
						Else 
							Macro(Substring:C12($_t_ClickedFunction; 3; 15); ""; ""; <>SCPT_l_PaletteWIndow)  //Play a Macro - Called by Record_FKey
							
							
						End if 
					End if 
					
				End if 
				
				
			: ($_l_ButtonNumber=DB_GetButtonFunction("Cancel"))
				CANCEL:C270
			: ($_l_ButtonNumber=DB_GetButtonFunction("Q2U"))
				CANCEL:C270
				Quit_to_User
			: ($_l_ButtonNumber=DB_GetButtonFunction("Find"))
				GOTO OBJECT:C206(*; "oSearchvalue")
			: ($_l_ButtonNumber=DB_GetButtonFunction("Sort"))
				DB_SortrecordsFromSelection
				
			: (SM_l_MonitorCall#0)
				$_l_SMSMonitorCall:=SM_l_MonitorCall
				SM_l_MonitorCall:=0
				Case of 
					: ($_l_SMSMonitorCall=-2)
						
						DB_SetFormmenu(DB_l_CurrentDisplayedForm; DB_t_CurrentContext; True:C214)
					: ($_l_SMSMonitorCall=-3)
						
						
				End case 
			: (SM_l_ShowScripts>0)
				$_l_SMShowScripts:=SM_l_ShowScripts
				SM_l_ShowScripts:=0
				Case of 
					: (SM_l_ShowScripts=3)
				End case 
			: (DB_l_TurnOnFilters>0)
				
				DB_bo_DisplayFilters:=False:C215
				DB_SetFilters
				DB_l_TurnOnFilters:=0
			: (DB_bo_RefreshScreen)
				DB_bo_RefreshScreen:=False:C215
				If (DB_bo_ShowArrayBased)
				Else 
					COPY NAMED SELECTION:C331(Table:C252(DB_l_CurrentDisplayedForm)->; "$CurrentSelection")
					GET HIGHLIGHTED RECORDS:C902(Table:C252(DB_l_CurrentDisplayedForm)->; "ListboxSet0")
					REDUCE SELECTION:C351(Table:C252(DB_l_CurrentDisplayedForm)->; 0)
					USE NAMED SELECTION:C332("$CurrentSelection")
					HIGHLIGHT RECORDS:C656(Table:C252(DB_l_CurrentDisplayedForm)->; "ListboxSet0")
				End if 
			: (DB_bo_ButtonCall)
				DB_bo_ButtonCall:=False:C215
				Case of 
					: (BAR_t_Button#"")
						
						$_l_CurrentButtonNumber:=Num:C11(BAR_t_Button)
						If ($_l_CurrentButtonNumber>1)
							ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_CurrentButtonNumber-1}
							$_l_ModuleRow:=Find in array:C230(MOD_al_ModuleBarNum; ModuleNumber)
							
							DB_SetBrowserBarSelection($_l_ModuleRow; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
							DB_SetFormmenu(DB_l_CurrentDisplayedForm; DB_t_CurrentContext; True:C214)
							DB_SetFormMenuoptions
						End if 
						BAR_t_Button:=""
					: (PAL_BUTTON_288=1)  //Next selection
						
						
						PAL_BUTTON_288:=0
						SEL_NextRecordsSelection
						DB_UpdateScreenInfo(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
					: (PAL_BUTTON_287=1)  //Previous selection
						
						
						PAL_but_PreviousRecord:=0
						SEL_PrevRecordsSelection
						DB_UpdateScreenInfo(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
					: (PAL_BUTTON_286=1)  //First selection
						
						
						PAL_BUTTON_286:=0
						SEL_PrevRecordsSelection(1)
						DB_UpdateScreenInfo(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
					: (PAL_BUTTON_289=1)  //Previous selection
						
						
						PAL_BUTTON_289:=0
						SEL_NextRecordsSelection(99999)
						DB_UpdateScreenInfo(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
					: (PAL_BUTTON_290=1)  //ReSET_MENU
						DB_SetFormmenu(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
						DB_SetFormMenuoptions
						DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
						DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
						$_l_BarProcess:=Get_ProcessNumber("Modules_Palette")
						If ($_l_BarProcess>0)
							HIDE PROCESS:C324($_l_BarProcess)
						End if 
						If (<>ButtProc>0)
							HIDE PROCESS:C324(<>ButtProc)
						End if 
						PAL_BUTTON_290:=0
						BRING TO FRONT:C326(Current process:C322)
						
					: (PAL_BUTTON_2=1)  //accept
						
						
						PAL_BUTTON_2:=0
						If (DB_bo_DisplaySelections)
							$_l_SetsCount:=Size of array:C274(DB_at_SetName)
							If (DB_al_SetID{$_l_SetsCount}=999999)  //new Record not saved
								
								
								Case of 
									: (DB_at_SetName{$_l_SetsCount}="New Set")
										$_t_NewSetName:=Gen_Request("Enter Name for new set"; "New Set")
										If (OK=1)
											DB_at_SetName{$_l_SetsCount}:=$_t_NewSetName
										End if 
									: (DB_at_SetName{$_l_SetsCount}="New Group")
										$_t_NewSetName:=Gen_Request("Enter Name for the new Group"; "New Group")
										If (OK=1)
											DB_at_SetName{$_l_SetsCount}:=$_t_NewSetName
										End if 
								End case 
								ARRAY TEXT:C222($_at_SetClass; 4)
								ARRAY LONGINT:C221($_al_SetClassID; 4)
								$_at_SetClass{1}:="Fixed List"
								$_at_SetClass{2}:="Dynamic List"
								$_at_SetClass{3}:="Fixed List with Dynamic Query"
								$_at_SetClass{4}:="Group"
								$_al_SetClassID{1}:=853
								$_al_SetClassID{2}:=854
								$_al_SetClassID{3}:=852
								$_al_SetClassID{4}:=855
								$_l_ListItemParent:=10000+DB_l_CurrentDisplayedForm
								$_l_ItemReference:=-(AA_GetNextIDinMethod(->SM_l_ContextItemID))
								DB_al_SetID{$_l_SetsCount}:=$_l_ItemReference
								DB_at_SetMethod{$_l_SetsCount}:="DB_SelectSet"
								DB_at_MethodParameters{$_l_SetsCount}:=String:C10($_l_ItemReference)
								$_l_ClassRow:=Find in array:C230($_al_SetClassID; DB_l_newSetClass)
								If (DB_l_newSetClass=0)
									DB_l_newSetClass:=853
								End if 
								SM_UpdateArrays("PER"; DB_at_SetName{$_l_SetsCount}; $_l_ItemReference; $_l_ListItemParent; ""; 0; $_at_SetClass{$_l_ClassRow}; $_al_SetClassID{$_l_ClassRow})
								Case of 
									: (DB_l_newSetClass=853)
										SM_saveSet("DB_NewSet"; $_l_ItemReference)
									: (DB_l_newSetClass=852) | (DB_l_newSetClass=854)
										If (DB_l_MyTempMacro=0)
											DB_l_MyTempMacro:=AA_GetNextID(->DB_l_MyTempMacro)
										End if 
										$_t_ScriptCode:=String:C10(DB_l_MyTempMacro; "######")
										$_t_ScriptName:="Data Query "+"Temp"
										READ WRITE:C146([SCRIPTS:80])
										QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1=$_t_ScriptCode)
										If (Records in selection:C76([SCRIPTS:80])=1)
											[SCRIPTS:80]Script_Code:1:=String:C10(DB_al_SetID{$_l_SetsCount})
											[SCRIPTS:80]Script_Name:2:="Data Query "+DB_at_SetName{$_l_SetsCount}
											DB_SaveRecord(->[SCRIPTS:80])
											
										End if 
								End case 
								//the above saves the data to the arrays. now save the arrays.
								//START TRANSACTION
								SM_UPDATEDATA
								LB_SetEnterable(->DB_lb_Setsandselections; False:C215; 0)
								
							End if 
							//if seleciton mananger displayed make sure we save sets changes.
						End if 
						
						//Here if we are in a transaction we can vailidate the transacton
						If (DB_bo_ReturnSelection)
							If (DB_l_CurrentDisplayedForm=DB_l_ReturnSelectionTable)
								$_Ptr_CUrrentTable:=Table:C252(DB_l_CurrentDisplayedForm)
								CREATE SET:C116($_Ptr_CUrrentTable->; "$Temp")
								If (Records in set:C195("ListboxSet0")>0)
									USE SET:C118("ListboxSet0")
									$_Ptr_SelectedTable:=Table:C252(DB_l_ReturnSelectionTable)
									COPY NAMED SELECTION:C331($_Ptr_SelectedTable->; "ReturnedSelection")
								Else 
									Gen_Confirm("Select All records?"; "Yes"; "No")
									If (OK=0)
										REDUCE SELECTION:C351($_Ptr_CUrrentTable->; 0)
									End if 
									$_Ptr_SelectedTable:=Table:C252(DB_l_ReturnSelectionTable)
									COPY NAMED SELECTION:C331($_Ptr_SelectedTable->; "ReturnedSelection")
								End if 
							End if 
						End if 
						If (In transaction:C397)
							Case of 
								: (DB_l_CurrentDisplayedForm=Table:C252(->[CONTACTS:1]))
									
									
									Case of 
										: ($_t_CurrentContext="Deduplicate")
											Gen_Confirm("Do you want to save any changes to the Duplicate State and Comments fields"+", and to confirm any deletions made?"; "Yes"; "No")
											Transact_End
									End case 
									
									
							End case 
						End if 
						
						//FSetting_UpdateArray (WIN_t_CurrentOutputform;FS_l_SortDirection;FS_l_SortFieldNUM;FS_l_SortTableNUM;FS_t_SortVariableName;FS_t_SortFieldTXT;WT_t_SortFieldVARNAME)
						ACCEPT:C269
						PAL_BUTTON_2:=0
					: (PAL_BUTTON_1=1)
						PAL_BUTTON:=""
						//Hdere if we are in a transaction we cancel the transaction
						//FSetting_UpdateArray (WIN_t_CurrentOutputform;FS_l_SortDirection;FS_l_SortFieldNUM;FS_l_SortTableNUM;FS_t_SortVariableName;FS_t_SortFieldTXT;WT_t_SortFieldVARNAME)
						If (DB_bo_ReturnSelection)
							If (DB_l_CurrentDisplayedForm=DB_l_ReturnSelectionTable)
								$_Ptr_CUrrentTable:=Table:C252(DB_l_CurrentDisplayedForm)
								REDUCE SELECTION:C351($_Ptr_CUrrentTable->; 0)
								$_Ptr_SelectedTable:=Table:C252(DB_l_ReturnSelectionTable)
								COPY NAMED SELECTION:C331($_Ptr_SelectedTable->; "ReturnedSelection")
								
							End if 
						End if 
						
						CANCEL:C270
						PAL_BUTTON_1:=0
					: (PAL_BUTTON_4=1)
						PAL_BUTTON_4:=0
						PAL_BUTTON:=""
						//TRACE
						If (Count parameters:C259>=2)
							//There is a name for the context
							$_l_ModuleRow:=Find in array:C230(DB_at_ContextNames; DB_t_CurrentContext)
						Else 
							$_l_ModuleRow:=Find in array:C230(DB_al_ContextTableNumber; DB_l_CurrentDisplayedForm)
							
							//just use the table number-only one context
						End if 
						If ($_l_ModuleRow>0)
							$_ptr_ListboxSetup:=DB_aptr_ContextPointers{$_l_ModuleRow}
							//from this array we get the refs
							$_ptr_ReferencesArray:=$_ptr_ListboxSetup->{9}
							//the form name is in element 5
							$_t_FormName:=$_ptr_ReferencesArray->{5}
							//$Function:=DB_FormtoFunction ($_t_FormName)
							//now not needed because all data entry is via
							DB_EnterNewRecord
							DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
							
							
							//$_l_AddMode:=Vadd
							<>NoStart:=1  //NG March 2004 this was causing a prob
							
							
							//EXECUTE FORMULA($Function)
							//Cache_Update
							//vNo:=Records in selection($1->)
							//vAdd:=$_l_AddMode
							
							
							
							
							//add record. Here check the setting for edit in window. this will determine if we create a new process for the entry
							//here we look up the form to use for data entry from the array.
							
						End if 
						
						
					: (PAL_BUTTON_3=1)  //delete
						
						
						PAL_BUTTON_3:=0
						DB_DeleteFromSelection
						DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
						PAL_BUTTON_3:=0
						If (DB_bo_DisplayStats)
							//stats are displayed
							StatsView_Cal1
							StatsView_Cal2
						End if 
						
					: (PAL_BUTTON_13=1)  //sort
						
						
						
						PAL_BUTTON_13:=0
						DB_SortrecordsFromSelection
						
						
					: (PAL_BUTTON_18=1)  //calc
						
						
						PAL_BUTTON_18:=0
						DB_CountrecordsFromSelection
					: (PAL_BUTTON_14=1)  //show/hide selection manager
						
						
						PAL_BUTTON_14:=0
						DB_SetselectionManager
					: (PAL_BUTTON_15=1)  //create repor
						
						
						PAL_BUTTON_15:=0
						DB_CreateReport
						DB_bo_ButtonCall:=True:C214
						PAL_BUTTON_290:=1
						POST OUTSIDE CALL:C329(Current process:C322)
					: (PAL_BUTTON_11=1)
						PAL_BUTTON_11:=0
						//show subselection
						
						//Co_SelectrecordsFromSelection
						DB_SelectrecordsFromSelection
						$_bo_NoScrollSet:=True:C214
						
						
				End case 
			Else 
				If (Records in set:C195("◊TempSet")>0)
					//TRACE
					CREATE SET:C116(Table:C252(DB_l_CurrentDisplayedForm)->; "$CurrentSelection")
					USE SET:C118("◊TempSet")
					CLEAR SET:C117("◊TempSet")
					CREATE SET:C116(Table:C252(DB_l_CurrentDisplayedForm)->; "$CurrentSelection2")
					UNION:C120("$CurrentSelection"; "$CurrentSelection"; "$CurrentSelection")
					SEL_UpdateRecordCache(DB_l_CurrentDisplayedForm)
					DB_UpdateScreenInfo(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
					
					Case of 
						: (DB_l_CurrentDisplayedForm=Table:C252(->[ACCOUNT_BALANCES:34]))
							If (DB_bo_ShowArrayBased)
								$_l_CurrentLevel:=LAY_LOADACCOUNTBALANCESARRAYS
							End if 
						: (DB_l_CurrentDisplayedForm=Table:C252(->[ACCOUNTS:32]))
							If (DB_bo_ShowArrayBased)
								LAY_LoadAccountsArrays(False:C215)
							End if 
						: (DB_l_CurrentDisplayedForm=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
							If (DB_bo_ShowArrayBased)
								DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]Product_Code:1; $_at_ProductCodes)
								QUERY WITH ARRAY:C644([PRODUCTS:9]Product_Code:1; $_at_ProductCodes)
								ARRAY BOOLEAN:C223(PRD_abo_Expanded; 0)
								SELECTION TO ARRAY:C260([PRODUCTS:9]Product_Code:1; PRD_at_STKHistoryProducts; [PRODUCTS:9]Product_Name:2; PRD_at_STKHistoryName; [PRODUCTS:9]X_ID:43; PRD_al_ProductID)
								ARRAY BOOLEAN:C223(PRD_abo_Expanded; Size of array:C274(PRD_at_STKHistoryProducts))
								//be careful when changing selection to respect the expanded status of items
								ARRAY PICTURE:C279(PRD_aPic_Expanded; 0)
								ARRAY PICTURE:C279(PRD_aPic_Expanded; Size of array:C274(PRD_at_STKHistoryProducts))
								//GET PICTURE FROM LIBRARY(403; $_pic_ExpandCollapse)  //410 for expanded
								$_pic_ExpandCollapse:=Get_Picture(403)
								
								For ($_l_Index; 1; Size of array:C274(PRD_aPic_Expanded))
									PRD_aPic_Expanded{$_l_Index}:=$_pic_ExpandCollapse
								End for 
							End if 
						: (DB_l_CurrentDisplayedForm=Table:C252(->[TRANSACTIONS:29]))
							
							Case of 
								: (DB_t_CurrentContext="Reconcile Transactions")
									
									If (DB_GetSalesLedgerBankFrom#"")
										If (DB_GetSalesLedgerBankTo#"")
											QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Account_Code:3>=DB_GetSalesLedgerBankFrom; *)
										Else 
											QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Account_Code:3=DB_GetSalesLedgerBankFrom; *)
										End if 
										If (DB_GetSalesLedgerBankTo#"")
											QUERY SELECTION:C341([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Account_Code:3<=DB_GetSalesLedgerBankTo)
										Else 
											QUERY SELECTION:C341([TRANSACTIONS:29])
											
										End if 
									Else 
										QUERY SELECTION:C341([TRANSACTIONS:29];  | ; [TRANSACTIONS:29]Account_Code:3=DB_GetSalesLedgerBankTo)
									End if 
									QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Reconciled:14=False:C215)
							End case 
					End case 
					
					$_ptr_Table:=Table:C252(DB_l_CurrentDisplayedForm)
					SRCH_Applyfilterstoselection($_ptr_Table)
					DB_SetFormMenuoptions
					DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
					DB_SetWindowTitle(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)  //
					
					
					If (DB_bo_DisplayStats)
						//stats are displayed
						StatsView_Cal1
						StatsView_Cal2
					End if 
				End if 
				
		End case 
		If (DB_bo_ShowArrayBased)
			
			LBI_UpdateFooters(->DB_lb_OutputArrays; 0)
			If (Not:C34($_bo_NoScrollSet))
				
				LBI_Scrollonresize(->DB_lb_OutputArrays)
			End if 
			
		Else 
			LBI_UpdateFooters(->DB_l_LBOutputForm; 3; DB_l_CurrentDisplayedForm)
			If (Not:C34($_bo_NoScrollSet))
				
				LBI_Scrollonresize(->DB_l_LBOutputForm)
				
			End if 
		End if 
	: ($_l_FormEvent=On Timer:K2:25)
		
		If (DB_bo_AutorelationsTemp)  //this is turned on if the user clicks to sort on a column in a different table
			
			
			
			
			DB_bo_AutorelationsTemp:=False:C215
			SET AUTOMATIC RELATIONS:C310(False:C215; False:C215)
		End if 
		
		SRCH_r_Timer:=Tickcount:C458
		//BEEP
		
		If (SRCH_r_TimerOLD>0)
			If (SRCH_r_Timer>(SRCH_r_TimerOLD+30)) & (SRCH_t_SearchValue=SRCH_t_SearchValueOLD)
				SET TIMER:C645(0)
				$_Ptr_CurrentTable:=Table:C252(DB_l_CurrentDisplayedForm)
				If (SRCH_t_SearchValue#"")
					If (SRCH_t_SearchValue="*ALL")
						$_Ptr_CurrentTable:=Table:C252(DB_l_CurrentDisplayedForm)
						ALL RECORDS:C47($_Ptr_CurrentTable->)
						SRCH_StandardSearch(DB_l_CurrentDisplayedForm; ""; DB_t_CurrentContext)
						SRCH_t_SearchValue:=""
						//DB_UpdateScreenInfo (DB_l_CurrentDisplayedForm;DB_t_CurrentContext)
					Else 
						SRCH_StandardSearch(DB_l_CurrentDisplayedForm; SRCH_t_SearchValue; DB_t_CurrentContext)
						//DB_UpdateScreenInfo (DB_l_CurrentDisplayedForm;DB_t_CurrentContext)
					End if 
					If (Records in selection:C76($_Ptr_CurrentTable->)>0)
						SEL_UpdateRecordCache(DB_l_CurrentDisplayedForm)
						DB_UpdateScreenInfo(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
					End if 
					Case of 
						: (DB_l_CurrentDisplayedForm=Table:C252(->[ACCOUNT_BALANCES:34]))
							If (DB_bo_ShowArrayBased)
								$_l_CurrentLevel:=LAY_LOADACCOUNTBALANCESARRAYS
							End if 
						: (DB_l_CurrentDisplayedForm=Table:C252(->[ACCOUNTS:32]))
							If (DB_bo_ShowArrayBased)
								LAY_LoadAccountsArrays(False:C215)
							End if 
						: (DB_l_CurrentDisplayedForm=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
							If (DB_bo_ShowArrayBased)
								DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]Product_Code:1; $_at_ProductCodes)
								QUERY WITH ARRAY:C644([PRODUCTS:9]Product_Code:1; $_at_ProductCodes)
								ARRAY BOOLEAN:C223(PRD_abo_Expanded; 0)
								SELECTION TO ARRAY:C260([PRODUCTS:9]Product_Code:1; PRD_at_STKHistoryProducts; [PRODUCTS:9]Product_Name:2; PRD_at_STKHistoryName; [PRODUCTS:9]X_ID:43; PRD_al_ProductID)
								ARRAY BOOLEAN:C223(PRD_abo_Expanded; Size of array:C274(PRD_at_STKHistoryProducts))
								//be careful when changing selection to respect the expanded status of items
								ARRAY PICTURE:C279(PRD_aPic_Expanded; 0)
								ARRAY PICTURE:C279(PRD_aPic_Expanded; Size of array:C274(PRD_at_STKHistoryProducts))
								//GET PICTURE FROM LIBRARY(403; $_pic_ExpandCollapse)  //410 for expanded
								$_pic_ExpandCollapse:=Get_Picture(403)
								
								For ($_l_Index; 1; Size of array:C274(PRD_aPic_Expanded))
									PRD_aPic_Expanded{$_l_Index}:=$_pic_ExpandCollapse
								End for 
							End if 
						: (DB_l_CurrentDisplayedForm=Table:C252(->[TRANSACTIONS:29]))
							
							Case of 
								: (DB_t_CurrentContext="Reconcile Transactions")
									
									If (DB_GetSalesLedgerBankFrom#"")
										If (DB_GetSalesLedgerBankTo#"")
											QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Account_Code:3>=DB_GetSalesLedgerBankFrom; *)
										Else 
											QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Account_Code:3=DB_GetSalesLedgerBankFrom; *)
										End if 
										If (DB_GetSalesLedgerBankTo#"")
											QUERY SELECTION:C341([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Account_Code:3<=DB_GetSalesLedgerBankTo)
										Else 
											QUERY SELECTION:C341([TRANSACTIONS:29])
											
										End if 
									Else 
										QUERY SELECTION:C341([TRANSACTIONS:29];  | ; [TRANSACTIONS:29]Account_Code:3=DB_GetSalesLedgerBankTo)
									End if 
									QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Reconciled:14=False:C215)
							End case 
					End case 
					$_ptr_Table:=Table:C252(DB_l_CurrentDisplayedForm)
					SRCH_Applyfilterstoselection($_ptr_Table)
					DB_SetFormMenuoptions
					DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
					DB_SetWindowTitle(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)  //
					
					
					If (DB_bo_DisplayStats)
						//stats are displayed
						StatsView_Cal1
						StatsView_Cal2
					End if 
				Else 
					
					
					//Load the current selection
					//SRCH_Applyfilterstoselection (->[COMPANIES])
					SEL_CurrentRecordSelection
					$_ptr_Table:=Table:C252(DB_l_CurrentDisplayedForm)
					SRCH_Applyfilterstoselection($_ptr_Table)
					DB_SetFormMenuoptions
					DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
					DB_SetWindowTitle(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
					If (DB_bo_DisplayStats)
						//stats are displayed
						StatsView_Cal1
						StatsView_Cal2
					End if 
					//reload the selection by filter
					
				End if 
				If (DB_bo_ShowArrayBased)
					LBI_UpdateFooters(->DB_lb_OutputArrays; 0)
					LBI_Scrollonresize(->DB_lb_OutputArrays)
				Else 
					LBI_UpdateFooters(->DB_l_LBOutputForm; 3; DB_l_CurrentDisplayedForm)
					LBI_Scrollonresize(->DB_l_LBOutputForm)
				End if 
			Else 
				
				
				If (SRCH_t_SearchValueOLD#SRCH_t_SearchValue)
					
					SRCH_r_TimerOLD:=SRCH_r_Timer
				End if 
			End if 
			SRCH_t_SearchValueOLD:=SRCH_t_SearchValue
		Else 
			SRCH_r_TimerOLD:=SRCH_r_Timer
			SRCH_t_SearchValueOLD:=SRCH_t_SearchValue
		End if 
End case 
ERR_MethodTrackerReturn("FM DB_OutputForm"; $_t_OldMethodName)
