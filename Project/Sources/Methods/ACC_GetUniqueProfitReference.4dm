//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_GetUniqueProfitReference
	//------------------ Method Notes ------------------
	//This method can operate from a Transaction or an account balance
	//------------------ Revision Control ----------------
	//Date Created: 13/01/2014 15:50
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

$_t_oldMethodName:=ERR_MethodTracker("ACC_GetUniqueProfitReference")
ERR_MethodTrackerReturn("ACC_GetUniqueProfitReference"; $_t_oldMethodName)