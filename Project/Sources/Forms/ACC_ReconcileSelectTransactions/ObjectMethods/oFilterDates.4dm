If (False:C215)
	//object Method Name: Object Name:      ACC_ReconcileSelectTransactions.oFilterDates
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/03/2012 23:30
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(ABR_abo_UNSelected;0)
	ARRAY DATE:C224($_ad_AllocationDates; 0)
	ARRAY DATE:C224($_ad_AllocationReceiptDates; 0)
	ARRAY DATE:C224($_ad_AllocationReceiptDates2; 0)
	ARRAY DATE:C224($_ad_BatchTransactionDates; 0)
	ARRAY DATE:C224($_ad_CCDate; 0)
	ARRAY DATE:C224($_ad_InvBatchTransactionDates; 0)
	ARRAY DATE:C224($_ad_ReceiptDates2; 0)
	//ARRAY INTEGER(ABR_ad_unResolvedDate;0)
	ARRAY LONGINT:C221($_al_AllocationCCIDS; 0)
	ARRAY LONGINT:C221($_al_AllocationTransactionIDS; 0)
	ARRAY LONGINT:C221($_al_BatchNos; 0)
	ARRAY LONGINT:C221($_al_BatchTransactionIDS; 0)
	ARRAY LONGINT:C221($_al_CCIDS; 0)
	ARRAY LONGINT:C221($_al_InvBatchTransactionIDS; 0)
	ARRAY LONGINT:C221($_al_InvItemBatchNos; 0)
	ARRAY LONGINT:C221($_al_ReceiptTransactionIDS2; 0)
	ARRAY LONGINT:C221($_al_UNTransactionID; 0)
	ARRAY LONGINT:C221($_al_allocationTransactionIDS; 0)
	//ARRAY LONGINT(ABR_al_unResolvedBatch;0)
	//ARRAY LONGINT(ABR_al_UNTransactionID;0)
	//ARRAY LONGINT(CCM_al_CardTypes;0)
	//ARRAY LONGINT(STG_al_Selected;0)
	ARRAY REAL:C219($_ar_AllocationAmounts; 0)
	ARRAY REAL:C219($_ar_AllocationInvoiceAmounts; 0)
	ARRAY REAL:C219($_ar_AllocationsAmounts2; 0)
	ARRAY REAL:C219($_ar_InvBatchItemAmounts; 0)
	ARRAY REAL:C219($_ar_TRYUNReconcilledAmt; 0)
	//ARRAY REAL(ABR_ar_AlreadyReconciledAmount;0)
	//ARRAY REAL(ABR_ar_TransactionBalance;0)
	//ARRAY REAL(ABR_ar_TRYUNReconcilledAmt;0)
	//ARRAY REAL(ABR_ar_unResolvedTRAmount;0)
	ARRAY TEXT:C222($_at_AllocationInvoice2; 0)
	ARRAY TEXT:C222($_at_AllocationInvoiceNumber; 0)
	ARRAY TEXT:C222($_at_AllocationReceipts; 0)
	ARRAY TEXT:C222($_at_AllocationReceipts2; 0)
	ARRAY TEXT:C222($_at_CCInformation; 0)
	ARRAY TEXT:C222($_at_CCMReceiptReference; 0)
	ARRAY TEXT:C222($_at_InvBatchItemInvoices; 0)
	ARRAY TEXT:C222($_at_InvoiceNumber; 0)
	ARRAY TEXT:C222($_at_SelectedCardTypes; 0)
	//ARRAY TEXT(ABR_at_AccountCodesRange;0)
	//ARRAY TEXT(ABR_at_FilterTypes;0)
	//ARRAY TEXT(ABR_at_unCurrencyCode;0)
	//ARRAY TEXT(ABR_at_unResolvedAccountCOde;0)
	//ARRAY TEXT(ABR_at_UnResolvedCheque;0)
	//ARRAY TEXT(ABR_at_unResolvedDescription;0)
	//ARRAY TEXT(ABR_at_unResolvedPeriod;0)
	//ARRAY TEXT(CCM_at_CardTypes;0)
	C_DATE:C307($_d_CoreDate)
	C_LONGINT:C283($_l_AddedItemID; $_l_CardIndex; $_l_CharacterPosition; $_l_Event; $_l_ListID; $_l_Security; $_l_TransactionRow; $_l_TransationsIndex; $_l_UnresolvedIndex; ABR_l_FilterDates)
	C_REAL:C285($_r_NegativeAmount; $_r_Sum; $_r_ToReconcile; ACC_R_RemainingtoReconcile)
	C_TEXT:C284($_t_ChequeNumber; $_t_NameOnCard; $_t_oldMethodName; ABR_t_checkno; CC_T_CCX99999999999; CC_T_InvisibleCardNumber; CCM_T_CardNumber)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [projectForm]/ACC_ReconcileSelectTransactions/oFilterDates"; Form event code:C388)

