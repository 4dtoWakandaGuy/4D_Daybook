//%attributes = {}
If (False:C215)
	//Project Method Name:      TransB_InLPA
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 11/06/2011 08:29
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(ACC_al_BatchItemDelete;0)
	//ARRAY LONGINT(ACC_al_BatchItemID;0)
	C_BOOLEAN:C305($noSave; BAT_bo_UseAreaList)
	C_LONGINT:C283($_l_SizeofArray; $_l_SizeofArray2; $_l_TransPostStatus; vAdd; xNext)
	C_TEXT:C284($_t_oldMethodName; $Lay; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("TransB_InLPA")

$noSave:=False:C215
If ([TRANSACTION_BATCHES:30]State:15=0)
	If (BAT_bo_UseAreaList)
		$_l_SizeofArray:=Size of array:C274(ACC_al_BatchItemID)
		$_l_SizeofArray2:=Size of array:C274(ACC_al_BatchItemDelete)
		If ($_l_SizeofArray=0) & ($_l_SizeofArray2=0)
			//nothing to save?
			$NoSave:=True:C214
		End if 
	Else 
		QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTION_BATCHES:30]Batch_Number:10)
		
		If (Records in selection:C76([TRANSACTION_BATCH_ITEMS:155])=0)
			$noSave:=True:C214
		End if 
	End if 
	If ($NoSave)
		Gen_Confirm("There are no items on this batch. Do you still wish to save it?"; "No"; "Yes")
		If (OK=0)
			$noSave:=False:C215
		End if 
	End if 
End if 
If ($noSave=False:C215)
	OK:=1
	If ([TRANSACTION_BATCHES:30]Batch_Number:10=0)
		BatchNo
	End if 
	If ((OK=1) & ([TRANSACTION_BATCHES:30]Batch_Number:10#0))
		DB_SaveRecord(->[TRANSACTION_BATCHES:30])  // For safety
		If (BAT_bo_UseAreaList)
			ACC_BatchCreateItems
		End if 
		
		DB_SaveRecord(->[TRANSACTION_BATCHES:30])
		If (OK=1)
			If (([TRANSACTION_BATCHES:30]State:15<-1) | ([TRANSACTION_BATCHES:30]State:15>0) | (DB_t_CurrentFormUsage3="Pch"))
				ACCEPT:C269
			Else 
				If (DB_GetLedgerAllowUnproc)
					Gen_Confirm3("Are you now ready to Post (or Batch) these Transactions, "+"or do you want to leave them Unprocessed?"+Char:C90(13)+Char:C90(13)+"Batch No: "+String:C10([TRANSACTION_BATCHES:30]Batch_Number:10); "Post"; "Try again"; "Unprocessed")
				Else 
					Gen_Confirm3("Are you now ready to Post or Batch these Transactions?"+Char:C90(13)+Char:C90(13)+"Batch No: "+String:C10([TRANSACTION_BATCHES:30]Batch_Number:10); "Post"; "Try again"; "Batch")
				End if 
				If (OK=1) | (xNext=1)
					If (xNext=1)
						If (DB_GetLedgerAllowUnproc)
							TransB_InCalc
							// TransactionBatch_PostCh (1)
							//  If (OK=1)
							ACCEPT:C269
							//   End if
						Else 
							TransB_InCalc
							TransactionBatch_PostCh(1)
							If (OK=1)
								[TRANSACTION_BATCHES:30]State:15:=1
								ACCEPT:C269
							End if 
						End if 
					Else 
						If (DB_GetLedgerAllowUnproc)
							Gen_Confirm("Post the Transactions now or Batch them?"; "Post now"; "Batch")
						End if 
						If (OK=0)
							TransB_InCalc
							TransactionBatch_PostCh(1)
							If (OK=1)
								[TRANSACTION_BATCHES:30]State:15:=1
								ACCEPT:C269
							End if 
						Else 
							TransB_InCalc
							TransactionBatch_PostCh(1)
							If (OK=1)
								If (vAdd=0)
									//  START TRANSACTION
									StartTransaction  // 13/05/02 pb
									
								End if 
								$Lay:=DB_t_CurrentFormUsage2
								DB_t_CurrentFormUsage2:="NBat"
								$_l_TransPostStatus:=TransactionBatch_Post(0)
								DB_t_CurrentFormUsage2:=$Lay
								If (vAdd=0)
									If ($_l_TransPostStatus>=0)
										Transact_End
									Else 
										Transact_End(False:C215)
									End if 
								End if 
								If (OK=1) & ($_l_TransPostStatus>=0)
									TransB_InCalc
									ACCEPT:C269
								Else 
									CANCEL:C270
								End if 
							End if 
						End if 
					End if 
					
				End if 
			End if 
		Else 
			CANCEL:C270
		End if 
	Else 
		CANCEL:C270
	End if 
Else 
	CANCEL:C270
End if 
//If (vAdd=1)
// Gen_Confirm ("Are you now ready to post this Transactions Batch?";"Yes";"Try ag
// If (OK=1)
//  If ([TRANS IN]Batch No=0)
//   BatchNo
//   If ([TRANS IN]Batch No=0)
//   CANCEL
//   End if
// End if
// If (OK=1)
// TransB_InCalc
//  ACCEPT
//  End if
//  End if
//Else
//  ACCEPT
//End if
ERR_MethodTrackerReturn("TransB_InLPA"; $_t_oldMethodName)
