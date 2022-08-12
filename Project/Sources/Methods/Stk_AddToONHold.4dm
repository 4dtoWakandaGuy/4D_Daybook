//%attributes = {}
If (False:C215)
	//Project Method Name:      Stk_AddToONHold
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/11/2014 13:54
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_FromTransactionID; $_l_Process; $_l_ToTransactionID; $_l_TransactionID; $1; $2; $4; STK_l_TransactionID)
	C_REAL:C285($_r_Quantity; $3)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("Stk_AddToONHold")
If (In transaction:C397)  //only do this if we are in a transaction
	While (Test semaphore:C652("$StockHoldinUse"))  //December 2014-change so only one process at a time-mabe a big posting overwhelmes it
		DelayTicks(2)
	End while 
	$_l_Process:=New process:C317("STK_AddtoONHold"; 180000; "RecordCALLEDOFF"; $1; $2; $3; STK_l_TransactionID)
	While (Test semaphore:C652("$StockHoldinUse"))  //December 2014-change so only one process at a time-make sure the process has completed
		DelayTicks(2)
	End while 
Else 
	While (Semaphore:C143("$StockHoldinUse"))
		DelayTicks(2)
	End while 
	If (Count parameters:C259>=4)
		$_l_FromTransactionID:=$1
		$_l_ToTransactionID:=$2
		$_r_Quantity:=$3
		$_l_TransactionID:=$4
		If ($_l_FromTransactionID>0) & ($_l_ToTransactionID>0)
			If ($_l_TransactionID>0)
				QUERY:C277([STK_TransactionHolds:192]; [STK_TransactionHolds:192]xtransactionID:2=$_l_TransactionID; *)
				QUERY:C277([STK_TransactionHolds:192];  & ; [STK_TransactionHolds:192]XstockMovementItemID:3=$_l_FromTransactionID; *)
				QUERY:C277([STK_TransactionHolds:192];  & ; [STK_TransactionHolds:192]XCalledOffByMovementItemID:5=$_l_ToTransactionID; *)
				QUERY:C277([STK_TransactionHolds:192];  & ; [STK_TransactionHolds:192]xCalledOffQty:4=$_r_Quantity)
				If (Records in selection:C76([STK_TransactionHolds:192])=0)
					QUERY:C277([STK_TransactionHolds:192]; [STK_TransactionHolds:192]xtransactionID:2=0)
					If (Records in selection:C76([STK_TransactionHolds:192])=0)
						CREATE RECORD:C68([STK_TransactionHolds:192])
					End if 
					[STK_TransactionHolds:192]xID:1:=Generate UUID:C1066
					
					[STK_TransactionHolds:192]xtransactionID:2:=$_l_TransactionID
					[STK_TransactionHolds:192]XCalledOffByMovementItemID:5:=$_l_ToTransactionID
					[STK_TransactionHolds:192]XstockMovementItemID:3:=$_l_FromTransactionID
					[STK_TransactionHolds:192]xCalledOffQty:4:=$_r_Quantity
					[STK_TransactionHolds:192]MachineName:6:=Current machine:C483
					SAVE RECORD:C53([STK_TransactionHolds:192])
				Else   //update the quantity
					[STK_TransactionHolds:192]xCalledOffQty:4:=$_r_Quantity
					[STK_TransactionHolds:192]MachineName:6:=Current machine:C483
					SAVE RECORD:C53([STK_TransactionHolds:192])
				End if 
				STK_UpdateCalledOffQuantity(-$_l_FromTransactionID)
				
				
			End if 
			
			
		End if 
	End if 
	CLEAR SEMAPHORE:C144("$StockHoldinUse")
End if 
ERR_MethodTrackerReturn("Stk_AddToONHold"; $_t_oldMethodName)