$_l_Event:=Form event code:C388
Case of 
	: ($_l_Event=On Data Change:K2:15)
		
		$_d_CoreDate:=[ACC_Bank_Statements:198]Bank_TransactionDate:5
		USE NAMED SELECTION:C332("ToReconcile")
		ORDER BY:C49([TRANSACTIONS:29]; [TRANSACTIONS:29]Trans_Date:5; >)
		
		FIRST RECORD:C50([TRANSACTIONS:29])
		If ($_d_CoreDate-ABR_l_FilterDates<[TRANSACTIONS:29]Trans_Date:5)
			If (Size of array:C274(ABR_at_AccountCodesRange)>1)
				QUERY WITH ARRAY:C644([TRANSACTIONS:29]Account_Code:3; ABR_at_AccountCodesRange)
			Else 
				QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Account_Code:3=ABR_at_AccountCodesRange{1})
			End if 
			QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Reconciled:14=False:C215)
			$_l_CharacterPosition:=Position:C15("<CHECKNUM>"; [ACC_Bank_Statements:198]Bank_Transaction_Details:7)
			If ($_l_CharacterPosition>0)
				CREATE SET:C116([TRANSACTIONS:29]; "$temp")
				$_t_ChequeNumber:=Substring:C12([ACC_Bank_Statements:198]Bank_Transaction_Details:7; $_l_CharacterPosition+Length:C16("<CHECKNUM>"))
				
				$_l_CharacterPosition:=Position:C15(Char:C90(9); $_t_ChequeNumber)
				If ($_l_CharacterPosition=0)
					$_l_CharacterPosition:=Position:C15(" "; $_t_ChequeNumber)
				End if 
				If ($_l_CharacterPosition>0)
					$_t_ChequeNumber:=Substring:C12($_t_ChequeNumber; 1; $_l_CharacterPosition-1)
				End if 
				If ($_t_ChequeNumber#"")
					QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Cheque_Number:13=$_t_ChequeNumber)
					If (Records in selection:C76([TRANSACTIONS:29])=0)
						USE SET:C118("$temp")
					Else 
						$_r_Sum:=Sum:C1([TRANSACTIONS:29]Total:17)
						If ($_r_Sum<$_r_ToReconcile)
							USE SET:C118("$temp")
						End if 
					End if 
				End if 
			End if 
			//QUERY SELECTION([TRANSACTIONS];[TRANSACTIONS]Total=$3)
			//TRACE
			CREATE SET:C116([TRANSACTIONS:29]; "$temp")
			QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]ReconcilledAmount:34>0)
			If (Records in selection:C76([TRANSACTIONS:29])>0)
				CREATE SET:C116([TRANSACTIONS:29]; "$temp2")
				QUERY SELECTION BY FORMULA:C207([TRANSACTIONS:29]; [TRANSACTIONS:29]ReconcilledAmount:34<[TRANSACTIONS:29]Total:17)
				CREATE SET:C116([TRANSACTIONS:29]; "$temp3")
				DIFFERENCE:C122("$temp"; "$temp2"; "$temp")
				UNION:C120("$temp3"; "$temp"; "$temp")
				
				
			End if 
			USE SET:C118("$temp")
			
			
			CREATE SET:C116([TRANSACTIONS:29]; "ToReconcileset")
			QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31=0)
			If (Records in selection:C76([TRANSACTIONS:29])>0)
				READ WRITE:C146([TRANSACTIONS:29])
				APPLY TO SELECTION:C70([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31:=AA_GetNextID(->[TRANSACTIONS:29]Transaction_ID:31))
				UNLOAD RECORD:C212([TRANSACTIONS:29])
				READ ONLY:C145([TRANSACTIONS:29])
			End if 
			USE SET:C118("ToReconcileset")
			
			//These are all the transaction that COULD be reconcilled agains this amount.
			//This could be a lot of records. so now we will let the user select the ones that reconcille against this transaction
			COPY ARRAY:C226(ABR_al_UNTransactionID; $_al_UNTransactionID)
			COPY ARRAY:C226(ABR_ar_TRYUNReconcilledAmt; $_ar_TRYUNReconcilledAmt)
			ARRAY REAL:C219(ABR_ar_TRYUNReconcilledAmt; 0)
			ARRAY REAL:C219(ABR_ar_TransactionBalance; 0)
			ARRAY BOOLEAN:C223(ABR_abo_UNSelected; 0)
			
			//we will then verify that the SUM of selected records do not exceed the amount-if they do then it they cannot be assigned
			SELECTION TO ARRAY:C260([TRANSACTIONS:29]Account_Code:3; ABR_at_unResolvedAccountCOde; [TRANSACTIONS:29]Batch_Number:7; ABR_al_unResolvedBatch; [TRANSACTIONS:29]Cheque_Number:13; ABR_at_UnResolvedCheque; [TRANSACTIONS:29]Currency_Code:22; ABR_at_unCurrencyCode; [TRANSACTIONS:29]Entry_Date:11; ABR_ad_unResolvedDate; [TRANSACTIONS:29]Period_Code:12; ABR_at_unResolvedPeriod; [TRANSACTIONS:29]Total:17; ABR_ar_unResolvedTRAmount; [TRANSACTIONS:29]Description:8; ABR_at_unResolvedDescription)
			SELECTION TO ARRAY:C260([TRANSACTIONS:29]Transaction_ID:31; ABR_al_UNTransactionID; [TRANSACTIONS:29]ReconcilledAmount:34; ABR_ar_AlreadyReconciledAmount)
			ARRAY REAL:C219(ABR_ar_TRYUNReconcilledAmt; Size of array:C274(ABR_al_UNTransactionID))
			ARRAY REAL:C219(ABR_ar_TransactionBalance; Size of array:C274(ABR_al_UNTransactionID))
			ARRAY BOOLEAN:C223(ABR_abo_UNSelected; Size of array:C274(ABR_al_UNTransactionID))
			For ($_l_TransationsIndex; 1; Size of array:C274(ABR_al_UNTransactionID))
				ABR_ar_TransactionBalance{$_l_TransationsIndex}:=ABR_ar_unResolvedTRAmount{$_l_TransationsIndex}-ABR_ar_AlreadyReconciledAmount{$_l_TransationsIndex}
				$_l_TransactionRow:=Find in array:C230($_al_UNTransactionID; ABR_al_UNTransactionID{$_l_TransationsIndex})
				If ($_l_TransactionRow>0)
					If ($_ar_TRYUNReconcilledAmt{$_l_TransactionRow}#0)
						ABR_ar_TRYUNReconcilledAmt{$_l_TransationsIndex}:=$_ar_TRYUNReconcilledAmt{$_l_TransactionRow}
						ABR_abo_UNSelected{$_l_TransationsIndex}:=True:C214
					End if 
				End if 
			End for 
			COPY NAMED SELECTION:C331([TRANSACTIONS:29]; "ToReconcile")
			COPY NAMED SELECTION:C331([TRANSACTIONS:29]; "ToReconcileFilteredByDate")
		Else 
			QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Trans_Date:5>=($_d_CoreDate-ABR_l_FilterDates); *)
			QUERY SELECTION:C341([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Trans_Date:5<=$_d_CoreDate+ABR_l_FilterDates)
			//Note that the named selection does not get changed here
			ORDER BY:C49([TRANSACTIONS:29]; [TRANSACTIONS:29]Trans_Date:5; >)
			
			COPY NAMED SELECTION:C331([TRANSACTIONS:29]; "ToReconcileFilteredByDate")
			COPY ARRAY:C226(ABR_al_UNTransactionID; $_al_UNTransactionID)
			COPY ARRAY:C226(ABR_ar_TRYUNReconcilledAmt; $_ar_TRYUNReconcilledAmt)
			ARRAY REAL:C219(ABR_ar_TRYUNReconcilledAmt; 0)
			ARRAY REAL:C219(ABR_ar_TransactionBalance; 0)
			ARRAY BOOLEAN:C223(ABR_abo_UNSelected; 0)
			SELECTION TO ARRAY:C260([TRANSACTIONS:29]Account_Code:3; ABR_at_unResolvedAccountCOde; [TRANSACTIONS:29]Batch_Number:7; ABR_al_unResolvedBatch; [TRANSACTIONS:29]Cheque_Number:13; ABR_at_UnResolvedCheque; [TRANSACTIONS:29]Currency_Code:22; ABR_at_unCurrencyCode; [TRANSACTIONS:29]Entry_Date:11; ABR_ad_unResolvedDate; [TRANSACTIONS:29]Period_Code:12; ABR_at_unResolvedPeriod; [TRANSACTIONS:29]Total:17; ABR_ar_unResolvedTRAmount; [TRANSACTIONS:29]Description:8; ABR_at_unResolvedDescription)
			SELECTION TO ARRAY:C260([TRANSACTIONS:29]Transaction_ID:31; ABR_al_UNTransactionID; [TRANSACTIONS:29]ReconcilledAmount:34; ABR_ar_AlreadyReconciledAmount)
			ARRAY REAL:C219(ABR_ar_TRYUNReconcilledAmt; Size of array:C274(ABR_al_UNTransactionID))
			ARRAY REAL:C219(ABR_ar_TransactionBalance; Size of array:C274(ABR_al_UNTransactionID))
			ARRAY BOOLEAN:C223(ABR_abo_UNSelected; Size of array:C274(ABR_al_UNTransactionID))
			For ($_l_TransationsIndex; 1; Size of array:C274(ABR_al_UNTransactionID))
				ABR_ar_TransactionBalance{$_l_TransationsIndex}:=ABR_ar_unResolvedTRAmount{$_l_TransationsIndex}-ABR_ar_AlreadyReconciledAmount{$_l_TransationsIndex}
				$_l_TransactionRow:=Find in array:C230($_al_UNTransactionID; ABR_al_UNTransactionID{$_l_TransationsIndex})
				If ($_l_TransactionRow>0)
					If ($_ar_TRYUNReconcilledAmt{$_l_TransactionRow}#0)
						ABR_ar_TRYUNReconcilledAmt{$_l_TransationsIndex}:=$_ar_TRYUNReconcilledAmt{$_l_TransactionRow}
						ABR_abo_UNSelected{$_l_TransationsIndex}:=True:C214
					End if 
				End if 
			End for 
			
		End if 
		Case of 
				
			: (ABR_at_FilterTypes{ABR_at_FilterTypes}="Find Sales Invoice payment")
				If (ABR_l_FilterDates>0)
					USE NAMED SELECTION:C332("ToReconcileFilteredByDate")
				Else 
					USE NAMED SELECTION:C332("ToReconcile")
				End if 
				QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Invoice_Number:4#"")
				QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Description:8="@"+"Invoice"+"@")
				
				
				If (Records in selection:C76([TRANSACTIONS:29])>0)
					COPY ARRAY:C226(ABR_al_UNTransactionID; $_al_UNTransactionID)
					COPY ARRAY:C226(ABR_ar_TRYUNReconcilledAmt; $_ar_TRYUNReconcilledAmt)
					ARRAY REAL:C219(ABR_ar_TRYUNReconcilledAmt; 0)
					ARRAY REAL:C219(ABR_ar_TransactionBalance; 0)
					ARRAY BOOLEAN:C223(ABR_abo_UNSelected; 0)
					SELECTION TO ARRAY:C260([TRANSACTIONS:29]Account_Code:3; ABR_at_unResolvedAccountCOde; [TRANSACTIONS:29]Batch_Number:7; ABR_al_unResolvedBatch; [TRANSACTIONS:29]Cheque_Number:13; ABR_at_UnResolvedCheque; [TRANSACTIONS:29]Currency_Code:22; ABR_at_unCurrencyCode; [TRANSACTIONS:29]Entry_Date:11; ABR_ad_unResolvedDate; [TRANSACTIONS:29]Period_Code:12; ABR_at_unResolvedPeriod; [TRANSACTIONS:29]Total:17; ABR_ar_unResolvedTRAmount; [TRANSACTIONS:29]Description:8; ABR_at_unResolvedDescription)
					SELECTION TO ARRAY:C260([TRANSACTIONS:29]Transaction_ID:31; ABR_al_UNTransactionID; [TRANSACTIONS:29]ReconcilledAmount:34; ABR_ar_AlreadyReconciledAmount)
					ARRAY REAL:C219(ABR_ar_TRYUNReconcilledAmt; Size of array:C274(ABR_al_UNTransactionID))
					ARRAY REAL:C219(ABR_ar_TransactionBalance; Size of array:C274(ABR_al_UNTransactionID))
					ARRAY BOOLEAN:C223(ABR_abo_UNSelected; Size of array:C274(ABR_al_UNTransactionID))
					For ($_l_TransationsIndex; 1; Size of array:C274(ABR_al_UNTransactionID))
						ABR_ar_TransactionBalance{$_l_TransationsIndex}:=ABR_ar_unResolvedTRAmount{$_l_TransationsIndex}-ABR_ar_AlreadyReconciledAmount{$_l_TransationsIndex}
						$_l_TransactionRow:=Find in array:C230($_al_UNTransactionID; ABR_al_UNTransactionID{$_l_TransationsIndex})
						If ($_l_TransactionRow>0)
							If ($_ar_TRYUNReconcilledAmt{$_l_TransactionRow}#0)
								ABR_ar_TRYUNReconcilledAmt{$_l_TransationsIndex}:=$_ar_TRYUNReconcilledAmt{$_l_TransactionRow}
								ABR_abo_UNSelected{$_l_TransationsIndex}:=True:C214
							End if 
						End if 
					End for 
				Else 
					Gen_Alert("There are no Invoice Payments to reconcile")
				End if 
				
			: (ABR_at_FilterTypes{ABR_at_FilterTypes}="Find Credit Card sales Payments")
				
				ARRAY TEXT:C222(CCM_at_CardTypes; 0)
				ARRAY LONGINT:C221(CCM_al_CardTypes; 0)
				$_l_ListID:=AA_LoadList(->[xCreditCardDetails:132]Card_TypeNUM:4; ->CCM_at_CARDTYPES; ->CCM_al_CardTypes; False:C215)
				If (Size of array:C274(CCM_al_CardTypes)=0)
					$_l_AddedItemID:=AA_ListAddItem(->[xCreditCardDetails:132]Card_TypeNUM:4; "Visa"; "Amex"; "Mastercard")
				End if 
				APPEND TO ARRAY:C911(CCM_at_CARDTYPES; "ALL")
				ARRAY LONGINT:C221(STG_al_Selected; 0)
				ARRAY LONGINT:C221(STG_al_Selected; Size of array:C274(CCM_at_CARDTYPES))
				GEN_AskSelection(260; 180; "Select Card Type "; "Card Types.."; ->STG_al_Selected; "CCM_at_CARDTYPES"; "Card Type"; "180"; "False")
				ARRAY TEXT:C222($_at_SelectedCardTypes; 0)
				If (STG_al_Selected{Size of array:C274(STG_al_Selected)}=1)
					For ($_l_TransationsIndex; 1; Size of array:C274(STG_al_Selected)-1)
						APPEND TO ARRAY:C911($_at_SelectedCardTypes; CCM_at_CARDTYPES{$_l_TransationsIndex})
					End for 
				Else 
					For ($_l_TransationsIndex; 1; Size of array:C274(STG_al_Selected)-1)
						If (STG_al_Selected{$_l_TransationsIndex}=1)
							APPEND TO ARRAY:C911($_at_SelectedCardTypes; CCM_at_CARDTYPES{$_l_TransationsIndex})
						End if 
					End for 
				End if 
				
				If (ABR_l_FilterDates>0)
					USE NAMED SELECTION:C332("ToReconcileFilteredByDate")
				Else 
					USE NAMED SELECTION:C332("ToReconcile")
				End if 
				
				QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Invoice_Number:4#"")
				//QUERY SELECTION([TRANSACTIONS];[TRANSACTIONS]Invoice No="60488")
				COPY NAMED SELECTION:C331([TRANSACTIONS:29]; "$temp4")
				QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Invoice_Number:4="Multiple")
				//ARRAY TEXT($AllocatonInvoice2;0)
				ARRAY REAL:C219($_ar_AllocationsAmounts2; 0)
				
				ARRAY DATE:C224($_ad_ReceiptDates2; 0)
				ARRAY LONGINT:C221($_al_ReceiptTransactionIDS2; 0)
				If (Records in selection:C76([TRANSACTIONS:29])>0)
					SELECTION TO ARRAY:C260([TRANSACTIONS:29]Batch_Number:7; $_al_BatchNos; [TRANSACTIONS:29]Transaction_ID:31; $_al_BatchTransactionIDS; [TRANSACTIONS:29]Trans_Date:5; $_ad_BatchTransactionDates)
					QUERY WITH ARRAY:C644([TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31; $_al_BatchNos)
					QUERY SELECTION:C341([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4#""; *)
					QUERY SELECTION:C341([TRANSACTION_BATCH_ITEMS:155];  & ; [TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4#"Multiple")
					SELECTION TO ARRAY:C260([TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31; $_al_InvItemBatchNos; [TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4; $_at_InvBatchItemInvoices; [TRANSACTION_BATCH_ITEMS:155]Total:9; $_ar_InvBatchItemAmounts)
					ARRAY LONGINT:C221($_al_InvBatchTransactionIDS; 0)
					ARRAY LONGINT:C221($_al_InvBatchTransactionIDS; Size of array:C274($_al_InvItemBatchNos))
					ARRAY DATE:C224($_ad_InvBatchTransactionDates; 0)
					ARRAY DATE:C224($_ad_InvBatchTransactionDates; Size of array:C274($_al_InvItemBatchNos))
					For ($_l_TransationsIndex; 1; Size of array:C274($_al_InvItemBatchNos))
						$_l_TransactionRow:=Find in array:C230($_al_BatchNos; $_al_InvItemBatchNos{$_l_TransationsIndex})
						If ($_l_TransactionRow>0)  //it should be
							$_al_InvBatchTransactionIDS{$_l_TransationsIndex}:=$_al_BatchTransactionIDS{$_l_TransactionRow}
							$_ad_InvBatchTransactionDates{$_l_TransationsIndex}:=$_ad_BatchTransactionDates{$_l_TransactionRow}
						End if 
					End for 
					
					//we are looking for receipts for those amounts..
					QUERY WITH ARRAY:C644([INVOICES_ALLOCATIONS:162]INVOICES_CODE:6; $_at_InvBatchItemInvoices)
					QUERY SELECTION:C341([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]Invoice_Number:1="*R@")
					//```
					SELECTION TO ARRAY:C260([INVOICES_ALLOCATIONS:162]INVOICES_CODE:6; $_at_AllocationInvoice2; [INVOICES_ALLOCATIONS:162]Amount:2; $_ar_AllocationsAmounts2; [INVOICES_ALLOCATIONS:162]Date:3; $_ad_AllocationReceiptDates2; [INVOICES_ALLOCATIONS:162]Invoice_Number:1; $_at_AllocationReceipts2)
					ARRAY LONGINT:C221($_al_ReceiptTransactionIDS2; 0)
					ARRAY LONGINT:C221($_al_ReceiptTransactionIDS2; Size of array:C274($_at_AllocationInvoice2))
					For ($_l_TransationsIndex; 1; Size of array:C274($_al_ReceiptTransactionIDS2))
						$_l_TransactionRow:=Find in array:C230($_at_InvBatchItemInvoices; $_at_AllocationInvoice2{$_l_TransationsIndex})
						If ($_l_TransactionRow>0)  //it should be!
							$_al_ReceiptTransactionIDS2{$_l_TransationsIndex}:=$_al_InvBatchTransactionIDS{$_l_TransactionRow}
						End if 
					End for 
					
					SORT ARRAY:C229($_at_AllocationInvoice2; $_ar_AllocationsAmounts2; $_at_AllocationReceipts2; $_ad_AllocationReceiptDates2; $_al_ReceiptTransactionIDS2)
					For ($_l_TransationsIndex; Size of array:C274($_at_AllocationInvoice2); 1; -1)
						$_l_TransactionRow:=Find in array:C230($_at_InvBatchItemInvoices; $_at_AllocationInvoice2{$_l_TransationsIndex})
						If ($_ar_InvBatchItemAmounts{$_l_TransactionRow}#$_ar_AllocationsAmounts2{$_l_TransationsIndex}) | ($_ad_InvBatchTransactionDates{$_l_TransactionRow}#$_ad_AllocationReceiptDates2{$_l_TransationsIndex})
							DELETE FROM ARRAY:C228($_at_AllocationInvoice2; $_l_TransationsIndex)
							DELETE FROM ARRAY:C228($_ar_AllocationsAmounts2; $_l_TransationsIndex)
							DELETE FROM ARRAY:C228($_ad_AllocationReceiptDates2; $_l_TransationsIndex)
							DELETE FROM ARRAY:C228($_at_AllocationReceipts2; $_l_TransationsIndex)
							DELETE FROM ARRAY:C228($_al_ReceiptTransactionIDS2; $_l_TransationsIndex)
						End if 
					End for 
					
					//```
					USE NAMED SELECTION:C332("$Temp4")
					QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Invoice_Number:4#"Multiple")
				Else 
					//ARRAY TEXT($AllocatonInvoice2;0)
					ARRAY REAL:C219($_ar_AllocationsAmounts2; 0)
					
					ARRAY DATE:C224($_ad_ReceiptDates2; 0)
					ARRAY LONGINT:C221($_al_ReceiptTransactionIDS2; 0)
					
					
					USE NAMED SELECTION:C332("$Temp4")
					
				End if 
				
				
				SELECTION TO ARRAY:C260([TRANSACTIONS:29]Invoice_Number:4; $_at_InvoiceNumber; [TRANSACTIONS:29]Total:17; $_ar_AllocationAmounts; [TRANSACTIONS:29]Trans_Date:5; $_ad_AllocationDates; [TRANSACTIONS:29]Transaction_ID:31; $_al_AllocationTransactionIDS)
				//TRACE
				
				QUERY WITH ARRAY:C644([INVOICES_ALLOCATIONS:162]INVOICES_CODE:6; $_at_InvoiceNumber)
				QUERY SELECTION:C341([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]Invoice_Number:1="*R@")
				
				SELECTION TO ARRAY:C260([INVOICES_ALLOCATIONS:162]INVOICES_CODE:6; $_at_AllocationInvoiceNumber; [INVOICES_ALLOCATIONS:162]Amount:2; $_ar_AllocationInvoiceAmounts; [INVOICES_ALLOCATIONS:162]Date:3; $_ad_AllocationReceiptDates; [INVOICES_ALLOCATIONS:162]Invoice_Number:1; $_at_AllocationReceipts)
				ARRAY LONGINT:C221($_al_allocationTransactionIDS; 0)
				ARRAY LONGINT:C221($_al_allocationTransactionIDS; Size of array:C274($_at_AllocationInvoiceNumber))
				For ($_l_TransationsIndex; 1; Size of array:C274($_al_allocationTransactionIDS))
					$_l_TransactionRow:=Find in array:C230($_at_InvoiceNumber; $_at_AllocationInvoiceNumber{$_l_TransationsIndex})
					If ($_l_TransactionRow>0)
						$_al_allocationTransactionIDS{$_l_TransationsIndex}:=$_al_AllocationTransactionIDS{$_l_TransactionRow}
					End if 
					
				End for 
				
				SORT ARRAY:C229($_at_AllocationInvoiceNumber; $_ar_AllocationInvoiceAmounts; $_at_AllocationReceipts; $_ad_AllocationReceiptDates; $_al_allocationTransactionIDS)
				For ($_l_TransationsIndex; Size of array:C274($_at_AllocationInvoiceNumber); 1; -1)
					$_l_TransactionRow:=Find in array:C230($_at_InvoiceNumber; $_at_AllocationInvoiceNumber{$_l_TransationsIndex})
					If ($_ar_AllocationAmounts{$_l_TransactionRow}#$_ar_AllocationInvoiceAmounts{$_l_TransationsIndex}) | ($_ad_AllocationDates{$_l_TransactionRow}#$_ad_AllocationReceiptDates{$_l_TransationsIndex})
						DELETE FROM ARRAY:C228($_at_AllocationInvoiceNumber; $_l_TransationsIndex)
						DELETE FROM ARRAY:C228($_ar_AllocationInvoiceAmounts; $_l_TransationsIndex)
						DELETE FROM ARRAY:C228($_ad_AllocationReceiptDates; $_l_TransationsIndex)
						DELETE FROM ARRAY:C228($_at_AllocationReceipts; $_l_TransationsIndex)
						DELETE FROM ARRAY:C228($_al_allocationTransactionIDS; $_l_TransationsIndex)
					End if 
				End for 
				If (Size of array:C274($_at_AllocationInvoice2)>0)
					For ($_l_TransationsIndex; 1; Size of array:C274($_at_AllocationInvoice2))
						APPEND TO ARRAY:C911($_at_AllocationInvoiceNumber; $_at_AllocationInvoice2{$_l_TransationsIndex})
						APPEND TO ARRAY:C911($_ar_AllocationInvoiceAmounts; $_ar_AllocationsAmounts2{$_l_TransationsIndex})
						APPEND TO ARRAY:C911($_ad_AllocationReceiptDates; $_ad_AllocationReceiptDates2{$_l_TransationsIndex})
						APPEND TO ARRAY:C911($_at_AllocationReceipts; $_at_AllocationReceipts2{$_l_TransationsIndex})
						APPEND TO ARRAY:C911($_al_allocationTransactionIDS; $_al_ReceiptTransactionIDS2{$_l_TransationsIndex})
					End for 
				End if 
				
				QUERY WITH ARRAY:C644([CCM_PSPTransaction:136]xReceiptID:13; $_at_AllocationReceipts)
				SELECTION TO ARRAY:C260([CCM_PSPTransaction:136]x_CCID:8; $_al_CCIDS)
				QUERY WITH ARRAY:C644([xCreditCardDetails:132]x_ID:1; $_al_CCIDS)
				QUERY SELECTION WITH ARRAY:C1050([xCreditCardDetails:132]Card_TypeName:5; $_at_SelectedCardTypes)
				SELECTION TO ARRAY:C260([CCM_PSPTransaction:136]x_CCID:8; $_al_CCIDS)
				QUERY SELECTION WITH ARRAY:C1050([CCM_PSPTransaction:136]x_CCID:8; $_al_CCIDS)
				
				SELECTION TO ARRAY:C260([CCM_PSPTransaction:136]xReceiptID:13; $_at_AllocationReceipts2; [CCM_PSPTransaction:136]x_CCID:8; $_al_AllocationCCIDS; [CCM_PSPTransaction:136]TRANSACTION_DATE:2; $_ad_CCDate; [CCM_PSPTransaction:136]xInvoiceID:11; $_at_CCMReceiptReference)
				
				ARRAY TEXT:C222($_at_CCInformation; Size of array:C274($_at_AllocationInvoiceNumber))
				For ($_l_TransationsIndex; Size of array:C274($_at_AllocationInvoiceNumber); 1; -1)
					$_l_TransactionRow:=Find in array:C230($_at_AllocationReceipts2; $_at_AllocationReceipts{$_l_TransationsIndex})
					If ($_l_TransactionRow<0)
						DELETE FROM ARRAY:C228($_at_AllocationInvoiceNumber; $_l_TransationsIndex)
						DELETE FROM ARRAY:C228($_ar_AllocationInvoiceAmounts; $_l_TransationsIndex)
						DELETE FROM ARRAY:C228($_ad_AllocationReceiptDates; $_l_TransationsIndex)
						DELETE FROM ARRAY:C228($_at_AllocationReceipts; $_l_TransationsIndex)
						DELETE FROM ARRAY:C228($_at_CCInformation; $_l_TransationsIndex)
						DELETE FROM ARRAY:C228($_al_allocationTransactionIDS; $_l_TransationsIndex)
					Else 
						
						QUERY:C277([xCreditCardDetails:132]; [xCreditCardDetails:132]x_ID:1=$_al_AllocationCCIDS{$_l_TransactionRow})
						
						CCM_DecryptCardNumber  //Note this does not return a value it sets a specific variable
						
						//DO NOT PUBLISH THAT VARIABLE NAME ANYWHERE
						$_t_NameOnCard:=CCM_DecryptCardName
						//Only display the number if....security--actually only the last 4 digits
						$_l_Security:=4
						If (Length:C16(CC_T_CCX99999999999)>0)
							For ($_l_CardIndex; 1; Length:C16(CC_T_CCX99999999999))
								If (CC_T_CCX99999999999[[$_l_CardIndex]]=" ")
									$_l_Security:=(Length:C16(CC_T_CCX99999999999))-$_l_CardIndex
								End if 
							End for 
						End if 
						
						CCM_T_CardNumber:=""
						If (CC_T_CCX99999999999#"")
							For ($_l_CardIndex; 1; (Length:C16(CC_T_CCX99999999999)-$_l_Security))
								If (CC_T_CCX99999999999[[$_l_CardIndex]]#" ")
									CCM_T_CardNumber:=CCM_T_CardNumber+"X"
								Else 
									CCM_T_CardNumber:=CCM_T_CardNumber+" "
								End if 
							End for 
							If ($_l_Security>0) & (CC_T_CCX99999999999#"")
								CCM_T_CardNumber:=CCM_T_CardNumber+Substring:C12(CC_T_CCX99999999999; (Length:C16(CC_T_CCX99999999999)-$_l_Security); (Length:C16(CC_T_CCX99999999999)))
							End if 
							
						End if 
						$_at_CCInformation{$_l_TransationsIndex}:="Card Transaction Date "+String:C10($_ad_CCDate{$_l_TransactionRow}; 4)+" Card Number "+CCM_T_CardNumber+" "+" Name "+$_t_NameOnCard+" Receipt No "+$_at_CCMReceiptReference{$_l_TransactionRow}
					End if 
				End for 
				//we now have an array of the allocations that had a CC statement
				QUERY SELECTION WITH ARRAY:C1050([TRANSACTIONS:29]Transaction_ID:31; $_al_allocationTransactionIDS)
				
				If (Records in selection:C76([TRANSACTIONS:29])>0)
					COPY ARRAY:C226(ABR_al_UNTransactionID; $_al_UNTransactionID)
					COPY ARRAY:C226(ABR_ar_TRYUNReconcilledAmt; $_ar_TRYUNReconcilledAmt)
					ARRAY REAL:C219(ABR_ar_TRYUNReconcilledAmt; 0)
					ARRAY REAL:C219(ABR_ar_TransactionBalance; 0)
					ARRAY BOOLEAN:C223(ABR_abo_UNSelected; 0)
					SELECTION TO ARRAY:C260([TRANSACTIONS:29]Account_Code:3; ABR_at_unResolvedAccountCOde; [TRANSACTIONS:29]Batch_Number:7; ABR_al_unResolvedBatch; [TRANSACTIONS:29]Cheque_Number:13; ABR_at_UnResolvedCheque; [TRANSACTIONS:29]Currency_Code:22; ABR_at_unCurrencyCode; [TRANSACTIONS:29]Entry_Date:11; ABR_ad_unResolvedDate; [TRANSACTIONS:29]Period_Code:12; ABR_at_unResolvedPeriod; [TRANSACTIONS:29]Total:17; ABR_ar_unResolvedTRAmount; [TRANSACTIONS:29]Description:8; ABR_at_unResolvedDescription)
					SELECTION TO ARRAY:C260([TRANSACTIONS:29]Transaction_ID:31; ABR_al_UNTransactionID; [TRANSACTIONS:29]ReconcilledAmount:34; ABR_ar_AlreadyReconciledAmount)
					ARRAY REAL:C219(ABR_ar_TRYUNReconcilledAmt; Size of array:C274(ABR_al_UNTransactionID))
					For ($_l_UnresolvedIndex; 1; Size of array:C274(ABR_at_unResolvedDescription))
						$_l_TransactionRow:=Find in array:C230($_al_allocationTransactionIDS; ABR_al_UNTransactionID{$_l_UnresolvedIndex})
						ABR_at_unResolvedDescription{$_l_UnresolvedIndex}:=$_at_CCInformation{$_l_TransactionRow}
					End for 
					
				End if 
			: (ABR_at_FilterTypes{ABR_at_FilterTypes}="Find Purchase invoice payment")
				If (ABR_l_FilterDates>0)
					USE NAMED SELECTION:C332("ToReconcileFilteredByDate")
				Else 
					USE NAMED SELECTION:C332("ToReconcile")
				End if 
				QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Purchase_Code:24#"")
				QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Description:8="@"+"Purchase"+"@")
				
				
				If (Records in selection:C76([TRANSACTIONS:29])>0)
					COPY ARRAY:C226(ABR_al_UNTransactionID; $_al_UNTransactionID)
					COPY ARRAY:C226(ABR_ar_TRYUNReconcilledAmt; $_ar_TRYUNReconcilledAmt)
					ARRAY REAL:C219(ABR_ar_TRYUNReconcilledAmt; 0)
					ARRAY REAL:C219(ABR_ar_TransactionBalance; 0)
					ARRAY BOOLEAN:C223(ABR_abo_UNSelected; 0)
					SELECTION TO ARRAY:C260([TRANSACTIONS:29]Account_Code:3; ABR_at_unResolvedAccountCOde; [TRANSACTIONS:29]Batch_Number:7; ABR_al_unResolvedBatch; [TRANSACTIONS:29]Cheque_Number:13; ABR_at_UnResolvedCheque; [TRANSACTIONS:29]Currency_Code:22; ABR_at_unCurrencyCode; [TRANSACTIONS:29]Entry_Date:11; ABR_ad_unResolvedDate; [TRANSACTIONS:29]Period_Code:12; ABR_at_unResolvedPeriod; [TRANSACTIONS:29]Total:17; ABR_ar_unResolvedTRAmount; [TRANSACTIONS:29]Description:8; ABR_at_unResolvedDescription)
					SELECTION TO ARRAY:C260([TRANSACTIONS:29]Transaction_ID:31; ABR_al_UNTransactionID; [TRANSACTIONS:29]ReconcilledAmount:34; ABR_ar_AlreadyReconciledAmount)
					ARRAY REAL:C219(ABR_ar_TRYUNReconcilledAmt; Size of array:C274(ABR_al_UNTransactionID))
					ARRAY REAL:C219(ABR_ar_TransactionBalance; Size of array:C274(ABR_al_UNTransactionID))
					ARRAY BOOLEAN:C223(ABR_abo_UNSelected; Size of array:C274(ABR_al_UNTransactionID))
					For ($_l_TransationsIndex; 1; Size of array:C274(ABR_al_UNTransactionID))
						ABR_ar_TransactionBalance{$_l_TransationsIndex}:=ABR_ar_unResolvedTRAmount{$_l_TransationsIndex}-ABR_ar_AlreadyReconciledAmount{$_l_TransationsIndex}
						$_l_TransactionRow:=Find in array:C230($_al_UNTransactionID; ABR_al_UNTransactionID{$_l_TransationsIndex})
						If ($_l_TransactionRow>0)
							If ($_ar_TRYUNReconcilledAmt{$_l_TransactionRow}#0)
								ABR_ar_TRYUNReconcilledAmt{$_l_TransationsIndex}:=$_ar_TRYUNReconcilledAmt{$_l_TransactionRow}
								ABR_abo_UNSelected{$_l_TransationsIndex}:=True:C214
							End if 
						End if 
					End for 
				Else 
					Gen_Alert("There are no Purchase Payments to reconcile")
				End if 
				
			: (ABR_at_FilterTypes{ABR_at_FilterTypes}="Find other transactions")
				If (ABR_l_FilterDates>0)
					USE NAMED SELECTION:C332("ToReconcileFilteredByDate")
				Else 
					USE NAMED SELECTION:C332("ToReconcile")
				End if 
				QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Invoice_Number:4=""; *)
				QUERY SELECTION:C341([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Purchase_Code:24="")
				
				If (Records in selection:C76([TRANSACTIONS:29])>0)
					COPY ARRAY:C226(ABR_al_UNTransactionID; $_al_UNTransactionID)
					COPY ARRAY:C226(ABR_ar_TRYUNReconcilledAmt; $_ar_TRYUNReconcilledAmt)
					ARRAY REAL:C219(ABR_ar_TRYUNReconcilledAmt; 0)
					ARRAY REAL:C219(ABR_ar_TransactionBalance; 0)
					ARRAY BOOLEAN:C223(ABR_abo_UNSelected; 0)
					SELECTION TO ARRAY:C260([TRANSACTIONS:29]Account_Code:3; ABR_at_unResolvedAccountCOde; [TRANSACTIONS:29]Batch_Number:7; ABR_al_unResolvedBatch; [TRANSACTIONS:29]Cheque_Number:13; ABR_at_UnResolvedCheque; [TRANSACTIONS:29]Currency_Code:22; ABR_at_unCurrencyCode; [TRANSACTIONS:29]Entry_Date:11; ABR_ad_unResolvedDate; [TRANSACTIONS:29]Period_Code:12; ABR_at_unResolvedPeriod; [TRANSACTIONS:29]Total:17; ABR_ar_unResolvedTRAmount; [TRANSACTIONS:29]Description:8; ABR_at_unResolvedDescription)
					SELECTION TO ARRAY:C260([TRANSACTIONS:29]Transaction_ID:31; ABR_al_UNTransactionID; [TRANSACTIONS:29]ReconcilledAmount:34; ABR_ar_AlreadyReconciledAmount)
					ARRAY REAL:C219(ABR_ar_TRYUNReconcilledAmt; Size of array:C274(ABR_al_UNTransactionID))
					ARRAY REAL:C219(ABR_ar_TransactionBalance; Size of array:C274(ABR_al_UNTransactionID))
					ARRAY BOOLEAN:C223(ABR_abo_UNSelected; Size of array:C274(ABR_al_UNTransactionID))
					For ($_l_unresolvedIndex; 1; Size of array:C274(ABR_al_UNTransactionID))
						ABR_ar_TransactionBalance{$_l_unresolvedIndex}:=ABR_ar_unResolvedTRAmount{$_l_unresolvedIndex}-ABR_ar_AlreadyReconciledAmount{$_l_unresolvedIndex}
						$_l_TransactionRow:=Find in array:C230($_al_UNTransactionID; ABR_al_UNTransactionID{$_l_unresolvedIndex})
						If ($_l_TransactionRow>0)
							If ($_ar_TRYUNReconcilledAmt{$_l_TransactionRow}#0)
								ABR_ar_TRYUNReconcilledAmt{$_l_unresolvedIndex}:=$_ar_TRYUNReconcilledAmt{$_l_TransactionRow}
								ABR_abo_UNSelected{$_l_unresolvedIndex}:=True:C214
							End if 
						End if 
					End for 
				Else 
					Gen_Alert("There are no others to reconcile")
				End if 
				
				
			: (ABR_at_FilterTypes{ABR_at_FilterTypes}="Find Transactions Matching Amount")
				If (ABR_l_FilterDates>0)
					USE NAMED SELECTION:C332("ToReconcileFilteredByDate")
				Else 
					USE NAMED SELECTION:C332("ToReconcile")
				End if 
				If ([ACC_Bank_Statements:198]Bank_DebitAmount:8>0)
					$_r_NegativeAmount:=-ACC_R_RemainingtoReconcile
					
					QUERY SELECTION BY FORMULA:C207([TRANSACTIONS:29]; ([TRANSACTIONS:29]Total:17-[TRANSACTIONS:29]ReconcilledAmount:34)=$_r_NegativeAmount)
				Else 
					QUERY SELECTION BY FORMULA:C207([TRANSACTIONS:29]; ([TRANSACTIONS:29]Total:17-[TRANSACTIONS:29]ReconcilledAmount:34)=ACC_R_RemainingtoReconcile)
				End if 
				
				If (Records in selection:C76([TRANSACTIONS:29])>0)
					COPY ARRAY:C226(ABR_al_UNTransactionID; $_al_UNTransactionID)
					COPY ARRAY:C226(ABR_ar_TRYUNReconcilledAmt; $_ar_TRYUNReconcilledAmt)
					ARRAY REAL:C219(ABR_ar_TRYUNReconcilledAmt; 0)
					ARRAY REAL:C219(ABR_ar_TransactionBalance; 0)
					ARRAY BOOLEAN:C223(ABR_abo_UNSelected; 0)
					SELECTION TO ARRAY:C260([TRANSACTIONS:29]Account_Code:3; ABR_at_unResolvedAccountCOde; [TRANSACTIONS:29]Batch_Number:7; ABR_al_unResolvedBatch; [TRANSACTIONS:29]Cheque_Number:13; ABR_at_UnResolvedCheque; [TRANSACTIONS:29]Currency_Code:22; ABR_at_unCurrencyCode; [TRANSACTIONS:29]Entry_Date:11; ABR_ad_unResolvedDate; [TRANSACTIONS:29]Period_Code:12; ABR_at_unResolvedPeriod; [TRANSACTIONS:29]Total:17; ABR_ar_unResolvedTRAmount; [TRANSACTIONS:29]Description:8; ABR_at_unResolvedDescription)
					SELECTION TO ARRAY:C260([TRANSACTIONS:29]Transaction_ID:31; ABR_al_UNTransactionID; [TRANSACTIONS:29]ReconcilledAmount:34; ABR_ar_AlreadyReconciledAmount)
					ARRAY REAL:C219(ABR_ar_TRYUNReconcilledAmt; Size of array:C274(ABR_al_UNTransactionID))
				Else 
					Gen_Alert("There are no others to reconcile")
				End if 
				
			: (ABR_at_FilterTypes{ABR_at_FilterTypes}="Find by payment Reference")  //TRACE
				
				If (ABR_t_checkno#"")
					If (ABR_l_FilterDates>0)
						USE NAMED SELECTION:C332("ToReconcileFilteredByDate")
					Else 
						USE NAMED SELECTION:C332("ToReconcile")
					End if 
					
					
					QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Cheque_Number:13=ABR_t_checkno)
					If (Records in selection:C76([TRANSACTIONS:29])>0)
						COPY ARRAY:C226(ABR_al_UNTransactionID; $_al_UNTransactionID)
						COPY ARRAY:C226(ABR_ar_TRYUNReconcilledAmt; $_ar_TRYUNReconcilledAmt)
						ARRAY REAL:C219(ABR_ar_TRYUNReconcilledAmt; 0)
						ARRAY REAL:C219(ABR_ar_TransactionBalance; 0)
						ARRAY BOOLEAN:C223(ABR_abo_UNSelected; 0)
						SELECTION TO ARRAY:C260([TRANSACTIONS:29]Account_Code:3; ABR_at_unResolvedAccountCOde; [TRANSACTIONS:29]Batch_Number:7; ABR_al_unResolvedBatch; [TRANSACTIONS:29]Cheque_Number:13; ABR_at_UnResolvedCheque; [TRANSACTIONS:29]Currency_Code:22; ABR_at_unCurrencyCode; [TRANSACTIONS:29]Entry_Date:11; ABR_ad_unResolvedDate; [TRANSACTIONS:29]Period_Code:12; ABR_at_unResolvedPeriod; [TRANSACTIONS:29]Total:17; ABR_ar_unResolvedTRAmount; [TRANSACTIONS:29]Description:8; ABR_at_unResolvedDescription)
						SELECTION TO ARRAY:C260([TRANSACTIONS:29]Transaction_ID:31; ABR_al_UNTransactionID; [TRANSACTIONS:29]ReconcilledAmount:34; ABR_ar_AlreadyReconciledAmount)
						ARRAY REAL:C219(ABR_ar_TRYUNReconcilledAmt; Size of array:C274(ABR_al_UNTransactionID))
						ARRAY REAL:C219(ABR_ar_TransactionBalance; Size of array:C274(ABR_al_UNTransactionID))
						ARRAY BOOLEAN:C223(ABR_abo_UNSelected; Size of array:C274(ABR_al_UNTransactionID))
						For ($_l_UnresolvedIndex; 1; Size of array:C274(ABR_al_UNTransactionID))
							ABR_ar_TransactionBalance{$_l_UnresolvedIndex}:=ABR_ar_unResolvedTRAmount{$_l_UnresolvedIndex}-ABR_ar_AlreadyReconciledAmount{$_l_UnresolvedIndex}
							$_l_TransactionRow:=Find in array:C230($_al_UNTransactionID; ABR_al_UNTransactionID{$_l_UnresolvedIndex})
							If ($_l_TransactionRow>0)
								If ($_ar_TRYUNReconcilledAmt{$_l_TransactionRow}#0)
									ABR_ar_TRYUNReconcilledAmt{$_l_UnresolvedIndex}:=$_ar_TRYUNReconcilledAmt{$_l_TransactionRow}
									ABR_abo_UNSelected{$_l_UnresolvedIndex}:=True:C214
								End if 
							End if 
						End for 
					Else 
						Gen_Alert("The payment reference is not found")
						ABR_t_checkno:=""
					End if 
					
				End if 
				
		End case 
		
End case 
ERR_MethodTrackerReturn("OBJ ACC_ReconcileSelectTransactions.oFilterDates"; $_t_oldMethodName)
