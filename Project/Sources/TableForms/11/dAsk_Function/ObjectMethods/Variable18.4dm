If (False:C215)
	//object Name: [PERSONNEL]dAsk_Function.Variable18
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:08
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].dAsk_Function.Variable18"; Form event code:C388)
INT_SaveMyPreference
ERR_MethodTrackerReturn("OBJ [PERSONNEL].dAsk_Function.Variable18"; $_t_oldMethodName)
