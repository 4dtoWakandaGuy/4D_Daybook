//%attributes = {}
If (False:C215)
	//Project Method Name:      AA_CLOSETEST
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/06/2014 16:27
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

$_t_oldMethodName:=ERR_MethodTracker("AA_CLOSETEST")

CANCEL:C270
ERR_MethodTrackerReturn("AA_CLOSETEST"; $_t_oldMethodName)