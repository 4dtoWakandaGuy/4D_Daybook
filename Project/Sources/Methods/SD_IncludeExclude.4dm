//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_IncludeExclude
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/03/2010 13:21
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//Array LONGINT(<>SD_al_CombineGroupDiaries;0)
	//Array LONGINT(<>SD_al_CombinePersonDiaries;0)
	//Array LONGINT(<>SD_al_CombineResourceDiaries;0)
	C_LONGINT:C283(SD_l_IncludeCompleted)
	C_TEXT:C284($_t_oldMethodName; SD_t_CurrentDiaryOwnerName; SD_t_LabelTodo; SD_t_priorityText; SD_t_TodoText; SD_T_CurrentDiary)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_IncludeExclude")
//this method
//initially called from the menu bar in the diary
//allow the user to toggle to show/not show completed items
If (Count parameters:C259>=1)
	//set the value to the parameter
	//and set the menu item
	If (SD_l_IncludeCompleted=1)
		DB_MenuAction("View"; "Show Completed Items"; 4; "18"; Frontmost process:C327)
	Else 
		DB_MenuAction("View"; "Show Completed Items"; 4; "")
	End if 
	
Else 
	//called from the menu
	//toggle on or off
	Case of 
		: (SD_l_IncludeCompleted=1)
			SD_l_IncludeCompleted:=0
		Else 
			SD_l_IncludeCompleted:=1
	End case 
	SD_IncludeExclude(SD_l_IncludeCompleted)
	
End if 
Case of 
	: (SD_l_IncludeCompleted=1)
		SD_t_LabelTodo:="To Do"  // CONTEXTUAL
		
	Else 
		SD_t_LabelTodo:="All Items"  // CONTEXTUAL
		
End case 
Case of 
	: (SD_l_IncludeCompleted=1)
		SD_t_TodoText:=" -  All Items  "
	Else 
		SD_t_TodoText:=" -  To Do  "
End case 
If (Size of array:C274(<>SD_al_CombineGroupDiaries)>0) | (Size of array:C274(<>SD_al_CombinePersonDiaries)>0) | (Size of array:C274(<>SD_al_CombineResourceDiaries)>0)
	SD_T_CurrentDiary:="Multiple Diaries"+SD_t_TodoText+SD_t_priorityText
Else 
	SD_T_CurrentDiary:=SD_t_CurrentDiaryOwnerName+" Diary "+SD_t_TodoText+SD_t_priorityText
End if 
ERR_MethodTrackerReturn("SD_IncludeExclude"; $_t_oldMethodName)