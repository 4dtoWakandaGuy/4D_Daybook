//%attributes = {}
If (False:C215)
	//Project Method Name:      PI_undoPayment
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/09/2012 08:39
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_BatchNumbers; 0)
	ARRAY LONGINT:C221($_al_TransBatchCodes; 0)
	ARRAY REAL:C219($_ar_AllocationAmounts; 0)
	ARRAY REAL:C219($_ar_BatchItemAmount; 0)
	ARRAY REAL:C219($_ar_BatchItemSecondAmt; 0)
	ARRAY REAL:C219($_ar_BatchItemTaxAmount; 0)
	ARRAY REAL:C219($_ar_BatchItemTotal; 0)
	ARRAY TEXT:C222($_at_AllocationPurchaseNumbers; 0)
	ARRAY TEXT:C222($_at_BatchItemAnalysis; 0)
	ARRAY TEXT:C222($_at_BatchItemCoCode; 0)
	ARRAY TEXT:C222($_at_BatchItemCreditAcc; 0)
	ARRAY TEXT:C222($_at_BatchItemcreditIO; 0)
	ARRAY TEXT:C222($_at_BatchItemCurrCode; 0)
	ARRAY TEXT:C222($_at_BatchItemDebitAcc; 0)
	ARRAY TEXT:C222($_at_BatchItemdebitIO; 0)
	ARRAY TEXT:C222($_at_BatchItemInvoiceNo; 0)
	ARRAY TEXT:C222($_at_BatchItemJobCode; 0)
	ARRAY TEXT:C222($_at_BatchItemLayerCode; 0)
	ARRAY TEXT:C222($_at_BatchItemPurchaseCode; 0)
	ARRAY TEXT:C222($_at_BatchItemPurchInvno; 0)
	ARRAY TEXT:C222($_at_BatchItemTaxCode; 0)
	ARRAY TEXT:C222($_at_Batchitemtranscode; 0)
	ARRAY TEXT:C222($_at_BatchItemUKEC; 0)
	C_BOOLEAN:C305($_bo_Cancel; $_bo_Continue; $_bo_DepositReconcile; $_bo_FindMultiInvoice; $_bo_OK; $_bo_OK2; $_bo_SingleSided; $_bo_Unlocked; $1)
	C_DATE:C307(<>DB_d_CurrentDate; vDate)
	C_LONGINT:C283($_l_AddMode; $_l_BatchCreateIndex; $_l_BatchIndex; $_l_BatchItemID; $_l_BatchItemIndex; $_l_BatchItemRecords; $_l_BatchItemReference; $_l_BatchNumberRow; $_l_CurrentRow; $_l_Index; $_l_InsertionPoint)
	C_LONGINT:C283($_l_IsUnique; $_l_PeriodID; $_l_PurchaseInvoiceCount; $_l_PurchInvoiceAllocIndex; $_l_PurchInvoiceAllocIndex2; $_l_RecordsCount; $_l_RollupIndex; $_l_RollupIndex2; $_l_TimeOut; $_l_TransPostStatus; DS_l_BATCHITEMRef)
	C_LONGINT:C283(Vadd)
	C_REAL:C285($_r_Amount; $_r_AmountToRefund; $_r_TotalDue; $2)
	C_TEXT:C284($_t_AnalysisCode; $_t_CompanyCode; $_t_CreditAccount; $_t_CreditIO; $_t_CurrencyCode; $_t_DebitAccount; $_t_DebitIO; $_t_DepositReference; $_t_invoiceNumber; $_t_InvoiceNumberOLD; $_t_JobCode)
	C_TEXT:C284($_t_LayerCode; $_t_oldMethodName; $_t_OtherSide; $_t_PayPeriod; $_t_PeriodPosting; $_t_PurchaseCode; $_t_PurchaseInvoiceNo; $_t_PurchaseNumber; $_t_ReverseReceiptNumber; $_t_TotalPaid; $_t_TransactionCode)
	C_TEXT:C284($_t_UKEC; ACC_t_CurrencyCode; vLayer)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PI_undoPayment")

