//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_DIARYSELECTIONMANAGER
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
	//ARRAY TEXT(SD3_at_CacheEndPerson;0)
	C_TEXT:C284($SD_t_CurrentDiaryInitials)
	//Array DATE(SD3_ad_CacheEndDateRange;0)
	//Array DATE(SD3_ad_CacheStartDateRange;0)
	//Array LONGINT(SD3_al_CacheCurrentPage;0)
	//Array POINTER(CONT_aPtr_LBSetup;0)
	//Array TEXT(WS_at_DiaryVIewTab;0)
	C_DATE:C307(SD_D_CurrentViewDate; SD_D_CurrentViewDateOLD; SD_d_EndDate; SD_d_EndDateOLD; SD_d_StartDate; SD_d_StartDateOLD)
	C_LONGINT:C283(SD_l_DiaryVIewType; SD3_l_DiaryActionNum; WS_l_CachedSelectionName; WS_l_DiaryViewTABOld; WS_l_SELECTEDDIARYVIEWTAB)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_oldMethodName; SD_t_CurrentDiaryInitials; SD_t_LastQuery; SD_t_Periodstr; SD_t_PeriodStrOLD)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_DIARYSELECTIONMANAGER")
$SD_t_CurrentDiaryInitials:=SD_t_CurrentDiaryInitials
WS_at_DiaryVIewTab:=SD3_al_CacheCurrentPage{WS_l_CachedSelectionName}
SD_d_StartDate:=SD3_ad_CacheStartDateRange{WS_l_CachedSelectionName}
SD_d_EndDate:=SD3_ad_CacheEndDateRange{WS_l_CachedSelectionName}
SD_t_CurrentDiaryInitials:=SD3_at_CacheEndPerson{WS_l_CachedSelectionName}

