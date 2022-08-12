If (False:C215)
	//Table Form Method Name: [TRANSACTIONS]Trans_Out
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad; INT_bo_DetailOpen; WIN_bo_Resize)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_event; DEF_l_SettingsCalled; SIZ_l_Minimized; SIZ_l_OLDBottom; SIZ_l_OLDLEFT; SIZ_l_OLDRight; SIZ_l_OLDTop)
	C_TEXT:C284($_t_FormReference; $_t_oldMethodName; DOC_t_FormName; vButtDisO; vTitle2; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [TRANSACTIONS].Trans_Out"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Header:K2:17)
		If (DEF_l_SettingsCalled=0)
			If (SIZ_l_OLDLEFT=0) & (SIZ_l_OLDTOP=0) & (SIZ_l_OLDRIGHT=0) & (SIZ_l_OLDBOTTOM=0)
				WS_OutputResize
				WIN_bo_Resize:=False:C215
			End if 
			DOC_t_FormName:=""
			INT_Setoutput(Table:C252(->[TRANSACTIONS:29]); WIN_t_CurrentOutputform; ->DOC_t_FormName; 116)
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
		If ([TRANSACTIONS:29]Unique_StringIdent:28#"")
			If ([TRANSACTIONS:29]Account_Code:3#[ACCOUNTS:32]Account_Code:2)
				RELATE ONE:C42([TRANSACTIONS:29]Account_Code:3)
			End if 
		Else 
			REDUCE SELECTION:C351([ACCOUNTS:32]; 0)
		End if 
		
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[TRANSACTIONS:29]); "Trans_Out")
		Cache_Initialise("Master")
		
		FSetting_SetLabel(WIN_t_CurrentOutputform)
	: ($_l_event=On Activate:K2:9)  // | (vFromIn))
		OpenHelp(Table:C252(->[TRANSACTIONS:29]); "Trans_Out")
		vButtDisO:="O  P          ADT"
		Out_Buttons
		vTitle2:=Term_VATWT("Amount/VAT")
	: ($_l_event=On Outside Call:K2:11)
		Out_ButtCall(->[TRANSACTIONS:29]; ->[TRANSACTIONS:29]Company_Code:9; ->[TRANSACTIONS:29]Transaction_Type_Code:1; "Transactions"; ""; "Trans_Sel"; "Trans_OutDel"; "Master"; "Transactions"; "Trans_OutCount"; 0; 0)
	: ($_l_event=On Deactivate:K2:10)
		//PAUSE PROCESS(vProc)
	: ($_l_event=On Open Detail:K2:23)
		GET WINDOW RECT:C443(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
		INT_bo_DetailOpen:=True:C214
		
	: ($_l_event=On Close Detail:K2:24)
		$_t_FormReference:=Table name:C256(->[TRANSACTIONS:29])+"_"+WIN_t_CurrentInputForm  //added NG may 2004
		INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_FormReference)
		
		SET WINDOW RECT:C444(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
		vButtDisO:="O  P          ADT"
		Out_Buttons
		vTitle2:=Term_VATWT("Amount/VAT")
		
	Else 
		
		
		
		
End case 
ERR_MethodTrackerReturn("FM [TRANSACTIONS].Trans_Out"; $_t_oldMethodName)
