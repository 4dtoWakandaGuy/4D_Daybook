If (False:C215)
	//Table Form Method Name: [DIARY]
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/08/2012 13:38
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SD_at_History;0)
	//ARRAY TEXT(SD_at_Priority;0)
	C_BOOLEAN:C305(DB_bo_NoLoad; INT_bo_DetailOpen; SD2_bo_PopupsSet; WIN_bo_Resize)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_event; DB_l_ButtonClickedFunction; DEF_l_SettingsCalled; SIZ_l_Minimized; SIZ_l_OLDBottom; SIZ_l_OLDLEFT; SIZ_l_OLDRight; SIZ_l_OLDTop)
	C_TEXT:C284($_t_CloseReference; $_t_oldMethodName; DB_t_CUrrentInputMenuRef; DB_T_CurrentInputWindowMenu; DOC_t_FormName; vButtDisO; vName; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [DIARY].Diary"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Header:K2:17)
		If (Not:C34(SD2_bo_PopupsSet))
			ARRAY TEXT:C222(SD_at_History; 0)
			ARRAY TEXT:C222(SD_at_Priority; 0)
			DB_LoadDisplay(Table:C252(->[DIARY:12]); ->SD_at_History; ->SD_at_Priority)
			
			SD2_bo_PopupsSet:=True:C214
		End if 
		If (DEF_l_SettingsCalled=0)
			FSetting_SetLabel(WIN_t_CurrentOutputform)
			//DIARY_GetButtonPics
			If (SIZ_l_OLDLEFT=0) & (SIZ_l_OLDTOP=0) & (SIZ_l_OLDRIGHT=0) & (SIZ_l_OLDBOTTOM=0)
				WS_OutputResize
				WIN_bo_Resize:=False:C215
			End if 
			DOC_t_FormName:=""
			INT_Setoutput(Table:C252(->[DIARY:12]); WIN_t_CurrentOutputform; ->DOC_t_FormName; 125)
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
		If ([DIARY:12]Diary_Code:3#"")
			RELATE ONE:C42([DIARY:12]Contact_Code:2)
			vName:=[CONTACTS:1]Contact_Name:31
			If ([COMPANIES:2]Company_Code:1#[DIARY:12]Company_Code:1)  //only here cos StatsView kills auto rels
				RELATE ONE:C42([DIARY:12]Company_Code:1)
			End if 
		Else 
			REDUCE SELECTION:C351([CONTACTS:1]; 0)
			REDUCE SELECTION:C351([COMPANIES:2]; 0)
			VName:=""
		End if 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[DIARY:12]); "Diary")
		Cache_Initialise("DMaster")
		FSetting_SetLabel(WIN_t_CurrentOutputform)
	: ($_l_event=On Activate:K2:9)  // | (vFromIn))
		OpenHelp(Table:C252(->[DIARY:12]); "Diary")
		vButtDisO:="O              D "
		Out_Buttons
		
		DB_SetMenuBar(""; 9)
	: ($_l_event=On Deactivate:K2:10)
		// PAUSE PROCESS(Current process)
	: ($_l_event=On Outside Call:K2:11)
		Case of 
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("FormWindows"))
				If (DB_t_CUrrentInputMenuRef#"") & (DB_T_CurrentInputWindowMenu#"")
					DB_T_CurrentInputWindowMenu:=DB_BuildWIndowsMenu(DB_T_CurrentInputWindowMenu)
					SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
				End if 
				DB_l_ButtonClickedFunction:=0
				
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Plus"))
				Diary_DiaryFwd
				
			: ((DB_l_ButtonClickedFunction=DB_GetButtonFunction("Select")) & (Records in set:C195("Userset")>0))
				SET WINDOW TITLE:C213("Diary: Selected Items")
				
		End case 
		
		Out_ButtCall(->[DIARY:12]; ->[DIARY:12]Diary_Code:3; ->[DIARY:12]Company_Code:1; "Diary"; "Diary_New"; "Diary_DiarySel"; "Minor_DelSetEx"; "DMaster"; "Diary"; "Diary_OutCount"; 1; 2)
	: ($_l_event=On Open Detail:K2:23)
		GET WINDOW RECT:C443(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
		INT_bo_DetailOpen:=True:C214
	: ($_l_event=On Close Detail:K2:24)
		$_t_CloseReference:=Table name:C256(->[DIARY:12])+"_"+WIN_t_CurrentInputForm  //added NG may 2004
		INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_CloseReference)
		
		SET WINDOW RECT:C444(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
		
		vButtDisO:="O              D "
		Out_Buttons
		
End case 
ERR_MethodTrackerReturn("FM:Diary"; $_t_oldMethodName)
