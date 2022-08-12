If (False:C215)
	//object Name: [TRANSACTION_BATCHES]SubItemDisplay.OItemEnterable12
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/09/2009 12:31
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; ACC_t_TransCurrencyCode; ACC_t_TransCurrencyCodeOLD)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [TRANSACTION_BATCHES].SubItemDisplay.OItemEnterable12"; Form event code:C388)
ACC_ValidateSubitems(->[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19; ->ACC_t_TransCurrencyCode)
ACC_t_TransCurrencyCodeOLD:=ACC_t_TransCurrencyCode
ERR_MethodTrackerReturn("OBJ [TRANSACTION_BATCHES].SubItemDisplay.OItemEnterable12"; $_t_oldMethodName)