If (False:C215)
	//object Name: [USER]PWGroupsManager.oPWCancelGroups
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/11/2009 22:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(pw_bo_save)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].PWGroupsManager.oPWCancelGroups"; Form event code:C388)
pw_bo_save:=False:C215
ERR_MethodTrackerReturn("OBJ [USER].PWGroupsManager.oPWCancelGroups"; $_t_oldMethodName)