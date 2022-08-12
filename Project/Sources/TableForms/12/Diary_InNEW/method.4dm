If (False:C215)
	//Table Form Method Name: Object Name:      [DIARY].Diary_InNEW
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/10/2012 10:23
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY DATE(SD3_ad_CacheEndDateRange;0)
	//ARRAY DATE(SD3_ad_CacheStartDateRange;0)
	//ARRAY INTEGER(SD_ai_ActionCodes;0)
	//ARRAY INTEGER(SD_ai_ActionCodesOSW;0)
	//ARRAY INTEGER(SD_ai_ResultCodes;0)
	//ARRAY LONGINT(MOD_al_ModuleBarNum;0)
	//ARRAY LONGINT(MOD_al_ModuleBarOffsets;0)
	//ARRAY LONGINT(SD_al_ActionCodesOST;0)
	//ARRAY LONGINT(SD_al_ActionTime;0)
	//ARRAY LONGINT(SD_al_MenuCall;0)
	//ARRAY LONGINT(SD_al_PersonClass;0)
	//ARRAY LONGINT(SD_al_PriorityNUM;0)
	//ARRAY LONGINT(SD3_al_CacheCurrentPage;0)
	//ARRAY POINTER(SD_aptr_RelationFields;0)
	//ARRAY TEXT(SD_at_ActionCodes;0)
	//ARRAY TEXT(SD_at_ActioncodesOST;0)
	//ARRAY TEXT(SD_at_Arrayrelations;0)
	//ARRAY TEXT(SD_at_DefaultTimeSettings;0)
	//ARRAY TEXT(SD_at_DiaryActionNames;0)
	//ARRAY TEXT(SD_at_DiaryOwners;0)
	//ARRAY TEXT(SD_at_DIOPersonnelNAME;0)
	//ARRAY TEXT(SD_at_History;0)
	//ARRAY TEXT(SD_at_PersonInitials;0)
	//ARRAY TEXT(SD_at_PriorityNM;0)
	//ARRAY TEXT(SD_at_RelationTypes;0)
	//ARRAY TEXT(SD_at_ResultCodes;0)
	//ARRAY TEXT(SD_at_ResultNames;0)
	//ARRAY TEXT(SD2_at_CurrentDiaryInitials;0)
	//ARRAY TEXT(SD3_at_CacheEndPerson;0)
	//ARRAY TEXT(SD3_at_TimeFrame;0)
	C_BOOLEAN:C305(<>AutoFind; <>DB_bo_AutoOut; DB_bo_NoLoad; DIARY; PAL_bo_ButtonSubFunction; SD_bo_AddingDiaryRecord; SD_bo_CBAlarmed; SD_bo_RecordModified; SD_bo_ResultsDialog)
	C_DATE:C307(SD_D_CurrentviewDate; SD_D_Date; SD_D_DateDO; SD_d_DiaryViewDate; SD_d_EndDate; SD_d_StartDate; vSD_QuyDiaryDate)
	C_LONGINT:C283(<>AutoProc; <>FloatingCalender; <>MENU_l_BarModule; $_l_buttonBottom; $_l_buttonHeight; $_l_ButtonLeft; $_l_ButtonNumber; $_l_ButtonRight; $_l_ButtonTop; $_l_DiaryOwnerRow; $_l_Element)
	C_LONGINT:C283($_l_event; $_l_FieldCount; $_l_History; $_l_Index; $_l_InitialsRow; $_l_LastObjectBottom; $_l_LastObjectLeft; $_l_LastObjectRight; $_l_LastObjectTop; $_l_MenuBarSelected; $_l_MenuSelected)
	C_LONGINT:C283($_l_ModuleRow; $_l_PersonArraySize; $_l_PriorityRow; $_l_ResItemsIndex; $_l_TableNumber; $_l_WIndowBottom; $_l_WindowLeft; $_l_WIndowRight; $_l_WindowTop; $longTime; $SD_Event)
	C_LONGINT:C283(Badd_Person; Baddrelation; CB_ActionDone; DB_l_ButtonClickedFunction; DB_l_WindowCurrentModule; iCancel; iOK; ModuleNumber; PAL_but_LastRecord; PAL_but_PreviousRecord; PAL_but_NextRecord)
	C_LONGINT:C283(PAL_but_FirstRecord; SD_Do_DOWN; SD_Do_DOWN2; SD_Do_Up; SD_Do_Up2; SD_HL_l_Hours; SD_HL_l_Hours2; SD_l_CompanionMenuTable; SD_l_DescriptionSplitter; SD_l_DiaryPersonID; SD_l_EditingDiaryRecord)
	C_LONGINT:C283(SD_l_IncAppointmentCo; SD_l_IncEventCo; SD_l_IncQueryCo; SD_l_IncTodoCo; SD_l_RecNeedssaving; SD_l_RelationAdd; SD_l_SettingsTimeLen; SD_l_TimeFrame; SD_l_YearMonthDayTime; SD3_l_DiaryActionNum; SD3_l_DiaryRelatedRecordTable)
	C_LONGINT:C283(SD3_l_FloatingDiaryList; vSD_SelCalendar2; vSD_SelCalendar3)
	C_POINTER:C301($_ptr_Field; SD_ptr_Date1; SD_ptr_Date2; SD_ptr_RelationAdd)
	C_TEXT:C284(<>AutoFile; <>CallCode; <>DefPrior; <>HLAPPAREATEXT; <>HLEVENTAREATEXT; <>HLTASKAREATEXT; <>JobCode; <>OrderCode; <>PER_t_CurrentUserInitials; $_t_DiaryCode; $_t_MenuName)
	C_TEXT:C284($_t_oldMethodName; $_t_PalletButtonName; BAR_t_Button; DB_t_CUrrentInputMenuRef; dl_ProductT; PAL_BUTTON; SD_at_TimeFrame; SD_t_CurrentDiaryInitials; SD_t_CurrentDiaryOwnerName; SD_t_DiaryActionCode; SD_t_DiaryCode)
	C_TEXT:C284(SD_t_DiaryDefaultUser; SD_t_DiaryPersonInitials; SD_t_DiaryPersonName; SD_t_JobName; SD_t_Periodstr; SD_t_PriorityName; SD_t_ProcRelationActionID; SD_t_RelationAdd; SD_t_RelationCode; SD_t_TimeSetting; SD3_t_DiaryRelatedRecord)
	C_TEXT:C284(SD3_t_DiaryRelatedRecordCode; vButtDisDry; vSD_QuyDiaryPerson; WIN_t_CurrentInputForm)
	C_TIME:C306($_ti_TimeDoFrom; $_ti_TimeDoTo; SD_ti_CurrentviewEndTime; SD_ti_CurrentviewStartTime; SD_ti_SettingsTimeEnd; SD_ti_SettingsTimeStart; SD_ti_TimeDo)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [DIARY].Diary_InNEW"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		DB_SetnewToolBar
		
		If ([DIARY:12]Done:14)
			UNLOAD RECORD:C212([DIARY:12])
			READ ONLY:C145([DIARY:12])
			LOAD RECORD:C52([DIARY:12])
		End if 
		
		ARRAY TEXT:C222(SD_at_History; 0)
		DB_LoadDisplay(Table:C252(->[DIARY:12]); ->SD_at_History)
		OpenHelp(Table:C252(->[DIARY:12]); "Diary_InNEW")
		
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WIndowRight; $_l_WIndowBottom)
		SET WINDOW RECT:C444($_l_WindowLeft; 80; $_l_WIndowRight; 80+659)
		
		WS_AutoscreenSize(2; 660; 700)
		DB_SetInputFormMenu(Table:C252(->[DIARY:12]); "Diary_InNew")
		If (Records in selection:C76([DIARY:12])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		
		SD_t_DiaryDefaultUser:=<>PER_t_CurrentUserInitials
		ARRAY TEXT:C222(SD_at_DefaultTimeSettings; 8)
		SD_at_DefaultTimeSettings{1}:="No Time"  //start=00:00:00 finish=00:00:00`default for tasks
		SD_at_DefaultTimeSettings{2}:="All Day"  //start =day start time`end =end day time default for events
		SD_at_DefaultTimeSettings{3}:="-"
		SD_at_DefaultTimeSettings{4}:="All Morning"
		SD_at_DefaultTimeSettings{5}:="All Afternoon"
		SD_at_DefaultTimeSettings{6}:="All Evening"
		SD_at_DefaultTimeSettings{7}:="-"
		SD_at_DefaultTimeSettings{8}:="Set Time"
		OBJECT SET VISIBLE:C603(SD_t_TimeSetting; False:C215)
		OBJECT SET VISIBLE:C603(SD_at_DefaultTimeSettings; False:C215)
		ARRAY TEXT:C222(SD_at_Arrayrelations; 0)
		ARRAY TEXT:C222(SD_at_RelationTypes; 7)
		ARRAY POINTER:C280(SD_aptr_RelationFields; 7)
		ARRAY LONGINT:C221(SD_al_MenuCall; 7)
		$_l_Element:=0
		If ((DB_GetModuleSettingByNUM(Module_SalesOrders))>0)  //orders available"
			$_l_Element:=$_l_Element+1
			SD_at_RelationTypes{$_l_Element}:="Order :"
			SD_aptr_RelationFields{$_l_Element}:=->[DIARY:12]Order_Code:26
			SD_al_MenuCall{$_l_Element}:=7
		End if 
		
		If ((DB_GetModuleSettingByNUM(Module_Products))>0)  //products available"
			$_l_Element:=$_l_Element+1
			SD_at_RelationTypes{$_l_Element}:="Product:"
			SD_aptr_RelationFields{$_l_Element}:=->[DIARY:12]Product_Code:13
			SD_al_MenuCall{$_l_Element}:=5
		End if 
		If ((DB_GetModuleSettingByNUM(Module_JobCosting))>0)  //jobs available"
			$_l_Element:=$_l_Element+1
			SD_at_RelationTypes{$_l_Element}:="Job:"
			SD_aptr_RelationFields{$_l_Element}:=->[DIARY:12]Job_Code:19
			SD_al_MenuCall{$_l_Element}:=9
		End if 
		If ((DB_GetModuleSettingByNUM(Module_JobCosting))>0)  //jobs  stage available"
			$_l_Element:=$_l_Element+1
			SD_at_RelationTypes{$_l_Element}:="Job Stage:"
			SD_aptr_RelationFields{$_l_Element}:=->[DIARY:12]Stage_Code:21
			SD_al_MenuCall{$_l_Element}:=13
		End if 
		If ((DB_GetModuleSettingByNUM(Module_ServiceCentre))>0)  //service centre"
			$_l_Element:=$_l_Element+1
			SD_at_RelationTypes{$_l_Element}:="Call :"
			SD_aptr_RelationFields{$_l_Element}:=->[DIARY:12]Call_Code:25
			SD_al_MenuCall{$_l_Element}:=8
		End if 
		ARRAY TEXT:C222(SD_at_RelationTypes; $_l_Element)
		ARRAY POINTER:C280(SD_aptr_RelationFields; $_l_Element)
		ARRAY LONGINT:C221(SD_al_MenuCall; $_l_Element)
		SD_t_RelationAdd:=""
		SD_t_RelationCode:=""
		
		SD_l_RelationAdd:=0
		
		
		OBJECT SET VISIBLE:C603(SD_t_RelationAdd; False:C215)
		OBJECT SET VISIBLE:C603(*; "Pic_Relation"; False:C215)
		OBJECT SET VISIBLE:C603(SD_t_RelationCode; False:C215)
		OBJECT SET VISIBLE:C603(SD_at_RelationTypes; False:C215)
		OBJECT SET VISIBLE:C603(SD_at_DIOPersonnelNAME; False:C215)
		OBJECT SET VISIBLE:C603(Badd_Person; False:C215)
		ARRAY LONGINT:C221(SD3_al_CacheCurrentPage; 0)
		ARRAY DATE:C224(SD3_ad_CacheStartDateRange; 0)
		ARRAY DATE:C224(SD3_ad_CacheEndDateRange; 0)
		ARRAY TEXT:C222(SD3_at_CacheEndPerson; 0)
		ARRAY TEXT:C222(SD3_at_TimeFrame; 0)
		ARRAY TEXT:C222(SD_at_DiaryOwners; 3)
		ARRAY TEXT:C222(SD_at_PersonInitials; 3)
		ARRAY LONGINT:C221(SD_al_PersonClass; 3)
		If (SD_t_DiaryPersonInitials="")
			QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=SD_t_DiaryDefaultUser)
		Else 
			If (SD_t_DiaryPersonInitials#"MULTI")
				QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=SD_t_DiaryPersonInitials)
			Else 
				If (Size of array:C274(SD2_at_CurrentDiaryInitials)>0)
					QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=SD2_at_CurrentDiaryInitials{1})
				Else 
					QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=<>PER_t_CurrentUserInitials)  // get out clause
				End if 
			End if 
		End if 
		SD_l_DiaryPersonID:=[PERSONNEL:11]Personnel_ID:48
		$_l_InitialsRow:=Size of array:C274(SD_at_PersonInitials)+1
		SD_at_PersonInitials{1}:=[PERSONNEL:11]Initials:1
		SD_at_DiaryOwners{1}:=[PERSONNEL:11]Name:2
		If ([PERSONNEL:11]Global_Access:47=False:C215)
			If (SD_t_DiaryDefaultUser=<>PER_t_CurrentUserInitials)
				SD_al_PersonClass{1}:=0
			Else 
				SD_al_PersonClass{1}:=2
			End if 
		Else 
			SD_al_PersonClass{1}:=3
		End if 
		
		
		SD_LoadPrefs([PERSONNEL:11]Personnel_ID:48)
		For ($_l_Index; Size of array:C274(SD_at_DiaryActionNames); 1; -1)
			If (SD_ai_ActionCodes{$_l_Index}=0)
				DELETE FROM ARRAY:C228(SD_ai_ActionCodes; $_l_Index)
				DELETE FROM ARRAY:C228(SD_at_ActionCodes; $_l_Index)
				DELETE FROM ARRAY:C228(SD_at_DiaryActionNames; $_l_Index)
				DELETE FROM ARRAY:C228(SD_al_ActionTime; $_l_Index)
				DELETE FROM ARRAY:C228(SD_ai_ActionCodesOSW; $_l_Index)
				DELETE FROM ARRAY:C228(SD_al_ActionCodesOST; $_l_Index)
				DELETE FROM ARRAY:C228(SD_at_ActioncodesOST; $_l_Index)
			End if 
			
		End for 
		For ($_l_Index; Size of array:C274(SD_ai_ResultCodes); 1; -1)
			If (SD_ai_ResultCodes{$_l_Index}=0)
				DELETE FROM ARRAY:C228(SD_ai_ResultCodes; $_l_Index)
				DELETE FROM ARRAY:C228(SD_at_ResultCodes; $_l_Index)
				DELETE FROM ARRAY:C228(SD_at_ResultNames; $_l_Index)
			End if 
		End for 
		
		If (SD_bo_ResultsDialog)
			OBJECT SET VISIBLE:C603(SD_at_ResultNames; False:C215)
			OBJECT SET VISIBLE:C603(*; "Library Picture14"; False:C215)
		End if 
		
		ARRAY TEXT:C222(SD_at_DiaryOwners; 1)
		ARRAY TEXT:C222(SD_at_PersonInitials; 1)
		ARRAY LONGINT:C221(SD_al_PersonClass; 1)
		QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Global_Access:47=True:C214; *)  //WT-17/08/01: listing for global resource items
		QUERY:C277([PERSONNEL:11];  & ; [PERSONNEL:11]PersonDeleted:38#1)
		$_l_Element:=Size of array:C274(SD_at_DiaryOwners)
		If (Records in selection:C76([PERSONNEL:11])>0)
			INSERT IN ARRAY:C227(SD_at_DiaryOwners; 9999; Records in selection:C76([PERSONNEL:11])+1)
			INSERT IN ARRAY:C227(SD_at_PersonInitials; 9999; Records in selection:C76([PERSONNEL:11])+1)
			INSERT IN ARRAY:C227(SD_al_PersonClass; 9999; Records in selection:C76([PERSONNEL:11])+1)
			$_l_PersonArraySize:=Size of array:C274(SD_at_PersonInitials)+1
			$_l_Element:=$_l_Element+1
			SD_at_PersonInitials{$_l_Element}:="-"  //insert a seperator here
			SD_at_DiaryOwners{$_l_Element}:="-"  //and insert a seperator here
			ORDER BY:C49([PERSONNEL:11]; [PERSONNEL:11]Name:2; >)
			For ($_l_ResItemsIndex; 1; Records in selection:C76([PERSONNEL:11]))
				$_l_Element:=$_l_Element+1
				SD_at_PersonInitials{$_l_Element}:=[PERSONNEL:11]Initials:1
				SD_at_DiaryOwners{$_l_Element}:=[PERSONNEL:11]Name:2
				SD_al_PersonClass{$_l_Element}:=3
				NEXT RECORD:C51([PERSONNEL:11])
			End for 
		End if 
		INSERT IN ARRAY:C227(SD_at_DiaryOwners; 9999; 3)
		INSERT IN ARRAY:C227(SD_at_PersonInitials; 9999; 3)
		INSERT IN ARRAY:C227(SD_al_PersonClass; 9999; 3)
		SD_at_DiaryOwners{Size of array:C274(SD_at_DiaryOwners)}:="Multiple Diaries"
		SD_at_DiaryOwners{Size of array:C274(SD_at_DiaryOwners)-1}:="Other People Diaries"
		SD_at_DiaryOwners{Size of array:C274(SD_at_DiaryOwners)-2}:="-"
		SD_al_PersonClass{Size of array:C274(SD_al_PersonClass)}:=2
		Case of 
			: (SD_t_DiaryCode#"")
				$_l_DiaryOwnerRow:=Find in array:C230(SD_at_DiaryOwners; vSD_QuyDiaryPerson)
			: (SD_at_DiaryOwners{SD_at_DiaryOwners}="")
				
				$_l_DiaryOwnerRow:=1
			Else 
				$_l_DiaryOwnerRow:=1
		End case 
		
		Case of 
			: (vSD_QuyDiaryPerson#"")
				SD_t_CurrentDiaryInitials:=vSD_QuyDiaryPerson
			: (SD_t_CurrentDiaryInitials="")
				If (SD_t_DiaryPersonInitials="")
					SD_t_CurrentDiaryInitials:=SD_t_DiaryDefaultUser
				Else 
					If (SD_t_DiaryPersonInitials#"MULTI")
						SD_t_CurrentDiaryInitials:=SD_t_DiaryPersonInitials
					Else 
						If (Size of array:C274(SD2_at_CurrentDiaryInitials)>0)
							SD_t_CurrentDiaryInitials:=SD2_at_CurrentDiaryInitials{1}
						Else 
							SD_t_CurrentDiaryInitials:=<>PER_t_CurrentUserInitials
						End if 
					End if 
				End if 
		End case 
		
		//need to load prefs here
		$_t_DiaryCode:=[DIARY:12]Diary_Code:3
		Diary_InB
		
		If ($_t_DiaryCode="")  //new record
			If ([DIARY:12]Company_Code:1#"") | ([DIARY:12]Contact_Code:2#"")
				If (SD_D_DateDO#!00-00-00!)
					[DIARY:12]Date_Do_From:4:=SD_D_DateDO
					[DIARY:12]Date_Do_To:33:=SD_D_DateDO
					$_ti_TimeDoFrom:=SD_ti_TimeDo
					If (SD_ti_TimeDo=?00:00:00?)
						If ([DIARY:12]Date_Do_From:4=Current date:C33(*))
							$_ti_TimeDoFrom:=Current time:C178(*)
						Else 
							$_ti_TimeDoFrom:=SD_ti_SettingsTimeStart
						End if 
					End if 
					[DIARY:12]Time_Do_From:6:=$_ti_TimeDoFrom
					//the following bit finds the first time slot of the amount needed after(or at)
					//the prefferred time it returns an end time for the event
					//`so after calling recalc the start time
					[DIARY:12]Time_Do_To:35:=[DIARY:12]Time_Do_From:6+(SD_l_SettingsTimeLen*60)
				End if 
			Else 
				If ([DIARY:12]Diary_Code:3="")
					DiarySetCode
				End if 
				If (SD_D_DateDO#!00-00-00!)
					[DIARY:12]Date_Do_From:4:=SD_D_DateDO
					
				Else 
					[DIARY:12]Date_Do_From:4:=Current date:C33(*)
				End if 
				If (SD_D_DateDO#!00-00-00!)
					[DIARY:12]Date_Do_To:33:=SD_D_DateDO
				Else 
					[DIARY:12]Date_Do_To:33:=Current date:C33(*)
				End if 
				
				$_ti_TimeDoFrom:=SD_ti_TimeDo
				If (SD_t_DiaryActionCode#"TASK")  // | (True)
					If (SD_ti_TimeDo=?00:00:00?)
						If ([DIARY:12]Date_Do_From:4=Current date:C33(*))
							$_ti_TimeDoFrom:=Current time:C178(*)
						Else 
							$_ti_TimeDoFrom:=SD_ti_SettingsTimeStart
						End if 
					End if 
					[DIARY:12]Time_Do_From:6:=$_ti_TimeDoFrom
					//the following bit finds the first time slot of the amount needed after(or at)
					//the prefferred time it returns an end time for the event
					//`so after calling recalc the start time
					If (SD_t_DiaryActionCode#"EVENT") & (SD_t_DiaryActionCode#"TASK")
						[DIARY:12]Time_Do_To:35:=SD_GETAVAILABLETIMESLOT(SD_t_CurrentDiaryInitials; [DIARY:12]Date_Do_From:4; $_ti_TimeDoFrom; SD_l_SettingsTimeLen)
					End if 
					[DIARY:12]Time_Do_From:6:=Time:C179(Time string:C180([DIARY:12]Time_Do_To:35-(SD_l_SettingsTimeLen*60)))
				Else 
					If (SD_D_DateDO#!00-00-00!)
						
						[DIARY:12]Date_Do_From:4:=SD_D_DateDO
						[DIARY:12]Date_Do_To:33:=SD_D_DateDO
						$_ti_TimeDoFrom:=SD_ti_TimeDo
						If (SD_ti_TimeDo=?00:00:00?)
							If ([DIARY:12]Date_Do_From:4=Current date:C33(*))
								$_ti_TimeDoFrom:=Current time:C178(*)
							Else 
								$_ti_TimeDoFrom:=SD_ti_SettingsTimeStart
							End if 
						End if 
						[DIARY:12]Time_Do_From:6:=$_ti_TimeDoFrom
						//the following bit finds the first time slot of the amount needed after(or at)
						//the prefferred time it returns an end time for the event
						//`so after calling recalc the start time
						If (SD_t_DiaryActionCode#"EVENT") & (SD_t_DiaryActionCode#"TASK")  // | (True)
							[DIARY:12]Time_Do_To:35:=SD_GETAVAILABLETIMESLOT(SD_t_CurrentDiaryInitials; [DIARY:12]Date_Do_From:4; $_ti_TimeDoFrom; SD_l_SettingsTimeLen)
						End if 
						[DIARY:12]Time_Do_From:6:=Time:C179(Time string:C180([DIARY:12]Time_Do_To:35-(SD_l_SettingsTimeLen*60)))
						
						
					Else 
						
						$_ti_TimeDoFrom:=?00:00:00?
						$_ti_TimeDoTo:=?00:00:00?
					End if 
					
				End if 
				
			End if 
			If ([DIARY:12]Person:8="")
				If (SD_at_PersonInitials{SD_at_DiaryOwners}#"")
					
					[DIARY:12]Person:8:=SD_at_PersonInitials{SD_at_DiaryOwners}
				Else 
					[DIARY:12]Person:8:=SD_t_DiaryDefaultUser
				End if 
			End if 
			RELATE ONE:C42([DIARY:12]Person:8)
			SD_t_DiaryPersonName:=[PERSONNEL:11]Name:2
			SD_SetFieldsTrue
			DB_MenuAction("Functions"; ""; 2; "")
			SD_bo_AddingDiaryRecord:=True:C214
			SD_SetVisible(True:C214)
			OBJECT SET VISIBLE:C603([DIARY:12]Time_Do_From:6; True:C214)
			OBJECT SET VISIBLE:C603([DIARY:12]Time_Do_To:35; True:C214)
			OBJECT SET VISIBLE:C603(*; "Text14"; True:C214)
			OBJECT SET VISIBLE:C603(*; "Text15"; True:C214)
			OBJECT SET VISIBLE:C603(*; "Library Picture1"; True:C214)
			OBJECT SET VISIBLE:C603(*; "Library Picture2"; True:C214)
			$_l_event:=Form event code:C388
			$_l_PriorityRow:=Find in array:C230(SD_al_PriorityNUM; Num:C11([DIARY:12]Priority:17))
			If ($_l_PriorityRow>0)
				SD_al_PriorityNUM:=SD_al_PriorityNUM{$_l_PriorityRow}
				SD_t_PriorityName:=SD_at_PriorityNM{$_l_PriorityRow}
			Else 
				$_l_ModuleRow:=Find in array:C230(SD_al_PriorityNUM; Num:C11(<>DefPrior))
				If ($_l_ModuleRow>0)
					SD_al_PriorityNUM:=SD_al_PriorityNUM{$_l_ModuleRow}
					SD_t_PriorityName:=SD_at_PriorityNM{$_l_ModuleRow}
					[DIARY:12]Priority:17:=String:C10(SD_al_PriorityNUM{$_l_ModuleRow})
				Else 
					SD_al_PriorityNUM:=3
					SD_t_PriorityName:="Normal"
				End if 
				
				SD_SetSplitter(->SD_l_DescriptionSplitter; 1)
				SD_LoadOtherPerson([DIARY:12]Diary_Code:3; [DIARY:12]Person:8)
				CB_ActionDone:=Num:C11([DIARY:12]Done:14)
				WS_KeepFocus
			End if 
			
			
		Else 
			//not a new record
			SD_SetVisible(False:C215)
			RELATE ONE:C42([DIARY:12]Company_Code:1)
			WT_hl_DiaryDETAIL2
			HIGHLIGHT TEXT:C210([DIARY:12]Action_Details:10; Length:C16([DIARY:12]Action_Details:10); Length:C16([DIARY:12]Action_Details:10))
			SD_SetSplitter(->SD_l_DescriptionSplitter)
			SD_LoadOtherPerson([DIARY:12]Diary_Code:3; [DIARY:12]Person:8)
			If (Records in selection:C76([DIARY:12])>0)
				DB_MenuAction("Functions"; ""; 2; "")
				DB_MenuAction("Functions"; "Switch Access"; 3; "")
				$_l_PriorityRow:=Find in array:C230(SD_al_PriorityNUM; Num:C11([DIARY:12]Priority:17))
				If ($_l_PriorityRow>0)
					SD_al_PriorityNUM:=SD_al_PriorityNUM{$_l_PriorityRow}
					SD_t_PriorityName:=SD_at_PriorityNM{$_l_PriorityRow}
				Else 
					SD_al_PriorityNUM:=3
					SD_t_PriorityName:="Normal"
				End if 
				
				
				If ([DIARY:12]Done:14=True:C214)
					READ WRITE:C146([DIARY:12])
					LOAD RECORD:C52([DIARY:12])
					OBJECT SET ENTERABLE:C238([DIARY:12]Done:14; True:C214)
				Else 
				End if 
			End if 
		End if 
		Case of 
			: ([DIARY:12]Action_Code:9="Event")
				//Add event
				OBJECT SET VISIBLE:C603([DIARY:12]Time_Do_From:6; False:C215)
				OBJECT SET VISIBLE:C603([DIARY:12]Time_Do_To:35; False:C215)
				OBJECT SET VISIBLE:C603(*; "Text14"; False:C215)
				OBJECT SET VISIBLE:C603(*; "Text15"; False:C215)
				OBJECT SET VISIBLE:C603(*; "Library Picture2"; False:C215)
				OBJECT SET VISIBLE:C603(*; "Library Picture1"; True:C214)
				OBJECT SET VISIBLE:C603(SD_HL_l_Hours; False:C215)
				OBJECT SET VISIBLE:C603(SD_HL_l_Hours2; False:C215)
				OBJECT SET VISIBLE:C603(SD_bo_CBAlarmed; False:C215)
				OBJECT SET VISIBLE:C603(SD_l_TimeFrame; False:C215)
				OBJECT SET VISIBLE:C603(SD3_at_TimeFrame; False:C215)
				OBJECT SET VISIBLE:C603(SD_at_TimeFrame; False:C215)
				OBJECT SET VISIBLE:C603(*; "Rectangle909"; False:C215)
				OBJECT SET VISIBLE:C603(SD_t_TimeSetting; True:C214)
				OBJECT SET VISIBLE:C603(SD_at_DefaultTimeSettings; True:C214)
				SD_t_TimeSetting:=SD_at_DefaultTimeSettings{2}
				[DIARY:12]Time_Do_From:6:=SD_ti_SettingsTimeStart
				[DIARY:12]Time_Do_To:35:=SD_ti_SettingsTimeEnd
				
				
				//shedule
			: ([DIARY:12]Action_Code:9="TASK")
				//task
				[DIARY:12]Time_Do_From:6:=?00:00:00?
				OBJECT SET VISIBLE:C603([DIARY:12]Time_Do_From:6; False:C215)
				OBJECT SET VISIBLE:C603([DIARY:12]Time_Do_To:35; False:C215)
				OBJECT SET VISIBLE:C603([DIARY:12]Time_Done_From:7; False:C215)
				OBJECT SET VISIBLE:C603([DIARY:12]Time_Done_To:36; False:C215)
				
				OBJECT SET VISIBLE:C603(*; "Text14"; False:C215)
				OBJECT SET VISIBLE:C603(*; "Text15"; False:C215)
				OBJECT SET VISIBLE:C603(*; "Library Picture2"; False:C215)
				OBJECT SET VISIBLE:C603(*; "Library Picture1"; True:C214)
				OBJECT SET VISIBLE:C603(SD_HL_l_Hours; False:C215)
				OBJECT SET VISIBLE:C603(SD_HL_l_Hours2; False:C215)
				OBJECT SET VISIBLE:C603(SD_bo_CBAlarmed; False:C215)
				OBJECT SET VISIBLE:C603(SD_l_TimeFrame; False:C215)
				OBJECT SET VISIBLE:C603(SD3_at_TimeFrame; False:C215)
				OBJECT SET VISIBLE:C603(SD_at_TimeFrame; False:C215)
				OBJECT SET VISIBLE:C603(*; "Rectangle909"; False:C215)
				OBJECT SET VISIBLE:C603(SD_t_TimeSetting; True:C214)
				OBJECT SET VISIBLE:C603(SD_at_DefaultTimeSettings; True:C214)
				SD_t_TimeSetting:=SD_at_DefaultTimeSettings{1}
				
			Else 
				If (False:C215)
					OBJECT SET VISIBLE:C603(SD_t_TimeSetting; False:C215)
					OBJECT SET VISIBLE:C603(SD_at_DefaultTimeSettings; False:C215)
					OBJECT SET VISIBLE:C603(SD_HL_l_Hours; False:C215)
					OBJECT SET VISIBLE:C603(SD_HL_l_Hours2; False:C215)
				End if 
				
		End case 
		If ([DIARY:12]Document_Code:15#"") & (Not:C34([DIARY:12]Done:14)) & ($_t_DiaryCode#"")
			If ([DOCUMENTS:7]Document_Code:1#[DIARY:12]Document_Code:15)
				QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=[DIARY:12]Document_Code:15)
			End if 
			Case of 
				: ([DOCUMENTS:7]Document_Class:14=4D Write Letter Template) | ([DOCUMENTS:7]Document_Class:14=4D Write Letter)
					//we can only assume it was printed
					[DIARY:12]Done:14:=True:C214
					If ([DIARY:12]Result_Code:11="")
						
					End if 
					SD_SetVisible(False:C215)
				: ([DOCUMENTS:7]Document_Class:14=Text Email Template) | ([DOCUMENTS:7]Document_Class:14=Text Email)
					//with an email we can see it it was sent
					If ([DIARY:12]Email_ID:41>0)
						[DIARY:12]Done:14:=True:C214
						If ([DIARY:12]Result_Code:11="")
							
						End if 
						SD_SetVisible(False:C215)
					End if 
				Else 
					//we have to assume this was done and as this is not a new record the diary should done
					
			End case 
		End if 
		If ([DIARY:12]Done:14)
			OBJECT SET VISIBLE:C603(vSD_SelCalendar2; False:C215)
			OBJECT SET VISIBLE:C603(SD_Do_DOWN; False:C215)
			OBJECT SET VISIBLE:C603(SD_Do_Up; False:C215)
			OBJECT SET VISIBLE:C603(*; "oDiaryDateFromPicture"; False:C215)
			//```
			OBJECT SET VISIBLE:C603(vSD_SelCalendar3; False:C215)
			OBJECT SET VISIBLE:C603(SD_Do_DOWN2; False:C215)
			OBJECT SET VISIBLE:C603(SD_Do_Up2; False:C215)
			OBJECT SET VISIBLE:C603(*; "oDiaryDateToPicture"; False:C215)
			OBJECT SET VISIBLE:C603(SD_HL_l_Hours2; False:C215)
			OBJECT SET VISIBLE:C603(*; "oHoursPicture"; False:C215)
			OBJECT SET VISIBLE:C603(SD_HL_l_Hours; False:C215)
			OBJECT SET VISIBLE:C603(*; "oHoursPicture"; False:C215)
			OBJECT SET VISIBLE:C603(SD_at_DefaultTimeSettings; False:C215)
			OBJECT SET VISIBLE:C603(SD3_at_TimeFrame; False:C215)
			OBJECT SET VISIBLE:C603(Baddrelation; False:C215)
			$_l_FieldCount:=Get last field number:C255(Table:C252(->[DIARY:12]))
			$_l_TableNumber:=Table:C252(->[DIARY:12])
			For ($_l_Index; 1; $_l_FieldCount)
				$_ptr_Field:=Field:C253($_l_TableNumber; $_l_Index)
				OBJECT SET ENTERABLE:C238($_ptr_Field->; False:C215)
			End for 
			
		End if 
		SHOW PROCESS:C325(Current process:C322)
		BRING TO FRONT:C326(Current process:C322)
		INT_SetInput(Table:C252(->[DIARY:12]); WIN_t_CurrentInputForm)
		In_ButtChkDis(->vButtDisDry)
		OBJECT GET COORDINATES:C663(*; "oRelatedRecordID"; $_l_LastObjectLeft; $_l_LastObjectTop; $_l_LastObjectRight; $_l_LastObjectBottom)
		OBJECT GET COORDINATES:C663(*; "oPalleteButton27"; $_l_ButtonLeft; $_l_ButtonTop; $_l_ButtonRight; $_l_buttonBottom)
		$_l_buttonHeight:=$_l_buttonBottom-$_l_buttonTop
		OBJECT SET COORDINATES:C1248(*; "oPalleteButton27"; $_l_ButtonLeft; $_l_LastObjectBottom+10; $_l_ButtonRight; ($_l_LastObjectBottom+10)+$_l_buttonHeight)
		OBJECT GET COORDINATES:C663(*; "oPalleteButton25"; $_l_ButtonLeft; $_l_ButtonTop; $_l_ButtonRight; $_l_buttonBottom)
		OBJECT SET COORDINATES:C1248(*; "oPalleteButton25"; $_l_ButtonLeft; $_l_LastObjectBottom+10; $_l_ButtonRight; ($_l_LastObjectBottom+10)+$_l_buttonHeight)
		OBJECT GET COORDINATES:C663(*; "oPalleteButton23"; $_l_ButtonLeft; $_l_ButtonTop; $_l_ButtonRight; $_l_buttonBottom)
		OBJECT SET COORDINATES:C1248(*; "oPalleteButton23"; $_l_ButtonLeft; $_l_LastObjectBottom+10; $_l_ButtonRight; ($_l_LastObjectBottom+10)+$_l_buttonHeight)
		OBJECT GET COORDINATES:C663(*; "oPalleteButton21"; $_l_ButtonLeft; $_l_ButtonTop; $_l_ButtonRight; $_l_buttonBottom)
		OBJECT SET COORDINATES:C1248(*; "oPalleteButton21"; $_l_ButtonLeft; $_l_LastObjectBottom+10; $_l_ButtonRight; ($_l_LastObjectBottom+10)+$_l_buttonHeight)
		OBJECT GET COORDINATES:C663(*; "oPalleteButton29"; $_l_ButtonLeft; $_l_ButtonTop; $_l_ButtonRight; $_l_buttonBottom)
		OBJECT SET COORDINATES:C1248(*; "oPalleteButton15"; $_l_ButtonLeft; $_l_LastObjectBottom+10; $_l_ButtonRight; ($_l_LastObjectBottom+10)+$_l_buttonHeight)
		OBJECT GET COORDINATES:C663(*; "oPalleteButton4"; $_l_ButtonLeft; $_l_ButtonTop; $_l_ButtonRight; $_l_buttonBottom)
		OBJECT SET COORDINATES:C1248(*; "oPalleteButton4"; $_l_ButtonLeft; $_l_LastObjectBottom+10; $_l_ButtonRight; ($_l_LastObjectBottom+10)+$_l_buttonHeight)
		OBJECT GET COORDINATES:C663(*; "oPalleteButton3"; $_l_ButtonLeft; $_l_ButtonTop; $_l_ButtonRight; $_l_buttonBottom)
		OBJECT SET COORDINATES:C1248(*; "oPalleteButton3"; $_l_ButtonLeft; $_l_LastObjectBottom+10; $_l_ButtonRight; ($_l_LastObjectBottom+10)+$_l_buttonHeight)
		OBJECT GET COORDINATES:C663(*; "oPalleteButton2"; $_l_ButtonLeft; $_l_ButtonTop; $_l_ButtonRight; $_l_buttonBottom)
		OBJECT SET COORDINATES:C1248(*; "oPalleteButton2"; $_l_ButtonLeft; $_l_LastObjectBottom+10; $_l_ButtonRight; ($_l_LastObjectBottom+10)+$_l_buttonHeight)
		OBJECT GET COORDINATES:C663(*; "oPalleteButton1"; $_l_ButtonLeft; $_l_ButtonTop; $_l_ButtonRight; $_l_buttonBottom)
		OBJECT SET COORDINATES:C1248(*; "oPalleteButton1"; $_l_ButtonLeft; $_l_LastObjectBottom+10; $_l_ButtonRight; ($_l_LastObjectBottom+10)+$_l_buttonHeight)
		
	: ($_l_event=On Activate:K2:9)
		DB_SetInputFormMenu(Table:C252(->[DIARY:12]); "Diary_InNew")
		In_ButtChkDis(->vButtDisDry)
		
		If (Records in selection:C76([DIARY:12])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		
	: ((($_l_event=On Outside Call:K2:11) & (DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
		In_ButtCall("Diary_InLPA"; "Diary_InLPCan"; "Minor_DelSinEx"; ->[DIARY:12]; ->[DIARY:12]Diary_Code:3; "Diary"; "3 9"; "Diary_InB"; "DMaster"; "Diary_Sel"; ""; ->[IDENTIFIERS:16]; ->vButtDisDry)
	: ($_l_event=On Menu Selected:K2:14)
		If (Menu selected:C152#0)
			$_l_MenuSelected:=Menu selected:C152
			$_l_MenuBarSelected:=$_l_MenuSelected\65536
			$_t_MenuName:=Get menu title:C430($_l_MenuBarSelected)
			If ("History"=$_t_MenuName)
				If (Modified record:C314([DIARY:12]))
					Diary_PersPrior
					DB_SaveRecord(->[DIARY:12])
					AA_CheckFileUnlocked(->[DIARY:12]x_ID:50)
				End if 
				$_l_History:=Diary_HistFind(($_l_MenuSelected%65536)+1; ->SD_at_History)
				If ($_l_History>0)
					Case of 
						: (SD_at_History{$_l_History}="Company")
							SD3_t_DiaryRelatedRecord:=[DIARY:12]Company_Code:1
							SD_l_CompanionMenuTable:=Table:C252(->[COMPANIES:2])
						: (SD_at_History{$_l_History}="Contact")
							SD3_t_DiaryRelatedRecord:=[DIARY:12]Contact_Code:2
							SD_l_CompanionMenuTable:=Table:C252(->[CONTACTS:1])
							
						: (SD_at_History{$_l_History}="Job")
							SD3_t_DiaryRelatedRecord:=[DIARY:12]Job_Code:19
							SD_l_CompanionMenuTable:=Table:C252(->[JOBS:26])
							
						: (SD_at_History{$_l_History}="Order")
							SD3_t_DiaryRelatedRecord:=[DIARY:12]Order_Code:26
							SD_l_CompanionMenuTable:=Table:C252(->[ORDERS:24])
							
							
						: (SD_at_History{$_l_History}="Call")
							SD3_t_DiaryRelatedRecord:=[DIARY:12]Call_Code:25
							SD_l_CompanionMenuTable:=Table:C252(->[SERVICE_CALLS:20])
						: (SD_at_History{$_l_History}="Comp & Action")
							SD3_t_DiaryRelatedRecord:=[DIARY:12]Company_Code:1
							SD_l_CompanionMenuTable:=Table:C252(->[COMPANIES:2])
							SD_t_ProcRelationActionID:=[DIARY:12]Action_Code:9
							
						: (SD_at_History{$_l_History}="Cont & Action")
							SD3_t_DiaryRelatedRecord:=[DIARY:12]Company_Code:1
							SD_l_CompanionMenuTable:=Table:C252(->[CONTACTS:1])
							SD_t_ProcRelationActionID:=[DIARY:12]Action_Code:9
						: (SD_at_History{$_l_History}="Job & Action")
							SD3_t_DiaryRelatedRecord:=[DIARY:12]Job_Code:19
							SD_l_CompanionMenuTable:=Table:C252(->[JOBS:26])
							SD_t_ProcRelationActionID:=[DIARY:12]Action_Code:9
						: (SD_at_History{$_l_History}="Order & Action")
							
							SD3_t_DiaryRelatedRecord:=[DIARY:12]Order_Code:26
							
							SD_l_CompanionMenuTable:=Table:C252(->[ORDERS:24])
							SD_t_ProcRelationActionID:=[DIARY:12]Action_Code:9
							
						: (SD_at_History{$_l_History}="Call & Action")
							
							SD3_t_DiaryRelatedRecord:=[DIARY:12]Call_Code:25
							SD_l_CompanionMenuTable:=Table:C252(->[SERVICE_CALLS:20])
							SD_t_ProcRelationActionID:=[DIARY:12]Action_Code:9
						: (SD_at_History{$_l_History}="Document")
							
							SD3_t_DiaryRelatedRecord:=[DIARY:12]Document_Code:15
							SD_l_CompanionMenuTable:=Table:C252(->[DOCUMENTS:7])
							SD_t_ProcRelationActionID:=[DIARY:12]Action_Code:9
					End case 
					If (SD3_t_DiaryRelatedRecord#"") & (SD_l_CompanionMenuTable>0)
						<>DB_bo_AutoOut:=True:C214
						<>AutoFind:=True:C214
						<>AutoProc:=Record number:C243([DIARY:12])
						<>AutoFile:="Diary"
						ZDiary_Mod
					Else 
						//◊aHistory:=1
					End if 
				End if 
			End if 
		End if 
		DB_SetInputFormMenu(Table:C252(->[DIARY:12]); "Diary_InNew")
		In_ButtChkDis(->vButtDisDry)
		If (Records in selection:C76([DIARY:12])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
	: ($_l_event=On Data Change:K2:15)
		Diary_InD
	: ($_l_event=On Outside Call:K2:11)
		Gen_OutsideCoCo(->[DIARY:12]Company_Code:1; ->[DIARY:12]Contact_Code:2)
		If ((<>OrderCode#"") & ([DIARY:12]Order_Code:26=""))
			[DIARY:12]Order_Code:26:=<>OrderCode
		End if 
		If ((<>JobCode#"") & ([DIARY:12]Job_Code:19=""))
			[DIARY:12]Job_Code:19:=<>JobCode
		End if 
		If ((<>CallCode#"") & ([DIARY:12]Call_Code:25=""))
			[DIARY:12]Call_Code:25:=<>CallCode
		End if 
		
		
		If (SD3_l_DiaryActionNum>0)
			Case of 
				: (SD3_l_DiaryActionNum=11)
					SD_ptr_Date1->:=SD_D_Date
				: (SD3_l_DiaryActionNum=12)
					SD_ptr_Date2->:=SD_D_Date
			End case 
			SD3_l_DiaryActionNum:=0
			SD_D_Date:=!00-00-00!
		End if 
		
		Diary_InLPM
		<>AutoProc:=0
	: ($_l_event=On Resize:K2:27)
		If (Current form window:C827=Frontmost window:C447)
			SD_SetSplitter(->SD_l_DescriptionSplitter; 1)
		End if 
		OBJECT GET COORDINATES:C663(*; "oRelatedRecordID"; $_l_LastObjectLeft; $_l_LastObjectTop; $_l_LastObjectRight; $_l_LastObjectBottom)
		OBJECT GET COORDINATES:C663(*; "oPalleteButton27"; $_l_ButtonLeft; $_l_ButtonTop; $_l_ButtonRight; $_l_buttonBottom)
		$_l_buttonHeight:=$_l_buttonBottom-$_l_buttonTop
		OBJECT SET COORDINATES:C1248(*; "oPalleteButton27"; $_l_ButtonLeft; $_l_LastObjectBottom+10; $_l_ButtonRight; ($_l_LastObjectBottom+10)+$_l_buttonHeight)
		OBJECT GET COORDINATES:C663(*; "oPalleteButton25"; $_l_ButtonLeft; $_l_ButtonTop; $_l_ButtonRight; $_l_buttonBottom)
		OBJECT SET COORDINATES:C1248(*; "oPalleteButton25"; $_l_ButtonLeft; $_l_LastObjectBottom+10; $_l_ButtonRight; ($_l_LastObjectBottom+10)+$_l_buttonHeight)
		OBJECT GET COORDINATES:C663(*; "oPalleteButton23"; $_l_ButtonLeft; $_l_ButtonTop; $_l_ButtonRight; $_l_buttonBottom)
		OBJECT SET COORDINATES:C1248(*; "oPalleteButton23"; $_l_ButtonLeft; $_l_LastObjectBottom+10; $_l_ButtonRight; ($_l_LastObjectBottom+10)+$_l_buttonHeight)
		OBJECT GET COORDINATES:C663(*; "oPalleteButton21"; $_l_ButtonLeft; $_l_ButtonTop; $_l_ButtonRight; $_l_buttonBottom)
		OBJECT SET COORDINATES:C1248(*; "oPalleteButton21"; $_l_ButtonLeft; $_l_LastObjectBottom+10; $_l_ButtonRight; ($_l_LastObjectBottom+10)+$_l_buttonHeight)
		OBJECT GET COORDINATES:C663(*; "oPalleteButton29"; $_l_ButtonLeft; $_l_ButtonTop; $_l_ButtonRight; $_l_buttonBottom)
		OBJECT SET COORDINATES:C1248(*; "oPalleteButton29"; $_l_ButtonLeft; $_l_LastObjectBottom+10; $_l_ButtonRight; ($_l_LastObjectBottom+10)+$_l_buttonHeight)
		OBJECT GET COORDINATES:C663(*; "oPalleteButton15"; $_l_ButtonLeft; $_l_ButtonTop; $_l_ButtonRight; $_l_buttonBottom)
		OBJECT SET COORDINATES:C1248(*; "oPalleteButton15"; $_l_ButtonLeft; $_l_LastObjectBottom+10; $_l_ButtonRight; ($_l_LastObjectBottom+10)+$_l_buttonHeight)
		
		OBJECT GET COORDINATES:C663(*; "oPalleteButton4"; $_l_ButtonLeft; $_l_ButtonTop; $_l_ButtonRight; $_l_buttonBottom)
		OBJECT SET COORDINATES:C1248(*; "oPalleteButton4"; $_l_ButtonLeft; $_l_LastObjectBottom+10; $_l_ButtonRight; ($_l_LastObjectBottom+10)+$_l_buttonHeight)
		OBJECT GET COORDINATES:C663(*; "oPalleteButton3"; $_l_ButtonLeft; $_l_ButtonTop; $_l_ButtonRight; $_l_buttonBottom)
		OBJECT SET COORDINATES:C1248(*; "oPalleteButton3"; $_l_ButtonLeft; $_l_LastObjectBottom+10; $_l_ButtonRight; ($_l_LastObjectBottom+10)+$_l_buttonHeight)
		OBJECT GET COORDINATES:C663(*; "oPalleteButton2"; $_l_ButtonLeft; $_l_ButtonTop; $_l_ButtonRight; $_l_buttonBottom)
		OBJECT SET COORDINATES:C1248(*; "oPalleteButton2"; $_l_ButtonLeft; $_l_LastObjectBottom+10; $_l_ButtonRight; ($_l_LastObjectBottom+10)+$_l_buttonHeight)
		OBJECT GET COORDINATES:C663(*; "oPalleteButton1"; $_l_ButtonLeft; $_l_ButtonTop; $_l_ButtonRight; $_l_buttonBottom)
		OBJECT SET COORDINATES:C1248(*; "oPalleteButton1"; $_l_ButtonLeft; $_l_LastObjectBottom+10; $_l_ButtonRight; ($_l_LastObjectBottom+10)+$_l_buttonHeight)
		
		
	: ($_l_event=On Clicked:K2:4)
		Case of 
			: (PAL_BUTTON#"")
				$_t_PalletButtonName:=PAL_BUTTON
				PAL_BUTTON:=""
				DB_HandleInputFormButtons($_t_PalletButtonName)
				PAL_bo_ButtonSubFunction:=False:C215
			: (BAR_t_Button#"")
				$_l_ButtonNumber:=Num:C11(BAR_t_Button)
				If ($_l_ButtonNumber>1)
					ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_ButtonNumber-1}
					$_l_ModuleRow:=Find in array:C230(MOD_al_ModuleBarNum; ModuleNumber)
					DB_SetBrowserBarSelection($_l_ModuleRow; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
					DB_SetInputFormMenu(Table:C252(->[DIARY:12]); "Diary_InNew")
					
				End if 
				BAR_t_Button:=""
				
		End case 
		
End case 
ERR_MethodTrackerReturn("FM:Diary_InNEW"; $_t_oldMethodName)
