//%attributes = {}
If (False:C215)
	//Project Method Name:      Acc_BalOutBudDelete
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/06/2010 05:35
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

$_t_oldMethodName:=ERR_MethodTracker("Acc_BalOutBudDelete")
CREATE SET:C116([ACCOUNT_BALANCES:34]; "Master")
USE SET:C118("Userset")
Are_You_Sure
If (OK=1)
	QUERY SELECTION:C341([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Layer_Code:5#"A")
	DELETE SELECTION:C66([ACCOUNT_BALANCES:34])
End if 
USE SET:C118("Master")
Gen_OutNo(->[ACCOUNT_BALANCES:34])
ERR_MethodTrackerReturn("Acc_BalOutBudDelete"; $_t_oldMethodName)
