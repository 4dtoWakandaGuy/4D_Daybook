If (False:C215)
	//object Name: [TRANSACTION_BATCHES]SubItemDisplay.Variable5
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/01/2012 19:38
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Retries; ACC_l_ButtonNextItem; ACC_l_ButtonPreviousItem; ACC_l_DisplayedItemNumber; ACC_l_ItemViewContext; ACC_l_MaxItemNumber; ACC_l_ParentProcessNumber; DB_l_ButtonClickedFunction)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [TRANSACTION_BATCHES].SubItemDisplay.Variable5"; Form event code:C388)

If (ACC_l_ItemViewContext#2)
	
	ACC_BatchItemSendtoBatch
	GET PROCESS VARIABLE:C371(ACC_l_ParentProcessNumber; DB_l_ButtonClickedFunction; DB_l_ButtonClickedFunction)
	$_l_Retries:=0
	While (DB_l_ButtonClickedFunction>0)
		$_l_Retries:=$_l_Retries+1
		DelayTicks($_l_Retries*2)
		GET PROCESS VARIABLE:C371(ACC_l_ParentProcessNumber; DB_l_ButtonClickedFunction; DB_l_ButtonClickedFunction)
		
	End while 
	
End if 
If (ACC_l_DisplayedItemNumber<ACC_l_MaxItemNumber)
	SET PROCESS VARIABLE:C370(ACC_l_ParentProcessNumber; ACC_l_DisplayedItemNumber; ACC_l_DisplayedItemNumber+1)
	SET PROCESS VARIABLE:C370(ACC_l_ParentProcessNumber; DB_l_ButtonClickedFunction; DB_GetButtonFunction("GetNextBatchItem"))
	POST OUTSIDE CALL:C329(ACC_l_ParentProcessNumber)
End if 

If (ACC_l_DisplayedItemNumber=1)
	OBJECT SET ENABLED:C1123(ACC_l_ButtonPreviousItem; False:C215)
Else 
	If (ACC_l_DisplayedItemNumber=ACC_l_MaxItemNumber)
		OBJECT SET ENABLED:C1123(ACC_l_ButtonNextItem; False:C215)
		
	End if 
End if 
ERR_MethodTrackerReturn("OBJ:SubItemDisplay,ACC_l_ButtonNextItem"; $_t_oldMethodName)
