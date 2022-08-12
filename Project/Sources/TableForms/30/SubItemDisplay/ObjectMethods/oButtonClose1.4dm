If (False:C215)
	//object Name: [TRANSACTION_BATCHES]SubItemDisplay.Variable9
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(ACC_l_ItemViewContext)
	C_REAL:C285(ACC_R_TransAmount)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [TRANSACTION_BATCHES].SubItemDisplay.Variable9"; Form event code:C388)
//This button will send the data back to the main process
If (ACC_l_ItemViewContext#2)
	If (ACC_R_TransAmount#0)
		Gen_Confirm("Save Entered Data"; "Yes"; "No")
		If (OK=1)
			ACC_BatchItemSendtoBatch
			CANCEL:C270
		Else 
			ACC_BatchEntryEscape
		End if 
		
	Else 
		ACC_BatchEntryEscape
	End if 
	
	
Else 
	ACC_BatchEntryEscape
End if 
ERR_MethodTrackerReturn("OBJ [TRANSACTION_BATCHES].SubItemDisplay.Variable9"; $_t_oldMethodName)