Case of 
	: (WS_at_DiaryVIewTab=1) | (WS_at_DiaryVIewTab=2) | (WS_at_DiaryVIewTab=3)  //monthly view
		If (WS_l_SELECTEDDIARYVIEWTAB=4)
			SD_d_StartDate:=SD_d_StartDateOLD
			SD_d_StartDateOLD:=!00-00-00!
			SD_d_EndDate:=SD_d_EndDateOLD
			SD_d_EndDateOLD:=!00-00-00!
			SD_t_PeriodStrOLD:=SD_t_Periodstr
			SD_t_Periodstr:=""
			SD_D_CurrentViewDate:=SD_D_CurrentViewDateOLD
			SD_D_CurrentViewDateOLD:=!00-00-00!
		End if 
		
		SD_TabManager
	: (WS_at_DiaryVIewTab=4)
		If (SD_d_StartDateOLD=!00-00-00!)
			WS_l_DiaryViewTABOld:=WS_at_DiaryVIewTab
			SD_d_StartDateOLD:=SD_d_StartDate
			SD_d_EndDateOLD:=SD_d_EndDate
			SD_t_PeriodStrOLD:=SD_t_Periodstr
			SD_D_CurrentViewDateOLD:=SD_D_CurrentViewDate
		End if 
		
		
		
		
		SD_l_DiaryVIewType:=-1
		SDiary_HL_QueryDiary(""; !00-00-00!; !00-00-00!; -1)
		If (False:C215)  //NG August 2004
			SDiary_HL_DisplayDiary(SD_d_StartDate; SD_d_EndDate)
		Else 
			//ALArrDefFill (->CONT_aPtr_LBSetup;->SD_l_ALQ;->[DIARY];->[DIARY]Diary Code;"Blue";"ALModDiary";"411111000";"Diary_InNEW";"01211";◊User;"";"Diary";"Diary";->[DIARY];->[DIARY]Diary Code)
			LBi_ArrDefFill(->CONT_aPtr_LBSetup; ->SD_LB_Items; ->[DIARY:12]Diary_Code:3; ->[DIARY:12]Diary_Code:3; "411111000"; "Diary_InNEW"; 11; "Diary"; "Diary"; <>PER_t_CurrentUserInitials)  // 17/06/06 pb
			LBi_Prefs11(->CONT_aPtr_LBSetup)
			//   : ($c1="P")
			//  ALSetScroll0 (»aAlloIPtrs)`enable this once set up allocations
			LBi_LoadSetup(->CONT_aPtr_LBSetup; "B")
			//AL_SetDividers (SD_l_ALQ;"Gray";"Gray";243;"Gray";"Gray";243)
			
			//AL_UpdateArrays (SD_l_ALQ;-1)
		End if 
		
		ARRAY TEXT:C222(WS_at_DiaryVIewTab; 4)
		WS_at_DiaryVIewTab{4}:="Diary Items"
		WS_at_DiaryVIewTab:=4
		SD3_l_DiaryActionNum:=0
		
		FORM GOTO PAGE:C247(2)
	: (WS_at_DiaryVIewTab=0)
		If (SD_d_StartDateOLD=!00-00-00!)
			WS_l_DiaryViewTABOld:=WS_at_DiaryVIewTab
			SD_d_StartDateOLD:=SD_d_StartDate
			SD_d_EndDateOLD:=SD_d_EndDate
			SD_t_PeriodStrOLD:=SD_t_Periodstr
			SD_D_CurrentViewDateOLD:=SD_D_CurrentViewDate
		End if 
		
		SD_t_CurrentDiaryInitials:=$SD_t_CurrentDiaryInitials
		SD_l_DiaryVIewType:=-1
		SDiary_HL_QueryDiary(""; !00-00-00!; !00-00-00!; -1)
		ARRAY TEXT:C222(WS_at_DiaryVIewTab; 4)
		WS_at_DiaryVIewTab{4}:="Diary Items"
		WS_at_DiaryVIewTab:=4
		WS_l_SELECTEDDIARYVIEWTAB:=4
		Cache_Update(WS_l_SELECTEDDIARYVIEWTAB; SD_d_StartDate; SD_d_EndDate; SD_t_CurrentDiaryInitials; ->SD3_al_CacheCurrentPage; ->SD3_ad_CacheStartDateRange; ->SD3_ad_CacheEndDateRange; ->SD3_at_CacheEndPerson)
		WS_l_CachedSelectionName:=Size of array:C274(SD3_al_CacheCurrentPage)
		If (False:C215)  //NG August 2004
			SDiary_HL_DisplayDiary(SD_d_StartDate; SD_d_EndDate)
		Else 
			//ALArrDefFill (->CONT_aPtr_LBSetup;->SD_l_ALQ;->[DIARY];->[DIARY]Diary Code;"Blue";"ALModDiary";"411111000";"Diary_InNEW";"01211";◊User;"";"Diary";"Diary";->[DIARY];->[DIARY]Diary Code)
			LBi_ArrDefFill(->CONT_aPtr_LBSetup; ->SD_LB_Items; ->[DIARY:12]Diary_Code:3; ->[DIARY:12]Diary_Code:3; "411111000"; "Diary_InNEW"; 11; "Diary"; "Diary"; <>PER_t_CurrentUserInitials)  // 17/06/06 pb
			LBi_Prefs11(->CONT_aPtr_LBSetup)
			LBi_LoadSetup(->CONT_aPtr_LBSetup; "B")
			//AL_SetDividers (SD_l_ALQ;"Grey";"";241;"Light Grey";"";242)
			//AL_UpdateArrays (SD_l_ALQ;-1)
			
		End if 
		ARRAY TEXT:C222(WS_at_DiaryVIewTab; 4)
		WS_at_DiaryVIewTab{4}:="Diary Items"
		WS_at_DiaryVIewTab:=4
		SD3_l_DiaryActionNum:=0
		
		FORM GOTO PAGE:C247(2)
		
End case 
SD_D_CurrentviewDate:=SD_d_EndDate
SD_t_Periodstr:=Uppercase:C13(MonthName(SD_D_CurrentviewDate))+" "+String:C10(Year of:C25(SD_D_CurrentviewDate))
WS_l_SELECTEDDIARYVIEWTAB:=WS_at_DiaryVIewTab
Case of 
	: (WS_at_DiaryVIewTab=1)
		OBJECT SET VISIBLE:C603(SD_D_CurrentViewDate; True:C214)
		OBJECT SET VISIBLE:C603(SD_t_Periodstr; False:C215)
	: (WS_at_DiaryVIewTab=2)
		SD_t_Periodstr:=String:C10(SD_d_StartDate)+" -"+String:C10(SD_d_EndDate)
		OBJECT SET VISIBLE:C603(SD_D_CurrentViewDate; False:C215)
		OBJECT SET VISIBLE:C603(SD_t_Periodstr; True:C214)
	: (WS_at_DiaryVIewTab=3)
		OBJECT SET VISIBLE:C603(SD_D_CurrentViewDate; False:C215)
		OBJECT SET VISIBLE:C603(SD_t_Periodstr; True:C214)
	Else 
		SD_t_Periodstr:=SD_t_LastQuery
		SD_t_LastQuery:=""
		OBJECT SET VISIBLE:C603(SD_D_CurrentViewDate; False:C215)
		OBJECT SET VISIBLE:C603(SD_t_Periodstr; True:C214)
End case 
ERR_MethodTrackerReturn("SD_DIARYSELECTIONMANAGER"; $_t_oldMethodName)