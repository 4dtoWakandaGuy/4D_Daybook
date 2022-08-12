If (False:C215)
	//object Name: [TRANSACTION_BATCHES]SubItemDisplay.Variable36
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
	//ARRAY TEXT(ACC_at_IOValues;0)
	//ARRAY TEXT(ACC_at_IOValuesCred;0)
	C_TEXT:C284($_t_oldMethodName; ACC_t_TransCreditIO)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [TRANSACTION_BATCHES].SubItemDisplay.Variable36"; Form event code:C388)
If (ACC_at_IOValuesCred>0)
	If (ACC_at_IOValues{ACC_at_IOValuesCred}#ACC_t_TransCreditIO)
		ACC_t_TransCreditIO:=ACC_at_IOValues{ACC_at_IOValuesCred}
		ACC_at_IOValues:=0
		ACC_ValidateSubitems(->[TRANSACTION_BATCH_ITEMS:155]Credit_IO:16; ->ACC_t_TransCreditIO)  //New object("ObjectName";OBJECT Get name(Object current)))
		
		
		
		
		
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [TRANSACTION_BATCHES].SubItemDisplay.Variable36"; $_t_oldMethodName)
