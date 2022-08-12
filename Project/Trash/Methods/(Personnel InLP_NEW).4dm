//%attributes = {}
If (False:C215)
	//Project Method Name: Personnel_InLP_NEW
	//------------------ Method Notes ------------------
	//------------------ Revision Control ----------------
	//Date Created: 14/03/2010 10:59
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_ModuleAccess; 0)
	ARRAY BOOLEAN:C223($_abo_ModuleDisable; 0)
	ARRAY BOOLEAN:C223($_abo_ModuleInitStartup; 0)
	ARRAY BOOLEAN:C223($_abo_ModuleNoDeletion; 0)
	ARRAY BOOLEAN:C223($_abo_ModuleShowIcon; 0)
	ARRAY BOOLEAN:C223($_abo_ModuleShowLabel; 0)
	ARRAY BOOLEAN:C223($_abo_ReadOnly; 0)
	//ARRAY BOOLEAN(MOD_abo_AccessBoolean;0)
	//ARRAY BOOLEAN(MOD_abo_DisableVolume;0)
	//ARRAY BOOLEAN(MOD_abo_GroupAccessBoolean;0)
	//ARRAY BOOLEAN(MOD_abo_GroupDisableVolume;0)
	//ARRAY BOOLEAN(MOD_abo_GroupInitStartup;0)
	//ARRAY BOOLEAN(MOD_abo_GroupNoDeletion;0)
	//ARRAY BOOLEAN(MOD_abo_GroupReadOnly;0)
	//ARRAY BOOLEAN(MOD_abo_GroupShowIcon;0)
	//ARRAY BOOLEAN(MOD_abo_GroupShowLabel;0)
	//ARRAY BOOLEAN(MOD_abo_InitStartup;0)
	//ARRAY BOOLEAN(MOD_abo_NoDeletion;0)
	//ARRAY BOOLEAN(MOD_abo_ReadOnly;0)
	//ARRAY BOOLEAN(MOD_abo_ShowIcon;0)
	//ARRAY BOOLEAN(MOD_abo_ShowLabel;0)
	//ARRAY BOOLEAN(PER_ab_FFInt1;0)
	//ARRAY BOOLEAN(PER_ab_FFInt2;0)
	//ARRAY BOOLEAN(PER_abo_MailRules;0)
	//ARRAY BOOLEAN(PER_abo_StockAccess;0)
	//ARRAY BOOLEAN(PER_lb_FieldAccess;0)
	//ARRAY BOOLEAN(PER_LB_volumeAccess;0)
	//ARRAY BOOLEAN(SD2_abo_LBres;0)
	//ARRAY BOOLEAN(SD2_lb_Actions;0)
	//ARRAY BOOLEAN(SMTP_abo_UserPassSSL;0)
	//ARRAY INTEGER(a01Inte1;0)
	//ARRAY INTEGER(a01Inte2;0)
	//ARRAY INTEGER(SD_ai_ActionCodes;0)
	//ARRAY INTEGER(SD_ai_ActionCodesOSW;0)
	//ARRAY INTEGER(SD_ai_ResultCodes;0)
	//ARRAY LONGINT(<>Mod_al_AccessControlLevel;0)
	//ARRAY LONGINT(<>PW_al_4DUserGroupsBinaries;0)
	//ARRAY LONGINT(<>PW_al_4DUserGroupsINC;0)
	ARRAY LONGINT:C221($_al_aStPos; 0)
	ARRAY LONGINT:C221($_al_AttributeTypes; 0)
	ARRAY LONGINT:C221($_al_DisableModule; 0)
	ARRAY LONGINT:C221($_al_InitStartup; 0)
	ARRAY LONGINT:C221($_al_ModShowLabel; 0)
	ARRAY LONGINT:C221($_al_ShowIcon; 0)
	//ARRAY LONGINT(MOD_al_DisableVolume;0)
	//ARRAY LONGINT(MOD_al_GroupDisableVolume;0)
	//ARRAY LONGINT(MOD_al_GroupInitStartup;0)
	//ARRAY LONGINT(MOD_al_GroupModuleAccessStatus;0)
	//ARRAY LONGINT(MOD_al_GroupShowIcon;0)
	//ARRAY LONGINT(MOD_al_GroupShowlabel;0)
	//ARRAY LONGINT(MOD_al_InitStartup;0)
	//ARRAY LONGINT(MOD_al_ModuleAccessStatus;0)
	//ARRAY LONGINT(MOD_al_ModuleBarNum;0)
	//ARRAY LONGINT(MOD_al_ModuleBarOffsets;0)
	//ARRAY LONGINT(MOD_al_ShowIcon;0)
	//ARRAY LONGINT(MOD_al_ShowLabel;0)
	//ARRAY LONGINT(PER_al_AuthenticationTypes;0)
	//ARRAY LONGINT(PER_al_PageNos;0)
	//ARRAY LONGINT(SD_al_ActionCodesOST;0)
	//ARRAY LONGINT(SD_al_ActionTime;0)
	//ARRAY LONGINT(SMTP_al_UserAuthActive;0)
	//ARRAY LONGINT(SMTP_al_UserAuthType;0)
	//ARRAY LONGINT(SMTP_al_UserIDs;0)
	ARRAY REAL:C219($_ar_SRPrice; 0)
	ARRAY REAL:C219($_ar_SRRate; 0)
	//ARRAY REAL(MOD_ar_GroupSRPrice;0)
	//ARRAY REAL(MOD_ar_GroupSRRate;0)
	//ARRAY REAL(SRPrice;0)
	//ARRAY REAL(SRRate;0)
	//ARRAY TEXT(<>Mod_at_ModuleName;0)
	//ARRAY TEXT(<>PW_at_4DUserGroups;0)
	ARRAY TEXT:C222($_at_AModName; 0)
	ARRAY TEXT:C222($_at_attributeNames; 0)
	ARRAY TEXT:C222($_at_ModName; 0)
	//ARRAY TEXT(FUR_at_CustomFieldNames;0)
	//ARRAY TEXT(GRP_at_AModName;0)
	//ARRAY TEXT(MOD_at_ModuleName;0)
	//ARRAY TEXT(PER_at_AuthenticationType;0)
	//ARRAY TEXT(PER_at_MailFieldConjuction;0;0)
	//ARRAY TEXT(PER_at_MailFieldContent;0;0)
	//ARRAY TEXT(PER_at_MailFieldContext;0;0)
	//ARRAY TEXT(PER_at_MailFields;0;0)
	//ARRAY TEXT(PER_at_Pages;0)
	//ARRAY TEXT(PER_at_RuleAction;0)
	//ARRAY TEXT(PER_at_RuleActionl;0)
	//ARRAY TEXT(PER_at_RuleDetail;0)
	//ARRAY TEXT(PER_At_RuleName;0)
	//ARRAY TEXT(SD_at_ActionCodes;0)
	//ARRAY TEXT(SD_at_ActioncodesOST;0)
	//ARRAY TEXT(SD_at_DiaryActionNames;0)
	//ARRAY TEXT(SD_at_ResultCodes;0)
	//ARRAY TEXT(SD_at_ResultNames;0)
	//ARRAY TEXT(SMTP_at_UserAuthName;0)
	//ARRAY TEXT(SMTP_at_UserAuthPass;0)
	C_BOOLEAN:C305(<>Email_bo_PersonInited; <>Per_bo_EmailCOPY; <>SYS_bo_PWActive; $_bo_JobCosting; $_bo_SalesCatalogues; DB_bo_NoLoad; DB_bo_RecordModified; PAL_bo_ButtonSubFunction; PER_bo_UseSSL; PI_ActivatMessage; SD_bo_ChangePrefs)
	C_BOOLEAN:C305(SD_bo_SaturdayWork; SD_bo_SundayWork; SMTP_bo_ArraysInited; SYS_bo_AuthSettingsLoaded)
	C_LONGINT:C283(<>PER_l_allowDecode; <>SD3_l_DiaryVersion; <>USERMODPREF; $_l_ArraySize; $_l_ButtonNumber; $_l_ButtonPressed; $_l_Clash; $_l_FormEvent; $_l_GetRules; $_l_GetValues; $_l_Index)
	C_LONGINT:C283($_l_MenuItem; $_l_MenuSelected; $_l_ModulePosition; $_l_Offset; $_l_ProcessNumber; $_l_ProcessState; $_l_ProcessTime; $_l_Ref; $_l_Values; bd1; bd2)
	C_LONGINT:C283(bd3; bd4; Bd5; bd6; bd7; CB_OpenNewWindow; DB_l_ButtonClickedFunction; DB_l_PasswordLock; DB_l_WindowCurrentModule; iCancel; iOK)
	C_LONGINT:C283(ModuleNumber; PAL_BUTTON_10; PAL_BUTTON_7; PAL_BUTTON_8; PAL_BUTTON_9; PER_l_BUT1; PER_l_BUT10; PER_l_BUT11; PER_l_BUT12; PER_l_BUT13; PER_l_BUT14)
	C_LONGINT:C283(PER_l_BUT15; PER_l_BUT16; PER_l_BUT17; PER_l_But2; PER_l_BUT3; PER_l_BUT4; PER_l_BUT5; PER_l_BUT6; PER_l_BUT7; PER_l_BUT8; PER_l_BUT9)
	C_LONGINT:C283(PER_l_Context; PER_l_UseAuthentication; Per_l_UserAuthtype; SD_l_SaturdayWork; SD_l_SundayWork; SD_l_UseAgenda; SD2_l_BUT1; SD2_l_But2; SD2_l_BUT3; SD2_l_BUT4; SD2_l_BUT5)
	C_LONGINT:C283(SD2_l_BUT6; SD2_l_BUT7; SD2_l_BUT8; SD2_l_BUT9; SD3_l_CallActionNum; SD3_l_DiaryActionNum; SD3_l_DiaryRelatedRecordTable; SMTP_l_AUTH; SMTP_l_GeneralPassActive; SMTP_l_GeneralPassType; SRE_l_BUT1)
	C_LONGINT:C283(SRE_l_But2; SRE_l_BUT3; SRE_l_BUT4; SRE_l_BUT5; SRE_l_BUT6; SRE_l_BUT7; SRE_l_BUT8; SRE_l_BUT9)
	C_TEXT:C284(<>Per_at_PersonnelNames_EmailFrom; <>Per_at_PersonnelNames_EmailSign; <>PER_t_CurrentEmailFrom; <>PER_t_CurrentUserInitials; <>PER_t_CurrentUserName; <>Per_t_PersonnelNames_EmailSMTP; <>Per_t_PersonnelNames_EmailTo; <>USERMODID; $_t_initials; $_t_OfficeCode; $_t_Offset)
	C_TEXT:C284($_t_oldMethodName; $_t_PaletteButton; $_t_PersonName; $_t_SDProcName; $COC; $INIT; BAR_t_Button; DB_t_CUrrentInputMenuRef; DB_T_CurrentInputWindowMenu; FLAS55_COL1; PAL_BUTTON)
	C_TEXT:C284(PER_t_COL1; PER_t_COL10; PER_t_COL11; PER_t_COL12; PER_t_COL13; PER_t_COL14; PER_t_COL15; PER_t_COL2; PER_t_COL3; PER_t_COL4; PER_t_COL5)
	C_TEXT:C284(PER_t_COL6; PER_t_COL7; PER_t_COL8; PER_t_COL9; PER_t_HED1; PER_t_HED10; PER_t_HED11; PER_t_HED12; PER_t_HED13; PER_t_HED14; PER_t_HED15)
	C_TEXT:C284(PER_t_HED2; PER_t_HED3; PER_t_HED4; PER_t_HED5; PER_t_HED6; PER_t_HED7; PER_t_HED8; PER_t_HED9; PER_t_MailAction; PER_t_UserName; PER_t_UserPassword)
	C_TEXT:C284(PER_t_UserPasswordLOCK; PER_TEXT; SD2_t_COL1; SD2_t_COL2; SD2_t_COL3; SD2_t_COL4; SD2_t_COL5; SD2_t_COL6; SD2_t_COL7; SD2_t_COL8; SD2_t_COL9)
	C_TEXT:C284(SD2_t_HED1; SD2_t_HED2; SD2_t_HED3; SD2_t_HED4; SD2_t_HED5; SD2_t_HED6; SD2_t_HED7; SD2_t_HED8; SD2_t_HED9; SD3_t_DiaryRelatedRecordCode; SMTP_t_GeneralPassAuth)
	C_TEXT:C284(SMTP_t_GeneralPassName; SRE_t_COL1; SRE_t_COL2; SRE_t_COL3; SRE_t_COL4; SRE_t_COL5; SRE_t_COL6; SRE_t_COL7; SRE_t_COL8; SRE_t_COL9; SRE_t_HED1)
	C_TEXT:C284(SRE_t_HED2; SRE_t_HED3; SRE_t_HED4; SRE_t_HED5; SRE_t_HED6; SRE_t_HED7; SRE_t_HED8; SRE_t_HED9; vButtDisPersonnel; WIN_CurrentOutputformSet; WIN_t_CurrentInputForm)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("Personnel_InLP_NEW")

