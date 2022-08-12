If (False:C215)
	//object Name: [USER]User_In.oCallStates
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2009 13:38
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SVS_at_CallStateCodes;0)
	//ARRAY TEXT(SVS_at_CallStates;0)
	C_TEXT:C284($_t_oldMethodName; SVS_t_ResolvedCallState; SVS_t_resolvedStateNM)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.oCallStates"; Form event code:C388)

SVS_t_resolvedStateNM:=SVS_at_CallStates{SVS_at_CallStates}
SVS_t_ResolvedCallState:=SVS_at_CallStateCodes{SVS_at_CallStates}
ERR_MethodTrackerReturn("OBJ [USER].User_In.oCallStates"; $_t_oldMethodName)