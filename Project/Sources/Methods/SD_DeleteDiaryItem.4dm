//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_DeleteDiaryItem
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
	//ARRAY TEXT(WS_at_DiaryVIewTab;0)
	C_BOOLEAN:C305(SD_bo_RecordModified)
	C_DATE:C307(SD_D_CurrentviewDate)
	C_LONGINT:C283($_l_DayNumber; SD_l_EditingDiaryRecord; WS_l_SELECTEDDIARYVIEWTAB)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_DeleteDiaryItem")
//◊SuperDiary

CONFIRM:C162("Are you sure you wish"+" to delete this diary item"; "No"; "Yes")
If (OK=0)
	READ WRITE:C146([DIARY:12])
	LOAD RECORD:C52([DIARY:12])
	
	SD_l_EditingDiaryRecord:=0
	[DIARY:12]Deleted:43:=1
	DB_SaveRecord(->[DIARY:12])
	AA_CheckFileUnlocked(->[DIARY:12]x_ID:50)
End if 

WT_hl_DiaryDETAIL3
$_l_DayNumber:=Day number:C114(SD_D_CurrentviewDate)
Case of 
	: (WS_at_DiaryVIewTab=1) | (WS_at_DiaryVIewTab=2) | (WS_at_DiaryVIewTab=3)  //monthly view
		SD_TabManager
	: (WS_at_DiaryVIewTab=4)  //QUERY view
		
		QUERY:C277([DIARY:12]; [DIARY:12]Diary_Code:3="-1")
		READ ONLY:C145([DIARY:12])
		
End case 
WS_l_SELECTEDDIARYVIEWTAB:=WS_at_DiaryVIewTab
//********************************************
//********************************************
SD_bo_RecordModified:=False:C215
ERR_MethodTrackerReturn("SD_DeleteDiaryItem"; $_t_oldMethodName)
