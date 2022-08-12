If (False:C215)
	//object Method Name: Object Name:      [TRANSACTION_BATCHES].SubItemDisplay.Variable39
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/09/2009 12:31
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By 
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(ACC_at_BatchTransTypesCode;0)
	//ARRAY TEXT(ACC_at_BatchTransTypesname;0)
	C_LONGINT:C283($_l_OBottom; $_l_OLeft; $_l_ORight; $_l_OTop)
	C_TEXT:C284($_t_oldMethodName; ACC_t_TransCreditAcc; ACC_t_TransCreditAccOLD; ACC_t_TransDebitAcc; ACC_t_TransDebitAccOLD; ACC_T_TransDescription; ACC_t_TransTransCode)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [TRANSACTION_BATCHES].SubItemDisplay.Variable39"; Form event code:C388)
If (ACC_at_BatchTransTypesname>0)
	
	If (ACC_t_TransTransCode#ACC_at_BatchTransTypesCode{ACC_at_BatchTransTypesname})
		ACC_t_TransTransCode:=ACC_at_BatchTransTypesCode{ACC_at_BatchTransTypesname}
		OBJECT GET COORDINATES:C663(*; "oTransTypeDropDown"; $_l_OLeft; $_l_OTop; $_l_ORight; $_l_OBottom)
		//TRACE
		ACC_ValidateSubitems(->[TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1; ->ACC_t_TransTransCode; False:C215; $_l_OLeft; $_l_OTop; $_l_ORight; $_l_OBottom)
		If (ACC_t_TransTransCode#"")
			GOTO OBJECT:C206(ACC_T_TransDescription)
			OBJECT SET VISIBLE:C603(*; "oTransTypeDropDown"; False:C215)
			OBJECT SET ENTERABLE:C238(*; "oTransTypeCodeName"; False:C215)
		Else 
			ACC_at_BatchTransTypesname:=0
			OK:=1
		End if 
		ACC_t_TransDebitAccOLD:=ACC_t_TransDebitAcc
		ACC_t_TransCreditAccOLD:=ACC_t_TransCreditAcc
		
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [TRANSACTION_BATCHES].SubItemDisplay.Variable39"; $_t_oldMethodName)
