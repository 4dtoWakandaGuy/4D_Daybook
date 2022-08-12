If (False:C215)
	//object Name: [TRANSACTION_BATCHES]SubItemDisplay.OItemEnterable21
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
	C_REAL:C285(ACC_R_TransTaxAmtCredit; ACC_R_TransTaxAmtCreditOLD)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [TRANSACTION_BATCHES].SubItemDisplay.OItemEnterable21"; Form event code:C388)
ACC_ValidateSubitems(->[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8; ->ACC_R_TransTaxAmtCredit)
ACC_R_TransTaxAmtCreditOLD:=ACC_R_TransTaxAmtCredit
ERR_MethodTrackerReturn("OBJ [TRANSACTION_BATCHES].SubItemDisplay.OItemEnterable21"; $_t_oldMethodName)