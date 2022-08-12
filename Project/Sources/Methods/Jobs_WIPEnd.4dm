//%attributes = {}
If (False:C215)
	//Project Method Name:      Jobs_WIPEnd
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  28/11/2010 21:35
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0)
	C_LONGINT:C283($_l_TransPostStatus)
	C_REAL:C285(vTotal)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Jobs_WIPEnd")
//Jobs_WIPEnd
If ((DB_GetModuleSettingByNUM(Module_NominalLedger))>0)
	QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTION_BATCHES:30]Batch_Number:10)
	If (Records in selection:C76([TRANSACTION_BATCH_ITEMS:155])>0)
		StartTransaction
		$_l_TransPostStatus:=0
		//BatchNo   `to me this makes no sense
		If ([TRANSACTION_BATCHES:30]Batch_Number:10=0)
			OK:=0
		Else 
			[TRANSACTION_BATCHES:30]Batch_Amount:3:=vTotal
			[TRANSACTION_BATCHES:30]Batch_Tax:4:=0
			[TRANSACTION_BATCHES:30]Batch_Total:5:=vTotal
			DB_SaveRecord(->[TRANSACTION_BATCHES:30])
			If (OK=1)
				$_l_TransPostStatus:=TransactionBatch_Post
			Else 
				$_l_TransPostStatus:=-1
			End if 
		End if 
		If ($_l_TransPostStatus<0)
			$0:=False:C215
			Gen_Alert("Posting of the Works in Progress has been cancelled!")
			//CANCEL TRANSACTION
			Transact_End(False:C215)
		Else 
			Transact_End(True:C214)
			//VALIDATE TRANSACTION
		End if 
		UNLOAD RECORD:C212([TRANSACTION_BATCHES:30])
		UNLOAD RECORD:C212([ACCOUNT_BALANCES:34])
	End if 
End if 
ERR_MethodTrackerReturn("Jobs_WIPEnd"; $_t_oldMethodName)