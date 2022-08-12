If (False:C215)
	//Table Form Method Name: [ACCOUNTS]Balances
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/03/2011 09:22
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_FormReference)
	//ARRAY TEXT(CUR_at_CurrencyToconvert;0)
	C_BOOLEAN:C305(ACC_bo_ShowBalances; DB_bo_NoLoad; INT_bo_DetailOpen; WIN_bo_Resize)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_event; DEF_l_SettingsCalled; SIZ_l_Minimized; SIZ_l_OLDBottom; SIZ_l_OLDLEFT; SIZ_l_OLDRight; SIZ_l_OLDTop)
	C_REAL:C285($_r_Balance; VBalance)
	C_TEXT:C284($_t_oldMethodName; ACC_t_OutputCurrency; ACC_T_Title; vButtDisO; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [ACCOUNTS].Balances"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Header:K2:17)
		ACC_bo_ShowBalances:=True:C214
		If (DEF_l_SettingsCalled=0)
			If (SIZ_l_OLDLEFT=0) & (SIZ_l_OLDTOP=0) & (SIZ_l_OLDRIGHT=0) & (SIZ_l_OLDBOTTOM=0)
				WS_OutputResize
				WIN_bo_Resize:=False:C215
			End if 
			ACC_T_Title:="Account Balances"
			INT_Setoutput(Table:C252(->[ACCOUNTS:32]); WIN_t_CurrentOutputform; ->ACC_T_Title)
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
		If ([ACCOUNTS:32]Account_Code:2#"")
			QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Account_Code:2=[ACCOUNTS:32]Account_Code:2)
			CREATE SET:C116([ACCOUNT_BALANCES:34]; "Extra")
			INTERSECTION:C121("Extra2"; "Extra"; "Extra3")
			USE SET:C118("Extra3")
			//  USE SET("Extra2")
			
			If ([ACCOUNT_BALANCES:34]Currency_Code:6=ACC_t_OutputCurrency) | (ACC_t_OutputCurrency="")
				Calc_BalArr
			Else 
				$_r_Balance:=CUR_CalcBalConv(->CUR_at_CurrencyToconvert; ACC_t_OutputCurrency)
				VBalance:=$_r_Balance
				// Calc_BalConv
			End if 
		Else 
			REDUCE SELECTION:C351([ACCOUNT_BALANCES:34]; 0)
			VBalance:=0
		End if 
		
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[ACCOUNTS:32]); "Balances")
		Cache_Initialise
		FSetting_SetLabel(WIN_t_CurrentOutputform)
		SD2_SetDiaryPopup
	: ($_l_event=On Activate:K2:9)
		OpenHelp(Table:C252(->[ACCOUNTS:32]); "Balances")
		vButtDisO:="O DP          ADT"
		Out_Buttons
		SD2_SetDiaryPopup
	: ($_l_event=On Outside Call:K2:11)
		Out_ButtCall(->[ACCOUNTS:32]; ->[ACCOUNTS:32]Account_Code:2; ->[ACCOUNTS:32]Account_Name:3; "Accounts"; "DB_MenuNewRecord"; "Minor_Sel"; "Accounts_OutDel"; ""; "Accounts"; "Accounts_OutCount"; 0; 0)
	: ($_l_event=On Deactivate:K2:10)
		//PAUSE PROCESS(vProc)
	: ($_l_event=On Open Detail:K2:23)
		GET WINDOW RECT:C443(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
		INT_bo_DetailOpen:=True:C214
	: ($_l_event=On Close Detail:K2:24)
		$_t_FormReference:=Table name:C256(->[ACCOUNTS:32])+"_"+WIN_t_CurrentInputForm  //added NG may 2004
		INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_FormReference)
		
		SET WINDOW RECT:C444(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
		vButtDisO:="O DP          ADT"
		Out_Buttons
End case 
ERR_MethodTrackerReturn("FM:Balances"; $_t_oldMethodName)
