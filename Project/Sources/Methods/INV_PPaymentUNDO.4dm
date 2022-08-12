//%attributes = {}
If (False:C215)
	//Project Method Name:      INV_PPaymentUNDO
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/12/2013 07:29
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_BatchNumbers; 0)
	ARRAY LONGINT:C221($_al_TransInNos; 0)
	ARRAY REAL:C219($_ar_BatchItemAmounts; 0)
	ARRAY REAL:C219($_ar_BatchItemSecondAmt; 0)
	ARRAY REAL:C219($_ar_BatchItemTaxAmount; 0)
	ARRAY REAL:C219($_ar_BatchItemTotal; 0)
	ARRAY REAL:C219($_ar_PurchaseAllocationAmounts; 0)
	ARRAY TEXT:C222($_at_BatchItemAnalysis; 0)
	ARRAY TEXT:C222($_at_BatchItemCoCode; 0)
	ARRAY TEXT:C222($_at_BatchItemCreditAcc; 0)
	ARRAY TEXT:C222($_at_BatchItemcreditIO; 0)
	ARRAY TEXT:C222($_at_BatchItemCurrCode; 0)
	ARRAY TEXT:C222($_at_BatchItemDebitAcc; 0)
	ARRAY TEXT:C222($_at_BatchItemdebitIO; 0)
	ARRAY TEXT:C222($_at_batchItemInvoiceNo; 0)
	ARRAY TEXT:C222($_at_BatchItemJobCode; 0)
	ARRAY TEXT:C222($_at_BatchItemLayerCode; 0)
	ARRAY TEXT:C222($_at_BatchItemPurchaseCode; 0)
	ARRAY TEXT:C222($_at_BatchItemPurchInvno; 0)
	ARRAY TEXT:C222($_at_BatchItemTaxCode; 0)
	ARRAY TEXT:C222($_at_Batchitemtranscode; 0)
	ARRAY TEXT:C222($_at_BatchItemUKEC; 0)
	ARRAY TEXT:C222($_at_PPtoUpdate; 0)
	ARRAY TEXT:C222($_at_PurchaseCode; 0)
	C_BOOLEAN:C305($_bo_Cancel; $_bo_Continue; $_bo_DepositReconcile; $_bo_FindMultiInvoice; $_bo_OK; $_bo_OK2; $_bo_OtherSideFound; $_bo_SinSID; $_bo_Unlocked)
	C_DATE:C307(<>DB_d_CurrentDate; vDate)
	C_LONGINT:C283($_l_AddMode; $_l_ArraySize; $_l_BatchCreate; $_l_BatchIndex; $_l_BatchItemID; $_l_BatchItemIndex2; $_l_BatchItemReference; $_l_BatchItemsIndex; $_l_BatchRow; $_l_CombineIndex; $_l_CombineIndex2)
	C_LONGINT:C283($_l_CountPurchaseInvoiceAllocati; $_l_Element; $_l_PeriodID; $_l_PurchaseAllocationsIndex; $_l_PurchaseIndex; $_l_RecordsCount; $_l_RecordsIndex; $_l_SizeofArray; $_l_TimeOut; $_l_TransPostStatus; DS_l_BATCHITEM)
	C_LONGINT:C283(INV_isUnique; Vadd)
	C_REAL:C285($_r_Amount; $_r_AmounttoRefund; $_r_OtherSideAmount; $_r_OtherSideTaxAmount; $_r_TotalDue; $2)
	C_TEXT:C284($_t_AnalysisCode; $_t_BatchInvoiceNumberNV; $_t_CompanyCode; $_t_CreditAccount; $_t_CreditIIO; $_t_CurrencyCode; $_t_DebitAccount; $_t_DebitIO; $_t_DepositReference; $_t_JobCode; $_t_LayerCode)
	C_TEXT:C284($_t_oldMethodName; $_t_OtherSide; $_t_PeriodCode; $_t_PeriodPosting; $_t_PurchaseCodeOLD; $_t_PurchaseInvoiceNumber; $_t_PurchaseOrderNumber; $_t_ReceiptNumber; $_t_ReceiptToUndo; $_t_ReverseReceiptNumber; $_t_TransactionCode)
	C_TEXT:C284($_t_UKEC; $1; ACC_t_CurrencyCode; vLayer)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("INV_PPaymentUNDO"; Form event code:C388)
If (Count parameters:C259=0)
	$_t_ReceiptToUndo:=Gen_Request("Enter the payment to undo"; "*S@")
Else 
	$_t_ReceiptToUndo:=$1