QUERY:C277([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Purchase_Code:1="*S10174")

COPY NAMED SELECTION:C331([PURCHASE_INVOICES:37]; "$PaySel")

QUERY SELECTION:C341([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]State:24=-3; *)
QUERY SELECTION:C341([PURCHASE_INVOICES:37];  & ; [PURCHASE_INVOICES:37]X_Reversed:11=0)

DB_SaveRecord(->[PURCHASE_INVOICES:37])
If (Records in selection:C76([PURCHASE_INVOICES:37])>0)
	$_l_PurchaseInvoiceCount:=Records in selection:C76([PURCHASE_INVOICES:37])
	CREATE SET:C116([PURCHASE_INVOICES:37]; "toRefund")
	$_bo_Continue:=True:C214
	FIRST RECORD:C50([PURCHASE_INVOICES:37])
	While ((Not:C34(End selection:C36([PURCHASE_INVOICES:37]))) & ($_bo_Continue))
		$_bo_Unlocked:=Check_Locked(->[PURCHASE_INVOICES:37]; 1)
		If (Not:C34($_bo_Unlocked))
			
			Gen_Confirm("Payment+"+[PURCHASE_INVOICES:37]Purchase_Code:1+" is locked by another user.  The payment  cannot be reversed."; "Wait"; "Stop")
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
						Gen_Confirm("Payment "+[PURCHASE_INVOICES:37]Purchase_Code:1+" is STILL locked by another user.  The reversed payment still cannot be posted."; "Wait"; "Stop")
					End if 
					$_bo_Continue:=(OK=1)
				Until ($_bo_Unlocked=True:C214) | (Not:C34($_bo_Continue))
				
			End if 
		End if 
		If (Not:C34($_bo_Unlocked))
			Gen_Alert("Payment "+[PURCHASE_INVOICES:37]Purchase_Code:1+" is locked by another user.  The payment  cannot be reversed."; "Cancel")
			$_bo_Continue:=False:C215
		End if 
		NEXT RECORD:C51([PURCHASE_INVOICES:37])
	End while 
	If ($_bo_Continue)
		FIRST RECORD:C50([PURCHASE_INVOICES:37])
		If (Count parameters:C259>=2)  //Note this can only be used where one invoice is passed to this method
			$_r_AmountToRefund:=$2
		Else 
			$_r_AmountToRefund:=[PURCHASE_INVOICES:37]Total_Paid:8
		End if 
		
		For ($_l_Index; 1; $_l_PurchaseInvoiceCount)
			StartTransaction
			READ WRITE:C146([TRANSACTIONS:29])
			READ WRITE:C146([TRANSACTION_BATCHES:30])
			USE SET:C118("ToRefund")
			GOTO SELECTED RECORD:C245([PURCHASE_INVOICES:37]; $_l_Index)
			[PURCHASE_INVOICES:37]X_Reversed:11:=1
			DB_SaveRecord(->[PURCHASE_INVOICES:37])
			
			ACC_t_CurrencyCode:=[PURCHASE_INVOICES:37]Currency_Code:23
			vLayer:=[PURCHASE_INVOICES:37]Layer_Code:28
			$_t_PurchaseNumber:=[PURCHASE_INVOICES:37]Purchase_Code:1
			QUERY:C277([PURCHASE_INVOICE_ALLOCATIONS:159]; [PURCHASE_INVOICE_ALLOCATIONS:159]PURCHASES_INVOICE_CODE:6=[PURCHASE_INVOICES:37]Purchase_Code:1)
			
			
			SELECTION TO ARRAY:C260([PURCHASE_INVOICE_ALLOCATIONS:159]Amount:2; $_ar_AllocationAmounts; [PURCHASE_INVOICE_ALLOCATIONS:159]Purchase_Code:1; $_at_AllocationPurchaseNumbers)
			//Note that the purchase number could be an invoice or a deposit or a credit
			//*P=Deposit...
			//`no idend for credits but the amounts will be -
			
			ARRAY REAL:C219($_ar_BatchItemAmount; 0)
			ARRAY TEXT:C222($_at_BatchItemAnalysis; 0)
			ARRAY TEXT:C222($_at_BatchItemCoCode; 0)
			ARRAY TEXT:C222($_at_BatchItemCreditAcc; 0)
			ARRAY TEXT:C222($_at_BatchItemcreditIO; 0)
			ARRAY TEXT:C222($_at_BatchItemdebitIO; 0)
			ARRAY TEXT:C222($_at_BatchItemCurrCode; 0)
			ARRAY TEXT:C222($_at_BatchItemDebitAcc; 0)
			
			ARRAY TEXT:C222($_at_BatchItemInvoiceNo; 0)
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
			
			
			$_t_InvoiceNumberOLD:=[PURCHASE_INVOICES:37]Purchase_Code:1
			DUPLICATE RECORD:C225([PURCHASE_INVOICES:37])
			
			
			Repeat 
				$_t_invoiceNumber:=Substring:C12("*S"+Gen_CodePref(28; ->[PURCHASE_INVOICES:37]Purchase_Code:1; "*S"); 1; 11)
				
				SET QUERY DESTINATION:C396(3; $_l_IsUnique)
				QUERY:C277([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Purchase_Code:1=$_t_invoiceNumber)
				If ($_l_IsUnique=0)
					[PURCHASE_INVOICES:37]Purchase_Code:1:=$_t_invoiceNumber
				End if 
				SET QUERY DESTINATION:C396(0)
			Until ($_l_IsUnique=0)
			$_t_ReverseReceiptNumber:=[PURCHASE_INVOICES:37]Purchase_Code:1
			//Need to Check_Period code
			[PURCHASE_INVOICES:37]Posted_Date:12:=<>DB_d_CurrentDate
			vDate:=[PURCHASE_INVOICES:37]Invoice_Date:5
			$_l_PeriodID:=Check_Period
			$_bo_OK:=True:C214
			If ([PERIODS:33]Period_Code:1#[PURCHASE_INVOICES:37]Period_Code:3)
				$_t_PayPeriod:=Gen_Request("Payment is to previous period( "+[PURCHASE_INVOICES:37]Period_Code:3+". Post to period:"; [PERIODS:33]Period_Code:1)
				If (OK=1)
					QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_t_PayPeriod)
					Check_PerCloseI
					[PURCHASE_INVOICES:37]Period_Code:3:=[PERIODS:33]Period_Code:1
					
					$_bo_OK:=True:C214
				Else 
					Gen_Alert("Reversing Payment "+$_t_InvoiceNumberOLD+" has been cancelled")
					$_bo_OK:=False:C215
					$_bo_Cancel:=True:C214
				End if 
			End if 
			If ($_bo_OK)
				[PURCHASE_INVOICES:37]Invoice_Date:5:=Current date:C33(*)
				[PURCHASE_INVOICES:37]Comments:16:="Payment Reversal "+Char:C90(13)+("Description: "*(Num:C11($_t_PurchaseNumber#"")))+$_t_PurchaseNumber+" Cheque No:"+[PURCHASE_INVOICES:37]Cheque_Number:26
				[PURCHASE_INVOICES:37]Cheque_Number:26:=""
				QUERY:C277([PURCHASE_INVOICE_ALLOCATIONS:159]; [PURCHASE_INVOICE_ALLOCATIONS:159]PURCHASES_INVOICE_CODE:6=$_t_InvoiceNumberOLD)
				CREATE SET:C116([PURCHASE_INVOICE_ALLOCATIONS:159]; "$DupSet")
				$_l_RecordsCount:=Records in selection:C76([PURCHASE_INVOICE_ALLOCATIONS:159])
				For ($_l_PurchInvoiceAllocIndex; 1; $_l_RecordsCount)
					USE SET:C118("$DUpSet")
					GOTO SELECTED RECORD:C245([PURCHASE_INVOICE_ALLOCATIONS:159]; $_l_PurchInvoiceAllocIndex)
					DUPLICATE RECORD:C225([PURCHASE_INVOICE_ALLOCATIONS:159])
					//we can refund the total amount of this
					[PURCHASE_INVOICE_ALLOCATIONS:159]ID:5:=AA_GetNextID(->[PURCHASE_INVOICE_ALLOCATIONS:159]ID:5)
					[PURCHASE_INVOICE_ALLOCATIONS:159]PURCHASES_INVOICE_CODE:6:=[PURCHASE_INVOICES:37]Purchase_Code:1
					[PURCHASE_INVOICE_ALLOCATIONS:159]Amount:2:=-[PURCHASE_INVOICE_ALLOCATIONS:159]Amount:2
					[PURCHASE_INVOICE_ALLOCATIONS:159]Date:3:=[PURCHASE_INVOICES:37]Invoice_Date:5
					DB_SaveRecord(->[PURCHASE_INVOICE_ALLOCATIONS:159])
					NEXT RECORD:C51([PURCHASE_INVOICE_ALLOCATIONS:159])
				End for 
				[PURCHASE_INVOICES:37]Total_Paid:8:=-[PURCHASE_INVOICES:37]Total_Paid:8
				[PURCHASE_INVOICES:37]Total_Due:9:=-[PURCHASE_INVOICES:37]Total_Due:9
				$_t_PeriodPosting:=[PURCHASE_INVOICES:37]Period_Code:3
				DB_SaveRecord(->[PURCHASE_INVOICES:37])
				
				$_bo_DepositReconcile:=False:C215
				
				For ($_l_PurchInvoiceAllocIndex; 1; Size of array:C274($_ar_AllocationAmounts))
					
					
					
					
					$_t_OtherSide:=$_at_AllocationPurchaseNumbers{$_l_PurchInvoiceAllocIndex}
					
					QUERY:C277([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Purchase_Code:1=$_t_OtherSide)
					If (Not:C34(Check_Locked(->[PURCHASE_INVOICES:37]; 1)))
						Gen_Alert("Purchase"+" "+[PURCHASE_INVOICES:37]Purchase_Code:1+" is locked by another user.  The payment cannot be Reversed."; "Cancel")
						$_bo_Cancel:=True:C214
					Else 
						If (Records in selection:C76([PURCHASE_INVOICES:37])>0)
							$_bo_OK2:=False:C215
							QUERY:C277([PURCHASE_INVOICE_ALLOCATIONS:159]; [PURCHASE_INVOICE_ALLOCATIONS:159]PURCHASES_INVOICE_CODE:6=[PURCHASE_INVOICES:37]Purchase_Code:1)
							
							For ($_l_PurchInvoiceAllocIndex2; 1; Records in selection:C76([PURCHASE_INVOICE_ALLOCATIONS:159]))
								If ([PURCHASE_INVOICE_ALLOCATIONS:159]Purchase_Code:1=$_t_PurchaseNumber)
									$_bo_OK2:=True:C214
									$_r_Amount:=-[PURCHASE_INVOICE_ALLOCATIONS:159]Amount:2
									$_l_PurchInvoiceAllocIndex2:=99999
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
								$_r_TotalDue:=PUR_SetDueAmount
								QUERY:C277([PURCHASE_INVOICE_ALLOCATIONS:159]; [PURCHASE_INVOICE_ALLOCATIONS:159]PURCHASES_INVOICE_CODE:6=[PURCHASE_INVOICES:37]Purchase_Code:1)
								
								[PURCHASE_INVOICES:37]Total_Paid:8:=Sum:C1([PURCHASE_INVOICE_ALLOCATIONS:159]Amount:2)
								[PURCHASE_INVOICES:37]Total_Due:9:=$_r_TotalDue
								
								If ([PURCHASE_INVOICES:37]Purchase_Code:1="*S@")
									
									If ([PURCHASE_INVOICES:37]Total_Paid:8=0)
										$_t_TotalPaid:=Gen_Request("How much should this payment be?"; "0.00")
										[PURCHASE_INVOICES:37]Total_Paid:8:=Num:C11($_t_TotalPaid)
									End if 
									
								Else 
									[PURCHASE_INVOICES:37]Total_Paid:8:=Sum:C1([PURCHASE_INVOICE_ALLOCATIONS:159]Amount:2)
									[PURCHASE_INVOICES:37]Total_Due:9:=$_r_TotalDue
									
									
								End if 
								DB_SaveRecord(->[PURCHASE_INVOICES:37])
								
								
								//and now reverse the posting
								Case of 
									: ([PURCHASE_INVOICES:37]Purchase_Code:1="*S@")
										$_bo_DepositReconcile:=True:C214
										$_t_DepositReference:=[PURCHASE_INVOICES:37]Purchase_Code:1
										
										QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1=DB_GetLedgerTRANSPREpost; *)
										QUERY:C277([TRANSACTION_BATCH_ITEMS:155];  & ; [TRANSACTION_BATCH_ITEMS:155]Amount:6=Gen_Round($_r_Amount; 2; 2); *)
										QUERY:C277([TRANSACTION_BATCH_ITEMS:155];  & ; [TRANSACTION_BATCH_ITEMS:155]Purchase_Invoice_Code:22=[PURCHASE_INVOICES:37]Purchase_Code:1)
										SELECTION TO ARRAY:C260([TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31; $_al_TransBatchCodes)
										QUERY WITH ARRAY:C644([TRANSACTION_BATCHES:30]Batch_Number:10; $_al_TransBatchCodes)
										
										If (Records in selection:C76([TRANSACTION_BATCHES:30])>0)
											//this is the batch
											$_l_BatchNumberRow:=Find in array:C230($_al_BatchNumbers; [TRANSACTION_BATCHES:30]Batch_Number:10)
											If ($_l_BatchNumberRow<0)
												INSERT IN ARRAY:C227($_al_BatchNumbers; Size of array:C274($_al_BatchNumbers)+1; 1)
												$_al_BatchNumbers{Size of array:C274($_al_BatchNumbers)}:=[TRANSACTION_BATCHES:30]Batch_Number:10
											End if 
											QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTION_BATCHES:30]Batch_Number:10)
											FIRST RECORD:C50([TRANSACTION_BATCH_ITEMS:155])
											$_bo_FindMultiInvoice:=False:C215
											For ($_l_BatchItemIndex; 1; Records in selection:C76([TRANSACTION_BATCH_ITEMS:155]))
												If ([TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1=DB_GetLedgerTRANSPREpost) & ([TRANSACTION_BATCH_ITEMS:155]Amount:6=Gen_Round($_r_Amount; 2; 2)) & ([TRANSACTION_BATCH_ITEMS:155]Purchase_Invoice_Code:22=[PURCHASE_INVOICES:37]Purchase_Code:1)
													
													//This is the item we want to reverse in a new batch
													
													$_l_InsertionPoint:=Size of array:C274($_ar_BatchItemAmount)+1
													INSERT IN ARRAY:C227($_ar_BatchItemAmount; $_l_InsertionPoint; 1)
													INSERT IN ARRAY:C227($_at_BatchItemAnalysis; $_l_InsertionPoint; 1)
													INSERT IN ARRAY:C227($_at_BatchItemCoCode; $_l_InsertionPoint; 1)
													INSERT IN ARRAY:C227($_at_BatchItemCreditAcc; $_l_InsertionPoint; 1)
													INSERT IN ARRAY:C227($_at_BatchItemcreditIO; $_l_InsertionPoint; 1)
													INSERT IN ARRAY:C227($_at_BatchItemCurrCode; $_l_InsertionPoint; 1)
													INSERT IN ARRAY:C227($_at_BatchItemDebitAcc; $_l_InsertionPoint; 1)
													INSERT IN ARRAY:C227($_at_BatchItemdebitIO; $_l_InsertionPoint; 1)
													INSERT IN ARRAY:C227($_at_BatchItemInvoiceNo; $_l_InsertionPoint; 1)
													INSERT IN ARRAY:C227($_at_BatchItemJobCode; $_l_InsertionPoint; 1)
													INSERT IN ARRAY:C227($_at_BatchItemLayerCode; $_l_InsertionPoint; 1)
													INSERT IN ARRAY:C227($_at_BatchItemPurchInvno; $_l_InsertionPoint; 1)
													INSERT IN ARRAY:C227($_at_BatchItemPurchaseCode; $_l_InsertionPoint; 1)
													INSERT IN ARRAY:C227($_ar_BatchItemSecondAmt; $_l_InsertionPoint; 1)
													INSERT IN ARRAY:C227($_ar_BatchItemTaxAmount; $_l_InsertionPoint; 1)
													INSERT IN ARRAY:C227($_at_BatchItemTaxCode; $_l_InsertionPoint; 1)
													INSERT IN ARRAY:C227($_ar_BatchItemTotal; $_l_InsertionPoint; 1)
													INSERT IN ARRAY:C227($_at_Batchitemtranscode; $_l_InsertionPoint; 1)
													INSERT IN ARRAY:C227($_at_BatchItemUKEC; $_l_InsertionPoint; 1)
													$_ar_BatchItemAmount{$_l_InsertionPoint}:=[TRANSACTION_BATCH_ITEMS:155]Amount:6
													$_at_BatchItemAnalysis{$_l_InsertionPoint}:=[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2
													$_at_BatchItemCoCode{$_l_InsertionPoint}:=[TRANSACTION_BATCH_ITEMS:155]Company_Code:13
													$_at_BatchItemCreditAcc{$_l_InsertionPoint}:=[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12
													$_at_BatchItemcreditIO{$_l_InsertionPoint}:=[TRANSACTION_BATCH_ITEMS:155]Credit_IO:16
													$_at_BatchItemCurrCode{$_l_InsertionPoint}:=[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19
													$_at_BatchItemDebitAcc{$_l_InsertionPoint}:=[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3
													$_at_BatchItemdebitIO{$_l_InsertionPoint}:=[TRANSACTION_BATCH_ITEMS:155]Debit_IO:15
													$_at_BatchItemInvoiceNo{$_l_InsertionPoint}:=[TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4
													$_at_BatchItemJobCode{$_l_InsertionPoint}:=[TRANSACTION_BATCH_ITEMS:155]Job_Code:23
													$_at_BatchItemLayerCode{$_l_InsertionPoint}:=[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20
													
													$_at_BatchItemPurchInvno{$_l_InsertionPoint}:=[TRANSACTION_BATCH_ITEMS:155]Purchase_invoice_Number:17
													$_at_BatchItemPurchaseCode{$_l_InsertionPoint}:=[TRANSACTION_BATCH_ITEMS:155]Purchase_Invoice_Code:22
													$_ar_BatchItemSecondAmt{$_l_InsertionPoint}:=[TRANSACTION_BATCH_ITEMS:155]Second_Amount:21
													$_ar_BatchItemTaxAmount{$_l_InsertionPoint}:=[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8
													$_at_BatchItemTaxCode{$_l_InsertionPoint}:=[TRANSACTION_BATCH_ITEMS:155]Tax_Code:7
													$_ar_BatchItemTotal{$_l_InsertionPoint}:=[TRANSACTION_BATCH_ITEMS:155]Total:9
													$_at_Batchitemtranscode{$_l_InsertionPoint}:=[TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1
													$_at_BatchItemUKEC{$_l_InsertionPoint}:=[TRANSACTION_BATCH_ITEMS:155]UK_EC:18
													//if this posting was single sided need to update the other side correctly
													If ([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3#"") & ([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12#"")
														$_l_BatchItemIndex:=Records in selection:C76([TRANSACTION_BATCH_ITEMS:155])  //Break out
													Else 
														$_bo_FindMultiInvoice:=True:C214
														$_l_CurrentRow:=$_l_InsertionPoint
													End if 
												End if 
												NEXT RECORD:C51([TRANSACTION_BATCH_ITEMS:155])
											End for 
											
											If ($_bo_FindMultiInvoice)
												FIRST RECORD:C50([TRANSACTION_BATCH_ITEMS:155])
												//the posting was a multi invoice posting...so need to find the other side to get the correct account to reverse
												For ($_l_BatchItemIndex; 1; Records in selection:C76([TRANSACTION_BATCH_ITEMS:155]))
													If ([TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1=DB_GetLedgerTRANSPREpost) & ([TRANSACTION_BATCH_ITEMS:155]Description:10="Multiple Purchases_Payment") & ([TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2=$_at_BatchItemAnalysis{$_l_CurrentRow}) & (Abs:C99([TRANSACTION_BATCH_ITEMS:155]Total:9)>=Abs:C99($_ar_BatchItemTotal{$_l_CurrentRow}))
														//This is theother side of  item we want to reverse in a new batch
														
														$_l_InsertionPoint:=Size of array:C274($_ar_BatchItemAmount)+1
														INSERT IN ARRAY:C227($_ar_BatchItemAmount; $_l_InsertionPoint; 1)
														INSERT IN ARRAY:C227($_at_BatchItemAnalysis; $_l_InsertionPoint; 1)
														INSERT IN ARRAY:C227($_at_BatchItemCoCode; $_l_InsertionPoint; 1)
														INSERT IN ARRAY:C227($_at_BatchItemCreditAcc; $_l_InsertionPoint; 1)
														INSERT IN ARRAY:C227($_at_BatchItemcreditIO; $_l_InsertionPoint; 1)
														INSERT IN ARRAY:C227($_at_BatchItemCurrCode; $_l_InsertionPoint; 1)
														INSERT IN ARRAY:C227($_at_BatchItemDebitAcc; $_l_InsertionPoint; 1)
														INSERT IN ARRAY:C227($_at_BatchItemdebitIO; $_l_InsertionPoint; 1)
														
														INSERT IN ARRAY:C227($_at_BatchItemInvoiceNo; $_l_InsertionPoint; 1)
														INSERT IN ARRAY:C227($_at_BatchItemJobCode; $_l_InsertionPoint; 1)
														INSERT IN ARRAY:C227($_at_BatchItemLayerCode; $_l_InsertionPoint; 1)
														INSERT IN ARRAY:C227($_at_BatchItemPurchInvno; $_l_InsertionPoint; 1)
														INSERT IN ARRAY:C227($_at_BatchItemPurchaseCode; $_l_InsertionPoint; 1)
														INSERT IN ARRAY:C227($_ar_BatchItemSecondAmt; $_l_InsertionPoint; 1)
														INSERT IN ARRAY:C227($_ar_BatchItemTaxAmount; $_l_InsertionPoint; 1)
														INSERT IN ARRAY:C227($_at_BatchItemTaxCode; $_l_InsertionPoint; 1)
														INSERT IN ARRAY:C227($_ar_BatchItemTotal; $_l_InsertionPoint; 1)
														INSERT IN ARRAY:C227($_at_Batchitemtranscode; $_l_InsertionPoint; 1)
														INSERT IN ARRAY:C227($_at_BatchItemUKEC; $_l_InsertionPoint; 1)
														$_ar_BatchItemAmount{$_l_InsertionPoint}:=($_ar_BatchItemAmount{$_l_CurrentRow})
														$_at_BatchItemAnalysis{$_l_InsertionPoint}:=[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2
														$_at_BatchItemCoCode{$_l_InsertionPoint}:=[TRANSACTION_BATCH_ITEMS:155]Company_Code:13
														$_at_BatchItemCreditAcc{$_l_InsertionPoint}:=[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12
														$_at_BatchItemcreditIO{$_l_InsertionPoint}:=[TRANSACTION_BATCH_ITEMS:155]Credit_IO:16
														$_at_BatchItemCurrCode{$_l_InsertionPoint}:=[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19
														$_at_BatchItemDebitAcc{$_l_InsertionPoint}:=[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3
														$_at_BatchItemdebitIO{$_l_InsertionPoint}:=[TRANSACTION_BATCH_ITEMS:155]Debit_IO:15
														
														$_at_BatchItemInvoiceNo{$_l_InsertionPoint}:=[TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4
														$_at_BatchItemJobCode{$_l_InsertionPoint}:=[TRANSACTION_BATCH_ITEMS:155]Job_Code:23
														$_at_BatchItemLayerCode{$_l_InsertionPoint}:=[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20
														
														$_at_BatchItemPurchInvno{$_l_InsertionPoint}:=[TRANSACTION_BATCH_ITEMS:155]Purchase_invoice_Number:17
														$_at_BatchItemPurchaseCode{$_l_InsertionPoint}:=[TRANSACTION_BATCH_ITEMS:155]Purchase_Invoice_Code:22
														If ([TRANSACTION_BATCH_ITEMS:155]Second_Amount:21#0)
															$_ar_BatchItemSecondAmt{$_l_InsertionPoint}:=-($_ar_BatchItemSecondAmt{$_l_CurrentRow})
														End if 
														If ([TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8#0)
															$_ar_BatchItemTaxAmount{$_l_InsertionPoint}:=-($_ar_BatchItemTaxAmount{$_l_CurrentRow})
														End if 
														$_at_BatchItemTaxCode{$_l_InsertionPoint}:=[TRANSACTION_BATCH_ITEMS:155]Tax_Code:7
														
														$_ar_BatchItemTotal{$_l_InsertionPoint}:=-($_ar_BatchItemTotal{$_l_InsertionPoint})
														$_at_Batchitemtranscode{$_l_InsertionPoint}:=[TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1
														$_at_BatchItemUKEC{$_l_InsertionPoint}:=[TRANSACTION_BATCH_ITEMS:155]UK_EC:18
														//if this posting was single sided need to update the other side correctly
														
														$_l_BatchItemIndex:=Records in selection:C76([TRANSACTION_BATCH_ITEMS:155])  //Break out
														
														
														
													End if 
													NEXT RECORD:C51([TRANSACTION_BATCH_ITEMS:155])
												End for 
												
											End if 
											
										Else 
											Gen_Alert("The original purchase did not refer to this payment, the reversal is cancelled, there is no Trans in payment record for "+[PURCHASE_INVOICES:37]Purchase_Code:1)
											$_bo_Cancel:=True:C214
											
										End if 
									Else 
										//TRACE
										If (Not:C34($_bo_DepositReconcile))
											
											QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1=DB_GetLedgerTRANSPurINVPay)
											QUERY SELECTION:C341([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Amount:6=Gen_Round(-$_r_Amount; 2; 2))
											QUERY SELECTION:C341([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Description:10="Purchase "+[PURCHASE_INVOICES:37]Purchase_Invoice_Number:4+" Payment")
											SELECTION TO ARRAY:C260([TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31; $_al_TransBatchCodes)
											QUERY WITH ARRAY:C644([TRANSACTION_BATCHES:30]Batch_Number:10; $_al_TransBatchCodes)
											
											If (Records in selection:C76([TRANSACTION_BATCHES:30])>0)
												FIRST RECORD:C50([TRANSACTION_BATCHES:30])
												For ($_l_BatchIndex; 1; Records in selection:C76([TRANSACTION_BATCHES:30]))
													
													//this is the batch
													QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTION_BATCHES:30]Batch_Number:10)
													FIRST RECORD:C50([TRANSACTION_BATCH_ITEMS:155])
													$_bo_FindMultiInvoice:=False:C215
													//Gen_Alert ("Creating a reverse batch")
													
													For ($_l_BatchItemIndex; 1; Records in selection:C76([TRANSACTION_BATCH_ITEMS:155]))
														If ([TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1=DB_GetLedgerTRANSPurINVPay) & ([TRANSACTION_BATCH_ITEMS:155]Amount:6=Gen_Round(-$_r_Amount; 2; 2)) & ([TRANSACTION_BATCH_ITEMS:155]Description:10=("Purchase "+[PURCHASE_INVOICES:37]Purchase_Invoice_Number:4+" Payment"))
															//This is the item we want to reverse in a new batch
															$_l_BatchNumberRow:=Find in array:C230($_al_BatchNumbers; [TRANSACTION_BATCHES:30]Batch_Number:10)
															If ($_l_BatchNumberRow<0)
																INSERT IN ARRAY:C227($_al_BatchNumbers; Size of array:C274($_al_BatchNumbers)+1; 1)
																$_al_BatchNumbers{Size of array:C274($_al_BatchNumbers)}:=[TRANSACTION_BATCHES:30]Batch_Number:10
															End if 
															
															$_l_InsertionPoint:=Size of array:C274($_ar_BatchItemAmount)+1
															INSERT IN ARRAY:C227($_ar_BatchItemAmount; $_l_InsertionPoint; 1)
															INSERT IN ARRAY:C227($_at_BatchItemAnalysis; $_l_InsertionPoint; 1)
															INSERT IN ARRAY:C227($_at_BatchItemCoCode; $_l_InsertionPoint; 1)
															INSERT IN ARRAY:C227($_at_BatchItemCreditAcc; $_l_InsertionPoint; 1)
															INSERT IN ARRAY:C227($_at_BatchItemcreditIO; $_l_InsertionPoint; 1)
															INSERT IN ARRAY:C227($_at_BatchItemCurrCode; $_l_InsertionPoint; 1)
															INSERT IN ARRAY:C227($_at_BatchItemDebitAcc; $_l_InsertionPoint; 1)
															INSERT IN ARRAY:C227($_at_BatchItemdebitIO; $_l_InsertionPoint; 1)
															
															INSERT IN ARRAY:C227($_at_BatchItemInvoiceNo; $_l_InsertionPoint; 1)
															INSERT IN ARRAY:C227($_at_BatchItemJobCode; $_l_InsertionPoint; 1)
															INSERT IN ARRAY:C227($_at_BatchItemLayerCode; $_l_InsertionPoint; 1)
															INSERT IN ARRAY:C227($_at_BatchItemPurchInvno; $_l_InsertionPoint; 1)
															INSERT IN ARRAY:C227($_at_BatchItemPurchaseCode; $_l_InsertionPoint; 1)
															INSERT IN ARRAY:C227($_ar_BatchItemSecondAmt; $_l_InsertionPoint; 1)
															INSERT IN ARRAY:C227($_ar_BatchItemTaxAmount; $_l_InsertionPoint; 1)
															INSERT IN ARRAY:C227($_at_BatchItemTaxCode; $_l_InsertionPoint; 1)
															INSERT IN ARRAY:C227($_ar_BatchItemTotal; $_l_InsertionPoint; 1)
															INSERT IN ARRAY:C227($_at_Batchitemtranscode; $_l_InsertionPoint; 1)
															INSERT IN ARRAY:C227($_at_BatchItemUKEC; $_l_InsertionPoint; 1)
															$_ar_BatchItemAmount{$_l_InsertionPoint}:=[TRANSACTION_BATCH_ITEMS:155]Amount:6
															$_at_BatchItemAnalysis{$_l_InsertionPoint}:=[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2
															$_at_BatchItemCoCode{$_l_InsertionPoint}:=[TRANSACTION_BATCH_ITEMS:155]Company_Code:13
															$_at_BatchItemCreditAcc{$_l_InsertionPoint}:=[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12
															$_at_BatchItemcreditIO{$_l_InsertionPoint}:=[TRANSACTION_BATCH_ITEMS:155]Credit_IO:16
															$_at_BatchItemCurrCode{$_l_InsertionPoint}:=[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19
															$_at_BatchItemDebitAcc{$_l_InsertionPoint}:=[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3
															$_at_BatchItemdebitIO{$_l_InsertionPoint}:=[TRANSACTION_BATCH_ITEMS:155]Debit_IO:15
															$_at_BatchItemInvoiceNo{$_l_InsertionPoint}:=[TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4
															$_at_BatchItemJobCode{$_l_InsertionPoint}:=[TRANSACTION_BATCH_ITEMS:155]Job_Code:23
															$_at_BatchItemLayerCode{$_l_InsertionPoint}:=[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20
															
															$_at_BatchItemPurchInvno{$_l_InsertionPoint}:=[TRANSACTION_BATCH_ITEMS:155]Purchase_invoice_Number:17
															$_at_BatchItemPurchaseCode{$_l_InsertionPoint}:=[TRANSACTION_BATCH_ITEMS:155]Purchase_Invoice_Code:22
															$_ar_BatchItemSecondAmt{$_l_InsertionPoint}:=[TRANSACTION_BATCH_ITEMS:155]Second_Amount:21
															$_ar_BatchItemTaxAmount{$_l_InsertionPoint}:=[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8
															$_at_BatchItemTaxCode{$_l_InsertionPoint}:=[TRANSACTION_BATCH_ITEMS:155]Tax_Code:7
															$_ar_BatchItemTotal{$_l_InsertionPoint}:=[TRANSACTION_BATCH_ITEMS:155]Total:9
															$_at_Batchitemtranscode{$_l_InsertionPoint}:=[TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1
															$_at_BatchItemUKEC{$_l_InsertionPoint}:=[TRANSACTION_BATCH_ITEMS:155]UK_EC:18
															//if this posting was single sided need to update the other side correctly
															If ([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3#"") & ([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12#"")
																$_l_BatchItemIndex:=Records in selection:C76([TRANSACTION_BATCH_ITEMS:155])  //Break out
															Else 
																$_bo_FindMultiInvoice:=True:C214
																$_l_CurrentRow:=$_l_InsertionPoint
															End if 
														End if 
														NEXT RECORD:C51([TRANSACTION_BATCH_ITEMS:155])
													End for 
													If ($_bo_FindMultiInvoice)
														FIRST RECORD:C50([TRANSACTION_BATCH_ITEMS:155])
														//the posting was a multi invoice posting...so need to find the other side to get the correct account to reverse
														For ($_l_BatchItemIndex; 1; Records in selection:C76([TRANSACTION_BATCH_ITEMS:155]))
															If ([TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1=DB_GetLedgerTRANSPurINVPay) & ([TRANSACTION_BATCH_ITEMS:155]Description:10="Multiple Purchases_Payment") & ([TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2=$_at_BatchItemAnalysis{$_l_CurrentRow}) & (Abs:C99([TRANSACTION_BATCH_ITEMS:155]Total:9)>=Abs:C99($_ar_BatchItemTotal{$_l_CurrentRow}))
																//This is theother side of  item we want to reverse in a new batch
																$_l_BatchNumberRow:=Find in array:C230($_al_BatchNumbers; [TRANSACTION_BATCHES:30]Batch_Number:10)
																If ($_l_BatchNumberRow<0)
																	INSERT IN ARRAY:C227($_al_BatchNumbers; Size of array:C274($_al_BatchNumbers)+1; 1)
																	$_al_BatchNumbers{Size of array:C274($_al_BatchNumbers)}:=[TRANSACTION_BATCHES:30]Batch_Number:10
																End if 
																
																$_l_InsertionPoint:=Size of array:C274($_ar_BatchItemAmount)+1
																INSERT IN ARRAY:C227($_ar_BatchItemAmount; $_l_InsertionPoint; 1)
																INSERT IN ARRAY:C227($_at_BatchItemAnalysis; $_l_InsertionPoint; 1)
																INSERT IN ARRAY:C227($_at_BatchItemCoCode; $_l_InsertionPoint; 1)
																INSERT IN ARRAY:C227($_at_BatchItemCreditAcc; $_l_InsertionPoint; 1)
																INSERT IN ARRAY:C227($_at_BatchItemcreditIO; $_l_InsertionPoint; 1)
																INSERT IN ARRAY:C227($_at_BatchItemCurrCode; $_l_InsertionPoint; 1)
																INSERT IN ARRAY:C227($_at_BatchItemDebitAcc; $_l_InsertionPoint; 1)
																INSERT IN ARRAY:C227($_at_BatchItemdebitIO; $_l_InsertionPoint; 1)
																
																INSERT IN ARRAY:C227($_at_BatchItemInvoiceNo; $_l_InsertionPoint; 1)
																INSERT IN ARRAY:C227($_at_BatchItemJobCode; $_l_InsertionPoint; 1)
																INSERT IN ARRAY:C227($_at_BatchItemLayerCode; $_l_InsertionPoint; 1)
																INSERT IN ARRAY:C227($_at_BatchItemPurchInvno; $_l_InsertionPoint; 1)
																INSERT IN ARRAY:C227($_at_BatchItemPurchaseCode; $_l_InsertionPoint; 1)
																INSERT IN ARRAY:C227($_ar_BatchItemSecondAmt; $_l_InsertionPoint; 1)
																INSERT IN ARRAY:C227($_ar_BatchItemTaxAmount; $_l_InsertionPoint; 1)
																INSERT IN ARRAY:C227($_at_BatchItemTaxCode; $_l_InsertionPoint; 1)
																INSERT IN ARRAY:C227($_ar_BatchItemTotal; $_l_InsertionPoint; 1)
																INSERT IN ARRAY:C227($_at_Batchitemtranscode; $_l_InsertionPoint; 1)
																INSERT IN ARRAY:C227($_at_BatchItemUKEC; $_l_InsertionPoint; 1)
																$_ar_BatchItemAmount{$_l_InsertionPoint}:=($_ar_BatchItemAmount{$_l_CurrentRow})
																$_at_BatchItemAnalysis{$_l_InsertionPoint}:=[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2
																$_at_BatchItemCoCode{$_l_InsertionPoint}:=[TRANSACTION_BATCH_ITEMS:155]Company_Code:13
																$_at_BatchItemCreditAcc{$_l_InsertionPoint}:=[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12
																$_at_BatchItemcreditIO{$_l_InsertionPoint}:=[TRANSACTION_BATCH_ITEMS:155]Credit_IO:16
																$_at_BatchItemCurrCode{$_l_InsertionPoint}:=[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19
																$_at_BatchItemDebitAcc{$_l_InsertionPoint}:=[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3
																$_at_BatchItemdebitIO{$_l_InsertionPoint}:=[TRANSACTION_BATCH_ITEMS:155]Debit_IO:15
																$_at_BatchItemInvoiceNo{$_l_InsertionPoint}:=[TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4
																$_at_BatchItemJobCode{$_l_InsertionPoint}:=[TRANSACTION_BATCH_ITEMS:155]Job_Code:23
																$_at_BatchItemLayerCode{$_l_InsertionPoint}:=[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20
																
																$_at_BatchItemPurchInvno{$_l_InsertionPoint}:=[TRANSACTION_BATCH_ITEMS:155]Purchase_invoice_Number:17
																$_at_BatchItemPurchaseCode{$_l_InsertionPoint}:=[TRANSACTION_BATCH_ITEMS:155]Purchase_Invoice_Code:22
																If ([TRANSACTION_BATCH_ITEMS:155]Second_Amount:21#0)
																	$_ar_BatchItemSecondAmt{$_l_InsertionPoint}:=-($_ar_BatchItemSecondAmt{$_l_CurrentRow})
																End if 
																If ([TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8#0)
																	$_ar_BatchItemTaxAmount{$_l_InsertionPoint}:=-($_ar_BatchItemTaxAmount{$_l_CurrentRow})
																End if 
																$_at_BatchItemTaxCode{$_l_InsertionPoint}:=[TRANSACTION_BATCH_ITEMS:155]Tax_Code:7
																
																$_ar_BatchItemTotal{$_l_InsertionPoint}:=-($_ar_BatchItemTotal{$_l_InsertionPoint})
																$_at_Batchitemtranscode{$_l_InsertionPoint}:=[TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1
																$_at_BatchItemUKEC{$_l_InsertionPoint}:=[TRANSACTION_BATCH_ITEMS:155]UK_EC:18
																//if this posting was single sided need to update the other side correctly
																
																$_l_BatchItemIndex:=Records in selection:C76([TRANSACTION_BATCH_ITEMS:155])  //Break out
																
																
																
															End if 
															NEXT RECORD:C51([TRANSACTION_BATCH_ITEMS:155])
														End for 
														
													End if 
													NEXT RECORD:C51([TRANSACTION_BATCHES:30])
													
												End for 
												
											Else 
												Gen_Alert("The original Purchase did not refer to this payment, the reversal is cancelled, there is no trans in(batch) record of type purchase payment for the correct amount refering to receipt "+[PURCHASE_INVOICES:37]Purchase_Code:1)
												
												$_bo_Cancel:=True:C214
												
											End if 
										End if 
								End case 
							Else 
								Gen_Alert("The original purchase did not refer to this payment, the reversal is cancelled.  There is no allocation record for "+[PURCHASE_INVOICES:37]Purchase_Code:1)
								
								
								//the original invoice is missing
								$_bo_Cancel:=True:C214
							End if 
						Else 
							Gen_Alert("The original Purchase invoice is missing, the reversal is cancelled")
							
							//the original invoice is missing
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
						If (Size of array:C274($_ar_BatchItemAmount)>1)
							$_bo_SingleSided:=True:C214
							//The single sides are stored in the array too...including the amounts-but not rolled up not the amounts of them
							//so here before we start just try to roll them up
							For ($_l_RollupIndex; 1; Size of array:C274($_ar_BatchItemAmount))
								$_t_AnalysisCode:=$_at_BatchItemAnalysis{$_l_RollupIndex}
								$_t_CompanyCode:=$_at_BatchItemCoCode{$_l_RollupIndex}
								$_t_CreditAccount:=$_at_BatchItemCreditAcc{$_l_RollupIndex}
								$_t_CreditIO:=$_at_BatchItemcreditIO{$_l_RollupIndex}
								$_t_CurrencyCode:=$_at_BatchItemCurrCode{$_l_RollupIndex}
								$_t_DebitAccount:=$_at_BatchItemDebitAcc{$_l_RollupIndex}
								$_t_DebitIO:=$_at_BatchItemdebitIO{$_l_RollupIndex}
								$_t_InvoiceNumber:=$_at_BatchItemInvoiceNo{$_l_RollupIndex}
								$_t_JobCode:=$_at_BatchItemJobCode{$_l_RollupIndex}
								$_t_LayerCode:=$_at_BatchItemLayerCode{$_l_RollupIndex}
								$_t_PurchaseInvoiceNo:=$_at_BatchItemPurchInvno{$_l_RollupIndex}
								$_t_PurchaseCode:=$_at_BatchItemPurchaseCode{$_l_RollupIndex}
								$_t_TransactionCode:=$_at_Batchitemtranscode{$_l_RollupIndex}
								$_t_UKEC:=$_at_BatchItemUKEC{$_l_RollupIndex}
								For ($_l_RollupIndex2; $_l_RollupIndex+1; Size of array:C274($_ar_BatchItemAmount))
									If ($_t_AnalysisCode=$_at_BatchItemAnalysis{$_l_RollupIndex2}) & ($_t_CreditAccount=$_at_BatchItemCreditAcc{$_l_RollupIndex2}) & ($_t_CreditIO=$_at_BatchItemcreditIO{$_l_RollupIndex2}) & ($_t_CurrencyCode=$_at_BatchItemCurrCode{$_l_RollupIndex2}) & ($_t_DebitAccount=$_at_BatchItemDebitAcc{$_l_RollupIndex2}) & ($_t_DebitIO=$_at_BatchItemdebitIO{$_l_RollupIndex2}) & ($_t_InvoiceNumber=$_at_BatchItemInvoiceNo{$_l_RollupIndex2}) & ($_t_JobCode=$_at_BatchItemJobCode{$_l_RollupIndex2}) & ($_t_LayerCode=$_at_BatchItemLayerCode{$_l_RollupIndex2}) & ($_t_PurchaseInvoiceNo=$_at_BatchItemPurchInvno{$_l_RollupIndex2}) & ($_t_PurchaseCode=$_at_BatchItemPurchaseCode{$_l_RollupIndex2}) & ($_t_TransactionCode=$_at_Batchitemtranscode{$_l_RollupIndex2}) & ($_t_UKEC=$_at_BatchItemUKEC{$_l_RollupIndex2})
										
										//can roll together
										$_ar_BatchItemAmount{$_l_RollupIndex2}:=$_ar_BatchItemAmount{$_l_RollupIndex}+$_ar_BatchItemAmount{$_l_RollupIndex2}
										$_ar_BatchItemSecondAmt{$_l_RollupIndex2}:=$_ar_BatchItemSecondAmt{$_l_RollupIndex}+$_ar_BatchItemSecondAmt{$_l_RollupIndex2}
										$_ar_BatchItemTaxAmount{$_l_RollupIndex2}:=$_ar_BatchItemTaxAmount{$_l_RollupIndex}+$_ar_BatchItemTaxAmount{$_l_RollupIndex2}
										$_ar_BatchItemTotal{$_l_RollupIndex2}:=$_ar_BatchItemTotal{$_l_RollupIndex}+$_ar_BatchItemTotal{$_l_RollupIndex2}
										//and clear the now not needed line
										$_at_BatchItemAnalysis{$_l_RollupIndex}:=""
										$_at_BatchItemCoCode{$_l_RollupIndex}:=""
										$_at_BatchItemCreditAcc{$_l_RollupIndex}:=""
										$_at_BatchItemcreditIO{$_l_RollupIndex}:=""
										$_at_BatchItemCurrCode{$_l_RollupIndex}:=""
										$_at_BatchItemDebitAcc{$_l_RollupIndex}:=""
										$_at_BatchItemdebitIO{$_l_RollupIndex}:=""
										$_at_BatchItemInvoiceNo{$_l_RollupIndex}:=""
										$_at_BatchItemJobCode{$_l_RollupIndex}:=""
										$_at_BatchItemLayerCode{$_l_RollupIndex}:=""
										$_at_BatchItemPurchInvno{$_l_RollupIndex}:=""
										$_at_BatchItemPurchaseCode{$_l_RollupIndex}:=""
										$_at_Batchitemtranscode{$_l_RollupIndex}:=""
										
										$_l_RollupIndex2:=Size of array:C274($_ar_BatchItemAmount)
									End if 
								End for 
								
							End for 
							$_l_BatchItemRecords:=Size of array:C274($_ar_BatchItemAmount)
							$_l_BatchItemID:=0
							$_l_BatchItemReference:=0
							$_l_BatchItemID:=(AA_GetNextID(->[TRANSACTION_BATCH_ITEMS:155]ID:30; -$_l_BatchItemRecords))-$_l_BatchItemRecords
							$_l_BatchItemReference:=(AA_GetNextIDinMethod(->DS_l_BATCHITEMRef; -$_l_BatchItemRecords))-$_l_BatchItemRecords
							For ($_l_BatchCreateIndex; 1; Size of array:C274($_ar_BatchItemAmount))
								If ($_at_BatchItemCreditAcc{$_l_BatchCreateIndex}#"") | ($_at_BatchItemDebitAcc{$_l_BatchCreateIndex}#"")
									CREATE RECORD:C68([TRANSACTION_BATCH_ITEMS:155])
									[TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31:=[TRANSACTION_BATCHES:30]Batch_Number:10
									If ($_l_BatchItemID>0)
										[TRANSACTION_BATCH_ITEMS:155]ID:30:=$_l_BatchItemID
										$_l_BatchItemID:=$_l_BatchItemID+1
									Else 
										[TRANSACTION_BATCH_ITEMS:155]ID:30:=AA_GetNextID(->[TRANSACTION_BATCH_ITEMS:155]ID:30)
									End if 
									[TRANSACTION_BATCH_ITEMS:155]Amount:6:=-($_ar_BatchItemAmount{$_l_BatchCreateIndex})
									[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2:=$_at_BatchItemAnalysis{$_l_BatchCreateIndex}
									[TRANSACTION_BATCH_ITEMS:155]Company_Code:13:=$_at_BatchItemCoCode{$_l_BatchCreateIndex}
									[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12:=$_at_BatchItemCreditAcc{$_l_BatchCreateIndex}
									[TRANSACTION_BATCH_ITEMS:155]Credit_IO:16:=$_at_BatchItemcreditIO{$_l_BatchCreateIndex}
									[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19:=$_at_BatchItemCurrCode{$_l_BatchCreateIndex}
									[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3:=$_at_BatchItemDebitAcc{$_l_BatchCreateIndex}
									[TRANSACTION_BATCH_ITEMS:155]Debit_IO:15:=$_at_BatchItemdebitIO{$_l_BatchCreateIndex}
									[TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4:=$_at_BatchItemInvoiceNo{$_l_BatchCreateIndex}
									[TRANSACTION_BATCH_ITEMS:155]Job_Code:23:=$_at_BatchItemJobCode{$_l_BatchCreateIndex}
									[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20:=$_at_BatchItemLayerCode{$_l_BatchCreateIndex}
									
									[TRANSACTION_BATCH_ITEMS:155]Purchase_invoice_Number:17:=$_at_BatchItemPurchInvno{$_l_BatchCreateIndex}
									[TRANSACTION_BATCH_ITEMS:155]Purchase_Invoice_Code:22:=$_at_BatchItemPurchaseCode{$_l_BatchCreateIndex}
									[TRANSACTION_BATCH_ITEMS:155]Second_Amount:21:=-($_ar_BatchItemSecondAmt{$_l_BatchCreateIndex})
									[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8:=-($_ar_BatchItemTaxAmount{$_l_BatchCreateIndex})
									[TRANSACTION_BATCH_ITEMS:155]Tax_Code:7:=$_at_BatchItemTaxCode{$_l_BatchCreateIndex}
									[TRANSACTION_BATCH_ITEMS:155]Total:9:=[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8+[TRANSACTION_BATCH_ITEMS:155]Amount:6
									[TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1:=$_at_Batchitemtranscode{$_l_BatchCreateIndex}
									[TRANSACTION_BATCH_ITEMS:155]UK_EC:18:=$_at_BatchItemUKEC{$_l_BatchCreateIndex}
									[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5:=Current date:C33(*)
									[TRANSACTION_BATCH_ITEMS:155]Period_Code:11:=$_t_PeriodPosting
									If ([TRANSACTION_BATCH_ITEMS:155]BatchItemID:25=0)
										If ($_l_BatchItemReference>0)
											[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=$_l_BatchItemReference
											$_l_BatchItemReference:=$_l_BatchItemReference+1
										Else 
											[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=AA_GetNextIDinMethod(->DS_l_BATCHITEMRef)
										End if 
									End if 
									DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
									
								End if 
								
							End for 
							
						Else 
							$_bo_SingleSided:=False:C215
							CREATE RECORD:C68([TRANSACTION_BATCH_ITEMS:155])
							[TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31:=[TRANSACTION_BATCHES:30]Batch_Number:10
							[TRANSACTION_BATCH_ITEMS:155]ID:30:=AA_GetNextID(->[TRANSACTION_BATCH_ITEMS:155]ID:30)
							[TRANSACTION_BATCH_ITEMS:155]Amount:6:=-($_ar_BatchItemAmount{1})
							[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2:=$_at_BatchItemAnalysis{1}
							[TRANSACTION_BATCH_ITEMS:155]Company_Code:13:=$_at_BatchItemCoCode{1}
							[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12:=$_at_BatchItemCreditAcc{1}
							[TRANSACTION_BATCH_ITEMS:155]Credit_IO:16:=$_at_BatchItemcreditIO{1}
							[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19:=$_at_BatchItemCurrCode{1}
							[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3:=$_at_BatchItemDebitAcc{1}
							[TRANSACTION_BATCH_ITEMS:155]Debit_IO:15:=$_at_BatchItemdebitIO{1}
							[TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4:=$_at_BatchItemInvoiceNo{1}
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
								
								[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=AA_GetNextIDinMethod(->DS_l_BATCHITEMRef)
							End if 
							DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
							
							
						End if 
						
					End if 
					//that is the inverse batch items created
					TransB_InLPTot
					DB_SaveRecord(->[TRANSACTION_BATCHES:30])
					
					//Gen_Alert ("Trans in Created-posting now")
					
					
					$_l_TransPostStatus:=TransactionBatch_Post
					//Gen_Alert ("Batch Posted")
					
					vAdd:=$_l_AddMode
					UNLOAD RECORD:C212([TRANSACTION_BATCHES:30])
					If ($_l_TransPostStatus>=0)
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
				//VALIDATE TRANSACTION
				Transact_End(True:C214)
			End if 
			
		End for 
	End if 
End if 

//USE SET("Master")
//SORT SELECTION([PURCHASES]Company Code;>;[PURCHASES]Invoice Date;>)
USE NAMED SELECTION:C332("$PaySel")
ERR_MethodTrackerReturn("PI_undoPayment"; $_t_oldMethodName)
