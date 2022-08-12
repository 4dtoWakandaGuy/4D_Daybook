//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_ReverseSelectedBatches
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/02/2013 15:51
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Continue)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283($_l_BatchNo; $_l_CountRecords; $_l_DuplicateIndex; $_l_TransPostStatus; DB_l_CurrentDisplayedForm; DB_l_MaxRecords; DS_l_BATCHITEMRef)
	C_TEXT:C284($_t_oldMethodName; $_t_toPeriodCOde; DB_t_CurrentContext)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("ACC_ReverseSelectedBatches")
CREATE SET:C116([TRANSACTION_BATCHES:30]; "$Temp")
If (Records in set:C195("ListboxSet0")>0)
	USE SET:C118("ListboxSet0")
	$_bo_Continue:=True:C214
Else 
	$_bo_Continue:=False:C215
	Gen_Confirm("Select all for reversal?"; "No"; "Yes")
	If (OK=0)
		$_bo_Continue:=True:C214
	End if 
End if 
If ($_bo_Continue)
	QUERY SELECTION:C341([TRANSACTION_BATCHES:30]; [TRANSACTION_BATCHES:30]Reverse:14=False:C215)
	
	If (Records in selection:C76([TRANSACTION_BATCHES:30])>0)
		$_t_toPeriodCOde:=Substring:C12(Gen_Request("Post into Period:"); 1; 7)
		QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_t_toPeriodCOde)
		Check_PerClose
		$_t_toPeriodCOde:=[PERIODS:33]Period_Code:1
		If ($_t_toPeriodCOde#"")
			
			Gen_Confirm("Post "+String:C10(Records in selection:C76([TRANSACTION_BATCHES:30]))+" Reversed Batches?"; "Yes"; "No")
			If (OK=1)
				READ WRITE:C146([TRANSACTION_BATCHES:30])
				READ WRITE:C146([TRANSACTION_BATCH_ITEMS:155])
				
				CREATE SET:C116([TRANSACTION_BATCHES:30]; "$Master")
				While (Records in set:C195("$Master")>0)
					USE SET:C118("$Master")
					FIRST RECORD:C50([TRANSACTION_BATCHES:30])
					ONE RECORD SELECT:C189([TRANSACTION_BATCHES:30])
					CREATE SET:C116([TRANSACTION_BATCHES:30]; "$Extra")
					DIFFERENCE:C122("$Master"; "$Extra"; "$Master")
					StartTransaction
					[TRANSACTION_BATCHES:30]Reverse:14:=False:C215
					$_l_BatchNo:=[TRANSACTION_BATCHES:30]Batch_Number:10
					DB_SaveRecord(->[TRANSACTION_BATCHES:30])
					DUPLICATE RECORD:C225([TRANSACTION_BATCHES:30])
					If ([TRANSACTION_BATCHES:30]Description:12#"")
						[TRANSACTION_BATCHES:30]Description:12:="Reversal of Batch "+String:C10([TRANSACTION_BATCHES:30]Batch_Number:10)+" :"+[TRANSACTION_BATCHES:30]Description:12
					Else 
						[TRANSACTION_BATCHES:30]Description:12:="Reversal of Batch "+String:C10([TRANSACTION_BATCHES:30]Batch_Number:10)
					End if 
					BatchNo
					[TRANSACTION_BATCHES:30]Entry_Date:6:=<>DB_d_CurrentDate
					[TRANSACTION_BATCHES:30]Batch_Date:1:=<>DB_d_CurrentDate
					
					QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=$_l_BatchNo)
					CREATE SET:C116([TRANSACTION_BATCH_ITEMS:155]; "$DupSet")
					$_l_CountRecords:=Records in selection:C76([TRANSACTION_BATCH_ITEMS:155])
					For ($_l_DuplicateIndex; 1; $_l_CountRecords)
						USE SET:C118("$DupSet")
						GOTO SELECTED RECORD:C245([TRANSACTION_BATCH_ITEMS:155]; $_l_DuplicateIndex)
						DUPLICATE RECORD:C225([TRANSACTION_BATCH_ITEMS:155])
						[TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31:=[TRANSACTION_BATCHES:30]Batch_Number:10
						[TRANSACTION_BATCH_ITEMS:155]ID:30:=0
						[TRANSACTION_BATCH_ITEMS:155]ID:30:=AA_GetNextID(->[TRANSACTION_BATCH_ITEMS:155]ID:30)
						[TRANSACTION_BATCH_ITEMS:155]CreditTransID:26:=0
						[TRANSACTION_BATCH_ITEMS:155]DebitTransID:27:=0
						TransB_LineRev
						[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5:=<>DB_d_CurrentDate
						[TRANSACTION_BATCH_ITEMS:155]Period_Code:11:=$_t_toPeriodCOde
						[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=0
						[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=AA_GetNextIDinMethod(->DS_l_BATCHITEMRef)
						DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
					End for 
					QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTION_BATCHES:30]Batch_Number:10)
					DB_SaveRecord(->[TRANSACTION_BATCHES:30])
					$_l_TransPostStatus:=TransactionBatch_Post
					If ($_l_TransPostStatus>=0)
						//VALIDATE TRANSACTION
						Transact_End(True:C214)
					Else 
						Gen_Alert("Reversing of Batch no "+String:C10($_l_BatchNo)+" Failed")
						//CANCEL TRANSACTION
						Transact_End(False:C215)
					End if 
					
				End while 
				UNLOAD RECORD:C212([TRANSACTION_BATCHES:30])
				UNLOAD RECORD:C212([TRANSACTION_BATCH_ITEMS:155])
				READ ONLY:C145([TRANSACTION_BATCH_ITEMS:155])
				READ ONLY:C145([TRANSACTION_BATCHES:30])
				
			End if 
		End if 
	End if 
	USE SET:C118("$temp")
	QUERY SELECTION:C341([TRANSACTION_BATCHES:30]; [TRANSACTION_BATCHES:30]Reverse:14=False:C215)
	DB_l_MaxRecords:=Records in selection:C76([TRANSACTION_BATCHES:30])
	SEL_UpdateRecordCache(Table:C252(->[TRANSACTION_BATCHES:30]))
End if 
DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
DB_SetFormMenuoptions
ERR_MethodTrackerReturn("ACC_ReverseSelectedBatches"; $_t_oldMethodName)
