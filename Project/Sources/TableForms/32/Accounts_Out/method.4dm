If (False:C215)
	//Table Form Method Name: [ACCOUNTS]Accounts_Out
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/10/2012 19:53
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(ACC_at_ApplicableAnalyses;0)
	//ARRAY TEXT(ACC_at_ApplicableLayer;0)
	C_BOOLEAN:C305(DB_bo_NoLoad; INT_bo_DetailOpen; WIN_bo_Resize)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_event; $_l_Index; $_l_offset; DEF_l_SettingsCalled; SIZ_l_Minimized; SIZ_l_OLDBottom; SIZ_l_OLDLEFT; SIZ_l_OLDRight; SIZ_l_OLDTop)
	C_TEXT:C284($_t_FormReference; $_t_oldMethodName; CUR_S20_MULTICURVALUATION; vButtDisO; vTitle3; vTitle4; vTitle5; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [ACCOUNTS].Accounts_Out"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Header:K2:17)
		If (DEF_l_SettingsCalled=0)
			If ([ACCOUNTS:32]Multicurrency_Valuation:10=1)
				Cur_S20_MultiCurValuation:="C"
			Else 
				Cur_S20_MultiCurValuation:="H"
			End if 
			FSetting_SetLabel(WIN_t_CurrentOutputform)
			If (SIZ_l_OLDLEFT=0) & (SIZ_l_OLDTOP=0) & (SIZ_l_OLDRIGHT=0) & (SIZ_l_OLDBOTTOM=0)
				WS_OutputResize
				WIN_bo_Resize:=False:C215
			End if 
			INT_Setoutput(Table:C252(->[ACCOUNTS:32]); WIN_t_CurrentOutputform)
			SD2_SetDiaryPopup
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
			If (BLOB size:C605([ACCOUNTS:32]xAnalysisCodes:12)=0)
				QUERY:C277([ACCOUNTS_ANALYSES:157]; [ACCOUNTS_ANALYSES:157]Account_Code:3=[ACCOUNTS:32]Account_Code:2)
				
				vTitle4:=""
				If (Records in selection:C76([ACCOUNTS_ANALYSES:157])>0)
					FIRST RECORD:C50([ACCOUNTS_ANALYSES:157])
					While (Not:C34(End selection:C36([ACCOUNTS_ANALYSES:157])))
						vTitle4:=vTitle4+[ACCOUNTS_ANALYSES:157]Analysis_Code:1+" "
						NEXT RECORD:C51([ACCOUNTS_ANALYSES:157])
					End while 
				End if 
				
			Else 
				ARRAY TEXT:C222(ACC_at_ApplicableAnalyses; 0)
				$_l_offset:=0
				BLOB TO VARIABLE:C533([ACCOUNTS:32]xAnalysisCodes:12; ACC_at_ApplicableAnalyses; $_l_offset)
				vTitle4:=""
				For ($_l_Index; Size of array:C274(ACC_at_ApplicableAnalyses); 1; -1)
					vTitle4:=vTitle4+ACC_at_ApplicableAnalyses{$_l_Index}
				End for 
				
			End if 
			vTitle5:=""
			If (BLOB size:C605([ACCOUNTS:32]xLayerCodes:11)=0)
				QUERY:C277([ACCOUNTS_LAYERS:156]; [ACCOUNTS_LAYERS:156]Account_Code:3=[ACCOUNTS:32]Account_Code:2)
				
				If (Records in selection:C76([ACCOUNTS_LAYERS:156])>0)
					FIRST RECORD:C50([ACCOUNTS_LAYERS:156])
					While (Not:C34(End selection:C36([ACCOUNTS_LAYERS:156])))
						vTitle5:=vTitle5+[ACCOUNTS_LAYERS:156]Layer_Code:1+" "
						NEXT RECORD:C51([ACCOUNTS_LAYERS:156])
					End while 
				End if 
			Else 
				ARRAY TEXT:C222(ACC_at_ApplicableLayer; 0)
				$_l_offset:=0
				BLOB TO VARIABLE:C533([ACCOUNTS:32]xLayerCodes:11; ACC_at_ApplicableLayer; $_l_offset)
				vTitle5:=""
				For ($_l_Index; Size of array:C274(ACC_at_ApplicableLayer); 1; -1)
					vTitle5:=vTitle5+ACC_at_ApplicableLayer{$_l_Index}
				End for 
				
			End if 
			If ([ACCOUNTS:32]Multicurrency_Valuation:10=1)
				Cur_S20_MultiCurValuation:="C"
			Else 
				Cur_S20_MultiCurValuation:="H"
			End if 
		Else 
			Cur_S20_MultiCurValuation:=""
			vTitle4:=""
			VTitle5:=""
			
		End if 
		//Cache_Initialise
		//FSetting_SetLabel (WIN_t_CurrentOutputform)
	: ($_l_event=On Activate:K2:9)
		OpenHelp(Table:C252(->[ACCOUNTS:32]); "Accounts_Out")
		vButtDisO:="O              DT"
		Out_Buttons
		vTitle3:=Term_VATWT("I/O/N")
		SD2_SetDiaryPopup
	: ($_l_event=On Outside Call:K2:11)
		Out_ButtCall(->[ACCOUNTS:32]; ->[ACCOUNTS:32]Account_Code:2; ->[ACCOUNTS:32]Account_Name:3; "Accounts"; "DB_MenuNewRecord"; "Minor_Sel"; "Accounts_OutDel"; ""; "Accounts"; ""; 0; 0)
	: ($_l_event=On Deactivate:K2:10)
		//PAUSE PROCESS(vProc)
		
	: ($_l_event=On Open Detail:K2:23)
		GET WINDOW RECT:C443(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
		INT_bo_DetailOpen:=True:C214
	: ($_l_event=On Close Detail:K2:24)
		$_t_FormReference:=Table name:C256(->[ACCOUNTS:32])+"_"+WIN_t_CurrentInputForm  //added NG may 2004
		INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_FormReference)
		
		SET WINDOW RECT:C444(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
		
		vButtDisO:="O              DT"
		Out_Buttons
		vTitle3:=Term_VATWT("I/O/N")
End case 
ERR_MethodTrackerReturn("FM [ACCOUNTS].Accounts_Out"; $_t_oldMethodName)
