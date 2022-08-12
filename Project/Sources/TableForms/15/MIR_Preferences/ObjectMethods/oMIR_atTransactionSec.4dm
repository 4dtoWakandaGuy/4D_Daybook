If (False:C215)
	//object Name: [USER]MIR_Preferences.oMIR_atTransactionSec
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
	C_TIME:C306(<>MIR_ti_TransactionDelay)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].MIR_Preferences.oMIR_atTransactionSec"; Form event code:C388)


<>MIR_ti_TransactionDelay:=Time:C179("00:"+MIR_at_TransactionMin{MIR_at_TransactionMin}+":"+MIR_at_TransactionSec{MiR_at_TransactionSec})
//End of method
ERR_MethodTrackerReturn("OBJ [USER].MIR_Preferences.oMIR_atTransactionSec"; $_t_oldMethodName)