If (False:C215)
	//object Name: [PERSONNEL]Diary_View.Variable2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:08
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
	C_LONGINT:C283($_l_DayNumber; $_l_MaxTab; SD_l_EditingDiaryRecord; SD_l_RecNeedssaving; WS_l_SELECTEDDIARYVIEWTAB; WS_l_SELECTEDDIARYVIEWTABOLD)
	C_TEXT:C284($_t_oldMethodName; SD_t_CurrentDiaryInitials; SD_t_DayindicatorVarName; SD_t_Periodstr; SD_t_PeriodStrOLD)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Diary_View.Variable2"; Form event code:C388)
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
	End if 
	//If (WS_at_DiaryVIewTab#Current form page)
	WT_hl_DiaryDETAIL3
	SD_SetFieldsFalse
	$_l_DayNumber:=Day number:C114(SD_D_CurrentviewDate)
	$_l_MaxTab:=3
	SD_TabManager($_l_MaxTab)
	Cache_Update(WS_l_SELECTEDDIARYVIEWTAB; SD_d_StartDate; SD_d_EndDate; SD_t_CurrentDiaryInitials; ->SD3_al_CacheCurrentPage; ->SD3_ad_CacheStartDateRange; ->SD3_ad_CacheEndDateRange; ->SD3_at_CacheEndPerson)
	
	SD_t_DayindicatorVarName:="vD"+String:C10(Day of:C23(SD_D_CurrentviewDate))
	//End if
End if 
SD_l_RecNeedssaving:=0
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Diary_View.Variable2"; $_t_oldMethodName)
