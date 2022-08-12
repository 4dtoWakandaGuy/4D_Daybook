If (False:C215)
	//object Name: Object Name:      CodeAnalysis_FormScanner.Invisible Button
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/11/2012 14:58
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

$_t_oldMethodName:=ERR_MethodTracker("OBJ CodeAnalysis_FormScanner.Invisible Button"; Form event code:C388)

BEEP:C151
ERR_MethodTrackerReturn("OBJ CodeAnalysis_FormScanner.Invisible Button"; $_t_oldMethodName)