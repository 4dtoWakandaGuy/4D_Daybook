If (False:C215)
	//object Name: [TRANSACTIONS]Trans_in.oBankReconcilled
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 15:50
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

$_t_oldMethodName:=ERR_MethodTracker("OBJ [TRANSACTIONS].Trans_in.oBankReconcilled"; Form event code:C388)
ERR_MethodTrackerReturn("OBJ [TRANSACTIONS].Trans_in.oBankReconcilled"; $_t_oldMethodName)