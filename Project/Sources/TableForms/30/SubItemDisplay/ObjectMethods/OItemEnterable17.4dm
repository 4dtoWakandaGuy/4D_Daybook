If (False:C215)
	//object Name: [TRANSACTION_BATCHES]SubItemDisplay.OItemEnterable17
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/09/2009 13:27
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//Array TEXT(ACC_at_BatchItemTaxUKEC;0)
	C_LONGINT:C283(ACC_l_aUKECOLD)
	C_TEXT:C284($_t_oldMethodName; ACC_t_UKEC)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [TRANSACTION_BATCHES].SubItemDisplay.OItemEnterable17"; Form event code:C388)
ACC_ValidateSubitems(->[TRANSACTION_BATCH_ITEMS:155]UK_EC:18; ->ACC_t_UKEC)
ACC_l_aUKECOLD:=ACC_at_BatchItemTaxUKEC
ERR_MethodTrackerReturn("OBJ [TRANSACTION_BATCHES].SubItemDisplay.OItemEnterable17"; $_t_oldMethodName)