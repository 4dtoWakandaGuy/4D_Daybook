//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      TransB LaySel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2012 14:23
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; vLayer)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("TransB LaySel")
If (vLayer=DB_GetLedgerActualLayer)
	QUERY SELECTION:C341([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Layer_Code:20=vLayer; *)
	QUERY SELECTION:C341([TRANSACTION_BATCH_ITEMS:155];  | ; [TRANSACTION_BATCH_ITEMS:155]Layer_Code:20="")
	
Else 
	QUERY SELECTION:C341([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Layer_Code:20=vLayer)
End if 
ERR_MethodTrackerReturn("TransB LaySel"; $_t_oldMethodName)