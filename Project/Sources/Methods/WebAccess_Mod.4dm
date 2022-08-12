//%attributes = {}
If (False:C215)
	//Project Method Name:      WebAccess_Mod
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
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("WebAccess_Mod")
Minor_Mod(->[WEB_ACCESS:130]; "WebAccess")
ERR_MethodTrackerReturn("WebAccess_Mod"; $_t_oldMethodName)