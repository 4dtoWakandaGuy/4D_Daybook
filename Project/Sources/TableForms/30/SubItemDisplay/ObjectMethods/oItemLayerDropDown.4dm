If (False:C215)
	//object Name: [TRANSACTION_BATCHES]SubItemDisplay.Variable2
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
	//ARRAY TEXT(ACC_at_AllLayerNames;0)
	//ARRAY TEXT(ACC_at_AllLayers;0)
	C_BOOLEAN:C305(ACC_bo_Autofill)
	C_REAL:C285(ACC_R_TransAmount; ACC_R_TransAmountCredit)
	C_TEXT:C284($_t_oldMethodName; ACC_t_LayerName; ACC_t_TransCreditAcc; ACC_t_TransDebitAcc; ACC_t_TransLayerCode; ACC_t_TranslayerCodeOLD)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [TRANSACTION_BATCHES].SubItemDisplay.Variable2"; Form event code:C388)
If (ACC_at_AllLayerNames>0)
	If (ACC_t_TransLayerCode#ACC_at_AllLayers{ACC_at_AllLayerNames})
		ACC_t_TransLayerCode:=ACC_at_AllLayers{ACC_at_AllLayerNames}
		ACC_t_LayerName:=ACC_at_AllLayerNames{ACC_at_AllLayerNames}
		ACC_ValidateSubitems(->[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20; ->ACC_t_TransLayerCode)
		ACC_t_TranslayerCodeOLD:=ACC_t_TransLayerCode
		If (ACC_t_TransLayerCode#"")
			If (ACC_bo_Autofill)
				//THE DEBIT AND CREDIT WILL HAVE FILLED AUTO
				If (ACC_t_TransDebitAcc#"")
					GOTO OBJECT:C206(ACC_R_TransAmount)
				Else 
					If (ACC_t_TransCreditAcc#"")
						GOTO OBJECT:C206(ACC_R_TransAmountCredit)
					Else 
						GOTO OBJECT:C206(ACC_t_TransDebitAcc)
					End if 
					
				End if 
				
			Else 
				GOTO OBJECT:C206(ACC_t_TransDebitAcc)
			End if 
			
		Else 
			ACC_t_LayerName:=""
			GOTO OBJECT:C206(ACC_t_TransLayerCode)
		End if 
		
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [TRANSACTION_BATCHES].SubItemDisplay.Variable2"; $_t_oldMethodName)
