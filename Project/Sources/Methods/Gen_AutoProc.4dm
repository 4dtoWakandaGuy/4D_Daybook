//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_AutoProc
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/08/2012 19:42
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

$_t_oldMethodName:=ERR_MethodTracker("Gen_AutoProc")
ERR_MethodTrackerReturn("Gen_AutoProc"; $_t_oldMethodName)