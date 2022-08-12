//%attributes = {}

If (False:C215)
	//Project Method Name:      INV_UndoSel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified:
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_BatchNumbers2; 0)
	ARRAY LONGINT:C221($_al_TransInBatchNumbers; 0)
	ARRAY REAL:C219($_ar_Amounts; 0)
	ARRAY REAL:C219($_ar_BatchItemAmount; 0)
	ARRAY REAL:C219($_ar_BatchItemSecondAmt; 0)
	ARRAY REAL:C219($_ar_BatchItemTaxAmount; 0)
	ARRAY REAL:C219($_ar_BatchItemTotal; 0)
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
	ARRAY TEXT:C222($_at_CreditNumbers; 0)
	ARRAY TEXT:C222($_at_DepositNumbers; 0)
	ARRAY TEXT:C222($_at_InvoiceNumbers; 0)
	ARRAY TEXT:C222($_at_PeriodCodes; 0)
	C_BOOLEAN:C305(<>SI_bo_AllocationValidationDisab; $_bo_Cancel; $_bo_Continue; $_bo_DepositReconcile; $_bo_FindMultiInvoice; $_bo_OK; $_bo_OK2; $_bo_SinSid; $_bo_Unlocked; $_bo_VoidTest; $1)
	C_DATE:C307(<>DB_d_CurrentDate; vDate)
	C_LONGINT:C283($_l_AddMode; $_l_AllocationsIndex; $_l_AllocationsIndex2; $_l_BatchIndex; $_l_BatchItemAmounts; $_l_BatchItemIndex2; $_l_BatchNumberRow; $_l_CreateIndex; $_l_Element; $_l_Index; $_l_NumberofAllocations)
	C_LONGINT:C283($_l_NumberofInvoices; $_l_PeriodID; $_l_Rollup; $_l_Rollup2; $_l_SizeofArray; $_l_ThisBatchItemID; $_l_ThisBatchItemReference; $_l_TimeOut; $_l_TransPostStatus; $_l_Unique; $3)
	C_LONGINT:C283(DS_l_BATCHITEMRef; INV_isUnique; Vadd)
	C_REAL:C285($_r_Amount; $_r_AmountToRefund; $2)
	C_TEXT:C284($_t_AnalysisCode; $_t_DepositReference; $_t_invoiceNumber; $_t_InvoiceNumberOLD; $_t_oldMethodName; $_t_OtherSide; $_t_PeriodCode; $_t_PeriodPosting; $_t_ReceiptNumber; $_t_RefundText; $_t_ReverseReceiptNumber)
	C_TEXT:C284($_t_ThisCac; $_t_ThisCIO; $_t_ThisCo; $_t_ThisCurCode; $_t_ThisDAC; $_t_ThisDIO; $_t_ThisInvoice; $_t_ThisJob; $_t_ThisLayer; $_t_ThisPI; $_t_ThisPO)
	C_TEXT:C284($_t_ThisTC; $_t_ThisUKEC; $_t_TotalPaid; ACC_t_CurrencyCode; vLayer; vTitle1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("INV_UndoSel")

//Invoices_Pay Select
$_bo_VoidTest:=False:C215
$_t_RefundText:="INV_UndoSel:-"

$_t_oldMethodName:=ERR_MethodTracker("INV_undoSel")

//CREATE SET("Master")
COPY NAMED SELECTION:C331([INVOICES:39]; "$PaySel")
//If (Count parameters=0)  `If the parameters are passed the current selection is used

//USE SET("Userset")

//End if
QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]State:10=-3; *)
QUERY SELECTION:C341([INVOICES:39];  & ; [INVOICES:39]X_Reversed:47=0)

DB_SaveRecord(->[INVOICES:39])


