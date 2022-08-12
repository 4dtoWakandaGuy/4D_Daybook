//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(SD_bo_AddingDiaryRecord)
	C_LONGINT:C283(SD_l_EditingDiaryRecord; SD_l_RECNEEDSSAVING)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Diary_ViewAG.Pop-up/Drop-down List2"; Form event code:C388)
SD_l_RecNeedssaving:=1
SD_l_EditingDiaryRecord:=1
SD_bo_AddingDiaryRecord:=True:C214
If (Modified record:C314([DIARY:12]))
	SuperDiary_SaveChk
End if 
CACHE_SCPT_aCachedSelectionNAME
SD_DIARYSELECTIONMANAGER
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Diary_ViewAG.Pop-up/Drop-down List2"; $_t_oldMethodName)
