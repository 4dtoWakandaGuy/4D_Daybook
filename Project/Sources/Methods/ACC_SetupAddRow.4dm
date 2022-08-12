//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_SetupAddRow
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/08/2013 07:13
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

$_t_oldMethodName:=ERR_MethodTracker("ACC_SetupAddRow")
ERR_MethodTrackerReturn("ACC_SetupAddRow"; $_t_oldMethodName)