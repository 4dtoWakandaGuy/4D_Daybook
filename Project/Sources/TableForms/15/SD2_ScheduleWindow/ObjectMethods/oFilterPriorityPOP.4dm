If (False:C215)
	//object Name: [USER]SD2_ScheduleWindow.oFilterPriorityPOP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/01/2013 15:54
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SD2_al_Priority;0)
	//ARRAY TEXT(SD2_at_PriorityNM;0)
	C_LONGINT:C283(SD_l_priorityQuery)
	C_TEXT:C284($_t_oldMethodName; SD2_S5_PriorityFIlter)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_ScheduleWindow.oFilterPriorityPOP"; Form event code:C388)
If (SD2_at_PriorityNM>0)
	SD_l_priorityQuery:=SD2_al_Priority{SD2_at_PriorityNM}
	SD2_S5_PriorityFIlter:=String:C10(SD_l_priorityQuery)
	SD2_at_PriorityNM:=0
	
End if 
ERR_MethodTrackerReturn("OBJ [USER].SD2_ScheduleWindow.oFilterPriorityPOP"; $_t_oldMethodName)
