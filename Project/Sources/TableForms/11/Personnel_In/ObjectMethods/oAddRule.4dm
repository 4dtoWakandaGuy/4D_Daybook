If (False:C215)
	//object Method Name: Object Name:      [PERSONNEL].Personnel_In.oAddRule
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
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Personnel_In.Variable38"; Form event code:C388)
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Personnel_In.Variable38"; $_t_oldMethodName)