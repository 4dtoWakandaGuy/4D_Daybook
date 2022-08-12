//%attributes = {}
If (False:C215)
	//Project Method Name:      Assert
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 17:11`Method: Assert
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

$_t_oldMethodName:=ERR_MethodTracker("Assert")
//REPLACED BY DB_Assert
ERR_MethodTrackerReturn("Assert"; $_t_oldMethodName)