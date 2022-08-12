If (False:C215)
	//Table Form Method Name: Object Name:      [PERSONNEL].Diary_ViewAG
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/10/2012 10:31
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD_LB_Items;0)
	//ARRAY DATE(SD_ad_TaskDate;0)
	//ARRAY DATE(SD3_ad_CacheEndDateRange;0)
	//ARRAY DATE(SD3_ad_CacheStartDateRange;0)
	//ARRAY INTEGER(SD_ai_ActionCodes;0)
	//ARRAY INTEGER(SD_ai_ActionCodesOSW;0)
	//ARRAY INTEGER(SD_ai_ResultCodes;0)
	//ARRAY LONGINT(<>SD_al_CombineGroupDiaries;0)
	//ARRAY LONGINT(<>SD_al_CombinePersonDiaries;0)
	//ARRAY LONGINT(<>SD_al_CombineResourceDiaries;0)
	ARRAY LONGINT:C221($_al_PriorityNumRows; 0)
	//ARRAY LONGINT(SD_al_aAddAction;0)
	//ARRAY LONGINT(SD_al_ActionCodesOST;0)
	//ARRAY LONGINT(SD_al_ActionTime;0)
	//ARRAY LONGINT(SD_al_MenuCall;0)
	//ARRAY LONGINT(SD_al_PersonClass;0)
	//ARRAY LONGINT(SD_al_PriorityNUM;0)
	//ARRAY LONGINT(SD3_al_CacheCurrentPage;0)
	//ARRAY POINTER(CONT_aPtr_LBSetup;0)
	//ARRAY POINTER(SD_aptr_RelationFields;0)
	//ARRAY TEXT(<>SD3_at_HistoryRelation;0)
	//ARRAY TEXT(SD_at_ActionCodes;0)
	//ARRAY TEXT(SD_at_ActioncodesOST;0)
	//ARRAY TEXT(SD_at_AddAction;0)
	//ARRAY TEXT(SD_at_Arrayrelations;0)
	//ARRAY TEXT(SD_at_DefaultTimeSettings;0)
	//ARRAY TEXT(SD_at_DiaryActionNames;0)
	//ARRAY TEXT(SD_at_DiaryOwners;0)
	//ARRAY TEXT(SD_at_DiaryViewOptions;0)
	//ARRAY TEXT(SD_at_DIOPersonnelNAME;0)
	//ARRAY TEXT(SD_at_Events;0)
	//ARRAY TEXT(SD_at_OpenDocument;0)
	//ARRAY TEXT(SD_at_PersonInitials;0)
	//ARRAY TEXT(SD_at_Query;0)
	//ARRAY TEXT(SD_at_RelationTypes;0)
	//ARRAY TEXT(SD_at_ResultCodes;0)
	//ARRAY TEXT(SD_at_ResultNames;0)
	//ARRAY TEXT(SD_at_ToDoList;0)
	//ARRAY TEXT(SD_at_ToDoList2;0)
	//ARRAY TEXT(SD3_at_CacheEndPerson;0)
	//ARRAY TEXT(SD3_at_TimeFrame;0)
	//ARRAY TEXT(WS_at_DiaryVIewTab;0)
	//ARRAY TEXT(WT_at_DiaryMonthNames;0)
	//ARRAY TEXT(WT_at_DiaryYearNames;0)
	C_BOOLEAN:C305(<>AutoFind; <>DB_bo_AutoOut; <>FloatingCALDisplayed; <>MOD_bo_ModuleSelected; $_bo_ProcessVisible; DB_bo_DuringOutsideCall; DB_bo_NoLoad; SD_bo_AddingDiaryRecord; SD_bo_AgendaEnabled; SD_bo_AgendaSetup; SD_bo_FormLoaded)
	C_BOOLEAN:C305(SD_bo_NoAgendaEvent; SD_bo_RecordModified; SD_bo_ResultsDialog; SD3_bo_FloatingDiarydisplayed)
	C_DATE:C307(SD_D_CurrentViewDate; SD_D_CurrentViewDateOLD; SD_d_DiaryViewDate; SD_d_EndDate; SD_d_EndDateOLD; SD_d_GetDate; SD_d_StartDate; SD_d_StartDateOLD; vSD_QuyDiaryDate)
	C_LONGINT:C283(<>AutoProc; <>FloatingCalender; <>MenuProc; $_l_ButtonPressed; $_l_CountListItems; $_l_CountPersons; $_l_DayNumber; $_l_DiaryCompanionWIdth; $_l_DiaryInitialSIze; $_l_DiaryOwnerRow; $_l_DiaryRemindersProcess)
	C_LONGINT:C283($_l_event; $_l_EventElement; $_l_HistoryOption; $_l_Index; $_l_itemReference2; $_l_MAXTAB; $_l_ModuleExecute; $_l_NumberofDiaryOwners; $_l_ObjectBottom; $_l_ObjectBottom1; $_l_ObjectInset)
	C_LONGINT:C283($_l_ObjectLeft; $_l_ObjectLeft1; $_l_ObjectRight; $_l_ObjectRIght1; $_l_ObjectsWidth; $_l_ObjectTop; $_l_ObjectTop1; $_l_ObjectWidth2; $_l_ObjectWidth3; $_l_PersonnelIndex; $_l_PriorityNumRow)
	C_LONGINT:C283($_l_Process; $_l_ProcessState; $_l_ProcessTime; $_l_QueryElement; $_l_SelectedEventRow; $_l_SelectedListItem; $_l_SelectedMenu; $_l_SelectedMenuItem; $_l_SelectedQueryRow; $_l_SelectedToDoRow; $_l_SizeofArray)
	C_LONGINT:C283($_l_ToDoElement; $_l_windowBottom; $_l_WindowBottom2; $_l_WindowLeft; $_l_WindowLeft2; $_l_WIndowRight; $_l_WindowRight2; $_l_WIndowTop; $_l_WindowTop2; $itemRef1; $itemRef3)
	C_LONGINT:C283($lItemPos1; Badd_Person; bhl_GOTOTODAY2; CB_l_ScheduleFullPage; CB_ScheduleFUllPage2; DB_l_ButtonClickedFunction; HLQY_MONTHS; HLSUBREFNUM; HLSUBREFNUM_QUERY; HLSUBREFNUM_TASKS; HLSUBREFNUM_TODO)
	C_LONGINT:C283(iCancel; iOK; IPREPLYSELF; SD_HL_aDiaries; SD_l_AGENDA; SD_l_Companion; SD_l_CompanionMenuTable; SD_l_DescriptionSplitter; SD_l_DIaryPage; SD_l_DiaryPersonID; SD_l_EditingDiaryRecord)
	C_LONGINT:C283(SD_l_endSlider; SD_l_GenwindowBottom; SD_l_GenwindowLeft; SD_l_GenwindowRight; SD_l_GenwindowTop; SD_l_HLDayTime; SD_l_HLRelatedInfo; SD_l_IncAppointmentCo; SD_l_IncEventCo; SD_l_IncludeCompleted; SD_l_IncQueryCo)
	C_LONGINT:C283(SD_l_IncTodoCo; SD_l_priorityQuery; SD_l_RecNeedssaving; SD_l_RelationAdd; SD_l_StartSlider; SD_l_TabWidth; SD_l_TimeFrame; SD_l_TopSplitter; SD_l_YearMonthDayTime; SD3_l_CallActionNum; SD3_l_DiaryActionNum)
	C_LONGINT:C283(SD3_l_DiaryRelatedRecordTable; SD3_l_DiarySourceProcess; SD3_l_FloatingDiaryList; VPUBLICCHECK; vSD_SelDateLEFT; vSD_SelDateRIGHT; WS_l_SELECTEDDIARYVIEWTAB; WS_l_SELECTEDDIARYVIEWTABOLD; WT_CURRMONTH; xNext)
	C_POINTER:C301(SD_ptr_Date1; SD_ptr_Date2; SD_ptr_RelationAdd)
	C_TEXT:C284(<>AutoFile; <>HLAPPAREATEXT; <>HLEVENTAREATEXT; <>HLTASKAREATEXT; <>MOD_t_ModuleExecute; <>PER_t_CurrentUserInitials; $_t_ApplicationVersion; $_t_DiaryCode; $_t_HistoryRelation; $_t_ItemText1; $_t_ItemText2)
	C_TEXT:C284($_t_ItemText3; $_t_ModuleExecute; $_t_oldMethodName; $_t_processName; $_t_SelectedMenuItemName; HLSUBITEMText; SD_at_TimeFrame; SD_t_AgendaEndTime; SD_t_AgendaStartTime; SD_T_CurrentDiary; SD_t_CurrentDiaryInitials)
	C_TEXT:C284(SD_t_CurrentDiaryOwnerName; SD_t_DayindicatorVarName; SD_t_DiaryCode; SD_t_DiaryDefaultUser; SD_t_JobName; SD_t_Periodstr; SD_t_PeriodStrOLD; SD_t_priorityText; SD_t_ProcRelationActionID; SD_t_RelationAdd; SD_t_RelationCode)
	C_TEXT:C284(SD_t_TimeSetting; SD_t_TodoText; SD_t_Year; SD3_t_DiaryRelatedRecord; SD3_t_DiaryRelatedRecordCode; vButtDisDry; vButtDisO; vSD_QuyDiaryPerson; VSrchRequest; WIN_t_CurrentInputForm; WT_MonthInd)
	C_TIME:C306($_ti_LastTime; SD_ti_CurrentviewEndTime; SD_ti_CurrentviewStartTime; vTime)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [PERSONNEL].Diary_ViewAG"; Form event code:C388)
