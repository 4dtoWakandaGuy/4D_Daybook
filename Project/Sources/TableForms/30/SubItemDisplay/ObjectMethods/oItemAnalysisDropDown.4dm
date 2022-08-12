If (False:C215)
	//object Name: [TRANSACTION_BATCHES]SubItemDisplay.Variable1
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
	//ARRAY TEXT(ACC_at_AllAnalyses;0)
	//ARRAY TEXT(ACC_at_allAnalysesNames;0)
	C_TEXT:C284($_t_oldMethodName; ACC_t_AnalysisNames; ACC_t_BatchItemAnalysisCode; ACC_t_BatchItemAnalysisCodeOLD; ACC_t_TransLayerCode)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [TRANSACTION_BATCHES].SubItemDisplay.Variable1"; Form event code:C388)
If (ACC_at_allAnalysesNames>0)
	If (ACC_t_BatchItemAnalysisCode#ACC_at_AllAnalyses{ACC_at_allAnalysesNames})
		ACC_t_BatchItemAnalysisCode:=ACC_at_AllAnalyses{ACC_at_allAnalysesNames}
		ACC_t_AnalysisNames:=ACC_at_allAnalysesNames{ACC_at_allAnalysesNames}
		ACC_ValidateSubitems(->[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2; ->ACC_t_BatchItemAnalysisCode)
		ACC_t_BatchItemAnalysisCodeOLD:=ACC_t_BatchItemAnalysisCode
		If (ACC_t_BatchItemAnalysisCode#"")
			GOTO OBJECT:C206(ACC_t_TransLayerCode)
		Else 
			ACC_t_AnalysisNames:=""
			GOTO OBJECT:C206(ACC_t_BatchItemAnalysisCode)
		End if 
		
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [TRANSACTION_BATCHES].SubItemDisplay.Variable1"; $_t_oldMethodName)
