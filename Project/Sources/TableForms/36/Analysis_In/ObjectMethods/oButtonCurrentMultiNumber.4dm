If (False:C215)
	//object Name: [ANALYSES]Analysis_In.Variable6
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ANALYSES].Analysis_In.Variable6"; Form event code:C388)
Gen_CodeCurrMN
ERR_MethodTrackerReturn("OBJ [ANALYSES].Analysis_In.Variable6"; $_t_oldMethodName)
