//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_GetMenuItemShortcut
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/08/2012 11:02
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

$_t_oldMethodName:=ERR_MethodTracker("DB_GetMenuItemShortcut")
ERR_MethodTrackerReturn("DB_GetMenuItemShortcut"; $_t_oldMethodName)