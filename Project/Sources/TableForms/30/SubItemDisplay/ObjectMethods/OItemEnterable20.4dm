If (False:C215)
	//object Name: [TRANSACTION_BATCHES]SubItemDisplay.OItemEnterable20
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
	C_TEXT:C284($_t_oldMethodName; ACC_t_UKEC; ACC_t_UKECCred; ACC_t_UKECOLD)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [TRANSACTION_BATCHES].SubItemDisplay.OItemEnterable20"; Form event code:C388)
ACC_t_UKEC:=ACC_t_UKECCred
ACC_ValidateSubitems(->[TRANSACTION_BATCH_ITEMS:155]UK_EC:18; ->ACC_t_UKEC)
ACC_t_UKECOLD:=ACC_t_UKEC
ACC_t_UKECCred:=ACC_t_UKEC
ERR_MethodTrackerReturn("OBJ [TRANSACTION_BATCHES].SubItemDisplay.OItemEnterable20"; $_t_oldMethodName)