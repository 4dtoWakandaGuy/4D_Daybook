//%attributes = {}
If (False:C215)
	//Project Method Name:      PDF995_autoLaunchGet
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/08/2009 19:04
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>PDF995_autoLaunchBool; $0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PDF995_autoLaunchGet")

PDF995_constantsInit

$0:=<>PDF995_autoLaunchBool

ERR_MethodTrackerReturn("PDF995_autoLaunchGet"; $_t_oldMethodName)