//PER_l_Context=1=Diary
//add your own here



$_l_FormEvent:=Form event code:C388
$_bo_JobCosting:=True:C214
If ((DB_GetModuleSettingByNUM(Module_JobCosting))<2)
	
	$_bo_JobCosting:=False:C215
End if 
$_bo_SalesCatalogues:=True:C214



Case of 
	: ($_l_FormEvent=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		DB_SetnewToolBar
		ARRAY TEXT:C222(MOD_at_ModuleName; 0)
		
		ARRAY LONGINT:C221(MOD_al_ModuleAccessStatus; 0)
		ARRAY BOOLEAN:C223(MOD_abo_AccessBoolean; 0)  //For Listbox area
		
		ARRAY REAL:C219(SRPrice; 0)
		ARRAY BOOLEAN:C223(MOD_abo_ReadOnly; 0)  //For listbox area
		
		ARRAY REAL:C219(SRRate; 0)
		ARRAY BOOLEAN:C223(MOD_abo_NoDeletion; 0)
		ARRAY LONGINT:C221(MOD_al_ShowIcon; 0)
		ARRAY BOOLEAN:C223(MOD_abo_ShowIcon; 0)
		ARRAY LONGINT:C221(MOD_al_ShowLabel; 0)
		ARRAY BOOLEAN:C223(MOD_abo_ShowLabel; 0)
		
		OpenHelp(Table:C252(->[PERSONNEL:11]); WIN_t_CurrentInputForm)
		ARRAY TEXT:C222(PER_at_Pages; 0)
		ARRAY LONGINT:C221(PER_al_PageNos; 0)
		Case of 
			: (PER_l_Context>0)  //NG November 2004 to take to a specific page
				
				DB_MenuAction("Section"; "Personnel"; 2; "")
				DB_MenuAction("Section"; "Email Settings"; 2; "")
				DB_MenuAction("Section"; "Access Rights"; 3; "")
				DB_MenuAction("Section"; "Further Field Acess"; 3; "")
				DB_MenuAction("Section"; "Diary Access"; 3; "")
				DB_MenuAction("Section"; "Diary Settiings"; 3; "")
				DB_MenuAction("Section"; "Product Catalogue Access"; 3; "")
				DB_MenuAction("Section"; "Job Costing"; 3; "")
				DB_MenuAction("Section"; "Remote Data"; 3; "")
				Case of 
					: (PER_l_Context=1)  //Diary
						
						ARRAY TEXT:C222(PER_at_Pages; 1)
						ARRAY LONGINT:C221(PER_al_PageNos; 1)
						PER_at_Pages{1}:="Diary Settings"
						PER_al_PageNos{1}:=8
						FORM GOTO PAGE:C247(8)
				End case 
				OBJECT SET ENTERABLE:C238([PERSONNEL:11]Initials:1; False:C215)
				OBJECT SET ENTERABLE:C238([PERSONNEL:11]Name:2; False:C215)
				OBJECT SET ENTERABLE:C238([PERSONNEL:11]Job_Title:35; False:C215)
				OBJECT SET ENTERABLE:C238([PERSONNEL:11]Email_Address:36; False:C215)
				OBJECT SET ENTERABLE:C238([PERSONNEL:11]Supervisor:4; False:C215)
				OBJECT SET ENTERABLE:C238([PERSONNEL:11]Analysis_Code:20; False:C215)
				
				OBJECT SET ENTERABLE:C238([PERSONNEL:11]Analysis_Override:24; False:C215)
				OBJECT SET ENTERABLE:C238([PERSONNEL:11]Analysis_Only:25; False:C215)
				
				//    DISABLE BUTTON(BaddTeamMember) compiler error PB
				OBJECT SET ENABLED:C1123(bd3; False:C215)
				OBJECT SET ENABLED:C1123(bd4; False:C215)
				OBJECT SET ENABLED:C1123(bd2; False:C215)
				OBJECT SET ENABLED:C1123(Bd5; False:C215)
				OBJECT SET ENABLED:C1123(bd6; False:C215)
				OBJECT SET ENABLED:C1123(bd7; False:C215)
				OBJECT SET ENABLED:C1123(bd1; False:C215)
				
			: (User in group:C338(Current user:C182; "administrator")) | (User in group:C338(Current user:C182; "Designer"))
				//all relavent pages
				DB_MenuAction("Section"; "Personnel"; 2; "")
				DB_MenuAction("Section"; "Email Settings"; 2; "")
				DB_MenuAction("Section"; "Access Rights"; 2; "")
				DB_MenuAction("Section"; "Further Field Acess"; 2; "")
				DB_MenuAction("Section"; "Diary Access"; 2; "")
				DB_MenuAction("Section"; "Diary Settiings"; 2; "")
				DB_MenuAction("Section"; "Product Catalogue Access"; 2; "")
				DB_MenuAction("Section"; "Job Costing"; 2; "")
				DB_MenuAction("Section"; "Remote Data"; 2; "")
				If ($_bo_JobCosting)
					ARRAY TEXT:C222(PER_at_Pages; 9)
					ARRAY LONGINT:C221(PER_al_PageNos; 9)
				Else 
					ARRAY TEXT:C222(PER_at_Pages; 8)
					ARRAY LONGINT:C221(PER_al_PageNos; 8)
				End if 
				PER_at_Pages{1}:="Setup"
				PER_al_PageNos{1}:=1
				DB_MenuAction("Section"; "Personnel"; 2; "")
				PER_at_Pages{2}:="Email Settings"
				PER_al_PageNos{2}:=7
				PER_at_Pages{3}:="Access Rights"
				PER_al_PageNos{3}:=2
				PER_at_Pages{4}:="FurtherField Access"
				PER_al_PageNos{4}:=6
				PER_at_Pages{5}:="Diary Access"
				PER_al_PageNos{5}:=3
				PER_at_Pages{6}:="Diary Settings"
				PER_al_PageNos{6}:=8
				If ($_bo_SalesCatalogues)
					PER_at_Pages{7}:="Product Catalogue Access"
					PER_al_PageNos{7}:=10
					$_l_Offset:=1
				Else 
					DB_MenuAction("Section"; "Product Catalogue Access"; 3; "")
					
					$_l_ArraySize:=Size of array:C274(PER_at_Pages)
					ARRAY TEXT:C222(PER_at_Pages; $_l_ArraySize-1)
					ARRAY LONGINT:C221(PER_al_PageNos; $_l_ArraySize-1)
					$_l_Offset:=0
				End if 
				If ($_bo_JobCosting)
					PER_at_Pages{7+$_l_Offset}:="Job Costing"
					PER_al_PageNos{7+$_l_Offset}:=5
					PER_at_Pages{8+$_l_Offset}:="Remote Data"
					PER_al_PageNos{8+$_l_Offset}:=4
				Else 
					DB_MenuAction("Section"; "Job Costing"; 3; "")
					PER_at_Pages{7+$_l_Offset}:="Remote Data"
					PER_al_PageNos{7+$_l_Offset}:=4
				End if 
				Personnel_PDF_addMenu($_l_Offset)  //Tue, Feb 14, 2006 bwalia: added
				
				
			: (User in group:C338(Current user:C182; "Manager"))
				//some pages
				//P1
				//P3
				//P5(if job costing relavent
				//P6(if email relavant`)
				//P8 diary settings
				//P10(Catalogues)
				DB_MenuAction("Section"; "Personnel"; 2; "")
				DB_MenuAction("Section"; "Email Settings"; 2; "")
				DB_MenuAction("Section"; "Access Rights"; 3; "")
				DB_MenuAction("Section"; "Further Field Acess"; 3; "")
				DB_MenuAction("Section"; "Diary Access"; 2; "")
				DB_MenuAction("Section"; "Diary Settings"; 2; "")
				DB_MenuAction("Section"; "Product Catalogue Access"; 2; "")
				DB_MenuAction("Section"; "Job Costing"; 2; "")
				DB_MenuAction("Section"; "Remote Data"; 3; "")
				If ($_bo_JobCosting)
					ARRAY TEXT:C222(PER_at_Pages; 0)
					ARRAY LONGINT:C221(PER_al_PageNos; 0)
				Else 
					ARRAY TEXT:C222(PER_at_Pages; 0)
					ARRAY LONGINT:C221(PER_al_PageNos; 0)
				End if 
				//PER_at_Pages{1}:="Setup"
				//PER_al_PageNos{1}:=1
				APPEND TO ARRAY:C911(PER_at_Pages; "Setup")
				APPEND TO ARRAY:C911(PER_al_PageNos; 1)
				
				//PER_at_Pages{2}:="Email Settings"
				//PER_al_PageNos{2}:=7
				APPEND TO ARRAY:C911(PER_at_Pages; "Email Settings")
				APPEND TO ARRAY:C911(PER_al_PageNos; 7)
				//PER_at_Pages{3}:="Diary Access"
				//PER_al_PageNos{3}:=3
				APPEND TO ARRAY:C911(PER_at_Pages; "Diary Access")
				APPEND TO ARRAY:C911(PER_al_PageNos; 3)
				//PER_at_Pages{4}:="Diary Settings"
				//PER_al_PageNos{4}:=8
				APPEND TO ARRAY:C911(PER_at_Pages; "Diary Settings")
				APPEND TO ARRAY:C911(PER_al_PageNos; 8)
				If ($_bo_SalesCatalogues)
					APPEND TO ARRAY:C911(PER_at_Pages; "Product Catalogue Access")
					APPEND TO ARRAY:C911(PER_al_PageNos; 10)
					//PER_at_Pages{5}:="Product Catalogue Access"
					//PER_al_PageNos{5}:=10
					$_l_Offset:=1
				Else 
					DB_MenuAction("Section"; "Product Catalogue Access"; 3; "")
					$_l_ArraySize:=Size of array:C274(PER_at_Pages)
					ARRAY TEXT:C222(PER_at_Pages; $_l_ArraySize-1)
					ARRAY LONGINT:C221(PER_al_PageNos; $_l_ArraySize-1)
					$_l_Offset:=0
				End if 
				If ($_bo_JobCosting)
					//PER_at_Pages{5+$_l_Offset}:="Job Costing"
					//PER_al_PageNos{5+$_l_Offset}:=5
					APPEND TO ARRAY:C911(PER_at_Pages; "Job Costing")
					APPEND TO ARRAY:C911(PER_al_PageNos; 5)
					
				Else 
					DB_MenuAction("Section"; "Job Costing"; 3; "")
					
				End if 
				
			: (<>PER_t_CurrentUserName=[PERSONNEL:11]Name:2)
				//this is my record    (and i am not an manager or administrator)
				DB_MenuAction("Section"; "Personnel"; 2; "")
				DB_MenuAction("Section"; "Email Settings"; 2; "")
				DB_MenuAction("Section"; "Access Rights"; 3; "")
				DB_MenuAction("Section"; "Further Field Access"; 3; "")
				DB_MenuAction("Section"; "Diary Access"; 3; "")
				DB_MenuAction("Section"; "Diary Settings"; 3; "")
				DB_MenuAction("Section"; "Product Catalogue Access"; 3; "")
				DB_MenuAction("Section"; "Job Costing"; 3; "")
				DB_MenuAction("Section"; "Remote Data"; 3; "")
				ARRAY TEXT:C222(PER_at_Pages; 2)
				ARRAY LONGINT:C221(PER_al_PageNos; 2)
				PER_at_Pages{1}:="Setup"
				PER_al_PageNos{1}:=1
				PER_at_Pages{2}:="Email Settings"
				PER_al_PageNos{2}:=7
				
				
				
			Else 
				//only primary page and no edits!
				DB_MenuAction("Section"; "Personnel"; 2; "")
				DB_MenuAction("Section"; "Email Settings"; 3; "")
				DB_MenuAction("Section"; "Access Rights"; 3; "")
				DB_MenuAction("Section"; "Further Field Access"; 3; "")
				DB_MenuAction("Section"; "Diary Access"; 3; "")
				DB_MenuAction("Section"; "Diary Settings"; 3; "")
				DB_MenuAction("Section"; "Product Catalogue Access"; 3; "")
				DB_MenuAction("Section"; "Job Costing"; 3; "")
				DB_MenuAction("Section"; "Remote Data"; 3; "")
				
				ARRAY TEXT:C222(PER_at_Pages; 1)  //bsw 9/07/04
				ARRAY LONGINT:C221(PER_al_PageNos; 1)  //bsw 9/07/04
				
				
				PER_at_Pages{1}:="Setup"
				PER_al_PageNos{1}:=1
				
				OBJECT SET ENTERABLE:C238([PERSONNEL:11]Initials:1; False:C215)
				OBJECT SET ENTERABLE:C238([PERSONNEL:11]Name:2; False:C215)
				OBJECT SET ENTERABLE:C238([PERSONNEL:11]Job_Title:35; False:C215)
				OBJECT SET ENTERABLE:C238([PERSONNEL:11]Email_Address:36; False:C215)
				OBJECT SET ENTERABLE:C238([PERSONNEL:11]Supervisor:4; False:C215)
				OBJECT SET ENTERABLE:C238([PERSONNEL:11]Analysis_Code:20; False:C215)
				
				OBJECT SET ENTERABLE:C238([PERSONNEL:11]Analysis_Override:24; False:C215)
				OBJECT SET ENTERABLE:C238([PERSONNEL:11]Analysis_Only:25; False:C215)
				
				//    DISABLE BUTTON(BaddTeamMember) compiler error PB
				OBJECT SET ENABLED:C1123(bd3; False:C215)
				OBJECT SET ENABLED:C1123(bd4; False:C215)
				OBJECT SET ENABLED:C1123(bd2; False:C215)
				OBJECT SET ENABLED:C1123(Bd5; False:C215)
				OBJECT SET ENABLED:C1123(bd6; False:C215)
				OBJECT SET ENABLED:C1123(bd7; False:C215)
				OBJECT SET ENABLED:C1123(bd1; False:C215)
		End case 
		//Here get the subordinates!
		//NOTE:This has to be in a seperate process!
		
		Personnel_InLPB
		
		Personnel_FuncP
		If (Not:C34(<>SYS_bo_PWActive))
			OBJECT SET VISIBLE:C603([PERSONNEL:11]UserGroupIDs:39; False:C215)
			OBJECT SET VISIBLE:C603(<>PW_at_4DUserGroups; False:C215)
			OBJECT SET VISIBLE:C603(<>PW_al_4DUserGroupsINC; False:C215)
		Else 
			ARRAY LONGINT:C221(<>PW_al_4DUserGroupsINC; Size of array:C274(<>PW_al_4DUserGroupsBinaries))
		End if 
		
		//DISABLE BUTTON(BD7)
		If (<>SD3_l_DiaryVersion=1)
			//BUTTON TEXT([PERSONNEL]Global Access;"This is a resource")
			OBJECT SET VISIBLE:C603(CB_OpenNewWindow; True:C214)
			If ([PERSONNEL:11]SD_openNewWindow:49=0)
				[PERSONNEL:11]SD_openNewWindow:49:=1
			End if 
			CB_OpenNewWindow:=[PERSONNEL:11]SD_openNewWindow:49-1
			
		Else 
			OBJECT SET VISIBLE:C603(CB_OpenNewWindow; False:C215)
		End if 
		
		
		
		If (<>SD3_l_DiaryVersion=1)
			SD_LoadPrefs([PERSONNEL:11]Personnel_ID:48; [PERSONNEL:11]Group_Code:28; True:C214)
			SD_l_SaturdayWork:=Num:C11(SD_bo_SaturdayWork)
			SD_l_SundayWork:=Num:C11(SD_bo_SundayWork)
		End if 
		//PER_LB_volumeAccess
		//ARRAY BOOLEAN(PER_
		
		PER_TEXT:=("MOD_at_ModuleName="+String:C10(Size of array:C274(MOD_at_ModuleName)))
		PER_TEXT:=PER_TEXT+("MOD_abo_AccessBoolean="+String:C10(Size of array:C274(MOD_abo_AccessBoolean)))
		PER_TEXT:=PER_TEXT+("MOD_abo_ReadOnly="+String:C10(Size of array:C274(MOD_abo_ReadOnly)))
		PER_TEXT:=PER_TEXT+("MOD_abo_NoDeletion="+String:C10(Size of array:C274(MOD_abo_NoDeletion)))
		PER_TEXT:=PER_TEXT+("MOD_abo_ShowIcon="+String:C10(Size of array:C274(MOD_abo_ShowIcon)))
		PER_TEXT:=PER_TEXT+("MOD_abo_ShowLabel="+String:C10(Size of array:C274(MOD_abo_ShowLabel)))
		PER_TEXT:=PER_TEXT+("MOD_al_ModuleAccessStatus="+String:C10(Size of array:C274(MOD_al_ModuleAccessStatus)))
		PER_TEXT:=PER_TEXT+("SRPrice="+String:C10(Size of array:C274(SRPrice)))
		PER_TEXT:=PER_TEXT+("SRRate="+String:C10(Size of array:C274(SRRate)))
		PER_TEXT:=PER_TEXT+("MOD_al_ShowIcon="+String:C10(Size of array:C274(MOD_al_ShowIcon)))
		PER_TEXT:=PER_TEXT+("MOD_al_ShowLabel="+String:C10(Size of array:C274(MOD_al_ShowLabel)))
		
		If (Size of array:C274(MOD_at_ModuleName)>0) & (Size of array:C274(MOD_al_ShowLabel)>0)
			
			LB_SetupListbox(->PER_LB_volumeAccess; "PER_t"; "PER_L"; 1; ->MOD_at_ModuleName; ->MOD_abo_AccessBoolean; ->MOD_abo_DisableVolume; ->MOD_abo_ReadOnly; ->MOD_abo_NoDeletion; ->MOD_abo_ShowIcon; ->MOD_abo_ShowLabel; ->MOD_al_ShowIcon; ->MOD_al_ShowLabel; ->MOD_al_ModuleAccessStatus; ->SRPrice; ->SRRate; ->MOD_al_InitStartup; ->MOD_abo_InitStartup; ->MOD_al_DisableVolume)
			
			LB_SetColumnHeaders(->PER_LB_volumeAccess; "PER_L"; 1; "Volume"; "Access"; "No Access"; "Read Only"; "No Deletion"; "Show Icon"; "Show Label"; "INV ShowIcon"; "INV ShowLabel"; "INVAccess"; "INV ReadOnly"; "Inv_No DEL")
			LB_SetColumnWidths(->PER_LB_volumeAccess; "PER_t"; 1; 100; 50; 50; 50; 50; 50; 0; 0; 0; 0; 0; 0; 0; 0; 0)
			LB_SetEnterable(->PER_LB_volumeAccess; False:C215; 0)
			LB_SetEnterable(->PER_LB_volumeAccess; True:C214; 2)
			LB_SetEnterable(->PER_LB_volumeAccess; True:C214; 3)
			LB_SetEnterable(->PER_LB_volumeAccess; True:C214; 4)
			LB_SetEnterable(->PER_LB_volumeAccess; True:C214; 5)
			LB_SetEnterable(->PER_LB_volumeAccess; True:C214; 6)
			LB_SetScroll(->PER_LB_volumeAccess; -3; -2)
			LB_StyleSettings(->PER_abo_StockAccess; "Black"; 9; "PER_t"; ->[PERSONNEL:11])
			LB_Setdividers(->PER_LB_volumeAccess; 0; 0)  //Both on
			
			
		End if 
		
		In_ButtChkDis(->vButtDisPersonnel)
		DB_SetInputFormMenu(Table:C252(->[PERSONNEL:11]); "Personnel_In")
		If (Records in selection:C76([PERSONNEL:11])<=1)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_8; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_7; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_9; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_10; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
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
		
		//PER_lb_FieldAccess
		
		ARRAY BOOLEAN:C223(PER_ab_FFInt1; 0)
		ARRAY BOOLEAN:C223(PER_ab_FFInt2; 0)
		For ($_l_Index; 1; Size of array:C274(a01Inte1))
			APPEND TO ARRAY:C911(PER_ab_FFInt1; (a01Inte1{$_l_Index}=1))
			APPEND TO ARRAY:C911(PER_ab_FFInt2; (a01Inte2{$_l_Index}=1))
		End for 
		
		LB_SetupListbox(->PER_lb_FieldAccess; "SRE_t"; "SRE_L"; 1; ->FUR_at_CustomFieldNames; ->PER_ab_FFInt1; ->PER_ab_FFInt2; ->a01Inte1; ->a01Inte2)
		
		LB_SetColumnHeaders(->PER_lb_FieldAccess; "SRE_L"; 1; "Field Name"; "Access"; "RO")
		
		
		LB_SetColumnWidths(->PER_lb_FieldAccess; "SRE_t"; 1; 187; 34; 50; 0; 0)
		
		LB_SetEnterable(->PER_lb_FieldAccess; False:C215; 0)
		LB_SetEnterable(->PER_lb_FieldAccess; True:C214; 2)
		LB_SetEnterable(->PER_lb_FieldAccess; True:C214; 3)
		
		LB_SetScroll(->PER_lb_FieldAccess; -3; -2)
		PER_t_MailAction:="'"
		ARRAY TEXT:C222(PER_At_RuleName; 0)
		ARRAY TEXT:C222(PER_at_RuleDetail; 0)
		ARRAY TEXT:C222(PER_at_MailFields; 0; 0)
		ARRAY TEXT:C222(PER_at_MailFieldContext; 0; 0)
		ARRAY TEXT:C222(PER_at_MailFieldConjuction; 0; 0)
		ARRAY TEXT:C222(PER_at_MailFieldContent; 0; 0)
		OB GET PROPERTY NAMES:C1232([PERSONNEL:11]IncomingMailActions:55; $_at_attributeNames; $_al_AttributeTypes)
		$_l_Ref:=Find in array:C230($_at_attributeNames; "Default Action")
		If ($_l_Ref>0)
			PER_t_MailAction:=OB Get:C1224([PERSONNEL:11]IncomingMailActions:55; "Default Action")
		End if 
		$_l_Ref:=Find in array:C230($_at_attributeNames; "Rule_Names")
		If ($_l_Ref>0)
			OB GET ARRAY:C1229([PERSONNEL:11]IncomingMailActions:55; "Rule_Names"; PER_At_RuleName)
			$_l_Ref:=Find in array:C230($_at_attributeNames; "RuleAction")
			If ($_l_Ref>0)
				OB GET ARRAY:C1229([PERSONNEL:11]IncomingMailActions:55; "RuleAction"; PER_at_RuleAction)
			End if 
			$_l_Values:=Size of array:C274(PER_At_RuleName)
			ARRAY TEXT:C222(PER_at_RuleDetail; $_l_Values)
			ARRAY TEXT:C222(PER_at_MailFields; $_l_Values; 0)
			ARRAY TEXT:C222(PER_at_MailFieldContext; $_l_Values; 0)
			ARRAY TEXT:C222(PER_at_MailFieldConjuction; $_l_Values; 0)
			ARRAY TEXT:C222(PER_at_MailFieldContent; $_l_Values; 0)
			ARRAY TEXT:C222(PER_at_RuleAction; $_l_Values)
			If (Size of array:C274(PER_At_RuleName)>0)
				For ($_l_GetValues; 1; Size of array:C274(PER_At_RuleName))
					$_t_Offset:="Field_"+String:C10($_l_GetValues)
					$_l_Ref:=Find in array:C230($_at_attributeNames; $_t_Offset)
					If ($_l_Ref>0)
						OB GET ARRAY:C1229([PERSONNEL:11]IncomingMailActions:55; $_t_Offset; PER_at_MailFields{$_l_GetValues})
					End if 
					
					$_t_Offset:="FieldContext_"+String:C10($_l_GetValues)
					$_l_Ref:=Find in array:C230($_at_attributeNames; $_t_Offset)
					If ($_l_Ref>0)
						OB GET ARRAY:C1229([PERSONNEL:11]IncomingMailActions:55; $_t_Offset; PER_at_MailFieldContext{$_l_GetValues})
					End if 
					//$_t_Offset:="FieldConjoin_"+String($_l_GetValues)
					//$_l_Ref:=Find in array($_at_attributeNames;$_t_Offset)
					//If ($_l_Ref>0)
					//OB GET ARRAY([PERSONNEL]IncomingMailActions;$_t_Offset;PER_at_MailFieldConjuction{$_l_GetValues})
					//End if 
					$_t_Offset:="FieldContent_"+String:C10($_l_GetValues)
					$_l_Ref:=Find in array:C230($_at_attributeNames; $_t_Offset)
					If ($_l_Ref>0)
						OB GET ARRAY:C1229([PERSONNEL:11]IncomingMailActions:55; $_t_Offset; PER_at_MailFieldContent{$_l_GetValues})
					End if 
					For ($_l_GetRules; 1; Size of array:C274(PER_at_RuleDetail{$_l_GetValues}))
						If (PER_at_RuleDetail{$_l_GetValues}#"")
							PER_at_RuleDetail{$_l_GetValues}:=PER_at_RuleDetail{$_l_GetValues}+PER_at_MailFieldConjuction{$_l_GetValues}{$_l_GetRules}+PER_at_MailFields{$_l_GetValues}{$_l_GetRules}+PER_at_MailFieldContext{$_l_GetValues}{$_l_GetRules}+PER_at_MailFieldContent{$_l_GetValues}{$_l_GetRules}
						Else 
							PER_at_RuleDetail{$_l_GetValues}:=PER_at_MailFields{$_l_GetValues}{$_l_GetRules}+PER_at_MailFieldContext{$_l_GetValues}{$_l_GetRules}+PER_at_MailFieldContent{$_l_GetValues}{$_l_GetRules}
						End if 
					End for 
				End for 
			End if 
			
		End if 
		ARRAY BOOLEAN:C223(PER_ab_FFInt1; 0)
		ARRAY BOOLEAN:C223(PER_ab_FFInt2; 0)
		For ($_l_Index; 1; Size of array:C274(a01Inte1))
			APPEND TO ARRAY:C911(PER_ab_FFInt1; (a01Inte1{$_l_Index}=1))
			APPEND TO ARRAY:C911(PER_ab_FFInt2; (a01Inte2{$_l_Index}=1))
		End for 
		
		LB_SetupListbox(->PER_abo_MailRules; "PMR_S55"; "PME_L"; 1; ->PER_At_RuleName; ->PER_at_RuleDetail; ->PER_at_RuleAction)
		
		
		LB_SetColumnHeaders(->PER_abo_MailRules; "PMR_L"; 1; "Rule Name"; "Behaviour"; "Diary Action")
		
		
		LB_SetColumnWidths(->PER_abo_MailRules; "PMR_S55"; 1; 87; 200; 50)
		
		LB_SetEnterable(->PER_abo_MailRules; False:C215; 0)
		LB_SetEnterable(->PER_abo_MailRules; True:C214; 2)
		LB_SetEnterable(->PER_abo_MailRules; True:C214; 3)
		
		LB_SetScroll(->PER_abo_MailRules; -3; -2)
		
		
	: ($_l_FormEvent=On Activate:K2:9)
		
		DB_SetInputFormMenu(Table:C252(->[PERSONNEL:11]); "Personnel_In")
		OpenHelp(Table:C252(->[PERSONNEL:11]); WIN_t_CurrentInputForm)
		
		In_ButtChkDis(->vButtDisPersonnel)
		
		If (PI_ActivatMessage=True:C214)
			PI_ActivatMessage:=False:C215
			If (Current user:C182#"Designer")
				//   Gen_Alert ("You must save and exit this record before continuing!")
			End if 
			
		End if 
		If (Records in selection:C76([PERSONNEL:11])<=1)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_8; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_7; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_9; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_10; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		
	: ((($_l_FormEvent=On Outside Call:K2:11) & (DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
		
		$_l_ButtonPressed:=DB_l_ButtonClickedFunction
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
				If (($_l_ButtonPressed=DB_GetButtonFunction("OK")) | (iOK=1))
					//TRACE
					If ([PERSONNEL:11]Initials:1=<>PER_t_CurrentUserInitials)
						<>PER_t_CurrentEmailFrom:=[PERSONNEL:11]Email_Address:36
						<>Per_t_PersonnelNames_EmailSMTP:=[PERSONNEL:11]PER_SMTPHOST:41
						<>Per_t_PersonnelNames_EmailTo:=[PERSONNEL:11]PER_CopyToAddress:42
						<>Per_at_PersonnelNames_EmailFrom:=[PERSONNEL:11]Email_Address:36
						<>Per_at_PersonnelNames_EmailSign:=[PERSONNEL:11]Per_DefaultSignature:44
						<>Per_bo_EmailCOPY:=[PERSONNEL:11]PER_CopytoOption:43
						While (Semaphore:C143("InitEmail"))
							DelayTicks(2)
						End while 
						If (<>Email_bo_PersonInited=False:C215)
							LOGIN_SetEmail
						End if 
						CLEAR SEMAPHORE:C144("InitEmail")
						
					End if 
					
					//reload the settings in case someone else has changed them
					While (Semaphore:C143("$LoadingSMTPPrefs"))
						DelayTicks(2)
					End while   //To stop anyone else trying to change them-this is the same semaphore used in the methods
					
					
					//KMW NOTE 15/12/08 v631b120l - Not sure on this...depending on the intention of the above there are some possible problems.
					//A) Its not what the comment suggests it is (ie its not the same semaphoreas in the methods)
					//B) The ones in the methods are normal semaphores whereas this one is a local and won't stop anyone else doing anything
					//C) If it WAS the same (non-local) semaphore it would get messed with in the next two calls to SYS_LOADSMTPAUTH
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
					
					$_l_ModulePosition:=Find in array:C230(SMTP_al_UserIDs; [PERSONNEL:11]Personnel_ID:48)
					If ($_l_ModulePosition>0)  //The user has personal auth settings
						//SMTP_al_UserAuthActive{$_l_ModulePosition}:=PER_l_UseAuthentication
						//SMTP_al_UserAuthType{$_l_ModulePosition}:=PER_al_AuthenticationTypes{PER_at_AuthenticationType}
						//SMTP_at_UserAuthName{$_l_ModulePosition}:=PER_t_UserName
						//SMTP_at_UserAuthPass{$_l_ModulePosition}:=PER_t_UserPassword
						//SMTP_abo_UserPassSSL{$_l_ModulePosition}:=PER_bo_UseSSL
						SMTP_al_UserAuthActive{$_l_ModulePosition}:=PER_l_UseAuthentication
						SMTP_al_UserAuthType{$_l_ModulePosition}:=PER_al_AuthenticationTypes{PER_at_AuthenticationType}
						SMTP_at_UserAuthName{$_l_ModulePosition}:=PER_t_UserName
						SMTP_at_UserAuthPass{$_l_ModulePosition}:=PER_t_UserPassword
						SMTP_abo_UserPassSSL{$_l_ModulePosition}:=PER_bo_UseSSL
					Else 
						//******************* added 30/07/08 -kmw *******************************************
						SYS_bo_AuthSettingsLoaded:=False:C215  //just in case
						
						
						//PER_l_UseAuthentication:=0
						//Per_l_UserAuthtype:=0
						//PER_t_UserName:=""
						//PER_t_UserPassword:=""
						
						APPEND TO ARRAY:C911(SMTP_al_UserIDs; [PERSONNEL:11]Personnel_ID:48)
						APPEND TO ARRAY:C911(SMTP_al_UserAuthActive; PER_l_UseAuthentication)
						APPEND TO ARRAY:C911(SMTP_al_UserAuthType; Per_l_UserAuthtype)
						APPEND TO ARRAY:C911(SMTP_at_UserAuthName; PER_t_UserName)
						APPEND TO ARRAY:C911(SMTP_at_UserAuthPass; PER_t_UserPassword)
						APPEND TO ARRAY:C911(SMTP_abo_UserPassSSL; PER_bo_UseSSL)
						//****************************************************************************************
					End if 
					SYS_LOADSMTPAUTH(True:C214; ->SMTP_l_AUTH; ->SMTP_l_GeneralPassActive; ->SMTP_l_GeneralPassType; ->SMTP_t_GeneralPassName; ->SMTP_t_GeneralPassAuth; ->SMTP_al_UserIDs; ->SMTP_al_UserAuthActive; ->SMTP_al_UserAuthType; ->SMTP_at_UserAuthName; ->SMTP_at_UserAuthPass; ->SMTP_abo_UserPassSSL)  //Save the updated data
					
					CLEAR SEMAPHORE:C144("$LoadingSMTPPrefs")
					
					
					Cat_SavePersonPrefs
					//NG Modified October 2007-thisdid not save the variables back to the array first
					Personnel_PDF_SavePrefs([PERSONNEL:11]Initials:1)
					//Wed, Feb 1, 2006 bwalia: added
					If (SD_bo_ChangePrefs)
						
						//update the prefs
						If ([PERSONNEL:11]Personnel_ID:48=0)
							[PERSONNEL:11]Personnel_ID:48:=AA_GetNextIDinMethod(->[PERSONNEL:11]Personnel_ID:48)
						End if 
						SD_bo_SaturdayWork:=(SD_l_SaturdayWork=1)
						SD_bo_SundayWork:=(SD_l_SundayWork=1)
						SD_SavePrefs([PERSONNEL:11]Personnel_ID:48; SD_l_UseAgenda)
						If (<>SD3_l_DiaryVersion=1)
							$_t_SDProcName:="Schedule"+"-"+[PERSONNEL:11]Initials:1
							$_l_ProcessNumber:=Process number:C372($_t_SDProcName)
							PROCESS PROPERTIES:C336($_l_ProcessNumber; $_t_SDProcName; $_l_ProcessState; $_l_ProcessTime)
							If ($_l_ProcessNumber>0)
								
								
								SD3_l_CallActionNum:=17
								PROCESS PROPERTIES:C336($_l_ProcessNumber; $_t_SDProcName; $_l_ProcessState; $_l_ProcessTime)
								If ($_l_ProcessState>=0)
									SET PROCESS VARIABLE:C370($_l_ProcessNumber; SD3_l_DiaryActionNum; SD3_l_CallActionNum)
									POST OUTSIDE CALL:C329($_l_ProcessNumber)
								End if 
								SD3_l_CallActionNum:=0
							End if 
						End if 
						
					End if 
				End if 
				
				In_ButtCall("Personnel_InLPA"; ""; "Minor_DelSin"; ->[PERSONNEL:11]; ->[PERSONNEL:11]Initials:1; "Personnel"; "1"; "Personnel_InLPB"; ""; ""; ""; ->[IDENTIFIERS:16]; ->vButtDisPersonnel)
				<>USERMODID:=[PERSONNEL:11]Initials:1
				<>USERMODPREF:=[PERSONNEL:11]Functionality:33
				<>PER_l_allowDecode:=[PERSONNEL:11]CCM_L_DisplayFullCard:50
		End case 
	: ($_l_FormEvent=On Outside Call:K2:11) & (DB_l_PasswordLock#0)
		PER_t_UserPasswordLOCK[[DB_l_PasswordLock]]:="x"
		DB_l_PasswordLock:=DB_l_PasswordLock-1
		If (DB_l_PasswordLock>0)
			DelayTicks(10)
			POST OUTSIDE CALL:C329(Current process:C322)
		End if 
		
	: ($_l_FormEvent=On Menu Selected:K2:14)
		
		If (Menu selected:C152#0)
			$_l_MenuSelected:=Menu selected:C152
			$_l_MenuItem:=($_l_MenuSelected%65536)
			Case of 
				: ($_l_MenuItem=1)
					FORM GOTO PAGE:C247(1)
					//SET COLOR(Per_Pi_Header;-(223+(256*223)))
					INT_SetInput(Table:C252(->[PERSONNEL:11]); WIN_t_CurrentInputForm)
					
				: ($_l_MenuItem=2)
					FORM GOTO PAGE:C247(7)
					//SET COLOR(Per_Pi_Header;-(223+(256*223)))
					INT_SetInput(Table:C252(->[PERSONNEL:11]); WIN_t_CurrentInputForm)
					
				: ($_l_MenuItem=3)
					FORM GOTO PAGE:C247(2)
					//SET COLOR(Per_Pi_Header;-(223+(256*223)))
					INT_SetInput(Table:C252(->[PERSONNEL:11]); WIN_t_CurrentInputForm)
					
				: ($_l_MenuItem=4)
					FORM GOTO PAGE:C247(6)
					//SET COLOR(Per_Pi_Header;-(223+(256*223)))
					INT_SetInput(Table:C252(->[PERSONNEL:11]); WIN_t_CurrentInputForm)
					
				: ($_l_MenuItem=5)
					FORM GOTO PAGE:C247(3)
					//SET COLOR(Per_Pi_Header;-(223+(256*223)))
					INT_SetInput(Table:C252(->[PERSONNEL:11]); WIN_t_CurrentInputForm)
					
				: ($_l_MenuItem=6)
					FORM GOTO PAGE:C247(8)
					//SET COLOR(Per_Pi_Header;-(223+(256*223)))
					INT_SetInput(Table:C252(->[PERSONNEL:11]); WIN_t_CurrentInputForm)
					
				: ($_l_MenuItem=7)
					FORM GOTO PAGE:C247(10)
					//SET COLOR(Per_Pi_Header;-(223+(256*223)))
					INT_SetInput(Table:C252(->[PERSONNEL:11]); WIN_t_CurrentInputForm)
					
				: ($_l_MenuItem=8)  //Job costing
					
					FORM GOTO PAGE:C247(5)
					//SET COLOR(Per_Pi_Header;-(190+(256*190)))
					INT_SetInput(Table:C252(->[JOBS:26]); "Jobs_In13")
					WIN_CurrentOutputformSet:=""  //set to blank for force reload in Output afterwards
					
					
				: ($_l_MenuItem=9)
					FORM GOTO PAGE:C247(4)
					//SET COLOR(Per_Pi_Header;-(223+(256*223)))
					INT_SetInput(Table:C252(->[PERSONNEL:11]); WIN_t_CurrentInputForm)
					
			End case 
		End if   // pb 28/10/03
		
		DB_SetInputFormMenu(Table:C252(->[PERSONNEL:11]); "Personnel_In")
		In_ButtChkDis(->vButtDisPersonnel)
		If (Records in selection:C76([PERSONNEL:11])<=1)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_8; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_7; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_9; False:C215)
			OBJECT SET VISIBLE:C603(PAL_BUTTON_10; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		
	: ($_l_FormEvent=On Data Change:K2:15) | ($_l_FormEvent=On Clicked:K2:4)
		
		
		//Rollo 19/8/2004 don't put this back unless you exclude the click on the List of pages
		
		//Case of
		//: (current form page=5)
		//SET COLOR(Per_Pi_Header;-(190+(256*190)))
		//INT_SetInput (Table(->[JOBS]);"Jobs_In13")
		
		//Else
		//SET COLOR(Per_Pi_Header;-(223+(256*223)))
		//INT_SetInput (Table(->[PERSONNEL]);WIN_t_CurrentInputForm)
		
		//End case
		
		Case of 
			: (BAR_t_Button#"")
				$_l_ButtonNumber:=Num:C11(BAR_t_Button)
				If ($_l_ButtonNumber>1)
					ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_ButtonNumber-1}
					$_l_ModulePosition:=Find in array:C230(MOD_al_ModuleBarNum; ModuleNumber)
					DB_SetBrowserBarSelection($_l_ModulePosition; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
					DB_SetInputFormMenu(Table:C252(->[PERSONNEL:11]); "Personnel_In")
				End if 
				BAR_t_Button:=""
			: (PAL_BUTTON#"")
				$_t_PaletteButton:=PAL_BUTTON
				PAL_BUTTON:=""
				DB_HandleInputFormButtons($_t_PaletteButton)
				PAL_bo_ButtonSubFunction:=False:C215
			: (Modified:C32([PERSONNEL:11]Initials:1))
				RemoveLeadTr(Uppercase:C13([PERSONNEL:11]Initials:1); ->[PERSONNEL:11]Initials:1)
				SET QUERY DESTINATION:C396(3; $_l_Clash)
				$_t_initials:=[PERSONNEL:11]Initials:1
				[PERSONNEL:11]Initials:1:=""
				QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=$_t_initials)
				If ($_l_Clash>0)
					QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=$_t_initials; *)
					QUERY:C277([PERSONNEL:11];  & ; [PERSONNEL:11]PersonDeleted:38=1)
					If ($_l_Clash>0)
						CONFIRM:C162("There is a deleted user with those initials, un-delete?"; "No"; "Undelete")
						If (OK=0)
							SET QUERY DESTINATION:C396(0)
							QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=$_t_initials; *)
							QUERY:C277([PERSONNEL:11];  & ; [PERSONNEL:11]PersonDeleted:38=1)
							LAST RECORD:C200([PERSONNEL:11])
							[PERSONNEL:11]PersonDeleted:38:=0
						Else 
							SET QUERY DESTINATION:C396(0)
						End if 
					Else 
						//the user is not delete
						CONFIRM:C162("There is an active user with those initials, view?"; "No"; "View")
						If (Ok=0)
							SET QUERY DESTINATION:C396(0)
							QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=$_t_initials)
						Else 
							SET QUERY DESTINATION:C396(0)
						End if 
					End if 
				Else 
					//no clash
					SET QUERY DESTINATION:C396(0)
					[PERSONNEL:11]Initials:1:=$_t_initials
				End if 
				
				If ([PERSONNEL:11]Initials:1#"")
					
					
					
					DB_bo_RecordModified:=True:C214
					Macro_AccTypePt(->[PERSONNEL:11]Initials:1)
				End if 
			: (Modified:C32([PERSONNEL:11]Name:2))
				If ([PERSONNEL:11]Name:2="Administrator") | ([PERSONNEL:11]Name:2="Designer")
					//  ALERT("There is already a user with that name")
					Gen_Alert("There is already a user with that name")
					[PERSONNEL:11]Name:2:=Old:C35([PERSONNEL:11]Name:2)
				Else 
					
					
					[PERSONNEL:11]Name:2:=Uppers2([PERSONNEL:11]Name:2)
					SET QUERY DESTINATION:C396(3; $_l_Clash)
					$_t_PersonName:=[PERSONNEL:11]Name:2
					[PERSONNEL:11]Name:2:=""
					QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=$_t_PersonName)
					If ($_l_Clash>0)
						QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Name:2=$_t_PersonName; *)
						QUERY:C277([PERSONNEL:11];  & ; [PERSONNEL:11]PersonDeleted:38=1)
						If ($_l_Clash>0)
							CONFIRM:C162("There is a deleted user with that name, un-delete?"; "No"; "Undelete")
							If (OK=0)
								SET QUERY DESTINATION:C396(0)
								QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Name:2=$_t_PersonName; *)
								QUERY:C277([PERSONNEL:11];  & ; [PERSONNEL:11]PersonDeleted:38=1)
								LAST RECORD:C200([PERSONNEL:11])
								[PERSONNEL:11]PersonDeleted:38:=0
							Else 
								SET QUERY DESTINATION:C396(0)
							End if 
						Else 
							//the user is not delete
							CONFIRM:C162("There is an active user with that name, view?"; "No"; "View")
							If (Ok=0)
								SET QUERY DESTINATION:C396(0)
								QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Name:2=$_t_PersonName)
							Else 
								SET QUERY DESTINATION:C396(0)
							End if 
						End if 
					Else 
						//no clash
						SET QUERY DESTINATION:C396(0)
						[PERSONNEL:11]Name:2:=$_t_PersonName
					End if 
					If ([PERSONNEL:11]Name:2#"")
						DB_bo_RecordModified:=True:C214
						Macro_AccTypePt(->[PERSONNEL:11]Name:2)
					End if 
				End if 
				
			: (Modified:C32([PERSONNEL:11]Job_Title:35))
				[PERSONNEL:11]Job_Title:35:=Uppers2([PERSONNEL:11]Job_Title:35)
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[PERSONNEL:11]Job_Title:35)
			: (Modified:C32([PERSONNEL:11]Supervisor:4))
				[PERSONNEL:11]Supervisor:4:=Uppercase:C13([PERSONNEL:11]Supervisor:4)
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[PERSONNEL:11]Supervisor:4)
			: (Modified:C32([PERSONNEL:11]Category_Code:6))
				Check_MinorNC(->[PERSONNEL:11]Category_Code:6; ""; ->[TIME_BILLING_CATEGORIES:46]; ->[TIME_BILLING_CATEGORIES:46]Category_Code:1; ->[TIME_BILLING_CATEGORIES:46]Category_Name:2; "Category")
				[PERSONNEL:11]Sales_Rate:5:=[TIME_BILLING_CATEGORIES:46]Sales_Rate:3
				[PERSONNEL:11]Cost_Rate:30:=[TIME_BILLING_CATEGORIES:46]Cost_Rate:4
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[PERSONNEL:11]Category_Code:6)
			: (Modified:C32([PERSONNEL:11]Reusable:3))
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[PERSONNEL:11]Reusable:3)
			: (Modified:C32([PERSONNEL:11]Sales_Rate:5))
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[PERSONNEL:11]Sales_Rate:5)
			: (Modified:C32([PERSONNEL:11]Cost_Rate:30))
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[PERSONNEL:11]Cost_Rate:30)
			: (Modified:C32([PERSONNEL:11]Active:7))
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[PERSONNEL:11]Active:7)
			: (Modified:C32([PERSONNEL:11]Adhoc_Budget:8))
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[PERSONNEL:11]Adhoc_Budget:8)
			: (Modified:C32([PERSONNEL:11]Last_Export:10))
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[PERSONNEL:11]Last_Export:10)
			: (Modified:C32([PERSONNEL:11]Export_Path:11))
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[PERSONNEL:11]Export_Path:11)
			: (Modified:C32([PERSONNEL:11]Last_Import:12))
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[PERSONNEL:11]Last_Import:12)
			: (Modified:C32([PERSONNEL:11]Person_Identity:13))
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[PERSONNEL:11]Person_Identity:13)
			: (Modified:C32([PERSONNEL:11]Import_Set_Path:14))
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[PERSONNEL:11]Import_Set_Path:14)
			: (Modified:C32([PERSONNEL:11]Startup_List:15))
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[PERSONNEL:11]Startup_List:15)
			: (Modified:C32([PERSONNEL:11]Startup_Diary:16))
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[PERSONNEL:11]Startup_Diary:16)
			: (Modified:C32([PERSONNEL:11]Office_Code:17))
				[PERSONNEL:11]Office_Code:17:=Uppercase:C13([PERSONNEL:11]Office_Code:17)
				If ([PERSONNEL:11]Office_Code:17#"")
					$Init:=[PERSONNEL:11]Initials:1
					$_t_OfficeCode:=[PERSONNEL:11]Office_Code:17
					$COC:=DB_GetOrganisationOfficeCode
					$COC:=Substring:C12($COC; 1; Length:C16($COC)-1)
					DB_SaveRecord(->[PERSONNEL:11])
					AA_CheckFileUnlocked(->[PERSONNEL:11]Personnel_ID:48)
					CUT NAMED SELECTION:C334([PERSONNEL:11]; "Personnel")
					QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Office_Code:17=$_t_OfficeCode; *)
					QUERY:C277([PERSONNEL:11];  & ; [PERSONNEL:11]Initials:1#$Init)
					If ((Records in selection:C76([PERSONNEL:11])>0) | ($_t_OfficeCode=$COC))
						USE NAMED SELECTION:C332("Personnel")
						Gen_Alert("That Office Code is already in use"; "Try again")
						[PERSONNEL:11]Office_Code:17:=""
						DB_SaveRecord(->[PERSONNEL:11])
						AA_CheckFileUnlocked(->[PERSONNEL:11]Personnel_ID:48)
						REJECT:C38([PERSONNEL:11]Office_Code:17)
					Else 
						USE NAMED SELECTION:C332("Personnel")
					End if 
				End if 
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[PERSONNEL:11]Office_Code:17)
			: (Modified:C32([PERSONNEL:11]Analysis_Code:20))
				If ([PERSONNEL:11]Analysis_Code:20="ASK")
					[PERSONNEL:11]Analysis_Code:20:=Uppercase:C13([PERSONNEL:11]Analysis_Code:20)
				Else 
					Check_MinorNC(->[PERSONNEL:11]Analysis_Code:20; "Analysis"; ->[ANALYSES:36]; ->[ANALYSES:36]Analysis_Code:1; ->[ANALYSES:36]Analysis_Name:2)
				End if 
				If ([PERSONNEL:11]Analysis_Code:20="")
					[PERSONNEL:11]Analysis_Override:24:=False:C215
					[PERSONNEL:11]Analysis_Only:25:=False:C215
				End if 
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[PERSONNEL:11]Analysis_Code:20)
			: (Modified:C32([PERSONNEL:11]Analysis_Override:24))
				DB_bo_RecordModified:=True:C214
				If ([PERSONNEL:11]Analysis_Code:20="")
					[PERSONNEL:11]Analysis_Override:24:=False:C215
				End if 
				If ([PERSONNEL:11]Analysis_Override:24=False:C215)
					[PERSONNEL:11]Analysis_Only:25:=False:C215
				End if 
				Macro_AccTypePt(->[PERSONNEL:11]Analysis_Override:24)
			: (Modified:C32([PERSONNEL:11]Analysis_Only:25))
				DB_bo_RecordModified:=True:C214
				If ([PERSONNEL:11]Analysis_Override:24=False:C215)
					[PERSONNEL:11]Analysis_Only:25:=False:C215
				End if 
				Macro_AccTypePt(->[PERSONNEL:11]Analysis_Only:25)
			: (Modified:C32([PERSONNEL:11]Group_Code:28))
				Check_MinorNC(->[PERSONNEL:11]Group_Code:28; "Group"; ->[PERSONNEL_GROUPS:92]; ->[PERSONNEL_GROUPS:92]Group_Code:1; ->[PERSONNEL_GROUPS:92]Group_Name:2; "Personnel Group")
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[PERSONNEL:11]Group_Code:28)
				If ([PERSONNEL:11]Group_Code:28#"")
					ARRAY TEXT:C222($_at_ModName; 0)
					ARRAY LONGINT:C221($_al_aStPos; 0)
					ARRAY REAL:C219($_ar_SRPrice; 0)
					ARRAY REAL:C219($_ar_SRRate; 0)
					ARRAY LONGINT:C221($_al_ShowIcon; 0)
					ARRAY LONGINT:C221($_al_ModShowLabel; 0)
					ARRAY BOOLEAN:C223($_abo_ModuleAccess; 0)
					ARRAY BOOLEAN:C223($_abo_ReadOnly; 0)
					ARRAY BOOLEAN:C223($_abo_ModuleNoDeletion; 0)
					ARRAY BOOLEAN:C223($_abo_ModuleShowIcon; 0)
					ARRAY BOOLEAN:C223($_abo_ModuleShowLabel; 0)
					ARRAY LONGINT:C221($_al_InitStartup; 0)
					ARRAY BOOLEAN:C223($_abo_ModuleInitStartup; 0)
					ARRAY LONGINT:C221($_al_DisableModule; 0)
					ARRAY BOOLEAN:C223($_abo_ModuleDisable; 0)
					ARRAY TEXT:C222(GRP_at_AModName; 0)
					ARRAY LONGINT:C221(MOD_al_GroupModuleAccessStatus; 0)
					ARRAY REAL:C219(MOD_ar_GroupSRPrice; 0)
					ARRAY REAL:C219(MOD_ar_GroupSRRate; 0)
					ARRAY LONGINT:C221(MOD_al_GroupShowIcon; 0)
					ARRAY LONGINT:C221(MOD_al_GroupShowlabel; 0)
					ARRAY BOOLEAN:C223(MOD_abo_GroupAccessBoolean; 0)
					ARRAY BOOLEAN:C223(MOD_abo_GroupReadOnly; 0)
					ARRAY BOOLEAN:C223(MOD_abo_GroupNoDeletion; 0)
					ARRAY BOOLEAN:C223(MOD_abo_GroupShowIcon; 0)
					ARRAY BOOLEAN:C223(MOD_abo_GroupShowLabel; 0)
					ARRAY LONGINT:C221(MOD_al_GroupInitStartup; 0)
					ARRAY BOOLEAN:C223(MOD_abo_GroupInitStartup; 0)
					ARRAY LONGINT:C221(MOD_al_GroupDisableVolume; 0)
					ARRAY BOOLEAN:C223(MOD_abo_GroupDisableVolume; 0)
					QUERY:C277([MODULES:63]; [MODULES:63]Code:1=("^G"+[PERSONNEL_GROUPS:92]Group_Code:1))
					Modules_ArrDisp([PERSONNEL:11]Start_Module:29)
					COPY ARRAY:C226(MOD_at_ModuleName; GRP_at_AModName)
					COPY ARRAY:C226(MOD_al_ModuleAccessStatus; MOD_al_GroupModuleAccessStatus)
					COPY ARRAY:C226(SRPrice; MOD_ar_GroupSRPrice)
					COPY ARRAY:C226(SRRate; MOD_ar_GroupSRRate)
					COPY ARRAY:C226(MOD_al_ShowIcon; MOD_al_GroupShowIcon)
					COPY ARRAY:C226(MOD_al_ShowLabel; MOD_al_GroupShowlabel)
					COPY ARRAY:C226(MOD_abo_AccessBoolean; MOD_abo_GroupAccessBoolean)
					COPY ARRAY:C226(MOD_abo_ReadOnly; MOD_abo_GroupReadOnly)
					COPY ARRAY:C226(MOD_abo_NoDeletion; MOD_abo_GroupNoDeletion)
					COPY ARRAY:C226(MOD_abo_ShowIcon; MOD_abo_GroupShowIcon)
					COPY ARRAY:C226(MOD_abo_ShowLabel; MOD_abo_GroupShowLabel)
					COPY ARRAY:C226(MOD_al_InitStartup; MOD_al_GroupInitStartup)
					COPY ARRAY:C226(MOD_abo_InitStartup; MOD_abo_GroupInitStartup)
					COPY ARRAY:C226(MOD_al_DisableVolume; MOD_al_GroupDisableVolume)
					COPY ARRAY:C226(MOD_abo_DisableVolume; MOD_abo_GroupDisableVolume)
					//```
					COPY ARRAY:C226($_at_AModName; MOD_at_ModuleName)
					COPY ARRAY:C226($_al_aStPos; MOD_al_ModuleAccessStatus)
					COPY ARRAY:C226($_ar_SRPrice; SRPrice)
					COPY ARRAY:C226($_ar_SRRate; SRRate)
					COPY ARRAY:C226($_al_ShowIcon; MOD_al_ShowIcon)
					COPY ARRAY:C226($_al_ModShowLabel; MOD_al_ShowLabel)
					COPY ARRAY:C226($_abo_ModuleAccess; MOD_abo_AccessBoolean)
					COPY ARRAY:C226($_abo_ReadOnly; MOD_abo_ReadOnly)
					COPY ARRAY:C226($_abo_ModuleNoDeletion; MOD_abo_NoDeletion)
					COPY ARRAY:C226($_abo_ModuleShowIcon; MOD_abo_ShowIcon)
					COPY ARRAY:C226($_abo_ModuleShowLabel; MOD_abo_ShowLabel)
					COPY ARRAY:C226($_al_InitStartup; MOD_al_InitStartup)
					COPY ARRAY:C226($_abo_ModuleInitStartup; MOD_abo_InitStartup)
					COPY ARRAY:C226($_al_DisableModule; MOD_al_DisableVolume)
					COPY ARRAY:C226($_abo_ModuleDisable; MOD_abo_DisableVolume)
					For ($_l_Index; 1; Size of array:C274(GRP_at_AModName))
						If (MOD_al_GroupModuleAccessStatus{$_l_Index}=1)  //Module is enabled for group..enable for user
							
							$_l_ModulePosition:=Find in array:C230(MOD_at_ModuleName; GRP_at_AModName{$_l_Index})
							If ($_l_ModulePosition>0)
								If (Not:C34(MOD_abo_DisableVolume{$_l_ModulePosition}))  //Module is disabled for user so dont enable
									If (MOD_al_ModuleAccessStatus{$_l_ModulePosition}=0)  //if module is already set in the user don;t over write with group settings
										
										
										MOD_al_ModuleAccessStatus{$_l_ModulePosition}:=1
										SRPrice{$_l_ModulePosition}:=MOD_ar_GroupSRPrice{$_l_Index}
										SRRate{$_l_ModulePosition}:=MOD_ar_GroupSRRate{$_l_Index}
										MOD_al_ShowIcon{$_l_ModulePosition}:=MOD_al_GroupShowIcon{$_l_Index}
										MOD_al_ShowLabel{$_l_ModulePosition}:=MOD_al_GroupShowlabel{$_l_Index}
										MOD_abo_AccessBoolean{$_l_ModulePosition}:=MOD_abo_GroupAccessBoolean{$_l_Index}
										MOD_abo_ReadOnly{$_l_ModulePosition}:=MOD_abo_GroupReadOnly{$_l_Index}
										MOD_abo_NoDeletion{$_l_ModulePosition}:=MOD_abo_GroupNoDeletion{$_l_Index}
										MOD_abo_ShowIcon{$_l_ModulePosition}:=MOD_abo_GroupShowIcon{$_l_Index}
										MOD_abo_ShowLabel{$_l_ModulePosition}:=MOD_abo_GroupShowLabel{$_l_Index}
										MOD_al_InitStartup{$_l_ModulePosition}:=MOD_al_GroupInitStartup{$_l_Index}
										MOD_abo_InitStartup{$_l_ModulePosition}:=MOD_abo_GroupInitStartup{$_l_Index}
										MOD_al_DisableVolume{$_l_ModulePosition}:=MOD_al_GroupDisableVolume{$_l_Index}
										MOD_abo_DisableVolume{$_l_ModulePosition}:=MOD_abo_GroupDisableVolume{$_l_Index}
									End if 
								End if 
							End if 
						Else 
							
							If (MOD_abo_GroupDisableVolume{$_l_Index})  //module is disabled for group disable for group
								
								//don't enable(different to disablle for user)
								//This DOES over-ride any settings on the user(at the moment this option is turned off on the groups anyway
								$_l_ModulePosition:=Find in array:C230(MOD_at_ModuleName; GRP_at_AModName{$_l_Index})
								If ($_l_ModulePosition>0)
									
									MOD_al_ModuleAccessStatus{$_l_ModulePosition}:=1
									SRPrice{$_l_ModulePosition}:=MOD_ar_GroupSRPrice{$_l_Index}
									SRRate{$_l_ModulePosition}:=MOD_ar_GroupSRRate{$_l_Index}
									MOD_al_ShowIcon{$_l_ModulePosition}:=MOD_al_GroupShowIcon{$_l_Index}
									MOD_al_ShowLabel{$_l_ModulePosition}:=MOD_al_GroupShowlabel{$_l_Index}
									MOD_abo_AccessBoolean{$_l_ModulePosition}:=MOD_abo_GroupAccessBoolean{$_l_Index}
									MOD_abo_ReadOnly{$_l_ModulePosition}:=MOD_abo_GroupReadOnly{$_l_Index}
									MOD_abo_NoDeletion{$_l_ModulePosition}:=MOD_abo_GroupNoDeletion{$_l_Index}
									MOD_abo_ShowIcon{$_l_ModulePosition}:=MOD_abo_GroupShowIcon{$_l_Index}
									MOD_abo_ShowLabel{$_l_ModulePosition}:=MOD_abo_GroupShowLabel{$_l_Index}
									MOD_al_InitStartup{$_l_ModulePosition}:=MOD_al_GroupInitStartup{$_l_Index}
									MOD_abo_InitStartup{$_l_ModulePosition}:=MOD_abo_GroupInitStartup{$_l_Index}
									MOD_al_DisableVolume{$_l_ModulePosition}:=MOD_al_GroupDisableVolume{$_l_Index}
									MOD_abo_DisableVolume{$_l_ModulePosition}:=MOD_abo_GroupDisableVolume{$_l_Index}
									
								End if 
							End if 
						End if 
					End for 
					//Now we are going to take out any modules that are set at system level only
					SORT ARRAY:C229(MOD_at_ModuleName; MOD_al_ModuleAccessStatus; SRPrice; SRRate; MOD_al_ShowIcon; MOD_al_ShowLabel; MOD_abo_AccessBoolean; MOD_abo_ReadOnly; MOD_abo_NoDeletion; MOD_abo_ShowIcon; MOD_abo_ShowLabel; MOD_al_InitStartup; MOD_abo_InitStartup; MOD_al_DisableVolume; MOD_abo_DisableVolume; >)
					
					
					For ($_l_Index; Size of array:C274(MOD_at_ModuleName); 1; -1)
						$_l_ModulePosition:=Find in array:C230(<>Mod_at_ModuleName; MOD_at_ModuleName{$_l_Index})
						If (<>Mod_al_AccessControlLevel{$_l_ModulePosition}<2)  //access is controlled by licence and is availbable to all groups so remove from the screen(make sure you save the access though)
							
							DELETE FROM ARRAY:C228(MOD_al_ModuleAccessStatus; $_l_Index)
							
							DELETE FROM ARRAY:C228(MOD_at_ModuleName; $_l_Index)
							DELETE FROM ARRAY:C228(SRPrice; $_l_Index)
							DELETE FROM ARRAY:C228(SRRate; $_l_Index)
							DELETE FROM ARRAY:C228(MOD_al_ShowIcon; $_l_Index)
							DELETE FROM ARRAY:C228(MOD_al_ShowLabel; $_l_Index)
							DELETE FROM ARRAY:C228(MOD_abo_AccessBoolean; $_l_Index)
							DELETE FROM ARRAY:C228(MOD_abo_ReadOnly; $_l_Index)
							DELETE FROM ARRAY:C228(MOD_abo_NoDeletion; $_l_Index)
							DELETE FROM ARRAY:C228(MOD_abo_ShowIcon; $_l_Index)
							DELETE FROM ARRAY:C228(MOD_abo_ShowLabel; $_l_Index)
							DELETE FROM ARRAY:C228(MOD_al_InitStartup; $_l_Index)
							DELETE FROM ARRAY:C228(MOD_abo_InitStartup; $_l_Index)
							DELETE FROM ARRAY:C228(MOD_abo_DisableVolume; $_l_Index)
							DELETE FROM ARRAY:C228(MOD_al_DisableVolume; $_l_Index)
							
							
						End if 
					End for 
					
				End if 
				
			: (Modified:C32([PERSONNEL:11]Email_Address:36))
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt(->[PERSONNEL:11]Email_Address:36)
				
		End case 
	: ($_l_FormEvent=On Deactivate:K2:10)
		
		If ([PERSONNEL:11]Initials:1=<>PER_t_CurrentUserInitials)
			PI_ActivatMessage:=True:C214
			SHOW PROCESS:C325(Current process:C322)
			BRING TO FRONT:C326(Current process:C322)
		End if 
		
		
		//  PAUSE PROCESS(vProc)
	: ($_l_FormEvent=On Validate:K2:3)
		
		<>USERMODID:=[PERSONNEL:11]Initials:1
		<>USERMODPREF:=[PERSONNEL:11]Functionality:33
		
		
End case 
ERR_MethodTrackerReturn("Personnel_InLP_NEW"; $_t_oldMethodName)
