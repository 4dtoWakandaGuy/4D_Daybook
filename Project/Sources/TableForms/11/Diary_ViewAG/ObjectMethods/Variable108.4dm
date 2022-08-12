If (False:C215)
	//object Name: [PERSONNEL]Diary_ViewAG.Variable108
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY DATE(SD_ad_TaskDate;0)
	//ARRAY DATE(SD3_ad_CacheEndDateRange;0)
	//ARRAY DATE(SD3_ad_CacheStartDateRange;0)
	//ARRAY LONGINT(SD3_al_CacheCurrentPage;0)
	//ARRAY TEXT(SD_at_ToDoList2;0)
	//ARRAY TEXT(SD3_at_CacheEndPerson;0)
	//ARRAY TEXT(WS_at_DiaryVIewTab;0)
	C_BOOLEAN:C305(SD_bo_AgendaSetup; SD_bo_NoAgendaEvent)
	C_DATE:C307(SD_D_CurrentViewDate; SD_D_CurrentViewDateOLD; SD_d_EndDate; SD_d_EndDateOLD; SD_d_StartDate; SD_d_StartDateOLD)
	C_LONGINT:C283($_l_DayNumber; $_l_MaxTabs; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; $_l_TabObjectBottom; $_l_TabObjectLeft; $_l_TabObjectRight; $_l_TabObjectTop; $_l_TabWidth)
	C_LONGINT:C283($_l_TasksCount; $_l_WindowBottom2; $_l_WindowLeft; $_l_WindowLeft2; $_l_WindowRight2; $_l_WindowTop; $_l_WindowTop2; CB_l_ScheduleFullPage; CB_ScheduleFUllPage2; SD_l_DIaryPage; SD_l_EditingDiaryRecord)
	C_LONGINT:C283(SD_l_endSlider; SD_l_RecNeedssaving; SD_l_StartSlider; SD_l_TabWidth; SD_l_TopSplitter; WS_l_SELECTEDDIARYVIEWTAB; WS_l_SELECTEDDIARYVIEWTABOLD)
	C_TEXT:C284($_t_oldMethodName; SD_t_AgendaEndTime; SD_t_AgendaStartTime; SD_t_CurrentDiaryInitials; SD_t_DayindicatorVarName; SD_t_Periodstr; SD_t_PeriodStrOLD)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Diary_ViewAG.Variable108"; Form event code:C388)
//◊SuperDiary
//$err:=AG REFRESH (SD_l_AGENDA;AG_False ) AGENDA OUT
SD_bo_AgendaSetup:=False:C215

CB_ScheduleFUllPage2:=Int:C8(CB_l_ScheduleFullPage-1)
If (CB_l_ScheduleFullPage>0)
	GET WINDOW RECT:C443($_l_WindowLeft2; $_l_WindowTop2; $_l_WindowRight2; $_l_WindowBottom2)
	OBJECT GET COORDINATES:C663(WS_at_DiaryVIewTab; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
	SD_l_TabWidth:=$_l_ObjectRight-$_l_WindowLeft
	OBJECT MOVE:C664(WS_at_DiaryVIewTab; $_l_WindowLeft; $_l_WindowTop; ($_l_WindowRight2-$_l_WindowLeft2)-10; $_l_ObjectBottom; *)
	
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
	GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_ObjectRight; $_l_ObjectBottom)
	OBJECT GET COORDINATES:C663(WS_at_DiaryVIewTab; $_l_TabObjectLeft; $_l_TabObjectTop; $_l_TabObjectRight; $_l_TabObjectBottom)
	$_l_TabWidth:=($_l_TabObjectRight-$_l_TabObjectLeft)
	//MOVE OBJECT(CB_ScheduleFullPage2;($_l_TabObjectRight+10);($_l_TabObjectTop+5);($_l_TabObjectRight+5+80);($_l_TabObjectBottom-5);*)
	SD_bo_NoAgendaEvent:=True:C214
	OBJECT MOVE:C664(SD_t_AgendaStartTime; $_l_TabObjectLeft; $_l_TabObjectBottom+1; $_l_TabObjectLeft+($_l_TabWidth/2); $_l_TabObjectBottom+1+(12); *)
	OBJECT MOVE:C664(SD_t_AgendaEndTime; $_l_TabObjectRight-($_l_TabWidth/2); $_l_TabObjectBottom+1; $_l_TabObjectRight; $_l_TabObjectBottom+1+(12); *)
	$_l_TabObjectBottom:=$_l_TabObjectBottom+12
	OBJECT MOVE:C664(SD_l_StartSlider; $_l_TabObjectLeft; $_l_TabObjectBottom+1; $_l_TabObjectLeft+($_l_TabWidth/2); $_l_TabObjectBottom+1+(12); *)
	OBJECT MOVE:C664(SD_l_endSlider; $_l_TabObjectRight-($_l_TabWidth/2); $_l_TabObjectBottom+1; $_l_TabObjectRight; $_l_TabObjectBottom+1+(12); *)
	$_l_TabObjectBottom:=$_l_TabObjectBottom+20
	SD_bo_NoAgendaEvent:=True:C214
	
	If (Size of array:C274(SD_ad_TaskDate)=0)
		OBJECT MOVE:C664(*; "oAGENDAVIEW2"; $_l_TabObjectLeft; ($_l_TabObjectBottom+1); (($_l_ObjectRight-$_l_WindowLeft)-3); (($_l_ObjectBottom-$_l_WindowTop)-10); *)
		//SET VISIBLE(SD_l_AreaListEvents2;False)
		OBJECT SET VISIBLE:C603(SD_at_ToDoList2; False:C215)
	Else 
		$_l_TasksCount:=Size of array:C274(SD_ad_TaskDate)*18
		If ($_l_TasksCount<100)
			$_l_TasksCount:=100
		End if 
		If ($_l_TasksCount>(($_l_ObjectBottom-$_l_WindowTop)/2))
			//IT WILL TAKE UP MORE THAN HALF THE PAGE
			$_l_TasksCount:=($_l_ObjectBottom-$_l_WindowTop)/2
		End if 
		//SET VISIBLE(SD_l_AreaListEvents2;True)
		OBJECT MOVE:C664(*; "oAGENDAVIEW2"; $_l_TabObjectLeft; ($_l_TabObjectBottom+1); (($_l_ObjectRight-$_l_WindowLeft)-3); (($_l_ObjectBottom-$_l_WindowTop)-($_l_TasksCount+20)); *)
		OBJECT GET COORDINATES:C663(*; "oAGENDAVIEW2"; $_l_TabObjectLeft; $_l_TabObjectTop; $_l_TabObjectRight; $_l_TabObjectBottom)
		OBJECT MOVE:C664(SD_at_ToDoList2; $_l_TabObjectLeft; ($_l_TabObjectBottom+20); ($_l_TabObjectRight); (($_l_ObjectBottom-$_l_WindowTop)-2); *)
		
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
	$_l_MaxTabs:=3
	SD_TabManager($_l_MaxTabs)
	Cache_Update(WS_l_SELECTEDDIARYVIEWTAB; SD_d_StartDate; SD_d_EndDate; SD_t_CurrentDiaryInitials; ->SD3_al_CacheCurrentPage; ->SD3_ad_CacheStartDateRange; ->SD3_ad_CacheEndDateRange; ->SD3_at_CacheEndPerson)
	
	SD_t_DayindicatorVarName:="vD"+String:C10(Day of:C23(SD_D_CurrentviewDate))
	//End if
	
	SD_l_RecNeedssaving:=0
	
End if 
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Diary_ViewAG.Variable108"; $_t_oldMethodName)
