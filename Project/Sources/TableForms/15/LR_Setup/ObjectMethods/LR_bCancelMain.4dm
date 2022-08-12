If (False:C215)
	//object Name: [USER]LR_Setup.LR_bCancelMain
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

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].LR_Setup.LR_bCancelMain"; Form event code:C388)
ERR_MethodTrackerReturn("OBJ [USER].LR_Setup.LR_bCancelMain"; $_t_oldMethodName)