If (False:C215)
	//object Name: [PERSONNEL]Diary_ViewAG.Variable47
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
	//ARRAY TEXT(SD_at_EventSort;0)
	C_LONGINT:C283(SD_l_EventSortOrder)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Diary_ViewAG.Variable47"; Form event code:C388)
If (SD_at_EventSort>0)
	SD_l_EventSortOrder:=SD_at_EventSort
	SD_HL_Sort(1)
	SD_at_EventSort:=0
	
End if 
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Diary_ViewAG.Variable47"; $_t_oldMethodName)
