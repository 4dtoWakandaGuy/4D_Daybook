If (False:C215)
	//object Name: [TRANSACTION_BATCHES]SubItemDisplay.OItemEnterable19
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
	C_TEXT:C284($_t_oldMethodName; ACC_t_TransTaxCode; ACC_t_TransTaxCodeCred; ACC_t_TransTaxCodeOLD)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [TRANSACTION_BATCHES].SubItemDisplay.OItemEnterable19"; Form event code:C388)
ACC_t_TransTaxCode:=ACC_t_TransTaxCodeCred
ACC_ValidateSubitems(->[TRANSACTION_BATCH_ITEMS:155]Tax_Code:7; ->ACC_t_TransTaxCode)
ACC_t_TransTaxCodeOLD:=ACC_t_TransTaxCode
ACC_t_TransTaxCodeCred:=ACC_t_TransTaxCode
ERR_MethodTrackerReturn("OBJ [TRANSACTION_BATCHES].SubItemDisplay.OItemEnterable19"; $_t_oldMethodName)