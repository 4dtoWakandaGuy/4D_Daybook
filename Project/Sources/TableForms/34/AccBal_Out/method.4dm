If (False:C215)
	//Table Form Method Name: [ACCOUNT_BALANCES]AccBal_Out
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/01/2010 17:32
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_FormReference)
	C_BOOLEAN:C305(DB_bo_NoLoad; INT_bo_DetailOpen; WIN_bo_Resize)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_event; DEF_l_SettingsCalled; SIZ_l_Minimized; SIZ_l_OLDBottom; SIZ_l_OLDLEFT; SIZ_l_OLDRight; SIZ_l_OLDTop; WS_l_FirstTime)
	C_TEXT:C284($_t_oldMethodName; ACC_t_FormName; vButtDisO; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [ACCOUNT_BALANCES].AccBal_Out"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Header:K2:17)
		If (DEF_l_SettingsCalled=0)
			If (WS_l_FirstTime=0)
				Cache_Initialise("Master")
				WS_l_FirstTime:=1
			End if 
			
			If (SIZ_l_OLDLEFT=0) & (SIZ_l_OLDTOP=0) & (SIZ_l_OLDRIGHT=0) & (SIZ_l_OLDBOTTOM=0)
				WS_OutputResize
				WIN_bo_Resize:=False:C215
			End if 
			ACC_t_FormName:="Period Balances"
			INT_Setoutput(Table:C252(->[ACCOUNT_BALANCES:34]); WIN_t_CurrentOutputform; ->ACC_t_FormName)
			DEF_l_SettingsCalled:=1
		Else 
			DEF_l_SettingsCalled:=0
		End if 
	: ($_l_event=On Resize:K2:27)
		If (Not:C34(INT_bo_DetailOpen))
			If (Not:C34(WIN_bo_Resize))
				
				WS_OutputResize
			Else 
				WIN_bo_Resize:=False:C215
			End if 
			
		End if 
		
		INT_bo_DetailOpen:=False:C215
	: ($_l_event=On Display Detail:K2:22)
		If ([ACCOUNT_BALANCES:34]Account_Code:2#"")
			If ([ACCOUNT_BALANCES:34]Account_Code:2#[ACCOUNTS:32]Account_Code:2)
				RELATE ONE:C42([ACCOUNT_BALANCES:34]Account_Code:2)
			End if 
		Else 
			REDUCE SELECTION:C351([ACCOUNTS:32]; 0)
		End if 
		
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[ACCOUNT_BALANCES:34]); "AccBal_Out")
		
		Cache_Initialise("Master")
		FSetting_SetLabel(WIN_t_CurrentOutputform)
		SD2_SetDiaryPopup
	: ($_l_event=On Activate:K2:9)  // | (vFromIn)
		OpenHelp(Table:C252(->[ACCOUNT_BALANCES:34]); "AccBal_Out")
		vButtDisO:="O DP          ADT"
		Out_Buttons
		SD2_SetDiaryPopup
	: ($_l_event=On Outside Call:K2:11)
		Out_ButtCall(->[ACCOUNT_BALANCES:34]; ->[ACCOUNT_BALANCES:34]Account_Code:2; ->[ACCOUNT_BALANCES:34]Analysis_Code:1; "Account Balances"; ""; "ACC_BalSelect"; ""; "Master"; "Account Balances"; "AccBal_OutCount"; 0; 0)
	: ($_l_event=On Deactivate:K2:10)
		//PAUSE PROCESS(vProc)
	: ($_l_event=On Open Detail:K2:23)
		GET WINDOW RECT:C443(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
		INT_bo_DetailOpen:=True:C214
	: ($_l_event=On Close Detail:K2:24)
		$_t_FormReference:=Table name:C256(->[ACCOUNT_BALANCES:34])+"_"+WIN_t_CurrentInputForm  //added NG may 2004
		INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_FormReference)
		
		SET WINDOW RECT:C444(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
	Else 
		
End case 
ERR_MethodTrackerReturn("FM:AccBal Out"; $_t_oldMethodName)
