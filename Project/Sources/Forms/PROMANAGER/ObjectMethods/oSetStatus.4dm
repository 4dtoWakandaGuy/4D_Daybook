If (False:C215)
	//object Name: Object Name:      PROMANAGER.oSetStatus
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/01/2011 23:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(PRO_at_AllStageNames;0)
	C_LONGINT:C283(PRO_l_SetSelected)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ PROMANAGER.oSetStatus"; Form event code:C388)
If (PRO_at_AllStageNames>0)
	OBJECT SET VISIBLE:C603(PRO_l_SetSelected; True:C214)
End if 
ERR_MethodTrackerReturn("OBJ PROMANAGER.oSetStatus"; $_t_oldMethodName)
