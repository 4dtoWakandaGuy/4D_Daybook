If (False:C215)
	//object Method Name: Object Name:      ACC_ReconcileSelectTransactions.oFilterTransactions
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/03/2012 23:20
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
	ARRAY DATE:C224($_ad_ReDate; 0)
	//ARRAY INTEGER(ABR_ad_unResolvedDate;0)
	ARRAY LONGINT:C221($_al_AllocationCCIDS; 0)
	ARRAY LONGINT:C221($_al_AllocationTransactionID; 0)
	ARRAY LONGINT:C221($_al_BatchNos; 0)
	ARRAY LONGINT:C221($_al_BatchTransactionIDS; 0)
	ARRAY LONGINT:C221($_al_CCIDS; 0)
	ARRAY LONGINT:C221($_al_CCMIDS; 0)
	ARRAY LONGINT:C221($_al_includeTransactionIDS; 0)
	ARRAY LONGINT:C221($_al_invBatchTransactionIDS; 0)
	ARRAY LONGINT:C221($_al_InvItemBatchNos; 0)
	ARRAY LONGINT:C221($_al_NonCCMTransIDS; 0)
	ARRAY LONGINT:C221($_al_ReceiptCCMIDS; 0)
	ARRAY LONGINT:C221($_al_ReceiptTransactionIDS2; 0)
	ARRAY LONGINT:C221($_al_ReTransactionIDS; 0)
	ARRAY LONGINT:C221($_al_TransactionID; 0)
	ARRAY LONGINT:C221($_al_UNTransactionID; 0)
	//ARRAY LONGINT(ABR_al_unResolvedBatch;0)
	//ARRAY LONGINT(ABR_al_UNTransactionID;0)
	//ARRAY LONGINT(CCM_al_CardTypes;0)
	//ARRAY LONGINT(STG_al_Selected;0)
	ARRAY REAL:C219($_ar_AllocationAmounts; 0)
	ARRAY REAL:C219($_ar_AllocationInvoiceAmounts; 0)
	ARRAY REAL:C219($_ar_AllocationsAmounts2; 0)
	ARRAY REAL:C219($_ar_InvBatchItemAmounts; 0)
	ARRAY REAL:C219($_ar_ReAmount; 0)
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
	ARRAY TEXT:C222($_at_ExtraDescriptions; 0)
	ARRAY TEXT:C222($_at_InvBatchItemInvoices; 0)
	ARRAY TEXT:C222($_at_InvoiceNumbers; 0)
	ARRAY TEXT:C222($_at_NonCCMExtraDescriptions; 0)
	ARRAY TEXT:C222($_at_NonCCMReInvoicedNo; 0)
	ARRAY TEXT:C222($_at_ReceiptReferences; 0)
	ARRAY TEXT:C222($_at_ReInvoicedNo; 0)
	ARRAY TEXT:C222($_at_ReIReceiptNo; 0)
	ARRAY TEXT:C222($_at_SelectedCardTypes; 0)
	//ARRAY TEXT(ABR_at_FilterTypes;0)
	//ARRAY TEXT(ABR_at_unCurrencyCode;0)
	//ARRAY TEXT(ABR_at_unResolvedAccountCOde;0)
	//ARRAY TEXT(ABR_at_UnResolvedCheque;0)
	//ARRAY TEXT(ABR_at_unResolvedDescription;0)
	//ARRAY TEXT(ABR_at_unResolvedPeriod;0)
	//ARRAY TEXT(CCM_at_CardTypes;0)
	C_DATE:C307($_d_EndDate; $_d_StartDate)
	C_LONGINT:C283($_l_AddedItemID; $_l_AllocationIndex; $_l_CardIndex; $_l_CCMRow; $_l_Event; $_l_ListID; $_l_ReceiptNumber; $_l_Security; $_l_TransactionRow; $_l_TransactionsIndex; ABR_l_FilterDates)
	C_REAL:C285($_r_AbsAmount; $_r_Amount; $_r_CreditedAmount; $_r_Negative; $_r_RelatedInvoiceAmount; ACC_R_RemainingtoReconcile)
	C_TEXT:C284($_t_InvoiceNumber; $_t_NameOnCard; $_t_NextReceipt; $_t_oldMethodName; $_t_ReceiptNumber; $_t_ReceiptSubstring; ABR_t_checkno; CC_T_CCX99999999999; CC_T_InvisibleCardNumber; CCM_T_CardNumber)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [projectForm]/ACC_ReconcileSelectTransactions/oFilterTransactions"; Form event code:C388)
