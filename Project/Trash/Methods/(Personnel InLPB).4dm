//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name: Personnel_InLPB
	//------------------ Method Notes ------------------
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009 21:44`Method: Personnel_InLPB
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(CAT_abo_CatalogueEXC;0)
	//ARRAY BOOLEAN(CAT_abo_CatalogueINC;0)
	//ARRAY BOOLEAN(CAT_abo_IsAvailable;0)
	//ARRAY BOOLEAN(CAT_abo_ISDEFAULT;0)
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
	//ARRAY BOOLEAN(PER_abo_StockAccess;0)
	//ARRAY BOOLEAN(PROD_lb_Catalogues;0)
	//ARRAY BOOLEAN(STK_abo_Locationavailable;0)
	//ARRAY BOOLEAN(STK_abo_LocationInclude;0)
	//ARRAY BOOLEAN(STK_abo_LocMod0;0)
	//ARRAY DATE(CAT_ad_CatalogueAvaialbeTo;0)
	//ARRAY DATE(CAT_ad_CatalogueAvailableFrom;0)
	//ARRAY INTEGER(CAT_aI_CatalogueDF;0)
	//ARRAY INTEGER(CAT_aI_CatalogueEXC;0)
	//ARRAY INTEGER(CAT_aI_CatalogueINC;0)
	//ARRAY INTEGER(SD_ai_ActionCodes;0)
	//ARRAY INTEGER(SD_ai_ActionCodesOSW;0)
	//ARRAY LONGINT(<>aMod_l_AccessControlLevel;0)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	//ARRAY LONGINT(<>Mod_al_AccessControlLevel;0)
	//ARRAY LONGINT(<>MP_al_DiaryAccessID;0)
	//ARRAY LONGINT(<>PW_al_4DGroupIDs;0)
	//ARRAY LONGINT(<>PW_al_4DUserGroupsBinaries;0)
	//ARRAY LONGINT(<>PW_al_4DUserGroupsINC;0)
	//ARRAY LONGINT(CAT_al_CatalogueClass;0)
	//ARRAY LONGINT(CAT_al_CatalogueID;0)
	//ARRAY LONGINT(CAT_al_CatalogueImageSource;0)
	//ARRAY LONGINT(MOD_al_DisableVolume;0)
	//ARRAY LONGINT(MOD_al_GroupDisableVolume;0)
	//ARRAY LONGINT(MOD_al_GroupInitStartup;0)
	//ARRAY LONGINT(MOD_al_GroupModuleAccessStatus;0)
	//ARRAY LONGINT(MOD_al_GroupShowIcon;0)
	//ARRAY LONGINT(MOD_al_GroupShowlabel;0)
	//ARRAY LONGINT(MOD_al_InitStartup;0)
	//ARRAY LONGINT(MOD_al_ModuleAccessStatus;0)
	//ARRAY LONGINT(MOD_al_ShowIcon;0)
	//ARRAY LONGINT(MOD_al_ShowLabel;0)
	//ARRAY LONGINT(PER_al_ContextViews;0)
	//ARRAY LONGINT(SMTP_al_UserAuthActive;0)
	//ARRAY LONGINT(SMTP_al_UserIDs;0)
	//ARRAY LONGINT(STK_al_CodingPref;0)
	//ARRAY LONGINT(STK_al_CodingPref0;0)
	//ARRAY LONGINT(STK_al_LocationSettings;0)
	//ARRAY LONGINT(STK_al_LocationsIDs0;0)
	//ARRAY LONGINT(STK_al_Locationstoshow;0)
	//ARRAY LONGINT(STK_al_ParentLocation0;0)
	//ARRAY LONGINT(STK_al_PricingOptions;0)
	//ARRAY LONGINT(STK_al_ToplevelLocations;0)
	//ARRAY REAL(MOD_ar_GroupSRPrice;0)
	//ARRAY REAL(MOD_ar_GroupSRRate;0)
	//ARRAY REAL(SRPrice;0)
	//ARRAY REAL(SRRate;0)
	//ARRAY REAL(STK_ar_StockAtLocation0;0)
	//ARRAY TEXT(<>DB_at_TableNames;0)
	//ARRAY TEXT(<>Mod_at_ModuleName;0)
	//ARRAY TEXT(<>MP_at_DiaryAccessNames;0)
	//ARRAY TEXT(<>MP_at_DiaryAcessInitials;0)
	//ARRAY TEXT(<>PW_at_4DUserGroups;0)
	//ARRAY TEXT(CAT_at_CatalogueClass;0)
	//ARRAY TEXT(CAT_at_CatalogueImagePath;0)
	//ARRAY TEXT(CAT_at_CatalogueNames;0)
	//ARRAY TEXT(GRP_at_AModName;0)
	//ARRAY TEXT(MOD_at_ModuleName;0)
	//ARRAY TEXT(PER_at_aStaffDelete;0)
	//ARRAY TEXT(PER_at_ContextViews;0)
	//ARRAY TEXT(PER_at_ShareDelete;0)
	//ARRAY TEXT(PER_at_StaffDelete;0)
	//ARRAY TEXT(PER_S5_aStaffDelete;0)
	//ARRAY TEXT(STK_at_LevelLabel0;0)
	//ARRAY TEXT(STK_at_LocationCodes0;0)
	//ARRAY TEXT(STK_at_LocationHolds0;0)
	//ARRAY TEXT(STK_at_LocationNames0;0)
	//ARRAY TEXT(STK_at_Locationstoshow;0)
	//ARRAY TEXT(STK_at_LocProdCode0;0)
	//ARRAY TEXT(STK_at_LocProdName0;0)
	//ARRAY TEXT(STK_at_PricingOptions;0)
	//ARRAY TEXT(STK_at_PrimeLocations;0)
	//ARRAY TEXT(STK_at_SubLevelLabel;0)
	//ARRAY TEXT(STK_at_ToplevelLocations;0)
	C_BOOLEAN:C305(<>DB_bo_NewStockActive; <>PW_Bo_WindowsAutoLogin; <>STK_bo_UseNew; <>SYS_bo_PWActive; $_bo_GroupSet; CCM_bo_IsLicenced; PER_Bo_GetStaff; PER_Bo_ShareSetup; SD_bo_ChangePrefs; vMod2; vMod3)
	C_LONGINT:C283(<>Mod_l_MaxModules; <>PER_l_AccessLevel; <>USERMODPREF; $_l_AsciiChar; $_l_GroupBinary; $_l_Index; $_l_LocationsRow; $_l_ModuleRow; $_l_PricingRow; $_l_Process; $_l_SizeofArray)
	C_LONGINT:C283($_l_StartModuleRow; $_l_ViewRow; bd1; bd2; bd20; bd3; bd4; bd5; bd6; bd7; CAT_l_BUT1)
	C_LONGINT:C283(CAT_l_But2; CAT_l_BUT3; CAT_l_BUT4; CAT_l_BUT5; CAT_l_BUT6; CAT_l_BUT7; CAT_l_BUT8; CAT_l_BUT9; PER_l_allowDecode; PER_l_InitIM; PER_l_RunReminders)
	C_LONGINT:C283(PER_l_ShowNothing; PER_l_ShowSchedule; PER_l_ShowWorkflow; PER_l_UseAuthentication; SD_l_UseAgenda; STK_l_BUT1; STK_l_BUT10; STK_l_BUT11; STK_l_BUT12; STK_l_But2; STK_l_BUT3)
	C_LONGINT:C283(STK_l_BUT4; STK_l_BUT5; STK_l_BUT6; STK_l_BUT7; STK_l_BUT8; STK_l_BUT9; STK_l_PricingOption; vNo2)
	C_REAL:C285(STK_at_CostPriceOptions)
	C_TEXT:C284(<>DefCopytoaddress; <>DefSignature; <>EMAIL_t_DefaultReplyToAddress; <>EMAIL_t_DefaultSMTPhost; <>USERMODID; $_t_oldMethodName; CAT_t_COL1; CAT_t_COL2; CAT_t_COL3; CAT_t_COL4; CAT_t_COL5)
	C_TEXT:C284(CAT_t_COL6; CAT_t_COL7; CAT_t_COL8; CAT_t_COL9; CAT_t_HED1; CAT_t_HED2; CAT_t_HED3; CAT_t_HED4; CAT_t_HED5; CAT_t_HED6; CAT_t_HED7)
	C_TEXT:C284(CAT_t_HED8; CAT_t_HED9; DB_t_CallOnCloseorSave; PER_t_PasswordText; PER_t_UserName; PER_t_UserPassword; PER_t_UserPasswordLOCK; STK_t_COL1; STK_t_COL10; STK_t_COL11; STK_t_COL2)
	C_TEXT:C284(STK_t_COL3; STK_t_COL4; STK_t_COL5; STK_t_COL6; STK_t_COL7; STK_t_COL8; STK_t_COL9; STK_t_HED1; STK_t_HED10; STK_t_HED11; STK_t_HED2)
	C_TEXT:C284(STK_t_HED3; STK_t_HED4; STK_t_HED5; STK_t_HED6; STK_t_HED7; STK_t_HED8; STK_t_HED9; vButtDisPersonnel; vGroup)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("Personnel_InLPB")
If (<>Mod_l_MaxModules=0)
	GET PROCESS VARIABLE:C371(-1; <>Mod_l_MaxModules; <>Mod_l_MaxModules)
End if 
vMod3:=False:C215
vMod2:=False:C215
SD_l_UseAgenda:=Num:C11(SD_GetAgendaLicence([PERSONNEL:11]Initials:1))

RELATE ONE:C42([PERSONNEL:11]Category_Code:6)
vNo2:=Length:C16([PERSONNEL:11]Person_Identity:13)
PER_l_ShowWorkflow:=0
PER_l_ShowSchedule:=0
PER_l_RunReminders:=0
PER_l_ShowNothing:=0
Case of 
	: ([PERSONNEL:11]Startup_Diary:16=0)
		PER_l_ShowNothing:=1
	: ([PERSONNEL:11]Startup_Diary:16=1)
		PER_l_ShowSchedule:=1  // Value 1
		
	: ([PERSONNEL:11]Startup_Diary:16=2)
		PER_l_ShowWorkflow:=1  //Value 2
		
	: ([PERSONNEL:11]Startup_Diary:16=3)
		PER_l_ShowWorkflow:=1
		PER_l_ShowSchedule:=1
	: ([PERSONNEL:11]Startup_Diary:16=4)  // reminders only=show nothing is set
		PER_l_ShowWorkflow:=0  //
		
		
		PER_l_ShowSchedule:=0
		PER_l_RunReminders:=1  //Value 4
		
		PER_l_ShowNothing:=1
	: ([PERSONNEL:11]Startup_Diary:16=5)  //Schedule and reminders
		PER_l_ShowWorkflow:=0  //Value 1
		
		
		PER_l_ShowSchedule:=1
		PER_l_RunReminders:=1  //Value 4
	: ([PERSONNEL:11]Startup_Diary:16=6)  //WorkFlow and reminders
		
		
		PER_l_ShowWorkflow:=1
		PER_l_ShowSchedule:=0  // Value 2
		PER_l_RunReminders:=1  //Value 4
	: ([PERSONNEL:11]Startup_Diary:16=7)  //WorkFlow  Schedule and reminders
		PER_l_ShowWorkflow:=1  //Value 1
		PER_l_ShowSchedule:=1  //Value 2
		PER_l_RunReminders:=1  //Value 4
		
		
		
		
		
		
End case 

DB_t_CallOnCloseorSave:="P:Personnel_InLPA"
RELATE ONE:C42([PERSONNEL:11]Group_Code:28)
vGroup:=[PERSONNEL_GROUPS:92]Group_Name:2

If ((DB_GetModuleSettingByNUM(Module_JobCosting))<2)
	//Job Costing
	DB_MenuAction("Section"; "Job Costing"; 3; "")
	
Else 
	READ WRITE:C146([TIME_BUDGETS:49])
End if 
If ((DB_GetModuleSettingByNUM(21))<2)
	DB_MenuAction("Section"; "Remote Access"; 3; "")
End if 

If (((<>PER_l_AccessLevel<2) & (DB_GetModuleSettingByNUM(Module_DataManager)=2)) | (<>PER_l_AccessLevel=0))
	
	READ ONLY:C145([MODULES:63])
	//Ng dont forget to also load this if you put the group in
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
	
	If ([PERSONNEL:11]Group_Code:28#"")
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
	End if 
	
	If ([PERSONNEL:11]Initials:1="")
		REDUCE SELECTION:C351([MODULES:63]; 0)
	Else 
		QUERY:C277([MODULES:63]; [MODULES:63]Code:1=[PERSONNEL:11]Initials:1)
	End if 
	Modules_ArrDisp([PERSONNEL:11]Start_Module:29)
	For ($_l_Index; 1; Size of array:C274(GRP_at_AModName))
		If (MOD_al_GroupModuleAccessStatus{$_l_Index}=1)  //Module is enabled for group..enable for user
			
			$_l_ModuleRow:=Find in array:C230(MOD_at_ModuleName; GRP_at_AModName{$_l_Index})
			If ($_l_ModuleRow>0)
				If (Not:C34(MOD_abo_DisableVolume{$_l_ModuleRow}))  //Module is disabled for user so dont enable
					If (MOD_al_ModuleAccessStatus{$_l_ModuleRow}=0)  //if module is already set in the user don;t over write with group settings
						
						
						MOD_al_ModuleAccessStatus{$_l_ModuleRow}:=1
						SRPrice{$_l_ModuleRow}:=MOD_ar_GroupSRPrice{$_l_Index}
						SRRate{$_l_ModuleRow}:=MOD_ar_GroupSRRate{$_l_Index}
						MOD_al_ShowIcon{$_l_ModuleRow}:=MOD_al_GroupShowIcon{$_l_Index}
						MOD_al_ShowLabel{$_l_ModuleRow}:=MOD_al_GroupShowlabel{$_l_Index}
						MOD_abo_AccessBoolean{$_l_ModuleRow}:=MOD_abo_GroupAccessBoolean{$_l_Index}
						MOD_abo_ReadOnly{$_l_ModuleRow}:=MOD_abo_GroupReadOnly{$_l_Index}
						MOD_abo_NoDeletion{$_l_ModuleRow}:=MOD_abo_GroupNoDeletion{$_l_Index}
						MOD_abo_ShowIcon{$_l_ModuleRow}:=MOD_abo_GroupShowIcon{$_l_Index}
						MOD_abo_ShowLabel{$_l_ModuleRow}:=MOD_abo_GroupShowLabel{$_l_Index}
						MOD_al_InitStartup{$_l_ModuleRow}:=MOD_al_GroupInitStartup{$_l_Index}
						MOD_abo_InitStartup{$_l_ModuleRow}:=MOD_abo_GroupInitStartup{$_l_Index}
						MOD_al_DisableVolume{$_l_ModuleRow}:=MOD_al_GroupDisableVolume{$_l_Index}
						MOD_abo_DisableVolume{$_l_ModuleRow}:=MOD_abo_GroupDisableVolume{$_l_Index}
					End if 
				End if 
			End if 
		Else 
			
			If (MOD_abo_GroupDisableVolume{$_l_Index})  //module is disabled for group disable for group
				
				//don't enable(different to disablle for user)
				//This DOES over-ride any settings on the user(at the moment this option is turned off on the groups anyway
				$_l_ModuleRow:=Find in array:C230(MOD_at_ModuleName; GRP_at_AModName{$_l_Index})
				If ($_l_ModuleRow>0)
					
					MOD_al_ModuleAccessStatus{$_l_ModuleRow}:=1
					SRPrice{$_l_ModuleRow}:=MOD_ar_GroupSRPrice{$_l_Index}
					SRRate{$_l_ModuleRow}:=MOD_ar_GroupSRRate{$_l_Index}
					MOD_al_ShowIcon{$_l_ModuleRow}:=MOD_al_GroupShowIcon{$_l_Index}
					MOD_al_ShowLabel{$_l_ModuleRow}:=MOD_al_GroupShowlabel{$_l_Index}
					MOD_abo_AccessBoolean{$_l_ModuleRow}:=MOD_abo_GroupAccessBoolean{$_l_Index}
					MOD_abo_ReadOnly{$_l_ModuleRow}:=MOD_abo_GroupReadOnly{$_l_Index}
					MOD_abo_NoDeletion{$_l_ModuleRow}:=MOD_abo_GroupNoDeletion{$_l_Index}
					MOD_abo_ShowIcon{$_l_ModuleRow}:=MOD_abo_GroupShowIcon{$_l_Index}
					MOD_abo_ShowLabel{$_l_ModuleRow}:=MOD_abo_GroupShowLabel{$_l_Index}
					MOD_al_InitStartup{$_l_ModuleRow}:=MOD_al_GroupInitStartup{$_l_Index}
					MOD_abo_InitStartup{$_l_ModuleRow}:=MOD_abo_GroupInitStartup{$_l_Index}
					MOD_al_DisableVolume{$_l_ModuleRow}:=MOD_al_GroupDisableVolume{$_l_Index}
					MOD_abo_DisableVolume{$_l_ModuleRow}:=MOD_abo_GroupDisableVolume{$_l_Index}
					
				End if 
			End if 
		End if 
	End for 
	//Now we are going to take out any modules that are set at system level only
	SORT ARRAY:C229(MOD_at_ModuleName; MOD_al_ModuleAccessStatus; SRPrice; SRRate; MOD_al_ShowIcon; MOD_al_ShowLabel; MOD_abo_AccessBoolean; MOD_abo_ReadOnly; MOD_abo_NoDeletion; MOD_abo_ShowIcon; MOD_abo_ShowLabel; MOD_al_InitStartup; MOD_abo_InitStartup; MOD_al_DisableVolume; MOD_abo_DisableVolume; >)
	
	
	For ($_l_Index; Size of array:C274(MOD_at_ModuleName); 1; -1)
		$_l_ModuleRow:=Find in array:C230(<>Mod_at_ModuleName; MOD_at_ModuleName{$_l_Index})
		If (<>Mod_al_AccessControlLevel{$_l_ModuleRow}<2)  //access is controlled by licence and is availbable to all groups so remove from the screen(make sure you save the access though)
			
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
	$_l_ModuleRow:=Find in array:C230(MOD_at_ModuleName; "Internet Manager")
	If ($_l_ModuleRow>0)
		If (MOD_al_ModuleAccessStatus{$_l_ModuleRow}=1)  // it is enabled
			
			OBJECT SET ENABLED:C1123(PER_l_InitIM; True:C214)  //kmw 07/10/08 v631b120, fixed to use enable button instead of set enterable
			PER_l_InitIM:=MOD_al_InitStartup{$_l_ModuleRow}  //added to fix problem with button reverting back 07/10/08 v631b120 -kmw (didn't simply check boolean MOD_abo_InitStartup array as wasn't sure if it would be set yet or not).
			
			
			//
		Else 
			OBJECT SET ENABLED:C1123(PER_l_InitIM; False:C215)  //kmw 07/10/08 v631b120, fixed to use disable button instead of set enterable
			
		End if 
	Else 
		OBJECT SET VISIBLE:C603(PER_l_InitIM; False:C215)
		
	End if 
	ARRAY LONGINT:C221(PER_al_ContextViews; 0)
	ARRAY TEXT:C222(PER_at_ContextViews; 0)
	If ([PERSONNEL:11]Start_Module:29="")
		$_l_StartModuleRow:=0
	Else 
		$_l_StartModuleRow:=Find in array:C230(<>Mod_at_ModuleName; [PERSONNEL:11]Start_Module:29)
	End if 
	Modules_LoadContextViews($_l_StartModuleRow; ->PER_al_ContextViews; ->PER_at_ContextViews)
	If ([PERSONNEL:11]HomeTable:52>0)
		$_l_ViewRow:=Find in array:C230(PER_al_ContextViews; [PERSONNEL:11]HomeTable:52)
		If ($_l_ViewRow<0)
			$_l_ViewRow:=0
		End if 
	Else 
		$_l_ViewRow:=0
	End if 
	PER_at_ContextViews:=$_l_ViewRow
	
	
	
	//Note that we now have two sets of arrays here one for the group settings and one for the user..
Else 
	DB_MenuAction("Section"; "Access Rights"; 3; "")
	//DISABLE MENU ITEM(2049;4)
	OBJECT SET ENABLED:C1123(bd1; False:C215)
	OBJECT SET ENABLED:C1123(bd2; False:C215)
	OBJECT SET ENABLED:C1123(bd3; False:C215)
	OBJECT SET ENABLED:C1123(bd4; False:C215)
	OBJECT SET ENABLED:C1123(bd5; False:C215)
	OBJECT SET ENABLED:C1123(bd6; False:C215)
	OBJECT SET ENABLED:C1123(bd7; False:C215)
	OBJECT SET ENABLED:C1123(bd20; False:C215)
End if 
If ([PERSONNEL:11]Initials:1#"")
	QUERY:C277([TIME_BUDGETS:49]; [TIME_BUDGETS:49]Person:1=[PERSONNEL:11]Initials:1)
	GOTO OBJECT:C206([PERSONNEL:11]Name:2)
Else 
	REDUCE SELECTION:C351([TIME_BUDGETS:49]; 0)
End if 
//If (DB_GetModuleSetting(Module_Macros)<2)
//  SET ENTERABLE([PERSONNEL]Macro Process;False)
//End if
If ((DB_GetModuleSettingByNUM(1))=5)
	OBJECT SET ENTERABLE:C238([PERSONNEL:11]Default_List_Lay:31; False:C215)
End if 

If ([PERSONNEL:11]Functionality:33=0)
	If ((DB_GetModuleSettingByNUM(1))=5)
		[PERSONNEL:11]Functionality:33:=[PERSONNEL:11]Functionality:33 ?+ 1
	Else 
		[PERSONNEL:11]Functionality:33:=[PERSONNEL:11]Functionality:33 ?+ 6
	End if 
End if 
bd20:=[PERSONNEL:11]Functionality:33
Personnel_FuncP
QUERY:C277([PERSONNEL_DIARY_ACCESS:149]; [PERSONNEL_DIARY_ACCESS:149]Person_Code:4=[PERSONNEL:11]Initials:1)

ARRAY TEXT:C222(<>MP_at_DiaryAcessInitials; 0)
ARRAY TEXT:C222(<>MP_at_DiaryAccessNames; 0)
ARRAY LONGINT:C221(<>MP_al_DiaryAccessID; 0)
SELECTION TO ARRAY:C260([PERSONNEL_DIARY_ACCESS:149]Person:1; <>MP_at_DiaryAcessInitials)

If (True:C214)
	$_l_Process:=New process:C317("LoadDiaryAccess"; 128000; "DiaryAccess"; [PERSONNEL:11]Initials:1)
End if 


If ((DB_GetModuleSettingByNUM(1))#5)
	<>DB_at_TableNames:=Find in array:C230(<>DB_al_TableNums; 2)
	FurthFldP_InLPB(<>DB_at_TableNames)
Else 
	DB_MenuAction("Section"; "Further Fields"; 3; "")
	//DISABLE MENU ITEM(2049;5)
End if 
PER_Bo_GetStaff:=False:C215
PER_Bo_ShareSetup:=False:C215
ARRAY TEXT:C222(PER_at_ShareDelete; 0)
ARRAY TEXT:C222(PER_at_aStaffDelete; 0)  //People to remove this supervisor from if we save

$_l_Process:=New process:C317("PER_GetDiaryShares"; 128000; "GET SHARES"; Current process:C322; [PERSONNEL:11]Initials:1)
$_l_Process:=New process:C317("PER_GetStaff"; 128000; "GET STAFF"; Current process:C322; [PERSONNEL:11]Initials:1)
If ([PERSONNEL:11]Personnel_ID:48=0)
	[PERSONNEL:11]Personnel_ID:48:=AA_GetNextIDinMethod(->[PERSONNEL:11]Personnel_ID:48)
End if 
// Color:=(Foreground+(256*Background))
//SET COLOR(Per_Pi_Body;-(243+(256*243)))
//SET COLOR(Per_Pi_Header;-(223+(256*223)))

Repeat 
	DelayTicks(10)
Until (PER_Bo_GetStaff) & (PER_Bo_ShareSetup)

ARRAY TEXT:C222(PERS_at_TableNames; Size of array:C274(<>DB_at_TableNames))
For ($_l_Index; 1; Size of array:C274(<>DB_at_TableNames))
	PERS_at_TableNames{$_l_Index}:=<>DB_at_TableNames{$_l_Index}
End for 


CAT_LoadCats([PERSONNEL:11]Personnel_ID:48)
ARRAY BOOLEAN:C223(CAT_abo_IsAvailable; 0)
ARRAY BOOLEAN:C223(CAT_abo_ISDEFAULT; 0)
$_l_SizeofArray:=Size of array:C274(CAT_aI_CatalogueDF)
ARRAY BOOLEAN:C223(CAT_abo_IsAvailable; $_l_SizeofArray)
ARRAY BOOLEAN:C223(CAT_abo_CatalogueINC; $_l_SizeofArray)
ARRAY BOOLEAN:C223(CAT_abo_CatalogueEXC; $_l_SizeofArray)
ARRAY BOOLEAN:C223(CAT_abo_ISDEFAULT; $_l_SizeofArray)
For ($_l_Index; 1; Size of array:C274(CAT_abo_IsAvailable))
	CAT_abo_CatalogueEXC{$_l_Index}:=(CAT_aI_CatalogueEXC{$_l_Index}=1)
	CAT_abo_CatalogueINC{$_l_Index}:=(CAT_aI_CatalogueINC{$_l_Index}=1)
	CAT_abo_ISDEFAULT{$_l_Index}:=(CAT_aI_CatalogueDF{$_l_Index}=1)
End for 
//There are two 'Catalogues' that will be hidden--Reserved Names;'Price List' and 'All Products'

LB_SetupListbox(->PROD_lb_Catalogues; "CAT_t"; "CAT_L"; 1; ->CAT_abo_ISDEFAULT; ->CAT_abo_CatalogueINC; ->CAT_abo_CatalogueEXC; ->CAT_at_CatalogueNames; ->CAT_ad_CatalogueAvailableFrom; ->CAT_ad_CatalogueAvaialbeTo; ->CAT_at_CatalogueClass; ->CAT_at_CatalogueImagePath; ->CAT_al_CatalogueID; ->CAT_aI_CatalogueDF; ->CAT_aI_CatalogueINC; ->CAT_aI_CatalogueEXC; ->CAT_al_CatalogueImageSource; ->CAT_al_CatalogueClass)

LB_SetColumnHeaders(->PROD_lb_Catalogues; "CAT_L"; 1; "Default"; "Available"; "Exclude"; "Name")
LB_SetColumnWidths(->PROD_lb_Catalogues; "CAT_t"; 1; 30; 30; 30; 50; 180; 0; 0; 0; 0; 0; 0; 0; 0; 0)
LB_SetEnterable(->PROD_lb_Catalogues; False:C215; 0)
LB_SetEnterable(->PROD_lb_Catalogues; True:C214; 1)
LB_SetEnterable(->PROD_lb_Catalogues; True:C214; 2)
LB_SetEnterable(->PROD_lb_Catalogues; True:C214; 3)
LB_SetScroll(->PROD_lb_Catalogues; -3; -2)

LB_StyleSettings(->PROD_lb_Catalogues; "Black"; 9; "CAT_t"; ->[DIARY:12])


INT_SetLongintCheckFormat(->SD_ai_ActionCodes)
INT_SetLongintCheckFormat(->SD_ai_ActionCodesOSW)
CCM_LoadServiceProvidersV11(True:C214)
If (CCM_bo_IsLicenced)
	OBJECT SET VISIBLE:C603(PER_l_allowDecode; True:C214)
	If (Current user:C182="Administrator") | (User in group:C338(Current user:C182; "Administrator")) | (Current user:C182="Designer")
		OBJECT SET ENTERABLE:C238(PER_l_allowDecode; True:C214)
	End if 
Else 
	OBJECT SET VISIBLE:C603(PER_l_allowDecode; False:C215)
End if 
PER_l_allowDecode:=[PERSONNEL:11]CCM_L_DisplayFullCard:50
SD_bo_ChangePrefs:=False:C215
//I REALLY wanted this bit in a trigger
//but it causes the groups records to unloadduring startupso
//`
If ([PERSONNEL:11]PER_SMTPHOST:41="")
	If ([PERSONNEL_GROUPS:92]Group_Code:1#[PERSONNEL:11]Group_Code:28)
		QUERY:C277([PERSONNEL_GROUPS:92]; [PERSONNEL_GROUPS:92]Group_Code:1=[PERSONNEL:11]Group_Code:28)
	End if 
	If ([PERSONNEL_GROUPS:92]X_DEF_GRP_SMTPHOST:5#"")
		[PERSONNEL:11]PER_SMTPHOST:41:=[PERSONNEL_GROUPS:92]X_DEF_GRP_SMTPHOST:5
	Else 
		[PERSONNEL:11]PER_SMTPHOST:41:=<>EMAIL_t_DefaultSMTPhost
	End if 
End if 
If ([PERSONNEL:11]Email_Address:36="")
	If ([PERSONNEL_GROUPS:92]Group_Code:1#[PERSONNEL:11]Group_Code:28)
		QUERY:C277([PERSONNEL_GROUPS:92]; [PERSONNEL_GROUPS:92]Group_Code:1=[PERSONNEL:11]Group_Code:28)
	End if 
	If ([PERSONNEL_GROUPS:92]X_DEF_GRP_ReplyToAddress:6#"")
		[PERSONNEL:11]Email_Address:36:=[PERSONNEL_GROUPS:92]X_DEF_GRP_ReplyToAddress:6
	Else 
		[PERSONNEL:11]Email_Address:36:=<>EMAIL_t_DefaultReplyToAddress
	End if 
End if 
If ([PERSONNEL:11]PER_CopyToAddress:42="")
	If ([PERSONNEL_GROUPS:92]Group_Code:1#[PERSONNEL:11]Group_Code:28)
		QUERY:C277([PERSONNEL_GROUPS:92]; [PERSONNEL_GROUPS:92]Group_Code:1=[PERSONNEL:11]Group_Code:28)
	End if 
	If ([PERSONNEL_GROUPS:92]X_DEF_GRP_copytoAdress:7#"")
		[PERSONNEL:11]PER_CopyToAddress:42:=[PERSONNEL_GROUPS:92]X_DEF_GRP_copytoAdress:7
		[PERSONNEL:11]PER_CopytoOption:43:=[PERSONNEL_GROUPS:92]X_Def_CopytoOption:8
	Else 
		[PERSONNEL:11]PER_CopyToAddress:42:=<>DefCopytoaddress
	End if 
End if 
If ([PERSONNEL:11]Per_DefaultSignature:44="")
	If ([PERSONNEL_GROUPS:92]Group_Code:1#[PERSONNEL:11]Group_Code:28)
		QUERY:C277([PERSONNEL_GROUPS:92]; [PERSONNEL_GROUPS:92]Group_Code:1=[PERSONNEL:11]Group_Code:28)
	End if 
	If ([PERSONNEL_GROUPS:92]X_Def_GRP_Signature:9#"")
		[PERSONNEL:11]Per_DefaultSignature:44:=[PERSONNEL_GROUPS:92]X_Def_GRP_Signature:9
	Else 
		[PERSONNEL:11]Per_DefaultSignature:44:=<>DefSignature
	End if 
End if 
Per_LOADSMTPAUTH([PERSONNEL:11]Personnel_ID:48; ->PER_l_UseAuthentication; ->PER_t_UserName; ->PER_t_UserPassword; ->SMTP_al_UserIDs; ->SMTP_al_UserAuthActive)
PER_t_UserPasswordLOCK:=PER_t_UserPassword
PER_t_PasswordText:=PER_t_UserPasswordLOCK
For ($_l_Index; 1; Length:C16(PER_t_UserPasswordLOCK))
	PER_t_UserPasswordLOCK[[$_l_Index]]:="x"
End for 
If (<>DB_bo_NewStockActive)
	ARRAY TEXT:C222(STK_at_PricingOptions; 0)
	ARRAY LONGINT:C221(STK_al_PricingOptions; 0)
	If (<>STK_bo_UseNew)
		If (DB_GetModuleSettingByNUM(Module_StockControl)>=2)
			
			
			QUERY:C277([LOCATIONS:61]; [LOCATIONS:61]ParentLocationID:3=0)
			ARRAY TEXT:C222(STK_at_LocationNames0; 0)
			ARRAY LONGINT:C221(STK_al_LocationsIDs0; 0)
			ARRAY TEXT:C222(STK_at_LocationCodes0; 0)
			ARRAY TEXT:C222(STK_at_LevelLabel0; 0)
			ARRAY LONGINT:C221(STK_al_CodingPref0; 0)
			ARRAY LONGINT:C221(STK_al_ParentLocation0; 0)  //This will always be 0's
			
			ARRAY TEXT:C222(STK_at_LocProdCode0; 0)
			ARRAY TEXT:C222(STK_at_LocProdName0; 0)
			ARRAY BOOLEAN:C223(STK_abo_LocMod0; 0)
			ARRAY REAL:C219(STK_ar_StockAtLocation0; 0)
			ARRAY TEXT:C222(STK_at_LocationHolds0; 0)
			SELECTION TO ARRAY:C260([LOCATIONS:61]Location_Code:1; STK_at_PrimeLocations; [LOCATIONS:61]Location_Name:2; STK_at_ToplevelLocations; [LOCATIONS:61]LocationID:4; STK_al_ToplevelLocations; [LOCATIONS:61]Sub_location_Labelled:6; STK_at_SubLevelLabel; [LOCATIONS:61]Sub_LocationCodingPref:7; STK_al_CodingPref)
			SELECTION TO ARRAY:C260([LOCATIONS:61]Location_Code:1; STK_at_LocationCodes0; [LOCATIONS:61]Location_Name:2; STK_at_LocationNames0; [LOCATIONS:61]LocationID:4; STK_al_LocationsIDs0; [LOCATIONS:61]Sub_location_Labelled:6; STK_at_LevelLabel0; [LOCATIONS:61]Sub_LocationCodingPref:7; STK_al_CodingPref0)
			
			
			ARRAY TEXT:C222(STK_at_PricingOptions; 4)
			ARRAY LONGINT:C221(STK_al_PricingOptions; 4)
			STK_at_PricingOptions{1}:="Cost Prices from Product"
			STK_at_PricingOptions{2}:="Cost Price from Product using Price Table"
			STK_at_PricingOptions{3}:="Cost Prices from Purchase Order"
			STK_at_PricingOptions{4}:="Actual value of allocated stock"
			STK_al_PricingOptions{1}:=1
			STK_al_PricingOptions{2}:=2
			STK_al_PricingOptions{3}:=3
			STK_al_PricingOptions{4}:=4
			ARRAY LONGINT:C221(STK_al_Locationstoshow; 0)
			ARRAY TEXT:C222(STK_at_Locationstoshow; 0)
			ARRAY LONGINT:C221(STK_al_LocationSettings; 0)
			ARRAY BOOLEAN:C223(STK_abo_LocationInclude; 0)
			ARRAY BOOLEAN:C223(STK_abo_Locationavailable; 0)
			
			//STK_LoadGeneralPrefs([PERSONNEL]Personnel_ID;False;->STK_al_Locationstoshow;->STK_al_LocationSettings;->STK_l_PricingOption)
			$_l_SizeofArray:=Size of array:C274(STK_al_Locationstoshow)
			ARRAY BOOLEAN:C223(STK_abo_LocationInclude; $_l_SizeofArray)
			ARRAY BOOLEAN:C223(STK_abo_Locationavailable; $_l_SizeofArray)
			ARRAY TEXT:C222(STK_at_Locationstoshow; $_l_SizeofArray)
			For ($_l_Index; 1; Size of array:C274(STK_al_LocationSettings))
				$_l_LocationsRow:=Find in array:C230(STK_al_ToplevelLocations; STK_al_Locationstoshow{$_l_Index})
				If ($_l_LocationsRow>0)  //it should be
					
					STK_at_Locationstoshow{$_l_Index}:=STK_at_ToplevelLocations{$_l_LocationsRow}
				Else 
					STK_at_Locationstoshow{$_l_Index}:="Unknown"
				End if 
				Case of 
					: (STK_al_LocationSettings{$_l_Index}=0)
						STK_abo_LocationInclude{$_l_Index}:=False:C215
						STK_abo_Locationavailable{$_l_Index}:=True:C214
					: (STK_al_LocationSettings{$_l_Index}=1)
						STK_abo_LocationInclude{$_l_Index}:=True:C214
						STK_abo_Locationavailable{$_l_Index}:=True:C214
					: (STK_al_LocationSettings{$_l_Index}=-1)
						STK_abo_Locationavailable{$_l_Index}:=False:C215
						STK_abo_LocationInclude{$_l_Index}:=False:C215
				End case 
				
			End for 
			//Load the user access into a list box area
			LB_SetupListbox(->PER_abo_StockAccess; "STK_t"; "STK_L"; 1; ->STK_abo_LocationInclude; ->STK_abo_Locationavailable; ->STK_at_Locationstoshow; ->STK_al_Locationstoshow; ->STK_al_LocationSettings)
			LB_SetColumnHeaders(->PER_abo_StockAccess; "STK_L"; 1; "Include"; "Available"; "Location Name"; "LocationID"; "Location Settings")
			LB_SetColumnWidths(->PER_abo_StockAccess; "STK_t"; 1; 50; 50; 250; 0; 0)
			LB_SetEnterable(->PER_abo_StockAccess; False:C215; 0)
			LB_SetEnterable(->PER_abo_StockAccess; True:C214; 1)
			LB_SetEnterable(->PER_abo_StockAccess; True:C214; 2)
			LB_SetScroll(->PER_abo_StockAccess; -3; -2)
			LB_StyleSettings(->PER_abo_StockAccess; "Black"; 9; "PER_t"; ->[PERSONNEL:11])
			LB_Setdividers(->PER_abo_StockAccess; 0; 0)  //Both on
			
			If (STK_l_PricingOption>0)
				$_l_PricingRow:=Find in array:C230(STK_al_PricingOptions; STK_l_PricingOption)
				STK_at_CostPriceOptions:=$_l_PricingRow
			Else 
				STK_at_CostPriceOptions:=0
			End if 
		End if 
	End if 
	
End if 
OBJECT SET VISIBLE:C603(*; "oAuthTypeLabel"; (PER_l_UseAuthentication=1))
OBJECT SET VISIBLE:C603(*; "oAuthUserLabel"; (PER_l_UseAuthentication=1))
OBJECT SET VISIBLE:C603(*; "oAuthPassLabel"; (PER_l_UseAuthentication=1))
OBJECT SET VISIBLE:C603(*; "OauthTypes"; (PER_l_UseAuthentication=1))
OBJECT SET VISIBLE:C603(PER_t_UserName; (PER_l_UseAuthentication=1))
OBJECT SET VISIBLE:C603(PER_t_UserPassword; (PER_l_UseAuthentication=1))




//`````
ARRAY LONGINT:C221(<>PW_al_4DUserGroupsINC; 6)

<>USERMODID:=""
<>USERMODPREF:=0
GET PROCESS VARIABLE:C371(-1; <>SYS_bo_PWActive; <>SYS_bo_PWActive)
//x
ARRAY TEXT:C222(<>PW_at_4DUserGroups; 0)
ARRAY LONGINT:C221(<>PW_al_4DGroupIDs; 0)
ARRAY LONGINT:C221(<>PW_al_4DUserGroupsINC; 0)
//PW_CHECKUSERS
PW_CHECKGROUPS

ARRAY LONGINT:C221(<>PW_al_4DUserGroupsINC; Size of array:C274(<>PW_at_4DUserGroups))
// [PERSONNEL]UserGroupIDs:=0

For ($_l_Index; 1; Size of array:C274(<>PW_al_4DUserGroupsBinaries))
	$_l_GroupBinary:=<>PW_al_4DUserGroupsBinaries{$_l_Index}
	//find out if that binary is set
	$_bo_GroupSet:=([PERSONNEL:11]UserGroupIDs:39 ?? $_l_GroupBinary)
	If ($_bo_GroupSet)
		<>PW_al_4DUserGroupsINC{$_l_Index}:=1
	Else 
		<>PW_al_4DUserGroupsINC{$_l_Index}:=0
	End if 
End for 
$_l_AsciiChar:=Character code:C91("•")

INT_SetLongintCheckFormat(-><>PW_al_4DUserGroupsINC)
//change this for cross platform
DB_LoadPasswordAutoSetup  // This value can only be set to true if ◊PWActive

If (<>PW_Bo_WindowsAutoLogin)
	OBJECT SET VISIBLE:C603(*; "oAutoLogin@"; True:C214)
Else 
	OBJECT SET VISIBLE:C603(*; "oAutoLogin@"; False:C215)
End if 

vButtDisPersonnel:="I    O  FSSSRCADT"
Input_Buttons(->[PERSONNEL:11]; ->vButtDisPersonnel)
Macro_AccType("Load "+String:C10(Table:C252(->[PERSONNEL:11])))
ERR_MethodTrackerReturn("Personnel_InLPB"; $_t_oldMethodName)
