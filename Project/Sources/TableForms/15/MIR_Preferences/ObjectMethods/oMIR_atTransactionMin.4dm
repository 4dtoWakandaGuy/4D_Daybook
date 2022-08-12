If (False:C215)
	//object Name: [USER]MIR_Preferences.oMIR_atTransactionMin
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
	//Array TEXT(MIR_at_TransactionSec;0)
	C_TEXT:C284($_t_oldMethodName)
	C_TIME:C306(<>MIR_ti_TransactionDelay)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].MIR_Preferences.oMIR_atTransactionMin"; Form event code:C388)


MIR_at_TransactionSec:=1  // When minipulating the minutes reset the seconds to 0
<>MIR_ti_TransactionDelay:=Time:C179("00:"+MIR_at_TransactionMin{MIR_at_TransactionMin}+":"+MIR_at_TransactionSec{MIR_at_TransactionSec})
//End of method
ERR_MethodTrackerReturn("OBJ [USER].MIR_Preferences.oMIR_atTransactionMin"; $_t_oldMethodName)