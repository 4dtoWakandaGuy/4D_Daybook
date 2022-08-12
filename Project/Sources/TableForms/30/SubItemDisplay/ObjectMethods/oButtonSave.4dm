If (False:C215)
	//object Name: [TRANSACTION_BATCHES]SubItemDisplay.Variable31
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 11/06/2011 11:39
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(ACC_l_ItemViewContext)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [TRANSACTION_BATCHES].SubItemDisplay.Variable31"; Form event code:C388)
//This button will send the data back to the main process
If (ACC_l_ItemViewContext#2)
	
	ACC_BatchItemSendtoBatch
	If (ACC_l_ItemViewContext#1)
		CANCEL:C270
	End if 
Else 
	CANCEL:C270
End if 
ERR_MethodTrackerReturn("OBJ:SubItemDisplay,BtranSave"; $_t_oldMethodName)