If (Records in selection:C76([INVOICES:39])>0)
	$_l_NumberofInvoices:=Records in selection:C76([INVOICES:39])
	CREATE SET:C116([INVOICES:39]; "toRefund")
	//Gen_Alert ("No of invoices is still ="+String(Records in selection([INVOICES])))
	$_bo_Continue:=True:C214
	FIRST RECORD:C50([INVOICES:39])
	While ((Not:C34(End selection:C36([INVOICES:39]))) & ($_bo_Continue))
		
		$_bo_Unlocked:=Check_Locked(->[INVOICES:39]; 1)
		If (Not:C34($_bo_Unlocked))
			Invoices_InLPTi
			Gen_Confirm(vTitle1+" "+[INVOICES:39]Invoice_Number:1+" is locked by another user.  The receipt  cannot be refunded."; "Wait"; "Stop")
			If (OK=0)
				$_bo_Unlocked:=False:C215
				$_bo_Continue:=False:C215
			Else 
				Repeat 
					$_l_TimeOut:=0
					Repeat 
						$_bo_Unlocked:=Check_Locked(->[INVOICES:39]; 1)
						If (Not:C34($_bo_Unlocked))
							$_l_TimeOut:=$_l_TimeOut+1
						End if 
						DelayTicks(60)
					Until ($_bo_Unlocked=True:C214) | ($_l_TimeOut>100)
					If (Not:C34($_bo_Unlocked))
						Gen_Confirm(vTitle1+" "+[INVOICES:39]Invoice_Number:1+" is STILL locked by another user.  The receipt still  cannot be refunded."; "Wait"; "Stop")
					End if 
					$_bo_Continue:=(OK=1)
				Until ($_bo_Unlocked=True:C214) | (Not:C34($_bo_Continue))
				
			End if 
		End if 
		If (Not:C34($_bo_Unlocked))
			//NG Change here
			Gen_Alert(vTitle1+" "+[INVOICES:39]Invoice_Number:1+" is locked by another user.  The receipt cannot be refunded."; "Cancel")
			$_bo_Continue:=False:C215
		End if 
		NEXT RECORD:C51([INVOICES:39])
	End while 
	If ($_bo_Continue)
		FIRST RECORD:C50([INVOICES:39])
		If (Count parameters:C259>=2)  //Note this can only be used where one invoice is passed to this method
			$_r_AmountToRefund:=$2
		Else 
			$_r_AmountToRefund:=[INVOICES:39]Total_Paid:6
		End if 
		
		For ($_l_Index; 1; $_l_NumberofInvoices)
			
			StartTransaction
			
			READ WRITE:C146([XInvoiceAllocation:126])
			READ WRITE:C146([TRANSACTIONS:29])
			READ WRITE:C146([TRANSACTION_BATCHES:30])
			
			USE SET:C118("ToRefund")
			GOTO SELECTED RECORD:C245([INVOICES:39]; $_l_Index)
			If ($_r_AmountToRefund>0)
				[INVOICES:39]X_Reversed:47:=1
				DB_SaveRecord(->[INVOICES:39])
				
				ACC_t_CurrencyCode:=[INVOICES:39]Currency_Code:27
				vLayer:=[INVOICES:39]Layer_Code:38
				$_t_ReceiptNumber:=[INVOICES:39]Invoice_Number:1
				//Get the allocations from the receipt
				QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xReceiptNumber:4=[INVOICES:39]Invoice_Number:1)
				
				SELECTION TO ARRAY:C260([XInvoiceAllocation:126]xAmount:7; $_ar_Amounts; [XInvoiceAllocation:126]xCreditNumber:3; $_at_CreditNumbers; [XInvoiceAllocation:126]xDepositNumber:5; $_at_DepositNumbers; [XInvoiceAllocation:126]xInvoiceNumber:2; $_at_InvoiceNumbers; [XInvoiceAllocation:126]XPeriodCode:9; $_at_PeriodCodes)
				
				//Note that a partial refund can only be done for a receipt that pays ONE invoice otherwize it become difficult to work out which invoices should have what amount of payment against them refunded
				//the partial refund control is not done in this method. The only place you can currently do a partial refund is against a CC payment
				//take care here the amount may have paid one invoice but it could have come from multiple deposits
				
				ARRAY REAL:C219($_ar_BatchItemAmount; 0)
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
				ARRAY LONGINT:C221($_al_BatchNumbers2; 0)
				ARRAY TEXT:C222($_at_Batchitemtranscode; 0)
				ARRAY TEXT:C222($_at_BatchItemUKEC; 0)
				$_bo_Cancel:=False:C215
				//Gen_Alert ("Duplicating Receipt to refund")
				
				$_t_InvoiceNumberOLD:=[INVOICES:39]Invoice_Number:1
				DUPLICATE RECORD:C225([INVOICES:39])
				
				//Gen_Alert ("Receipt Duplicated, setting receipt(refund) number")
				Repeat 
					$_t_invoiceNumber:=Substring:C12("*R"+Gen_CodePref(15; ->[INVOICES:39]Invoice_Number:1; "*R"); 1; 11)
					//Gen_Alert ("In Inv_UNDOSEL Creating "+($_t_invoiceNumber))
					SET QUERY DESTINATION:C396(3; $_l_Unique)
					QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_invoiceNumber)
					If ($_l_Unique=0)
						[INVOICES:39]Invoice_Number:1:=$_t_invoiceNumber
					End if 
					SET QUERY DESTINATION:C396(0)
				Until ($_l_Unique=0)
				
				//Gen_Alert ("receipt(refund) number set")
				
				$_t_ReverseReceiptNumber:=[INVOICES:39]Invoice_Number:1
				//Need to Check_Period code
				[INVOICES:39]Posted_Date:8:=<>DB_d_CurrentDate
				vDate:=[INVOICES:39]Invoice_Date:4
				$_l_PeriodID:=Check_Period
				$_bo_OK:=True:C214
				If ([PERIODS:33]Period_Code:1#[INVOICES:39]Period_Code:13)
					$_t_PeriodCode:=Gen_Request("Reciept is to previous period( "+[INVOICES:39]Period_Code:13+". Post to period:"; [PERIODS:33]Period_Code:1)
					If (OK=1)
						QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_t_PeriodCode)
						Check_PerCloseI
						[INVOICES:39]Period_Code:13:=[PERIODS:33]Period_Code:1
						
						$_bo_OK:=True:C214
					Else 
						Gen_Alert("Reversing receipt "+[INVOICES:39]Invoice_Number:1+" has been cancelled")
						$_bo_OK:=False:C215
						$_bo_Cancel:=True:C214
					End if 
				End if 
				If ($_bo_OK)
					[INVOICES:39]Invoice_Date:4:=Current date:C33(*)
					[INVOICES:39]Comments:12:="Receipt Reversal"+Char:C90(13)+("Description: "*(Num:C11($_t_ReceiptNumber#"")))+$_t_ReceiptNumber+"Cheque No:"+[INVOICES:39]Cheque_Number:36
					[INVOICES:39]Cheque_Number:36:=""
					QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=$_t_InvoiceNumberOLD)
					CREATE SET:C116([INVOICES_ALLOCATIONS:162]; "$DupSet")
					$_l_NumberofAllocations:=Records in selection:C76([INVOICES_ALLOCATIONS:162])
					For ($_l_AllocationsIndex2; 1; $_l_NumberofAllocations)
						USE SET:C118("$DUpSet")
						GOTO SELECTED RECORD:C245([INVOICES_ALLOCATIONS:162]; $_l_AllocationsIndex2)
						DUPLICATE RECORD:C225([INVOICES_ALLOCATIONS:162])
						//we can refund the total amount of this
						[INVOICES_ALLOCATIONS:162]ID:5:=AA_GetNextID(->[INVOICES_ALLOCATIONS:162]ID:5)
						[INVOICES_ALLOCATIONS:162]INVOICES_CODE:6:=[INVOICES:39]Invoice_Number:1
						[INVOICES_ALLOCATIONS:162]Amount:2:=-[INVOICES_ALLOCATIONS:162]Amount:2
						[INVOICES_ALLOCATIONS:162]Date:3:=[INVOICES:39]Invoice_Date:4
						DB_SaveRecord(->[INVOICES_ALLOCATIONS:162])
						
						NEXT RECORD:C51([INVOICES_ALLOCATIONS:162])
					End for 
					[INVOICES:39]Total_Paid:6:=-[INVOICES:39]Total_Paid:6
					[INVOICES:39]Total_Due:7:=-[INVOICES:39]Total_Due:7
					If (Application type:C494=4D Remote mode:K5:5)
						SET PROCESS VARIABLE:C370(-1; <>SI_bo_AllocationValidationDisab; <>SI_bo_AllocationValidationDisab)
					End if 
					$_t_PeriodPosting:=[INVOICES:39]Period_Code:13
					DB_SaveRecord(->[INVOICES:39])
					
					
					<>SI_bo_AllocationValidationDisab:=False:C215
					If (Application type:C494=4D Remote mode:K5:5)
						SET PROCESS VARIABLE:C370(-1; <>SI_bo_AllocationValidationDisab; <>SI_bo_AllocationValidationDisab)
					End if 
					
					$_bo_DepositReconcile:=False:C215
					//Gen_Alert ("There are "+String(Size of array($_ar_Amounts))+" to create allocations for")
					
					
					For ($_l_AllocationsIndex2; 1; Size of array:C274($_ar_Amounts))
						
						CREATE RECORD:C68([XInvoiceAllocation:126])
						[XInvoiceAllocation:126]xReceiptNumber:4:=$_t_ReverseReceiptNumber
						[XInvoiceAllocation:126]xAmount:7:=-($_ar_Amounts{$_l_AllocationsIndex2})
						[XInvoiceAllocation:126]xCreditNumber:3:=$_at_CreditNumbers{$_l_AllocationsIndex2}
						[XInvoiceAllocation:126]xDepositNumber:5:=$_at_DepositNumbers{$_l_AllocationsIndex2}
						[XInvoiceAllocation:126]xInvoiceNumber:2:=$_at_InvoiceNumbers{$_l_AllocationsIndex2}
						[XInvoiceAllocation:126]XPeriodCode:9:=[INVOICES:39]Period_Code:13
						[XInvoiceAllocation:126]xAllocationDate:6:=Current date:C33(*)
						DB_SaveRecord(->[XInvoiceAllocation:126])
						
						Case of 
							: ([XInvoiceAllocation:126]xCreditNumber:3#"")
								$_t_OtherSide:=[XInvoiceAllocation:126]xCreditNumber:3
							: ([XInvoiceAllocation:126]xDepositNumber:5#"")
								$_t_OtherSide:=[XInvoiceAllocation:126]xDepositNumber:5
							: ([XInvoiceAllocation:126]xInvoiceNumber:2#"")
								$_t_OtherSide:=[XInvoiceAllocation:126]xInvoiceNumber:2
						End case 
						
						QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_OtherSide)
						If (Not:C34(Check_Locked(->[INVOICES:39]; 1)))
							
							Gen_Alert(vTitle1+" "+[INVOICES:39]Invoice_Number:1+" is locked by another user.  The Receipt cannot be Reversed."; "Cancel")
							$_bo_Cancel:=True:C214
						Else 
							If (Records in selection:C76([INVOICES:39])>0)
								$_bo_OK2:=False:C215
								QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=[INVOICES:39]Invoice_Number:1)
								
								For ($_l_AllocationsIndex; 1; Records in selection:C76([INVOICES_ALLOCATIONS:162]))
									If ([INVOICES_ALLOCATIONS:162]Invoice_Number:1=$_t_ReceiptNumber)
										$_bo_OK2:=True:C214
										$_r_Amount:=-[INVOICES_ALLOCATIONS:162]Amount:2
										$_l_AllocationsIndex:=99999
									End if 
									NEXT RECORD:C51([INVOICES_ALLOCATIONS:162])
								End for 
								If ($_bo_OK2)
									
									CREATE RECORD:C68([INVOICES_ALLOCATIONS:162])
									[INVOICES_ALLOCATIONS:162]Company_Code:7:=[INVOICES:39]Company_Code:2
									[INVOICES_ALLOCATIONS:162]INVOICES_CODE:6:=[INVOICES:39]Invoice_Number:1
									[INVOICES_ALLOCATIONS:162]ID:5:=AA_GetNextID(->[INVOICES_ALLOCATIONS:162]ID:5)
									[INVOICES_ALLOCATIONS:162]Amount:2:=$_r_Amount
									[INVOICES_ALLOCATIONS:162]Date:3:=Current date:C33(*)
									[INVOICES_ALLOCATIONS:162]Invoice_Number:1:=$_t_ReverseReceiptNumber
									DB_SaveRecord(->[INVOICES_ALLOCATIONS:162])
									//And update the amount due on that invoice
									
									INV_CheckRemainder
									
									If ([INVOICES:39]Invoice_Number:1="*D@")
										
										If ([INVOICES:39]Total_Paid:6=0)
											$_t_TotalPaid:=Gen_Request("How much should this deposit be?"; "0.00")
											[INVOICES:39]Total_Paid:6:=Num:C11($_t_TotalPaid)
										End if 
										
									Else 
										[INVOICES:39]Total_Paid:6:=Gen_Round(Round:C94(INV_CalculateAllocations([INVOICES:39]Invoice_Number:1; True:C214); 2); 2; 2)
									End if 
									DB_SaveRecord(->[INVOICES:39])
									
									
									//and now reverse the posting
									Case of 
										: ([INVOICES:39]Invoice_Number:1="*D@")
											$_bo_DepositReconcile:=True:C214
											$_t_DepositReference:=[INVOICES:39]Invoice_Number:1
											
											QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1=DB_GetLedgerTransDepositRec; *)
											QUERY:C277([TRANSACTION_BATCH_ITEMS:155];  & ; [TRANSACTION_BATCH_ITEMS:155]Amount:6=Gen_Round($_r_Amount; 2; 2); *)
											QUERY:C277([TRANSACTION_BATCH_ITEMS:155];  & ; [TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4=[INVOICES:39]Invoice_Number:1)
											SELECTION TO ARRAY:C260([TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31; $_al_TransInBatchNumbers)
											QUERY WITH ARRAY:C644([TRANSACTION_BATCHES:30]Batch_Number:10; $_al_TransInBatchNumbers)
											
											If (Records in selection:C76([TRANSACTION_BATCHES:30])>0)
												//this is the batch
												
												$_l_BatchNumberRow:=Find in array:C230($_al_BatchNumbers2; [TRANSACTION_BATCHES:30]Batch_Number:10)
												If ($_l_BatchNumberRow<0)
													INSERT IN ARRAY:C227($_al_BatchNumbers2; Size of array:C274($_al_BatchNumbers2)+1; 1)
													$_al_BatchNumbers2{Size of array:C274($_al_BatchNumbers2)}:=[TRANSACTION_BATCHES:30]Batch_Number:10
												End if 
												QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTION_BATCHES:30]Batch_Number:10)
												FIRST RECORD:C50([TRANSACTION_BATCH_ITEMS:155])
												$_bo_FindMultiInvoice:=False:C215
												For ($_l_BatchItemIndex2; 1; Records in selection:C76([TRANSACTION_BATCH_ITEMS:155]))
													If ([TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1=DB_GetLedgerTransDepositRec) & ([TRANSACTION_BATCH_ITEMS:155]Amount:6=Gen_Round($_r_Amount; 2; 2)) & ([TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4=[INVOICES:39]Invoice_Number:1)
														
														//This is the item we want to reverse in a new batch
														
														$_l_SizeofArray:=Size of array:C274($_ar_BatchItemAmount)+1
														INSERT IN ARRAY:C227($_ar_BatchItemAmount; $_l_SizeofArray; 1)
														INSERT IN ARRAY:C227($_at_BatchItemAnalysis; $_l_SizeofArray; 1)
														INSERT IN ARRAY:C227($_at_BatchItemCoCode; $_l_SizeofArray; 1)
														INSERT IN ARRAY:C227($_at_BatchItemCreditAcc; $_l_SizeofArray; 1)
														INSERT IN ARRAY:C227($_at_BatchItemcreditIO; $_l_SizeofArray; 1)
														INSERT IN ARRAY:C227($_at_BatchItemCurrCode; $_l_SizeofArray; 1)
														INSERT IN ARRAY:C227($_at_BatchItemDebitAcc; $_l_SizeofArray; 1)
														INSERT IN ARRAY:C227($_at_BatchItemdebitIO; $_l_SizeofArray; 1)
														INSERT IN ARRAY:C227($_at_batchItemInvoiceNo; $_l_SizeofArray; 1)
														INSERT IN ARRAY:C227($_at_BatchItemJobCode; $_l_SizeofArray; 1)
														INSERT IN ARRAY:C227($_at_BatchItemLayerCode; $_l_SizeofArray; 1)
														INSERT IN ARRAY:C227($_at_BatchItemPurchInvno; $_l_SizeofArray; 1)
														INSERT IN ARRAY:C227($_at_BatchItemPurchaseCode; $_l_SizeofArray; 1)
														INSERT IN ARRAY:C227($_ar_BatchItemSecondAmt; $_l_SizeofArray; 1)
														INSERT IN ARRAY:C227($_ar_BatchItemTaxAmount; $_l_SizeofArray; 1)
														INSERT IN ARRAY:C227($_at_BatchItemTaxCode; $_l_SizeofArray; 1)
														INSERT IN ARRAY:C227($_ar_BatchItemTotal; $_l_SizeofArray; 1)
														INSERT IN ARRAY:C227($_at_Batchitemtranscode; $_l_SizeofArray; 1)
														INSERT IN ARRAY:C227($_at_BatchItemUKEC; $_l_SizeofArray; 1)
														$_ar_BatchItemAmount{$_l_SizeofArray}:=[TRANSACTION_BATCH_ITEMS:155]Amount:6
														$_at_BatchItemAnalysis{$_l_SizeofArray}:=[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2
														$_at_BatchItemCoCode{$_l_SizeofArray}:=[TRANSACTION_BATCH_ITEMS:155]Company_Code:13
														$_at_BatchItemCreditAcc{$_l_SizeofArray}:=[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12
														$_at_BatchItemcreditIO{$_l_SizeofArray}:=[TRANSACTION_BATCH_ITEMS:155]Credit_IO:16
														$_at_BatchItemCurrCode{$_l_SizeofArray}:=[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19
														$_at_BatchItemDebitAcc{$_l_SizeofArray}:=[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3
														$_at_BatchItemdebitIO{$_l_SizeofArray}:=[TRANSACTION_BATCH_ITEMS:155]Debit_IO:15
														$_at_batchItemInvoiceNo{$_l_SizeofArray}:=[TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4
														$_at_BatchItemJobCode{$_l_SizeofArray}:=[TRANSACTION_BATCH_ITEMS:155]Job_Code:23
														$_at_BatchItemLayerCode{$_l_SizeofArray}:=[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20
														
														$_at_BatchItemPurchInvno{$_l_SizeofArray}:=[TRANSACTION_BATCH_ITEMS:155]Purchase_invoice_Number:17
														$_at_BatchItemPurchaseCode{$_l_SizeofArray}:=[TRANSACTION_BATCH_ITEMS:155]Purchase_Invoice_Code:22
														$_ar_BatchItemSecondAmt{$_l_SizeofArray}:=[TRANSACTION_BATCH_ITEMS:155]Second_Amount:21
														$_ar_BatchItemTaxAmount{$_l_SizeofArray}:=[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8
														$_at_BatchItemTaxCode{$_l_SizeofArray}:=[TRANSACTION_BATCH_ITEMS:155]Tax_Code:7
														$_ar_BatchItemTotal{$_l_SizeofArray}:=[TRANSACTION_BATCH_ITEMS:155]Total:9
														$_at_Batchitemtranscode{$_l_SizeofArray}:=[TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1
														$_at_BatchItemUKEC{$_l_SizeofArray}:=[TRANSACTION_BATCH_ITEMS:155]UK_EC:18
														//if this posting was single sided need to update the other side correctly
														If ([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3#"") & ([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12#"")
															$_l_BatchItemIndex2:=Records in selection:C76([TRANSACTION_BATCH_ITEMS:155])  //Break out
														Else 
															$_bo_FindMultiInvoice:=True:C214
															$_l_Element:=$_l_SizeofArray
														End if 
													End if 
													NEXT RECORD:C51([TRANSACTION_BATCH_ITEMS:155])
												End for 
												
												If ($_bo_FindMultiInvoice)
													FIRST RECORD:C50([TRANSACTION_BATCH_ITEMS:155])
													//the posting was a multi invoice posting...so need to find the other side to get the correct account to reverse
													For ($_l_BatchItemIndex2; 1; Records in selection:C76([TRANSACTION_BATCH_ITEMS:155]))
														If ([TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1=DB_GetLedgerTRANSRECpost) & ([TRANSACTION_BATCH_ITEMS:155]Description:10="Multiple Invoices_Receipt") & ([TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2=$_at_BatchItemAnalysis{$_l_Element}) & (Abs:C99([TRANSACTION_BATCH_ITEMS:155]Total:9)>=Abs:C99($_ar_BatchItemTotal{$_l_Element}))
															//This is theother side of  item we want to reverse in a new batch
															
															$_l_SizeofArray:=Size of array:C274($_ar_BatchItemAmount)+1
															INSERT IN ARRAY:C227($_ar_BatchItemAmount; $_l_SizeofArray; 1)
															INSERT IN ARRAY:C227($_at_BatchItemAnalysis; $_l_SizeofArray; 1)
															INSERT IN ARRAY:C227($_at_BatchItemCoCode; $_l_SizeofArray; 1)
															INSERT IN ARRAY:C227($_at_BatchItemCreditAcc; $_l_SizeofArray; 1)
															INSERT IN ARRAY:C227($_at_BatchItemcreditIO; $_l_SizeofArray; 1)
															INSERT IN ARRAY:C227($_at_BatchItemCurrCode; $_l_SizeofArray; 1)
															INSERT IN ARRAY:C227($_at_BatchItemDebitAcc; $_l_SizeofArray; 1)
															INSERT IN ARRAY:C227($_at_BatchItemdebitIO; $_l_SizeofArray; 1)
															
															INSERT IN ARRAY:C227($_at_batchItemInvoiceNo; $_l_SizeofArray; 1)
															INSERT IN ARRAY:C227($_at_BatchItemJobCode; $_l_SizeofArray; 1)
															INSERT IN ARRAY:C227($_at_BatchItemLayerCode; $_l_SizeofArray; 1)
															INSERT IN ARRAY:C227($_at_BatchItemPurchInvno; $_l_SizeofArray; 1)
															INSERT IN ARRAY:C227($_at_BatchItemPurchaseCode; $_l_SizeofArray; 1)
															INSERT IN ARRAY:C227($_ar_BatchItemSecondAmt; $_l_SizeofArray; 1)
															INSERT IN ARRAY:C227($_ar_BatchItemTaxAmount; $_l_SizeofArray; 1)
															INSERT IN ARRAY:C227($_at_BatchItemTaxCode; $_l_SizeofArray; 1)
															INSERT IN ARRAY:C227($_ar_BatchItemTotal; $_l_SizeofArray; 1)
															INSERT IN ARRAY:C227($_at_Batchitemtranscode; $_l_SizeofArray; 1)
															INSERT IN ARRAY:C227($_at_BatchItemUKEC; $_l_SizeofArray; 1)
															$_ar_BatchItemAmount{$_l_SizeofArray}:=($_ar_BatchItemAmount{$_l_Element})
															$_at_BatchItemAnalysis{$_l_SizeofArray}:=[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2
															$_at_BatchItemCoCode{$_l_SizeofArray}:=[TRANSACTION_BATCH_ITEMS:155]Company_Code:13
															$_at_BatchItemCreditAcc{$_l_SizeofArray}:=[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12
															$_at_BatchItemcreditIO{$_l_SizeofArray}:=[TRANSACTION_BATCH_ITEMS:155]Credit_IO:16
															$_at_BatchItemCurrCode{$_l_SizeofArray}:=[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19
															$_at_BatchItemDebitAcc{$_l_SizeofArray}:=[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3
															$_at_BatchItemdebitIO{$_l_SizeofArray}:=[TRANSACTION_BATCH_ITEMS:155]Debit_IO:15
															
															$_at_batchItemInvoiceNo{$_l_SizeofArray}:=[TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4
															$_at_BatchItemJobCode{$_l_SizeofArray}:=[TRANSACTION_BATCH_ITEMS:155]Job_Code:23
															$_at_BatchItemLayerCode{$_l_SizeofArray}:=[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20
															
															$_at_BatchItemPurchInvno{$_l_SizeofArray}:=[TRANSACTION_BATCH_ITEMS:155]Purchase_invoice_Number:17
															$_at_BatchItemPurchaseCode{$_l_SizeofArray}:=[TRANSACTION_BATCH_ITEMS:155]Purchase_Invoice_Code:22
															If ([TRANSACTION_BATCH_ITEMS:155]Second_Amount:21#0)
																$_ar_BatchItemSecondAmt{$_l_SizeofArray}:=-($_ar_BatchItemSecondAmt{$_l_Element})
															End if 
															If ([TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8#0)
																$_ar_BatchItemTaxAmount{$_l_SizeofArray}:=-($_ar_BatchItemTaxAmount{$_l_Element})
															End if 
															$_at_BatchItemTaxCode{$_l_SizeofArray}:=[TRANSACTION_BATCH_ITEMS:155]Tax_Code:7
															
															$_ar_BatchItemTotal{$_l_SizeofArray}:=-($_ar_BatchItemTotal{$_l_SizeofArray})
															$_at_Batchitemtranscode{$_l_SizeofArray}:=[TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1
															$_at_BatchItemUKEC{$_l_SizeofArray}:=[TRANSACTION_BATCH_ITEMS:155]UK_EC:18
															//if this posting was single sided need to update the other side correctly
															
															$_l_BatchItemIndex2:=Records in selection:C76([TRANSACTION_BATCH_ITEMS:155])  //Break out
															
															
															
														End if 
														NEXT RECORD:C51([TRANSACTION_BATCH_ITEMS:155])
													End for 
													
												End if 
												
											Else 
												Gen_Alert("The original invoice did not refer to this receipt, the reversal is cancelled, there is no Trans in Deposit record for "+[INVOICES:39]Invoice_Number:1)
												$_bo_Cancel:=True:C214
												
											End if 
										Else 
											If (Not:C34($_bo_DepositReconcile))
												
												QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1=DB_GetLedgerTRANSRECpost)
												QUERY SELECTION:C341([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Amount:6=Gen_Round(-$_r_Amount; 2; 2))
												QUERY SELECTION:C341([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Description:10="Invoice "+[INVOICES:39]Invoice_Number:1+" Receipt")
												SELECTION TO ARRAY:C260([TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31; $_al_TransInBatchNumbers)
												QUERY WITH ARRAY:C644([TRANSACTION_BATCHES:30]Batch_Number:10; $_al_TransInBatchNumbers)
												
												If (Records in selection:C76([TRANSACTION_BATCHES:30])>0)
													FIRST RECORD:C50([TRANSACTION_BATCHES:30])
													For ($_l_BatchIndex; 1; Records in selection:C76([TRANSACTION_BATCHES:30]))
														
														//this is the batch
														QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTION_BATCHES:30]Batch_Number:10)
														FIRST RECORD:C50([TRANSACTION_BATCH_ITEMS:155])
														$_bo_FindMultiInvoice:=False:C215
														//Gen_Alert ("Creating a reverse batch")
														
														For ($_l_BatchItemIndex2; 1; Records in selection:C76([TRANSACTION_BATCH_ITEMS:155]))
															If ([TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1=DB_GetLedgerTRANSRECpost) & ([TRANSACTION_BATCH_ITEMS:155]Amount:6=Gen_Round(-$_r_Amount; 2; 2)) & ([TRANSACTION_BATCH_ITEMS:155]Description:10=("Invoice "+[INVOICES:39]Invoice_Number:1+" Receipt"))
																//This is the item we want to reverse in a new batch
																$_l_BatchNumberRow:=Find in array:C230($_al_BatchNumbers2; [TRANSACTION_BATCHES:30]Batch_Number:10)
																If ($_l_BatchNumberRow<0)
																	INSERT IN ARRAY:C227($_al_BatchNumbers2; Size of array:C274($_al_BatchNumbers2)+1; 1)
																	$_al_BatchNumbers2{Size of array:C274($_al_BatchNumbers2)}:=[TRANSACTION_BATCHES:30]Batch_Number:10
																End if 
																
																$_l_SizeofArray:=Size of array:C274($_ar_BatchItemAmount)+1
																INSERT IN ARRAY:C227($_ar_BatchItemAmount; $_l_SizeofArray; 1)
																INSERT IN ARRAY:C227($_at_BatchItemAnalysis; $_l_SizeofArray; 1)
																INSERT IN ARRAY:C227($_at_BatchItemCoCode; $_l_SizeofArray; 1)
																INSERT IN ARRAY:C227($_at_BatchItemCreditAcc; $_l_SizeofArray; 1)
																INSERT IN ARRAY:C227($_at_BatchItemcreditIO; $_l_SizeofArray; 1)
																INSERT IN ARRAY:C227($_at_BatchItemCurrCode; $_l_SizeofArray; 1)
																INSERT IN ARRAY:C227($_at_BatchItemDebitAcc; $_l_SizeofArray; 1)
																INSERT IN ARRAY:C227($_at_BatchItemdebitIO; $_l_SizeofArray; 1)
																
																INSERT IN ARRAY:C227($_at_batchItemInvoiceNo; $_l_SizeofArray; 1)
																INSERT IN ARRAY:C227($_at_BatchItemJobCode; $_l_SizeofArray; 1)
																INSERT IN ARRAY:C227($_at_BatchItemLayerCode; $_l_SizeofArray; 1)
																INSERT IN ARRAY:C227($_at_BatchItemPurchInvno; $_l_SizeofArray; 1)
																INSERT IN ARRAY:C227($_at_BatchItemPurchaseCode; $_l_SizeofArray; 1)
																INSERT IN ARRAY:C227($_ar_BatchItemSecondAmt; $_l_SizeofArray; 1)
																INSERT IN ARRAY:C227($_ar_BatchItemTaxAmount; $_l_SizeofArray; 1)
																INSERT IN ARRAY:C227($_at_BatchItemTaxCode; $_l_SizeofArray; 1)
																INSERT IN ARRAY:C227($_ar_BatchItemTotal; $_l_SizeofArray; 1)
																INSERT IN ARRAY:C227($_at_Batchitemtranscode; $_l_SizeofArray; 1)
																INSERT IN ARRAY:C227($_at_BatchItemUKEC; $_l_SizeofArray; 1)
																$_ar_BatchItemAmount{$_l_SizeofArray}:=[TRANSACTION_BATCH_ITEMS:155]Amount:6
																$_at_BatchItemAnalysis{$_l_SizeofArray}:=[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2
																$_at_BatchItemCoCode{$_l_SizeofArray}:=[TRANSACTION_BATCH_ITEMS:155]Company_Code:13
																$_at_BatchItemCreditAcc{$_l_SizeofArray}:=[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12
																$_at_BatchItemcreditIO{$_l_SizeofArray}:=[TRANSACTION_BATCH_ITEMS:155]Credit_IO:16
																$_at_BatchItemCurrCode{$_l_SizeofArray}:=[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19
																$_at_BatchItemDebitAcc{$_l_SizeofArray}:=[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3
																$_at_BatchItemdebitIO{$_l_SizeofArray}:=[TRANSACTION_BATCH_ITEMS:155]Debit_IO:15
																$_at_batchItemInvoiceNo{$_l_SizeofArray}:=[TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4
																$_at_BatchItemJobCode{$_l_SizeofArray}:=[TRANSACTION_BATCH_ITEMS:155]Job_Code:23
																$_at_BatchItemLayerCode{$_l_SizeofArray}:=[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20
																
																$_at_BatchItemPurchInvno{$_l_SizeofArray}:=[TRANSACTION_BATCH_ITEMS:155]Purchase_invoice_Number:17
																$_at_BatchItemPurchaseCode{$_l_SizeofArray}:=[TRANSACTION_BATCH_ITEMS:155]Purchase_Invoice_Code:22
																$_ar_BatchItemSecondAmt{$_l_SizeofArray}:=[TRANSACTION_BATCH_ITEMS:155]Second_Amount:21
																$_ar_BatchItemTaxAmount{$_l_SizeofArray}:=[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8
																$_at_BatchItemTaxCode{$_l_SizeofArray}:=[TRANSACTION_BATCH_ITEMS:155]Tax_Code:7
																$_ar_BatchItemTotal{$_l_SizeofArray}:=[TRANSACTION_BATCH_ITEMS:155]Total:9
																$_at_Batchitemtranscode{$_l_SizeofArray}:=[TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1
																$_at_BatchItemUKEC{$_l_SizeofArray}:=[TRANSACTION_BATCH_ITEMS:155]UK_EC:18
																//if this posting was single sided need to update the other side correctly
																If ([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3#"") & ([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12#"")
																	$_l_BatchItemIndex2:=Records in selection:C76([TRANSACTION_BATCH_ITEMS:155])  //Break out
																Else 
																	$_bo_FindMultiInvoice:=True:C214
																	$_l_Element:=$_l_SizeofArray
																End if 
															End if 
															NEXT RECORD:C51([TRANSACTION_BATCH_ITEMS:155])
														End for 
														If ($_bo_FindMultiInvoice)
															FIRST RECORD:C50([TRANSACTION_BATCH_ITEMS:155])
															//the posting was a multi invoice posting...so need to find the other side to get the correct account to reverse
															For ($_l_BatchItemIndex2; 1; Records in selection:C76([TRANSACTION_BATCH_ITEMS:155]))
																If ([TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1=DB_GetLedgerTRANSRECpost) & ([TRANSACTION_BATCH_ITEMS:155]Description:10="Multiple Invoices_Receipt") & ([TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2=$_at_BatchItemAnalysis{$_l_Element}) & (Abs:C99([TRANSACTION_BATCH_ITEMS:155]Total:9)>=Abs:C99($_ar_BatchItemTotal{$_l_Element}))
																	//This is theother side of  item we want to reverse in a new batch
																	$_l_BatchNumberRow:=Find in array:C230($_al_BatchNumbers2; [TRANSACTION_BATCHES:30]Batch_Number:10)
																	If ($_l_BatchNumberRow<0)
																		INSERT IN ARRAY:C227($_al_BatchNumbers2; Size of array:C274($_al_BatchNumbers2)+1; 1)
																		$_al_BatchNumbers2{Size of array:C274($_al_BatchNumbers2)}:=[TRANSACTION_BATCHES:30]Batch_Number:10
																	End if 
																	
																	$_l_SizeofArray:=Size of array:C274($_ar_BatchItemAmount)+1
																	INSERT IN ARRAY:C227($_ar_BatchItemAmount; $_l_SizeofArray; 1)
																	INSERT IN ARRAY:C227($_at_BatchItemAnalysis; $_l_SizeofArray; 1)
																	INSERT IN ARRAY:C227($_at_BatchItemCoCode; $_l_SizeofArray; 1)
																	INSERT IN ARRAY:C227($_at_BatchItemCreditAcc; $_l_SizeofArray; 1)
																	INSERT IN ARRAY:C227($_at_BatchItemcreditIO; $_l_SizeofArray; 1)
																	INSERT IN ARRAY:C227($_at_BatchItemCurrCode; $_l_SizeofArray; 1)
																	INSERT IN ARRAY:C227($_at_BatchItemDebitAcc; $_l_SizeofArray; 1)
																	INSERT IN ARRAY:C227($_at_BatchItemdebitIO; $_l_SizeofArray; 1)
																	
																	INSERT IN ARRAY:C227($_at_batchItemInvoiceNo; $_l_SizeofArray; 1)
																	INSERT IN ARRAY:C227($_at_BatchItemJobCode; $_l_SizeofArray; 1)
																	INSERT IN ARRAY:C227($_at_BatchItemLayerCode; $_l_SizeofArray; 1)
																	INSERT IN ARRAY:C227($_at_BatchItemPurchInvno; $_l_SizeofArray; 1)
																	INSERT IN ARRAY:C227($_at_BatchItemPurchaseCode; $_l_SizeofArray; 1)
																	INSERT IN ARRAY:C227($_ar_BatchItemSecondAmt; $_l_SizeofArray; 1)
																	INSERT IN ARRAY:C227($_ar_BatchItemTaxAmount; $_l_SizeofArray; 1)
																	INSERT IN ARRAY:C227($_at_BatchItemTaxCode; $_l_SizeofArray; 1)
																	INSERT IN ARRAY:C227($_ar_BatchItemTotal; $_l_SizeofArray; 1)
																	INSERT IN ARRAY:C227($_at_Batchitemtranscode; $_l_SizeofArray; 1)
																	INSERT IN ARRAY:C227($_at_BatchItemUKEC; $_l_SizeofArray; 1)
																	$_ar_BatchItemAmount{$_l_SizeofArray}:=($_ar_BatchItemAmount{$_l_Element})
																	$_at_BatchItemAnalysis{$_l_SizeofArray}:=[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2
																	$_at_BatchItemCoCode{$_l_SizeofArray}:=[TRANSACTION_BATCH_ITEMS:155]Company_Code:13
																	$_at_BatchItemCreditAcc{$_l_SizeofArray}:=[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12
																	$_at_BatchItemcreditIO{$_l_SizeofArray}:=[TRANSACTION_BATCH_ITEMS:155]Credit_IO:16
																	$_at_BatchItemCurrCode{$_l_SizeofArray}:=[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19
																	$_at_BatchItemDebitAcc{$_l_SizeofArray}:=[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3
																	$_at_BatchItemdebitIO{$_l_SizeofArray}:=[TRANSACTION_BATCH_ITEMS:155]Debit_IO:15
																	$_at_batchItemInvoiceNo{$_l_SizeofArray}:=[TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4
																	$_at_BatchItemJobCode{$_l_SizeofArray}:=[TRANSACTION_BATCH_ITEMS:155]Job_Code:23
																	$_at_BatchItemLayerCode{$_l_SizeofArray}:=[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20
																	
																	$_at_BatchItemPurchInvno{$_l_SizeofArray}:=[TRANSACTION_BATCH_ITEMS:155]Purchase_invoice_Number:17
																	$_at_BatchItemPurchaseCode{$_l_SizeofArray}:=[TRANSACTION_BATCH_ITEMS:155]Purchase_Invoice_Code:22
																	If ([TRANSACTION_BATCH_ITEMS:155]Second_Amount:21#0)
																		$_ar_BatchItemSecondAmt{$_l_SizeofArray}:=-($_ar_BatchItemSecondAmt{$_l_Element})
																	End if 
																	If ([TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8#0)
																		$_ar_BatchItemTaxAmount{$_l_SizeofArray}:=-($_ar_BatchItemTaxAmount{$_l_Element})
																	End if 
																	$_at_BatchItemTaxCode{$_l_SizeofArray}:=[TRANSACTION_BATCH_ITEMS:155]Tax_Code:7
																	
																	$_ar_BatchItemTotal{$_l_SizeofArray}:=-($_ar_BatchItemTotal{$_l_SizeofArray})
																	$_at_Batchitemtranscode{$_l_SizeofArray}:=[TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1
																	$_at_BatchItemUKEC{$_l_SizeofArray}:=[TRANSACTION_BATCH_ITEMS:155]UK_EC:18
																	//if this posting was single sided need to update the other side correctly
																	
																	$_l_BatchItemIndex2:=Records in selection:C76([TRANSACTION_BATCH_ITEMS:155])  //Break out
																	
																	
																	
																End if 
																NEXT RECORD:C51([TRANSACTION_BATCH_ITEMS:155])
															End for 
															
														End if 
														NEXT RECORD:C51([TRANSACTION_BATCHES:30])
														
													End for 
													
												Else 
													Gen_Alert("The original invoice did not refer to this receipt, the reversal is cancelled, there is no trans in(batch) record of type invoice transaction for the correct amount refering to receipt "+[INVOICES:39]Invoice_Number:1)
													
													$_bo_Cancel:=True:C214
													
												End if 
											End if 
									End case 
								Else 
									Gen_Alert("The original invoice did not refer to this receipt, the reversal is cancelled.  There is no allocation record for "+[INVOICES:39]Invoice_Number:1)
									
									
									//the original invoice is missing
									$_bo_Cancel:=True:C214
								End if 
							Else 
								Gen_Alert("The original invoice is missing, the reversal is cancelled")
								
								//the original invoice is missing
								$_bo_Cancel:=True:C214
							End if 
							
							
						End if 
						
					End for 
					//Gen_Alert ("receipt(refund) made")
					//Now we have all the other side amounts we can create the reverse batch
					If (Size of array:C274($_al_BatchNumbers2)>0) & Not:C34($_bo_Cancel)
						$_l_AddMode:=Vadd
						Vadd:=0
						
						CREATE RECORD:C68([TRANSACTION_BATCHES:30])
						
						BatchNo
						If ([TRANSACTION_BATCHES:30]Batch_Number:10=0)
							OK:=0
						Else 
							[TRANSACTION_BATCHES:30]Batch_Date:1:=vDate
							[TRANSACTION_BATCHES:30]Entry_Date:6:=<>DB_d_CurrentDate
							[TRANSACTION_BATCHES:30]Description:12:="Invoice Receipt Reversal: "  //  `vDesc
							If (Size of array:C274($_ar_BatchItemAmount)>1)
								$_bo_SinSid:=True:C214
								//The single sides are stored in the array too...including the amounts-but not rolled up not the amounts of them
								//so here before we start just try to roll them up
								For ($_l_Rollup; 1; Size of array:C274($_ar_BatchItemAmount))
									$_t_AnalysisCode:=$_at_BatchItemAnalysis{$_l_Rollup}
									$_t_ThisCo:=$_at_BatchItemCoCode{$_l_Rollup}
									$_t_ThisCac:=$_at_BatchItemCreditAcc{$_l_Rollup}
									$_t_ThisCIO:=$_at_BatchItemcreditIO{$_l_Rollup}
									$_t_ThisCurCode:=$_at_BatchItemCurrCode{$_l_Rollup}
									$_t_ThisDAC:=$_at_BatchItemDebitAcc{$_l_Rollup}
									$_t_ThisDIO:=$_at_BatchItemdebitIO{$_l_Rollup}
									$_t_ThisInvoice:=$_at_batchItemInvoiceNo{$_l_Rollup}
									$_t_ThisJob:=$_at_BatchItemJobCode{$_l_Rollup}
									$_t_ThisLayer:=$_at_BatchItemLayerCode{$_l_Rollup}
									$_t_ThisPI:=$_at_BatchItemPurchInvno{$_l_Rollup}
									$_t_ThisPO:=$_at_BatchItemPurchaseCode{$_l_Rollup}
									$_t_ThisTC:=$_at_Batchitemtranscode{$_l_Rollup}
									$_t_ThisUKEC:=$_at_BatchItemUKEC{$_l_Rollup}
									For ($_l_Rollup2; $_l_Rollup+1; Size of array:C274($_ar_BatchItemAmount))
										If ($_t_AnalysisCode=$_at_BatchItemAnalysis{$_l_Rollup2}) & ($_t_ThisCac=$_at_BatchItemCreditAcc{$_l_Rollup2}) & ($_t_ThisCIO=$_at_BatchItemcreditIO{$_l_Rollup2}) & ($_t_ThisCurCode=$_at_BatchItemCurrCode{$_l_Rollup2}) & ($_t_ThisDAC=$_at_BatchItemDebitAcc{$_l_Rollup2}) & ($_t_ThisDIO=$_at_BatchItemdebitIO{$_l_Rollup2}) & ($_t_ThisInvoice=$_at_batchItemInvoiceNo{$_l_Rollup2}) & ($_t_ThisJob=$_at_BatchItemJobCode{$_l_Rollup2}) & ($_t_ThisLayer=$_at_BatchItemLayerCode{$_l_Rollup2}) & ($_t_ThisPI=$_at_BatchItemPurchInvno{$_l_Rollup2}) & ($_t_ThisPO=$_at_BatchItemPurchaseCode{$_l_Rollup2}) & ($_t_ThisTC=$_at_Batchitemtranscode{$_l_Rollup2}) & ($_t_ThisUKEC=$_at_BatchItemUKEC{$_l_Rollup2})
											
											//can roll together
											$_ar_BatchItemAmount{$_l_Rollup2}:=$_ar_BatchItemAmount{$_l_Rollup}+$_ar_BatchItemAmount{$_l_Rollup2}
											$_ar_BatchItemSecondAmt{$_l_Rollup2}:=$_ar_BatchItemSecondAmt{$_l_Rollup}+$_ar_BatchItemSecondAmt{$_l_Rollup2}
											$_ar_BatchItemTaxAmount{$_l_Rollup2}:=$_ar_BatchItemTaxAmount{$_l_Rollup}+$_ar_BatchItemTaxAmount{$_l_Rollup2}
											$_ar_BatchItemTotal{$_l_Rollup2}:=$_ar_BatchItemTotal{$_l_Rollup}+$_ar_BatchItemTotal{$_l_Rollup2}
											//and clear the now not needed line
											$_at_BatchItemAnalysis{$_l_Rollup}:=""
											$_at_BatchItemCoCode{$_l_Rollup}:=""
											$_at_BatchItemCreditAcc{$_l_Rollup}:=""
											$_at_BatchItemcreditIO{$_l_Rollup}:=""
											$_at_BatchItemCurrCode{$_l_Rollup}:=""
											$_at_BatchItemDebitAcc{$_l_Rollup}:=""
											$_at_BatchItemdebitIO{$_l_Rollup}:=""
											$_at_batchItemInvoiceNo{$_l_Rollup}:=""
											$_at_BatchItemJobCode{$_l_Rollup}:=""
											$_at_BatchItemLayerCode{$_l_Rollup}:=""
											$_at_BatchItemPurchInvno{$_l_Rollup}:=""
											$_at_BatchItemPurchaseCode{$_l_Rollup}:=""
											$_at_Batchitemtranscode{$_l_Rollup}:=""
											
											$_l_Rollup2:=Size of array:C274($_ar_BatchItemAmount)
										End if 
									End for 
									
								End for 
								$_l_BatchItemAmounts:=Size of array:C274($_ar_BatchItemAmount)
								$_l_ThisBatchItemID:=0
								$_l_ThisBatchItemReference:=0
								$_l_ThisBatchItemID:=(AA_GetNextID(->[TRANSACTION_BATCH_ITEMS:155]ID:30; -$_l_BatchItemAmounts))-$_l_BatchItemAmounts
								$_l_ThisBatchItemReference:=(AA_GetNextIDinMethod(->DS_l_BATCHITEMRef; -$_l_BatchItemAmounts))-$_l_BatchItemAmounts
								For ($_l_CreateIndex; 1; Size of array:C274($_ar_BatchItemAmount))
									If ($_at_BatchItemCreditAcc{$_l_CreateIndex}#"") | ($_at_BatchItemDebitAcc{$_l_CreateIndex}#"")
										CREATE RECORD:C68([TRANSACTION_BATCH_ITEMS:155])
										[TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31:=[TRANSACTION_BATCHES:30]Batch_Number:10
										If ($_l_ThisBatchItemID>0)
											[TRANSACTION_BATCH_ITEMS:155]ID:30:=$_l_ThisBatchItemID
											$_l_ThisBatchItemID:=$_l_ThisBatchItemID+1
										Else 
											[TRANSACTION_BATCH_ITEMS:155]ID:30:=AA_GetNextID(->[TRANSACTION_BATCH_ITEMS:155]ID:30)
										End if 
										[TRANSACTION_BATCH_ITEMS:155]Amount:6:=-($_ar_BatchItemAmount{$_l_CreateIndex})
										[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2:=$_at_BatchItemAnalysis{$_l_CreateIndex}
										[TRANSACTION_BATCH_ITEMS:155]Company_Code:13:=$_at_BatchItemCoCode{$_l_CreateIndex}
										[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12:=$_at_BatchItemCreditAcc{$_l_CreateIndex}
										[TRANSACTION_BATCH_ITEMS:155]Credit_IO:16:=$_at_BatchItemcreditIO{$_l_CreateIndex}
										[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19:=$_at_BatchItemCurrCode{$_l_CreateIndex}
										[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3:=$_at_BatchItemDebitAcc{$_l_CreateIndex}
										[TRANSACTION_BATCH_ITEMS:155]Debit_IO:15:=$_at_BatchItemdebitIO{$_l_CreateIndex}
										[TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4:=$_at_batchItemInvoiceNo{$_l_CreateIndex}
										[TRANSACTION_BATCH_ITEMS:155]Job_Code:23:=$_at_BatchItemJobCode{$_l_CreateIndex}
										[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20:=$_at_BatchItemLayerCode{$_l_CreateIndex}
										
										[TRANSACTION_BATCH_ITEMS:155]Purchase_invoice_Number:17:=$_at_BatchItemPurchInvno{$_l_CreateIndex}
										[TRANSACTION_BATCH_ITEMS:155]Purchase_Invoice_Code:22:=$_at_BatchItemPurchaseCode{$_l_CreateIndex}
										[TRANSACTION_BATCH_ITEMS:155]Second_Amount:21:=-($_ar_BatchItemSecondAmt{$_l_CreateIndex})
										[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8:=-($_ar_BatchItemTaxAmount{$_l_CreateIndex})
										[TRANSACTION_BATCH_ITEMS:155]Tax_Code:7:=$_at_BatchItemTaxCode{$_l_CreateIndex}
										[TRANSACTION_BATCH_ITEMS:155]Total:9:=[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8+[TRANSACTION_BATCH_ITEMS:155]Amount:6
										[TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1:=$_at_Batchitemtranscode{$_l_CreateIndex}
										[TRANSACTION_BATCH_ITEMS:155]UK_EC:18:=$_at_BatchItemUKEC{$_l_CreateIndex}
										[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5:=Current date:C33(*)
										[TRANSACTION_BATCH_ITEMS:155]Period_Code:11:=$_t_PeriodPosting
										If ([TRANSACTION_BATCH_ITEMS:155]BatchItemID:25=0)
											If ($_l_ThisBatchItemReference>0)
												[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=$_l_ThisBatchItemReference
												$_l_ThisBatchItemReference:=$_l_ThisBatchItemReference+1
											Else 
												[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=AA_GetNextIDinMethod(->DS_l_BATCHITEMRef)
											End if 
										End if 
										DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
										
									End if 
									
								End for 
								
							Else 
								$_bo_SinSid:=False:C215
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
				UNLOAD RECORD:C212([XInvoiceAllocation:126])
				UNLOAD RECORD:C212([TRANSACTION_BATCHES:30])
				UNLOAD RECORD:C212([TRANSACTIONS:29])
				If ($_bo_Cancel)
					//CANCEL TRANSACTION
					Transact_End(False:C215)
				Else 
					Transact_End(True:C214)
					//VALIDATE TRANSACTION
				End if 
			Else 
				Transact_End(False:C215)
				//CANCEL TRANSACTION
				
			End if 
		End for 
	End if 
End if 

//USE SET("Master")
//SORT SELECTION([INVOICES]Company Code;>;[INVOICES]Invoice Date;>)
USE NAMED SELECTION:C332("$PaySel")
ERR_MethodTrackerReturn("INV_undoSel"; $_t_oldMethodName)