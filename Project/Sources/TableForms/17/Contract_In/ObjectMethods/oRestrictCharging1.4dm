If (False:C215)
	//object Name: [CONTRACTS]Contract_in.oRestrictCharging1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/06/2011 14:49
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

$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTRACTS].Contract_in.oRestrictCharging1"; Form event code:C388)
FORM GOTO PAGE:C247(3)
ERR_MethodTrackerReturn("OBJ:Contract_in,CON_l_RestrictCharging"; $_t_oldMethodName)