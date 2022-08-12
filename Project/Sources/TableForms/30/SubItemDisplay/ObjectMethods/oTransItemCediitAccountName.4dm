If (False:C215)
	//object Method Name: Object Name:      [TRANSACTION_BATCHES].SubItemDisplay.OItemEnterable11
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/09/2009 12:27
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; ACC_t_CreditAccountName; ACC_t_TransCreditAcc; ACC_t_TransCreditAccOLD)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [TRANSACTION_BATCHES].SubItemDisplay.OItemEnterable11"; Form event code:C388)
ACC_ValidateSubitems(->[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12; ->ACC_t_TransCreditAcc; False:C215)
//;->ACC_t_CreditAccountName)
ACC_t_TransCreditAccOLD:=ACC_t_TransCreditAcc
ERR_MethodTrackerReturn("OBJ [TRANSACTION_BATCHES].SubItemDisplay.OItemEnterable11"; $_t_oldMethodName)
