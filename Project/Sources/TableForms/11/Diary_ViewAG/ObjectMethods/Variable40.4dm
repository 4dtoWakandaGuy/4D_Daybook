If (False:C215)
	//object Method Name: Object Name:      [PERSONNEL].Diary_ViewAG.Variable40
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
	//ARRAY LONGINT(<>SD_al_CombineGroupDiaries;0)
	//ARRAY LONGINT(<>SD_al_CombinePersonDiaries;0)
	//ARRAY LONGINT(<>SD_al_CombineResourceDiaries;0)
	//ARRAY LONGINT(SD_al_ActionCodesOST;0)
	//ARRAY LONGINT(SD_al_ActionTime;0)
	//ARRAY LONGINT(SD_al_PersonClass;0)
	//ARRAY LONGINT(SD3_al_CacheCurrentPage;0)
	//ARRAY TEXT(SD_at_ActionCodes;0)
	//ARRAY TEXT(SD_at_ActioncodesOST;0)
	//ARRAY TEXT(SD_at_DiaryActionNames;0)
	//ARRAY TEXT(SD_at_DiaryOwners;0)
	//ARRAY TEXT(SD_at_PersonInitials;0)
	//ARRAY TEXT(SD_at_ResultCodes;0)
	//ARRAY TEXT(SD_at_ResultNames;0)
	//ARRAY TEXT(SD_at_SelectPersonInitials;0)
	//ARRAY TEXT(SD_at_SelectPersonNames;0)
	//ARRAY TEXT(SD3_at_CacheEndPerson;0)
	//ARRAY TEXT(WS_at_DiaryVIewTab;0)
	C_BOOLEAN:C305(SD_bo_AlarmsEnd; SD3_bo_FloatingDiarydisplayed)
	C_DATE:C307(SD_D_CurrentViewDate; SD_D_CurrentViewDateOLD; SD_d_EndDate; SD_d_EndDateOLD; SD_d_StartDate; SD_d_StartDateOLD)
	C_LONGINT:C283(<>PER_l_CurrentUserSepDiaryWindow; $_l_DayNumber; $_l_Index; $_l_MaxTab; $_l_OpenNewWindow; $_l_Process; $_l_ProcessNumber; $_l_ProcessState; $_l_ProcessTime; $_l_WindowBottom; $_l_WindowLeft)
	C_LONGINT:C283($_l_WindowRight; $_l_WindowTop; SD_l_RecNeedssaving; SD3_l_FloatingDiaryList; WS_l_SELECTEDDIARYVIEWTAB; WS_l_SELECTEDDIARYVIEWTABOLD)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_CurrentDiary; $_t_oldMethodName; $_t_SDAlarmProcName; $_t_SDProcessName; $_t_SDUserName; $_t_WindowTitle; SD_T_CurrentDiary; SD_t_CurrentDiaryInitials; SD_t_CurrentDiaryOwnerName; SD_t_DiaryDefaultUser)
	C_TEXT:C284(SD_t_Periodstr; SD_t_PeriodStrOLD; SD_t_priorityText; SD_t_TodoText)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Diary_ViewAG.Variable40"; Form event code:C388)
//◊SuperDiary


