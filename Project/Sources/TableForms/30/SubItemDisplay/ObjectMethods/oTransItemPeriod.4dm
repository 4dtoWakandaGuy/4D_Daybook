If (False:C215)
	//object Method Name: Object Name:      [TRANSACTION_BATCHES].SubItemDisplay.oTransItemPeriod
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
	C_LONGINT:C283($_l_FormEvent; $_l_OBottom; $_l_OLeft; $_l_ORight; $_l_OTop)
	C_TEXT:C284($_t_oldMethodName; ACC_t_TransPeriodCode; ACC_t_TransPeriodCodeOLD)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [TRANSACTION_BATCHES].SubItemDisplay.oTransItemPeriod"; Form event code:C388)
$_l_FormEvent:=Form event code:C388
Case of 
	: ($_l_FormEvent=On Data Change:K2:15)
		OBJECT GET COORDINATES:C663(*; "oItemPeriod"; $_l_OLeft; $_l_OTop; $_l_ORight; $_l_OBottom)
		
		ACC_ValidateSubitems(->[TRANSACTION_BATCH_ITEMS:155]Period_Code:11; ->ACC_t_TransPeriodCode; False:C215; $_l_OLeft; $_l_OTop; $_l_ORight; $_l_OBottom)
		ACC_t_TransPeriodCodeOLD:=ACC_t_TransPeriodCode
End case 
ERR_MethodTrackerReturn("OBJ [TRANSACTION_BATCHES]SubItemDisplay.oTransItemPeriod"; $_t_oldMethodName)
