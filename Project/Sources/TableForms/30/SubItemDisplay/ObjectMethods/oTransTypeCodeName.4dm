If (False:C215)
	//object Method Name: Object Name:      [TRANSACTION_BATCHES].SubItemDisplay.oTransTypeCodeName
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
	//ARRAY TEXT(ACC_at_BatchTransTypesname;0)
	C_LONGINT:C283($_l_FormEvent)
	C_TEXT:C284($_t_oldMethodName; ACC_t_TransCreditAcc; ACC_t_TransCreditAccOLD; ACC_t_TransDebitAcc; ACC_t_TransDebitAccOLD; ACC_T_TransDescription; ACC_t_TransTransCode; ACC_t_TransTransCodeOLD)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [TRANSACTION_BATCHES].SubItemDisplay.OItemEnterable"; Form event code:C388)
$_l_FormEvent:=Form event code:C388
Case of 
	: ($_l_FormEvent=On Data Change:K2:15)
		
		ACC_ValidateSubitems(->[TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1; ->ACC_t_TransTransCode)
		
		ACC_t_TransTransCodeOLD:=ACC_t_TransTransCode
		
		ACC_t_TransDebitAccOLD:=ACC_t_TransDebitAcc
		
		ACC_t_TransCreditAccOLD:=ACC_t_TransCreditAcc
		
		If (ACC_t_TransTransCode#"")
			GOTO OBJECT:C206(ACC_T_TransDescription)
			
			OBJECT SET VISIBLE:C603(*; "oTransTypeDropDown"; False:C215)
			OBJECT SET ENTERABLE:C238(*; "oTransTypeCodeName"; False:C215)
		Else 
			ACC_at_BatchTransTypesname:=0
			OK:=1
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ [TRANSACTION_BATCHES].SubItemDisplay.OItemEnterable"; $_t_oldMethodName)
