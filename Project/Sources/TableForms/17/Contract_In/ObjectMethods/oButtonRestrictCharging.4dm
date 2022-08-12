If (False:C215)
	//object Name: [CONTRACTS]Contract_in.oRestrictCharging
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTRACTS].Contract_in.oRestrictCharging"; Form event code:C388)
FORM GOTO PAGE:C247(4)
ERR_MethodTrackerReturn("OBJ [CONTRACTS].Contract_in.oRestrictCharging"; $_t_oldMethodName)