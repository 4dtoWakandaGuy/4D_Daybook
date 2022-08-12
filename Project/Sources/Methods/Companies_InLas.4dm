//%attributes = {}
If (False:C215)
	//Project Method Name:      Companies_InLas
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:42
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

$_t_oldMethodName:=ERR_MethodTracker("Companies_InLas")
If (DB_GetModuleSettingByNUM(14)<2)
	Gen_Alert("You do not have access to the Campaign Manager Module"; "Cancel")
Else 
	FORM GOTO PAGE:C247(4)
End if 
ERR_MethodTrackerReturn("Companies_InLas"; $_t_oldMethodName)