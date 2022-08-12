If (False:C215)
	//object Name: Object Name:      SD2_ActionStatus.oExitButtonC
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:03
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(SD2_bo_SaveOnExit)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ SD2_ActionStatus.oExitButtonC"; Form event code:C388)
SD2_bo_SaveOnExit:=False:C215
CANCEL:C270
ERR_MethodTrackerReturn("OBJ SD2_ActionStatus.oExitButtonC"; $_t_oldMethodName)