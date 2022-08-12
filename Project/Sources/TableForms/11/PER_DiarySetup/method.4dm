If (False:C215)
	//Table Form Method Name: [PERSONNEL]PER_DiarySetup
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/10/2012 13:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(PER_lb_ActionSettings;0)
	//ARRAY BOOLEAN(SD_abo_TimeModified;0)
	//ARRAY INTEGER(SD_ai_ActionCodes;0)
	//ARRAY INTEGER(SD_ai_ActionCodesOSW;0)
	//ARRAY LONGINT(SD_al_ActionCodesOST;0)
	//ARRAY LONGINT(SD_al_ActionTime;0)
	//ARRAY LONGINT(SD_al_ActionTimeOLD;0)
	//ARRAY TEXT(SD_at_ActionCodes;0)
	//ARRAY TEXT(SD_at_ActioncodesOST;0)
	//ARRAY TEXT(SD_at_ActionTimesString;0)
	//ARRAY TEXT(SD_at_DiaryActionNames;0)
	C_BOOLEAN:C305(PER_Bo_SaturdayWork; PER_bo_SettingsModified; PER_bo_SundayWork; SD_bo_SaturdayWork; SD_bo_SundayWork; DB_bo_NoLoad; PER_Bo_SaturdayWork; PER_bo_SettingsModified; PER_bo_SundayWork; SD_bo_SaturdayWork; SD_bo_SundayWork)
	C_LONGINT:C283($_l_FieldNumber; $_l_index; $_l_TableNumber; PER_l_BUT1; PER_l_But2; PER_l_BUT3; PER_l_BUT4; PER_l_BUT5; PER_l_BUT6; PER_l_BUT7; PER_l_BUT9)
	C_LONGINT:C283(PER_l_RunReminders; PER_l_SaveSettings; PER_l_ShowNothing; PER_l_ShowSchedule; PER_l_ShowWorkflow; SD_l_SettingsTimeLen; $_l_event; $_l_FieldNumber; $_l_index; $_l_TableNumber; PER_l_BUT8)
	C_LONGINT:C283(PER_l_RunReminders; PER_l_SaveSettings; PER_l_SettingsTimeLen; PER_l_ShowNothing; PER_l_ShowSchedule; PER_l_ShowWorkflow; SD_l_SettingsTimeLen)
	C_POINTER:C301($_ptr_FocusObject)
	C_TEXT:C284($_t_VariableName; PER_t_COL1; PER_t_COL2; PER_t_COL3; PER_t_COL4; PER_t_COL5; PER_t_COL6; PER_t_COL7; PER_t_COL8; PER_t_COL9; PER_t_HED2)
	C_TEXT:C284(PER_t_HED3; PER_t_HED4; PER_t_HED5; PER_t_HED6; PER_t_HED7; PER_t_HED8; PER_t_HED9; $_t_oldMethodName; $_t_VariableName; PER_t_HED1)
	C_TIME:C306(PER_ti_SettingsTimeStart; SD_ti_SettingsTimeEnd; SD_ti_SettingsTimeStart; PER_ti_SettingsTimeEnd; PER_ti_SettingsTimeStart; SD_ti_SettingsTimeEnd; SD_ti_SettingsTimeStart)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [PERSONNEL].PER_DiarySetup"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		SD_LoadPrefs([PERSONNEL:11]Personnel_ID:48)
		ARRAY LONGINT:C221(SD_al_ActionTimeOLD; 0)
		COPY ARRAY:C226(SD_al_ActionTime; SD_al_ActionTimeOLD)
		
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
		
		PER_bo_SettingsModified:=False:C215
		
		PER_ti_SettingsTimeStart:=SD_ti_SettingsTimeStart
		PER_ti_SettingsTimeEnd:=SD_ti_SettingsTimeEnd
		PER_Bo_SaturdayWork:=SD_bo_SaturdayWork
		PER_bo_SundayWork:=SD_bo_SundayWork
		PER_l_SettingsTimeLen:=SD_l_SettingsTimeLen
		PER_l_SaveSettings:=0
		ARRAY BOOLEAN:C223(SD_abo_TimeModified; 0)
		ARRAY BOOLEAN:C223(SD_abo_TimeModified; Size of array:C274(SD_at_ActionCodes))
		
		
		LB_SetupListbox(->PER_lb_ActionSettings; "PER_t"; "PER_L"; 1; ->SD_at_ActionCodes; ->SD_at_DiaryActionNames; ->SD_at_ActionTimesString; ->SD_ai_ActionCodes; ->SD_al_ActionTime; ->SD_ai_ActionCodesOSW; ->SD_al_ActionCodesOST; ->SD_at_ActioncodesOST; ->SD_abo_TimeModified)
		
		
		LB_SetColumnHeaders(->PER_lb_ActionSettings; "PER_L"; 1; "Code"; "Name"; "Default Amount of time"; ""; ""; ""; ""; ""; "")
		
		
		
		LB_SetColumnWidths(->PER_lb_ActionSettings; "PER_t"; 1; 87; 187; 99; 0; 0; 0; 0; 0; 0)
		
		
		
		LB_SetEnterable(->PER_lb_ActionSettings; False:C215; 0)
		LB_SetScroll(->PER_lb_ActionSettings; -3; -2)
		LB_StyleSettings(->PER_lb_ActionSettings; "Black"; 9; "PER_t"; ->[DIARY:12])
		For ($_l_index; 1; Size of array:C274(SD_at_ActionTimesString))
			If (SD_al_ActionTime{$_l_index}=0)
				SD_al_ActionTime{$_l_index}:=PER_l_SettingsTimeLen
			End if 
			SD_at_ActionTimesString{$_l_index}:=SD2_MinutestoTimeString(SD_al_ActionTime{$_l_index})
			
			
			
		End for 
	: ($_l_event=On Data Change:K2:15)
		PER_bo_SettingsModified:=True:C214
	: ($_l_event=On Clicked:K2:4)
		
		
		$_ptr_FocusObject:=Focus object:C278
		RESOLVE POINTER:C394($_ptr_FocusObject; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		Case of 
			: ($_t_VariableName="PER_l_ShowSchedule")
				PER_bo_SettingsModified:=True:C214
				If (PER_l_ShowSchedule=1)
					PER_l_ShowNothing:=0
				End if 
			: ($_t_VariableName="PER_l_ShowWorkflow")
				PER_bo_SettingsModified:=True:C214
				If (PER_l_ShowWorkflow=1)
					PER_l_ShowNothing:=0
				End if 
			: ($_t_VariableName="PER_l_ShowNothing")
				PER_bo_SettingsModified:=True:C214
				If (PER_l_ShowNothing=1)
					PER_l_ShowSchedule:=0
					PER_l_ShowWorkflow:=0
				End if 
			: ($_t_VariableName="PER_l_RunReminders")
				PER_bo_SettingsModified:=True:C214
			: ($_t_VariableName="PER_Bo_SaturdayWork")
				PER_bo_SettingsModified:=True:C214
			: ($_t_VariableName="PER_bo_SundayWork")
				PER_bo_SettingsModified:=True:C214
			: ($_t_VariableName="SD_l_IncludeCompleted")
				PER_bo_SettingsModified:=True:C214
		End case 
End case 
ERR_MethodTrackerReturn("FM [PERSONNEL].PER_DiarySetup"; $_t_oldMethodName)
