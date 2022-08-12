If (False:C215)
	//object Method Name: Object Name:      [TRANSACTION_BATCHES].SubItemDisplay.OItemEnterable22
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
	C_TEXT:C284($_t_oldMethodName; ACC_t_DebitAccountName; ACC_t_TransDebitAcc; ACC_t_TransDebitAccOLD)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [TRANSACTION_BATCHES].SubItemDisplay.OItemEnterable22"; Form event code:C388)
ACC_ValidateSubitems(->[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3; ->ACC_t_TransDebitAcc; False:C215)
//;->ACC_t_DebitAccountName)
ACC_t_TransDebitAccOLD:=ACC_t_TransDebitAcc
ERR_MethodTrackerReturn("OBJ [TRANSACTION_BATCHES].SubItemDisplay.OItemEnterable22"; $_t_oldMethodName)
