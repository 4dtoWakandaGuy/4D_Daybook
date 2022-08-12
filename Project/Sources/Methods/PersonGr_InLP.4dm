//%attributes = {}
If (False:C215)
	//Project Method Name: PersonGr_InLP
	//------------------ Method Notes ------------------
	//------------------ Revision Control ----------------
	//Date Created: 14/03/2010 17:57
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(iCancel)
	//C_UNKNOWN(iOK)
	//C_UNKNOWN(ModuleNumber)
	//C_UNKNOWN(PAL_BUTTON)
	//C_UNKNOWN(PAL_but_LastRecord)
	//C_UNKNOWN(PAL_but_PreviousRecord)
	//C_UNKNOWN(PAL_but_FirstRecord)
	//C_UNKNOWN(vButtDisPerGroup)
	//ARRAY BOOLEAN(CAT_abo_CatalogueEXC;0)
	//ARRAY BOOLEAN(CAT_abo_CatalogueINC;0)
	//ARRAY BOOLEAN(CAT_abo_IsAvailable;0)
	//ARRAY BOOLEAN(GRP_lb_RecordStates;0)
	//ARRAY BOOLEAN(MOD_abo_AccessBoolean;0)
	//ARRAY BOOLEAN(MOD_abo_DisableVolume;0)
	//ARRAY BOOLEAN(MOD_abo_InitStartup;0)
	//ARRAY BOOLEAN(MOD_abo_NoDeletion;0)
	//ARRAY BOOLEAN(MOD_abo_ReadOnly;0)
	//ARRAY BOOLEAN(MOD_abo_ShowIcon;0)
	//ARRAY BOOLEAN(MOD_abo_ShowLabel;0)
	//ARRAY BOOLEAN(PER_LB_volumeAccess;0)
	//ARRAY BOOLEAN(PROD_lb_Catalogues;0)
	//ARRAY BOOLEAN(SD2_abo_LBres;0)
	//ARRAY BOOLEAN(SD2_lb_Actions;0)
	//ARRAY DATE(CAT_ad_CatalogueAvaialbeTo;0)
	//ARRAY DATE(CAT_ad_CatalogueAvailableFrom;0)
	//ARRAY INTEGER(CAT_aI_CatalogueDF;0)
	//ARRAY INTEGER(CAT_aI_CatalogueEXC;0)
	//ARRAY INTEGER(CAT_aI_CatalogueINC;0)
	//ARRAY INTEGER(CU_ai_CodeUsed;0)
	//ARRAY INTEGER(SD_ai_ActionCodes;0)
	//ARRAY INTEGER(SD_ai_ActionCodesOSW;0)
	//ARRAY INTEGER(SD_ai_ResultCodes;0)
	//ARRAY LONGINT(CAT_al_CatalogueClass;0)
	//ARRAY LONGINT(CAT_al_CatalogueID;0)
	//ARRAY LONGINT(CAT_al_CatalogueImageSource;0)
	//ARRAY LONGINT(MOD_al_DisableVolume;0)
	//ARRAY LONGINT(MOD_al_InitStartup;0)
	//ARRAY LONGINT(MOD_al_ModuleAccessStatus;0)
	//ARRAY LONGINT(MOD_al_ModuleBarNum;0)
	//ARRAY LONGINT(MOD_al_ModuleBarOffsets;0)
	//ARRAY LONGINT(MOD_al_ShowIcon;0)
	//ARRAY LONGINT(MOD_al_ShowLabel;0)
	//ARRAY LONGINT(SD_al_ActionCodesOST;0)
	//ARRAY LONGINT(SD_al_ActionTime;0)
	//ARRAY REAL(GEN_ar_Value;0)
	//ARRAY REAL(SRPrice;0)
	//ARRAY REAL(SRRate;0)
	//ARRAY TEXT(CAT_at_CatalogueClass;0)
	//ARRAY TEXT(CAT_at_CatalogueImagePath;0)
	//ARRAY TEXT(CAT_at_CatalogueNames;0)
	//ARRAY TEXT(CU_at_CodeUse;0)
	//ARRAY TEXT(MOD_at_ModuleName;0)
	//ARRAY TEXT(SD_at_ActionCodes;0)
	//ARRAY TEXT(SD_at_ActioncodesOST;0)
	//ARRAY TEXT(SD_at_ActionResultTab;0)
	//ARRAY TEXT(SD_at_DiaryActionNames;0)
	//ARRAY TEXT(SD_at_ResultCodes;0)
	//ARRAY TEXT(SD_at_ResultNames;0)
	//ARRAY TEXT(SVS_at_PreviewTypeN;0)
	//ARRAY TEXT(WS_at_PersonGroupTab;0)
	C_BOOLEAN:C305(DB_bo_NoLoad; DB_bo_RecordModified; PAL_bo_ButtonSubFunction; SD_bo_ChangePrefs; CAT_bo_ChangePrefs; DB_bo_NoLoad; DB_bo_RecordModified; PAL_bo_ButtonSubFunction)
	C_LONGINT:C283($_l_ArraySize; $_l_ButtonNumber; $_l_Event; $_l_Index; $_l_ModuleRow; CAT_l_BUT1; CAT_l_But2; CAT_l_BUT3; CAT_l_BUT4; CAT_l_BUT5; CAT_l_BUT7)
	C_LONGINT:C283(CAT_l_BUT8; CAT_l_BUT9; DB_l_ButtonClickedFunction; DB_l_WindowCurrentModule; iCancel; iOK; ModuleNumber; PAL_but_LastRecord; PAL_but_PreviousRecord; PAL_but_FirstRecord; PER_l_BUT1)
	C_LONGINT:C283(PER_l_BUT10; PER_l_BUT11; PER_l_BUT12; PER_l_BUT13; PER_l_BUT14; PER_l_BUT15; PER_l_BUT16; PER_l_BUT17; PER_l_BUT3; PER_l_BUT4; PER_l_BUT5)
	C_LONGINT:C283(PER_l_BUT6; PER_l_BUT7; PER_l_BUT8; PER_l_BUT9; SD2_l_BUT1; SD2_l_But2; SD2_l_BUT3; SD2_l_BUT5; SD2_l_BUT6; SD2_l_BUT7; SD2_l_BUT8)
	C_LONGINT:C283(SD2_l_BUT9; SRE_l_BUT1; SRE_l_But2; SRE_l_BUT3; SRE_l_BUT4; SRE_l_BUT5; SRE_l_BUT7; SRE_l_BUT8; SRE_l_BUT9; STAT_l_BUT1; STAT_l_BUT10)
	C_LONGINT:C283(STAT_l_BUT11; STAT_l_BUT12; STAT_l_BUT13; STAT_l_BUT14; STAT_l_BUT15; STAT_l_BUT17; STAT_l_But2; STAT_l_BUT3; STAT_l_BUT4; STAT_l_BUT5; STAT_l_BUT6)
	C_LONGINT:C283(STAT_l_BUT7; STAT_l_BUT8; STAT_l_BUT9; <>SD3_l_DiaryVersion; $_l_ArraySize; $_l_ButtonNumber; $_l_Event; $_l_Index; $_l_ModuleRow; CAT_l_BUT6; DB_l_ButtonClickedFunction)
	C_LONGINT:C283(DB_l_WindowCurrentModule; PAL_but_NextRecord; PER_l_But2; SD2_l_BUT4; SRE_l_BUT6; STAT_l_BUT16)
	C_TEXT:C284($_t_PalletButtonName; BAR_t_Button; CAT_t_COL1; CAT_t_COL2; CAT_t_COL3; CAT_t_COL4; CAT_t_COL5; CAT_t_COL6; CAT_t_COL7; CAT_t_COL8; CAT_t_HED1)
	C_TEXT:C284(CAT_t_HED2; CAT_t_HED3; CAT_t_HED4; CAT_t_HED5; CAT_t_HED6; CAT_t_HED7; CAT_t_HED8; CAT_t_HED9; DB_t_CUrrentInputMenuRef; PAL_BUTTON; PER_t_COL1)
	C_TEXT:C284(PER_t_COL10; PER_t_COL11; PER_t_COL12; PER_t_COL13; PER_t_COL14; PER_t_COL15; PER_t_COL2; PER_t_COL3; PER_t_COL5; PER_t_COL6; PER_t_COL7)
	C_TEXT:C284(PER_t_COL8; PER_t_COL9; PER_t_HED1; PER_t_HED10; PER_t_HED11; PER_t_HED12; PER_t_HED13; PER_t_HED15; PER_t_HED2; PER_t_HED3; PER_t_HED4)
	C_TEXT:C284(PER_t_HED5; PER_t_HED6; PER_t_HED7; PER_t_HED8; PER_t_HED9; SD2_t_COL1; SD2_t_COL3; SD2_t_COL4; SD2_t_COL5; SD2_t_COL6; SD2_t_COL7)
	C_TEXT:C284(SD2_t_COL8; SD2_t_COL9; SD2_t_HED1; SD2_t_HED2; SD2_t_HED3; SD2_t_HED5; SD2_t_HED6; SD2_t_HED7; SD2_t_HED8; SD2_t_HED9; SRE_t_COL1)
	C_TEXT:C284(SRE_t_COL2; SRE_t_COL3; SRE_t_COL4; SRE_t_COL5; SRE_t_COL7; SRE_t_COL8; SRE_t_COL9; SRE_t_HED1; SRE_t_HED2; SRE_t_HED3; SRE_t_HED4)
	C_TEXT:C284(SRE_t_HED5; SRE_t_HED6; SRE_t_HED7; SRE_t_HED9; STAT_t_COL1; STAT_t_COL10; STAT_t_COL11; STAT_t_COL12; STAT_t_COL13; STAT_t_COL14; STAT_t_COL15)
	C_TEXT:C284(STAT_t_COL2; STAT_t_COL3; STAT_t_COL5; STAT_t_COL6; STAT_t_COL7; STAT_t_COL8; STAT_t_COL9; STAT_t_HED1; STAT_t_HED10; STAT_t_HED11; STAT_t_HED12)
	C_TEXT:C284(STAT_t_HED13; STAT_t_HED15; STAT_t_HED2; STAT_t_HED3; STAT_t_HED4; STAT_t_HED5; STAT_t_HED6; STAT_t_HED7; STAT_t_HED8; STAT_t_HED9; vButtDisPerGroup)
	C_TEXT:C284($_t_oldMethodName; $_t_PalletButtonName; BAR_t_Button; CAT_t_COL9; DB_t_CUrrentInputMenuRef; DB_T_CurrentInputWindowMenu; PER_t_COL4; PER_t_HED14; SD2_t_COL2; SD2_t_HED4; SRE_t_COL6)
	C_TEXT:C284(SRE_t_HED8; STAT_t_COL4; STAT_t_HED14; WIN_t_CurrentInputForm)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("PersonGr_InLP")
