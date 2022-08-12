If (False:C215)
	//Table Form Method Name: Object Name:      [PERSONNEL].Diary_View
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/10/2012 10:22
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
	//ARRAY LONGINT(<>SD_al_CombineGroupDiaries;0)
	//ARRAY LONGINT(<>SD_al_CombinePersonDiaries;0)
	//ARRAY LONGINT(<>SD_al_CombineResourceDiaries;0)
	ARRAY LONGINT:C221($_al_PriorityNUMElem; 0)
	//ARRAY LONGINT(SD_al_ActionCodesOST;0)
	//ARRAY LONGINT(SD_al_ActionTime;0)
	//ARRAY LONGINT(SD_al_MenuCall;0)
	//ARRAY LONGINT(SD_al_PersonClass;0)
	//ARRAY LONGINT(SD_al_PriorityNUM;0)
	//ARRAY LONGINT(SD3_al_CacheCurrentPage;0)
	//ARRAY POINTER(CONT_aPtr_LBSetup;0)
	//ARRAY POINTER(SD_aptr_RelationFields;0)
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
	//ARRAY TEXT(SD_at_History;0)
	//ARRAY TEXT(SD_at_OpenDocument;0)
	//ARRAY TEXT(SD_at_PersonInitials;0)
	//ARRAY TEXT(SD_at_Query;0)
	//ARRAY TEXT(SD_at_RelationTypes;0)
	//ARRAY TEXT(SD_at_ResultCodes;0)
	//ARRAY TEXT(SD_at_ResultNames;0)
	//ARRAY TEXT(SD_at_ToDoList;0)
	//ARRAY TEXT(SD3_at_CacheEndPerson;0)
	//ARRAY TEXT(SD3_at_TimeFrame;0)
	//ARRAY TEXT(WS_at_DiaryVIewTab;0)
	//ARRAY TEXT(WT_at_DiaryMonthNames;0)
	//ARRAY TEXT(WT_at_DiaryYearNames;0)
	C_BOOLEAN:C305(<>AutoFind; <>DB_bo_AutoOut; <>MOD_bo_ModuleSelected; $_bo_ProcessVisible; DB_bo_NoLoad; DB_bo_DuringOutsideCall; SD_bo_AddingDiaryRecord; SD_bo_AgendaEnabled; SD_bo_FormLoaded; SD_bo_ResultsDialog)
	C_DATE:C307(SD_D_CurrentviewDate; SD_d_EndDate; SD_d_GetDate; SD_d_StartDate; vSD_QuyDiaryDate)
	C_LONGINT:C283(<>AutoProc; <>MenuProc; $_l_CountListItems; $_l_CountPersons; $_l_CurrentElement; $_l_CurrentEventsRow; $_l_CurrentQueryRow; $_l_CurrentTodoRow; $_l_DayNumber; $_l_DiaryOwnerRow; $_l_DiaryPersonsCount)
	C_LONGINT:C283($_l_DiaryRemindersProcess; $_l_event; $_l_EventElement; $_l_HistoryRow; $_l_Index; $_l_itemReference2; $_l_MenuBar; $_l_Process; $_l_ProcessState; $_l_ProcessTime; $_l_QueryElement)
	C_LONGINT:C283($_l_ResItemsIndex; $_l_SelectedListItem; $_l_SelectedMenu; $_l_ToDoElement; $_l_WIndowBottom; $_l_WindowLeft; $_l_WIndowRight; $_l_WindowTop; Badd_Person; DB_l_ButtonClickedFunction; hlQY_MONTHS)
	C_LONGINT:C283(iCancel; iOK; SD_l_CompanionMenuTable; SD_l_DescriptionSplitter; SD_l_DIaryPage; SD_l_DiaryPersonID; SD_l_EditingDiaryRecord; SD_l_HLDayTime; SD_l_HLRelatedInfo; SD_l_IncAppointmentCo; SD_l_IncEventCo)
	C_LONGINT:C283(SD_l_IncludeCompleted; SD_l_IncQueryCo; SD_l_IncTodoCo; SD_l_RelationAdd; SD_l_YearMonthDayTime; SD3_l_CallActionNum; SD3_l_DiaryActionNum; vPublicCheck; WS_l_SELECTEDDIARYVIEWTAB; WT_CurrMonth; xNext)
	C_TEXT:C284(<>AutoFile; <>HLAPPAREATEXT; <>HLEVENTAREATEXT; <>HLTASKAREATEXT; <>MOD_t_ModuleExecute; <>PER_t_CurrentUserInitials; $_t_ApplicationVersion; $_t_DiaryCOde; $_t_ItemText2; $_t_MenuName; $_t_ModuleExecute)
	C_TEXT:C284($_t_oldMethodName; $_t_processName; SD_T_CurrentDiary; SD_t_CurrentDiaryInitials; SD_t_CurrentDiaryOwnerName; SD_t_DiaryCode; SD_t_DiaryDefaultUser; SD_t_Periodstr; SD_t_priorityText; SD_t_ProcRelationActionID; SD_t_RelationAdd)
	C_TEXT:C284(SD_t_RelationCode; SD_t_TimeSetting; SD_t_TodoText; SD_t_Year; SD3_t_DiaryRelatedRecord; vButtDisDry; vButtDisO; vSD_QuyDiaryPerson; vSrchRequest; WIN_t_CurrentInputForm; WT_MonthInd)
	C_TIME:C306(vTime)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [PERSONNEL].Diary_View"; Form event code:C388)
