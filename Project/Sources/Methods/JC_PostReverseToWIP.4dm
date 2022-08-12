//%attributes = {}
If (False:C215)
	//Project Method Name:      JC_PostReverseToWIP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/01/2010 16:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_BatchItemID; $_l_BatchItemReference; $_l_BatchNo; $_l_BatchTransItemID; $_l_BatchTransItemXID; $_l_DiaryRecordID; $_l_DuplicateIndex; $_l_NewBatchNumber; $_l_NewBatchTransItemID; $_l_RecordsInSelection; $_l_TableNumber)
	C_LONGINT:C283($1; DS_l_BATCHITEMRef)
	C_REAL:C285($_r_TransactionAmount)
	C_TEXT:C284(<>WIP_t_CIPTRANS; <>WIP_t_CIWTrans; <>WIP_t_TRPTrans; <>WIP_t_TRWTrans; $_t_oldMethodName; $_t_transactionTypeCode; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JC_PostReverseToWIP")
//added 08/03/07 -kmw

If (Count parameters:C259>=2)
	$_l_DiaryRecordID:=$1
	$_t_transactionTypeCode:=$2
	
	$_l_TableNumber:=0
	
	
	$_l_BatchTransItemXID:=0
	$_l_BatchTransItemID:=0
	
	
	$_l_NewBatchNumber:=0
	$_l_NewBatchTransItemID:=0
	
	Case of 
		: ($_t_transactionTypeCode=<>WIP_t_TRPTrans) | ($_t_transactionTypeCode=<>WIP_t_TRWTrans)
			$_l_TableNumber:=Table:C252(->[TRANSACTION_BATCHES:30])
			QUERY:C277([xDiaryRelations:137]; [xDiaryRelations:137]xTableNUM:3=$_l_TableNumber; *)
			QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]xDiaryID:1=$_l_DiaryRecordID; *)
			QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]x_RelationshipName:7="WIP Tran to Time Diary")
			ORDER BY FORMULA:C300([xDiaryRelations:137]; Num:C11([xDiaryRelations:137]X_DisplayedName:6); <)  //this should be ok as shouldn't be very many records (every modifcation to a diary record will generate 2 of these records - can't imagine hundreds or thousamds of modifications to the same diary record)
			If (Records in selection:C76([xDiaryRelations:137])>0)
				FIRST RECORD:C50([xDiaryRelations:137])  //should be one with highest date time stamp and so should be most recently added relationship for this record
				$_l_BatchTransItemXID:=[xDiaryRelations:137]xRecordID:4  //normally these two would be unique code and unique XID for same table but in this case was convenient to use one to store parent record id and the other to store subrecord id
				//actually the above line is redundant, because its possible to (and in fact it now does)  query directly on sub record xID
				$_l_BatchTransItemID:=Num:C11([xDiaryRelations:137]XRecord_Code:5)  //normally these two would be unique code and unique XID for same table but in this case was convenient to use one to store parent record id and the other to store subrecord id
			Else 
				//TRACE
				//this may happen due to 0 cost value diary or order items...ie in the case of them there woul dnot be a transaction/batch/item created and also no relation record
			End if 
			
		: ($_t_transactionTypeCode=<>WIP_t_CIPTRANS) | ($_t_transactionTypeCode=<>WIP_t_CIWTrans)
			$_l_TableNumber:=Table:C252(->[TRANSACTION_BATCHES:30])
			QUERY:C277([xBatchItemRelations:140]; [xBatchItemRelations:140]xTableNUM:3=$_l_TableNumber; *)
			QUERY:C277([xBatchItemRelations:140];  & ; [xDiaryRelations:137]xRecordID:4=$_l_DiaryRecordID; *)
			QUERY:C277([xBatchItemRelations:140];  & ; [xBatchItemRelations:140]x_RelationshipName:7="WIP Tran to Order Item")
			ORDER BY FORMULA:C300([xBatchItemRelations:140]; Num:C11([xBatchItemRelations:140]x_DisplayedName:6); <)  //this should be ok as shouldn't be very many records (every modifcation to a diary record will generate 2 of these records - can't imagine hundreds or thousamds of modifications to the same diary record)
			If (Records in selection:C76([xBatchItemRelations:140])>0)
				FIRST RECORD:C50([xBatchItemRelations:140])  //should be one with highest date time stamp and so should be most recently added relationship for this record
				$_l_BatchTransItemID:=[xBatchItemRelations:140]xBatchItemID:1
			Else 
				//TRACE
				//this may happen due to 0 cost value diary or order items...ie in the case of them there woul dnot be a transaction/batch/item created and also no relation record
			End if 
			
		Else 
			//TRACE
			//SHOULDN'T HAPPEN!
	End case 
	
	
	READ WRITE:C146([TRANSACTION_BATCHES:30])
	QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]BatchItemID:25=$_l_BatchTransItemID)
	$_l_BatchNo:=[TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31
	QUERY:C277([TRANSACTION_BATCHES:30]; [TRANSACTION_BATCHES:30]Batch_Number:10=$_l_BatchNo)
	
	If (Records in selection:C76([TRANSACTION_BATCHES:30])=1)  //just in case
		
		$_r_TransactionAmount:=[TRANSACTION_BATCHES:30]Batch_Amount:3
		
		DUPLICATE RECORD:C225([TRANSACTION_BATCHES:30])
		
		BatchNo
		$_l_NewBatchNumber:=[TRANSACTION_BATCHES:30]Batch_Number:10  //added 09/02/07 -kmw
		[TRANSACTION_BATCHES:30]Batch_Amount:3:=$_r_TransactionAmount*-1
		[TRANSACTION_BATCHES:30]Batch_Total:5:=$_r_TransactionAmount*-1
		
		[TRANSACTION_BATCHES:30]Description:12:=$_t_transactionTypeCode+" WIP Posting - Reversal"  //added 03/04/07 -kmw
		QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=$_l_BatchNo)
		CREATE SET:C116([TRANSACTION_BATCH_ITEMS:155]; "$Set1")
		$_l_RecordsInSelection:=Records in selection:C76([TRANSACTION_BATCH_ITEMS:155])
		$_l_BatchItemID:=0
		$_l_BatchItemReference:=0
		$_l_BatchItemID:=(AA_GetNextID(->[TRANSACTION_BATCH_ITEMS:155]ID:30; -$_l_RecordsInSelection))-$_l_RecordsInSelection
		$_l_BatchItemReference:=(AA_GetNextIDinMethod(->DS_l_BATCHITEMRef; -$_l_RecordsInSelection))-$_l_RecordsInSelection
		For ($_l_DuplicateIndex; 1; $_l_RecordsInSelection)
			USE SET:C118("$Set1")
			GOTO SELECTED RECORD:C245([TRANSACTION_BATCH_ITEMS:155]; $_l_DuplicateIndex)
			DUPLICATE RECORD:C225([TRANSACTION_BATCH_ITEMS:155])
			[TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31:=$_l_NewBatchNumber
			If ($_l_BatchItemID>0)
				[TRANSACTION_BATCH_ITEMS:155]ID:30:=$_l_BatchItemID
				$_l_BatchItemID:=$_l_BatchItemID+1
			Else 
				[TRANSACTION_BATCH_ITEMS:155]ID:30:=AA_GetNextID(->[TRANSACTION_BATCH_ITEMS:155]ID:30)
			End if 
			If ($_l_BatchItemReference>0)
				[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=$_l_BatchItemReference
				$_l_BatchItemReference:=$_l_BatchItemReference+1
			Else 
				[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=AA_GetNextIDinMethod(->DS_l_BATCHITEMRef)
			End if 
			DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
		End for 
		QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=$_l_NewBatchNumber)
		
		If (Records in selection:C76([TRANSACTION_BATCH_ITEMS:155])=1)  //just in case
			FIRST RECORD:C50([TRANSACTION_BATCH_ITEMS:155])  //just in case
			$_l_NewBatchTransItemID:=[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25
			[TRANSACTION_BATCH_ITEMS:155]Amount:6:=$_r_TransactionAmount*-1
			[TRANSACTION_BATCH_ITEMS:155]Total:9:=$_r_TransactionAmount*-1
			If ([TRANSACTION_BATCH_ITEMS:155]BatchItemID:25=0)
				[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=AA_GetNextIDinMethod(->DS_l_BATCHITEMRef)
			End if 
			DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
			
		Else 
			//shouldn't happen!
			//TRACE
		End if 
		DB_SaveRecord(->[TRANSACTION_BATCHES:30])
		QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=$_l_NewBatchNumber)
		//
		If ($_l_DiaryRecordID#0) & ($_l_NewBatchNumber#0) & ($_l_NewBatchTransItemID#0)
			Case of 
				: ($_t_transactionTypeCode=<>WIP_t_TRPTrans) | ($_t_transactionTypeCode=<>WIP_t_TRWTrans)
					JC_AddDiaryTimeBatchItemRel($_l_DiaryRecordID; $_l_NewBatchNumber; $_l_NewBatchTransItemID; "WIP Tran to Time Diary - Reversal")
					
				: ($_t_transactionTypeCode=<>WIP_t_CIPTRANS) | ($_t_transactionTypeCode=<>WIP_t_CIWTrans)
					JC_AddBatchItemOrderItemRel($_l_DiaryRecordID; $_l_BatchTransItemID; "WIP Tran to Order Item - Reversal")
					
				Else 
					//shouldn't happen
					//TRACE
			End case 
		Else 
			//shouldn't happen
			//TRACE
		End if 
	Else 
		//shouldn't happen
		//TRACE
	End if 
	READ ONLY:C145([TRANSACTION_BATCHES:30])
End if 
ERR_MethodTrackerReturn("JC_PostReverseToWIP"; $_t_oldMethodName)