$_l_event:=Form event code:C388




Case of 
	: ($_l_event=On Resize:K2:27)
		
		$_t_ApplicationVersion:=Application version:C493
		//max screen width= 600
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WIndowRight; $_l_windowBottom)
		If ($_l_WIndowRight-$_l_WindowLeft<745) | (False:C215)  //NG September 2004
			//NG because the form width in the properties has to have a minimum of 586
			//or the screen draw puts everything in the wrong place, and because if this form gets narrower the 745
			//i need to put this piece of code
			
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_WindowTop; $_l_WindowLeft+745; $_l_windowBottom)
		End if 
		If (Num:C11($_t_ApplicationVersion)<670)
			If ($_l_WIndowRight-$_l_WindowLeft>1000)
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_WindowTop; $_l_WindowLeft+1000; $_l_windowBottom)
			End if 
		Else 
			If ($_l_WIndowRight-$_l_WindowLeft>Screen width:C187)
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_WindowTop; Screen width:C187-10; $_l_windowBottom)
			End if 
		End if 
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WIndowRight; $_l_windowBottom)
		If ($_l_windowBottom>Screen height:C188)
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_WindowTop; $_l_WIndowRight; Screen height:C188-10)
		End if 
		If ((CB_l_ScheduleFullPage=0))
			SD_SETViews
			SD_SetSplitter(->SD_l_DescriptionSplitter; 1)
		Else 
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WIndowRight; $_l_windowBottom)
			$_l_ObjectsWidth:=$_l_WIndowRight-$_l_WindowLeft
			OBJECT GET COORDINATES:C663(WS_at_DiaryVIewTab; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRIght; $_l_ObjectBottom)
			$_l_ObjectWidth3:=($_l_ObjectRIght-$_l_ObjectLeft)
			OBJECT MOVE:C664(WS_at_DiaryVIewTab; 3; $_l_ObjectTop; $_l_ObjectsWidth-3; $_l_ObjectBottom; *)
			SD_bo_NoAgendaEvent:=True:C214
			OBJECT MOVE:C664(SD_t_AgendaStartTime; 3; $_l_ObjectBottom+1; ($_l_ObjectsWidth/2)-2; $_l_ObjectBottom+1+(12); *)
			OBJECT MOVE:C664(SD_t_AgendaEndTime; ($_l_ObjectsWidth-($_l_ObjectsWidth/2))+2; $_l_ObjectBottom+1; $_l_ObjectsWidth-3; $_l_ObjectBottom+1+(12); *)
			$_l_ObjectBottom:=$_l_ObjectBottom+12
			OBJECT MOVE:C664(SD_l_StartSlider; 3; $_l_ObjectBottom+1; ($_l_ObjectsWidth/2)-2; $_l_ObjectBottom+1+(12); *)
			OBJECT MOVE:C664(SD_l_endSlider; ($_l_ObjectsWidth-($_l_ObjectsWidth/2))-3; $_l_ObjectBottom+1; $_l_ObjectsWidth-3; $_l_ObjectBottom+1+(12); *)
			$_l_ObjectBottom:=$_l_ObjectBottom+20
			SD_bo_NoAgendaEvent:=True:C214
			
			If (Size of array:C274(SD_ad_TaskDate)=0)
				OBJECT MOVE:C664(*; "oAGENDAVIEW2"; 3; ($_l_ObjectBottom+1); (($_l_ObjectsWidth)-3); (($_l_windowBottom-$_l_WindowTop)-10); *)
				//SET VISIBLE(SD_l_AreaListEvents2;False)
				OBJECT SET VISIBLE:C603(SD_at_ToDoList2; False:C215)
			Else 
				$_l_SizeofArray:=Size of array:C274(SD_ad_TaskDate)*18
				If ($_l_SizeofArray<100)
					$_l_SizeofArray:=100
				End if 
				If ($_l_SizeofArray>(($_l_windowBottom-$_l_WindowTop)/2))
					//IT WILL TAKE UP MORE THAN HALF THE PAGE
					$_l_SizeofArray:=($_l_windowBottom-$_l_WindowTop)/2
				End if 
				//SET VISIBLE(SD_l_AreaListEvents2;True)
				OBJECT SET VISIBLE:C603(SD_at_ToDoList2; True:C214)
				
				OBJECT MOVE:C664(*; "oAGENDAVIEW2"; 3; ($_l_ObjectBottom+1); (($_l_ObjectsWidth)-3); (($_l_windowBottom-$_l_WindowTop)-($_l_SizeofArray+20)); *)
				OBJECT GET COORDINATES:C663(*; "oAGENDAVIEW2"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRIght; $_l_ObjectBottom)
				//MOVE OBJECT(*;"oAreaListView2";
				OBJECT MOVE:C664(SD_at_ToDoList2; 3; ($_l_ObjectBottom+20); ($_l_ObjectsWidth)-3; (($_l_windowBottom-$_l_WindowTop)-2); *)
				
				
			End if 
			SD_SetViews_2
			SD_bo_NoAgendaEvent:=False:C215
		End if 
		
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WIndowRight; $_l_windowBottom)
		$_l_ObjectsWidth:=$_l_WIndowRight-$_l_WindowLeft
		//Reduce this window by 340
		If ($_l_ObjectsWidth>746) | (True:C214)
			//SET WINDOW RECT($_l_ObjectLeft;$_l_WindowTop;$_l_ObjectLeft+589;$_l_ObjectBottom)
			OBJECT GET COORDINATES:C663(*; "oButtonStrap"; $_l_ObjectLeft1; $_l_ObjectTop1; $_l_ObjectRIght1; $_l_ObjectBottom1)
			
			OBJECT MOVE:C664(*; "oButtonStrap"; $_l_ObjectLeft1; $_l_ObjectTop1; ($_l_ObjectsWidth-3); $_l_ObjectBottom1; *)
			//``
			OBJECT GET COORDINATES:C663(*; "oDateNavigatorBackground"; $_l_ObjectLeft1; $_l_ObjectTop1; $_l_ObjectRIght1; $_l_ObjectBottom1)
			$_l_ObjectWidth2:=$_l_ObjectRIght1-$_l_ObjectLeft1
			$_l_ObjectInset:=10
			$_l_ObjectLeft1:=(($_l_ObjectsWidth)-$_l_ObjectInset)-$_l_ObjectWidth2
			OBJECT MOVE:C664(*; "oDateNavigatorBackground"; $_l_ObjectLeft1; $_l_ObjectTop1; $_l_ObjectLeft1+$_l_ObjectWidth2; $_l_ObjectBottom1; *)
			
			OBJECT GET COORDINATES:C663(*; "oPicGotoToday"; $_l_ObjectLeft1; $_l_ObjectTop1; $_l_ObjectRIght1; $_l_ObjectBottom1)
			$_l_ObjectWidth2:=$_l_ObjectRIght1-$_l_ObjectLeft1
			$_l_ObjectInset:=10+2
			$_l_ObjectLeft1:=(($_l_ObjectsWidth)-$_l_ObjectInset)-$_l_ObjectWidth2
			OBJECT MOVE:C664(*; "oPicGotoToday"; $_l_ObjectLeft1; $_l_ObjectTop1; $_l_ObjectLeft1+$_l_ObjectWidth2; $_l_ObjectBottom1; *)
			
			OBJECT GET COORDINATES:C663(bhl_GOTOTODAY2; $_l_ObjectLeft1; $_l_ObjectTop1; $_l_ObjectRIght1; $_l_ObjectBottom1)
			$_l_ObjectWidth2:=$_l_ObjectRIght1-$_l_ObjectLeft1
			$_l_ObjectInset:=10+2
			$_l_ObjectLeft1:=(($_l_ObjectsWidth)-$_l_ObjectInset)-$_l_ObjectWidth2
			//```
			OBJECT MOVE:C664(bhl_GOTOTODAY2; $_l_ObjectLeft1; $_l_ObjectTop1; $_l_ObjectLeft1+$_l_ObjectWidth2; $_l_ObjectBottom1; *)
			
			OBJECT GET COORDINATES:C663(*; "oGotoNextDay"; $_l_ObjectLeft1; $_l_ObjectTop1; $_l_ObjectRIght1; $_l_ObjectBottom1)
			$_l_ObjectWidth2:=$_l_ObjectRIght1-$_l_ObjectLeft1
			$_l_ObjectInset:=10+2+16+1
			$_l_ObjectLeft1:=(($_l_ObjectsWidth)-$_l_ObjectInset)-$_l_ObjectWidth2
			OBJECT MOVE:C664(*; "oGotoNextDay"; $_l_ObjectLeft1; $_l_ObjectTop1; $_l_ObjectLeft1+$_l_ObjectWidth2; $_l_ObjectBottom1; *)
			
			OBJECT GET COORDINATES:C663(vSD_SelDateRIGHT; $_l_ObjectLeft1; $_l_ObjectTop1; $_l_ObjectRIght1; $_l_ObjectBottom1)
			$_l_ObjectWidth2:=$_l_ObjectRIght1-$_l_ObjectLeft1
			$_l_ObjectInset:=10+2+16+1
			$_l_ObjectLeft1:=(($_l_ObjectsWidth)-$_l_ObjectInset)-$_l_ObjectWidth2
			OBJECT MOVE:C664(vSD_SelDateRIGHT; $_l_ObjectLeft1; $_l_ObjectTop1; $_l_ObjectLeft1+$_l_ObjectWidth2; $_l_ObjectBottom1; *)
			//``````
			
			OBJECT GET COORDINATES:C663(SD_D_CurrentViewDate; $_l_ObjectLeft1; $_l_ObjectTop1; $_l_ObjectRIght1; $_l_ObjectBottom1)
			$_l_ObjectWidth2:=$_l_ObjectRIght1-$_l_ObjectLeft1
			$_l_ObjectInset:=10+2+16+1+16+1
			$_l_ObjectLeft1:=(($_l_ObjectsWidth)-$_l_ObjectInset)-$_l_ObjectWidth2
			OBJECT MOVE:C664(SD_D_CurrentViewDate; $_l_ObjectLeft1; $_l_ObjectTop1; $_l_ObjectLeft1+$_l_ObjectWidth2; $_l_ObjectBottom1; *)
			//SD_t_Periodstr
			OBJECT GET COORDINATES:C663(SD_t_Periodstr; $_l_ObjectLeft1; $_l_ObjectTop1; $_l_ObjectRIght1; $_l_ObjectBottom1)
			$_l_ObjectWidth2:=$_l_ObjectRIght1-$_l_ObjectLeft1
			$_l_ObjectInset:=10+2+16+1+16+1
			$_l_ObjectLeft1:=(($_l_ObjectsWidth)-$_l_ObjectInset)-$_l_ObjectWidth2
			OBJECT MOVE:C664(SD_t_Periodstr; $_l_ObjectLeft1; $_l_ObjectTop1; $_l_ObjectLeft1+$_l_ObjectWidth2; $_l_ObjectBottom1; *)
			
			//```
			
			
			OBJECT GET COORDINATES:C663(*; "oGotoPreviousDay"; $_l_ObjectLeft1; $_l_ObjectTop1; $_l_ObjectRIght1; $_l_ObjectBottom1)
			$_l_ObjectWidth2:=$_l_ObjectRIght1-$_l_ObjectLeft1
			$_l_ObjectInset:=10+2+16+1+121+1
			$_l_ObjectLeft1:=(($_l_ObjectsWidth)-$_l_ObjectInset)-$_l_ObjectWidth2
			OBJECT MOVE:C664(*; "oGotoPreviousDay"; $_l_ObjectLeft1; $_l_ObjectTop1; $_l_ObjectLeft1+$_l_ObjectWidth2; $_l_ObjectBottom1; *)
			
			OBJECT GET COORDINATES:C663(vSD_SelDateLEFT; $_l_ObjectLeft1; $_l_ObjectTop1; $_l_ObjectRIght1; $_l_ObjectBottom1)
			$_l_ObjectWidth2:=$_l_ObjectRIght1-$_l_ObjectLeft1
			$_l_ObjectInset:=10+2+16+1+121+1
			$_l_ObjectLeft1:=(($_l_ObjectsWidth)-$_l_ObjectInset)-$_l_ObjectWidth2
			OBJECT MOVE:C664(vSD_SelDateLEFT; $_l_ObjectLeft1; $_l_ObjectTop1; $_l_ObjectLeft1+$_l_ObjectWidth2; $_l_ObjectBottom1; *)
			
			//```
			OBJECT GET COORDINATES:C663(*; "oGotoPreviousDay"; $_l_ObjectLeft1; $_l_ObjectTop1; $_l_ObjectRIght1; $_l_ObjectBottom1)
			$_l_ObjectWidth2:=$_l_ObjectRIght1-$_l_ObjectLeft1
			$_l_ObjectInset:=10+2+16+1+121+1+16+1
			$_l_ObjectLeft1:=(($_l_ObjectsWidth)-$_l_ObjectInset)-$_l_ObjectWidth2
			OBJECT MOVE:C664(*; "oGotoPreviousDay"; $_l_ObjectLeft1; $_l_ObjectTop1; $_l_ObjectLeft1+$_l_ObjectWidth2; $_l_ObjectBottom1; *)
			
			OBJECT GET COORDINATES:C663(vSD_SelDateLEFT; $_l_ObjectLeft1; $_l_ObjectTop1; $_l_ObjectRIght1; $_l_ObjectBottom1)
			$_l_ObjectWidth2:=$_l_ObjectRIght1-$_l_ObjectLeft1
			$_l_ObjectInset:=10+2+16+1+121+1+16+1
			$_l_ObjectLeft1:=(($_l_ObjectsWidth)-$_l_ObjectInset)-$_l_ObjectWidth2
			OBJECT MOVE:C664(vSD_SelDateLEFT; $_l_ObjectLeft1; $_l_ObjectTop1; $_l_ObjectLeft1+$_l_ObjectWidth2; $_l_ObjectBottom1; *)
			OBJECT GET COORDINATES:C663(*; "oDiaryCalendar"; $_l_ObjectLeft1; $_l_ObjectTop1; $_l_ObjectRIght1; $_l_ObjectBottom1)
			$_l_ObjectWidth2:=$_l_ObjectRIght1-$_l_ObjectLeft1
			$_l_ObjectInset:=10+2+16+1+121+1+16+1+16+1
			$_l_ObjectLeft1:=(($_l_ObjectsWidth)-$_l_ObjectInset)-$_l_ObjectWidth2
			OBJECT MOVE:C664(*; "oDiaryCalendar"; $_l_ObjectLeft1; $_l_ObjectTop1; $_l_ObjectLeft1+$_l_ObjectWidth2; $_l_ObjectBottom1; *)
			
			OBJECT GET COORDINATES:C663(SD_HL_aDiaries; $_l_ObjectLeft1; $_l_ObjectTop1; $_l_ObjectRIght1; $_l_ObjectBottom1)
			$_l_ObjectWidth2:=$_l_ObjectRIght1-$_l_ObjectLeft1
			$_l_ObjectInset:=10+2+16+1+121+1+16+1+16+1
			$_l_ObjectLeft1:=(($_l_ObjectsWidth)-$_l_ObjectInset)-$_l_ObjectWidth2
			OBJECT MOVE:C664(SD_HL_aDiaries; $_l_ObjectLeft1; $_l_ObjectTop1; $_l_ObjectLeft1+$_l_ObjectWidth2; $_l_ObjectBottom1; *)
			
		End if 
		
		
		
		
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		HIDE PROCESS:C324(Current process:C322)
		ARRAY POINTER:C280(CONT_aPtr_LBSetup; 0)
		
		ARRAY TEXT:C222(SD_at_Events; 0)
		ARRAY TEXT:C222(SD_at_ToDoList; 0)
		ARRAY TEXT:C222(SD_at_Query; 0)
		ARRAY LONGINT:C221(<>SD_al_CombineGroupDiaries; 0)
		ARRAY LONGINT:C221(<>SD_al_CombinePersonDiaries; 0)
		ARRAY LONGINT:C221(<>SD_al_CombineResourceDiaries; 0)
		ARRAY TEXT:C222(SD_at_Arrayrelations; 0)
		ARRAY LONGINT:C221(SD3_al_CacheCurrentPage; 0)
		ARRAY DATE:C224(SD3_ad_CacheStartDateRange; 0)
		ARRAY DATE:C224(SD3_ad_CacheEndDateRange; 0)
		ARRAY TEXT:C222(SD3_at_CacheEndPerson; 0)
		ARRAY TEXT:C222(SD3_at_TimeFrame; 0)
		SD_t_RelationAdd:=""
		SD_t_RelationCode:=""
		SD_l_RelationAdd:=0
		SD_bo_AgendaSetup:=False:C215
		SD_l_DIaryPage:=1
		xNext:=0
		WIN_t_CurrentInputForm:="Diary_ViewAG"
		
		INT_SetInput(Table:C252(->[PERSONNEL:11]); WIN_t_CurrentInputForm)
		LBi_ArrDefFill(->CONT_aPtr_LBSetup; ->SD_LB_Items; ->[DIARY:12]Diary_Code:3; ->[DIARY:12]Diary_Code:3; "411111000"; "Diary_InNEW"; 11; "Diary"; "Diary"; <>PER_t_CurrentUserInitials)  // 17/06/06 pb
		LBi_Prefs11(->CONT_aPtr_LBSetup)
		LBi_LoadSetup(->CONT_aPtr_LBSetup; "B")
		LB_SetFormat(->SD_LB_Items; 1; ""; 0; 0; 3)  // NOT SURE THIS IS CORRECT 20/06/06 pb
		
		SD_bo_AgendaEnabled:=SD_GetAgendaLicence
		
		$_l_EventElement:=0
		$_l_ToDoElement:=0
		$_l_QueryElement:=0
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
		
		
		ARRAY TEXT:C222(SD_at_DiaryViewOptions; 4)
		SD_at_DiaryViewOptions{1}:="All"
		SD_at_DiaryViewOptions{2}:="To Do"
		SD_at_DiaryViewOptions{3}:="Appointments"
		SD_at_DiaryViewOptions{1}:="Done"
		
		ARRAY LONGINT:C221(SD_al_aAddAction; 9)
		ARRAY TEXT:C222(SD_at_AddAction; 9)
		SD_at_AddAction{1}:="Add Event"
		SD_al_aAddAction{1}:=1
		SD_at_AddAction{2}:="Add to Schedule"
		SD_al_aAddAction{2}:=2
		SD_at_AddAction{3}:="Add Task"
		SD_al_aAddAction{3}:=3
		$_l_NumberofDiaryOwners:=3
		If (DB_GetModuleSettingByNUM(Module_JobCosting)>1)  //
			$_l_NumberofDiaryOwners:=$_l_NumberofDiaryOwners+1
			SD_al_aAddAction{$_l_NumberofDiaryOwners}:=9
			SD_at_AddAction{$_l_NumberofDiaryOwners}:="Time Sheet"
		End if 
		$_l_NumberofDiaryOwners:=$_l_NumberofDiaryOwners+1
		SD_at_AddAction{$_l_NumberofDiaryOwners}:="-"
		$_l_NumberofDiaryOwners:=$_l_NumberofDiaryOwners+1
		SD_at_AddAction{$_l_NumberofDiaryOwners}:="New Letter"
		SD_al_aAddAction{$_l_NumberofDiaryOwners}:=5
		$_l_NumberofDiaryOwners:=$_l_NumberofDiaryOwners+1
		SD_at_AddAction{$_l_NumberofDiaryOwners}:="New Email"
		SD_al_aAddAction{$_l_NumberofDiaryOwners}:=6
		$_l_NumberofDiaryOwners:=$_l_NumberofDiaryOwners+1
		SD_at_AddAction{$_l_NumberofDiaryOwners}:="New SMS"
		SD_al_aAddAction{$_l_NumberofDiaryOwners}:=7
		ARRAY LONGINT:C221(SD_al_aAddAction; $_l_NumberofDiaryOwners)
		ARRAY TEXT:C222(SD_at_AddAction; $_l_NumberofDiaryOwners)
		SD_at_AddAction:=0
		
		ARRAY TEXT:C222(SD_at_OpenDocument; 5)
		SD_at_OpenDocument{1}:="Open External Document"
		SD_at_OpenDocument{2}:="-"
		SD_at_OpenDocument{3}:="Open Letter"
		SD_at_OpenDocument{4}:="Open Email"
		SD_at_OpenDocument{5}:="Open SMS"
		
		
		
		ARRAY TEXT:C222(SD_at_RelationTypes; 7)
		ARRAY POINTER:C280(SD_aptr_RelationFields; 7)
		ARRAY LONGINT:C221(SD_al_MenuCall; 7)
		SD_l_IncTodoCo:=0
		SD_l_IncEventCo:=0
		SD_l_IncAppointmentCo:=0
		SD_l_IncQueryCo:=0
		$_l_NumberofDiaryOwners:=0
		If (DB_GetModuleSettingByNUM(Module_SalesOrders)>0)  //orders available"
			$_l_NumberofDiaryOwners:=$_l_NumberofDiaryOwners+1
			SD_at_RelationTypes{$_l_NumberofDiaryOwners}:="Order :"
			SD_aptr_RelationFields{$_l_NumberofDiaryOwners}:=->[DIARY:12]Order_Code:26
			SD_al_MenuCall{$_l_NumberofDiaryOwners}:=7
		End if 
		If (DB_GetModuleSettingByNUM(Module_Products)>0)  //products available
			$_l_NumberofDiaryOwners:=$_l_NumberofDiaryOwners+1
			SD_at_RelationTypes{$_l_NumberofDiaryOwners}:="Product:"
			SD_aptr_RelationFields{$_l_NumberofDiaryOwners}:=->[DIARY:12]Product_Code:13
			SD_al_MenuCall{$_l_NumberofDiaryOwners}:=5
		End if 
		
		
		If (DB_GetModuleSettingByNUM(Module_ServiceCentre)>0)  //service centre
			$_l_NumberofDiaryOwners:=$_l_NumberofDiaryOwners+1
			SD_at_RelationTypes{$_l_NumberofDiaryOwners}:="Call :"
			SD_aptr_RelationFields{$_l_NumberofDiaryOwners}:=->[DIARY:12]Call_Code:25
			SD_al_MenuCall{$_l_NumberofDiaryOwners}:=8
		End if 
		ARRAY TEXT:C222(SD_at_RelationTypes; $_l_NumberofDiaryOwners)
		ARRAY POINTER:C280(SD_aptr_RelationFields; $_l_NumberofDiaryOwners)
		ARRAY LONGINT:C221(SD_al_MenuCall; $_l_NumberofDiaryOwners)
		//````
		OBJECT SET VISIBLE:C603(SD_t_RelationAdd; False:C215)
		OBJECT SET VISIBLE:C603(*; "Pic_Relation"; False:C215)
		OBJECT SET VISIBLE:C603(SD_t_RelationCode; False:C215)
		OBJECT SET VISIBLE:C603(SD_at_RelationTypes; False:C215)
		
		OBJECT SET VISIBLE:C603(SD_at_DIOPersonnelNAME; False:C215)
		OBJECT SET VISIBLE:C603(Badd_Person; False:C215)
		
		
		<>HLEVENTAREATEXT:="Add EVENT"
		<>HLAPPAREATEXT:="Add APPOINTMENT"
		<>HLTASKAREATEXT:="Add TASK"
		Cache_Initialise("DMaster")
		
		
		$_t_ApplicationVersion:=Application version:C493  //max screen width= 600
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WIndowRight; $_l_windowBottom)
		If (Num:C11($_t_ApplicationVersion)<670)
			WS_AutoscreenSize(1; 410; 560)
		Else 
			WS_AutoscreenSize(1; 410; 1000)
		End if 
		DB_MenuAction("Document"; ""; 3; "")
		DB_MenuAction("Functions"; "Switch Access"; 3; "")
		//------------------------------------------------------------
		ARRAY TEXT:C222(WS_at_DiaryVIewTab; 3)  //build a listing of 'DIARY TAB' values (should be 4 when finished)
		WS_at_DiaryVIewTab{1}:=" Day  "
		WS_at_DiaryVIewTab{2}:="Week "
		WS_at_DiaryVIewTab{3}:="Month"
		//WS_at_DiaryVIewTab{4}:=""
		WS_at_DiaryVIewTab:=1
		WS_l_SELECTEDDIARYVIEWTAB:=1
		WS_l_SELECTEDDIARYVIEWTABOLD:=1
		//------------------------------------------------------------
		ARRAY TEXT:C222(WT_at_DiaryMonthNames; 12)  //build a listing of 'MONTH NAME' values
		WT_at_DiaryMonthNames{1}:="January"
		WT_at_DiaryMonthNames{2}:="February"
		WT_at_DiaryMonthNames{3}:="March"
		WT_at_DiaryMonthNames{4}:="April"
		WT_at_DiaryMonthNames{5}:="May"
		WT_at_DiaryMonthNames{6}:="June"
		WT_at_DiaryMonthNames{7}:="July"
		WT_at_DiaryMonthNames{8}:="August"
		WT_at_DiaryMonthNames{9}:="September"
		WT_at_DiaryMonthNames{10}:="October"
		WT_at_DiaryMonthNames{11}:="November"
		WT_at_DiaryMonthNames{12}:="December"
		
		
		WT_CurrMonth:=Month of:C24(SD_D_CurrentviewDate)
		WT_MonthInd:=Uppercase:C13(WT_at_DiaryMonthNames{WT_CurrMonth})
		//------------------------------------------------------------
		ARRAY TEXT:C222(WT_at_DiaryYearNames; 10)  //build a listing of 'YEAR' values
		WT_at_DiaryYearNames{1}:=String:C10(Year of:C25(Current date:C33)-4)
		WT_at_DiaryYearNames{2}:=String:C10(Year of:C25(Current date:C33)-3)
		WT_at_DiaryYearNames{3}:=String:C10(Year of:C25(Current date:C33)-2)
		WT_at_DiaryYearNames{4}:=String:C10(Year of:C25(Current date:C33)-1)
		WT_at_DiaryYearNames{5}:=String:C10(Year of:C25(Current date:C33))
		WT_at_DiaryYearNames{6}:=String:C10(Year of:C25(Current date:C33)+1)
		WT_at_DiaryYearNames{7}:=String:C10(Year of:C25(Current date:C33)+2)
		WT_at_DiaryYearNames{8}:=String:C10(Year of:C25(Current date:C33)+3)
		WT_at_DiaryYearNames{9}:=String:C10(Year of:C25(Current date:C33)+4)
		WT_at_DiaryYearNames{10}:=String:C10(Year of:C25(Current date:C33)+5)
		SD_t_Year:=WT_at_DiaryYearNames{5}
		//------------------------------------------------------------
		//WS_AutoscreenSize (2;445;561)
		//------------------------------------------------------------
		hlQY_MONTHS:=0
		
		Case of 
			: (vSD_QuyDiaryDate#!00-00-00!)
				SD_D_CurrentviewDate:=vSD_QuyDiaryDate
				SD_l_YearMonthDayTime:=GEN_TimeDateStamp(SD_D_CurrentviewDate; ?00:00:00?)
			Else 
				SD_D_CurrentviewDate:=Current date:C33
				SD_l_YearMonthDayTime:=GEN_TimeDateStamp(Current date:C33; Current time:C178)
				
		End case 
		SD_d_GetDate:=!00-00-00!
		vTime:=?00:00:00?
		Gen_TimeStamp2Date(SD_l_YearMonthDayTime; ->SD_d_GetDate; ->vTime)
		SD_t_Periodstr:=(MonthName(SD_d_GetDate))+" "+String:C10(Year of:C25(SD_d_GetDate))
		vPublicCheck:=0
		ARRAY TEXT:C222(SD_at_DiaryOwners; 3)
		ARRAY TEXT:C222(SD_at_PersonInitials; 3)
		ARRAY LONGINT:C221(SD_al_PersonClass; 3)
		
		
		QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=SD_t_DiaryDefaultUser)
		SD_l_DiaryPersonID:=[PERSONNEL:11]Personnel_ID:48
		$_l_CountPersons:=Size of array:C274(SD_at_PersonInitials)+1
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
		SD_IncludeExclude(SD_l_IncludeCompleted)
		
		
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
			OBJECT SET VISIBLE:C603(*; "oDiaryResultPicture"; False:C215)
		End if 
		
		ARRAY TEXT:C222(SD_at_DiaryOwners; 1)
		ARRAY TEXT:C222(SD_at_PersonInitials; 1)
		ARRAY LONGINT:C221(SD_al_PersonClass; 1)
		QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Global_Access:47=True:C214; *)
		QUERY:C277([PERSONNEL:11];  & ; [PERSONNEL:11]PersonDeleted:38#1)
		$_l_NumberofDiaryOwners:=Size of array:C274(SD_at_DiaryOwners)
		If (Records in selection:C76([PERSONNEL:11])>0)
			INSERT IN ARRAY:C227(SD_at_DiaryOwners; 9999; Records in selection:C76([PERSONNEL:11])+1)
			INSERT IN ARRAY:C227(SD_at_PersonInitials; 9999; Records in selection:C76([PERSONNEL:11])+1)
			INSERT IN ARRAY:C227(SD_al_PersonClass; 9999; Records in selection:C76([PERSONNEL:11])+1)
			$_l_DiaryInitialSIze:=Size of array:C274(SD_at_PersonInitials)+1
			$_l_NumberofDiaryOwners:=$_l_NumberofDiaryOwners+1
			SD_at_PersonInitials{$_l_NumberofDiaryOwners}:="-"  //insert a seperator here
			SD_at_DiaryOwners{$_l_NumberofDiaryOwners}:="-"  //and insert a seperator here
			ORDER BY:C49([PERSONNEL:11]; [PERSONNEL:11]Name:2; >)
			For ($_l_PersonnelIndex; 1; Records in selection:C76([PERSONNEL:11]))
				$_l_NumberofDiaryOwners:=$_l_NumberofDiaryOwners+1
				SD_at_PersonInitials{$_l_NumberofDiaryOwners}:=[PERSONNEL:11]Initials:1
				SD_at_DiaryOwners{$_l_NumberofDiaryOwners}:=[PERSONNEL:11]Name:2
				SD_al_PersonClass{$_l_NumberofDiaryOwners}:=3
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
				SD_t_CurrentDiaryInitials:=SD_t_DiaryDefaultUser
		End case 
		SD_t_CurrentDiaryOwnerName:=SD_at_DiaryOwners{$_l_DiaryOwnerRow}  //select the current user name
		Case of 
			: (SD_l_IncludeCompleted=1)
				SD_t_TodoText:=" -  All Items  "
			Else 
				SD_t_TodoText:=" -  To Do  "
		End case 
		If ((Size of array:C274(<>SD_al_CombineGroupDiaries)>0) | (Size of array:C274(<>SD_al_CombinePersonDiaries)>0) | (Size of array:C274(<>SD_al_CombineResourceDiaries)>0)) | (SD3_bo_FloatingDiarydisplayed)
			SD_T_CurrentDiary:="Multiple Diaries"+SD_t_TodoText+SD_t_priorityText
		Else 
			SD_T_CurrentDiary:=SD_t_CurrentDiaryOwnerName+" Diary "+SD_t_TodoText+SD_t_priorityText
		End if 
		
		$_l_DiaryRemindersProcess:=Process number:C372("Diary reminders "+SD_t_CurrentDiaryInitials)
		If ($_l_DiaryRemindersProcess=0)
			$_l_DiaryRemindersProcess:=New process:C317("SD_AlarmingEvents"; 256000; "Diary reminders "+SD_t_CurrentDiaryInitials; SD_l_DiaryPersonID; SD_t_DiaryDefaultUser)
			
		Else 
			If (Process state:C330($_l_DiaryRemindersProcess)<0)
				$_l_DiaryRemindersProcess:=New process:C317("SD_AlarmingEvents"; 256000; "Diary reminders "+SD_t_CurrentDiaryInitials; SD_l_DiaryPersonID; SD_t_DiaryDefaultUser)
				
			End if 
		End if 
		SELECT LIST ITEMS BY POSITION:C381(SD_l_HLRelatedInfo; 1)
		$_l_DayNumber:=Day number:C114(SD_D_CurrentviewDate)
		SD_TabManager
		Cache_Update(WS_l_SELECTEDDIARYVIEWTAB; SD_d_StartDate; SD_d_EndDate; SD_t_CurrentDiaryInitials; ->SD3_al_CacheCurrentPage; ->SD3_ad_CacheStartDateRange; ->SD3_ad_CacheEndDateRange; ->SD3_at_CacheEndPerson)
		SD_SetFieldsFalse
		SD_d_StartDate:=Current date:C33(*)
		SD_d_EndDate:=Current date:C33(*)
		
		SDiary_HL_QueryDiary(SD_t_CurrentDiaryInitials; SD_d_StartDate; SD_d_EndDate)
		SDiary_HL_DisplayDiary(SD_d_StartDate; SD_d_EndDate)
		
		//********************************************
		//********************************************
		SD_SetSplitter(->SD_l_DescriptionSplitter; 1)
		SD_bo_FormLoaded:=True:C214
		//
		WIN_t_CurrentInputForm:="Diary_ViewAG"
		INT_SetInput(Table:C252(->[PERSONNEL:11]); WIN_t_CurrentInputForm)
		//NG The following change is made to send this to the full page-this is an interim change till i make a new
		//``
		//$err:=AG REFRESH (SD_l_AGENDA;AG_False ) AGENDA OUT
		SD_bo_AgendaSetup:=False:C215
		CB_l_ScheduleFullPage:=1
		CB_ScheduleFUllPage2:=Int:C8(CB_l_ScheduleFullPage-1)
		If (CB_l_ScheduleFullPage>0)
			GET WINDOW RECT:C443($_l_WindowLeft2; $_l_WindowTop2; $_l_WindowRight2; $_l_WindowBottom2)
			OBJECT GET COORDINATES:C663(WS_at_DiaryVIewTab; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			SD_l_TabWidth:=$_l_ObjectRight-$_l_ObjectLeft
			OBJECT MOVE:C664(WS_at_DiaryVIewTab; $_l_ObjectLeft; $_l_ObjectTop; ($_l_WindowRight2-$_l_WindowLeft2)-10; $_l_ObjectBottom; *)
			
			//GOTO PAGE(4)
			OBJECT SET VISIBLE:C603(*; "oDiaryInputObject"+"@"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oDiaryPersonsPicture"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oDescriptionLabel"; False:C215)
			OBJECT SET VISIBLE:C603(*; "SD_l_oSplitter1"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oDocumentLabel"; False:C215)
			OBJECT SET VISIBLE:C603(*; "PICT_SMSR"; False:C215)
			OBJECT SET VISIBLE:C603(*; "PICT_EmailR"; False:C215)
			OBJECT SET VISIBLE:C603(*; "PICT_SnailMailR"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oResCodeLabel"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oDiaryResultPicture"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oResDescLabel"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oScriptLabel"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oUnitsLabel"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oStatusLabel"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oRelationLabel"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oDiaryCodeLabel"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oRelations"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oDiaryActionDesc"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oValueLabel"; False:C215)
			OBJECT SET VISIBLE:C603(SD_l_TopSplitter; False:C215)
			//``
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WIndowRight; $_l_windowBottom)
			OBJECT GET COORDINATES:C663(WS_at_DiaryVIewTab; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRIght; $_l_ObjectBottom)
			$_l_ObjectWidth3:=($_l_ObjectRIght-$_l_ObjectLeft)
			//MOVE OBJECT(CB_ScheduleFullPage2;($_l_ObjectRIght+10);($_l_ObjectTop+5);($_l_ObjectRIght+5+80);($_l_ObjectBottom-5);*)
			SD_bo_NoAgendaEvent:=True:C214
			OBJECT MOVE:C664(SD_t_AgendaStartTime; $_l_ObjectLeft; $_l_ObjectBottom+1; $_l_ObjectLeft+($_l_ObjectWidth3/2); $_l_ObjectBottom+1+(12); *)
			OBJECT MOVE:C664(SD_t_AgendaEndTime; $_l_ObjectRIght-($_l_ObjectWidth3/2); $_l_ObjectBottom+1; $_l_ObjectRIght; $_l_ObjectBottom+1+(12); *)
			$_l_ObjectBottom:=$_l_ObjectBottom+12
			OBJECT MOVE:C664(SD_l_StartSlider; $_l_ObjectLeft; $_l_ObjectBottom+1; $_l_ObjectLeft+($_l_ObjectWidth3/2); $_l_ObjectBottom+1+(12); *)
			OBJECT MOVE:C664(SD_l_endSlider; $_l_ObjectRIght-($_l_ObjectWidth3/2); $_l_ObjectBottom+1; $_l_ObjectRIght; $_l_ObjectBottom+1+(12); *)
			$_l_ObjectBottom:=$_l_ObjectBottom+20
			SD_bo_NoAgendaEvent:=True:C214
			
			If (Size of array:C274(SD_ad_TaskDate)=0)
				OBJECT MOVE:C664(*; "oAGENDAVIEW2"; $_l_ObjectLeft; ($_l_ObjectBottom+1); (($_l_WIndowRight-$_l_ObjectLeft)-3); (($_l_windowBottom-$_l_WindowTop)-10); *)
				//SET VISIBLE(SD_l_AreaListEvents2;False)
				OBJECT SET VISIBLE:C603(SD_at_ToDoList2; False:C215)
			Else 
				$_l_SizeofArray:=Size of array:C274(SD_ad_TaskDate)*18
				If ($_l_SizeofArray<100)
					$_l_SizeofArray:=100
				End if 
				If ($_l_SizeofArray>(($_l_windowBottom-$_l_WindowTop)/2))
					//IT WILL TAKE UP MORE THAN HALF THE PAGE
					$_l_SizeofArray:=($_l_windowBottom-$_l_WindowTop)/2
				End if 
				//SET VISIBLE(SD_l_AreaListEvents2;True)
				OBJECT MOVE:C664(*; "oAGENDAVIEW2"; $_l_ObjectLeft; ($_l_ObjectBottom+1); (($_l_WIndowRight-$_l_WIndowLeft)-3); (($_l_windowBottom-$_l_WindowTop)-($_l_SizeofArray+20)); *)
				OBJECT GET COORDINATES:C663(*; "oAGENDAVIEW2"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRIght; $_l_ObjectBottom)
				OBJECT MOVE:C664(SD_at_ToDoList2; $_l_ObjectLeft; ($_l_ObjectBottom+20); ($_l_ObjectRIght); (($_l_windowBottom-$_l_WindowTop)-2); *)
				
			End if 
			SD_bo_NoAgendaEvent:=False:C215
			
			//```
			SD_l_DIaryPage:=3
		Else 
			SD_l_DIaryPage:=1
			
		End if 
		SD_l_RecNeedssaving:=1
		If (WS_at_DiaryVIewTab>0)
			If (SD_RecordModified(->[DIARY:12]))
				SuperDiary_SaveChk
			End if 
			If (WS_l_SELECTEDDIARYVIEWTAB=4)
				//back from Page_4
				SD_d_StartDate:=SD_d_StartDateOLD
				SD_d_StartDateOLD:=!00-00-00!
				SD_d_EndDate:=SD_d_EndDateOLD
				SD_d_EndDateOLD:=!00-00-00!
				SD_t_PeriodStrOLD:=SD_t_Periodstr
				SD_t_Periodstr:=""
				SD_D_CurrentViewDate:=SD_D_CurrentViewDateOLD
				SD_D_CurrentViewDateOLD:=!00-00-00!
				WS_l_SELECTEDDIARYVIEWTAB:=WS_l_SELECTEDDIARYVIEWTABOLD
			Else 
				WS_l_SELECTEDDIARYVIEWTABOLD:=WS_at_DiaryVIewTab
			End if 
			//If (WS_at_DiaryVIewTab#Current form page)
			WT_hl_DiaryDETAIL3
			SD_SetFieldsFalse
			$_l_DayNumber:=Day number:C114(SD_D_CurrentviewDate)
			$_l_MAXTAB:=3
			SD_TabManager($_l_MAXTAB)
			Cache_Update(WS_l_SELECTEDDIARYVIEWTAB; SD_d_StartDate; SD_d_EndDate; SD_t_CurrentDiaryInitials; ->SD3_al_CacheCurrentPage; ->SD3_ad_CacheStartDateRange; ->SD3_ad_CacheEndDateRange; ->SD3_at_CacheEndPerson)
			
			SD_t_DayindicatorVarName:="vD"+String:C10(Day of:C23(SD_D_CurrentviewDate))
			//End if
			FORM GOTO PAGE:C247(3)
			
			SD_l_RecNeedssaving:=0
			WS_at_DiaryVIewTab:=2
			If (CB_l_ScheduleFullPage>0)
				GET WINDOW RECT:C443($_l_WindowLeft2; $_l_WindowTop2; $_l_WindowRight2; $_l_WindowBottom2)
				OBJECT GET COORDINATES:C663(WS_at_DiaryVIewTab; $_l_ObjectLeft; $_l_ObjectTop; $_l_objectRight; $_l_ObjectBottom)
				SD_l_TabWidth:=$_l_WIndowRight-$_l_ObjectLeft
				OBJECT MOVE:C664(WS_at_DiaryVIewTab; $_l_ObjectLeft; $_l_ObjectTop; ($_l_objectRight-$_l_ObjectLeft)-10; $_l_ObjectBottom; *)
				
				//GOTO PAGE(4)
				OBJECT SET VISIBLE:C603(*; "oDiaryInputObject"+"@"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oDiaryPersonsPicture"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oDescriptionLabel"; False:C215)
				OBJECT SET VISIBLE:C603(*; "SD_l_oSplitter1"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oDocumentLabel"; False:C215)
				OBJECT SET VISIBLE:C603(*; "PICT_SMSR"; False:C215)
				OBJECT SET VISIBLE:C603(*; "PICT_EmailR"; False:C215)
				OBJECT SET VISIBLE:C603(*; "PICT_SnailMailR"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oResCodeLabel"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oDiaryResultPicture"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oResDescLabel"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oScriptLabel"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oUnitsLabel"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oStatusLabel"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oRelationLabel"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oDiaryCodeLabel"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oRelations"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oDiaryActionDesc"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oValueLabel"; False:C215)
				OBJECT SET VISIBLE:C603(SD_l_TopSplitter; False:C215)
				SD_l_DIaryPage:=3
				SD_TabManager(4)
				Cache_Update(WS_l_SELECTEDDIARYVIEWTAB; SD_d_StartDate; SD_d_EndDate; SD_t_CurrentDiaryInitials; ->SD3_al_CacheCurrentPage; ->SD3_ad_CacheStartDateRange; ->SD3_ad_CacheEndDateRange; ->SD3_at_CacheEndPerson)
				
			End if 
			
		End if 
		//``
		
		If (SD_l_Companion=0)
			
			$_l_DiaryCompanionWIdth:=360
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_WIndowTop; $_l_WIndowRight; $_l_WindowBottom)
			$_l_ObjectsWidth:=$_l_WIndowRight-$_l_WindowLeft
			//Reduce this window by 340
			If ($_l_ObjectsWidth>746) | (True:C214)
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_WIndowTop; $_l_WindowLeft+589; $_l_WindowBottom)
				$_l_WIndowRight:=$_l_WindowLeft+589
				OBJECT GET COORDINATES:C663(*; "oButtonStrap"; $_l_ObjectLeft1; $_l_ObjectTop1; $_l_ObjectRIght1; $_l_ObjectBottom1)
				
				OBJECT MOVE:C664(*; "oButtonStrap"; $_l_ObjectLeft1; $_l_ObjectTop1; $_l_WindowLeft+645; $_l_ObjectBottom1; *)
				OBJECT GET COORDINATES:C663(*; "oDateNavigatorBackground"; $_l_ObjectLeft1; $_l_ObjectTop1; $_l_ObjectRIght1; $_l_ObjectBottom1)
				$_l_ObjectWidth2:=$_l_ObjectRIght1-$_l_ObjectLeft1
				$_l_ObjectInset:=10
				$_l_ObjectLeft1:=(($_l_WindowLeft+589)-10)-$_l_ObjectWidth2
				OBJECT MOVE:C664(*; "oDateNavigatorBackground"; $_l_ObjectLeft1; $_l_ObjectTop1; $_l_ObjectLeft1+$_l_ObjectWidth2; $_l_ObjectBottom1; *)
				If (False:C215)
					OBJECT GET COORDINATES:C663(*; "oPicGotoToday"; $_l_ObjectLeft1; $_l_ObjectTop1; $_l_ObjectRIght1; $_l_ObjectBottom1)
					$_l_ObjectWidth2:=$_l_ObjectRIght1-$_l_ObjectLeft1
					$_l_ObjectInset:=10+2
					$_l_ObjectLeft1:=(($_l_WindowLeft+589)-10)-$_l_ObjectWidth2
					OBJECT MOVE:C664(*; "oPicGotoToday"; $_l_ObjectLeft1; $_l_ObjectTop1; $_l_ObjectLeft1+$_l_ObjectWidth2; $_l_ObjectBottom1; *)
					OBJECT GET COORDINATES:C663(bhl_GOTOTODAY2; $_l_ObjectLeft1; $_l_ObjectTop1; $_l_ObjectRIght1; $_l_ObjectBottom1)
					$_l_ObjectWidth2:=$_l_ObjectRIght1-$_l_ObjectLeft1
					$_l_ObjectInset:=10+2
					$_l_ObjectLeft1:=(($_l_WindowLeft+589)-10)-$_l_ObjectWidth2
					//```
					OBJECT MOVE:C664(bhl_GOTOTODAY2; $_l_ObjectLeft1; $_l_ObjectTop1; $_l_ObjectLeft1+$_l_ObjectWidth2; $_l_ObjectBottom1; *)
					OBJECT GET COORDINATES:C663(*; "oGotoNextDay"; $_l_ObjectLeft1; $_l_ObjectTop1; $_l_ObjectRIght1; $_l_ObjectBottom1)
					$_l_ObjectWidth2:=$_l_ObjectRIght1-$_l_ObjectLeft1
					$_l_ObjectInset:=10+2+16+1
					$_l_ObjectLeft1:=(($_l_WindowLeft+589)-10)-$_l_ObjectWidth2
					OBJECT MOVE:C664(*; "oGotoNextDay"; $_l_ObjectLeft1; $_l_ObjectTop1; $_l_ObjectLeft1+$_l_ObjectWidth2; $_l_ObjectBottom1; *)
					
					OBJECT GET COORDINATES:C663(vSD_SelDateRIGHT; $_l_ObjectLeft1; $_l_ObjectTop1; $_l_ObjectRIght1; $_l_ObjectBottom1)
					$_l_ObjectWidth2:=$_l_ObjectRIght1-$_l_ObjectLeft1
					$_l_ObjectInset:=10+2+16+1
					$_l_ObjectLeft1:=(($_l_WindowLeft+589)-10)-$_l_ObjectWidth2
					OBJECT MOVE:C664(vSD_SelDateRIGHT; $_l_ObjectLeft1; $_l_ObjectTop1; $_l_ObjectLeft1+$_l_ObjectWidth2; $_l_ObjectBottom1; *)
					//``````
					OBJECT GET COORDINATES:C663(SD_D_CurrentViewDate; $_l_ObjectLeft1; $_l_ObjectTop1; $_l_ObjectRIght1; $_l_ObjectBottom1)
					$_l_ObjectWidth2:=$_l_ObjectRIght1-$_l_ObjectLeft1
					$_l_ObjectInset:=10+2+16+1+16+1
					$_l_ObjectLeft1:=(($_l_WindowLeft+589)-10)-$_l_ObjectWidth2
					OBJECT MOVE:C664(SD_D_CurrentViewDate; $_l_ObjectLeft1; $_l_ObjectTop1; $_l_ObjectLeft1+$_l_ObjectWidth2; $_l_ObjectBottom1; *)
					//SD_t_Periodstr
					OBJECT GET COORDINATES:C663(SD_t_Periodstr; $_l_ObjectLeft1; $_l_ObjectTop1; $_l_ObjectRIght1; $_l_ObjectBottom1)
					$_l_ObjectWidth2:=$_l_ObjectRIght1-$_l_ObjectLeft1
					$_l_ObjectInset:=10+2+16+1+16+1
					$_l_ObjectLeft1:=(($_l_WindowLeft+589)-10)-$_l_ObjectWidth2
					OBJECT MOVE:C664(SD_t_Periodstr; $_l_ObjectLeft1; $_l_ObjectTop1; $_l_ObjectLeft1+$_l_ObjectWidth2; $_l_ObjectBottom1; *)
					
					//```
					
					OBJECT GET COORDINATES:C663(*; "oGotoPreviousDay"; $_l_ObjectLeft1; $_l_ObjectTop1; $_l_ObjectRIght1; $_l_ObjectBottom1)
					$_l_ObjectWidth2:=$_l_ObjectRIght1-$_l_ObjectLeft1
					$_l_ObjectInset:=10+2+16+1+121+1
					$_l_ObjectLeft1:=(($_l_WindowLeft+589)-10)-$_l_ObjectWidth2
					OBJECT MOVE:C664(*; "oGotoPreviousDay"; $_l_ObjectLeft1; $_l_ObjectTop1; $_l_ObjectLeft1+$_l_ObjectWidth2; $_l_ObjectBottom1; *)
					
					OBJECT GET COORDINATES:C663(vSD_SelDateLEFT; $_l_ObjectLeft1; $_l_ObjectTop1; $_l_ObjectRIght1; $_l_ObjectBottom1)
					$_l_ObjectWidth2:=$_l_ObjectRIght1-$_l_ObjectLeft1
					$_l_ObjectInset:=10+2+16+1+121+1
					$_l_ObjectLeft1:=(($_l_WindowLeft+589)-10)-$_l_ObjectWidth2
					OBJECT MOVE:C664(vSD_SelDateLEFT; $_l_ObjectLeft1; $_l_ObjectTop1; $_l_ObjectLeft1+$_l_ObjectWidth2; $_l_ObjectBottom1; *)
					
					//```
					OBJECT GET COORDINATES:C663(*; "oGotoPreviousDay"; $_l_ObjectLeft1; $_l_ObjectTop1; $_l_ObjectRIght1; $_l_ObjectBottom1)
					$_l_ObjectWidth2:=$_l_ObjectRIght1-$_l_ObjectLeft1
					$_l_ObjectInset:=10+2+16+1+121+1+16+1
					$_l_ObjectLeft1:=(($_l_WindowLeft+589)-10)-$_l_ObjectWidth2
					OBJECT MOVE:C664(*; "oGotoPreviousDay"; $_l_ObjectLeft1; $_l_ObjectTop1; $_l_ObjectLeft1+$_l_ObjectWidth2; $_l_ObjectBottom1; *)
					
					OBJECT GET COORDINATES:C663(vSD_SelDateLEFT; $_l_ObjectLeft1; $_l_ObjectTop1; $_l_ObjectRIght1; $_l_ObjectBottom1)
					$_l_ObjectWidth2:=$_l_ObjectRIght1-$_l_ObjectLeft1
					$_l_ObjectInset:=10+2+16+1+121+1+16+1
					$_l_ObjectLeft1:=(($_l_WindowLeft+589)-10)-$_l_ObjectWidth2
					OBJECT MOVE:C664(vSD_SelDateLEFT; $_l_ObjectLeft1; $_l_ObjectTop1; $_l_ObjectLeft1+$_l_ObjectWidth2; $_l_ObjectBottom1; *)
				End if 
				
			End if 
			//SD_l_Companion:=New process("SD_CompanionWIndow";256000;"Diary Companion";Current process;$_l_WindowLeft+589;360)
		End if 
		vButtDisDry:="A DPMONPFSSSRCADT"
		vButtDisDry:="I  PMO   SSSRCAD "
		Input_Buttons(->[USER:15]; ->vButtDisdry)
		vButtDisO:="O        S S   D "
		Out_Buttons(->[DIARY:12])
		SET TIMER:C645(60*60)
		If (SD3_l_DiaryActionNum>0)  //enter to diary
			POST OUTSIDE CALL:C329(Current process:C322)
			//call process to get an outside call(see outside call)
		Else 
			GOTO OBJECT:C206(vSrchRequest)
			POST OUTSIDE CALL:C329(Current process:C322)
		End if 
		SHOW PROCESS:C325(Current process:C322)
		
	: ($_l_event=On Menu Selected:K2:14)
		DB_bo_DuringOutsideCall:=True:C214
		If (Menu selected:C152#0)
			$_l_SelectedMenu:=Menu selected:C152
			$_l_SelectedMenuItem:=$_l_SelectedMenu\65536
			$_t_SelectedMenuItemName:=Get menu title:C430($_l_SelectedMenuItem)
			If ($_t_SelectedMenuItemName="History")
				// If ($_l_SelectedMenuItem=2052)
				If (SD_RecordModified(->[DIARY:12]))
					SuperDiary_SaveChk
				End if 
				$_l_HistoryOption:=Diary_HistFind(($_l_SelectedMenu%65536)+1)
				$_t_HistoryRelation:=<>SD3_at_HistoryRelation{$_l_HistoryOption}
				If ($_l_HistoryOption>0)
					Case of 
						: ($_l_HistoryOption=1)
							SD3_t_DiaryRelatedRecord:=[DIARY:12]Company_Code:1
							SD_l_CompanionMenuTable:=Table:C252(->[COMPANIES:2])
						: ($_l_HistoryOption=2)
							SD3_t_DiaryRelatedRecord:=[DIARY:12]Contact_Code:2
							SD_l_CompanionMenuTable:=Table:C252(->[CONTACTS:1])
							
						: ($_l_HistoryOption=3)
							SD3_t_DiaryRelatedRecord:=[DIARY:12]Job_Code:19
							SD_l_CompanionMenuTable:=Table:C252(->[JOBS:26])
							
						: ($_l_HistoryOption=5)
							SD3_t_DiaryRelatedRecord:=[DIARY:12]Order_Code:26
							SD_l_CompanionMenuTable:=Table:C252(->[ORDERS:24])
							
							
						: ($_l_HistoryOption=7)
							SD3_t_DiaryRelatedRecord:=[DIARY:12]Call_Code:25
							SD_l_CompanionMenuTable:=Table:C252(->[SERVICE_CALLS:20])
						: ($_l_HistoryOption=8)
							SD3_t_DiaryRelatedRecord:=[DIARY:12]Company_Code:1
							SD_l_CompanionMenuTable:=Table:C252(->[COMPANIES:2])
							SD_t_ProcRelationActionID:=[DIARY:12]Action_Code:9
							
						: ($_l_HistoryOption=9)
							SD3_t_DiaryRelatedRecord:=[DIARY:12]Company_Code:1
							SD_l_CompanionMenuTable:=Table:C252(->[CONTACTS:1])
							SD_t_ProcRelationActionID:=[DIARY:12]Action_Code:9
						: ($_l_HistoryOption=10)
							SD3_t_DiaryRelatedRecord:=[DIARY:12]Job_Code:19
							SD_l_CompanionMenuTable:=Table:C252(->[JOBS:26])
							SD_t_ProcRelationActionID:=[DIARY:12]Action_Code:9
							
						: ($_l_HistoryOption=12)
							SD3_t_DiaryRelatedRecord:=[DIARY:12]Order_Code:26
							SD_l_CompanionMenuTable:=Table:C252(->[ORDERS:24])
							SD_t_ProcRelationActionID:=[DIARY:12]Action_Code:9
							
						: ($_l_HistoryOption=13)
							SD3_t_DiaryRelatedRecord:=[DIARY:12]Call_Code:25
							SD_l_CompanionMenuTable:=Table:C252(->[SERVICE_CALLS:20])
							SD_t_ProcRelationActionID:=[DIARY:12]Action_Code:9
						: ($_l_HistoryOption=14)
							SD3_t_DiaryRelatedRecord:=[DIARY:12]Document_Code:15
							SD_l_CompanionMenuTable:=Table:C252(->[DOCUMENTS:7])
							SD_t_ProcRelationActionID:=[DIARY:12]Action_Code:9
					End case 
					If (SD3_t_DiaryRelatedRecord#"") & (SD_l_CompanionMenuTable>0)
						<>DB_bo_AutoOut:=True:C214
						<>AutoFind:=True:C214
						<>AutoProc:=Record number:C243([DIARY:12])
						<>AutoFile:="Diary"
						
						SD3_l_CallActionNum:=1
						ZDiary_Mod
						SD3_l_CallActionNum:=4
					End if 
					
				Else 
					$_l_HistoryOption:=1
				End if 
			End if 
		End if 
		DB_bo_DuringOutsideCall:=False:C215
		
	: ($_l_event=On Data Change:K2:15)
		
		Diary_InD
		
	: ($_l_event=On Close Detail:K2:24)
		WS_AutoscreenSize(2; 490; 665)
	: ($_l_event=On Activate:K2:9)
		//  vButtDis:="A DPMONPFSSSRCADT" ` 21/6/02 pb
		//  vButtDis:="I  PMO   SSSRCAD "` 21/6/02 pb
		// Input_Buttons (->[USER];->vButtDis)
		
		vButtDisO:="O        S S   D "
		Out_Buttons(->[DIARY:12])
		
	: ($_l_event=On Timer:K2:25)
		SET TIMER:C645(0)  //Turn the timer off
		//ARRAY STRING(55;WS_at_DiaryVIewTab;3)
		If (WS_at_DiaryVIewTab<4) & (Not:C34(SD_RecordModified(->[DIARY:12]))) & (Not:C34(DB_bo_DuringOutsideCall))
			//only if we are not viewing a specific range
			//and we are not editing a record
			
			PROCESS PROPERTIES:C336(Current process:C322; $_t_processName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible)
			If ($_bo_ProcessVisible)
				$_t_DiaryCode:=[DIARY:12]Diary_Code:3
				$_l_SelectedEventRow:=SD_at_Events
				$_l_SelectedToDoRow:=SD_at_ToDoList
				$_l_SelectedQueryRow:=SD_at_Query
				
				$_l_CountListItems:=Count list items:C380(SD_l_HLDayTime)
				$_l_SelectedListItem:=Selected list items:C379(SD_l_HLDayTime)
				GET LIST ITEM:C378(SD_l_HLDayTime; $_l_SelectedListItem; $_l_itemReference2; $_t_ItemText2)
				SDiary_HL_QueryDiary(SD_t_CurrentDiaryInitials; SD_d_StartDate; SD_d_EndDate)
				SDiary_HL_DisplayDiary(SD_d_StartDate; SD_d_EndDate)
				If ($_t_DiaryCode#"")
					//we had a record loaded-reload it
					QUERY:C277([DIARY:12]; [DIARY:12]Diary_Code:3=$_t_DiaryCode)
					SD_SetSplitter(->SD_l_DescriptionSplitter)
					SD_SetVisible(False:C215)
					RELATE ONE:C42([DIARY:12]Company_Code:1)
					WT_hl_DiaryDETAIL2
					SD_LoadOtherPerson([DIARY:12]Diary_Code:3; [DIARY:12]Person:8)
					If (Records in selection:C76([DIARY:12])>0)
						DB_MenuAction("Document"; ""; 2; "")
						
						
						//  ENABLE MENU ITEM(4;0)
						// DISABLE MENU ITEM(4;11)
						$_l_PriorityNumRow:=Find in array:C230(SD_al_PriorityNUM; Num:C11([DIARY:12]Priority:17))
						If ($_l_PriorityNumRow>0)
							SD_al_PriorityNUM:=SD_al_PriorityNUM{$_l_PriorityNumRow}
						End if 
						If ([DIARY:12]Done:14=True:C214)
							
							READ WRITE:C146([DIARY:12])
							LOAD RECORD:C52([DIARY:12])
							OBJECT SET ENTERABLE:C238([DIARY:12]Done:14; True:C214)
						Else 
						End if 
					End if 
					
				End if 
				SD_at_Events:=$_l_SelectedEventRow
				SD_at_ToDoList:=$_l_SelectedToDoRow
				SD_at_Query:=$_l_SelectedQueryRow
				SELECT LIST ITEMS BY REFERENCE:C630(SD_l_HLDayTime; $_l_itemReference2)
				
			End if 
		End if 
		If (Current process:C322=Frontmost process:C327(*))
			//vButtDis:="A DPMONPFSSSRCADT"
			//vButtDis:="I  PMO   SSSRCAD "
			
			//Input_Buttons (->[USER];->vButtDis)
			vButtDisO:="O        S S   D "
			Out_Buttons(->[DIARY:12])
		End if 
		SET TIMER:C645(60*60)
	: ((($_l_event=On Outside Call:K2:11) & (DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
		DB_bo_DuringOutsideCall:=True:C214
		$_l_ButtonPressed:=DB_l_ButtonClickedFunction
		Out_ButtCallSD(->[DIARY:12]; ->[DIARY:12]Diary_Code:3; ->[DIARY:12]Company_Code:1; "Diary"; "SD_DiaryAdd"; "SD_Diary_Sel"; "SD_DeleteDiaryItem"; "DMaster"; "Diary"; "Diary_OutCount"; 1; 2)
		DB_bo_DuringOutsideCall:=False:C215
		If (($_l_ButtonPressed=DB_GetButtonFunction("Find")) | ($_l_ButtonPressed=DB_GetButtonFunction("FindO")))
			
			If (CB_l_ScheduleFullPage>0)
				
				
				OBJECT SET VISIBLE:C603(*; "oDiaryInputObject"+"@"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oDateDoneFromLabel"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oTimeDoneFromLabel"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oDiaryTimeSettingDropDown"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oDiaryTimeSetting"; False:C215)
				OBJECT SET VISIBLE:C603([DIARY:12]Date_Done_From:5; False:C215)
				OBJECT SET VISIBLE:C603([DIARY:12]Time_Done_From:7; False:C215)
				OBJECT SET VISIBLE:C603([DIARY:12]Date_Done_To:34; False:C215)
				OBJECT SET VISIBLE:C603([DIARY:12]Time_Done_To:36; False:C215)
				OBJECT SET VISIBLE:C603(*; "oDateDoneToLabel"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oTimeDoneToLabel"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oDiaryPersonName"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oPersonNameDropDown"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oDiaryPersonsPicture"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oDescriptionLabel"; True:C214)
				OBJECT SET VISIBLE:C603(*; "SD_l_oSplitter1"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oDocumentLabel"; True:C214)
				OBJECT SET VISIBLE:C603(*; "PICT_SMSR"; True:C214)
				OBJECT SET VISIBLE:C603(*; "PICT_EmailR"; True:C214)
				OBJECT SET VISIBLE:C603(*; "PICT_SnailMailR"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oResCodeLabel"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oDiaryResultPicture"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oResDescLabel"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oScriptLabel"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oUnitsLabel"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oStatusLabel"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oRelationLabel"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oDiaryCodeLabel"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oRelations"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oDiaryActionDesc"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oValueLabel"; True:C214)
				OBJECT SET VISIBLE:C603(SD_l_TopSplitter; True:C214)
				
				If (SD_l_TabWidth>0)
					OBJECT GET COORDINATES:C663(WS_at_DiaryVIewTab; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
					
					OBJECT MOVE:C664(WS_at_DiaryVIewTab; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectLeft+SD_l_TabWidth; $_l_ObjectBottom; *)
					
				End if 
				
				
			End if 
			
		End if 
		DB_l_ButtonClickedFunction:=0
	: ($_l_event=On Outside Call:K2:11)
		
		SD_FormEventhandler
		
End case 

If (<>MOD_bo_ModuleSelected)
	<>MOD_bo_ModuleSelected:=True:C214
	$_t_ModuleExecute:=<>MOD_t_ModuleExecute
	<>MOD_bo_ModuleSelected:=False:C215
	<>MOD_t_ModuleExecute:=""
	BRING TO FRONT:C326(<>MenuProc)
	//EXECUTE FORMULA($_l_ModuleExecute)
	EXECUTE METHOD:C1007($_t_ModuleExecute)
End if 
ERR_MethodTrackerReturn("FM [PERSONNEL].Diary_ViewAG"; $_t_oldMethodName)
