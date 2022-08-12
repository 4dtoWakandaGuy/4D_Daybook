If (False:C215)
	//Table Form Method Name: [STOCK_MOVEMENTS]Movements_out
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 06/09/2012 12:50
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad; INT_bo_DetailOpen; STOCK_AutoCancel; WIN_bo_Resize)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_event; SIZ_l_Minimized; SIZ_l_OLDBottom; SIZ_l_OLDLEFT; SIZ_l_OLDRight; SIZ_l_OLDTop; STK_l_SettingsCalled)
	C_TEXT:C284($_t_FormReference; $_t_oldMethodName; vButtDisO; vTitleR; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [STOCK_MOVEMENTS].Movements_out"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Header:K2:17)
		If (STK_l_SettingsCalled=0)
			FSetting_SetLabel(WIN_t_CurrentOutputform)
			If (SIZ_l_OLDLEFT=0) & (SIZ_l_OLDTOP=0) & (SIZ_l_OLDRIGHT=0) & (SIZ_l_OLDBOTTOM=0)
				WS_OutputResize
				WIN_bo_Resize:=False:C215
			End if 
			INT_Setoutput(Table:C252(->[STOCK_MOVEMENTS:40]); WIN_t_CurrentOutputform)
			STK_l_SettingsCalled:=1
		Else 
			STK_l_SettingsCalled:=0
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
		If ([STOCK_MOVEMENTS:40]Movement_Code:1#"")
			RELATE ONE:C42([STOCK_MOVEMENTS:40]Movement_Type:6)
			If ([COMPANIES:2]Company_Code:1#[STOCK_MOVEMENTS:40]Company_From:2)  //only here cos StatsView kills auto rels
				RELATE ONE:C42([STOCK_MOVEMENTS:40]Company_From:2)
			End if 
		Else 
			REDUCE SELECTION:C351([MOVEMENT_TYPES:60]; 0)
			REDUCE SELECTION:C351([COMPANIES:2]; 0)
			
		End if 
		
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[STOCK_MOVEMENTS:40]); "Movements_out")
		Cache_Initialise("Master")
		
		FSetting_SetLabel(WIN_t_CurrentOutputform)
	: ($_l_event=On Activate:K2:9)  //| (vFromIn))
		OpenHelp(Table:C252(->[STOCK_MOVEMENTS:40]); "Movements_out")
		vButtDisO:="O              DT"
		Out_Buttons
		
		vTitleR:=Uppercase:C13(Term_StoWT("Stock Movements"))
		
		
		
	: ($_l_event=On Outside Call:K2:11)
		Out_ButtCall(->[STOCK_MOVEMENTS:40]; ->[STOCK_MOVEMENTS:40]Movement_Code:1; ->[STOCK_MOVEMENTS:40]Movement_Type:6; "Movements"; "DB_MenuNewRecord"; "Movements_Sel"; "Movements_OutDe"; "Master"; "Stock Movements"; ""; 0; 0)
	: ($_l_event=On Deactivate:K2:10)
		//PAUSE PROCESS(vProc)
	: ($_l_event=On Open Detail:K2:23)
		GET WINDOW RECT:C443(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
		INT_bo_DetailOpen:=True:C214
		
	: ($_l_event=On Close Detail:K2:24)
		$_t_FormReference:=Table name:C256(->[STOCK_MOVEMENTS:40])+"_"+WIN_t_CurrentInputForm  //added NG may 2004
		INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_FormReference)
		
		SET WINDOW RECT:C444(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
		vButtDisO:="O              DT"
		Out_Buttons
		
		vTitleR:=Uppercase:C13(Term_StoWT("Stock Movements"))
		
		If (STOCK_AutoCancel)
			CANCEL:C270
			STOCK_AutoCancel:=False:C215
		End if 
		
End case 
ERR_MethodTrackerReturn("FM:Movements Out"; $_t_oldMethodName)
