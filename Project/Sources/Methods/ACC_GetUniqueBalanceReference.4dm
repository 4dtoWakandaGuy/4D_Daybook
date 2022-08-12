//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_GetUniqueBalanceReference
	//------------------ Method Notes ------------------
	//This method can work from any transaction posting. It uses the values to return a string identifying the account balance record to which it belongs
	
	//------------------ Revision Control ----------------
	//Date Created: 13/01/2014 15:48
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

$_t_oldMethodName:=ERR_MethodTracker("ACC_GetUniqueBalanceReference")
ERR_MethodTrackerReturn("ACC_GetUniqueBalanceReference"; $_t_oldMethodName)