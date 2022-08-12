If (False:C215)
	//object Name: [SERVICE_CALLS]Calls_in.oSolutionPopup
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
	//ARRAY TEXT(SC_at_SolutionCodes;0)
	//ARRAY TEXT(SC_at_SolutionTypes;0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [SERVICE_CALLS].Calls_in.oSolutionPopup"; Form event code:C388)
If (SC_at_SolutionTypes>0)
	[SERVICE_CALLS:20]Solution_Code:16:=SC_at_SolutionCodes{SC_at_SolutionTypes}
	QUERY:C277([SOLUTIONS:23]; [SOLUTIONS:23]Solution_Code:1=[SERVICE_CALLS:20]Solution_Code:16)
End if 
ERR_MethodTrackerReturn("OBJ [SERVICE_CALLS].Calls_in.oSolutionPopup"; $_t_oldMethodName)