End if 
If ($_t_ReceiptToUndo#"")
	//TRACE
	QUERY:C277([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Purchase_Code:1=$_t_ReceiptToUndo; *)
	QUERY:C277([PURCHASE_INVOICES:37];  & ; [PURCHASE_INVOICES:37]State:24=-3)
	If (Records in selection:C76([PURCHASE_INVOICES:37])=1)
		//C_BOOLEAN($1)  //show dialogues
		//C_LONGINT($3)  //CC audit recordiD if CC payment
		//CREATE SET("Master")
		COPY NAMED SELECTION:C331([PURCHASE_INVOICES:37]; "$PaySel")
		$_l_RecordsCount:=Records in selection:C76([PURCHASE_INVOICES:37])
		CREATE SET:C116([PURCHASE_INVOICES:37]; "toRefund")
		$_bo_Continue:=True:C214
		FIRST RECORD:C50([PURCHASE_INVOICES:37])
		ARRAY TEXT:C222($_at_PPtoUpdate; 0)
		While ((Not:C34(End selection:C36([PURCHASE_INVOICES:37]))) & ($_bo_Continue))
			$_bo_Unlocked:=Check_Locked(->[PURCHASE_INVOICES:37]; 1)
			If (Not:C34($_bo_Unlocked))
				Gen_Confirm("The Payment"+" "+[PURCHASE_INVOICES:37]Purchase_Code:1+" is locked by another user.  The payment  cannot be reversed."; "Wait"; "Stop")
				If (OK=0)
					$_bo_Unlocked:=False:C215
					$_bo_Continue:=False:C215
				Else 
					Repeat 
						$_l_TimeOut:=0
						Repeat 
							$_bo_Unlocked:=Check_Locked(->[PURCHASE_INVOICES:37]; 1)
							If (Not:C34($_bo_Unlocked))
								$_l_TimeOut:=$_l_TimeOut+1
							End if 
							DelayTicks(60)
						Until ($_bo_Unlocked=True:C214) | ($_l_TimeOut>100)
						If (Not:C34($_bo_Unlocked))
							Gen_Confirm("The Payment"+" "+[PURCHASE_INVOICES:37]Purchase_Code:1+" is STILL locked by another user.  The payment  cannot be reversed."; "Wait"; "Stop")
						End if 
						$_bo_Continue:=(OK=1)
					Until ($_bo_Unlocked=True:C214) | (Not:C34($_bo_Continue))
				End if 
			End if 
			If (Not:C34($_bo_Unlocked))
				//NG Change here
				Gen_Alert("The Payment"+" "+[PURCHASE_INVOICES:37]Purchase_Code:1+" is locked by another user.  The payment  cannot be reversed."; "Cancel")
				$_bo_Continue:=False:C215
			End if 
			NEXT RECORD:C51([PURCHASE_INVOICES:37])
		End while 
		If ($_bo_Continue)
			FIRST RECORD:C50([PURCHASE_INVOICES:37])
			If (Count parameters:C259>=2)  //Note this can only be used where one pur is passed to this method
				$_r_AmounttoRefund:=$2
			Else 
				$_r_AmounttoRefund:=[PURCHASE_INVOICES:37]Total_Paid:8
			End if 
			For ($_l_RecordsIndex; 1; $_l_RecordsCount)
				StartTransaction
				READ WRITE:C146([TRANSACTIONS:29])
				READ WRITE:C146([TRANSACTION_BATCHES:30])
				USE SET:C118("ToRefund")
				GOTO SELECTED RECORD:C245([PURCHASE_INVOICES:37]; $_l_RecordsIndex)
				ACC_t_CurrencyCode:=[PURCHASE_INVOICES:37]Currency_Code:23
				vLayer:=[PURCHASE_INVOICES:37]Layer_Code:28
				$_t_ReceiptNumber:=[PURCHASE_INVOICES:37]Purchase_Code:1
				APPEND TO ARRAY:C911($_at_PPtoUpdate; $_t_ReceiptNumber)
				//Get the allocations from the receipt
				QUERY:C277([PURCHASE_INVOICE_ALLOCATIONS:159]; [PURCHASE_INVOICE_ALLOCATIONS:159]PURCHASES_INVOICE_CODE:6=$_t_ReceiptNumber)
				SELECTION TO ARRAY:C260([PURCHASE_INVOICE_ALLOCATIONS:159]Amount:2; $_ar_PurchaseAllocationAmounts; [PURCHASE_INVOICE_ALLOCATIONS:159]Purchase_Code:1; $_at_PurchaseCode)
				For ($_l_PurchaseIndex; 1; Size of array:C274($_at_PurchaseCode))
					APPEND TO ARRAY:C911($_at_PPtoUpdate; $_at_PurchaseCode{$_l_PurchaseIndex})
				End for 
				//Note that a partial refund can only be done for a receipt that pays ONE purchase otherwize it become difficult to work out which invoices should have what amount of payment against them refunded
				//the partial refund control is not done in this method. The only place you can currently do a partial refund is against a CC payment
				//take care here the amount may have paid one invoice but it could have come from multiple deposits
				ARRAY REAL:C219($_ar_BatchItemAmounts; 0)
				ARRAY TEXT:C222($_at_BatchItemAnalysis; 0)
				ARRAY TEXT:C222($_at_BatchItemCoCode; 0)
				ARRAY TEXT:C222($_at_BatchItemCreditAcc; 0)
				ARRAY TEXT:C222($_at_BatchItemcreditIO; 0)
				ARRAY TEXT:C222($_at_BatchItemdebitIO; 0)
				ARRAY TEXT:C222($_at_BatchItemCurrCode; 0)
				ARRAY TEXT:C222($_at_BatchItemDebitAcc; 0)
				ARRAY TEXT:C222($_at_batchItemInvoiceNo; 0)
				ARRAY TEXT:C222($_at_BatchItemJobCode; 0)
				ARRAY TEXT:C222($_at_BatchItemLayerCode; 0)
				ARRAY TEXT:C222($_at_BatchItemPurchInvno; 0)
				ARRAY TEXT:C222($_at_BatchItemPurchaseCode; 0)
				ARRAY REAL:C219($_ar_BatchItemSecondAmt; 0)
				ARRAY REAL:C219($_ar_BatchItemTaxAmount; 0)
				ARRAY TEXT:C222($_at_BatchItemTaxCode; 0)
				ARRAY REAL:C219($_ar_BatchItemTotal; 0)
				ARRAY LONGINT:C221($_al_BatchNumbers; 0)
				ARRAY TEXT:C222($_at_Batchitemtranscode; 0)
				ARRAY TEXT:C222($_at_BatchItemUKEC; 0)
				$_bo_Cancel:=False:C215
				$_t_PurchaseCodeOLD:=[PURCHASE_INVOICES:37]Purchase_Code:1
				DUPLICATE RECORD:C225([PURCHASE_INVOICES:37])
				Repeat 
					$_t_ReceiptNumber:="*S"+Gen_CodePref(28; ->[PURCHASE_INVOICES:37]Purchase_Code:1; "*S")
					SET QUERY DESTINATION:C396(3; INV_isUnique)
					QUERY:C277([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Purchase_Code:1=$_t_ReceiptNumber)
					If (INV_isUnique=0)
						[PURCHASE_INVOICES:37]Purchase_Code:1:=$_t_ReceiptNumber
					End if 
					SET QUERY DESTINATION:C396(0)
				Until (INV_isUnique=0)
				//Gen_Alert ("receipt(refund) number set")
				$_t_ReverseReceiptNumber:=[PURCHASE_INVOICES:37]Purchase_Code:1
				//Need to Check_Period code
				vDate:=[PURCHASE_INVOICES:37]Posted_Date:12
				[PURCHASE_INVOICES:37]Posted_Date:12:=Current date:C33(*)
				$_l_PeriodID:=Check_Period
				$_bo_OK:=True:C214
				If ([PERIODS:33]Period_Code:1#[PURCHASE_INVOICES:37]Period_Code:3)
					$_t_PeriodCode:=Gen_Request("Payment is to a previous period( "+[PURCHASE_INVOICES:37]Period_Code:3+". Post to period:"; [PERIODS:33]Period_Code:1)
					If (OK=1)
						QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_t_PeriodCode)
						Check_PerCloseI
						[PURCHASE_INVOICES:37]Period_Code:3:=[PERIODS:33]Period_Code:1
						$_bo_OK:=True:C214
					Else 
						Gen_Alert("Reversing payment "+[PURCHASE_INVOICES:37]Purchase_Code:1+" has been cancelled")
						$_bo_OK:=False:C215
						$_bo_Cancel:=True:C214
					End if 
				End if 
				If ($_bo_OK)
					[PURCHASE_INVOICES:37]Posted_Date:12:=Current date:C33(*)
					[PURCHASE_INVOICES:37]Comments:16:="Payment Reversal"+Char:C90(13)+("Description: "*(Num:C11($_t_ReceiptNumber#"")))+$_t_ReceiptNumber+"Cheque No:"+[PURCHASE_INVOICES:37]Cheque_Number:26
					[PURCHASE_INVOICES:37]Cheque_Number:26:=""
					QUERY:C277([PURCHASE_INVOICE_ALLOCATIONS:159]; [PURCHASE_INVOICE_ALLOCATIONS:159]PURCHASES_INVOICE_CODE:6=$_t_PurchaseCodeOLD)
					CREATE SET:C116([PURCHASE_INVOICE_ALLOCATIONS:159]; "$DupSet")
					$_l_CountPurchaseInvoiceAllocati:=Records in selection:C76([PURCHASE_INVOICE_ALLOCATIONS:159])
					For ($_l_PurchaseallocationsIndex; 1; $_l_CountPurchaseInvoiceAllocati)
						USE SET:C118("$DUpSet")
						GOTO SELECTED RECORD:C245([PURCHASE_INVOICE_ALLOCATIONS:159]; $_l_PurchaseallocationsIndex)
						DUPLICATE RECORD:C225([PURCHASE_INVOICE_ALLOCATIONS:159])
						//we can refund the total amount of this
						[PURCHASE_INVOICE_ALLOCATIONS:159]ID:5:=AA_GetNextID(->[PURCHASE_INVOICE_ALLOCATIONS:159]ID:5)
						[PURCHASE_INVOICE_ALLOCATIONS:159]PURCHASES_INVOICE_CODE:6:=[PURCHASE_INVOICES:37]Purchase_Code:1
						[PURCHASE_INVOICE_ALLOCATIONS:159]Amount:2:=-[PURCHASE_INVOICE_ALLOCATIONS:159]Amount:2
						[PURCHASE_INVOICE_ALLOCATIONS:159]Date:3:=[PURCHASE_INVOICES:37]Posted_Date:12
						DB_SaveRecord(->[PURCHASE_INVOICE_ALLOCATIONS:159])
						NEXT RECORD:C51([PURCHASE_INVOICE_ALLOCATIONS:159])
					End for 
					[PURCHASE_INVOICES:37]Total_Paid:8:=-[PURCHASE_INVOICES:37]Total_Paid:8
					[PURCHASE_INVOICES:37]Total_Due:9:=-[PURCHASE_INVOICES:37]Total_Due:9
					$_t_PeriodPosting:=[PURCHASE_INVOICES:37]Period_Code:3
					DB_SaveRecord(->[PURCHASE_INVOICES:37])
					$_bo_DepositReconcile:=False:C215
					//Gen_Alert ("There are "+String(Size of array($_ar_PurchaseAllocationAmounts))+" to create allocations for")
					For ($_l_PurchaseallocationsIndex; 1; Size of array:C274($_ar_PurchaseAllocationAmounts))
						$_t_OtherSide:=$_at_PurchaseCode{$_l_PurchaseallocationsIndex}
						If (Find in array:C230($_at_PPtoUpdate; $_t_OtherSide)=-1)
							APPEND TO ARRAY:C911($_at_PPtoUpdate; $_t_OtherSide)
						End if 
						QUERY:C277([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Purchase_Code:1=$_t_OtherSide)
						If (Not:C34(Check_Locked(->[PURCHASE_INVOICES:37]; 1)))
							Gen_Alert("Paid Purchase invoices"+" "+[PURCHASE_INVOICES:37]Purchase_Code:1+" is locked by another user.  The payment cannot be Reversed."; "Cancel")
							$_bo_Cancel:=True:C214
						Else 
							If (Records in selection:C76([PURCHASE_INVOICES:37])>0)
								$_bo_OK2:=False:C215
								$_t_DepositReference:=""
								QUERY:C277([PURCHASE_INVOICE_ALLOCATIONS:159]; [PURCHASE_INVOICE_ALLOCATIONS:159]PURCHASES_INVOICE_CODE:6=[PURCHASE_INVOICES:37]Purchase_Code:1)
								For ($_l_PurchaseAllocationsIndex; 1; Records in selection:C76([PURCHASE_INVOICE_ALLOCATIONS:159]))
									If ([PURCHASE_INVOICE_ALLOCATIONS:159]Purchase_Code:1=$_t_PurchaseCodeOLD)
										$_bo_OK2:=True:C214
										$_r_Amount:=-[PURCHASE_INVOICE_ALLOCATIONS:159]Amount:2
										$_l_PurchaseAllocationsIndex:=99999
									End if 
									NEXT RECORD:C51([PURCHASE_INVOICE_ALLOCATIONS:159])
								End for 
								If ($_bo_OK2)
									CREATE RECORD:C68([PURCHASE_INVOICE_ALLOCATIONS:159])
									[PURCHASE_INVOICE_ALLOCATIONS:159]PURCHASES_INVOICE_CODE:6:=[PURCHASE_INVOICES:37]Purchase_Code:1
									[PURCHASE_INVOICE_ALLOCATIONS:159]ID:5:=AA_GetNextID(->[PURCHASE_INVOICE_ALLOCATIONS:159]ID:5)
									[PURCHASE_INVOICE_ALLOCATIONS:159]Amount:2:=$_r_Amount
									[PURCHASE_INVOICE_ALLOCATIONS:159]Date:3:=Current date:C33(*)
									[PURCHASE_INVOICE_ALLOCATIONS:159]Purchase_Code:1:=$_t_ReverseReceiptNumber
									DB_SaveRecord(->[PURCHASE_INVOICE_ALLOCATIONS:159])
									//And update the amount due on that purchase
									$_r_TotalDue:=PUR_SetDueAmount
									QUERY:C277([PURCHASE_INVOICE_ALLOCATIONS:159]; [PURCHASE_INVOICE_ALLOCATIONS:159]Purchase_Code:1=[PURCHASE_INVOICES:37]Purchase_Code:1)
									[PURCHASE_INVOICES:37]Total_Paid:8:=Sum:C1([PURCHASE_INVOICE_ALLOCATIONS:159]Amount:2)
									[PURCHASE_INVOICES:37]Total_Due:9:=$_r_TotalDue
									DB_SaveRecord(->[PURCHASE_INVOICES:37])
									//TRACE
									//and now reverse the posting
									Case of 
										: ([PURCHASE_INVOICES:37]Purchase_Code:1="*P@")  //Pre-payment
											$_bo_DepositReconcile:=True:C214
											$_t_DepositReference:=[PURCHASE_INVOICES:37]Purchase_Code:1
											QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1=DB_GetLedgerTRANSPURPrePay; *)
											QUERY:C277([TRANSACTION_BATCH_ITEMS:155];  & ; [TRANSACTION_BATCH_ITEMS:155]Amount:6=Gen_Round($_r_Amount; 2; 2); *)
											QUERY:C277([TRANSACTION_BATCH_ITEMS:155];  & ; [TRANSACTION_BATCH_ITEMS:155]Purchase_Invoice_Code:22=[PURCHASE_INVOICES:37]Purchase_Code:1)
											SELECTION TO ARRAY:C260([TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31; $_al_TransInNos)
											QUERY WITH ARRAY:C644([TRANSACTION_BATCHES:30]Batch_Number:10; $_al_TransInNos)
											If (Records in selection:C76([TRANSACTION_BATCHES:30])>0)
												//this is the batch
												$_l_BatchRow:=Find in array:C230($_al_BatchNumbers; [TRANSACTION_BATCHES:30]Batch_Number:10)
												If ($_l_BatchRow<0)
													INSERT IN ARRAY:C227($_al_BatchNumbers; Size of array:C274($_al_BatchNumbers)+1; 1)
													$_al_BatchNumbers{Size of array:C274($_al_BatchNumbers)}:=[TRANSACTION_BATCHES:30]Batch_Number:10
												End if 
												QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTION_BATCHES:30]Batch_Number:10)
												FIRST RECORD:C50([TRANSACTION_BATCH_ITEMS:155])
												$_bo_FindMultiInvoice:=False:C215
												For ($_l_BatchItemsIndex; 1; Records in selection:C76([TRANSACTION_BATCH_ITEMS:155]))
													If ([TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1=DB_GetLedgerTRANSPURPrePay) & ([TRANSACTION_BATCH_ITEMS:155]Amount:6=Gen_Round($_r_Amount; 2; 2)) & ([TRANSACTION_BATCH_ITEMS:155]Purchase_Invoice_Code:22=[PURCHASE_INVOICES:37]Purchase_Code:1)
														//This is the item we want to reverse in a new batch
														$_l_ArraySize:=Size of array:C274($_ar_BatchItemAmounts)+1
														INSERT IN ARRAY:C227($_ar_BatchItemAmounts; $_l_ArraySize; 1)
														INSERT IN ARRAY:C227($_at_BatchItemAnalysis; $_l_ArraySize; 1)
														INSERT IN ARRAY:C227($_at_BatchItemCoCode; $_l_ArraySize; 1)
														INSERT IN ARRAY:C227($_at_BatchItemCreditAcc; $_l_ArraySize; 1)
														INSERT IN ARRAY:C227($_at_BatchItemcreditIO; $_l_ArraySize; 1)
														INSERT IN ARRAY:C227($_at_BatchItemCurrCode; $_l_ArraySize; 1)
														INSERT IN ARRAY:C227($_at_BatchItemDebitAcc; $_l_ArraySize; 1)
														INSERT IN ARRAY:C227($_at_BatchItemdebitIO; $_l_ArraySize; 1)
														INSERT IN ARRAY:C227($_at_batchItemInvoiceNo; $_l_ArraySize; 1)
														INSERT IN ARRAY:C227($_at_BatchItemJobCode; $_l_ArraySize; 1)
														INSERT IN ARRAY:C227($_at_BatchItemLayerCode; $_l_ArraySize; 1)
														INSERT IN ARRAY:C227($_at_BatchItemPurchInvno; $_l_ArraySize; 1)
														INSERT IN ARRAY:C227($_at_BatchItemPurchaseCode; $_l_ArraySize; 1)
														INSERT IN ARRAY:C227($_ar_BatchItemSecondAmt; $_l_ArraySize; 1)
														INSERT IN ARRAY:C227($_ar_BatchItemTaxAmount; $_l_ArraySize; 1)
														INSERT IN ARRAY:C227($_at_BatchItemTaxCode; $_l_ArraySize; 1)
														INSERT IN ARRAY:C227($_ar_BatchItemTotal; $_l_ArraySize; 1)
														INSERT IN ARRAY:C227($_at_Batchitemtranscode; $_l_ArraySize; 1)
														INSERT IN ARRAY:C227($_at_BatchItemUKEC; $_l_ArraySize; 1)
														$_ar_BatchItemAmounts{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Amount:6
														$_at_BatchItemAnalysis{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2
														$_at_BatchItemCoCode{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Company_Code:13
														$_at_BatchItemCreditAcc{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12
														$_at_BatchItemcreditIO{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Credit_IO:16
														$_at_BatchItemCurrCode{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19
														$_at_BatchItemDebitAcc{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3
														$_at_BatchItemdebitIO{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Debit_IO:15
														$_at_batchItemInvoiceNo{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4
														$_at_BatchItemJobCode{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Job_Code:23
														$_at_BatchItemLayerCode{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20
														$_at_BatchItemPurchInvno{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Purchase_invoice_Number:17
														$_at_BatchItemPurchaseCode{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Purchase_Invoice_Code:22
														$_ar_BatchItemSecondAmt{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Second_Amount:21
														$_ar_BatchItemTaxAmount{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8
														$_at_BatchItemTaxCode{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Tax_Code:7
														$_ar_BatchItemTotal{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Total:9
														$_at_Batchitemtranscode{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1
														$_at_BatchItemUKEC{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]UK_EC:18
														//if this posting was single sided need to update the other side correctly
														If ([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3#"") & ([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12#"")
															$_l_BatchItemsIndex:=9999  //Break out
														Else 
															$_bo_FindMultiInvoice:=True:C214
															$_l_Element:=$_l_ArraySize
														End if 
													End if 
													NEXT RECORD:C51([TRANSACTION_BATCH_ITEMS:155])
												End for 
												If ($_bo_FindMultiInvoice)
													FIRST RECORD:C50([TRANSACTION_BATCH_ITEMS:155])
													//the posting was a multi invoice posting...so need to find the other side to get the correct account to reverse
													For ($_l_BatchItemsIndex; 1; Records in selection:C76([TRANSACTION_BATCH_ITEMS:155]))
														If ([TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1=DB_GetLedgerTRANSPURPrePay) & ([TRANSACTION_BATCH_ITEMS:155]Description:10="Multiple Purchases_Payment") & ([TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2=$_at_BatchItemAnalysis{$_l_Element}) & (Abs:C99([TRANSACTION_BATCH_ITEMS:155]Total:9)>=Abs:C99($_ar_BatchItemTotal{$_l_Element}))
															//This is theother side of  item we want to reverse in a new batch
															$_l_ArraySize:=Size of array:C274($_ar_BatchItemAmounts)+1
															INSERT IN ARRAY:C227($_ar_BatchItemAmounts; $_l_ArraySize; 1)
															INSERT IN ARRAY:C227($_at_BatchItemAnalysis; $_l_ArraySize; 1)
															INSERT IN ARRAY:C227($_at_BatchItemCoCode; $_l_ArraySize; 1)
															INSERT IN ARRAY:C227($_at_BatchItemCreditAcc; $_l_ArraySize; 1)
															INSERT IN ARRAY:C227($_at_BatchItemcreditIO; $_l_ArraySize; 1)
															INSERT IN ARRAY:C227($_at_BatchItemCurrCode; $_l_ArraySize; 1)
															INSERT IN ARRAY:C227($_at_BatchItemDebitAcc; $_l_ArraySize; 1)
															INSERT IN ARRAY:C227($_at_BatchItemdebitIO; $_l_ArraySize; 1)
															INSERT IN ARRAY:C227($_at_batchItemInvoiceNo; $_l_ArraySize; 1)
															INSERT IN ARRAY:C227($_at_BatchItemJobCode; $_l_ArraySize; 1)
															INSERT IN ARRAY:C227($_at_BatchItemLayerCode; $_l_ArraySize; 1)
															INSERT IN ARRAY:C227($_at_BatchItemPurchInvno; $_l_ArraySize; 1)
															INSERT IN ARRAY:C227($_at_BatchItemPurchaseCode; $_l_ArraySize; 1)
															INSERT IN ARRAY:C227($_ar_BatchItemSecondAmt; $_l_ArraySize; 1)
															INSERT IN ARRAY:C227($_ar_BatchItemTaxAmount; $_l_ArraySize; 1)
															INSERT IN ARRAY:C227($_at_BatchItemTaxCode; $_l_ArraySize; 1)
															INSERT IN ARRAY:C227($_ar_BatchItemTotal; $_l_ArraySize; 1)
															INSERT IN ARRAY:C227($_at_Batchitemtranscode; $_l_ArraySize; 1)
															INSERT IN ARRAY:C227($_at_BatchItemUKEC; $_l_ArraySize; 1)
															$_ar_BatchItemAmounts{$_l_ArraySize}:=($_ar_BatchItemAmounts{$_l_Element})
															$_at_BatchItemAnalysis{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2
															$_at_BatchItemCoCode{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Company_Code:13
															$_at_BatchItemCreditAcc{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12
															$_at_BatchItemcreditIO{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Credit_IO:16
															$_at_BatchItemCurrCode{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19
															$_at_BatchItemDebitAcc{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3
															$_at_BatchItemdebitIO{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Debit_IO:15
															$_at_batchItemInvoiceNo{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4
															$_at_BatchItemJobCode{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Job_Code:23
															$_at_BatchItemLayerCode{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20
															$_at_BatchItemPurchInvno{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Purchase_invoice_Number:17
															$_at_BatchItemPurchaseCode{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Purchase_Invoice_Code:22
															If ([TRANSACTION_BATCH_ITEMS:155]Second_Amount:21#0)
																$_ar_BatchItemSecondAmt{$_l_ArraySize}:=-($_ar_BatchItemSecondAmt{$_l_Element})
															End if 
															If ([TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8#0)
																$_ar_BatchItemTaxAmount{$_l_ArraySize}:=-($_ar_BatchItemTaxAmount{$_l_Element})
															End if 
															$_at_BatchItemTaxCode{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Tax_Code:7
															$_ar_BatchItemTotal{$_l_ArraySize}:=-($_ar_BatchItemTotal{$_l_Element})
															$_at_Batchitemtranscode{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1
															$_at_BatchItemUKEC{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]UK_EC:18
															//if this posting was single sided need to update the other side correctly
															
															$_l_BatchItemsIndex:=9999  //Break out
															
															
															
															$_bo_OtherSideFound:=True:C214
														End if 
														NEXT RECORD:C51([TRANSACTION_BATCH_ITEMS:155])
													End for 
													If ($_bo_OtherSideFound=False:C215)
														$_r_OtherSideAmount:=0
														$_r_OtherSideTaxAmount:=0
														$_r_OtherSideAmount:=($_ar_BatchItemAmounts{Size of array:C274($_ar_BatchItemAmounts)})
														If ($_ar_BatchItemTaxAmount{Size of array:C274($_ar_BatchItemTaxAmount)}#0)
															$_r_OtherSideTaxAmount:=($_ar_BatchItemTaxAmount{Size of array:C274($_r_OtherSideAmount)})
														End if 
														FIRST RECORD:C50([TRANSACTION_BATCH_ITEMS:155])
														//the posting was a multi invoice posting...so need to find the other side to get the correct account to reverse
														For ($_l_BatchItemIndex2; 1; Records in selection:C76([TRANSACTION_BATCH_ITEMS:155]))
															If ([TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1=DB_GetLedgerTRANSPurINVPay) & ([TRANSACTION_BATCH_ITEMS:155]Description:10="Multiple Purchases_Payment") & ([TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2=$_at_BatchItemAnalysis{$_l_Element})
																//This is theother side of  item we want to reverse in a new batch
																$_l_BatchRow:=Find in array:C230($_al_BatchNumbers; [TRANSACTION_BATCHES:30]Batch_Number:10)
																If ($_l_BatchRow<0)
																	INSERT IN ARRAY:C227($_al_BatchNumbers; Size of array:C274($_al_BatchNumbers)+1; 1)
																	$_al_BatchNumbers{Size of array:C274($_al_BatchNumbers)}:=[TRANSACTION_BATCHES:30]Batch_Number:10
																End if 
																$_l_ArraySize:=Size of array:C274($_ar_BatchItemAmounts)+1
																INSERT IN ARRAY:C227($_ar_BatchItemAmounts; $_l_ArraySize; 1)
																INSERT IN ARRAY:C227($_at_BatchItemAnalysis; $_l_ArraySize; 1)
																INSERT IN ARRAY:C227($_at_BatchItemCoCode; $_l_ArraySize; 1)
																INSERT IN ARRAY:C227($_at_BatchItemCreditAcc; $_l_ArraySize; 1)
																INSERT IN ARRAY:C227($_at_BatchItemcreditIO; $_l_ArraySize; 1)
																INSERT IN ARRAY:C227($_at_BatchItemCurrCode; $_l_ArraySize; 1)
																INSERT IN ARRAY:C227($_at_BatchItemDebitAcc; $_l_ArraySize; 1)
																INSERT IN ARRAY:C227($_at_BatchItemdebitIO; $_l_ArraySize; 1)
																INSERT IN ARRAY:C227($_at_batchItemInvoiceNo; $_l_ArraySize; 1)
																INSERT IN ARRAY:C227($_at_BatchItemJobCode; $_l_ArraySize; 1)
																INSERT IN ARRAY:C227($_at_BatchItemLayerCode; $_l_ArraySize; 1)
																INSERT IN ARRAY:C227($_at_BatchItemPurchInvno; $_l_ArraySize; 1)
																INSERT IN ARRAY:C227($_at_BatchItemPurchaseCode; $_l_ArraySize; 1)
																INSERT IN ARRAY:C227($_ar_BatchItemSecondAmt; $_l_ArraySize; 1)
																INSERT IN ARRAY:C227($_ar_BatchItemTaxAmount; $_l_ArraySize; 1)
																INSERT IN ARRAY:C227($_at_BatchItemTaxCode; $_l_ArraySize; 1)
																INSERT IN ARRAY:C227($_ar_BatchItemTotal; $_l_ArraySize; 1)
																INSERT IN ARRAY:C227($_at_Batchitemtranscode; $_l_ArraySize; 1)
																INSERT IN ARRAY:C227($_at_BatchItemUKEC; $_l_ArraySize; 1)
																//TRACE
																$_ar_BatchItemAmounts{$_l_ArraySize}:=$_r_OtherSideAmount
																$_at_BatchItemAnalysis{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2
																$_at_BatchItemCoCode{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Company_Code:13
																$_at_BatchItemCreditAcc{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12
																$_at_BatchItemcreditIO{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Credit_IO:16
																$_at_BatchItemCurrCode{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19
																$_at_BatchItemDebitAcc{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3
																$_at_BatchItemdebitIO{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Debit_IO:15
																$_at_batchItemInvoiceNo{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4
																$_at_BatchItemJobCode{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Job_Code:23
																$_at_BatchItemLayerCode{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20
																$_at_BatchItemPurchInvno{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Purchase_Invoice_Code:22
																$_at_BatchItemPurchaseCode{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Purchase_Invoice_Code:22
																$_ar_BatchItemSecondAmt{$_l_ArraySize}:=0
																$_ar_BatchItemTaxAmount{$_l_ArraySize}:=$_r_OtherSideTaxAmount
																$_at_BatchItemTaxCode{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Tax_Code:7
																$_ar_BatchItemTotal{$_l_ArraySize}:=-($_ar_BatchItemTotal{$_l_Element})
																$_at_Batchitemtranscode{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1
																$_at_BatchItemUKEC{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]UK_EC:18
																//if this posting was single sided need to update the other side correctly
																$_bo_OtherSideFound:=True:C214
															End if 
															NEXT RECORD:C51([TRANSACTION_BATCH_ITEMS:155])
														End for 
													End if 
												Else 
													$_bo_OtherSideFound:=True:C214
												End if 
											Else 
												Gen_Alert("The original Purchase did not refer to this payment, the reversal is cancelled, there is no Trans in payment record for "+[PURCHASE_INVOICES:37]Purchase_Code:1)
												$_bo_Cancel:=True:C214
											End if 
										Else 
											If ($_t_DepositReference#"")  //if this is a deposit reconciliation
												
												QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1=DB_GetLedgerTRANSPREpost)
												QUERY SELECTION:C341([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Amount:6=Gen_Round(-$_r_Amount; 2; 2))
												QUERY SELECTION:C341([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Description:10="Pre-Payment "+$_t_DepositReference+" Reconciliation")
												
											Else 
												QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1=DB_GetLedgerTRANSPurINVPay)
												QUERY SELECTION:C341([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Amount:6=Gen_Round(-$_r_Amount; 2; 2))
												QUERY SELECTION:C341([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Description:10="Purchase "+[PURCHASE_INVOICES:37]Purchase_Invoice_Number:4+" Payment")
												
											End if 
											SELECTION TO ARRAY:C260([TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31; $_al_TransInNos)
											QUERY WITH ARRAY:C644([TRANSACTION_BATCHES:30]Batch_Number:10; $_al_TransInNos)
											
											If (Records in selection:C76([TRANSACTION_BATCHES:30])>0)
												FIRST RECORD:C50([TRANSACTION_BATCHES:30])
												
												
												
												
												If (Records in selection:C76([TRANSACTION_BATCHES:30])>0)
													FIRST RECORD:C50([TRANSACTION_BATCHES:30])
													For ($_l_BatchIndex; 1; Records in selection:C76([TRANSACTION_BATCHES:30]))
														
														
														
														
														QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTION_BATCHES:30]Batch_Number:10)
														FIRST RECORD:C50([TRANSACTION_BATCH_ITEMS:155])
														$_bo_FindMultiInvoice:=False:C215
														//Gen_Alert ("Creating a reverse batch")
														//TRACE
														For ($_l_BatchItemsIndex; 1; Records in selection:C76([TRANSACTION_BATCH_ITEMS:155]))
															If (([TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1=DB_GetLedgerTRANSPurINVPay) & ([TRANSACTION_BATCH_ITEMS:155]Amount:6=Gen_Round(-$_r_Amount; 2; 2)) & ([TRANSACTION_BATCH_ITEMS:155]Description:10=("Purchase "+[PURCHASE_INVOICES:37]Purchase_Invoice_Number:4+" Payment"))) | (($_t_DepositReference#"") & ([TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1=DB_GetLedgerTRANSPREpost) & ([TRANSACTION_BATCH_ITEMS:155]Amount:6=Gen_Round(-$_r_Amount; 2; 2)) & ([TRANSACTION_BATCH_ITEMS:155]Description:10=("Pre-Payment "+$_t_DepositReference+" Reconciliation")))
																
																
																//This is the item we want to reverse in a new batch
																$_l_BatchRow:=Find in array:C230($_al_BatchNumbers; [TRANSACTION_BATCHES:30]Batch_Number:10)
																If ($_l_BatchRow<0)
																	INSERT IN ARRAY:C227($_al_BatchNumbers; Size of array:C274($_al_BatchNumbers)+1; 1)
																	$_al_BatchNumbers{Size of array:C274($_al_BatchNumbers)}:=[TRANSACTION_BATCHES:30]Batch_Number:10
																End if 
																
																$_l_ArraySize:=Size of array:C274($_ar_BatchItemAmounts)+1
																INSERT IN ARRAY:C227($_ar_BatchItemAmounts; $_l_ArraySize; 1)
																INSERT IN ARRAY:C227($_at_BatchItemAnalysis; $_l_ArraySize; 1)
																INSERT IN ARRAY:C227($_at_BatchItemCoCode; $_l_ArraySize; 1)
																INSERT IN ARRAY:C227($_at_BatchItemCreditAcc; $_l_ArraySize; 1)
																INSERT IN ARRAY:C227($_at_BatchItemcreditIO; $_l_ArraySize; 1)
																INSERT IN ARRAY:C227($_at_BatchItemCurrCode; $_l_ArraySize; 1)
																INSERT IN ARRAY:C227($_at_BatchItemDebitAcc; $_l_ArraySize; 1)
																INSERT IN ARRAY:C227($_at_BatchItemdebitIO; $_l_ArraySize; 1)
																
																INSERT IN ARRAY:C227($_at_batchItemInvoiceNo; $_l_ArraySize; 1)
																INSERT IN ARRAY:C227($_at_BatchItemJobCode; $_l_ArraySize; 1)
																INSERT IN ARRAY:C227($_at_BatchItemLayerCode; $_l_ArraySize; 1)
																INSERT IN ARRAY:C227($_at_BatchItemPurchInvno; $_l_ArraySize; 1)
																INSERT IN ARRAY:C227($_at_BatchItemPurchaseCode; $_l_ArraySize; 1)
																INSERT IN ARRAY:C227($_ar_BatchItemSecondAmt; $_l_ArraySize; 1)
																INSERT IN ARRAY:C227($_ar_BatchItemTaxAmount; $_l_ArraySize; 1)
																INSERT IN ARRAY:C227($_at_BatchItemTaxCode; $_l_ArraySize; 1)
																INSERT IN ARRAY:C227($_ar_BatchItemTotal; $_l_ArraySize; 1)
																INSERT IN ARRAY:C227($_at_Batchitemtranscode; $_l_ArraySize; 1)
																INSERT IN ARRAY:C227($_at_BatchItemUKEC; $_l_ArraySize; 1)
																$_ar_BatchItemAmounts{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Amount:6
																$_at_BatchItemAnalysis{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2
																$_at_BatchItemCoCode{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Company_Code:13
																$_at_BatchItemCreditAcc{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12
																$_at_BatchItemcreditIO{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Credit_IO:16
																$_at_BatchItemCurrCode{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19
																$_at_BatchItemDebitAcc{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3
																$_at_BatchItemdebitIO{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Debit_IO:15
																$_at_batchItemInvoiceNo{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4
																$_at_BatchItemJobCode{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Job_Code:23
																$_at_BatchItemLayerCode{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20
																$_at_BatchItemPurchInvno{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Purchase_invoice_Number:17
																$_at_BatchItemPurchaseCode{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Purchase_Invoice_Code:22
																$_ar_BatchItemSecondAmt{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Second_Amount:21
																$_ar_BatchItemTaxAmount{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8
																$_at_BatchItemTaxCode{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Tax_Code:7
																$_ar_BatchItemTotal{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Total:9
																$_at_Batchitemtranscode{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1
																$_at_BatchItemUKEC{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]UK_EC:18
																//if this posting was single sided need to update the other side correctly
																If ([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3#"") & ([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12#"")
																	$_l_BatchItemsIndex:=9999  //Break out
																	
																Else 
																	$_bo_FindMultiInvoice:=True:C214
																	$_l_Element:=$_l_ArraySize
																End if 
																$_t_DepositReference:=""
															End if 
															NEXT RECORD:C51([TRANSACTION_BATCH_ITEMS:155])
														End for 
														If ($_bo_FindMultiInvoice)
															FIRST RECORD:C50([TRANSACTION_BATCH_ITEMS:155])
															//the posting was a multi invoice posting...so need to find the other side to get the correct account to reverse
															For ($_l_BatchItemsIndex; 1; Records in selection:C76([TRANSACTION_BATCH_ITEMS:155]))
																If ([TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1=DB_GetLedgerTRANSPurINVPay) & ([TRANSACTION_BATCH_ITEMS:155]Description:10="Multiple Purchases_Payment") & ([TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2=$_at_BatchItemAnalysis{$_l_Element}) & (Abs:C99([TRANSACTION_BATCH_ITEMS:155]Total:9)>=Abs:C99($_ar_BatchItemTotal{$_l_Element}))
																	//This is theother side of  item we want to reverse in a new batch
																	$_l_BatchRow:=Find in array:C230($_al_BatchNumbers; [TRANSACTION_BATCHES:30]Batch_Number:10)
																	If ($_l_BatchRow<0)
																		INSERT IN ARRAY:C227($_al_BatchNumbers; Size of array:C274($_al_BatchNumbers)+1; 1)
																		$_al_BatchNumbers{Size of array:C274($_al_BatchNumbers)}:=[TRANSACTION_BATCHES:30]Batch_Number:10
																	End if 
																	$_l_ArraySize:=Size of array:C274($_ar_BatchItemAmounts)+1
																	INSERT IN ARRAY:C227($_ar_BatchItemAmounts; $_l_ArraySize; 1)
																	INSERT IN ARRAY:C227($_at_BatchItemAnalysis; $_l_ArraySize; 1)
																	INSERT IN ARRAY:C227($_at_BatchItemCoCode; $_l_ArraySize; 1)
																	INSERT IN ARRAY:C227($_at_BatchItemCreditAcc; $_l_ArraySize; 1)
																	INSERT IN ARRAY:C227($_at_BatchItemcreditIO; $_l_ArraySize; 1)
																	INSERT IN ARRAY:C227($_at_BatchItemCurrCode; $_l_ArraySize; 1)
																	INSERT IN ARRAY:C227($_at_BatchItemDebitAcc; $_l_ArraySize; 1)
																	INSERT IN ARRAY:C227($_at_BatchItemdebitIO; $_l_ArraySize; 1)
																	INSERT IN ARRAY:C227($_at_batchItemInvoiceNo; $_l_ArraySize; 1)
																	INSERT IN ARRAY:C227($_at_BatchItemJobCode; $_l_ArraySize; 1)
																	INSERT IN ARRAY:C227($_at_BatchItemLayerCode; $_l_ArraySize; 1)
																	INSERT IN ARRAY:C227($_at_BatchItemPurchInvno; $_l_ArraySize; 1)
																	INSERT IN ARRAY:C227($_at_BatchItemPurchaseCode; $_l_ArraySize; 1)
																	INSERT IN ARRAY:C227($_ar_BatchItemSecondAmt; $_l_ArraySize; 1)
																	INSERT IN ARRAY:C227($_ar_BatchItemTaxAmount; $_l_ArraySize; 1)
																	INSERT IN ARRAY:C227($_at_BatchItemTaxCode; $_l_ArraySize; 1)
																	INSERT IN ARRAY:C227($_ar_BatchItemTotal; $_l_ArraySize; 1)
																	INSERT IN ARRAY:C227($_at_Batchitemtranscode; $_l_ArraySize; 1)
																	INSERT IN ARRAY:C227($_at_BatchItemUKEC; $_l_ArraySize; 1)
																	$_ar_BatchItemAmounts{$_l_ArraySize}:=($_ar_BatchItemAmounts{$_l_Element})
																	$_at_BatchItemAnalysis{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2
																	$_at_BatchItemCoCode{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Company_Code:13
																	$_at_BatchItemCreditAcc{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12
																	$_at_BatchItemcreditIO{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Credit_IO:16
																	$_at_BatchItemCurrCode{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19
																	$_at_BatchItemDebitAcc{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3
																	$_at_BatchItemdebitIO{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Debit_IO:15
																	$_at_batchItemInvoiceNo{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4
																	$_at_BatchItemJobCode{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Job_Code:23
																	$_at_BatchItemLayerCode{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20
																	$_at_BatchItemPurchInvno{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Purchase_invoice_Number:17
																	$_at_BatchItemPurchaseCode{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Purchase_Invoice_Code:22
																	If ([TRANSACTION_BATCH_ITEMS:155]Second_Amount:21#0)
																		$_ar_BatchItemSecondAmt{$_l_ArraySize}:=-($_ar_BatchItemSecondAmt{$_l_Element})
																	End if 
																	If ([TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8#0)
																		$_ar_BatchItemTaxAmount{$_l_ArraySize}:=-($_ar_BatchItemTaxAmount{$_l_Element})
																	End if 
																	$_at_BatchItemTaxCode{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Tax_Code:7
																	$_ar_BatchItemTotal{$_l_ArraySize}:=-($_ar_BatchItemTotal{$_l_ArraySize})
																	$_at_Batchitemtranscode{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1
																	$_at_BatchItemUKEC{$_l_ArraySize}:=[TRANSACTION_BATCH_ITEMS:155]UK_EC:18
																	//if this posting was single sided need to update the other side correctly
																	$_l_BatchItemsIndex:=9999  //Break out
																End if 
																NEXT RECORD:C51([TRANSACTION_BATCH_ITEMS:155])
															End for 
														End if 
														NEXT RECORD:C51([TRANSACTION_BATCHES:30])
													End for 
												Else 
													Gen_Alert("The original Purchase did not refer to this payment, the reversal is cancelled, there is no trans in(batch) record of type purchase payment transaction for the correct amount refering to payment "+[PURCHASE_INVOICES:37]Purchase_Code:1)
													$_bo_Cancel:=True:C214
												End if 
												
												
											Else 
												Gen_Alert("The original invoice did not refer to this payment, the reversal is cancelled.  There is no allocation record for "+[PURCHASE_INVOICES:37]Purchase_Code:1)
												
												$_bo_Cancel:=True:C214
											End if 
											
											
											
											
											
											
											
									End case 
									
								Else 
									Gen_Alert("The original invoice did not refer to this payment, the reversal is cancelled.  There is no allocation record for "+[PURCHASE_INVOICES:37]Purchase_Code:1)
									
									
									
									
									
									
									$_bo_Cancel:=True:C214
								End if 
							Else 
								Gen_Alert("The original purchase is missing, the reversal is cancelled")
								$_bo_Cancel:=True:C214
							End if 
							
							
						End if 
						
					End for 
					//Gen_Alert ("receipt(refund) made")
					//Now we have all the other side amounts we can create the reverse batch
					If (Size of array:C274($_al_BatchNumbers)>0) & Not:C34($_bo_Cancel)
						$_l_AddMode:=Vadd
						Vadd:=0
						CREATE RECORD:C68([TRANSACTION_BATCHES:30])
						BatchNo
						If ([TRANSACTION_BATCHES:30]Batch_Number:10=0)
							OK:=0
						Else 
							[TRANSACTION_BATCHES:30]Batch_Date:1:=vDate
							[TRANSACTION_BATCHES:30]Entry_Date:6:=<>DB_d_CurrentDate
							[TRANSACTION_BATCHES:30]Description:12:="Purchase Payment Reversal: "  //  `vDesc
							
							If (Size of array:C274($_ar_BatchItemAmounts)>1)
								$_bo_SinSID:=True:C214
								//The single sides are stored in the array too...including the amounts-but not rolled up not the amounts of them
								//so here before we start just try to roll them up
								For ($_l_CombineIndex; 1; Size of array:C274($_ar_BatchItemAmounts))
									$_t_AnalysisCode:=$_at_BatchItemAnalysis{$_l_CombineIndex}
									$_t_CompanyCode:=$_at_BatchItemCoCode{$_l_CombineIndex}
									$_t_CreditAccount:=$_at_BatchItemCreditAcc{$_l_CombineIndex}
									$_t_CreditIIO:=$_at_BatchItemcreditIO{$_l_CombineIndex}
									$_t_CurrencyCode:=$_at_BatchItemCurrCode{$_l_CombineIndex}
									$_t_DebitAccount:=$_at_BatchItemDebitAcc{$_l_CombineIndex}
									$_t_DebitIO:=$_at_BatchItemdebitIO{$_l_CombineIndex}
									$_t_BatchInvoiceNumberNV:=$_at_batchItemInvoiceNo{$_l_CombineIndex}
									$_t_JobCode:=$_at_BatchItemJobCode{$_l_CombineIndex}
									$_t_LayerCode:=$_at_BatchItemLayerCode{$_l_CombineIndex}
									$_t_PurchaseInvoiceNumber:=$_at_BatchItemPurchInvno{$_l_CombineIndex}
									$_t_PurchaseOrderNumber:=$_at_BatchItemPurchaseCode{$_l_CombineIndex}
									$_t_TransactionCode:=$_at_Batchitemtranscode{$_l_CombineIndex}
									$_t_UKEC:=$_at_BatchItemUKEC{$_l_CombineIndex}
									For ($_l_CombineIndex2; $_l_CombineIndex+1; Size of array:C274($_ar_BatchItemAmounts))
										If ($_l_CombineIndex2<=Size of array:C274($_ar_BatchItemAmounts))
											
											If ($_t_AnalysisCode=$_at_BatchItemAnalysis{$_l_CombineIndex2}) & ($_t_CreditAccount=$_at_BatchItemCreditAcc{$_l_CombineIndex2}) & ($_t_CreditIIO=$_at_BatchItemcreditIO{$_l_CombineIndex2}) & ($_t_CurrencyCode=$_at_BatchItemCurrCode{$_l_CombineIndex2}) & ($_t_DebitAccount=$_at_BatchItemDebitAcc{$_l_CombineIndex2}) & ($_t_DebitIO=$_at_BatchItemdebitIO{$_l_CombineIndex2}) & ($_t_BatchInvoiceNumberNV=$_at_batchItemInvoiceNo{$_l_CombineIndex2}) & ($_t_JobCode=$_at_BatchItemJobCode{$_l_CombineIndex2}) & ($_t_LayerCode=$_at_BatchItemLayerCode{$_l_CombineIndex2}) & ($_t_PurchaseInvoiceNumber=$_at_BatchItemPurchInvno{$_l_CombineIndex2}) & ($_t_PurchaseOrderNumber=$_at_BatchItemPurchaseCode{$_l_CombineIndex2}) & ($_t_TransactionCode=$_at_Batchitemtranscode{$_l_CombineIndex2}) & ($_t_UKEC=$_at_BatchItemUKEC{$_l_CombineIndex2})
												
												//can roll together
												$_ar_BatchItemAmounts{$_l_CombineIndex2}:=$_ar_BatchItemAmounts{$_l_CombineIndex}+$_ar_BatchItemAmounts{$_l_CombineIndex2}
												$_ar_BatchItemSecondAmt{$_l_CombineIndex2}:=$_ar_BatchItemSecondAmt{$_l_CombineIndex}+$_ar_BatchItemSecondAmt{$_l_CombineIndex2}
												$_ar_BatchItemTaxAmount{$_l_CombineIndex2}:=$_ar_BatchItemTaxAmount{$_l_CombineIndex}+$_ar_BatchItemTaxAmount{$_l_CombineIndex2}
												$_ar_BatchItemTotal{$_l_CombineIndex2}:=$_ar_BatchItemTotal{$_l_CombineIndex}+$_ar_BatchItemTotal{$_l_CombineIndex2}
												//and clear the now not needed line
												$_at_BatchItemAnalysis{$_l_CombineIndex}:=""
												$_at_BatchItemCoCode{$_l_CombineIndex}:=""
												$_at_BatchItemCreditAcc{$_l_CombineIndex}:=""
												$_at_BatchItemcreditIO{$_l_CombineIndex}:=""
												$_at_BatchItemCurrCode{$_l_CombineIndex}:=""
												$_at_BatchItemDebitAcc{$_l_CombineIndex}:=""
												$_at_BatchItemdebitIO{$_l_CombineIndex}:=""
												$_at_batchItemInvoiceNo{$_l_CombineIndex}:=""
												$_at_BatchItemJobCode{$_l_CombineIndex}:=""
												$_at_BatchItemLayerCode{$_l_CombineIndex}:=""
												$_at_BatchItemPurchInvno{$_l_CombineIndex}:=""
												$_at_BatchItemPurchaseCode{$_l_CombineIndex}:=""
												$_at_Batchitemtranscode{$_l_CombineIndex}:=""
												
												$_l_CombineIndex2:=Size of array:C274($_ar_BatchItemAmounts)
											End if 
										End if 
									End for 
									
								End for 
								$_l_SizeofArray:=Size of array:C274($_ar_BatchItemAmounts)
								$_l_BatchItemID:=0
								$_l_BatchItemReference:=0
								$_l_BatchItemID:=(AA_GetNextID(->[TRANSACTION_BATCH_ITEMS:155]ID:30; -$_l_SizeofArray))-$_l_SizeofArray
								$_l_BatchItemReference:=(AA_GetNextIDinMethod(->DS_l_BATCHITEM; -$_l_SizeofArray))-$_l_SizeofArray
								For ($_l_BatchCreate; 1; Size of array:C274($_ar_BatchItemAmounts))
									If ($_at_BatchItemCreditAcc{$_l_BatchCreate}#"") | ($_at_BatchItemDebitAcc{$_l_BatchCreate}#"")
										CREATE RECORD:C68([TRANSACTION_BATCH_ITEMS:155])
										[TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31:=[TRANSACTION_BATCHES:30]Batch_Number:10
										If ($_l_BatchItemID>0)
											[TRANSACTION_BATCH_ITEMS:155]ID:30:=$_l_BatchItemID
											$_l_BatchItemID:=$_l_BatchItemID+1
										Else 
											[TRANSACTION_BATCH_ITEMS:155]ID:30:=AA_GetNextID(->[TRANSACTION_BATCH_ITEMS:155]ID:30)
										End if 
										[TRANSACTION_BATCH_ITEMS:155]Amount:6:=-($_ar_BatchItemAmounts{$_l_BatchCreate})
										[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2:=$_at_BatchItemAnalysis{$_l_BatchCreate}
										[TRANSACTION_BATCH_ITEMS:155]Company_Code:13:=$_at_BatchItemCoCode{$_l_BatchCreate}
										[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12:=$_at_BatchItemCreditAcc{$_l_BatchCreate}
										[TRANSACTION_BATCH_ITEMS:155]Credit_IO:16:=$_at_BatchItemcreditIO{$_l_BatchCreate}
										[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19:=$_at_BatchItemCurrCode{$_l_BatchCreate}
										[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3:=$_at_BatchItemDebitAcc{$_l_BatchCreate}
										[TRANSACTION_BATCH_ITEMS:155]Debit_IO:15:=$_at_BatchItemdebitIO{$_l_BatchCreate}
										[TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4:=$_at_batchItemInvoiceNo{$_l_BatchCreate}
										[TRANSACTION_BATCH_ITEMS:155]Job_Code:23:=$_at_BatchItemJobCode{$_l_BatchCreate}
										[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20:=$_at_BatchItemLayerCode{$_l_BatchCreate}
										[TRANSACTION_BATCH_ITEMS:155]Purchase_invoice_Number:17:=$_at_BatchItemPurchInvno{$_l_BatchCreate}
										[TRANSACTION_BATCH_ITEMS:155]Purchase_Invoice_Code:22:=$_at_BatchItemPurchaseCode{$_l_BatchCreate}
										[TRANSACTION_BATCH_ITEMS:155]Second_Amount:21:=-($_ar_BatchItemSecondAmt{$_l_BatchCreate})
										[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8:=-($_ar_BatchItemTaxAmount{$_l_BatchCreate})
										[TRANSACTION_BATCH_ITEMS:155]Tax_Code:7:=$_at_BatchItemTaxCode{$_l_BatchCreate}
										[TRANSACTION_BATCH_ITEMS:155]Total:9:=[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8+[TRANSACTION_BATCH_ITEMS:155]Amount:6
										[TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1:=$_at_Batchitemtranscode{$_l_BatchCreate}
										[TRANSACTION_BATCH_ITEMS:155]UK_EC:18:=$_at_BatchItemUKEC{$_l_BatchCreate}
										[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5:=Current date:C33(*)
										[TRANSACTION_BATCH_ITEMS:155]Period_Code:11:=$_t_PeriodPosting
										If ([TRANSACTION_BATCH_ITEMS:155]BatchItemID:25=0)
											If ($_l_BatchItemReference>0)
												[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=$_l_BatchItemReference
												$_l_BatchItemReference:=$_l_BatchItemReference+1
											Else 
												[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=AA_GetNextIDinMethod(->DS_l_BATCHITEM)
											End if 
										End if 
										DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
									End if 
									
								End for 
								
							Else 
								$_bo_SinSID:=False:C215
								CREATE RECORD:C68([TRANSACTION_BATCH_ITEMS:155])
								[TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31:=[TRANSACTION_BATCHES:30]Batch_Number:10
								[TRANSACTION_BATCH_ITEMS:155]ID:30:=AA_GetNextID(->[TRANSACTION_BATCH_ITEMS:155]ID:30)
								[TRANSACTION_BATCH_ITEMS:155]Amount:6:=-($_ar_BatchItemAmounts{1})
								[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2:=$_at_BatchItemAnalysis{1}
								[TRANSACTION_BATCH_ITEMS:155]Company_Code:13:=$_at_BatchItemCoCode{1}
								[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12:=$_at_BatchItemCreditAcc{1}
								[TRANSACTION_BATCH_ITEMS:155]Credit_IO:16:=$_at_BatchItemcreditIO{1}
								[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19:=$_at_BatchItemCurrCode{1}
								[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3:=$_at_BatchItemDebitAcc{1}
								[TRANSACTION_BATCH_ITEMS:155]Debit_IO:15:=$_at_BatchItemdebitIO{1}
								[TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4:=$_at_batchItemInvoiceNo{1}
								[TRANSACTION_BATCH_ITEMS:155]Job_Code:23:=$_at_BatchItemJobCode{1}
								[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20:=$_at_BatchItemLayerCode{1}
								[TRANSACTION_BATCH_ITEMS:155]Purchase_invoice_Number:17:=$_at_BatchItemPurchInvno{1}
								[TRANSACTION_BATCH_ITEMS:155]Purchase_Invoice_Code:22:=$_at_BatchItemPurchaseCode{1}
								[TRANSACTION_BATCH_ITEMS:155]Second_Amount:21:=-($_ar_BatchItemSecondAmt{1})
								[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8:=-($_ar_BatchItemTaxAmount{1})
								[TRANSACTION_BATCH_ITEMS:155]Tax_Code:7:=$_at_BatchItemTaxCode{1}
								[TRANSACTION_BATCH_ITEMS:155]Total:9:=[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8+[TRANSACTION_BATCH_ITEMS:155]Amount:6
								[TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1:=$_at_Batchitemtranscode{1}
								[TRANSACTION_BATCH_ITEMS:155]UK_EC:18:=$_at_BatchItemUKEC{1}
								[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5:=Current date:C33(*)
								[TRANSACTION_BATCH_ITEMS:155]Period_Code:11:=$_t_PeriodPosting
								If ([TRANSACTION_BATCH_ITEMS:155]BatchItemID:25=0)
									
									[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=AA_GetNextIDinMethod(->DS_l_BATCHITEM)
								End if 
								DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
							End if 
							
						End if 
						QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTION_BATCHES:30]Batch_Number:10)
						
						
						//that is the inverse batch items created
						TransB_InLPTot
						DB_SaveRecord(->[TRANSACTION_BATCHES:30])
						
						//Gen_Alert ("Trans in Created-posting now")
						
						
						$_l_TransPostStatus:=TransactionBatch_Post
						//Gen_Alert ("Batch Posted")
						
						vAdd:=$_l_AddMode
						UNLOAD RECORD:C212([TRANSACTION_BATCHES:30])
						
						If ($_l_TransPostStatus>=0)
							If (Size of array:C274($_at_PPtoUpdate)>0)
								For ($_l_RecordsIndex; 1; Size of array:C274($_at_PPtoUpdate))
									READ WRITE:C146([PURCHASE_INVOICES:37])
									QUERY:C277([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Purchase_Code:1=$_at_PPtoUpdate{$_l_RecordsIndex})
									QUERY:C277([PURCHASE_INVOICE_ALLOCATIONS:159]; [PURCHASE_INVOICE_ALLOCATIONS:159]PURCHASES_INVOICE_CODE:6=[PURCHASE_INVOICES:37]Purchase_Code:1)
									$_r_TotalDue:=PUR_SetDueAmount
									
									QUERY:C277([PURCHASE_INVOICE_ALLOCATIONS:159]; [PURCHASE_INVOICE_ALLOCATIONS:159]PURCHASES_INVOICE_CODE:6=[PURCHASE_INVOICES:37]Purchase_Code:1)
									
									[PURCHASE_INVOICES:37]Total_Paid:8:=Sum:C1([PURCHASE_INVOICE_ALLOCATIONS:159]Amount:2)
									[PURCHASE_INVOICES:37]Total_Due:9:=$_r_TotalDue
									DB_SaveRecord(->[PURCHASE_INVOICES:37])
								End for 
								UNLOAD RECORD:C212([PURCHASE_INVOICES:37])
								
							End if 
							
							
							$_bo_Cancel:=False:C215
						Else 
							$_bo_Cancel:=True:C214
							Gen_Alert("The items to undo could not be built")
						End if 
					Else 
						$_bo_Cancel:=True:C214
						Gen_Alert("The items to undo could not be built")
						
					End if 
					
				End if 
				UNLOAD RECORD:C212([TRANSACTION_BATCHES:30])
				UNLOAD RECORD:C212([TRANSACTIONS:29])
				If ($_bo_Cancel)
					//CANCEL TRANSACTION
					Transact_End(False:C215)
				Else 
					// /VALIDATE TRANSACTION
					Transact_End(True:C214)
				End if 
				
			End for 
		End if 
	End if 
	
Else 
	Gen_Alert("Sorry the Purchases_Payment cannot be found")
	
End if 
ERR_MethodTrackerReturn("INV_PPaymentUNDO"; $_t_oldMethodName)