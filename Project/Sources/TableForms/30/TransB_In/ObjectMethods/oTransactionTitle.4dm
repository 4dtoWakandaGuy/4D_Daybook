If (False:C215)
	//object Name: [TRANSACTION_BATCHES]TransB_in.Variable7
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
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

$_t_oldMethodName:=ERR_MethodTracker("OBJ [TRANSACTION_BATCHES].TransB_in.Variable7"; Form event code:C388)
ERR_MethodTrackerReturn("OBJ [TRANSACTION_BATCHES].TransB_in.Variable7"; $_t_oldMethodName)