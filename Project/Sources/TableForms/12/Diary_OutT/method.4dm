If (False:C215)
	//Table Form Method Name: [DIARY]Diary_OutT
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_FormReference)
	C_BOOLEAN:C305(DB_bo_NoLoad; INT_bo_DetailOpen; WIN_bo_Resize)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_event; DEF_l_SettingsCalled; SIZ_l_Minimized; SIZ_l_OLDBottom; SIZ_l_OLDLEFT; SIZ_l_OLDRight; SIZ_l_OLDTop)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsageRemember; vButtDisO; vTimesTitle; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [DIARY].Diary_OutT"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Header:K2:17)
		If (DEF_l_SettingsCalled=0)
			FSetting_SetLabel(WIN_t_CurrentOutputform)
			
			If (SIZ_l_OLDLEFT=0) & (SIZ_l_OLDTOP=0) & (SIZ_l_OLDRIGHT=0) & (SIZ_l_OLDBOTTOM=0)
				WS_OutputResize
				WIN_bo_Resize:=False:C215
			End if 
			vTimesTitle:="Times"
			INT_Setoutput(Table:C252(->[DIARY:12]); WIN_t_CurrentOutputform; ->vTimesTitle)
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
			RELATE ONE:C42([DIARY:12]Job_Code:19)
		Else 
			REDUCE SELECTION:C351([JOBS:26]; 0)
		End if 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[DIARY:12]); "Diary_OutT")
		Cache_Initialise("DMaster")
		FSetting_SetLabel(WIN_t_CurrentOutputform)
	: ($_l_event=On Activate:K2:9)  //| (vFromIn))
		OpenHelp(Table:C252(->[DIARY:12]); "Diary_OutT")
		vButtDisO:="O              D "
		Out_Buttons
	: ($_l_event=On Deactivate:K2:10)
		// PAUSE PROCESS(Current process)
	: ($_l_event=On Outside Call:K2:11)
		Out_ButtCall(->[DIARY:12]; ->[DIARY:12]Diary_Code:3; ->[DIARY:12]Company_Code:1; "Diary"; "Time_In"; "Diary_SelT"; "Minor_DelSetEx"; "DMaster"; "Diary"; "Diary_OutCount"; 1; 2)
	: ($_l_event=On Open Detail:K2:23)
		DB_t_CurrentFormUsageRemember:=DB_t_CurrentFormUsage  //added 29/10/07 -kmw (opening a time record by double clicking wasn't setting DB_t_CurrentFormUsage to "Time")
		DB_t_CurrentFormUsage:="Time"  //added 29/10/07 -kmw (opening a time record by double clicking wasn't setting DB_t_CurrentFormUsage to "Time")
		
		GET WINDOW RECT:C443(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
		INT_bo_DetailOpen:=True:C214
		
	: ($_l_event=On Close Detail:K2:24)
		DB_t_CurrentFormUsage:=DB_t_CurrentFormUsageRemember  //added 29/10/07 -kmw (opening a time record by double clicking wasn't setting DB_t_CurrentFormUsage to "Time")
		
		$_t_FormReference:=Table name:C256(->[DIARY:12])+"_"+WIN_t_CurrentInputForm  //added NG may 2004
		INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_FormReference)
		
		SET WINDOW RECT:C444(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
		vButtDisO:="O              D"
		Out_Buttons
End case 
ERR_MethodTrackerReturn("FM [DIARY].Diary_OutT"; $_t_oldMethodName)
