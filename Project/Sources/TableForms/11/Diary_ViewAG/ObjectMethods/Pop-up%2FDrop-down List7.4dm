If (False:C215)
	//object Name: [PERSONNEL]Diary_ViewAG.Pop-up%2FDrop-down List7
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
	//ARRAY TEXT(SD_AppointmentSort;0)
	C_LONGINT:C283(SD_l_AppointmentSortOrder)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Diary_ViewAG.Pop-up/Drop-down List7"; Form event code:C388)
If (SD_AppointmentSort>0)
	SD_l_AppointmentSortOrder:=SD_AppointmentSort
	SD_HL_Sort(2)
	SD_AppointmentSort:=0
	
End if 
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Diary_ViewAG.Pop-up/Drop-down List7"; $_t_oldMethodName)
