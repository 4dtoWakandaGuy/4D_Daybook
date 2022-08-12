//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_DiaryViewCalc
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
	//ARRAY LONGINT(<>SD_al_CombineGroupDiaries;0)
	//ARRAY LONGINT(<>SD_al_CombinePersonDiaries;0)
	//ARRAY LONGINT(<>SD_al_CombineResourceDiaries;0)
	//ARRAY LONGINT(SD3_al_CacheCurrentPage;0)
	//ARRAY TEXT(SD_at_DiaryOwners;0)
	//ARRAY TEXT(SD3_at_CacheEndPerson;0)
	C_BOOLEAN:C305(SD3_bo_FloatingDiarydisplayed)
	C_DATE:C307(SD_D_CurrentviewDate; SD_d_EndDate; SD_d_StartDate)
	C_LONGINT:C283($_l_DayNumber; $_l_MaxTabs; SD_l_RecNeedssaving; WS_l_SELECTEDDIARYVIEWTAB)
	C_TEXT:C284($_t_DiaryTitle; $_t_oldMethodName; $_t_SDUserName; SD_T_CurrentDiary; SD_t_CurrentDiaryInitials; SD_t_CurrentDiaryOwnerName; SD_t_priorityText; SD_t_TodoText)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_DiaryViewCalc")
//◊SuperDiary
//SD_DiaryViewCalc: WT-17/08/01
SD_l_RecNeedssaving:=1
If (SD_RecordModified(->[DIARY:12]))
	SuperDiary_SaveChk
End if 
Case of 
	: (SD_at_DiaryOwners=2)
	: ((SD_at_DiaryOwners<2) | (SD_at_DiaryOwners>2))
		// If (SD_at_DiaryOwners{SD_at_DiaryOwners}#SD_t_CurrentDiaryOwnerName) & (
		// $Ref:=Find in array
		//  SD_t_CurrentDiaryOwnerName:=SD_at_DiaryOwners{SD_at_DiaryOwners}
		// SD_t_CurrentDiaryInitials:=SD_at_PersonInitials{SD_at_DiaryOwners}
		//   Else
		//   SD_t_CurrentDiaryOwnerName:=SD_at_DiaryOwners{1}
		//   SD_t_CurrentDiaryInitials:=SD_at_PersonInitials{1}
		//  End if
		WT_hl_DiaryDETAIL3
		SD_SetFieldsFalse
		$_l_DayNumber:=Day number:C114(SD_D_CurrentviewDate)
		$_l_MaxTabs:=3
		
		SD_TabManager(On Clicked:K2:4)
		Cache_Update(WS_l_SELECTEDDIARYVIEWTAB; SD_d_StartDate; SD_d_EndDate; SD_t_CurrentDiaryInitials; ->SD3_al_CacheCurrentPage; ->SD3_ad_CacheStartDateRange; ->SD3_ad_CacheEndDateRange; ->SD3_at_CacheEndPerson)
		
		QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=SD_t_CurrentDiaryInitials)
		$_t_SDUserName:=[PERSONNEL:11]Name:2
		UNLOAD RECORD:C212([PERSONNEL:11])
		$_t_DiaryTitle:="Diary: "+$_t_SDUserName
		SET WINDOW TITLE:C213($_t_DiaryTitle)
End case 
SD_l_RecNeedssaving:=0
If ((Size of array:C274(<>SD_al_CombineGroupDiaries)>0) | (Size of array:C274(<>SD_al_CombinePersonDiaries)>0) | (Size of array:C274(<>SD_al_CombineResourceDiaries)>0)) | (SD3_bo_FloatingDiarydisplayed)
	SD_T_CurrentDiary:="Multiple Diaries"+SD_t_TodoText+SD_t_priorityText
Else 
	SD_T_CurrentDiary:=SD_t_CurrentDiaryOwnerName+" Diary "+SD_t_TodoText+SD_t_priorityText
End if 
ERR_MethodTrackerReturn("SD_DiaryViewCalc"; $_t_oldMethodName)
