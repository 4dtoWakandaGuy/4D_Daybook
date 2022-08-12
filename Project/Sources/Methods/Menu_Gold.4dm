//%attributes = {}
If (False:C215)
	//Project Method Name:      Menu_Gold
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>Mod_bo_Gold)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Menu_Gold")
If (<>Mod_bo_Gold)
	Module_First(2)
Else 
	Gen_Alert("You do not have access to any Gold modules."; "Cancel")
End if 
ERR_MethodTrackerReturn("Menu_Gold"; $_t_oldMethodName)
