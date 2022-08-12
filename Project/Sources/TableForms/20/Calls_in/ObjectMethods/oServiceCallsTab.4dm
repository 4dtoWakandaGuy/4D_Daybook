If (False:C215)
	//object Name: [SERVICE_CALLS]Calls_in.Variable1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:28
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SVA_al_ServiceTabPage;0)
	//ARRAY TEXT(SVS_at_ServiceTab;0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [SERVICE_CALLS].Calls_in.Variable1"; Form event code:C388)
FORM GOTO PAGE:C247(SVA_al_ServiceTabPage{SVS_at_ServiceTab})
SVS_SetFieldPositions(True:C214; SVA_al_ServiceTabPage{SVS_at_ServiceTab})
ERR_MethodTrackerReturn("OBJ [SERVICE_CALLS].Calls_in.Variable1"; $_t_oldMethodName)