$_l_event:=Form event code:C388



Case of 
	: ($_l_event=On Resize:K2:27)
		
		$_t_ApplicationVersion:=Application version:C493
		//max screen width= 600
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WIndowRight; $_l_WIndowBottom)
		If ($_l_WIndowRight-$_l_WindowLeft<745)  //NG September 2004
			//NG because the form width in the properties has to have a minimum of 586
			//or the screen draw puts everything in the wrong place, and because if this form gets narrower the 745
			//i need to put this piece of code
			
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_WindowTop; $_l_WindowLeft+745; $_l_WIndowBottom)
		End if 
		If (Num:C11($_t_ApplicationVersion)<670)
			If ($_l_WIndowRight-$_l_WindowLeft>1000)
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_WindowTop; $_l_WindowLeft+1000; $_l_WIndowBottom)
			End if 
		Else 
			If ($_l_WIndowRight-$_l_WindowLeft>Screen width:C187)
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_WindowTop; Screen width:C187-10; $_l_WIndowBottom)
			End if 
		End if 
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WIndowRight; $_l_WIndowBottom)
		If ($_l_WIndowBottom>Screen height:C188)
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_WindowTop; $_l_WIndowRight; Screen height:C188-10)
		End if 
		If (SD_bo_FormLoaded)
			SD_SETViews
		End if 
		
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		ARRAY TEXT:C222(SD_at_History; 0)
		DB_LoadDisplay(Table:C252(->[DIARY:12]); ->SD_at_History)
		If (<>MenuProc=0)
			<>MenuProc:=1
		End if 
		OpenHelp(Table:C252(->[PERSONNEL:11]); "Diary_View")
		SD_l_DIaryPage:=1
		ARRAY POINTER:C280(CONT_aPtr_LBSetup; 0)
		//ALArrDefFill (->CONT_aPtr_LBSetup;->SD_l_ALQ;->[DIARY];->[DIARY]Diary Code;"Blue";"ALModDiary";"411111000";"Diary_InNEW";"01211";◊User;"";"Diary";"Diary";->[DIARY];->[DIARY]Diary Code)
		LBi_ArrDefFill(->CONT_aPtr_LBSetup; ->SD_LB_Items; ->[DIARY:12]Diary_Code:3; ->[DIARY:12]Diary_Code:3; "411111000"; "Diary_InNEW"; 11; "Diary"; "Diary"; <>PER_t_CurrentUserInitials)  // 07/07/06 pb
		LBi_Prefs11(->CONT_aPtr_LBSetup)
		
		
		SD_bo_AgendaEnabled:=False:C215
		
		ARRAY TEXT:C222(SD_at_Events; 0)
		$_l_EventElement:=0
		ARRAY TEXT:C222(SD_at_ToDoList; 0)
		$_l_ToDoElement:=0
		ARRAY TEXT:C222(SD_at_Query; 0)
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
		
		
		xNext:=0
		
		ARRAY LONGINT:C221(<>SD_al_CombineGroupDiaries; 0)
		ARRAY LONGINT:C221(<>SD_al_CombinePersonDiaries; 0)
		ARRAY LONGINT:C221(<>SD_al_CombineResourceDiaries; 0)
		
		ARRAY TEXT:C222(SD_at_Arrayrelations; 0)
		
		
		ARRAY TEXT:C222(SD_at_DiaryViewOptions; 4)
		SD_at_DiaryViewOptions{1}:="All"
		SD_at_DiaryViewOptions{2}:="To Do"
		SD_at_DiaryViewOptions{3}:="Appointments"
		SD_at_DiaryViewOptions{1}:="Done"
		
		ARRAY TEXT:C222(SD_at_AddAction; 7)
		SD_at_AddAction{1}:="Add Event"
		SD_at_AddAction{2}:="Add to schedule"
		SD_at_AddAction{3}:="Add Task"
		SD_at_AddAction{4}:="-"
		SD_at_AddAction{5}:="New Letter"
		SD_at_AddAction{6}:="New Email"
		SD_at_AddAction{7}:="New SMS"
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
		
		$_l_CurrentElement:=0
		If ((DB_GetModuleSettingByNUM(Module_SalesOrders))>0)  //orders available"
			$_l_CurrentElement:=$_l_CurrentElement+1
			SD_at_RelationTypes{$_l_CurrentElement}:="Order :"
			SD_aptr_RelationFields{$_l_CurrentElement}:=->[DIARY:12]Order_Code:26
			SD_al_MenuCall{$_l_CurrentElement}:=7
		End if 
		
		If ((DB_GetModuleSettingByNUM(Module_Products))>0)  //products available"
			$_l_CurrentElement:=$_l_CurrentElement+1
			SD_at_RelationTypes{$_l_CurrentElement}:="Product:"
			SD_aptr_RelationFields{$_l_CurrentElement}:=->[DIARY:12]Product_Code:13
			SD_al_MenuCall{$_l_CurrentElement}:=5
		End if 
		If ((DB_GetModuleSettingByNUM(Module_JobCosting))>0)  //jobs available"
			$_l_CurrentElement:=$_l_CurrentElement+1
			SD_at_RelationTypes{$_l_CurrentElement}:="Job:"
			SD_aptr_RelationFields{$_l_CurrentElement}:=->[DIARY:12]Job_Code:19
			SD_al_MenuCall{$_l_CurrentElement}:=9
		End if 
		If ((DB_GetModuleSettingByNUM(Module_JobCosting))>0)  //jobs  stage available"
			$_l_CurrentElement:=$_l_CurrentElement+1
			SD_at_RelationTypes{$_l_CurrentElement}:="Job Stage:"
			SD_aptr_RelationFields{$_l_CurrentElement}:=->[DIARY:12]Stage_Code:21
			SD_al_MenuCall{$_l_CurrentElement}:=13
		End if 
		If ((DB_GetModuleSettingByNUM(Module_ServiceCentre))>0)  //service centre"
			$_l_CurrentElement:=$_l_CurrentElement+1
			SD_at_RelationTypes{$_l_CurrentElement}:="Call :"
			SD_aptr_RelationFields{$_l_CurrentElement}:=->[DIARY:12]Call_Code:25
			SD_al_MenuCall{$_l_CurrentElement}:=8
		End if 
		ARRAY TEXT:C222(SD_at_RelationTypes; $_l_CurrentElement)
		ARRAY POINTER:C280(SD_aptr_RelationFields; $_l_CurrentElement)
		ARRAY LONGINT:C221(SD_al_MenuCall; $_l_CurrentElement)
		SD_t_RelationAdd:=""
		SD_t_RelationCode:=""
		
		SD_l_RelationAdd:=0
		
		
		OBJECT SET VISIBLE:C603(SD_t_RelationAdd; False:C215)
		OBJECT SET VISIBLE:C603(*; "Pic_Relation"; False:C215)
		OBJECT SET VISIBLE:C603(SD_t_RelationCode; False:C215)
		OBJECT SET VISIBLE:C603(SD_at_RelationTypes; False:C215)
		
		SET TIMER:C645(60*60)
		OBJECT SET VISIBLE:C603(SD_at_DIOPersonnelNAME; False:C215)
		OBJECT SET VISIBLE:C603(Badd_Person; False:C215)
		ARRAY LONGINT:C221(SD3_al_CacheCurrentPage; 0)
		ARRAY DATE:C224(SD3_ad_CacheStartDateRange; 0)
		ARRAY DATE:C224(SD3_ad_CacheEndDateRange; 0)
		ARRAY TEXT:C222(SD3_at_CacheEndPerson; 0)
		ARRAY TEXT:C222(SD3_at_TimeFrame; 0)
		
		
		<>HLEVENTAREATEXT:="Add EVENT"
		<>HLAPPAREATEXT:="Add APPOINTMENT"
		<>HLTASKAREATEXT:="Add TASK"
		Cache_Initialise("DMaster")
		$_t_ApplicationVersion:=Application version:C493
		
		//max screen width= 600
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WIndowRight; $_l_WIndowBottom)
		If (Num:C11($_t_ApplicationVersion)<670)
			WS_AutoscreenSize(1; 410; 560)
		Else 
			WS_AutoscreenSize(1; 410; 1000)
		End if 
		
		INT_SetInput(Table:C252(->[DIARY:12]); WIN_t_CurrentInputForm)
		
		vButtDisDry:="A DPMONPFSSSRCADT"
		vButtDisdry:="I  PMO   SSSRCAD "
		Input_Buttons(->[USER:15]; ->vButtDisdry)
		vButtDisO:="O        S S   D "
		Out_Buttons(->[DIARY:12])
		
		
		
		//  DISABLE MENU ITEM(2;10)
		//  DISABLE MENU ITEM(3;0)
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
		//C_LONGINT(WT_CurrMonth)
		
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
		$_l_DiaryPersonsCount:=Size of array:C274(SD_at_PersonInitials)+1
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
		QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Global_Access:47=True:C214; *)  //WT-17/08/01: listing for global resource items
		QUERY:C277([PERSONNEL:11];  & ; [PERSONNEL:11]PersonDeleted:38#1)
		$_l_CurrentElement:=Size of array:C274(SD_at_DiaryOwners)
		If (Records in selection:C76([PERSONNEL:11])>0)
			INSERT IN ARRAY:C227(SD_at_DiaryOwners; 9999; Records in selection:C76([PERSONNEL:11])+1)
			INSERT IN ARRAY:C227(SD_at_PersonInitials; 9999; Records in selection:C76([PERSONNEL:11])+1)
			INSERT IN ARRAY:C227(SD_al_PersonClass; 9999; Records in selection:C76([PERSONNEL:11])+1)
			$_l_CountPersons:=Size of array:C274(SD_at_PersonInitials)+1
			$_l_CurrentElement:=$_l_CurrentElement+1
			SD_at_PersonInitials{$_l_CurrentElement}:="-"  //insert a seperator here
			SD_at_DiaryOwners{$_l_CurrentElement}:="-"  //and insert a seperator here
			ORDER BY:C49([PERSONNEL:11]; [PERSONNEL:11]Name:2; >)
			For ($_l_ResItemsIndex; 1; Records in selection:C76([PERSONNEL:11]))
				$_l_CurrentElement:=$_l_CurrentElement+1
				SD_at_PersonInitials{$_l_CurrentElement}:=[PERSONNEL:11]Initials:1
				SD_at_DiaryOwners{$_l_CurrentElement}:=[PERSONNEL:11]Name:2
				SD_al_PersonClass{$_l_CurrentElement}:=3
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
			$_l_Process:=New process:C317("SD_AlarmingEvents"; 256000; "Diary reminders "+SD_t_CurrentDiaryInitials; SD_l_DiaryPersonID; SD_t_DiaryDefaultUser)
			
		Else 
			If (Process state:C330($_l_DiaryRemindersProcess)<0)
				$_l_Process:=New process:C317("SD_AlarmingEvents"; 256000; "Diary reminders "+SD_t_CurrentDiaryInitials; SD_l_DiaryPersonID; SD_t_DiaryDefaultUser)
				
			End if 
		End if 
		SELECT LIST ITEMS BY POSITION:C381(SD_l_HLRelatedInfo; 1)
		$_l_DayNumber:=Day number:C114(SD_D_CurrentviewDate)
		SD_TabManager
		Cache_Update(WS_l_SELECTEDDIARYVIEWTAB; SD_d_StartDate; SD_d_EndDate; SD_t_CurrentDiaryInitials; ->SD3_al_CacheCurrentPage; ->SD3_ad_CacheStartDateRange; ->SD3_ad_CacheEndDateRange; ->SD3_at_CacheEndPerson)
		
		SD_SetFieldsFalse
		// SD_SetSplitter (->SD_l_DescriptionSplitter)
		
		If (SD3_l_DiaryActionNum>0)  //enter to diary
			POST OUTSIDE CALL:C329(Current process:C322)
			//call process to get an outside call(see outside call)
		Else 
			GOTO OBJECT:C206(vSrchRequest)
			POST OUTSIDE CALL:C329(Current process:C322)
		End if 
		SD_d_StartDate:=Current date:C33(*)
		SD_d_EndDate:=Current date:C33(*)
		
		SDiary_HL_QueryDiary(SD_t_CurrentDiaryInitials; SD_d_StartDate; SD_d_EndDate)
		SDiary_HL_DisplayDiary(SD_d_StartDate; SD_d_EndDate)
		
		//********************************************
		//********************************************
		SD_bo_FormLoaded:=True:C214
	: ($_l_event=On Menu Selected:K2:14)
		DB_bo_DuringOutsideCall:=True:C214
		If (Menu selected:C152#0)
			$_l_SelectedMenu:=Menu selected:C152
			$_l_MenuBar:=$_l_SelectedMenu\65536
			$_t_MenuName:=Get menu title:C430($_l_MenuBar)
			If ($_t_MenuName="History")
				// If ($_l_MenuBar=2052)
				If (SD_RecordModified(->[DIARY:12]))
					SuperDiary_SaveChk
				End if 
				$_l_HistoryRow:=Diary_HistFind(($_l_SelectedMenu%65536)+1; ->SD_at_History)
				//$history:=◊aHistory{$_l_HistoryRow}
				If ($_l_HistoryRow>0)
					Case of 
						: (SD_at_History{$_l_HistoryRow}="Company")
							SD3_t_DiaryRelatedRecord:=[DIARY:12]Company_Code:1
							SD_l_CompanionMenuTable:=Table:C252(->[COMPANIES:2])
						: (SD_at_History{$_l_HistoryRow}="Contact")
							SD3_t_DiaryRelatedRecord:=[DIARY:12]Contact_Code:2
							SD_l_CompanionMenuTable:=Table:C252(->[CONTACTS:1])
						: (SD_at_History{$_l_HistoryRow}="Job")
							SD3_t_DiaryRelatedRecord:=[DIARY:12]Job_Code:19
							SD_l_CompanionMenuTable:=Table:C252(->[JOBS:26])
						: (SD_at_History{$_l_HistoryRow}="Order")
							SD3_t_DiaryRelatedRecord:=[DIARY:12]Order_Code:26
							SD_l_CompanionMenuTable:=Table:C252(->[ORDERS:24])
						: (SD_at_History{$_l_HistoryRow}="Call")
							SD3_t_DiaryRelatedRecord:=[DIARY:12]Call_Code:25
							SD_l_CompanionMenuTable:=Table:C252(->[SERVICE_CALLS:20])
						: (SD_at_History{$_l_HistoryRow}="Comp & Action")
							SD3_t_DiaryRelatedRecord:=[DIARY:12]Company_Code:1
							SD_l_CompanionMenuTable:=Table:C252(->[COMPANIES:2])
							SD_t_ProcRelationActionID:=[DIARY:12]Action_Code:9
							
						: (SD_at_History{$_l_HistoryRow}="Cont & Action")
							SD3_t_DiaryRelatedRecord:=[DIARY:12]Company_Code:1
							SD_l_CompanionMenuTable:=Table:C252(->[CONTACTS:1])
							SD_t_ProcRelationActionID:=[DIARY:12]Action_Code:9
						: (SD_at_History{$_l_HistoryRow}="Job & Action")
							SD3_t_DiaryRelatedRecord:=[DIARY:12]Job_Code:19
							SD_l_CompanionMenuTable:=Table:C252(->[JOBS:26])
							SD_t_ProcRelationActionID:=[DIARY:12]Action_Code:9
						: (SD_at_History{$_l_HistoryRow}="Order & Action")
							
							SD3_t_DiaryRelatedRecord:=[DIARY:12]Order_Code:26
							SD_l_CompanionMenuTable:=Table:C252(->[ORDERS:24])
							SD_t_ProcRelationActionID:=[DIARY:12]Action_Code:9
							
						: (SD_at_History{$_l_HistoryRow}="Call & Action")
							
							SD3_t_DiaryRelatedRecord:=[DIARY:12]Call_Code:25
							SD_l_CompanionMenuTable:=Table:C252(->[SERVICE_CALLS:20])
							SD_t_ProcRelationActionID:=[DIARY:12]Action_Code:9
						: (SD_at_History{$_l_HistoryRow}="Document")
							
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
						SD3_l_CallActionNum:=0
					End if 
					
				Else 
					$_l_HistoryRow:=1
				End if 
			End if 
		End if 
		DB_bo_DuringOutsideCall:=False:C215
	: ($_l_event=On Data Change:K2:15)
		
		Diary_InD
		
	: ($_l_event=On Close Detail:K2:24)
		WS_AutoscreenSize(2; 490; 665)
	: ($_l_event=On Activate:K2:9)
		OpenHelp(Table:C252(->[PERSONNEL:11]); "Diary_View")
		//  vButtDis:="A DPMONPFSSSRCADT" ` 21/6/02 pb
		//  vButtDis:="I  PMO   SSSRCAD "` 21/6/02 pb
		// Input_Buttons (->[USER];->vButtDis)
		vButtDisO:="O        S S   D "
		Out_Buttons(->[DIARY:12])
		
	: ($_l_event=On Timer:K2:25)
		//ARRAY STRING(55;WS_at_DiaryVIewTab;3)
		If (WS_at_DiaryVIewTab<4) & (Not:C34(SD_RecordModified(->[DIARY:12]))) & (Not:C34(SD_bo_AddingDiaryRecord)) & (SD_l_EditingDiaryRecord=0) & (Current process:C322=Frontmost process:C327(*)) & (Not:C34(DB_bo_DuringOutsideCall))
			//only if we are not viewing a specific range
			//and we are not editing a record
			
			PROCESS PROPERTIES:C336(Current process:C322; $_t_processName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible)
			If ($_bo_ProcessVisible)
				$_t_DiaryCOde:=[DIARY:12]Diary_Code:3
				$_l_CurrentEventsRow:=SD_at_Events
				$_l_CurrentTodoRow:=SD_at_ToDoList
				$_l_CurrentQueryRow:=SD_at_Query
				
				$_l_CountListItems:=Count list items:C380(SD_l_HLDayTime)
				$_l_SelectedListItem:=Selected list items:C379(SD_l_HLDayTime)
				GET LIST ITEM:C378(SD_l_HLDayTime; $_l_SelectedListItem; $_l_itemReference2; $_t_ItemText2)
				SDiary_HL_QueryDiary(SD_t_CurrentDiaryInitials; SD_d_StartDate; SD_d_EndDate)
				SDiary_HL_DisplayDiary(SD_d_StartDate; SD_d_EndDate)
				If ($_t_DiaryCOde#"")
					//we had a record loaded-reload it
					QUERY:C277([DIARY:12]; [DIARY:12]Diary_Code:3=$_t_DiaryCOde)
					SD_SetSplitter(->SD_l_DescriptionSplitter)
					SD_SetVisible(False:C215)
					RELATE ONE:C42([DIARY:12]Company_Code:1)
					WT_hl_DiaryDETAIL2
					SD_LoadOtherPerson([DIARY:12]Diary_Code:3; [DIARY:12]Person:8)
					If (Records in selection:C76([DIARY:12])>0)
						DB_MenuAction("Document"; ""; 2; "")
						
						
						//  ENABLE MENU ITEM(4;0)
						// DISABLE MENU ITEM(4;11)
						$_al_PriorityNUMElem:=Find in array:C230(SD_al_PriorityNUM; Num:C11([DIARY:12]Priority:17))
						If ($_al_PriorityNUMElem>0)
							SD_al_PriorityNUM:=SD_al_PriorityNUM{$_al_PriorityNUMElem}
						End if 
						If ([DIARY:12]Done:14=True:C214)
							
							READ WRITE:C146([DIARY:12])
							LOAD RECORD:C52([DIARY:12])
							OBJECT SET ENTERABLE:C238([DIARY:12]Done:14; True:C214)
						Else 
						End if 
					End if 
					
				End if 
				SD_at_Events:=$_l_CurrentEventsRow
				SD_at_ToDoList:=$_l_CurrentTodoRow
				SD_at_Query:=$_l_CurrentQueryRow
				SELECT LIST ITEMS BY REFERENCE:C630(SD_l_HLDayTime; $_l_itemReference2)
				
			End if 
		End if 
		
	: ((($_l_event=On Outside Call:K2:11) & (DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
		DB_bo_DuringOutsideCall:=True:C214
		Out_ButtCallSD(->[DIARY:12]; ->[DIARY:12]Diary_Code:3; ->[DIARY:12]Company_Code:1; "Diary"; "SD_DiaryAdd"; "SD_Diary_Sel"; "SD_DeleteDiaryItem"; "DMaster"; "Diary"; "Diary_OutCount"; 1; 2)
		DB_bo_DuringOutsideCall:=False:C215
		
	: ($_l_event=On Outside Call:K2:11)
		
		SD_FormEventhandler
		
End case 

If (<>MOD_bo_ModuleSelected)
	<>MOD_bo_ModuleSelected:=True:C214
	$_t_ModuleExecute:=<>MOD_t_ModuleExecute
	<>MOD_bo_ModuleSelected:=False:C215
	<>MOD_t_ModuleExecute:=""
	BRING TO FRONT:C326(<>MenuProc)
	//EXECUTE FORMULA($_t_ModuleExecute)
	EXECUTE METHOD:C1007($_t_ModuleExecute)
End if 
ERR_MethodTrackerReturn("FM:Diary_View"; $_t_oldMethodName)
