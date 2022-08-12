
If (False:C215)
	//Object Name:      [USER].User_In
	//------------------ Script Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   25/10/2012 10:46
	//Created BY:  Nigel Greenlee
	
	//Date Modified:
	//Modified By: DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(<>ExportInstalled)
	//C_UNKNOWN(B_ModPath)
	//C_UNKNOWN(b_ModPriority)
	//C_UNKNOWN(USR_bo_ECEnabled)
	//C_UNKNOWN(USR_bo_EWEnabled)
	//C_UNKNOWN(iOK)
	//C_UNKNOWN(ModuleNumber)
	//C_UNKNOWN(rSMS2)
	//C_UNKNOWN(SMS_From)
	//C_UNKNOWN(SMS_OneOrTwoWay)
	//C_UNKNOWN(USR_hl_DataManList)
	//C_UNKNOWN(vButtDisUSER)
	//C_UNKNOWN(WS_GoPage)
	//ARRAY BOOLEAN(CAT_abo_IsAvailable;0)
	//ARRAY BOOLEAN(PROD_lb_Catalogues;0)
	//ARRAY BOOLEAN(SD_lb_Priorities;0)
	//ARRAY BOOLEAN(SD2_abo_LBres;0)
	//ARRAY BOOLEAN(SD2_lb_Actions;0)
	//ARRAY BOOLEAN(SMTP_abo_UserPassSSL;0)
	//ARRAY BOOLEAN(SVS_lb_CallPriorities;0)
	//ARRAY BOOLEAN(USR_lb_TablesCodes;0)
	//ARRAY BOOLEAN(USR_lb_TabletoReindex;0)
	//ARRAY BOOLEAN(USR_lb_UserToTrack;0)
	//ARRAY DATE(CAT_ad_CatalogueAvaialbeTo;0)
	//ARRAY DATE(CAT_ad_CatalogueAvailableFrom;0)
	//ARRAY INTEGER(CAT_aI_CatalogueDF;0)
	//ARRAY INTEGER(CAT_aI_CatalogueEXC;0)
	//ARRAY INTEGER(CAT_aI_CatalogueINC;0)
	//ARRAY INTEGER(DB_aI_TableIndexer;0)
	//ARRAY INTEGER(DM_ai_UserTrackActive;0)
	//ARRAY INTEGER(SD_ai_ActionCodes;0)
	//ARRAY INTEGER(SD_ai_ActionCodesOSW;0)
	//ARRAY INTEGER(SD_aI_PriorityDF;0)
	//ARRAY INTEGER(SD_ai_ResultCodes;0)
	//ARRAY INTEGER(WS_aI_NumberHasBackslash;0)
	//ARRAY INTEGER(WS_aI_NumberIncludesOfficecode;0)
	//ARRAY INTEGER(WS_aI_Numberofleadingzeros;0)
	//ARRAY INTEGER(WS_aI_NumberTableID;0)
	//ARRAY INTEGER(WS_aI_NumberUsesMultiNumber;0)
	//ARRAY LONGINT(CAT_al_CatalogueClass;0)
	//ARRAY LONGINT(CAT_al_CatalogueID;0)
	//ARRAY LONGINT(CAT_al_CatalogueImageSource;0)
	//ARRAY LONGINT(CAT_al_SupportedPicTypes;0)
	//ARRAY LONGINT(DB_al_TableNumbers;0)
	//ARRAY LONGINT(DB_al_UserTabPage;0)
	//ARRAY LONGINT(GEN_al_AuthenticationTypes;0)
	//ARRAY LONGINT(MOD_al_ModuleBarNum;0)
	//ARRAY LONGINT(MOD_al_ModuleBarOffsets;0)
	//ARRAY LONGINT(SD_al_ActionCodesOST;0)
	//ARRAY LONGINT(SD_al_ActionTime;0)
	//ARRAY LONGINT(SD_al_PriorityNUM;0)
	//ARRAY LONGINT(SMTP_al_UserAuthActive;0)
	//ARRAY LONGINT(SMTP_al_UserAuthType;0)
	//ARRAY LONGINT(SMTP_al_UserIDs;0)
	//ARRAY LONGINT(STK_al_CallLocations;0)
	//ARRAY LONGINT(SVS_al_PriorityNumbers;0)
	//ARRAY LONGINT(WS_al_NumberCurrentValue;0)
	//ARRAY TEXT(<>SYS_at_RecStateCodes;0)
	//ARRAY TEXT(<>SYS_at_RecStateNames;0)
	//ARRAY TEXT(CAT_at_CatalogueClass;0)
	//ARRAY TEXT(CAT_at_CatalogueImagePath;0)
	//ARRAY TEXT(CAT_at_CatalogueNames;0)
	//ARRAY TEXT(CAT_at_ImageSources;0)
	//ARRAY TEXT(DB_at_FontNames;0)
	//ARRAY TEXT(DB_at_TableNames;0)
	//ARRAY TEXT(DB_at_UserInitials;0)
	//ARRAY TEXT(DB_at_USERTAB;0)
	//ARRAY TEXT(DM_at_UserNames;0)
	//ARRAY TEXT(GEN_at_AuthenticationType;0)
	//ARRAY TEXT(PROD_at_ProductEntryForm;0)
	//ARRAY TEXT(PROD_at_ProductEntryFunction;0)
	//ARRAY TEXT(SD_at_ActionCodes;0)
	//ARRAY TEXT(SD_at_ActioncodesOST;0)
	//ARRAY TEXT(SD_at_ActionResultTab;0)
	//ARRAY TEXT(SD_at_DiaryActionNames;0)
	//ARRAY TEXT(SD_at_PriorityNM;0)
	//ARRAY TEXT(SD_at_ResultCodes;0)
	//ARRAY TEXT(SD_at_ResultNames;0)
	//ARRAY TEXT(SMTP_at_UserAuthName;0)
	//ARRAY TEXT(SMTP_at_UserAuthPass;0)
	//ARRAY TEXT(SP_at_ScriptCode;0)
	//ARRAY TEXT(SVS_at_CallLocationCodes;0)
	//ARRAY TEXT(SVS_at_CallLocations;0)
	//ARRAY TEXT(SVS_at_CallStateCodes;0)
	//ARRAY TEXT(SVS_at_CallStates;0)
	//ARRAY TEXT(SVS_at_priorityNames;0)
	//ARRAY TEXT(SVS_at_ResponseTypes;0)
	//ARRAY TEXT(WS_at_TableName;0)
	C_BOOLEAN:C305(<>ExportInstalled; CAT_bo_CataloguesEnabled; CAT_bo_MaintainAllProds; CAT_bo_MaintainPriceList; USR_bo_ECEnabled; USR_bo_EWEnabled; DB_bo_NoLoad; DSPLY_bo_DisplayProgressBars; DSS_bo_Enabled; EW_bo_ModifiedSettings; JC_bo_PostActualTime)
	C_BOOLEAN:C305(JC_bo_PostBudgetTime; JC_bo_PostWIP; PAL_bo_ButtonSubFunction; SD_bo_ChangePrefs; SD_bo_ResultsDialog; SD_bo_ResultsDialogSequence; SD_bo_SaturdayWork; SD_bo_SundayWork; SMTP_bo_ArraysInited; <>EcommerceInstalled; CAT_bo_CataloguesEnabled)
	C_BOOLEAN:C305(CAT_bo_MaintainAllProds; CAT_bo_MaintainPriceList; DB_bo_NoLoad; DSPLY_bo_DisplayProgressBars; DSS_bo_Enabled; EW_bo_ModifiedSettings; JC_bo_ActivateProcessServices; JC_bo_PostActualTime; JC_bo_PostBudgetTime; JC_bo_PostWIP; PAL_bo_ButtonSubFunction)
	C_BOOLEAN:C305(SD_bo_ChangePrefs; SD_bo_ResultsDialog; SD_bo_ResultsDialogSequence; SD_bo_SaturdayWork; SD_bo_SundayWork; SMTP_bo_ArraysInited)
	C_LONGINT:C283($_l_CatalogCount; $_l_CurrentElement; $_l_FormEvent; $_l_Index; $_l_MajorVersion; $_l_ModulePosition; $_l_PagePosition; $_l_ServiceCallsTable; B_ModPath; b_ModPriority; BP_HL_l_Mins)
	C_LONGINT:C283(BP_HL_l_tens; CAT_l_BUT1; CAT_l_But2; CAT_l_BUT3; CAT_l_BUT4; CAT_l_BUT5; CAT_l_BUT6; CAT_l_BUT7; CAT_l_BUT8; CAT_l_PictureSource; CB_l_AllProds)
	C_LONGINT:C283(CB_l_PriceList; DB_l_ButtonClickedFunction; DB_l_CBShowLinkedRecord; DB_l_TrackPath; DB_l_WindowCurrentModule; DI_l_BUT1; DI_l_But2; DI_l_BUT3; DI_l_BUT5; DI_l_BUT6; DI_l_BUT7)
	C_LONGINT:C283(DI_l_BUT8; DI_l_BUT9; DSS_l_CB_DSSExport; iOK; ModuleNumber; PRI_l_BUT1; PRI_l_But2; PRI_l_BUT4; PRI_l_BUT5; PRI_l_BUT6; PRI_l_BUT7)
	C_LONGINT:C283(PRI_l_BUT8; PRI_l_BUT9; PROD_l_SimpleProdEntry; SD_CB_l_result; SD_CB_l_resultSequences; SD_l_SaturdayWork; SD2_l_BUT1; SD2_l_But2; SD2_l_BUT3; SD2_l_BUT4; SD2_l_BUT5)
	C_LONGINT:C283(SD2_l_BUT6; SD2_l_BUT7; SD2_l_BUT8; SD2_l_BUT9; SMS_OneOrTwoWay; SMTP_l_GeneralPassActive; SMTP_l_GeneralPassType; SRE_l_BUT1; SRE_l_But2; SRE_l_BUT3; SRE_l_BUT4)
	C_LONGINT:C283(SRE_l_BUT5; SRE_l_BUT6; SRE_l_BUT7; SRE_l_BUT8; SVS_l_BUT1; SVS_l_But2; SVS_l_BUT3; SVS_l_BUT4; SVS_l_BUT5; SVS_l_BUT6; SVS_l_BUT7)
	C_LONGINT:C283(SVS_l_BUT8; SVS_l_BUT9; SVS_l_DefaultLocationID; SYS_cb_PostActualTime; SYS_cb_PostBudgetTime; SYS_cb_PostWIP; SYS_l_ActivateProcessServices; Sys_l_DisplayProgressBars; USR_hl_DataManList; USR_l_BUT1; USR_l_But2)
	C_LONGINT:C283(USR_l_BUT3; USR_l_BUT4; USR_l_BUT6; USR_l_BUT7; USR_l_BUT8; USR_l_BUT9; UTR_l_BUT1; UTR_l_But2; UTR_l_BUT3; UTR_l_BUT4; UTR_l_BUT5)
	C_LONGINT:C283(UTR_l_BUT6; UTR_l_BUT8; UTR_l_BUT9; WS_GoPage; WS_l_CB_CATALOGUES; WS_l_CB_DataExport; WS_l_CB_DSSExport; WS_l_CB_Ecommerce; $_l_ButtonNumber; $_l_CatalogCount; $_l_CurrentElement)
	C_LONGINT:C283($_l_FormEvent; $_l_Index; $_l_MajorVersion; $_l_ModulePosition; $_l_PagePosition; $_l_ServiceCallsTable; BP_HL_l_Hours; BP_HL_l_Mins; BP_HL_l_tens; CAT_l_BUT9; CAT_l_PictureSource)
	C_LONGINT:C283(CB_l_AllProds; CB_l_PriceList; DB_l_ButtonClickedFunction; DB_l_TrackPath; DB_l_WindowCurrentModule; DI_l_BUT4; DSS_l_CB_DSSExport; PRI_l_BUT3; PROD_l_SimpleProdEntry; SD_CB_l_result; SD_CB_l_resultSequences)
	C_LONGINT:C283(SD_l_SaturdayWork; SD_l_SundayWork; SMTP_l_AUTH; SMTP_l_GeneralPassActive; SMTP_l_GeneralPassType; SRE_l_BUT9; SVS_l_DefaultLocationID; SVS_l_DefaultResponseType; SYS_cb_PostActualTime; SYS_cb_PostBudgetTime; SYS_cb_PostWIP)
	C_LONGINT:C283(SYS_l_ActivateProcessServices; Sys_l_DisplayProgressBars; USR_l_BUT5; UTR_l_BUT7; WS_l_CB_DataExport; WS_l_CB_DSSExport; WS_l_CB_Ecommerce)
	C_REAL:C285(rSMS2; rSMS1)
	C_TEXT:C284($_t_FormName; $_t_MajorVersion; $_t_oldMethodName; $_t_PalleteButton; BAR_t_Button; CAT_t_COL1; CAT_t_COL2; CAT_t_COL3; CAT_t_COL4; CAT_t_COL5; CAT_t_COL7)
	C_TEXT:C284(CAT_t_COL8; CAT_t_COL9; CAT_t_HED1; CAT_t_HED2; CAT_t_HED3; CAT_t_HED4; CAT_t_HED5; CAT_t_HED6; CAT_t_HED7; CAT_t_HED9; CAT_t_PictureNaming)
	C_TEXT:C284(CAT_T_PicturePath; DI_t_COL1; DI_t_COL2; DI_t_COL3; DI_t_COL4; DI_t_COL5; DI_t_COL6; DI_t_COL7; DI_t_COL9; DI_t_HED1; DI_t_HED2)
	C_TEXT:C284(DI_t_HED3; DI_t_HED4; DI_t_HED5; DI_t_HED6; DI_t_HED7; DI_t_HED8; DI_t_HED9; PRI_t_COL1; PRI_t_COL2; PRI_t_COL3; PRI_t_COL4)
	C_TEXT:C284(PRI_t_COL5; PRI_t_COL6; PRI_t_COL7; PRI_t_COL8; PRI_t_COL9; PRI_t_HED1; PRI_t_HED3; PRI_t_HED4; PRI_t_HED5; PRI_t_HED6; PRI_t_HED7)
	C_TEXT:C284(PRI_t_HED8; PRI_t_HED9; SD_t_PriorityName; SD2_t_COL1; SD2_t_COL2; SD2_t_COL4; SD2_t_COL5; SD2_t_COL6; SD2_t_COL7; SD2_t_COL8; SD2_t_COL9)
	C_TEXT:C284(SD2_t_HED1; SD2_t_HED2; SD2_t_HED3; SD2_t_HED4; SD2_t_HED6; SD2_t_HED7; SD2_t_HED8; SD2_t_HED9; SMS_From; SMTP_t_GeneralPassAuth; SMTP_t_GeneralPassName)
	C_TEXT:C284(SRE_t_COL1; SRE_t_COL2; SRE_t_COL3; SRE_t_COL5; SRE_t_COL6; SRE_t_COL7; SRE_t_COL8; SRE_t_COL9; SRE_t_HED1; SRE_t_HED2; SRE_t_HED3)
	C_TEXT:C284(SRE_t_HED4; SRE_t_HED5; SRE_t_HED7; SRE_t_HED8; SRE_t_HED9; SVS_t_COL1; SVS_t_COL2; SVS_t_COL3; SVS_t_COL4; SVS_t_COL5; SVS_t_COL6)
	C_TEXT:C284(SVS_t_COL7; SVS_t_COL9; SVS_t_HED1; SVS_t_HED2; SVS_t_HED3; SVS_t_HED4; SVS_t_HED5; SVS_t_HED6; SVS_t_HED7; SVS_t_HED8; SVS_t_HED9)
	C_TEXT:C284(SVS_t_ResolvedCallState; SVS_t_resolvedStateNM; SYS_t_VersionNumber; USR_t_COL1; USR_t_COL2; USR_t_COL3; USR_t_COL4; USR_t_COL5; USR_t_COL6; USR_t_COL7; USR_t_COL9)
	C_TEXT:C284(USR_t_HED1; USR_t_HED2; USR_t_HED3; USR_t_HED4; USR_t_HED5; USR_t_HED6; USR_t_HED7; USR_t_HED8; USR_t_HED9; UTR_t_COL2; UTR_t_COL3)
	C_TEXT:C284(UTR_t_COL4; UTR_t_COL5; UTR_t_COL6; UTR_t_COL7; UTR_t_COL8; UTR_t_COL9; UTR_t_HED1; UTR_t_HED2; UTR_t_HED4; UTR_t_HED5; UTR_t_HED6)
	C_TEXT:C284(UTR_t_HED7; UTR_t_HED8; UTR_t_HED9; vButtDisUSER; WIN_t_CurrentInputForm; <>SYS_t_VersionNumber; $_t_FormName; $_t_MajorVersion; $_t_oldMethodName; $_t_PalleteButton; BAR_t_Button)
	C_TEXT:C284(CAT_t_COL6; CAT_t_HED8; CAT_t_PictureNaming; CAT_T_PicturePath; DI_t_COL8; PAL_BUTTON; PRI_t_HED2; SD2_t_COL3; SD2_t_HED5; SMTP_t_GeneralPassAuth; SMTP_t_GeneralPassName)
	C_TEXT:C284(SRE_t_COL4; SRE_t_HED6; SVS_t_COL8; SVS_t_LocationName; SVS_t_ResolvedCallState; SVS_t_resolvedStateNM; SYS_t_VersionNumber; USR_t_COL8; UTR_t_COL1; UTR_t_HED3; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [USER].User_In"; Form event code:C388)
$_l_FormEvent:=Form event code:C388


Case of 
	: ($_l_FormEvent=On Header:K2:17)  //| ($_l_FormEvent=On Resize )
		
		
		ARRAY TEXT:C222(SP_at_ScriptCode; 0)
		WS_AutoscreenSize(2; 520; 730)
		If ($_l_FormEvent=On Resize:K2:27)
			
			INT_SetInput(Table:C252(->[USER:15]); WIN_t_CurrentInputForm)
		End if 
		
	: ($_l_FormEvent=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		DB_SetnewToolBar
		OpenHelp(Table:C252(->[USER:15]); "User_In")
		WS_l_CB_DSSExport:=0
		SD_LoadPrefs(-1)
		
		
		LB_SetupListbox(->SD2_lb_Actions; "SD2_t"; "SD2_L"; 1; ->SD_ai_ActionCodes; ->SD_at_ActionCodes; ->SD_at_DiaryActionNames; ->SD_al_ActionTime; ->SD_ai_ActionCodesOSW; ->SD_at_ActioncodesOST; ->SD_al_ActionCodesOST)
		LB_SetColumnHeaders(->SD2_lb_Actions; "SD2_L"; 1; "Available"; "Action Code"; ""; "Default Amt Time"; "On Screen Reminder"; "Default Reminder Timing"; "")
		LB_SetColumnWidths(->SD2_lb_Actions; "SD2_t"; 1; 17; 170; 40; 26; 40; 60; 0)
		LB_SetEnterable(->SD2_lb_Actions; False:C215; 0)
		//LB_SetEnterable (->SD2_lb_Actions;True;1)
		
		LB_SetScroll(->SD2_lb_Actions; -3; -2)
		LB_StyleSettings(->SD2_lb_Actions; "Black"; 9; "SD2_t"; ->[ACCOUNTS:32])
		//````
		DB_LoadViewPreference
		SVS_LoadPreferences
		$_t_FormName:=PROD_GetFunctionPref
		//At the moment this is a simple check box..one option no choice of forms or anything..
		PROD_l_SimpleProdEntry:=0
		$_l_ModulePosition:=Find in array:C230(PROD_at_ProductEntryFunction; "Enter Products from sales orders")
		If ($_l_ModulePosition>0)
			If (PROD_at_ProductEntryForm{$_l_ModulePosition}#"")
				PROD_l_SimpleProdEntry:=1
			End if 
		End if 
		ARRAY TEXT:C222(SVS_at_CallLocations; 0)
		ARRAY TEXT:C222(SVS_at_CallLocationCodes; 0)
		ARRAY LONGINT:C221(STK_al_CallLocations; 0)
		QUERY:C277([LOCATIONS:61]; [LOCATIONS:61]LocationID:4=0)
		If (Records in selection:C76([LOCATIONS:61])>0)
			READ WRITE:C146([LOCATIONS:61])
			QUERY:C277([LOCATIONS:61]; [LOCATIONS:61]LocationID:4=0)
			APPLY TO SELECTION:C70([LOCATIONS:61]; [LOCATIONS:61]LocationID:4:=AA_GetNextID(->[LOCATIONS:61]LocationID:4))
		End if 
		QUERY:C277([LOCATIONS:61]; [LOCATIONS:61]ParentLocationID:3=0)  //These are the top level locations.
		
		SELECTION TO ARRAY:C260([LOCATIONS:61]Location_Code:1; SVS_at_CallLocationCodes; [LOCATIONS:61]Location_Name:2; SVS_at_CallLocations; [LOCATIONS:61]LocationID:4; STK_al_CallLocations)
		If (SVS_l_DefaultLocationID>0)
			$_l_ModulePosition:=Find in array:C230(STK_al_CallLocations; SVS_l_DefaultLocationID)
			If ($_l_ModulePosition>0)
				SVS_t_LocationName:=SVS_at_CallLocations{$_l_ModulePosition}
			Else 
				SVS_t_LocationName:=""
				STK_al_CallLocations:=0
			End if 
		End if 
		
		ARRAY TEXT:C222(SVS_at_ResponseTypes; 3)
		SVS_at_ResponseTypes{1}:="Minutes"
		SVS_at_ResponseTypes{2}:="Hours"
		SVS_at_ResponseTypes{3}:="Days"
		SVS_at_ResponseTypes:=SVS_l_DefaultResponseType
		SVS_t_resolvedStateNM:=SVS_GetStateName(->SVS_t_ResolvedCallState; True:C214)
		ARRAY TEXT:C222(SVS_at_CallStateCodes; 0)
		ARRAY TEXT:C222(SVS_at_CallStates; 0)
		If (Size of array:C274(<>SYS_at_RecStateCodes)>Table:C252(->[SERVICE_CALLS:20]))  //It should be
			
			$_l_ServiceCallsTable:=Table:C252(->[SERVICE_CALLS:20])
			For ($_l_Index; 1; Size of array:C274(<>SYS_at_RecStateCodes{$_l_ServiceCallsTable}))
				APPEND TO ARRAY:C911(SVS_at_CallStates; Substring:C12(<>SYS_at_RecStateNames{$_l_ServiceCallsTable}{$_l_Index}; 1; 51))
				APPEND TO ARRAY:C911(SVS_at_CallStateCodes; (String:C10($_l_ServiceCallsTable; "000"))+<>SYS_at_RecStateCodes{$_l_ServiceCallsTable}{$_l_Index})
			End for 
		End if 
		LB_SetupListbox(->SVS_lb_CallPriorities; "SVS_t"; "SVS_L"; 1; ->SVS_al_PriorityNumbers; ->SVS_at_priorityNames)
		LB_SetColumnHeaders(->SVS_lb_CallPriorities; "SVS_L"; 1; "Number"; "Name")
		LB_SetColumnWidths(->SVS_lb_CallPriorities; "SVS_t"; 1; 22; 61)
		LB_SetEnterable(->SVS_lb_CallPriorities; False:C215; 0)
		LB_SetEnterable(->SVS_lb_CallPriorities; True:C214; 2)
		LB_StyleSettings(->SVS_lb_CallPriorities; "Black"; 9; "SVS_t"; ->[SERVICE_CALLS:20])
		
		
		SP_LoadGenPrefs
		If (Not:C34(SMTP_bo_ArraysInited))
			ARRAY LONGINT:C221(SMTP_al_UserIDs; 0)
			ARRAY LONGINT:C221(SMTP_al_UserAuthActive; 0)
			ARRAY LONGINT:C221(SMTP_al_UserAuthType; 0)
			ARRAY TEXT:C222(SMTP_at_UserAuthName; 0)
			ARRAY TEXT:C222(SMTP_at_UserAuthPass; 0)
			ARRAY BOOLEAN:C223(SMTP_abo_UserPassSSL; 0)
			SMTP_bo_ArraysInited:=True:C214
		End if 
		SYS_LOADSMTPAUTH(False:C215; ->SMTP_l_AUTH; ->SMTP_l_GeneralPassActive; ->SMTP_l_GeneralPassType; ->SMTP_t_GeneralPassName; ->SMTP_t_GeneralPassAuth; ->SMTP_al_UserIDs; ->SMTP_al_UserAuthActive; ->SMTP_al_UserAuthType; ->SMTP_at_UserAuthName; ->SMTP_at_UserAuthPass; ->SMTP_abo_UserPassSSL)  //note here we are only loading the arrays.and system settings
		
		
		//GEN_at_AuthenticationType:=Find in array(GEN__al_AuthenticationTypes;SMTP_al_UserAuthType)
		GEN_at_AuthenticationType:=Find in array:C230(GEN_al_AuthenticationTypes; SMTP_l_GeneralPassType)  //kmw 28/07/08 -corrected from using array value of "SMTP_al_UserAuthType" to using longint value "SMTP_l_GeneralPassType"
		
		
		
		OBJECT SET VISIBLE:C603(*; "oUseGenAuthentication"; (SMTP_l_AUTH=1))
		OBJECT SET VISIBLE:C603(*; "oAuthTypeLabel"; (SMTP_l_AUTH=1))
		OBJECT SET VISIBLE:C603(*; "oAuthUserLabel"; (SMTP_l_AUTH=1))
		OBJECT SET VISIBLE:C603(*; "oAuthPassLabel"; (SMTP_l_AUTH=1))
		OBJECT SET VISIBLE:C603(*; "OauthTypes"; (SMTP_l_AUTH=1))
		OBJECT SET VISIBLE:C603(SMTP_t_GeneralPassName; (SMTP_l_AUTH=1))
		OBJECT SET VISIBLE:C603(SMTP_t_GeneralPassAuth; (SMTP_l_AUTH=1))
		
		CAT_LoadPrefs
		CB_l_PriceList:=Num:C11(CAT_bo_MaintainPriceList)
		CB_l_AllProds:=Num:C11(CAT_bo_MaintainAllProds)
		DF_LoadProdPriceSettings
		DF_LoadOrderEntryOption
		PO_LoadDFPriceGroup
		//NG March 2004 new lines added here
		CAT_at_ImageSources:=0
		If (CAT_l_PictureSource=1)  //images on disk
			
			OBJECT SET VISIBLE:C603(*; "oCat_T_PicPat"; True:C214)
			OBJECT SET VISIBLE:C603(CAT_T_PicturePath; True:C214)
			OBJECT SET VISIBLE:C603(B_ModPath; True:C214)
			OBJECT SET VISIBLE:C603(*; "oCat_T_PicPat"; True:C214)
			OBJECT SET VISIBLE:C603(*; "oCat_T_PicPPop"; True:C214)
			OBJECT SET VISIBLE:C603(CAT_t_PictureNaming; True:C214)
			
			
		Else 
			OBJECT SET VISIBLE:C603(*; "oCat_T_PicPat"; False:C215)
			OBJECT SET VISIBLE:C603(CAT_T_PicturePath; False:C215)
			OBJECT SET VISIBLE:C603(B_ModPath; False:C215)
			OBJECT SET VISIBLE:C603(*; "oCat_T_PicPat"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oCat_T_PicPPop"; False:C215)
			OBJECT SET VISIBLE:C603(CAT_t_PictureNaming; False:C215)
			
		End if 
		//NG March 2004 end of new lines
		Ecommerce_LoadPrefs  // 29/10/02 pb
		EW_LoadPrefs  // Export Wizard (data interchange) 31/010/02 pb
		
		
		//************ added 23/2/7-kmw ************
		JC_LoadPrefs
		If (JC_bo_PostBudgetTime=True:C214)
			SYS_cb_PostBudgetTime:=1
		Else 
			SYS_cb_PostBudgetTime:=0
		End if 
		If (JC_bo_PostActualTime=True:C214)
			SYS_cb_PostActualTime:=1
		Else 
			SYS_cb_PostActualTime:=0
		End if 
		If (JC_bo_PostWIP=True:C214)
			SYS_cb_PostWIP:=1
		Else 
			SYS_cb_PostWIP:=0
		End if 
		//**************************************
		//************ added 12/04/07-kmw ***********
		JC_LoadPrefs2
		If (JC_bo_ActivateProcessServices=True:C214)
			SYS_l_ActivateProcessServices:=1
		Else 
			SYS_l_ActivateProcessServices:=0
		End if 
		//**************************************
		//************ added 27/06/08-kmw ************
		DSPLY_LoadPrefs
		If (DSPLY_bo_DisplayProgressBars=True:C214)
			Sys_l_DisplayProgressBars:=1
		Else 
			Sys_l_DisplayProgressBars:=0
		End if 
		//**************************************
		
		DSS_LoadPrefs
		DB_LoadErrorTrackPrefs
		ORD_DeliveryDatePrefs
		DB_LoadDatacheckPrefs
		
		LB_SetupListbox(->USR_lb_TabletoReindex; "DI_t"; "DI_L"; 1; ->DB_aI_TableIndexer; ->DB_at_TableNames; ->DB_al_TableNumbers)
		
		LB_SetColumnHeaders(->USR_lb_TabletoReindex; "DI_L"; 1; "Check"; "Table"; "Num")
		
		LB_SetColumnWidths(->USR_lb_TabletoReindex; "DI_t"; 1; 30; 120; 0)
		
		LB_SetEnterable(->USR_lb_TabletoReindex; False:C215; 0)
		LB_SetEnterable(->USR_lb_TabletoReindex; True:C214; 1)
		LB_SetScroll(->USR_lb_TabletoReindex; -3; -2)
		
		LB_StyleSettings(->USR_lb_TabletoReindex; "Black"; 9; "DI_t"; ->[COMPANIES:2])
		
		BK_LoadSettings
		
		//************BSW 21/01/03 This loads backup sync prefs
		BP_UserIn13
		Doc_userIn13  //Mon, Nov 28, 2005 bwalia: Document print/PDF/Email attachment options
		
		
		//************BSW 21/01/03 This loads backup sync prefs
		
		EW_bo_ModifiedSettings:=False:C215  // 4/11/02 pb
		
		SYS_t_VersionNumber:=<>SYS_t_VersionNumber
		$_t_MajorVersion:=SYS_t_VersionNumber[[1]]
		$_l_MajorVersion:=Num:C11($_t_MajorVersion)
		$_l_MajorVersion:=$_l_MajorVersion-4
		$_t_MajorVersion:=String:C10($_l_MajorVersion)
		SYS_t_VersionNumber:=$_t_MajorVersion+Substring:C12(SYS_t_VersionNumber; 2; Length:C16(SYS_t_VersionNumber))
		
		
		INT_SetLongintCheckFormat(->SD_ai_ActionCodes)
		
		INT_SetLongintCheckFormat(->SD_ai_ActionCodesOSW)
		INT_SetLongintCheckFormat(->SD_ai_ActionCodesOSW)
		
		
		INT_SetLongintCheckFormat(->CAT_al_SupportedPicTypes)
		
		If (Is macOS:C1572)
			
			OBJECT SET VISIBLE:C603(*; "oCat_MAC@"; True:C214)
			OBJECT SET VISIBLE:C603(*; "oCat_PC@"; False:C215)
		Else 
			OBJECT SET VISIBLE:C603(*; "oCat_MAC@"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oCat_PC@"; True:C214)
		End if 
		INT_SetLongintCheckFormat(->DB_aI_TableIndexer)
		SD_bo_ChangePrefs:=False:C215
		//Cache_Initialise
		
		WT_CalenderConfig
		ARRAY TEXT:C222(DB_at_FontNames; 0)
		FONT LIST:C460(DB_at_FontNames)
		
		//   ARRAY STRING(55;DB_at_USERTAB;15)
		CAT_LoadCats(-1)
		ARRAY BOOLEAN:C223(CAT_abo_IsAvailable; 0)
		ARRAY BOOLEAN:C223(PROD_lb_Catalogues; 0)
		
		$_l_CatalogCount:=Size of array:C274(CAT_aI_CatalogueDF)
		ARRAY BOOLEAN:C223(CAT_abo_IsAvailable; $_l_CatalogCount)
		For ($_l_index; 1; Size of array:C274(CAT_abo_IsAvailable))
			CAT_abo_IsAvailable{$_l_index}:=(CAT_aI_CatalogueINC{$_l_index}=1)
		End for 
		//`````
		//There are two 'Catalogues' that will be hidden--Reserved Names;'Price List' and 'All Products'
		
		LB_SetupListbox(->PROD_lb_Catalogues; "CAT_t"; "CAT_L"; 1; ->CAT_abo_IsAvailable; ->CAT_at_CatalogueNames; ->CAT_ad_CatalogueAvailableFrom; ->CAT_ad_CatalogueAvaialbeTo; ->CAT_at_CatalogueClass; ->CAT_at_CatalogueImagePath; ->CAT_al_CatalogueID; ->CAT_aI_CatalogueDF; ->CAT_aI_CatalogueINC; ->CAT_aI_CatalogueEXC; ->CAT_al_CatalogueImageSource; ->CAT_al_CatalogueClass)
		
		LB_SetColumnHeaders(->PROD_lb_Catalogues; "CAT_L"; 1; "Default"; "Name"; "From"; "To"; "Type"; ""; ""; ""; ""; ""; ""; "")
		LB_SetColumnWidths(->PROD_lb_Catalogues; "CAT_t"; 1; 30; 120; 50; 50; 80; 0; 0; 0; 0; 0; 0; 0)
		LB_SetEnterable(->PROD_lb_Catalogues; False:C215; 0)
		LB_SetEnterable(->PROD_lb_Catalogues; True:C214; 1)
		LB_SetScroll(->PROD_lb_Catalogues; -3; -2)
		
		LB_StyleSettings(->PROD_lb_Catalogues; "Black"; 9; "CAT_t"; ->[DIARY:12])
		ARRAY TEXT:C222(DB_at_USERTAB; 66)  // SMS page added 29/04/02 pb
		
		//``
		ARRAY LONGINT:C221(DB_al_UserTabPage; 66)  // 5/6/02 pb
		
		
		$_l_CurrentElement:=4
		DB_at_USERTAB{1}:="User_Details"
		DB_al_UserTabPage{1}:=1
		DB_at_USERTAB{2}:="General"
		DB_al_UserTabPage{2}:=2
		DB_at_USERTAB{3}:="Core Data"
		DB_al_UserTabPage{3}:=3
		If ((DB_GetModuleSettingByNUM(Module_StockControl))>0)
			
			DB_at_USERTAB{$_l_CurrentElement}:="Stock Control"
			DB_al_UserTabPage{$_l_CurrentElement}:=$_l_CurrentElement
			$_l_CurrentElement:=$_l_CurrentElement+1
		End if 
		If ((DB_GetModuleSettingByNUM(Module_SalesOrders))>0)
			
			DB_at_USERTAB{$_l_CurrentElement}:="Sales"
			DB_al_UserTabPage{$_l_CurrentElement}:=5
			$_l_CurrentElement:=$_l_CurrentElement+1
		End if 
		If ((DB_GetModuleSettingByNUM(Module_PurchaseOrders))>0)
			
			DB_at_USERTAB{$_l_CurrentElement}:="Purchases"
			DB_al_UserTabPage{$_l_CurrentElement}:=6
			$_l_CurrentElement:=$_l_CurrentElement+1
		End if 
		If ((DB_GetModuleSettingByNUM(Module_SalesLedger))>0)
			
			DB_at_USERTAB{$_l_CurrentElement}:="Accounts"
			DB_al_UserTabPage{$_l_CurrentElement}:=7  //12
			
			$_l_CurrentElement:=$_l_CurrentElement+1
		End if 
		If ((DB_GetModuleSettingByNUM(Module_ServiceCentre))>0)
			
			DB_at_USERTAB{$_l_CurrentElement}:="Call Centre"
			DB_al_UserTabPage{$_l_CurrentElement}:=8  //6
			
			$_l_CurrentElement:=$_l_CurrentElement+1
		End if 
		If ((DB_GetModuleSettingByNUM(Module_JobCosting))>0)
			
			DB_at_USERTAB{$_l_CurrentElement}:="Job Costing"
			DB_al_UserTabPage{$_l_CurrentElement}:=9  //7
			
			$_l_CurrentElement:=$_l_CurrentElement+1
		End if 
		If ((DB_GetModuleSettingByNUM(21))>0) & (False:C215)  //NG april 2004
			
			
			
			DB_at_USERTAB{$_l_CurrentElement}:="Communications"
			DB_al_UserTabPage{$_l_CurrentElement}:=10  //8
			
			$_l_CurrentElement:=$_l_CurrentElement+1
		End if 
		DB_at_USERTAB{$_l_CurrentElement}:="Form Settings 1"
		DB_al_UserTabPage{$_l_CurrentElement}:=11  //10
		
		$_l_CurrentElement:=$_l_CurrentElement+1
		DB_at_USERTAB{$_l_CurrentElement}:="Form Settings 2"
		DB_al_UserTabPage{$_l_CurrentElement}:=12  //10
		
		$_l_CurrentElement:=$_l_CurrentElement+1
		If (False:C215)
			DB_at_USERTAB{$_l_CurrentElement}:="Fax Settings"
			DB_al_UserTabPage{$_l_CurrentElement}:=13  //14
			
			$_l_CurrentElement:=$_l_CurrentElement+1
		End if 
		
		If ((DB_GetModuleSettingByNUM(Module_IntServer))>0) | (True:C214)
			
			DB_at_USERTAB{$_l_CurrentElement}:="Email Settings"
			DB_al_UserTabPage{$_l_CurrentElement}:=14  //15
			
			
			$_l_CurrentElement:=$_l_CurrentElement+1
			DB_at_USERTAB{$_l_CurrentElement}:="SMS Settings"
			DB_al_UserTabPage{$_l_CurrentElement}:=15  //13
			
			
			$_l_CurrentElement:=$_l_CurrentElement+1
		End if 
		DB_at_USERTAB{$_l_CurrentElement}:="Other Settings"
		DB_al_UserTabPage{$_l_CurrentElement}:=16  //13
		
		$_l_CurrentElement:=$_l_CurrentElement+1
		If ([USER:15]SuperDiaryActive:245)
			DB_at_USERTAB{$_l_CurrentElement}:="Time Manager"
			DB_al_UserTabPage{$_l_CurrentElement}:=17
			$_l_CurrentElement:=$_l_CurrentElement+1
		End if 
		
		DB_at_USERTAB{$_l_CurrentElement}:="Sales Pipeline Settings"
		DB_al_UserTabPage{$_l_CurrentElement}:=20
		$_l_CurrentElement:=$_l_CurrentElement+1
		If (Size of array:C274(CAT_al_CatalogueID)>0) | (CAT_bo_CataloguesEnabled)
			CAT_bo_CataloguesEnabled:=True:C214
			DB_at_USERTAB{$_l_CurrentElement}:="Product Catalogues"
			DB_al_UserTabPage{$_l_CurrentElement}:=19
			$_l_CurrentElement:=$_l_CurrentElement+1
		End if 
		If (USR_bo_ECEnabled)
			DB_at_USERTAB{$_l_CurrentElement}:="ecommerce"
			DB_al_UserTabPage{$_l_CurrentElement}:=21
			$_l_CurrentElement:=$_l_CurrentElement+1
			WS_l_CB_Ecommerce:=1
			DB_at_USERTAB{$_l_CurrentElement}:="Connections"
			DB_al_UserTabPage{$_l_CurrentElement}:=27
			$_l_CurrentElement:=$_l_CurrentElement+1
			
		End if 
		If (USR_bo_EWEnabled)
			DB_at_USERTAB{$_l_CurrentElement}:="Data Interchange"
			DB_al_UserTabPage{$_l_CurrentElement}:=22
			$_l_CurrentElement:=$_l_CurrentElement+1
			WS_l_CB_DataExport:=1
		End if 
		DSS_bo_Enabled:=False:C215
		If (DSS_bo_Enabled)
			DB_at_USERTAB{$_l_CurrentElement}:="Web Service Call Intergration"
			DB_al_UserTabPage{$_l_CurrentElement}:=23
			$_l_CurrentElement:=$_l_CurrentElement+1
			DSS_l_CB_DSSExport:=1
		End if 
		If (DB_l_TrackPath=1) | (Current user:C182="Designer")
			DB_at_USERTAB{$_l_CurrentElement}:="Method Debugger"
			DB_al_UserTabPage{$_l_CurrentElement}:=24
			$_l_CurrentElement:=$_l_CurrentElement+1
		End if 
		ARRAY TEXT:C222(DB_at_USERTAB; $_l_CurrentElement-1)  // SMS page added 29/04/02 pb
		ARRAY LONGINT:C221(DB_al_UserTabPage; $_l_CurrentElement-1)  // 5/6/02 pb
		<>EcommerceInstalled:=True:C214  // TEMPORARY!!!!! Delete this when properly set up
		If (<>EcommerceInstalled=False:C215)  // 29/10/02 pb
			
			
			
			
			OBJECT SET ENABLED:C1123(WS_l_CB_Ecommerce; False:C215)
		End if 
		<>ExportInstalled:=True:C214  // TEMPORARY!!!!! Delete this when properly set up
		
		If (<>ExportInstalled=False:C215)
			OBJECT SET ENABLED:C1123(WS_l_CB_DataExport; False:C215)
		End if 
		
		
		//BSW 21/01/03 **************REMOTE BACKUP SYNC**********************
		
		//BSW 21/01/03 **************REMOTE BACKUP SYNC**********************
		User_inAddPreference("Backup Synchronization"; 25)  //Mon, Nov 28, 2005 bwalia: Document PDF print options etc for statements, , other printouts
		User_inAddPreference("Data Checking"; 26)  //Mon, Nov 28, 2005 bwalia: Document PDF print options etc for statements, , other printouts
		
		
		
		User_inAddPreference("Document print settings"; 28)  //Mon, Nov 28, 2005 bwalia: Document PDF print options etc for statements, , other printouts
		
		
		//BSW 21/01/03 **************REMOTE BACKUP SYNC**********************
		User_inAddPreference("Document Email Settings"; 29)  //Mon, Oct 16, 2006 bwalia: Document PDF email options
		
		
		
		DB_at_USERTAB:=1
		WS_GoPage:=1
		WS_AutoscreenSize(2; 560; 730)
		WT_DataManagerListBuild
		ARRAY INTEGER:C220(SD_aI_PriorityDF; 0)
		
		OBJECT SET ENABLED:C1123(b_ModPriority; False:C215)
		If ([USER:15]SuperDiaryActive:245)
			
			SD_l_SaturdayWork:=Num:C11(SD_bo_SaturdayWork)
			SD_l_SundayWork:=Num:C11(SD_bo_SundayWork)
			SD_CB_l_result:=Num:C11(SD_bo_ResultsDialog)
			If (SD_bo_ResultsDialog)
				OBJECT SET VISIBLE:C603(SD_CB_l_resultSequences; True:C214)
				SD_CB_l_resultSequences:=Num:C11(SD_bo_ResultsDialogSequence)
			Else 
				OBJECT SET VISIBLE:C603(SD_CB_l_resultSequences; False:C215)
				SD_CB_l_resultSequences:=0
			End if 
			
			$_l_ModulePosition:=Find in array:C230(SD_al_PriorityNUM; Num:C11([USER:15]Diary Priority:68))
			If ($_l_ModulePosition<0)
				$_l_ModulePosition:=Find in array:C230(SD_at_PriorityNM; [USER:15]Diary Priority:68)
			End if 
			If ($_l_ModulePosition<0)
				$_l_ModulePosition:=3
			End if 
			ARRAY INTEGER:C220(SD_aI_PriorityDF; Size of array:C274(SD_at_PriorityNM))
			SD_aI_PriorityDF{$_l_ModulePosition}:=1
			
			
		End if 
		
		LB_SetupListbox(->SD_lb_Priorities; "PRI_t"; "PRI_L"; 1; ->SD_aI_PriorityDF; ->SD_at_PriorityNM; ->SD_al_PriorityNUM)
		LB_SetColumnHeaders(->SD_lb_Priorities; "PRI_L"; 1; "Default"; "Priority"; "")
		LB_SetColumnWidths(->SD_lb_Priorities; "PRI_t"; 1; 17; 170; 0)
		LB_SetEnterable(->SD_lb_Priorities; False:C215; 0)
		LB_SetScroll(->SD_lb_Priorities; -3; -2)
		LB_StyleSettings(->SD_lb_Priorities; "Black"; 9; "PRI_t"; ->[ACCOUNTS:32])
		INT_SetLongintCheckFormat(->SD_aI_PriorityDF)
		//``````
		
		LB_SetupListbox(->SD2_abo_LBres; "SRE_t"; "SRE_L"; 1; ->SD_ai_ResultCodes; ->SD_at_ResultCodes; ->SD_at_ResultNames)
		
		LB_SetColumnHeaders(->SD2_abo_LBres; "SRE_L"; 1; "Available"; "Result Code"; ""; "Name")
		
		
		LB_SetColumnWidths(->SD2_abo_LBres; "SRE_t"; 1; 17; 70; 180)
		
		LB_SetEnterable(->SD2_abo_LBres; False:C215; 0)
		
		LB_SetScroll(->SD2_abo_LBres; -3; -2)
		LB_StyleSettings(->SD2_abo_LBres; "Black"; 9; "SRE_t"; ->[ACCOUNTS:32])
		INT_SetLongintCheckFormat(->SD_ai_ResultCodes)
		
		ARRAY TEXT:C222(SD_at_ActionResultTab; 2)
		SD_at_ActionResultTab{1}:="Actions"
		SD_at_ActionResultTab{2}:="Results"
		SD_at_ActionResultTab:=1
		
		
		// SMS stuff added 02/05/02 pb
		SMS_LoadVariables
		If (SMS_From="")
			SMS_From:=Substring:C12([USER:15]Organisation:1; 1; 11)
		End if 
		If (SMS_OneOrTwoWay<2)
			rSMS1:=1
			OBJECT SET VISIBLE:C603(*; "Relay@"; True:C214)
			OBJECT SET VISIBLE:C603(*; "TwoWay@"; False:C215)
		Else 
			rSMS2:=1
			OBJECT SET VISIBLE:C603(*; "Relay@"; False:C215)
			OBJECT SET VISIBLE:C603(*; "TwoWay@"; True:C214)
		End if 
		//````
		WS_fileprefs2array
		
		LB_SetupListbox(->USR_lb_TablesCodes; "USR_t"; "USR_L"; 1; ->WS_aI_NumberTableID; ->WS_at_TableName; ->WS_al_NumberCurrentValue; ->WS_aI_NumberIncludesOfficecode; ->WS_aI_NumberHasBackslash; ->WS_aI_Numberofleadingzeros; ->WS_aI_NumberUsesMultiNumber)
		
		LB_SetColumnHeaders(->USR_lb_TablesCodes; "USR_L"; 1; "Table Nº"; "Name"; "Number"; "Use office code"; "Use /"; "Nº Leading 0's"; "Use Multiple")
		
		LB_SetColumnWidths(->USR_lb_TablesCodes; "USR_t"; 1; 22; 61; 39; 19; 16; 24; 35)
		
		LB_SetEnterable(->USR_lb_TablesCodes; False:C215; 0)
		LB_StyleSettings(->USR_lb_TablesCodes; "Black"; 9; "USR_t"; ->[ACCOUNTS:32])
		
		//````
		LB_SetupListbox(->USR_lb_UserToTrack; "UTR_t"; "UTR_L"; 1; ->DM_ai_UserTrackActive; ->DM_at_UserNames; ->DB_at_UserInitials)
		
		LB_SetColumnHeaders(->USR_lb_UserToTrack; "UTR_L"; 1; "Active"; "Name"; "ID")
		
		
		LB_SetColumnWidths(->USR_lb_UserToTrack; "UTR_t"; 1; 22; 181; 0)
		
		LB_SetEnterable(->USR_lb_UserToTrack; False:C215; 0)
		LB_StyleSettings(->USR_lb_UserToTrack; "Black"; 9; "UTR_t"; ->[ACCOUNTS:32])
		//```````````
		
		INT_SetLongintCheckFormat(->DM_ai_UserTrackActive)
		INT_SetInput(Table:C252(->[USER:15]); WIN_t_CurrentInputForm)
		WS_GETPALLETEBUTTONS
		vButtDisUSER:="A DPMONPFSSSRCADT"
		Input_Buttons(->[USER:15]; ->vButtDisUSER)
		In_ButtChkDis(->vButtDisUSER)
		DB_AppendInputMenu
		
		// ****** TEMPORARY 'until I find out how all this works pb
	: ($_l_FormEvent=On Outside Call:K2:11)
		
		If ((DB_l_ButtonClickedFunction=DB_GetButtonFunction("OK")) | (iOK=1))
			//moved to other method
			
		End if 
		
		EW_bo_ModifiedSettings:=False:C215  //01/09/03 pb
		
		
	: ($_l_FormEvent=On Menu Selected:K2:14)
		
		
		
		$_l_ModulePosition:=Find in array:C230(DB_al_UserTabPage; WS_GoPage)
		If ($_l_ModulePosition>0)
			DB_at_USERTAB:=$_l_ModulePosition
		End if 
		SELECT LIST ITEMS BY POSITION:C381(USR_hl_DataManList; DB_at_USERTAB)
		// //////_o_REDRAW LIST(USR_hl_DataManList)
	: ($_l_FormEvent=On Clicked:K2:4) | ($_l_FormEvent=On Data Change:K2:15)
		
		
		If (PAL_BUTTON#"")
			$_t_PalleteButton:=PAL_BUTTON
			PAL_BUTTON:=""
			DB_HandleInputFormButtons($_t_PalleteButton)
			PAL_bo_ButtonSubFunction:=False:C215
		Else 
			If (BAR_t_Button#"")
				
				$_l_ButtonNumber:=Num:C11(BAR_t_Button)
				If ($_l_ButtonNumber>1)
					ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_ButtonNumber-1}
					$_l_ModulePosition:=Find in array:C230(MOD_al_ModuleBarNum; ModuleNumber)
					SET MENU BAR:C67(9)
					
					DB_SetBrowserBarSelection($_l_ModulePosition; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
					DB_AppendInputMenu(9)
					
				End if 
				BAR_t_Button:=""
				
			Else 
				$_l_PagePosition:=Find in array:C230(DB_al_UserTabPage; WS_GoPage)
				If ($_l_PagePosition>0)
					DB_at_USERTAB:=$_l_PagePosition
				End if 
			End if 
		End if 
	: ($_l_FormEvent=On Activate:K2:9)
		
		In_ButtChkDis(->vButtDisUSER)
		OpenHelp(Table:C252(->[USER:15]); "User_In")
		$_l_PagePosition:=Find in array:C230(DB_al_UserTabPage; WS_GoPage)
		If ($_l_PagePosition>0)
			DB_at_USERTAB:=$_l_PagePosition
		End if 
	: (Form event code:C388=On Unload:K2:2) & (Not:C34(DB_bo_NoLoad))
		
		
		// The list is no longer needed, do not forget to get rid of it!
		CLEAR LIST:C377(USR_hl_DataManList; *)
		CLEAR LIST:C377(BP_HL_l_Mins; *)
		CLEAR LIST:C377(BP_HL_l_tens; *)
		CLEAR LIST:C377(BP_HL_l_Hours; *)
		
End case 
User_inLP
ERR_MethodTrackerReturn("FM:User_In"; $_t_oldMethodName)
