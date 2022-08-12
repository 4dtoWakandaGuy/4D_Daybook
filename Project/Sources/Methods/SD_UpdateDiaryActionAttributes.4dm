//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_UpdateDiaryActionAttributes
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
	C_LONGINT:C283(SD2_l_ActionInDone; SD2_l_ActionInSchedule; SD2_l_ActionInWorkflow)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_UpdateDiaryActionAttributes")
//This method populates the [ACTIONS]xActionAttributes
//it does not do any save
SET BLOB SIZE:C606([ACTIONS:13]xActionAttributes:11; 0)
VARIABLE TO BLOB:C532(SD2_l_ActionInSchedule; [ACTIONS:13]xActionAttributes:11; *)
VARIABLE TO BLOB:C532(SD2_l_ActionInWorkflow; [ACTIONS:13]xActionAttributes:11; *)
VARIABLE TO BLOB:C532(SD2_l_ActionInDone; [ACTIONS:13]xActionAttributes:11; *)
ERR_MethodTrackerReturn("SD_UpdateDiaryActionAttributes"; $_t_oldMethodName)