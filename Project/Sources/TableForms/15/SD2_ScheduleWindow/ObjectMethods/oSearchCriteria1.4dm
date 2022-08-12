If (False:C215)
	//object Name: [USER]SD2_ScheduleWindow.oSearchCriteria1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/01/2013 19:13
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; SD2_T_SearchValue)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_ScheduleWindow.oSearchCriteria1"; Form event code:C388)
GOTO OBJECT:C206(SD2_T_SearchValue)
ERR_MethodTrackerReturn("OBJ [USER].SD2_ScheduleWindow.oSearchCriteria1"; $_t_oldMethodName)