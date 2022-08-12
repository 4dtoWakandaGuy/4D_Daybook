If (False:C215)
	//object Name: [PERSONNEL]Diary_ViewAG.Variable18
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
	//ARRAY DATE(SD3_ad_CacheEndDateRange;0)
	//ARRAY DATE(SD3_ad_CacheStartDateRange;0)
	//ARRAY LONGINT(SD3_al_CacheCurrentPage;0)
	//ARRAY TEXT(SD3_at_CacheEndPerson;0)
	//ARRAY TEXT(WS_at_DiaryVIewTab;0)
	C_DATE:C307(SD_D_CurrentViewDate; SD_D_CurrentViewDateOLD; SD_d_EndDate; SD_d_EndDateOLD; SD_d_StartDate; SD_d_StartDateOLD)
	C_LONGINT:C283($_l_DayNumber; $_l_MaxTab; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; $_l_WindowBottom2; $_l_WindowLeft2; $_l_WindowRight2; $_l_WindowTop2; CB_l_ScheduleFullPage)
	C_LONGINT:C283(SD_l_DIaryPage; SD_l_EditingDiaryRecord; SD_l_RecNeedssaving; SD_l_TabWidth; SD_l_TopSplitter; WS_l_SELECTEDDIARYVIEWTAB; WS_l_SELECTEDDIARYVIEWTABOLD)
	C_TEXT:C284($_t_oldMethodName; SD_t_CurrentDiaryInitials; SD_t_DayindicatorVarName; SD_t_Periodstr; SD_t_PeriodStrOLD)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Diary_ViewAG.Variable18"; Form event code:C388)
//◊SuperDiary
SD_l_RecNeedssaving:=1
If (WS_at_DiaryVIewTab>0) & (WS_l_SELECTEDDIARYVIEWTAB#WS_at_DiaryVIewTab)
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
	$_l_MaxTab:=3
	SD_TabManager($_l_MaxTab)
	Cache_Update(WS_l_SELECTEDDIARYVIEWTAB; SD_d_StartDate; SD_d_EndDate; SD_t_CurrentDiaryInitials; ->SD3_al_CacheCurrentPage; ->SD3_ad_CacheStartDateRange; ->SD3_ad_CacheEndDateRange; ->SD3_at_CacheEndPerson)
	
	SD_t_DayindicatorVarName:="vD"+String:C10(Day of:C23(SD_D_CurrentviewDate))
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
		SD_l_DIaryPage:=3
		
	End if 
	//End if
End if 
SD_l_RecNeedssaving:=0
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Diary_ViewAG.Variable18"; $_t_oldMethodName)
