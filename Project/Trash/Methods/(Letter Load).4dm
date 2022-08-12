//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Letter Load
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/08/2009 18:06
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

$_t_oldMethodName:=ERR_MethodTracker("Letter Load")
//Letter Load-used for text documents!
ALERT:C41("NOT AVAILABLE")
ERR_MethodTrackerReturn("Letter Load"; $_t_oldMethodName)