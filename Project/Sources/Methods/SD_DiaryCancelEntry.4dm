//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_DiaryCancelEntry
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
	C_BOOLEAN:C305(SD_bo_AddingDiaryRecord; SD_bo_RecordModified)
	C_DATE:C307(SD_D_CurrentviewDate)
	C_LONGINT:C283($_l_DayNumber; SD_l_EditingDiaryRecord)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_DiaryCancelEntry")
//◊SuperDiary
SD_l_EditingDiaryRecord:=0
SD_SetFieldsFalse
WT_hl_DiaryDETAIL3
$_l_DayNumber:=Day number:C114(SD_D_CurrentviewDate)
SD_TabManager

//********************************************
//********************************************
SD_bo_RecordModified:=False:C215

SD_bo_AddingDiaryRecord:=False:C215
ERR_MethodTrackerReturn("SD_DiaryCancelEntry"; $_t_oldMethodName)
