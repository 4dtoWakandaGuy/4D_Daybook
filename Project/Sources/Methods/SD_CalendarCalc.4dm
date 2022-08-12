//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_CalendarCalc
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
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
	C_DATE:C307($1; CW_d_SelectDate; SD_D_CurrentviewDate; SD_d_EndDate; SD_d_StartDate; vSD_QuyDiaryDate)
	C_LONGINT:C283($_l_DayNumber; SD_l_RecNeedssaving; SD_l_YearMonthDayTime; WS_l_SELECTEDDIARYVIEWTAB)
	C_TEXT:C284($_t_oldMethodName; SD_t_CurrentDiaryInitials; SD_t_CurrentDiaryOwnerName; SD_t_DiaryDefaultUser; SD_t_Periodstr; vDateString; vSD_QuyDiaryPerson)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_CalendarCalc")
//SD_CalendarCalc
//◊SuperDiary
If (Count parameters:C259>=1)
	SD_D_CurrentviewDate:=$1
End if 

SD_l_RecNeedssaving:=1
If (SD_RecordModified(->[DIARY:12]))
	SuperDiary_SaveChk
End if 
//CW_SetDate (SD_D_CurrentviewDate)
//CW_OpenCalDialog
Case of 
	: (SD_D_CurrentviewDate#!00-00-00!)
		SD_l_YearMonthDayTime:=GEN_TimeDateStamp(SD_D_CurrentviewDate; ?00:00:00?)
	: (vSD_QuyDiaryDate#!00-00-00!)
		SD_D_CurrentviewDate:=vSD_QuyDiaryDate
		SD_l_YearMonthDayTime:=GEN_TimeDateStamp(SD_D_CurrentviewDate; ?00:00:00?)
	Else 
		SD_D_CurrentviewDate:=Current date:C33
		SD_l_YearMonthDayTime:=GEN_TimeDateStamp(Current date:C33; Current time:C178)
End case 
Case of 
	: (vSD_QuyDiaryPerson#"")
		SD_t_CurrentDiaryInitials:=vSD_QuyDiaryPerson
	: (SD_t_CurrentDiaryInitials="")
		SD_t_CurrentDiaryInitials:=SD_t_DiaryDefaultUser
End case 
OK:=1

If (OK=1)
	//SD_D_CurrentviewDate:=Date(String(CW_d_SelectDate;7))
	SD_t_Periodstr:=Uppercase:C13(MonthName(SD_D_CurrentviewDate))+" "+String:C10(Year of:C25(SD_D_CurrentviewDate))
	vDateString:=String:C10(SD_D_CurrentviewDate; 7)
	SD_D_CurrentviewDate:=SD_D_CurrentviewDate
	WT_hl_DiaryDETAIL3
	SD_SetFieldsFalse
	$_l_DayNumber:=Day number:C114(SD_D_CurrentviewDate)
	SD_TabManager
	Cache_Update(WS_l_SELECTEDDIARYVIEWTAB; SD_d_StartDate; SD_d_EndDate; SD_t_CurrentDiaryInitials; ->SD3_al_CacheCurrentPage; ->SD3_ad_CacheStartDateRange; ->SD3_ad_CacheEndDateRange; ->SD3_at_CacheEndPerson)
	
Else 
	SD_D_CurrentviewDate:=Current date:C33
	SD_t_Periodstr:=Uppercase:C13(MonthName(SD_D_CurrentviewDate))+" "+String:C10(Year of:C25(SD_D_CurrentviewDate))
	vDateString:=String:C10(CW_d_SelectDate; 7)
	WT_hl_DiaryDETAIL3
	SD_SetFieldsFalse
	$_l_DayNumber:=Day number:C114(SD_D_CurrentviewDate)
	SD_TabManager
	Cache_Update(WS_l_SELECTEDDIARYVIEWTAB; SD_d_StartDate; SD_d_EndDate; SD_t_CurrentDiaryOwnerName; ->SD3_al_CacheCurrentPage; ->SD3_ad_CacheStartDateRange; ->SD3_ad_CacheEndDateRange; ->SD3_at_CacheEndPerson)
	
End if 

SD_l_RecNeedssaving:=0
ERR_MethodTrackerReturn("SD_CalendarCalc"; $_t_oldMethodName)
