If (False:C215)
	//object Name: [TRANSACTION_BATCHES]SubItemDisplay.oTransItemDate
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
	C_DATE:C307(ACC_D_TransDate)
	C_TEXT:C284($_t_oldMethodName; ACC_t_BatchItemAnalysisCode; ACC_t_TransPeriodCode)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [TRANSACTION_BATCHES].SubItemDisplay.oTransItemDate"; Form event code:C388)
ACC_ValidateSubitems(->[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5; ->ACC_D_TransDate)
If (ACC_t_TransPeriodCode#"")
	GOTO OBJECT:C206(ACC_t_BatchItemAnalysisCode)
End if 
ERR_MethodTrackerReturn("OBJ [TRANSACTION_BATCHES].SubItemDisplay.oTransItemDate"; $_t_oldMethodName)
