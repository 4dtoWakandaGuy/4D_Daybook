//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_ScreenSaverState; $_bo_TipsState; $_bo_Toolstate; DB_bo_NoLoad; INT_bo_DetailOpen; WIN_bo_Resize)
	C_LONGINT:C283(<>BUTTPROC; <>PER_l_CurrentUserID; <>procProc; <>ScrnSavMin; <>USERMODPREF; $_l_BarProcess; $_l_event; $_l_OK; $_l_ProcessStatus; $_l_TipsState; DEF_l_SettingsCalled)
	C_LONGINT:C283(PER_l_RunReminders; PER_l_ShowNothing; PER_l_ShowSchedule; PER_l_ShowWorkflow; SIZ_l_Minimized; SIZ_l_OLDBottom; SIZ_l_OLDLEFT; SIZ_l_OLDRight; SIZ_l_OLDTop)
	C_OBJECT:C1216($_Obj_GetUser)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; <>USERMODID; $_t_CloseReference; $_t_MachineName; $_t_oldMethodName; DBt_ButtonClickedFunction; vButtDisO; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [PERSONNEL].Personnel_Out"; Form event code:C388)
$_l_event:=Form event code:C388



Case of 
	: ($_l_event=On Header:K2:17)
		If (DEF_l_SettingsCalled=0)
			FSetting_SetLabel(WIN_t_CurrentOutputform)
			If (SIZ_l_OLDLEFT=0) & (SIZ_l_OLDTOP=0) & (SIZ_l_OLDRIGHT=0) & (SIZ_l_OLDBOTTOM=0)
				WS_OutputResize
				WIN_bo_Resize:=False:C215
			End if 
			INT_Setoutput(Table:C252(->[PERSONNEL:11]); WIN_t_CurrentOutputform)
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
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[PERSONNEL:11]); "Personnel_Out")
		Cache_Initialise
	: ($_l_event=On Activate:K2:9)  //| (vFromIn))
		OpenHelp(Table:C252(->[PERSONNEL:11]); "Personnel_Out")
		vButtDisO:="O              DT"
		Out_Buttons
	: ($_l_event=On Deactivate:K2:10)
		// PAUSE PROCESS(Current process)
	: ($_l_event=On Menu Selected:K2:14)
		$_l_OK:=Personnel_SelLP
		
	: ($_l_event=On Outside Call:K2:11)
		Out_ButtCall(->[PERSONNEL:11]; ->[PERSONNEL:11]Initials:1; ->[PERSONNEL:11]Name:2; "Personnel"; "DB_MenuNewRecord"; "Minor_Sel"; "Minor_Del"; ""; "Personnel"; ""; 0; 0)
	: ($_l_event=On Header:K2:17)
		If ((DB_GetModuleSettingByNUM(1))=5)
			DB_MenuAction("Find"; ""; 3; "")
			//DISABLE MENU ITEM(2049;0)
		End if 
	: ($_l_event=On Open Detail:K2:23)
		GET WINDOW RECT:C443(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
		INT_bo_DetailOpen:=True:C214
	: ($_l_event=On Close Detail:K2:24)
		$_t_CloseReference:=Table name:C256(->[PERSONNEL:11])+"_"+WIN_t_CurrentInputForm  //added NG may 2004
		INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_CloseReference)
		
		SET WINDOW RECT:C444(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
		vButtDisO:="O              DT"
		Out_Buttons
		$_Obj_GetUser:=New object:C1471("personID"; <>PER_l_CurrentUserID; "functions"; 0; "noGreybuttons"; False:C215)
		SYS_GetCurrentUserSetting($_Obj_GetUser)
		If (<>USERMODID=<>PER_t_CurrentUserInitials)  //current User_Modified
			If ($_Obj_GetUser.functions#<>USERMODPREF)
				//<>PER_l_CurrentPersFunctions:=<>USERMODPREF
				$_bo_Toolstate:=($_Obj_GetUser.functions ?? 2)
				$_l_BarProcess:=Get_ProcessNumber("Modules_Palette")
				If ($_bo_Toolstate)
					
					If ($_l_BarProcess>0)
						$_l_ProcessStatus:=Process state:C330($_l_BarProcess)
						If ($_l_ProcessStatus=6)
							SHOW PROCESS:C325($_l_BarProcess)
							
						End if 
					Else 
						ZMenu_ModBar2
					End if 
				Else 
					If ($_l_BarProcess>0)
						HIDE PROCESS:C324($_l_BarProcess)
					End if 
					
					
				End if 
				$_bo_Toolstate:=($_Obj_GetUser.functions ?? 4)
				$_l_TipsState:=Num:C11($_Obj_GetUser.functions ?? 7)
				$_bo_ScreenSaverState:=($_Obj_GetUser.functions ?? 6)
				If (Not:C34($_bo_ScreenSaverState))
					<>ScrnSavMin:=999999999
					//that will stop it coming on!
				End if 
				
				
			End if 
			
			
		End if 
	: ($_l_event=On Display Detail:K2:22)
		PER_l_ShowSchedule:=0
		PER_l_ShowWorkflow:=0
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
				PER_l_ShowWorkflow:=1  //Value 1
				PER_l_ShowSchedule:=0
				PER_l_RunReminders:=1  //Value 4
			: ([PERSONNEL:11]Startup_Diary:16=6)  //WorkFlow and reminders
				PER_l_ShowWorkflow:=0
				PER_l_ShowSchedule:=1  // Value 2
				PER_l_RunReminders:=1  //Value 4
			: ([PERSONNEL:11]Startup_Diary:16=7)  //WorkFlow  Schedule and reminders
				PER_l_ShowWorkflow:=1  //Value 1
				PER_l_ShowSchedule:=1  //Value 2
				PER_l_RunReminders:=1  //Value 4
		End case 
		
End case 
ERR_MethodTrackerReturn("FM:Personnel_Out"; $_t_oldMethodName)

