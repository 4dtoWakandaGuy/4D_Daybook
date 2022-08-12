If (False:C215)
	//Table Form Method Name: Object Name:      [USER].ACC_PreferencesSetup
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 03/03/2012 00:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(ACC_lb_ErrorsDiary;0)
	//ARRAY BOOLEAN(ACC_lb_MailAccounts;0)
	//ARRAY DATE(ACC_ad_EPeriodDates;0)
	//ARRAY LONGINT(ACC_al_aDiaryOwnerIDs;0)
	//ARRAY LONGINT(ACC_al_EmailOwnerIDS;0)
	//ARRAY TEXT(ACC_at_DiaryActionCodes;0)
	//ARRAY TEXT(ACC_at_DiaryActionNames;0)
	//ARRAY TEXT(ACC_at_DiaryNames;0)
	//ARRAY TEXT(ACC_at_EMailAccounts;0)
	//ARRAY TEXT(ACC_at_EMailAccountsUser;0)
	//ARRAY TEXT(ACC_at_EPeriodCodes;0)
	//ARRAY TEXT(ACC_at_TabControl;0)
	C_BOOLEAN:C305($_bo_More; ACC_bo_DataChange; DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; ACC_l_CBConstantCheck; ACC_l_CBContinuousCheck; ACC_l_CBLogToDiary; ACC_l_CBLogToeMail; ACC_l_CBOneCheck; ACC_l_EPeriodCode; BRunCheckNow)
	C_TEXT:C284($_t_oldMethodName; ACC_t_ActionCode; ACC_t_ActionName; ACC_t_COL1; ACC_t_COL2; ACC_t_COL3; ACD_t_COL1; ACD_t_COL2; ACD_t_COL3)
	C_TIME:C306(ACC_ti_cTImeEnd; Acc_ti_cTimeStart)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [USER].ACC_PreferencesSetup"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[USER:15]); "ACC_PreferencesSetup")
		WS_AutoscreenSize(3; 355; 355)
		ARRAY TEXT:C222(ACC_at_DiaryNames; 0)
		ARRAY LONGINT:C221(ACC_al_aDiaryOwnerIDs; 0)
		ARRAY TEXT:C222(ACC_at_EMailAccounts; 0)
		ARRAY LONGINT:C221(ACC_al_EmailOwnerIDS; 0)
		ARRAY TEXT:C222(ACC_at_EPeriodCodes; 0)
		ARRAY DATE:C224(ACC_ad_EPeriodDates; 0)
		ARRAY TEXT:C222(ACC_at_TabControl; 3)
		ACC_at_TabControl{1}:="Error Reporting"
		ACC_at_TabControl{2}:="Account Balances"
		ACC_at_TabControl{3}:="Transactions"
		ACC_at_TabControl:=1
		FORM GOTO PAGE:C247(1)
		
		
		ACC_ReportingPrefs
		ARRAY TEXT:C222(ACC_at_DiaryActionCodes; 0)
		ARRAY TEXT:C222(ACC_at_DiaryActionNames; 0)
		ALL RECORDS:C47([ACTIONS:13])
		SELECTION TO ARRAY:C260([ACTIONS:13]Action_Code:1; ACC_at_DiaryActionCodes; [ACTIONS:13]Action_Name:2; ACC_at_DiaryActionNames)
		SORT ARRAY:C229(ACC_at_DiaryActionNames; ACC_at_DiaryActionCodes)
		ALL RECORDS:C47([PERIODS:33])
		ORDER BY:C49([PERIODS:33]; [PERIODS:33]From_Date:3)
		$_bo_More:=(Records in selection:C76([PERIODS:33])>12)
		REDUCE SELECTION:C351([PERIODS:33]; 12)
		//ACC_ad_EPeriodDates
		SELECTION TO ARRAY:C260([PERIODS:33]Period_Code:1; ACC_at_EPeriodCodes; [PERIODS:33]From_Date:3; ACC_ad_EPeriodDates)
		If ($_bo_More)
			INSERT IN ARRAY:C227(ACC_at_EPeriodCodes; Size of array:C274(ACC_at_EPeriodCodes)+1; 1)
			INSERT IN ARRAY:C227(ACC_ad_EPeriodDates; Size of array:C274(ACC_ad_EPeriodDates)+1; 1)
			
			ACC_at_EPeriodCodes{Size of array:C274(ACC_at_EPeriodCodes)}:="Later Periods..."
		End if 
		ACC_l_EPeriodCode:=0
		ACC_at_EPeriodCodes:=0
		If (ACC_l_CBConstantCheck=0)
			OBJECT SET ENABLED:C1123(ACC_l_CBOneCheck; False:C215)
			OBJECT SET ENABLED:C1123(ACC_l_CBContinuousCheck; False:C215)
			OBJECT SET ENTERABLE:C238(ACC_ti_CTimeStart; False:C215)
			OBJECT SET ENTERABLE:C238(ACC_ti_CTimeEnd; False:C215)
			
		End if 
		If (Application type:C494#4D Remote mode:K5:5) & (Current user:C182#"Designer")
			OBJECT SET VISIBLE:C603(BRunCheckNow; False:C215)
		End if 
		
		LB_SetupListbox(->ACC_lb_MailAccounts; "ACC_t"; "ACC_L"; 1; ->ACC_at_EMailAccounts; ->ACC_at_EmailAccountsUser; ->ACC_al_EmailOwnerIDS)
		LB_SetColumnHeaders(->ACC_lb_MailAccounts; "YRP_L"; 1; "Account Field"; "Name"; "ID")
		LB_SetColumnWidths(->ACC_lb_MailAccounts; "ABC_t"; 1; 54; 0; 0)
		LB_SetEnterable(->ACC_lb_MailAccounts; False:C215; 0)
		LB_SetScroll(->ACC_lb_MailAccounts; -3; -2)
		LB_StyleSettings(->ACC_lb_MailAccounts; "Black"; 9; "ABC_t"; ->[ACCOUNTS:32])
		
		
		LB_SetupListbox(->ACC_lb_ErrorsDiary; "ACD_t"; "ACD_L"; 1; ->ACC_at_DiaryNames; ->ACC_al_aDiaryOwnerIDs)
		
		LB_SetColumnHeaders(->ACC_lb_ErrorsDiary; "YRP_L"; 1; "Name"; "ID")
		LB_SetColumnWidths(->ACC_lb_ErrorsDiary; "ABC_t"; 1; 54; 0)
		LB_SetEnterable(->ACC_lb_ErrorsDiary; False:C215; 0)
		LB_SetScroll(->ACC_lb_ErrorsDiary; -3; -2)
		LB_StyleSettings(->ACC_lb_ErrorsDiary; "Black"; 9; "ABC_t"; ->[ACCOUNTS:32])
		
		
		
		
		
		INT_SetDialog
		
End case 
ERR_MethodTrackerReturn("FM [USER].ACC_PreferencesSetup"; $_t_oldMethodName)