$_l_Event:=Form event code:C388

Case of 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[PERSONNEL_GROUPS:92]); WIN_t_CurrentInputForm)
		ARRAY TEXT:C222(SD_at_ActionResultTab; 2)
		SD_at_ActionResultTab{1}:="Actions"
		SD_at_ActionResultTab{2}:="Results"
		SD_at_ActionResultTab:=1
		
		CAT_bo_ChangePrefs:=False:C215
		
		If ([PERSONNEL_GROUPS:92]x_ID:12=0)
			[PERSONNEL_GROUPS:92]x_ID:12:=AA_GetNextIDinMethod(->[PERSONNEL_GROUPS:92]x_ID:12)
		End if 
		CAT_LoadCats(-([PERSONNEL_GROUPS:92]x_ID:12)*10)  //the *10 is because other wise might get a -1
		ARRAY BOOLEAN:C223(CAT_abo_IsAvailable; 0)
		$_l_ArraySize:=Size of array:C274(CAT_aI_CatalogueDF)
		ARRAY BOOLEAN:C223(CAT_abo_IsAvailable; $_l_ArraySize)
		ARRAY BOOLEAN:C223(CAT_abo_CatalogueINC; $_l_ArraySize)
		ARRAY BOOLEAN:C223(CAT_abo_CatalogueEXC; $_l_ArraySize)
		For ($_l_Index; 1; Size of array:C274(CAT_abo_IsAvailable))
			CAT_abo_CatalogueEXC{$_l_Index}:=(CAT_aI_CatalogueEXC{$_l_Index}=1)
			CAT_abo_CatalogueINC{$_l_Index}:=(CAT_aI_CatalogueINC{$_l_Index}=1)
			CAT_abo_IsAvailable{$_l_Index}:=(CAT_aI_CatalogueINC{$_l_Index}=1)
		End for 
		//There are two 'Catalogues' that will be hidden--Reserved Names;'Price List' and 'All Products'
		
		LB_SetupListbox(->PROD_lb_Catalogues; "CAT_t"; "CAT_L"; 1; ->CAT_abo_IsAvailable; ->CAT_abo_CatalogueINC; ->CAT_abo_CatalogueEXC; ->CAT_at_CatalogueNames; ->CAT_ad_CatalogueAvailableFrom; ->CAT_ad_CatalogueAvaialbeTo; ->CAT_at_CatalogueClass; ->CAT_at_CatalogueImagePath; ->CAT_al_CatalogueID; ->CAT_aI_CatalogueDF; ->CAT_aI_CatalogueINC; ->CAT_aI_CatalogueEXC; ->CAT_al_CatalogueImageSource; ->CAT_al_CatalogueClass)
		
		LB_SetColumnHeaders(->PROD_lb_Catalogues; "CAT_L"; 1; "Default"; "Available"; "Exclude"; "Name")
		LB_SetColumnWidths(->PROD_lb_Catalogues; "CAT_t"; 1; 30; 30; 30; 50; 180; 0; 0; 0; 0; 0; 0; 0; 0; 0)
		LB_SetEnterable(->PROD_lb_Catalogues; False:C215; 0)
		LB_SetEnterable(->PROD_lb_Catalogues; True:C214; 1)
		LB_SetEnterable(->PROD_lb_Catalogues; True:C214; 2)
		LB_SetEnterable(->PROD_lb_Catalogues; True:C214; 3)
		LB_SetScroll(->PROD_lb_Catalogues; -3; -2)
		LB_StyleSettings(->PROD_lb_Catalogues; "Black"; 9; "CAT_t"; ->[DIARY:12])
		If (<>SD3_l_DiaryVersion>0)
			ARRAY TEXT:C222(WS_at_PersonGroupTab; 2)
			WS_at_PersonGroupTab{1}:="General"
			WS_at_PersonGroupTab{2}:="Diary"
			If (Size of array:C274(CAT_al_CatalogueID)>0)
				ARRAY TEXT:C222(WS_at_PersonGroupTab; 3)
				WS_at_PersonGroupTab{3}:="Catalogues"
			End if 
			
		Else 
			OBJECT SET VISIBLE:C603(WS_at_PersonGroupTab; False:C215)
		End if 
		
		LB_SetupListbox(->SD2_lb_Actions; "SD2_t"; "SD2_L"; 1; ->SD_ai_ActionCodes; ->SD_at_ActionCodes; ->SD_at_DiaryActionNames; ->SD_al_ActionTime; ->SD_ai_ActionCodesOSW; ->SD_at_ActioncodesOST; ->SD_al_ActionCodesOST)
		LB_SetColumnHeaders(->SD2_lb_Actions; "SD2_L"; 1; "Available"; "Action Code"; ""; "Default Amt Time"; "On Screen Reminder"; "Default Reminder Timing"; "")
		
		LB_SetColumnWidths(->SD2_lb_Actions; "SD2_t"; 1; 17; 170; 40; 26; 40; 60; 0)
		
		LB_SetEnterable(->SD2_lb_Actions; False:C215; 0)
		//LB_SetEnterable (->SD2_lb_Actions;True;1)
		
		LB_SetScroll(->SD2_lb_Actions; -3; -2)
		LB_StyleSettings(->SD2_lb_Actions; "Black"; 9; "SD2_t"; ->[ACCOUNTS:32])
		
		
		
		LB_SetupListbox(->SD2_abo_LBres; "SRE_t"; "SRE_L"; 1; ->SD_ai_ResultCodes; ->SD_at_ResultCodes; ->SD_at_ResultNames)
		
		LB_SetColumnHeaders(->SD2_abo_LBres; "SRE_L"; 1; "Available"; "Result Code"; ""; "Name")
		
		
		LB_SetColumnWidths(->SD2_abo_LBres; "SRE_t"; 1; 17; 70; 180)
		
		LB_SetEnterable(->SD2_abo_LBres; False:C215; 0)
		
		LB_SetScroll(->SD2_abo_LBres; -3; -2)
		
		INT_SetLongintCheckFormat(->SD_ai_ResultCodes)
		INT_SetLongintCheckFormat(->SD_ai_ActionCodes)
		INT_SetLongintCheckFormat(->SD_ai_ActionCodesOSW)
		
		If ([PERSONNEL_GROUPS:92]x_ID:12=0)
			[PERSONNEL_GROUPS:92]x_ID:12:=AA_GetNextIDinMethod(->[PERSONNEL_GROUPS:92]x_ID:12)
		End if 
		
		SD_LoadPrefs(-([PERSONNEL_GROUPS:92]x_ID:12)*10)  //the *10 is because other wise might get a -1
		//which would clash with the default
		PersonGr_InLPB
		WS_at_PersonGroupTab:=1
		
		
		LB_SetupListbox(->PER_LB_volumeAccess; "PER_t"; "PER_L"; 1; ->MOD_at_ModuleName; ->MOD_abo_AccessBoolean; ->MOD_abo_DisableVolume; ->MOD_abo_ReadOnly; ->MOD_abo_NoDeletion; ->MOD_abo_ShowIcon; ->MOD_abo_ShowLabel; ->MOD_al_ShowIcon; ->MOD_al_ShowLabel; ->MOD_al_ModuleAccessStatus; ->SRPrice; ->SRRate; ->MOD_al_InitStartup; ->MOD_abo_InitStartup; ->MOD_al_DisableVolume)
		
		
		LB_SetColumnHeaders(->PER_LB_volumeAccess; "PER_L"; 1; "Volume"; "Access"; "Disable"; "Read Only"; "No Deletion"; "Show Icon"; "Show Label"; "INV ShowIcon"; "INV ShowLabel"; "INVAccess"; "INV ReadOnly"; "Inv_No DEL"; "INV Init"; "Inv InitBoolean"; "Inv Disable")
		
		LB_SetColumnWidths(->PER_LB_volumeAccess; "PER_t"; 1; 100; 50; 0; 50; 50; 50; 0; 0; 0; 0; 0; 0; 0; 0; 0)
		
		//Note: the disable at group level is hidden so it cant be set but all the code is there to suppot it
		
		LB_SetEnterable(->PER_LB_volumeAccess; False:C215; 0)
		LB_SetEnterable(->PER_LB_volumeAccess; True:C214; 2)
		LB_SetEnterable(->PER_LB_volumeAccess; True:C214; 3)
		LB_SetEnterable(->PER_LB_volumeAccess; True:C214; 4)
		LB_SetEnterable(->PER_LB_volumeAccess; True:C214; 5)
		LB_SetEnterable(->PER_LB_volumeAccess; True:C214; 6)
		LB_SetScroll(->PER_LB_volumeAccess; -3; -2)
		LB_StyleSettings(->PER_LB_volumeAccess; "Black"; 9; "PER_t"; ->[PERSONNEL:11])
		LB_Setdividers(->PER_LB_volumeAccess; 0; 0)  //Both on
		In_ButtChkDis(->vButtDisPerGroup)
		
		DB_SetInputFormMenu(Table:C252(->[PERSONNEL_GROUPS:92]); "PersonnelGroup_In")
		If (Records in selection:C76([PERSONNEL_GROUPS:92])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		//GRP_lb_RecordStates
		
		
		
		LB_SetupListbox(->GRP_lb_RecordStates; "STAT_t"; "STAT_L"; 1; ->CU_at_CodeUse; ->SVS_at_PreviewTypeN; ->CU_ai_CodeUsed; ->GEN_ar_Value)
		LB_SetColumnHeaders(->GRP_lb_RecordStates; "STAT_L"; 1; "State"; "Name"; "Access"; "RO"; "No Deletion"; "Show Icon"; "Show Label"; "INV ShowIcon"; "INV ShowLabel"; "INVAccess"; "INV ReadOnly"; "Inv_No DEL"; "INV Init"; "Inv InitBoolean"; "Inv Disable")
		LB_SetColumnWidths(->GRP_lb_RecordStates; "STAT_t"; 1; 46; 110; 36; 36; 72)
		LB_StyleSettings(->GRP_lb_RecordStates; "Black"; 9; "PER_t"; ->[PERSONNEL:11])
		
		
		
	: ($_l_Event=On Activate:K2:9)
		DB_SetInputFormMenu(Table:C252(->[PERSONNEL_GROUPS:92]); "PersonnelGroup_In")
		OpenHelp(Table:C252(->[PERSONNEL_GROUPS:92]); WIN_t_CurrentInputForm)
		
		In_ButtChkDis(->vButtDisPerGroup)
		
		If (Records in selection:C76([PERSONNEL_GROUPS:92])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
	: ($_l_Event=On Menu Selected:K2:14)
		DB_SetInputFormMenu(Table:C252(->[PERSONNEL_GROUPS:92]); "PersonnelGroup_In")
		In_ButtChkDis(->vButtDisPerGroup)
		If (Records in selection:C76([PERSONNEL_GROUPS:92])<=1)
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
				In_ButtCall("PersonGr_InLPA"; ""; "Minor_DelSin"; ->[PERSONNEL_GROUPS:92]; ->[PERSONNEL_GROUPS:92]Group_Code:1; "Personnel"; "1"; "PersonGr_InLPB"; ""; ""; ""; ->[IDENTIFIERS:16]; ->vButtDisPerGroup)
		End case 
	: ($_l_Event=On Data Change:K2:15)
		Case of 
			: (Modified:C32([PERSONNEL_GROUPS:92]Group_Code:1))
				RemoveLeadTr(Uppercase:C13([PERSONNEL_GROUPS:92]Group_Code:1); ->[PERSONNEL_GROUPS:92]Group_Code:1)
				
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[PERSONNEL_GROUPS:92]Group_Code:1)
			: (Modified:C32([PERSONNEL_GROUPS:92]Group_Name:2))
				[PERSONNEL_GROUPS:92]Group_Name:2:=Uppers2([PERSONNEL_GROUPS:92]Group_Name:2)
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[PERSONNEL_GROUPS:92]Group_Name:2)
		End case 
		
		LB_SetupListbox(->SD2_lb_Actions; "SD2_t"; "SD2_L"; 1; ->SD_ai_ActionCodes; ->SD_at_ActionCodes; ->SD_at_DiaryActionNames; ->SD_al_ActionTime; ->SD_ai_ActionCodesOSW; ->SD_at_ActioncodesOST; ->SD_al_ActionCodesOST)
		LB_SetColumnHeaders(->SD2_lb_Actions; "SD2_L"; 1; "Available"; "Action Code"; ""; "Default Amt Time"; "On Screen Reminder"; "Default Reminder Timing"; "")
		
		LB_SetColumnWidths(->SD2_lb_Actions; "SD2_t"; 1; 17; 170; 40; 26; 40; 60; 0)
		
		LB_SetEnterable(->SD2_lb_Actions; False:C215; 0)
		//LB_SetEnterable (->SD2_lb_Actions;True;1)
		
		LB_SetScroll(->SD2_lb_Actions; -3; -2)
		LB_StyleSettings(->SD2_lb_Actions; "Black"; 9; "SD2_t"; ->[ACCOUNTS:32])
		
	: ($_l_Event=On Clicked:K2:4)
		Case of 
			: (BAR_t_Button#"")
				$_l_ButtonNumber:=Num:C11(BAR_t_Button)
				If ($_l_ButtonNumber>1)
					ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_ButtonNumber-1}
					$_l_ModuleRow:=Find in array:C230(MOD_al_ModuleBarNum; ModuleNumber)
					DB_SetBrowserBarSelection($_l_ModuleRow; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
					DB_SetInputFormMenu(Table:C252(->[PERSONNEL_GROUPS:92]); "PersonnelGroup_In")
					
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
ERR_MethodTrackerReturn("PersonGr_InLP"; $_t_oldMethodName)
