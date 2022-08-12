If (False:C215)
	//object Name: [PERSONNEL]Diary_View.3D Button27
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
	C_BOOLEAN:C305(SD_bo_AddingDiaryRecord)
	C_LONGINT:C283(SD_l_EditingDiaryRecord; SD_l_RECNEEDSSAVING)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Diary_View.3D Button27"; Form event code:C388)
SD_l_RecNeedssaving:=1
SD_l_EditingDiaryRecord:=1
SD_bo_AddingDiaryRecord:=True:C214
If (Modified record:C314([DIARY:12]))
	SuperDiary_SaveChk
End if 
Cache_SCPT_PreviousSelection
SD_DIARYSELECTIONMANAGER
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Diary_View.3D Button27"; $_t_oldMethodName)