$_l_Event:=Form event code:C388
Case of 
	: ($_l_Event=On Clicked:K2:4)
		ABR_t_checkno:=""
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
					For ($_l_AllocationIndex; 1; Size of array:C274(ABR_al_UNTransactionID))
						ABR_ar_TransactionBalance{$_l_AllocationIndex}:=ABR_ar_unResolvedTRAmount{$_l_AllocationIndex}-ABR_ar_AlreadyReconciledAmount{$_l_AllocationIndex}
						$_l_TransactionRow:=Find in array:C230($_al_UNTransactionID; ABR_al_UNTransactionID{$_l_AllocationIndex})
						If ($_l_TransactionRow>0)
							If ($_ar_TRYUNReconcilledAmt{$_l_TransactionRow}#0)
								ABR_ar_TRYUNReconcilledAmt{$_l_AllocationIndex}:=$_ar_TRYUNReconcilledAmt{$_l_TransactionRow}
								ABR_abo_UNSelected{$_l_AllocationIndex}:=True:C214
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
					For ($_l_AllocationIndex; 1; Size of array:C274(STG_al_Selected)-1)
						APPEND TO ARRAY:C911($_at_SelectedCardTypes; CCM_at_CARDTYPES{$_l_AllocationIndex})
					End for 
				Else 
					For ($_l_AllocationIndex; 1; Size of array:C274(STG_al_Selected)-1)
						If (STG_al_Selected{$_l_AllocationIndex}=1)
							APPEND TO ARRAY:C911($_at_SelectedCardTypes; CCM_at_CARDTYPES{$_l_AllocationIndex})
						End if 
					End for 
				End if 
				If (ABR_l_FilterDates>0)
					USE NAMED SELECTION:C332("ToReconcileFilteredByDate")
				Else 
					USE NAMED SELECTION:C332("ToReconcile")
				End if 
				ORDER BY:C49([TRANSACTIONS:29]; [TRANSACTIONS:29]Trans_Date:5)
				FIRST RECORD:C50([TRANSACTIONS:29])
				$_d_StartDate:=[TRANSACTIONS:29]Trans_Date:5
				LAST RECORD:C200([TRANSACTIONS:29])
				$_d_EndDate:=[TRANSACTIONS:29]Trans_Date:5
				FIRST RECORD:C50([TRANSACTIONS:29])
				//````
				COPY NAMED SELECTION:C331([TRANSACTIONS:29]; "$temp")
				QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]TRANSACTION_TYPE:3="Credit"; *)
				QUERY:C277([CCM_PSPTransaction:136];  & ; [CCM_PSPTransaction:136]RESPONSE_STRING:5="This transaction has been approved.")
				QUERY SELECTION:C341([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]TRANSACTION_DATE:2>=$_d_StartDate)
				QUERY SELECTION:C341([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]TRANSACTION_DATE:2<=$_d_EndDate)
				ARRAY LONGINT:C221($_al_includeTransactionIDS; 0)
				ARRAY TEXT:C222($_at_ExtraDescriptions; 0)
				ARRAY LONGINT:C221($_al_CCMIDS; 0)
				ARRAY TEXT:C222($_at_ReInvoicedNo; 0)
				ARRAY REAL:C219($_ar_ReAmount; 0)
				ARRAY TEXT:C222($_at_ReIReceiptNo; 0)  //note this receipt is not on the transaction record it is on the PSP
				ARRAY DATE:C224($_ad_ReDate; 0)
				ARRAY LONGINT:C221($_al_ReTransactionIDS; 0)
				//``
				//``
				ARRAY LONGINT:C221($_al_NonCCMTransIDS; 0)
				ARRAY TEXT:C222($_at_NonCCMExtraDescriptions; 0)
				ARRAY TEXT:C222($_at_NonCCMReInvoicedNo; 0)
				For ($_l_AllocationIndex; 1; Records in selection:C76([CCM_PSPTransaction:136]))
					USE NAMED SELECTION:C332("$temp")
					QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]Invoice_Number:1=[CCM_PSPTransaction:136]xInvoiceID:11; *)
					QUERY:C277([INVOICES_ALLOCATIONS:162];  & ; [INVOICES_ALLOCATIONS:162]Amount:2<0; *)
					QUERY:C277([INVOICES_ALLOCATIONS:162];  & ; [INVOICES_ALLOCATIONS:162]Date:3=[CCM_PSPTransaction:136]TRANSACTION_DATE:2)
					$_r_Amount:=[INVOICES_ALLOCATIONS:162]Amount:2
					$_r_AbsAmount:=Abs:C99([INVOICES_ALLOCATIONS:162]Amount:2)
					$_t_InvoiceNumber:=[CCM_PSPTransaction:136]xInvoiceID:11
					$_t_ReceiptNumber:=[INVOICES_ALLOCATIONS:162]INVOICES_CODE:6
					
					QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Invoice_Number:4=[CCM_PSPTransaction:136]xInvoiceID:11; *)
					QUERY SELECTION:C341([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Amount:6=$_r_Amount)
					If (Records in selection:C76([TRANSACTIONS:29])>1)
						For ($_l_TransactionsIndex; 1; Records in selection:C76([TRANSACTIONS:29]))
							If (Find in array:C230($_al_includeTransactionIDS; [TRANSACTIONS:29]Transaction_ID:31)<0)
								APPEND TO ARRAY:C911($_al_includeTransactionIDS; [TRANSACTIONS:29]Transaction_ID:31)
							Else 
								NEXT RECORD:C51([TRANSACTIONS:29])
							End if 
						End for 
					Else 
						APPEND TO ARRAY:C911($_al_includeTransactionIDS; [TRANSACTIONS:29]Transaction_ID:31)
					End if 
					
					$_t_ReceiptSubstring:=Replace string:C233($_t_ReceiptNumber; "*R"; "")
					$_l_ReceiptNumber:=Num:C11($_t_ReceiptSubstring)
					$_l_ReceiptNumber:=$_l_ReceiptNumber+1
					$_t_NextReceipt:="*R"+String:C10($_l_ReceiptNumber)
					QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=$_t_NextReceipt; *)
					QUERY:C277([INVOICES_ALLOCATIONS:162];  & ; [INVOICES_ALLOCATIONS:162]Invoice_Number:1=$_t_InvoiceNumber)
					$_r_RelatedInvoiceAmount:=[INVOICES_ALLOCATIONS:162]Amount:2
					$_r_CreditedAmount:=$_r_AbsAmount-$_r_RelatedInvoiceAmount
					APPEND TO ARRAY:C911($_at_ExtraDescriptions; "Credit/Refund "+"Refunded amount="+String:C10($_r_CreditedAmount))
					APPEND TO ARRAY:C911($_at_ReInvoicedNo; $_t_InvoiceNumber)
					APPEND TO ARRAY:C911($_ar_ReAmount; $_r_Amount)
					APPEND TO ARRAY:C911($_ad_ReDate; [CCM_PSPTransaction:136]TRANSACTION_DATE:2)
					APPEND TO ARRAY:C911($_at_ReIReceiptNo; [CCM_PSPTransaction:136]xReceiptID:13)
					APPEND TO ARRAY:C911($_al_ReTransactionIDS; $_al_includeTransactionIDS{Size of array:C274($_al_includeTransactionIDS)})
					
					
					APPEND TO ARRAY:C911($_al_CCMIDS; [CCM_PSPTransaction:136]x_ID:1)
					If (Records in selection:C76([INVOICES_ALLOCATIONS:162])>0)
						//This will only happen if the transaction was a partial credit-there is a a
						USE NAMED SELECTION:C332("$temp")
						QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Invoice_Number:4=$_t_InvoiceNumber; *)
						QUERY SELECTION:C341([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Amount:6=$_r_RelatedInvoiceAmount)
						
						If (Records in selection:C76([TRANSACTIONS:29])>1)
							For ($_l_TransactionsIndex; 1; Records in selection:C76([TRANSACTIONS:29]))
								If (Find in array:C230($_al_NonCCMTransIDS; [TRANSACTIONS:29]Transaction_ID:31)<0)
									APPEND TO ARRAY:C911($_al_NonCCMTransIDS; [TRANSACTIONS:29]Transaction_ID:31)
									
								Else 
									NEXT RECORD:C51([TRANSACTIONS:29])
								End if 
							End for 
						Else 
							APPEND TO ARRAY:C911($_al_NonCCMTransIDS; [TRANSACTIONS:29]Transaction_ID:31)
						End if 
						$_at_ExtraDescriptions{Size of array:C274($_at_ExtraDescriptions)}:="See Receipt Recharge of "+String:C10($_r_RelatedInvoiceAmount)
						APPEND TO ARRAY:C911($_at_NonCCMExtraDescriptions; "Receipt Recharge "+"See Refunded amount"+String:C10($_r_AbsAmount))
						APPEND TO ARRAY:C911($_at_NonCCMReInvoicedNo; $_t_InvoiceNumber)
						
						
						
					End if 
					
					
					//```
					
					
					NEXT RECORD:C51([CCM_PSPTransaction:136])
					
					
				End for 
				
				USE NAMED SELECTION:C332("$temp")
				
				//````
				
				
				QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Invoice_Number:4#"")
				
				//QUERY SELECTION([TRANSACTIONS];[TRANSACTIONS]Invoice No="60488")
				COPY NAMED SELECTION:C331([TRANSACTIONS:29]; "$temp4")
				
				QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Invoice_Number:4="Multiple")
				
				
				ARRAY DATE:C224($_ad_ReceiptDates2; 0)
				ARRAY LONGINT:C221($_al_ReceiptTransactionIDS2; 0)
				If (Records in selection:C76([TRANSACTIONS:29])>0)
					SELECTION TO ARRAY:C260([TRANSACTIONS:29]Batch_Number:7; $_al_BatchNos; [TRANSACTIONS:29]Transaction_ID:31; $_al_BatchTransactionIDS; [TRANSACTIONS:29]Trans_Date:5; $_ad_BatchTransactionDates)
					QUERY WITH ARRAY:C644([TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31; $_al_BatchNos)
					QUERY SELECTION:C341([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4#""; *)
					QUERY SELECTION:C341([TRANSACTION_BATCH_ITEMS:155];  & ; [TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4#"Multiple")
					SELECTION TO ARRAY:C260([TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31; $_al_InvItemBatchNos; [TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4; $_at_InvBatchItemInvoices; [TRANSACTION_BATCH_ITEMS:155]Total:9; $_ar_InvBatchItemAmounts)
					ARRAY LONGINT:C221($_al_invBatchTransactionIDS; 0)
					ARRAY LONGINT:C221($_al_invBatchTransactionIDS; Size of array:C274($_al_InvItemBatchNos))
					ARRAY DATE:C224($_ad_InvBatchTransactionDates; 0)
					ARRAY DATE:C224($_ad_InvBatchTransactionDates; Size of array:C274($_al_InvItemBatchNos))
					For ($_l_AllocationIndex; 1; Size of array:C274($_al_InvItemBatchNos))
						$_l_TransactionRow:=Find in array:C230($_al_BatchNos; $_al_InvItemBatchNos{$_l_AllocationIndex})
						If ($_l_TransactionRow>0)  //it should be
							$_al_invBatchTransactionIDS{$_l_AllocationIndex}:=$_al_BatchTransactionIDS{$_l_TransactionRow}
							$_ad_InvBatchTransactionDates{$_l_AllocationIndex}:=$_ad_BatchTransactionDates{$_l_TransactionRow}
						End if 
					End for 
					
					//we are looking for receipts for those amounts..
					
					
					QUERY WITH ARRAY:C644([INVOICES_ALLOCATIONS:162]INVOICES_CODE:6; $_at_InvBatchItemInvoices)
					QUERY SELECTION:C341([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]Invoice_Number:1="*R@")
					//```
					SELECTION TO ARRAY:C260([INVOICES_ALLOCATIONS:162]INVOICES_CODE:6; $_at_AllocationInvoice2; [INVOICES_ALLOCATIONS:162]Amount:2; $_ar_AllocationsAmounts2; [INVOICES_ALLOCATIONS:162]Date:3; $_ad_AllocationReceiptDates2; [INVOICES_ALLOCATIONS:162]Invoice_Number:1; $_at_AllocationReceipts2)
					ARRAY LONGINT:C221($_al_ReceiptTransactionIDS2; 0)
					ARRAY LONGINT:C221($_al_ReceiptTransactionIDS2; Size of array:C274($_at_AllocationInvoice2))
					For ($_l_AllocationIndex; 1; Size of array:C274($_al_ReceiptTransactionIDS2))
						$_l_TransactionRow:=Find in array:C230($_at_InvBatchItemInvoices; $_at_AllocationInvoice2{$_l_AllocationIndex})
						If ($_l_TransactionRow>0)  //it should be!
							$_al_ReceiptTransactionIDS2{$_l_AllocationIndex}:=$_al_invBatchTransactionIDS{$_l_TransactionRow}
						End if 
					End for 
					
					SORT ARRAY:C229($_at_AllocationInvoice2; $_ar_AllocationsAmounts2; $_at_AllocationReceipts2; $_ad_AllocationReceiptDates2; $_al_ReceiptTransactionIDS2)
					For ($_l_AllocationIndex; Size of array:C274($_at_AllocationInvoice2); 1; -1)
						$_l_TransactionRow:=Find in array:C230($_at_InvBatchItemInvoices; $_at_AllocationInvoice2{$_l_AllocationIndex})
						If ($_ar_InvBatchItemAmounts{$_l_TransactionRow}#$_ar_AllocationsAmounts2{$_l_AllocationIndex}) | ($_ad_InvBatchTransactionDates{$_l_TransactionRow}#$_ad_AllocationReceiptDates2{$_l_AllocationIndex})
							DELETE FROM ARRAY:C228($_at_AllocationInvoice2; $_l_AllocationIndex)
							DELETE FROM ARRAY:C228($_ar_AllocationsAmounts2; $_l_AllocationIndex)
							DELETE FROM ARRAY:C228($_ad_AllocationReceiptDates2; $_l_AllocationIndex)
							DELETE FROM ARRAY:C228($_at_AllocationReceipts2; $_l_AllocationIndex)
							DELETE FROM ARRAY:C228($_al_ReceiptTransactionIDS2; $_l_AllocationIndex)
						End if 
					End for 
					
					
					
					//```
					USE NAMED SELECTION:C332("$Temp4")
					QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Invoice_Number:4#"Multiple")
				Else 
					
					
					ARRAY DATE:C224($_ad_ReceiptDates2; 0)
					ARRAY LONGINT:C221($_al_ReceiptTransactionIDS2; 0)
					
					
					USE NAMED SELECTION:C332("$Temp4")
					
				End if 
				
				
				SELECTION TO ARRAY:C260([TRANSACTIONS:29]Invoice_Number:4; $_at_InvoiceNumbers; [TRANSACTIONS:29]Total:17; $_ar_AllocationAmounts; [TRANSACTIONS:29]Trans_Date:5; $_ad_AllocationDates; [TRANSACTIONS:29]Transaction_ID:31; $_al_TransactionID)
				//TRACE
				
				QUERY WITH ARRAY:C644([INVOICES_ALLOCATIONS:162]INVOICES_CODE:6; $_at_InvoiceNumbers)
				QUERY SELECTION:C341([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]Invoice_Number:1="*R@")
				
				SELECTION TO ARRAY:C260([INVOICES_ALLOCATIONS:162]INVOICES_CODE:6; $_at_AllocationInvoiceNumber; [INVOICES_ALLOCATIONS:162]Amount:2; $_ar_AllocationInvoiceAmounts; [INVOICES_ALLOCATIONS:162]Date:3; $_ad_AllocationReceiptDates; [INVOICES_ALLOCATIONS:162]Invoice_Number:1; $_at_AllocationReceipts)
				ARRAY LONGINT:C221($_al_AllocationTransactionID; 0)
				ARRAY LONGINT:C221($_al_AllocationTransactionID; Size of array:C274($_at_AllocationInvoiceNumber))
				For ($_l_AllocationIndex; 1; Size of array:C274($_al_AllocationTransactionID))
					$_l_TransactionRow:=Find in array:C230($_at_InvoiceNumbers; $_at_AllocationInvoiceNumber{$_l_AllocationIndex})
					If ($_l_TransactionRow>0)
						$_al_AllocationTransactionID{$_l_AllocationIndex}:=$_al_TransactionID{$_l_TransactionRow}
					End if 
					
				End for 
				
				SORT ARRAY:C229($_at_AllocationInvoiceNumber; $_ar_AllocationInvoiceAmounts; $_at_AllocationReceipts; $_ad_AllocationReceiptDates; $_al_AllocationTransactionID)
				For ($_l_AllocationIndex; Size of array:C274($_at_AllocationInvoiceNumber); 1; -1)
					$_l_TransactionRow:=Find in array:C230($_at_InvoiceNumbers; $_at_AllocationInvoiceNumber{$_l_AllocationIndex})
					If ($_ar_AllocationAmounts{$_l_TransactionRow}#$_ar_AllocationInvoiceAmounts{$_l_AllocationIndex}) | ($_ad_AllocationDates{$_l_TransactionRow}#$_ad_AllocationReceiptDates{$_l_AllocationIndex})
						DELETE FROM ARRAY:C228($_at_AllocationInvoiceNumber; $_l_AllocationIndex)
						DELETE FROM ARRAY:C228($_ar_AllocationInvoiceAmounts; $_l_AllocationIndex)
						DELETE FROM ARRAY:C228($_ad_AllocationReceiptDates; $_l_AllocationIndex)
						DELETE FROM ARRAY:C228($_at_AllocationReceipts; $_l_AllocationIndex)
						DELETE FROM ARRAY:C228($_al_AllocationTransactionID; $_l_AllocationIndex)
					End if 
				End for 
				If (Size of array:C274($_at_AllocationInvoice2)>0)
					For ($_l_AllocationIndex; 1; Size of array:C274($_at_AllocationInvoice2))
						APPEND TO ARRAY:C911($_at_AllocationInvoiceNumber; $_at_AllocationInvoice2{$_l_AllocationIndex})
						APPEND TO ARRAY:C911($_ar_AllocationInvoiceAmounts; $_ar_AllocationsAmounts2{$_l_AllocationIndex})
						APPEND TO ARRAY:C911($_ad_AllocationReceiptDates; $_ad_AllocationReceiptDates2{$_l_AllocationIndex})
						APPEND TO ARRAY:C911($_at_AllocationReceipts; $_at_AllocationReceipts2{$_l_AllocationIndex})
						APPEND TO ARRAY:C911($_al_AllocationTransactionID; $_al_ReceiptTransactionIDS2{$_l_AllocationIndex})
					End for 
				End if 
				If (Size of array:C274($_at_ReInvoicedNo)>0)
					
					For ($_l_AllocationIndex; 1; Size of array:C274($_at_ReInvoicedNo))
						APPEND TO ARRAY:C911($_at_AllocationInvoiceNumber; $_at_ReInvoicedNo{$_l_AllocationIndex})
						APPEND TO ARRAY:C911($_ar_AllocationInvoiceAmounts; $_ar_ReAmount{$_l_AllocationIndex})
						APPEND TO ARRAY:C911($_ad_AllocationReceiptDates; $_ad_ReDate{$_l_AllocationIndex})
						APPEND TO ARRAY:C911($_at_AllocationReceipts; $_at_ReIReceiptNo{$_l_AllocationIndex})
						APPEND TO ARRAY:C911($_al_AllocationTransactionID; $_al_ReTransactionIDS{$_l_AllocationIndex})
					End for 
					
				End if 
				
				
				QUERY WITH ARRAY:C644([CCM_PSPTransaction:136]xReceiptID:13; $_at_AllocationReceipts)
				SELECTION TO ARRAY:C260([CCM_PSPTransaction:136]x_CCID:8; $_al_CCIDS)
				QUERY WITH ARRAY:C644([xCreditCardDetails:132]x_ID:1; $_al_CCIDS)
				QUERY SELECTION WITH ARRAY:C1050([xCreditCardDetails:132]Card_TypeName:5; $_at_SelectedCardTypes)
				SELECTION TO ARRAY:C260([CCM_PSPTransaction:136]x_CCID:8; $_al_CCIDS)
				QUERY SELECTION WITH ARRAY:C1050([CCM_PSPTransaction:136]x_CCID:8; $_al_CCIDS)
				
				If (Size of array:C274($_al_CCMIDS)>0)
					CREATE SET:C116([CCM_PSPTransaction:136]; "$Set1")
					QUERY WITH ARRAY:C644([CCM_PSPTransaction:136]x_ID:1; $_al_CCMIDS)
					QUERY SELECTION WITH ARRAY:C1050([xCreditCardDetails:132]Card_TypeName:5; $_at_SelectedCardTypes)
					CREATE SET:C116([CCM_PSPTransaction:136]; "$Set2")
					UNION:C120("$Set1"; "$Set2;"; "$Set1")
				End if 
				SELECTION TO ARRAY:C260([CCM_PSPTransaction:136]xReceiptID:13; $_at_AllocationReceipts2; [CCM_PSPTransaction:136]x_CCID:8; $_al_AllocationCCIDS; [CCM_PSPTransaction:136]TRANSACTION_DATE:2; $_ad_CCDate; [CCM_PSPTransaction:136]xInvoiceID:11; $_at_ReceiptReferences; [CCM_PSPTransaction:136]x_ID:1; $_al_ReceiptCCMIDS)
				
				ARRAY TEXT:C222($_at_CCInformation; Size of array:C274($_at_AllocationInvoiceNumber))
				For ($_l_AllocationIndex; Size of array:C274($_at_AllocationInvoiceNumber); 1; -1)
					$_l_TransactionRow:=Find in array:C230($_at_AllocationReceipts2; $_at_AllocationReceipts{$_l_AllocationIndex})
					If ($_l_TransactionRow<0)
						
						
					End if 
					If ($_l_TransactionRow<0)
						DELETE FROM ARRAY:C228($_at_AllocationInvoiceNumber; $_l_AllocationIndex)
						DELETE FROM ARRAY:C228($_ar_AllocationInvoiceAmounts; $_l_AllocationIndex)
						DELETE FROM ARRAY:C228($_ad_AllocationReceiptDates; $_l_AllocationIndex)
						DELETE FROM ARRAY:C228($_at_AllocationReceipts; $_l_AllocationIndex)
						DELETE FROM ARRAY:C228($_at_CCInformation; $_l_AllocationIndex)
						DELETE FROM ARRAY:C228($_al_AllocationTransactionID; $_l_AllocationIndex)
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
						$_at_CCInformation{$_l_AllocationIndex}:="Card Transaction Date "+String:C10($_ad_CCDate{$_l_TransactionRow}; 4)+" Card Number "+CCM_T_CardNumber+" "+" Name "+$_t_NameOnCard+" Receipt No "+$_at_ReceiptReferences{$_l_TransactionRow}
						$_l_CCMRow:=Find in array:C230($_al_CCMIDS; $_al_ReceiptCCMIDS{$_l_TransactionRow})
						If ($_l_CCMRow>0)
							$_at_CCInformation{$_l_AllocationIndex}:=$_at_CCInformation{$_l_AllocationIndex}+$_at_ExtraDescriptions{$_l_CCMRow}
						End if 
					End if 
				End for 
				//we now have an array of the allocations that had a CC statement
				QUERY SELECTION WITH ARRAY:C1050([TRANSACTIONS:29]Transaction_ID:31; $_al_AllocationTransactionID)
				CREATE SET:C116([TRANSACTIONS:29]; "$tSet1")
				QUERY WITH ARRAY:C644([TRANSACTIONS:29]Transaction_ID:31; $_al_NonCCMTransIDS)
				CREATE SET:C116([TRANSACTIONS:29]; "$tSet2")
				UNION:C120("$tSet1"; "$tSet2"; "$tset1")
				USE SET:C118("$tset1")
				
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
					For ($_l_AllocationIndex; 1; Size of array:C274(ABR_al_UNTransactionID))
						ABR_ar_TransactionBalance{$_l_AllocationIndex}:=ABR_ar_unResolvedTRAmount{$_l_AllocationIndex}-ABR_ar_AlreadyReconciledAmount{$_l_AllocationIndex}
						$_l_TransactionRow:=Find in array:C230($_al_UNTransactionID; ABR_al_UNTransactionID{$_l_AllocationIndex})
						If ($_l_TransactionRow>0)
							If ($_ar_TRYUNReconcilledAmt{$_l_TransactionRow}#0)
								ABR_ar_TRYUNReconcilledAmt{$_l_AllocationIndex}:=$_ar_TRYUNReconcilledAmt{$_l_TransactionRow}
								ABR_abo_UNSelected{$_l_AllocationIndex}:=True:C214
							End if 
						End if 
					End for 
					
					For ($_l_AllocationIndex; 1; Size of array:C274(ABR_at_unResolvedDescription))
						$_l_TransactionRow:=Find in array:C230($_al_AllocationTransactionID; ABR_al_UNTransactionID{$_l_AllocationIndex})
						If ($_l_TransactionRow>0)
							ABR_at_unResolvedDescription{$_l_AllocationIndex}:=$_at_CCInformation{$_l_TransactionRow}
						Else 
							$_l_TransactionRow:=Find in array:C230($_al_NonCCMTransIDS; ABR_al_UNTransactionID{$_l_AllocationIndex})
							If ($_l_TransactionRow>0)
								ABR_at_unResolvedDescription{$_l_AllocationIndex}:=$_at_NonCCMExtraDescriptions{$_l_TransactionRow}
							End if 
							
						End if 
						
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
					
					SELECTION TO ARRAY:C260([TRANSACTIONS:29]Account_Code:3; ABR_at_unResolvedAccountCOde; [TRANSACTIONS:29]Batch_Number:7; ABR_al_unResolvedBatch; [TRANSACTIONS:29]Cheque_Number:13; ABR_at_UnResolvedCheque; [TRANSACTIONS:29]Currency_Code:22; ABR_at_unCurrencyCode; [TRANSACTIONS:29]Entry_Date:11; ABR_ad_unResolvedDate; [TRANSACTIONS:29]Period_Code:12; ABR_at_unResolvedPeriod; [TRANSACTIONS:29]Total:17; ABR_ar_unResolvedTRAmount; [TRANSACTIONS:29]Description:8; ABR_at_unResolvedDescription)
					SELECTION TO ARRAY:C260([TRANSACTIONS:29]Transaction_ID:31; ABR_al_UNTransactionID; [TRANSACTIONS:29]ReconcilledAmount:34; ABR_ar_AlreadyReconciledAmount)
					ARRAY REAL:C219(ABR_ar_TRYUNReconcilledAmt; Size of array:C274(ABR_al_UNTransactionID))
					ARRAY REAL:C219(ABR_ar_TransactionBalance; Size of array:C274(ABR_al_UNTransactionID))
					ARRAY BOOLEAN:C223(ABR_abo_UNSelected; Size of array:C274(ABR_al_UNTransactionID))
					For ($_l_AllocationIndex; 1; Size of array:C274(ABR_al_UNTransactionID))
						ABR_ar_TransactionBalance{$_l_AllocationIndex}:=ABR_ar_unResolvedTRAmount{$_l_AllocationIndex}-ABR_ar_AlreadyReconciledAmount{$_l_AllocationIndex}
						$_l_TransactionRow:=Find in array:C230($_al_UNTransactionID; ABR_al_UNTransactionID{$_l_AllocationIndex})
						If ($_l_TransactionRow>0)
							If ($_ar_TRYUNReconcilledAmt{$_l_TransactionRow}#0)
								ABR_ar_TRYUNReconcilledAmt{$_l_AllocationIndex}:=$_ar_TRYUNReconcilledAmt{$_l_TransactionRow}
								ABR_abo_UNSelected{$_l_AllocationIndex}:=True:C214
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
					For ($_l_AllocationIndex; 1; Size of array:C274(ABR_al_UNTransactionID))
						ABR_ar_TransactionBalance{$_l_AllocationIndex}:=ABR_ar_unResolvedTRAmount{$_l_AllocationIndex}-ABR_ar_AlreadyReconciledAmount{$_l_AllocationIndex}
						$_l_TransactionRow:=Find in array:C230($_al_UNTransactionID; ABR_al_UNTransactionID{$_l_AllocationIndex})
						If ($_l_TransactionRow>0)
							If ($_ar_TRYUNReconcilledAmt{$_l_TransactionRow}#0)
								ABR_ar_TRYUNReconcilledAmt{$_l_AllocationIndex}:=$_ar_TRYUNReconcilledAmt{$_l_TransactionRow}
								ABR_abo_UNSelected{$_l_AllocationIndex}:=True:C214
							End if 
						End if 
					End for 
				Else 
					Gen_Alert("There are no others to reconcile")
				End if 
				
				
			: (ABR_at_FilterTypes{ABR_at_FilterTypes}="Find Transactions Matching Amount")
				USE NAMED SELECTION:C332("ToReconcile")
				If ([ACC_Bank_Statements:198]Bank_DebitAmount:8>0)
					$_r_Negative:=-ACC_R_RemainingtoReconcile
					
					QUERY SELECTION BY FORMULA:C207([TRANSACTIONS:29]; ([TRANSACTIONS:29]Total:17-[TRANSACTIONS:29]ReconcilledAmount:34)=$_r_Negative)
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
					ARRAY REAL:C219(ABR_ar_TransactionBalance; Size of array:C274(ABR_al_UNTransactionID))
					ARRAY BOOLEAN:C223(ABR_abo_UNSelected; Size of array:C274(ABR_al_UNTransactionID))
					For ($_l_AllocationIndex; 1; Size of array:C274(ABR_al_UNTransactionID))
						ABR_ar_TransactionBalance{$_l_AllocationIndex}:=ABR_ar_unResolvedTRAmount{$_l_AllocationIndex}-ABR_ar_AlreadyReconciledAmount{$_l_AllocationIndex}
						$_l_TransactionRow:=Find in array:C230($_al_UNTransactionID; ABR_al_UNTransactionID{$_l_AllocationIndex})
						If ($_l_TransactionRow>0)
							If ($_ar_TRYUNReconcilledAmt{$_l_TransactionRow}#0)
								ABR_ar_TRYUNReconcilledAmt{$_l_AllocationIndex}:=$_ar_TRYUNReconcilledAmt{$_l_TransactionRow}
								ABR_abo_UNSelected{$_l_AllocationIndex}:=True:C214
							End if 
						End if 
					End for 
				Else 
					Gen_Alert("There are no transactions matching the amount to reconcile")
				End if 
				
			: (ABR_at_FilterTypes{ABR_at_FilterTypes}="Find by payment Reference")  //TRACE
				//TRACE
				ABR_t_checkno:=Gen_Request("Enter the payment reference"; "")
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
						For ($_l_AllocationIndex; 1; Size of array:C274(ABR_al_UNTransactionID))
							ABR_ar_TransactionBalance{$_l_AllocationIndex}:=ABR_ar_unResolvedTRAmount{$_l_AllocationIndex}-ABR_ar_AlreadyReconciledAmount{$_l_AllocationIndex}
							$_l_TransactionRow:=Find in array:C230($_al_UNTransactionID; ABR_al_UNTransactionID{$_l_AllocationIndex})
							If ($_l_TransactionRow>0)
								If ($_ar_TRYUNReconcilledAmt{$_l_TransactionRow}#0)
									ABR_ar_TRYUNReconcilledAmt{$_l_AllocationIndex}:=$_ar_TRYUNReconcilledAmt{$_l_TransactionRow}
									ABR_abo_UNSelected{$_l_AllocationIndex}:=True:C214
								End if 
							End if 
						End for 
					Else 
						Gen_Alert("The payment reference is not found")
						ABR_t_checkno:=""
						SHOW WINDOW:C435
					End if 
					
				End if 
				
		End case 
End case 
ERR_MethodTrackerReturn("OBJ ACC_ReconcileSelectTransactions.oFilterTransactions"; $_t_oldMethodName)
