If (False:C215)
	//object Name: [PERSONNEL]Diary_View.Pop-up%2FDrop-down List3
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
	//ARRAY TEXT(SD_at_ToDoSort;0)
	C_LONGINT:C283(SD_l_ToSortOrder)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Diary_View.Pop-up/Drop-down List3"; Form event code:C388)
If (SD_at_ToDoSort>0)
	SD_l_ToSortOrder:=SD_at_ToDoSort
	SD_HL_Sort(3)
	SD_at_ToDoSort:=0
	
End if 
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Diary_View.Pop-up/Drop-down List3"; $_t_oldMethodName)
