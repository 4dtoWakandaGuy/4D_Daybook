If (False:C215)
	//object Name: [PERSONNEL]Diary_ViewAG.Pop-up%2FDrop-down List5
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/10/2012 18:48
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>SD_al_CombineGroupDiaries;0)
	//ARRAY LONGINT(<>SD_al_CombinePersonDiaries;0)
	//ARRAY LONGINT(<>SD_al_CombineResourceDiaries;0)
	//ARRAY LONGINT(SD_al_PriorityNUM;0)
	//ARRAY TEXT(SD_at_PriorityNM2;0)
	C_BOOLEAN:C305(SD3_bo_FloatingDiarydisplayed)
	C_DATE:C307(SD_d_EndDate; SD_d_StartDate)
	C_LONGINT:C283(SD_l_DiaryVIewType; SD_l_priorityQuery; WS_l_CachedSelectionName)
	C_TEXT:C284($_t_oldMethodName; SD_T_CurrentDiary; SD_t_CurrentDiaryInitials; SD_t_CurrentDiaryOwnerName; SD_t_priorityText; SD_t_TodoText)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Diary_ViewAG.Pop-up/Drop-down List5"; Form event code:C388)
If (SD_at_PriorityNM2>0)
	If (SD_at_PriorityNM2<Size of array:C274(SD_at_PriorityNM2))
		SD_l_priorityQuery:=SD_al_PriorityNUM{SD_at_PriorityNM2}
		SD_t_priorityText:="- "+SD_at_PriorityNM2{SD_at_PriorityNM2}+" Priority"
		SD_at_PriorityNM2:=0
	Else 
		SD_l_priorityQuery:=0
		SD_t_priorityText:=""
		SD_at_PriorityNM2:=0
	End if 
	If ((Size of array:C274(<>SD_al_CombineGroupDiaries)>0) | (Size of array:C274(<>SD_al_CombinePersonDiaries)>0) | (Size of array:C274(<>SD_al_CombineResourceDiaries)>0)) | (SD3_bo_FloatingDiarydisplayed)
		If (Size of array:C274(<>SD_al_CombineGroupDiaries)=0) | (Size of array:C274(<>SD_al_CombinePersonDiaries)=1) | (Size of array:C274(<>SD_al_CombineResourceDiaries)=0)
			
			SD_T_CurrentDiary:="Multiple Diaries"+SD_t_TodoText+SD_t_priorityText
		Else 
			SD_T_CurrentDiary:="Multiple Diaries"+SD_t_TodoText+SD_t_priorityText
		End if 
		
	Else 
		SD_T_CurrentDiary:=SD_t_CurrentDiaryOwnerName+" Diary "+SD_t_TodoText+SD_t_priorityText
	End if 
	Case of 
			
		: (FORM Get current page:C276=1)
			
			SDiary_HL_QueryDiary(SD_t_CurrentDiaryInitials; SD_d_StartDate; SD_d_EndDate)
			SDiary_HL_DisplayDiary(SD_d_StartDate; SD_d_EndDate)
		: (FORM Get current page:C276=2)
			QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Priority:17=String:C10(SD_l_priorityQuery))
			SD_l_DiaryVIewType:=-1
			SDiary_HL_QueryDiary(""; !00-00-00!; !00-00-00!; SD_l_DiaryVIewType)
			WS_l_CachedSelectionName:=0
			SD_DIARYSELECTIONMANAGER
			
			
	End case 
	
	
End if 
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Diary_ViewAG.Pop-up/Drop-down List5"; $_t_oldMethodName)
