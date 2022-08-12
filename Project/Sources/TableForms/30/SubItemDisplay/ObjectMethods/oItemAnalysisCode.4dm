If (False:C215)
	//object Name: [TRANSACTION_BATCHES]SubItemDisplay.oItemAnalysisCode
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
	C_TEXT:C284($_t_oldMethodName; ACC_t_BatchItemAnalysisCode; ACC_t_BatchItemAnalysisCodeOLD)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [TRANSACTION_BATCHES].SubItemDisplay.oItemAnalysisCode"; Form event code:C388)
ACC_ValidateSubitems(->[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2; ->ACC_t_BatchItemAnalysisCode)
ACC_t_BatchItemAnalysisCodeOLD:=ACC_t_BatchItemAnalysisCode
ERR_MethodTrackerReturn("OBJ [TRANSACTION_BATCHES].SubItemDisplay.oItemAnalysisCode"; $_t_oldMethodName)