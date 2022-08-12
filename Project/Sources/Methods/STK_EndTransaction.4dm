//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_EndTransaction
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/11/2014 16:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_RedoCalledOff; 0)
	ARRAY LONGINT:C221($_al_TransactionIDS; 0)
	C_BOOLEAN:C305($_bo_ProcessVisible; $2)
	C_LONGINT:C283($_l_ProcessIndex; $_l_ProcessState; $_l_ProcessTime; $_l_UniqueProcessID; $1)
	C_TEXT:C284($_t_oldMethodName; $_t_processName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_EndTransaction")
If (Count parameters:C259>=1)
	If ($1>0)
		While (Semaphore:C143("HoldsInUse"))
			DelayTicks(2)
		End while 
		ARRAY LONGINT:C221($_al_TransactionIDS; 0)
		For ($_l_ProcessIndex; 1; Count user processes:C343)
			PROCESS PROPERTIES:C336($_l_ProcessIndex; $_t_processName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible; $_l_UniqueProcessID)
			If ($_l_UniqueProcessID>0)
				APPEND TO ARRAY:C911($_al_TransactionIDS; $_l_UniqueProcessID)
			End if 
		End for 
		
		READ WRITE:C146([STK_TransactionHolds:192])
		ALL RECORDS:C47([STK_TransactionHolds:192])
		CREATE SET:C116([STK_TransactionHolds:192]; "$Temp")
		
		QUERY WITH ARRAY:C644([STK_TransactionHolds:192]xtransactionID:2; $_al_TransactionIDS)  //find only valid transaction ids
		//QUERY selection([STK_TransactionHolds];[STK_TransactionHolds]xtransactionID#$1)
		CREATE SET:C116([STK_TransactionHolds:192]; "$Temp2")
		DIFFERENCE:C122("$Temp"; "$Temp2"; "$Temp")
		USE SET:C118("$temp")
		QUERY SELECTION:C341([STK_TransactionHolds:192]; [STK_TransactionHolds:192]MachineName:6=""; *)
		QUERY SELECTION:C341([STK_TransactionHolds:192]; [STK_TransactionHolds:192]xtransactionID:2>0; *)
		QUERY SELECTION:C341([STK_TransactionHolds:192];  & ; [STK_TransactionHolds:192]MachineName:6=Current machine:C483)
		
		SELECTION TO ARRAY:C260([STK_TransactionHolds:192]XstockMovementItemID:3; $_al_RedoCalledOff)
		APPLY TO SELECTION:C70([STK_TransactionHolds:192]; [STK_TransactionHolds:192]XCalledOffByMovementItemID:5:=0)
		APPLY TO SELECTION:C70([STK_TransactionHolds:192]; [STK_TransactionHolds:192]xCalledOffQty:4:=0)
		APPLY TO SELECTION:C70([STK_TransactionHolds:192]; [STK_TransactionHolds:192]XstockMovementItemID:3:=0)
		APPLY TO SELECTION:C70([STK_TransactionHolds:192]; [STK_TransactionHolds:192]xtransactionID:2:=0)
		For ($_l_ProcessIndex; 1; Size of array:C274($_al_RedoCalledOff))
			STK_UpdateCalledOffQuantity(-$_al_RedoCalledOff{$_l_ProcessIndex}; 0)
		End for 
		
		
		
		//we want any other records created on this machine...
		
		QUERY:C277([STK_TransactionHolds:192]; [STK_TransactionHolds:192]xtransactionID:2=$1)
		SELECTION TO ARRAY:C260([STK_TransactionHolds:192]XstockMovementItemID:3; $_al_RedoCalledOff)
		APPLY TO SELECTION:C70([STK_TransactionHolds:192]; [STK_TransactionHolds:192]XCalledOffByMovementItemID:5:=0)
		APPLY TO SELECTION:C70([STK_TransactionHolds:192]; [STK_TransactionHolds:192]xCalledOffQty:4:=0)
		APPLY TO SELECTION:C70([STK_TransactionHolds:192]; [STK_TransactionHolds:192]XstockMovementItemID:3:=0)
		APPLY TO SELECTION:C70([STK_TransactionHolds:192]; [STK_TransactionHolds:192]xtransactionID:2:=0)
		
		CLEAR SEMAPHORE:C144("HoldsInUse")
		If ($2=False:C215)  //we are cancelling the transaction so update the called of qtys
			For ($_l_ProcessIndex; 1; Size of array:C274($_al_RedoCalledOff))
				STK_UpdateCalledOffQuantity(-$_al_RedoCalledOff{$_l_ProcessIndex}; 0)
			End for 
		End if 
		
	End if 
	
	
End if 
ERR_MethodTrackerReturn("STK_EndTransaction"; $_t_oldMethodName)
