If (False:C215)
	//object Name: [TRANSACTION_BATCHES]SubItemDisplay.Variable35
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/09/2009 12:24
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(ACC_at_IOValues;0)
	C_TEXT:C284($_t_oldMethodName; ACC_t_TransDebitIO; ACC_t_TransDebitIOOLD)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [TRANSACTION_BATCHES].SubItemDisplay.Variable35"; Form event code:C388)
If (ACC_at_IOValues>0)
	If (ACC_at_IOValues{ACC_at_IOValues}#ACC_t_TransDebitIO)
		ACC_t_TransDebitIOOLD:=ACC_t_TransDebitIO
		ACC_t_TransDebitIO:=ACC_at_IOValues{ACC_at_IOValues}
		ACC_at_IOValues:=0
		ACC_ValidateSubitems(->[TRANSACTION_BATCH_ITEMS:155]Debit_IO:15; ->ACC_t_TransDebitIO)
		ACC_t_TransDebitIOOLD:=ACC_t_TransDebitIO
		
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [TRANSACTION_BATCHES].SubItemDisplay.Variable35"; $_t_oldMethodName)
