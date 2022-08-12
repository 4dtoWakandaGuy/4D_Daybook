If (False:C215)
	//object Name: Object Name:      SD2_WFManager.oFilterPriorityPOP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 12:36
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

$_t_oldMethodName:=ERR_MethodTracker("OBJ SD2_WFManager.oFilterPriorityPOP")

$_t_oldMethodName:=ERR_MethodTracker("OBJ SD2_WFManager.oFilterPriorityPOP"; Form event code:C388)
If (SD2_at_PriorityNM>0)
	SD_l_priorityQuery:=SD2_al_Priority{SD2_at_PriorityNM}
	SD2_S5_PriorityFIlter:=String:C10(SD_l_priorityQuery)
	SD2_at_PriorityNM:=0
	
End if 
ERR_MethodTrackerReturn("OBJ SD2_WFManager.oFilterPriorityPOP"; $_t_oldMethodName)
