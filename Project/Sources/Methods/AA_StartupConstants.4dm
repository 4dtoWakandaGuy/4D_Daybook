//%attributes = {}
If (False:C215)
	//Project Method Name:      AA_StartupConstants
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:40
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

$_t_oldMethodName:=ERR_MethodTracker("AA_StartupConstants")
ERR_MethodTrackerReturn("AA_StartupConstants"; $_t_oldMethodName)
