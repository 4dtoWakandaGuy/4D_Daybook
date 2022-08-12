If (False:C215)
	//object Name: [PERSONNEL]Diary_ViewAG.Check Box2
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
	C_DATE:C307(SD_d_EndDate; SD_d_StartDate)
	C_LONGINT:C283($_l_event; SD_l_DiaryVIewType; SD_l_IncludeCompleted; WS_l_CachedSelectionName)
	C_TEXT:C284($_t_oldMethodName; SD_t_CurrentDiaryInitials)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Diary_ViewAG.Check Box2"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		SD_IncludeExclude
		SD_SETViews
		Case of 
			: (FORM Get current page:C276=1)
				SDiary_HL_QueryDiary(SD_t_CurrentDiaryInitials; SD_d_StartDate; SD_d_EndDate)
				SDiary_HL_DisplayDiary(SD_d_StartDate; SD_d_EndDate)
			: (FORM Get current page:C276=2)
				If (SD_l_IncludeCompleted=0)
					QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Done:14=False:C215)
				End if 
				SD_l_DiaryVIewType:=-1
				SDiary_HL_QueryDiary(""; !00-00-00!; !00-00-00!; SD_l_DiaryVIewType)
				WS_l_CachedSelectionName:=0
				SD_DIARYSELECTIONMANAGER
				
		End case 
		
End case 
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Diary_ViewAG.Check Box2"; $_t_oldMethodName)