If (Self:C308->>0)
	If (SD_at_DiaryOwners{SD_at_DiaryOwners}#SD_t_CurrentDiaryOwnerName)
		SD_l_RecNeedssaving:=1
		If (SD_RecordModified(->[DIARY:12]))
			SuperDiary_SaveChk
		End if 
		Case of 
				
			: (SD_at_PersonInitials{SD_at_DiaryOwners}=SD_t_DiaryDefaultUser)
				If (WS_l_SELECTEDDIARYVIEWTAB=4)
					//back from Page_4
					SD_d_StartDate:=SD_d_StartDateOLD
					SD_d_EndDate:=SD_d_EndDateOLD
					SD_t_PeriodStrOLD:=SD_t_Periodstr
					SD_D_CurrentViewDate:=SD_D_CurrentViewDateOLD
					WS_l_SELECTEDDIARYVIEWTAB:=WS_l_SELECTEDDIARYVIEWTABOLD
				Else 
					WS_l_SELECTEDDIARYVIEWTABOLD:=WS_at_DiaryVIewTab
				End if 
				If (SD_t_DiaryDefaultUser#SD_t_CurrentDiaryInitials)
					$_t_SDAlarmProcName:="Diary reminders "+SD_t_CurrentDiaryInitials
					$_l_ProcessNumber:=Process number:C372($_t_SDAlarmProcName)
					If ($_l_ProcessNumber>0)
						PROCESS PROPERTIES:C336($_l_ProcessNumber; $_t_SDProcessName; $_l_ProcessState; $_l_ProcessTime)
						If ($_l_ProcessState>=0)  // 29/05/02
							SET PROCESS VARIABLE:C370($_l_ProcessNumber; SD_bo_AlarmsEnd; True:C214)
						End if 
					End if 
				End if 
				SD_t_CurrentDiaryOwnerName:=SD_at_DiaryOwners{SD_at_DiaryOwners}
				If ((Size of array:C274(<>SD_al_CombineGroupDiaries)>0) | (Size of array:C274(<>SD_al_CombinePersonDiaries)>0) | (Size of array:C274(<>SD_al_CombineResourceDiaries)>0)) | (SD3_bo_FloatingDiarydisplayed)
					SD_T_CurrentDiary:="Multiple Diaries"+SD_t_TodoText+SD_t_priorityText
				Else 
					SD_T_CurrentDiary:=SD_t_CurrentDiaryOwnerName+" Diary "+SD_t_TodoText+SD_t_priorityText
				End if 
				
				SD_t_CurrentDiaryInitials:=SD_at_PersonInitials{SD_at_DiaryOwners}
				WT_hl_DiaryDETAIL3
				SD_SetFieldsFalse
				$_l_DayNumber:=Day number:C114(SD_D_CurrentviewDate)
				$_l_MaxTab:=3
				SD_TabManager($_l_MaxTab)
				Cache_Update(WS_l_SELECTEDDIARYVIEWTAB; SD_d_StartDate; SD_d_EndDate; SD_t_CurrentDiaryInitials; ->SD3_al_CacheCurrentPage; ->SD3_ad_CacheStartDateRange; ->SD3_ad_CacheEndDateRange; ->SD3_at_CacheEndPerson)
				WS_l_SELECTEDDIARYVIEWTAB:=WS_at_DiaryVIewTab
				QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=SD_t_CurrentDiaryInitials)
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
				$_t_SDUserName:=[PERSONNEL:11]Name:2
				UNLOAD RECORD:C212([PERSONNEL:11])
				$_t_WindowTitle:="Diary: "+$_t_SDUserName
				SET WINDOW TITLE:C213($_t_WindowTitle)
			: (SD_al_PersonClass{SD_at_DiaryOwners}=3)  //it is a resource
				If (Macintosh option down:C545) | (Windows Ctrl down:C562)
					$_l_OpenNewWindow:=2
				Else 
					$_l_OpenNewWindow:=<>PER_l_CurrentUserSepDiaryWindow
					If ($_l_OpenNewWindow=0)
						$_l_OpenNewWindow:=1
					End if 
				End if 
				
				//so open in this window
				If ($_l_OpenNewWindow=1)  //open in this window
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
					//first check if we need to end a monitor process
					If (SD_t_DiaryDefaultUser#SD_t_CurrentDiaryInitials)
						$_t_SDAlarmProcName:="Diary reminders "+SD_t_CurrentDiaryInitials
						$_l_ProcessNumber:=Process number:C372($_t_SDAlarmProcName)
						If ($_l_ProcessNumber>0)
							PROCESS PROPERTIES:C336($_l_ProcessNumber; $_t_SDProcessName; $_l_ProcessState; $_l_ProcessTime)
							If ($_l_ProcessState>=0)  // 29/05/02
								SET PROCESS VARIABLE:C370($_l_ProcessNumber; SD_bo_AlarmsEnd; True:C214)
							End if 
						End if 
					End if 
					
					//````
					SD_t_CurrentDiaryOwnerName:=SD_at_DiaryOwners{SD_at_DiaryOwners}
					If ((Size of array:C274(<>SD_al_CombineGroupDiaries)>0) | (Size of array:C274(<>SD_al_CombinePersonDiaries)>0) | (Size of array:C274(<>SD_al_CombineResourceDiaries)>0)) | (SD3_bo_FloatingDiarydisplayed)
						SD_T_CurrentDiary:="Multiple Diaries"+SD_t_TodoText+SD_t_priorityText
					Else 
						SD_T_CurrentDiary:=SD_t_CurrentDiaryOwnerName+" Diary "+SD_t_TodoText+SD_t_priorityText
					End if 
					SD_t_CurrentDiaryInitials:=SD_at_PersonInitials{SD_at_DiaryOwners}
					WT_hl_DiaryDETAIL3
					SD_SetFieldsFalse
					$_l_DayNumber:=Day number:C114(SD_D_CurrentviewDate)
					$_l_MaxTab:=3
					SD_TabManager($_l_MaxTab)
					Cache_Update(WS_l_SELECTEDDIARYVIEWTAB; SD_d_StartDate; SD_d_EndDate; SD_t_CurrentDiaryInitials; ->SD3_al_CacheCurrentPage; ->SD3_ad_CacheStartDateRange; ->SD3_ad_CacheEndDateRange; ->SD3_at_CacheEndPerson)
					WS_l_SELECTEDDIARYVIEWTAB:=WS_at_DiaryVIewTab
					QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=SD_t_CurrentDiaryInitials)
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
					$_t_SDUserName:=[PERSONNEL:11]Name:2
					$_l_Process:=New process:C317("SD_AlarmingEvents"; DB_ProcessMemoryinit(8); "Diary reminders "+SD_t_CurrentDiaryInitials; [PERSONNEL:11]Personnel_ID:48; [PERSONNEL:11]Initials:1)
					UNLOAD RECORD:C212([PERSONNEL:11])
					$_t_WindowTitle:="Diary: "+$_t_SDUserName
					SET WINDOW TITLE:C213($_t_WindowTitle)
				Else 
					$_t_SDProcessName:="View SuperDiary"+"-"+SD_at_PersonInitials{SD_at_DiaryOwners}
					$_l_ProcessNumber:=Process number:C372($_t_SDProcessName)
					PROCESS PROPERTIES:C336($_l_ProcessNumber; $_t_SDProcessName; $_l_ProcessState; $_l_ProcessTime)
					If ($_l_ProcessState<0)
						$_l_ProcessNumber:=0
						$_t_SDProcessName:="View SuperDiary"+"-"+SD_at_PersonInitials{SD_at_DiaryOwners}
					End if 
					If ($_l_ProcessNumber>0)
						SHOW PROCESS:C325($_l_ProcessNumber)
						RESUME PROCESS:C320($_l_ProcessNumber)
						
						BRING TO FRONT:C326($_l_ProcessNumber)
						POST OUTSIDE CALL:C329($_l_ProcessNumber)
					Else 
						ZProc("Diary_Mod_SD"; DB_ProcessMemoryinit(6); $_t_SDProcessName; SD_at_PersonInitials{SD_at_DiaryOwners})
					End if 
					SD_at_DiaryOwners:=1
				End if 
			Else 
				//it is another person
				If (SD_at_DiaryOwners<Size of array:C274(SD_at_DiaryOwners))
					If (Macintosh option down:C545) | (Windows Ctrl down:C562)
						$_l_OpenNewWindow:=2
					Else 
						$_l_OpenNewWindow:=<>PER_l_CurrentUserSepDiaryWindow
						If ($_l_OpenNewWindow=0)
							$_l_OpenNewWindow:=1
						End if 
					End if 
					$_t_CurrentDiary:=SD_SelectOtherUser(<>PER_t_CurrentUserInitials)
					If ($_t_CurrentDiary#"")
						If ($_l_OpenNewWindow=1)  //open in this window
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
							End if 
							If (SD_t_DiaryDefaultUser#SD_t_CurrentDiaryInitials)
								$_t_SDAlarmProcName:="Diary reminders "+SD_t_CurrentDiaryInitials
								$_l_ProcessNumber:=Process number:C372($_t_SDAlarmProcName)
								If ($_l_ProcessNumber>0)
									PROCESS PROPERTIES:C336($_l_ProcessNumber; $_t_SDProcessName; $_l_ProcessState; $_l_ProcessTime)
									If ($_l_ProcessState>=0)  // 29/05/02
										SET PROCESS VARIABLE:C370($_l_ProcessNumber; SD_bo_AlarmsEnd; True:C214)
									End if 
								End if 
							End if 
							SD_t_CurrentDiaryOwnerName:=SD_at_SelectPersonNames{Find in array:C230(SD_at_SelectPersonInitials; $_t_CurrentDiary)}
							If ((Size of array:C274(<>SD_al_CombineGroupDiaries)>0) | (Size of array:C274(<>SD_al_CombinePersonDiaries)>0) | (Size of array:C274(<>SD_al_CombineResourceDiaries)>0)) | (SD3_bo_FloatingDiarydisplayed)
								SD_T_CurrentDiary:="Multiple Diaries"+SD_t_TodoText+SD_t_priorityText
							Else 
								SD_T_CurrentDiary:=SD_t_CurrentDiaryOwnerName+" Diary "+SD_t_TodoText+SD_t_priorityText
							End if 
							SD_t_CurrentDiaryInitials:=$_t_CurrentDiary
							WT_hl_DiaryDETAIL3
							SD_SetFieldsFalse
							// ENABLE BUTTON(bRec_Add)
							$_l_DayNumber:=Day number:C114(SD_D_CurrentviewDate)
							$_l_MaxTab:=3
							SD_TabManager($_l_MaxTab)
							Cache_Update(WS_l_SELECTEDDIARYVIEWTAB; SD_d_StartDate; SD_d_EndDate; SD_t_CurrentDiaryInitials; ->SD3_al_CacheCurrentPage; ->SD3_ad_CacheStartDateRange; ->SD3_ad_CacheEndDateRange; ->SD3_at_CacheEndPerson)
							WS_l_SELECTEDDIARYVIEWTAB:=WS_at_DiaryVIewTab
							QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=SD_t_CurrentDiaryInitials)
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
							$_t_SDUserName:=[PERSONNEL:11]Name:2
							$_l_Process:=New process:C317("SD_AlarmingEvents"; DB_ProcessMemoryinit(8); "Diary reminders "+SD_t_CurrentDiaryInitials; [PERSONNEL:11]Personnel_ID:48; [PERSONNEL:11]Initials:1)
							UNLOAD RECORD:C212([PERSONNEL:11])
							$_t_WindowTitle:="Diary: "+$_t_SDUserName
							SET WINDOW TITLE:C213($_t_WindowTitle)
							
							
						Else 
							$_t_SDProcessName:="Schedule"+"-"+$_t_CurrentDiary
							$_l_ProcessNumber:=Process number:C372($_t_SDProcessName)
							PROCESS PROPERTIES:C336($_l_ProcessNumber; $_t_SDProcessName; $_l_ProcessState; $_l_ProcessTime)
							If ($_l_ProcessState<0)
								$_l_ProcessNumber:=0
								$_t_SDProcessName:="Schedule"+"-"+$_t_CurrentDiary
							End if 
							
							If ($_l_ProcessNumber>0)
								SHOW PROCESS:C325($_l_ProcessNumber)
								RESUME PROCESS:C320($_l_ProcessNumber)
								BRING TO FRONT:C326($_l_ProcessNumber)
								POST OUTSIDE CALL:C329($_l_ProcessNumber)
							Else 
								ZProc("Diary_Mod_SD"; DB_ProcessMemoryinit(6); $_t_SDProcessName; $_t_CurrentDiary)
								
							End if 
							SD_at_DiaryOwners:=1
						End if 
						
					End if 
				Else 
					If (SD3_l_FloatingDiaryList=0)
						GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
						If ($_l_WindowLeft<232)
							SET WINDOW RECT:C444(232; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
						End if 
						
						SD3_l_FloatingDiaryList:=New process:C317("SD_MultiOwnerList"; DB_ProcessMemoryinit(1); "Multi Diary"; SD_t_DiaryDefaultUser)
						
					Else 
						GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
						If ($_l_WindowLeft<232)
							SET WINDOW RECT:C444(232; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
						End if 
						SHOW PROCESS:C325(SD3_l_FloatingDiaryList)
						BRING TO FRONT:C326(SD3_l_FloatingDiaryList)
						SD3_bo_FloatingDiarydisplayed:=True:C214
					End if 
					
				End if 
		End case 
		SD_l_RecNeedssaving:=0
	End if 
End if 
ERR_MethodTrackerReturn("OBJ:Diary_ViewAG,SD_at_DiaryOwners"; $_t_oldMethodName)
