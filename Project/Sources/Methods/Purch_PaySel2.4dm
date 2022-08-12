//%attributes = {}
If (False:C215)
	//Project Method Name:      Purch_PaySel2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 20:52
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY DATE:C224($_ad_InvoiceDates; 0)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	ARRAY REAL:C219($_ar_AnalysisAmount; 0)
	//ARRAY REAL(GEN_ar_Value;0)
	ARRAY TEXT:C222($_at_AnalysisCompany; 0)
	ARRAY TEXT:C222($_at_AnalysisUsed; 0)
	ARRAY TEXT:C222($_at_PurchasesCodes; 0)
	//ARRAY TEXT(GEN_at_Name;0)
	//ARRAY TEXT(GEN_at_RecordCode;0)
	C_BOOLEAN:C305(<>PurchPayChe; <>PurchPayRem; $_bo_SinSid; DB_bo_RecordModified; SR_bo_Validated; vMod3; WIN_bo_TrackerInited)
	C_DATE:C307(<>DB_d_CurrentDate; SRCH_d_EntryDateTo; vDate; vDelDate)
	C_LONGINT:C283($_l_ArrayRow; $_l_ArraySize; $_l_Index; $_l_Index2; $_l_Invoice2Index; $_l_InvoiceIndex; $_l_invoices2Record; $_l_Invoices2Temp; $_l_Printed; $_l_PurchaseCodeRow; $_l_RecordsInSelection)
	C_LONGINT:C283($_l_TransPostStatus; $_l_WindowReferenceRow; $_l_WindowRow; DS_l_BATCHITEMRef; INV_isUnique; r1; r2; vAdd; vSNo; WIN_l_CurrentWinRef)
	C_REAL:C285($_r_Amount; $_r_Negative; $_r_NegativeDue; $_r_Pay; $_r_Pay2; $_r_Positive; $_r_VatCSAmount; v31; v61; vPay2; vPayment)
	C_REAL:C285(vTotal)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_l_event; $_t_AnalysisCode; $_t_CompanyCode; $_t_CurrentWindowTitle; $_t_DebitAccount; $_t_DocumentName; $_t_FindAnalysis; $_t_InvoiceNumber; $_t_oldMethodName; $_t_PurchaseAmountT)
	C_TEXT:C284($_t_PurchaseCodeList; $_t_PurchaseCodeT; $_t_PurchasedateT; $_t_PurchaseInvoiceDateList; $_t_PurchaseInvoiceList; $_t_PurchaseInvoiceT; $_t_PurchaseValueList; ACC_t_CurrencyCode; vAnalysis; vBank; vChequeNo)
	C_TEXT:C284(vCompCode; vCompName; vCountry; vDesc; vLayer; vTitle; vTitle2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Purch_PaySel2")
//Project Method Purch_PaySel2 26/3/2(ID 2402-28782)

//Purch_PaySel2
SR_bo_Validated:=False:C215

QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=DB_GetLedgerTRANSPurINVPay)
If (Records in selection:C76([TRANSACTION_TYPES:31])=1)
	vBank:=[TRANSACTION_TYPES:31]Credit_Account:5
	vTotal:=Gen_Round(Sum:C1([PURCHASE_INVOICES:37]Total_Due:9); 2; 2)
	
	If (vTotal<0)  //Increase it back to 0 if the negative comes from a prepayment
		FIRST RECORD:C50([PURCHASE_INVOICES:37])
		$_r_Negative:=0
		$_r_NegativeDue:=0
		$_r_Positive:=0
		While (Not:C34(End selection:C36([PURCHASE_INVOICES:37])))
			If ([PURCHASE_INVOICES:37]Total_Due:9<0)
				If (([PURCHASE_INVOICES:37]Purchase_Code:1="*@") & ([PURCHASE_INVOICES:37]Total_Invoiced:7=0))
					$_r_NegativeDue:=Round:C94(($_r_NegativeDue+[PURCHASE_INVOICES:37]Total_Due:9); 2)
				End if 
			End if 
			NEXT RECORD:C51([PURCHASE_INVOICES:37])
		End while 
		If ($_r_NegativeDue<vTotal)
			vTotal:=0
		End if 
	End if 
	
	vTitle:="PAYMENT"
	SRCH_d_EntryDateTo:=!00-00-00!
	
	SELECTION TO ARRAY:C260([PURCHASE_INVOICES:37]Invoice_Date:5; $_ad_InvoiceDates)  //Calc the last date in those selected
	SORT ARRAY:C229($_ad_InvoiceDates; >)
	vDelDate:=$_ad_InvoiceDates{Size of array:C274($_ad_InvoiceDates)}
	
	//Check none are locked
	OK:=1
	FIRST RECORD:C50([PURCHASE_INVOICES:37])
	vCompCode:=[PURCHASE_INVOICES:37]Company_Code:2
	$_t_CompanyCode:=[PURCHASE_INVOICES:37]Company_Code:2
	RELATE ONE:C42([PURCHASE_INVOICES:37]Company_Code:2)
	vCompName:=[COMPANIES:2]Company_Name:2
	If ([PURCHASE_INVOICES:37]Analysis_Code:15#"")
		RELATE ONE:C42([PURCHASE_INVOICES:37]Analysis_Code:15)
		If ([ANALYSES:36]Bank_Account_Code:9#"")
			vBank:=[ANALYSES:36]Bank_Account_Code:9
		End if 
	End if 
	vAnalysis:=[PURCHASE_INVOICES:37]Analysis_Code:15
	vSNo:=1
	
	
	While ((Not:C34(End selection:C36([PURCHASE_INVOICES:37]))) & (OK=1))
		If (Not:C34(Check_Locked(->[PURCHASE_INVOICES:37]; 1)))
			Gen_Alert("The Purchase "+[PURCHASE_INVOICES:37]Purchase_Code:1+" is locked by another user.  The Payment cannot be posted."; "Cancel")
			OK:=0
		Else 
			RELATE ONE:C42([PURCHASE_INVOICES:37]Credit_Stage:34)
			If ([CREDIT_STAGES:54]Prevent_Payment:10)
				Gen_Alert("One or more Purchase Invoice has been allocated a "+"Credit Stage that does not allow Payment"; "Cancel")
				OK:=0
			Else 
				If ([PURCHASE_INVOICES:37]Company_Code:2#$_t_CompanyCode)
					$_t_CompanyCode:=[PURCHASE_INVOICES:37]Company_Code:2
					vSNo:=vSNo+1
					vCompCode:=""
					vCompName:=String:C10(vSNo)+" Companies"
				End if 
			End if 
		End if 
		NEXT RECORD:C51([PURCHASE_INVOICES:37])
	End while 
	
	If (OK=1)
		Gen_PayDate("P")
		If ((OK=1) & ([PERIODS:33]Period_Code:1#""))
			
			FIRST RECORD:C50([PURCHASE_INVOICES:37])
			$_r_Negative:=0
			$_r_NegativeDue:=0
			$_r_Positive:=0
			While (Not:C34(End selection:C36([PURCHASE_INVOICES:37])))
				
				If ([PURCHASE_INVOICES:37]Total_Due:9<0)
					$_r_Negative:=Round:C94(($_r_Negative+[PURCHASE_INVOICES:37]Total_Due:9); 2)
					If (([PURCHASE_INVOICES:37]Purchase_Code:1="*@") & ([PURCHASE_INVOICES:37]Total_Invoiced:7=0))
						$_r_NegativeDue:=Round:C94(($_r_NegativeDue+[PURCHASE_INVOICES:37]Total_Due:9); 2)
					End if 
				Else 
					$_r_Positive:=Round:C94(($_r_Positive+[PURCHASE_INVOICES:37]Total_Due:9); 2)
				End if 
				NEXT RECORD:C51([PURCHASE_INVOICES:37])
			End while 
			
			// If (Abs($_r_NegativeDue)>$_r_Positive)
			//  Gen_Alert ("You must select Purchase(s) as large as the Pre-Payment.";"")
			//  Else
			FIRST RECORD:C50([PURCHASE_INVOICES:37])
			$_l_Index2:=1
			$_r_Pay:=Round:C94((v31+Abs:C99($_r_Negative)); 2)
			vPay2:=0
			
			If (False:C215)  //BSW 17/02/03 Engineering new reported error 61 so $_l_Index2 am retyping these arrays
				
				//ARRAY STRING(255;GEN_at_Name;Records in selection)
				//ARRAY STRING(255;GEN_at_RecordCode;Records in selection)
			End if 
			
			ARRAY TEXT:C222(GEN_at_Name; Records in selection:C76([PURCHASE_INVOICES:37]))
			ARRAY TEXT:C222(GEN_at_RecordCode; Records in selection:C76([PURCHASE_INVOICES:37]))
			
			ARRAY REAL:C219(GEN_ar_Value; Records in selection:C76([PURCHASE_INVOICES:37]))
			While (Not:C34(End selection:C36([PURCHASE_INVOICES:37])))
				RELATE ONE:C42([PURCHASE_INVOICES:37]Company_Code:2)
				GEN_at_Name{$_l_Index2}:=Substring:C12([PURCHASE_INVOICES:37]Purchase_Invoice_Number:4+"  "+[COMPANIES:2]Company_Name:2; 1; 32)
				GEN_at_RecordCode{$_l_Index2}:=String:C10([PURCHASE_INVOICES:37]Total_Due:9; "|Accounts")
				//   If ((r1=1) | (r2=1))
				//   GEN_ar_Value{$_l_Index2}:=[PURCHASES]Total Due
				//  Else
				If (($_r_Pay>=[PURCHASE_INVOICES:37]Total_Due:9) & ([PURCHASE_INVOICES:37]Total_Due:9#0))
					GEN_ar_Value{$_l_Index2}:=Round:C94(([PURCHASE_INVOICES:37]Total_Due:9); 2)
					If ([PURCHASE_INVOICES:37]Total_Due:9>0)
						$_r_Pay:=Round:C94(($_r_Pay-[PURCHASE_INVOICES:37]Total_Due:9); 2)
					End if 
				Else 
					GEN_ar_Value{$_l_Index2}:=$_r_Pay
					$_r_Pay:=0
				End if 
				//   End if
				NEXT RECORD:C51([PURCHASE_INVOICES:37])
				
				If ((End selection:C36([PURCHASE_INVOICES:37])) & ($_r_Pay>0) & (r1=0) & (r2=0))
					GEN_ar_Value{$_l_Index2}:=Round:C94((GEN_ar_Value{$_l_Index2}+$_r_Pay); 2)
				End if 
				vPay2:=Round:C94((vPay2+GEN_ar_Value{$_l_Index2}); 2)
				$_l_Index2:=$_l_Index2+1
			End while 
			
			//Check for overallocations where Prepayments grab a large negative
			If ($_r_NegativeDue#0)
				$_r_Negative:=0
				$_l_Index:=$_l_Index2-1
				While ($_l_Index>0)
					IDLE:C311  // 7/04/03 pb
					If ((GEN_at_Name{$_l_Index}#"*@") & (GEN_ar_Value{$_l_Index}>0) & (GEN_ar_Value{$_l_Index}>Num2(GEN_at_RecordCode{$_l_Index})) & ($_l_Index>1))
						$_r_Negative:=Round:C94(($_r_Negative+(Num2(GEN_at_RecordCode{$_l_Index})-GEN_ar_Value{$_l_Index})); 2)  //num2's are 4.0.038
						GEN_ar_Value{$_l_Index}:=Num2(GEN_at_RecordCode{$_l_Index})
					End if 
					If (GEN_at_Name{$_l_Index}="*@")
						GEN_ar_Value{$_l_Index}:=Round:C94((GEN_ar_Value{$_l_Index}-$_r_Negative); 2)
						$_l_Index:=0
					End if 
					$_l_Index:=$_l_Index-1
				End while 
			End if 
			
			//  If ((r1=0) & (r2=0))
			$_r_Pay2:=99999999
			While ((OK=1) & ($_r_Pay2#v31))
				Open_Any_Window(257; 457; -1984)
				vTitle:="PAYMENTS ALLOCATION"
				vTitle2:="To be"+Char:C90(13)+"Allocated"
				DIALOG:C40([INVOICES:39]; "dAllocation")
				CLOSE WINDOW:C154
				$_r_Pay2:=vPay2
				If ((OK=1) & ($_r_Pay2#v31))
					Gen_Alert("Your allocations must equal the Payment total"; "")
				End if 
				If (WIN_bo_TrackerInited)
					$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
					If ($_l_WindowReferenceRow>0)
						WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
					End if 
				End if 
			End while 
			//   End if
			
			If (OK=1)
				Gen_Confirm("Are you ready to post the Payment?"; "Yes"; "No")
				If (OK=1)
					READ WRITE:C146([TRANSACTION_BATCHES:30])
					If (DB_GetLedgerPostBatch=False:C215)
						//  START TRANSACTION
						StartTransaction  // 13/05/02 pb
						
					End if 
					READ WRITE:C146([PURCHASE_INVOICES:37])
					READ WRITE:C146([PURCHASE_INVOICE_ALLOCATIONS:159])
					
					CREATE RECORD:C68([TRANSACTION_BATCHES:30])
					BatchNo
					$_l_TransPostStatus:=0
					If ([TRANSACTION_BATCHES:30]Batch_Number:10=0)
						OK:=0
						$_l_TransPostStatus:=-1
					Else 
						[TRANSACTION_BATCHES:30]Batch_Date:1:=vDate
						[TRANSACTION_BATCHES:30]Entry_Date:6:=<>DB_d_CurrentDate
						[TRANSACTION_BATCHES:30]Batch_Amount:3:=vPay2
						[TRANSACTION_BATCHES:30]Batch_Total:5:=vPay2
						[TRANSACTION_BATCHES:30]Description:12:="Purchase Payment: "+vDesc
						FIRST RECORD:C50([PURCHASE_INVOICES:37])
						
						$_l_Index2:=1
						//so the following line is horse manure.. Vsno=number of companies not number of POs
						ARRAY TEXT:C222($_at_PurchasesCodes; vSNo)
						$_l_PurchaseCodeRow:=1
						
						If (Records in selection:C76([PURCHASE_INVOICES:37])>1)  //if more than one will want a single-sided Bank trans
							$_bo_SinSid:=True:C214
							ARRAY TEXT:C222($_at_AnalysisUsed; 0)  //Set up arrays to store the amts for each Analysis
							ARRAY REAL:C219($_ar_AnalysisAmount; 0)
							ARRAY TEXT:C222($_at_AnalysisCompany; 0)
						Else 
							$_bo_SinSid:=False:C215
						End if 
						$_l_RecordsInSelection:=Records in selection:C76([PURCHASE_INVOICES:37])
						COPY NAMED SELECTION:C331([PURCHASE_INVOICES:37]; "$toPost")
						
						For ($_l_Invoice2Index; 1; $_l_RecordsInSelection)
							USE NAMED SELECTION:C332("$toPost")
							GOTO SELECTED RECORD:C245([PURCHASE_INVOICES:37]; $_l_invoices2Record)
							$_t_CompanyCode:=[PURCHASE_INVOICES:37]Company_Code:2
							Repeat 
								$_t_InvoiceNumber:=Substring:C12("*S"+Gen_CodePref(28; ->[PURCHASE_INVOICES:37]Purchase_Invoice_Number:4; "*S"); 1; 11)
								//$_t_InvoiceNumber:=[INVOICES]Invoice No
								SET QUERY DESTINATION:C396(3; INV_isUnique)
								QUERY:C277([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Purchase_Invoice_Number:4=$_t_InvoiceNumber)
								SET QUERY DESTINATION:C396(0)
							Until (INV_isUnique=0)
							
							$_t_PurchaseInvoiceList:=""
							$_t_PurchaseCodeList:=""
							$_t_PurchaseInvoiceDateList:=""
							$_t_PurchaseValueList:=""
							
							If (OK=1)
								
								$_t_CompanyCode:=[PURCHASE_INVOICES:37]Company_Code:2
								$_t_AnalysisCode:=[PURCHASE_INVOICES:37]Analysis_Code:15
								$_t_DebitAccount:=[TRANSACTION_TYPES:31]Debit_Account:4
								For ($_l_InvoiceIndex; $_l_invoices2Record; $_l_RecordsInSelection)
									If ($_l_InvoiceIndex<=$_l_RecordsInSelection)
										USE NAMED SELECTION:C332("$ToPost")
										GOTO SELECTED RECORD:C245([PURCHASE_INVOICES:37]; $_l_InvoiceIndex)
										If (($_t_CompanyCode=[PURCHASE_INVOICES:37]Company_Code:2))
											//While ((Not(End selection)) & (OK=1) & ($_t_CompanyCode=[PURCHASES]Company Code))
											If (Check_Locked(->[PURCHASE_INVOICES:37]; 1))
												If (GEN_ar_Value{$_l_InvoiceIndex}#0)
													If (([PURCHASE_INVOICES:37]Purchase_Code:1="*@") & ([PURCHASE_INVOICES:37]Total_Invoiced:7=0))  // & ([PURCHASES]Total Due<0))`rubbish!
														[PURCHASE_INVOICES:37]Total_Due:9:=Round:C94(([PURCHASE_INVOICES:37]Total_Due:9-GEN_ar_Value{$_l_InvoiceIndex}); 2)
														CREATE RECORD:C68([PURCHASE_INVOICE_ALLOCATIONS:159])
														[PURCHASE_INVOICE_ALLOCATIONS:159]ID:5:=AA_GetNextID(->[PURCHASE_INVOICE_ALLOCATIONS:159]ID:5)
														[PURCHASE_INVOICE_ALLOCATIONS:159]PURCHASES_INVOICE_CODE:6:=[PURCHASE_INVOICES:37]Purchase_Code:1
														[PURCHASE_INVOICE_ALLOCATIONS:159]Purchase_Invoice_Number:4:=$_t_InvoiceNumber
														[PURCHASE_INVOICE_ALLOCATIONS:159]Purchase_Code:1:=$_t_InvoiceNumber
														[PURCHASE_INVOICE_ALLOCATIONS:159]Date:3:=vDate
														[PURCHASE_INVOICE_ALLOCATIONS:159]Amount:2:=GEN_ar_Value{$_l_InvoiceIndex}
														DB_SaveRecord(->[PURCHASE_INVOICE_ALLOCATIONS:159])
														
														// [Purchases]Last Paid Date:=vDate
														$_t_PurchaseInvoiceList:=$_t_PurchaseInvoiceList+[PURCHASE_INVOICES:37]Purchase_Invoice_Number:4+Char:C90(9)
														$_t_PurchaseCodeList:=$_t_PurchaseCodeList+[PURCHASE_INVOICES:37]Purchase_Code:1+Char:C90(9)
														$_t_PurchaseInvoiceDateList:=$_t_PurchaseInvoiceDateList+String:C10([PURCHASE_INVOICES:37]Invoice_Date:5)+Char:C90(9)
														$_t_PurchaseValueList:=$_t_PurchaseValueList+String:C10(GEN_ar_Value{$_l_InvoiceIndex})+Char:C90(9)
														DB_SaveRecord(->[PURCHASE_INVOICES:37])
														CREATE RECORD:C68([TRANSACTION_BATCH_ITEMS:155])
														[TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31:=[TRANSACTION_BATCHES:30]Batch_Number:10
														[TRANSACTION_BATCH_ITEMS:155]ID:30:=AA_GetNextID(->[TRANSACTION_BATCH_ITEMS:155]ID:30)
														
														[TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1:=DB_GetLedgerTRANSPREpost
														RELATE ONE:C42([TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1)
														If (Records in selection:C76([TRANSACTION_TYPES:31])=0)
															Gen_Alert("The Pre-Payment Reconciliation Transaction Type is not correctly defined"; "Cancel")
															OK:=0
														Else 
															If ([PURCHASE_INVOICES:37]Creditors_Account:13#"")
																[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12:=[PURCHASE_INVOICES:37]Creditors_Account:13
															Else 
																[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12:=[TRANSACTION_TYPES:31]Credit_Account:5
															End if 
															[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3:=[TRANSACTION_TYPES:31]Debit_Account:4
															TransB_DC
															If (vMod3)  //If reconciling against Cash VAT Invoices
																[TRANSACTION_BATCH_ITEMS:155]Debit_IO:15:="IC"
															End if 
															[TRANSACTION_BATCH_ITEMS:155]Description:10:="Pre-Payment "+[PURCHASE_INVOICES:37]Purchase_Code:1+" Reconciliation"
															[TRANSACTION_BATCH_ITEMS:155]Amount:6:=Gen_Round((0-GEN_ar_Value{$_l_InvoiceIndex}); 2; 2)
															[TRANSACTION_BATCH_ITEMS:155]Total:9:=Gen_Round((0-GEN_ar_Value{$_l_InvoiceIndex}); 2; 2)
															If ([PURCHASE_INVOICES:37]Analysis_Code:15#"")
																[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2:=[PURCHASE_INVOICES:37]Analysis_Code:15
															Else 
																[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2:=[TRANSACTION_TYPES:31]Analysis_Code:7
															End if 
															[TRANSACTION_BATCH_ITEMS:155]Company_Code:13:=[PURCHASE_INVOICES:37]Company_Code:2
															[TRANSACTION_BATCH_ITEMS:155]Purchase_invoice_Number:17:=[PURCHASE_INVOICES:37]Purchase_Invoice_Number:4
															[TRANSACTION_BATCH_ITEMS:155]Purchase_Invoice_Code:22:=[PURCHASE_INVOICES:37]Purchase_Code:1
															[TRANSACTION_BATCH_ITEMS:155]Cheque_Number:14:=vChequeNo
															[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5:=vDate
															[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=AA_GetNextID(->[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25)
															
															
															Purch_PaySel3
															DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
														End if 
													Else 
														$_r_Amount:=GEN_ar_Value{$_l_InvoiceIndex}
														If (($_r_NegativeDue<0) & ($_r_Amount#0))  //was $_r_Amount>0 till 4.0.038
															If ($_r_Amount>=Abs:C99($_r_NegativeDue))
																$_r_Amount:=Gen_Round(($_r_Amount+$_r_NegativeDue); 2; 2)
																$_r_NegativeDue:=0
															Else 
																$_r_NegativeDue:=Gen_Round(($_r_NegativeDue+$_r_Amount); 2; 2)
																$_r_Amount:=0
															End if 
														End if 
														
														$_r_VatCSAmount:=0
														If ([PURCHASE_INVOICES:37]Cash_TAX:33)
															If ([PURCHASE_INVOICES:37]Cash_TAX_Due:32#0)
																If (((GEN_ar_Value{$_l_InvoiceIndex}>=[PURCHASE_INVOICES:37]Total_Due:9) & ([PURCHASE_INVOICES:37]Total_Due:9>=0)) | ((GEN_ar_Value{$_l_InvoiceIndex}<=[PURCHASE_INVOICES:37]Total_Due:9) & ([PURCHASE_INVOICES:37]Total_Due:9<0)))
																	$_r_VatCSAmount:=[PURCHASE_INVOICES:37]Cash_TAX_Due:32
																	[PURCHASE_INVOICES:37]Cash_TAX_Due:32:=0
																Else 
																	$_r_VatCSAmount:=Gen_Round(([PURCHASE_INVOICES:37]Cash_TAX_Due:32*(GEN_ar_Value{$_l_InvoiceIndex}/[PURCHASE_INVOICES:37]Total_Due:9)); 2; 2)
																	[PURCHASE_INVOICES:37]Cash_TAX_Due:32:=Gen_Round(([PURCHASE_INVOICES:37]Cash_TAX_Due:32-$_r_VatCSAmount); 2; 2)
																End if 
															End if 
														End if 
														
														[PURCHASE_INVOICES:37]Total_Paid:8:=Gen_Round(([PURCHASE_INVOICES:37]Total_Paid:8+GEN_ar_Value{$_l_InvoiceIndex}); 2; 2)
														[PURCHASE_INVOICES:37]Total_Due:9:=Gen_Round(([PURCHASE_INVOICES:37]Total_Due:9-GEN_ar_Value{$_l_InvoiceIndex}); 2; 2)
														CREATE RECORD:C68([PURCHASE_INVOICE_ALLOCATIONS:159])
														[PURCHASE_INVOICE_ALLOCATIONS:159]ID:5:=AA_GetNextID(->[PURCHASE_INVOICE_ALLOCATIONS:159]ID:5)
														[PURCHASE_INVOICE_ALLOCATIONS:159]PURCHASES_INVOICE_CODE:6:=[PURCHASE_INVOICES:37]Purchase_Code:1
														[PURCHASE_INVOICE_ALLOCATIONS:159]Purchase_Invoice_Number:4:=$_t_InvoiceNumber
														[PURCHASE_INVOICE_ALLOCATIONS:159]Purchase_Code:1:=$_t_InvoiceNumber
														[PURCHASE_INVOICE_ALLOCATIONS:159]Date:3:=vDate
														[PURCHASE_INVOICE_ALLOCATIONS:159]Amount:2:=GEN_ar_Value{$_l_InvoiceIndex}
														DB_SaveRecord(->[PURCHASE_INVOICE_ALLOCATIONS:159])
														
														// [Purchases]Last Paid Date:=vDate
														$_t_PurchaseInvoiceList:=$_t_PurchaseInvoiceList+[PURCHASE_INVOICES:37]Purchase_Invoice_Number:4+Char:C90(9)
														$_t_PurchaseCodeList:=$_t_PurchaseCodeList+[PURCHASE_INVOICES:37]Purchase_Code:1+Char:C90(9)
														$_t_PurchaseInvoiceDateList:=$_t_PurchaseInvoiceDateList+String:C10([PURCHASE_INVOICES:37]Invoice_Date:5)+Char:C90(9)
														$_t_PurchaseValueList:=$_t_PurchaseValueList+String:C10(GEN_ar_Value{$_l_InvoiceIndex})+Char:C90(9)
														DB_SaveRecord(->[PURCHASE_INVOICES:37])
														
														If (($_r_Amount#0) | ($_r_VatCSAmount#0))
															CREATE RECORD:C68([TRANSACTION_BATCH_ITEMS:155])
															[TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31:=[TRANSACTION_BATCHES:30]Batch_Number:10
															[TRANSACTION_BATCH_ITEMS:155]ID:30:=AA_GetNextID(->[TRANSACTION_BATCH_ITEMS:155]ID:30)
															
															[TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1:=DB_GetLedgerTRANSPurINVPay
															If ([PURCHASE_INVOICES:37]Analysis_Code:15#"")
																[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2:=[PURCHASE_INVOICES:37]Analysis_Code:15
															Else 
																[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2:=[TRANSACTION_TYPES:31]Analysis_Code:7
															End if 
															If (r1=1)
																[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12:=DB_GetLedgerExchangeControlACC
															Else 
																If (r2=1)
																Else 
																	If (($_bo_SinSid) & ($_r_Amount#0))  //If it's nought due to Cash VAT postings then make double-sided
																		If (DB_GetLedgerByCompany)
																			$_t_FindAnalysis:=[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2+(" "*(5-Length:C16([TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2)))+[PURCHASE_INVOICES:37]Company_Code:2
																		Else 
																			$_t_FindAnalysis:=[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2
																		End if 
																		$_l_ArrayRow:=Find in array:C230($_at_AnalysisUsed; $_t_FindAnalysis)
																		If ($_l_ArrayRow<1)
																			INSERT IN ARRAY:C227($_at_AnalysisUsed; 9999; 1)
																			INSERT IN ARRAY:C227($_ar_AnalysisAmount; 9999; 1)
																			INSERT IN ARRAY:C227($_at_AnalysisCompany; 9999; 1)
																			$_l_ArrayRow:=Size of array:C274($_at_AnalysisUsed)
																			$_at_AnalysisUsed{$_l_ArrayRow}:=$_t_FindAnalysis
																		End if 
																		$_ar_AnalysisAmount{$_l_ArraySize}:=Round:C94(($_ar_AnalysisAmount{$_l_ArraySize}+$_r_Amount); 2)
																		If ($_at_AnalysisCompany{$_l_ArraySize}="")
																			$_at_AnalysisCompany{$_l_ArraySize}:=[PURCHASE_INVOICES:37]Company_Code:2
																		Else 
																			If ($_at_AnalysisCompany{$_l_ArraySize}#[PURCHASE_INVOICES:37]Company_Code:2)  //Say multiple if >1 co within an Analysis
																				$_at_AnalysisCompany{$_l_ArraySize}:="Multiple"
																			End if 
																		End if 
																	Else 
																		[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12:=vBank
																	End if 
																	[TRANSACTION_BATCH_ITEMS:155]Cheque_Number:14:=vChequeNo
																End if 
															End if 
															If ([PURCHASE_INVOICES:37]Creditors_Account:13#"")
																[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3:=[PURCHASE_INVOICES:37]Creditors_Account:13
															Else 
																[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3:=[TRANSACTION_TYPES:31]Debit_Account:4
															End if 
															TransB_DC
															[TRANSACTION_BATCH_ITEMS:155]Company_Code:13:=[PURCHASE_INVOICES:37]Company_Code:2
															[TRANSACTION_BATCH_ITEMS:155]Purchase_invoice_Number:17:=[PURCHASE_INVOICES:37]Purchase_Invoice_Number:4
															[TRANSACTION_BATCH_ITEMS:155]Purchase_Invoice_Code:22:=[PURCHASE_INVOICES:37]Purchase_Code:1
															[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5:=vDate
															[TRANSACTION_BATCH_ITEMS:155]Amount:6:=$_r_Amount
															[TRANSACTION_BATCH_ITEMS:155]Total:9:=$_r_Amount
															
															If ([PURCHASE_INVOICES:37]Cash_TAX:33)
																[TRANSACTION_BATCH_ITEMS:155]Debit_IO:15:="IC"
																If ($_r_VatCSAmount#0)
																	[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8:=$_r_VatCSAmount
																	[TRANSACTION_BATCH_ITEMS:155]Tax_Code:7:=DB_GetLedgerDefaultSalesTax
																	[TRANSACTION_BATCH_ITEMS:155]Amount:6:=Gen_Round(([TRANSACTION_BATCH_ITEMS:155]Amount:6-$_r_VatCSAmount); 2; 2)
																End if 
															End if 
															[TRANSACTION_BATCH_ITEMS:155]Period_Code:11:=[PURCHASE_INVOICES:37]Period_Code:3
															[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=AA_GetNextID(->[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25)
															
															[TRANSACTION_BATCH_ITEMS:155]Description:10:="Purchase "+[PURCHASE_INVOICES:37]Purchase_Invoice_Number:4+" Payment"
															
															
															Purch_PaySel3
															DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
														End if 
													End if 
												End if 
												NEXT RECORD:C51([PURCHASE_INVOICES:37])
												$_l_Index2:=$_l_Index2+1
											Else 
												Gen_Alert("The Purchase "+[PURCHASE_INVOICES:37]Purchase_Code:1+" is locked by another user.  The Payment cannot be posted."; "Cancel")
												OK:=0
											End if 
											//End while
											$_l_Invoices2Temp:=$_l_InvoiceIndex
										Else 
											$_l_Invoices2Temp:=$_l_InvoiceIndex
										End if 
									Else 
										$_l_Invoices2Temp:=$_l_InvoiceIndex
									End if 
								End for 
								$_l_invoices2Record:=$_l_Invoices2Temp
								If (OK=1)
									CUT NAMED SELECTION:C334([PURCHASE_INVOICES:37]; "$Sel")
									CREATE RECORD:C68([PURCHASE_INVOICES:37])
									[PURCHASE_INVOICES:37]Purchase_Invoice_Number:4:=$_t_InvoiceNumber
									[PURCHASE_INVOICES:37]Purchase_Code:1:=$_t_InvoiceNumber
									[PURCHASE_INVOICES:37]State:24:=-3
									[PURCHASE_INVOICES:37]Posted_Date:12:=<>DB_d_CurrentDate
									[PURCHASE_INVOICES:37]Invoice_Date:5:=vDate
									[PURCHASE_INVOICES:37]Period_Code:3:=[PERIODS:33]Period_Code:1
									[PURCHASE_INVOICES:37]Company_Code:2:=$_t_CompanyCode
									[PURCHASE_INVOICES:37]Creditors_Account:13:=$_t_DebitAccount
									[PURCHASE_INVOICES:37]Bank_Account:14:=vBank
									[PURCHASE_INVOICES:37]Comments:16:="Payment Posting"+Char:C90(13)+("Description: "*(Num:C11(vDesc#"")))+vDesc
									If ((r1=1) | (r2=1))
										[PURCHASE_INVOICES:37]Comments:16:=[PURCHASE_INVOICES:37]Comments:16+Char:C90(13)+"Converted from "+ACC_t_CurrencyCode+" "+String:C10(vPayment; "|Accounts")
									End if 
									[PURCHASE_INVOICES:37]Cheque_Number:26:=vChequeNo
									[PURCHASE_INVOICES:37]Total_Due:9:=0
									//       [Purchases]Last Paid Date:=vDate
									[PURCHASE_INVOICES:37]Analysis_Code:15:=$_t_AnalysisCode
									[PURCHASE_INVOICES:37]Currency_Code:23:=vCountry
									If (ACC_t_CurrencyCode="")
										[PURCHASE_INVOICES:37]Currency_Code:23:=<>SYS_t_BaseCurrency
									End if 
									[PURCHASE_INVOICES:37]Layer_Code:28:=vLayer
									If (vLayer="")
										[PURCHASE_INVOICES:37]Layer_Code:28:=DB_GetLedgerActualLayer
									End if 
									If ($_t_PurchaseInvoiceList#"")
										While (($_t_PurchaseInvoiceList#"") & ($_t_PurchaseInvoiceList#" "))
											$_t_PurchaseInvoiceT:=First_Tab2($_t_PurchaseInvoiceList)
											$_t_PurchaseCodeT:=First_Tab2($_t_PurchaseCodeList)
											$_t_PurchasedateT:=First_Tab2($_t_PurchaseInvoiceDateList)
											$_t_PurchaseAmountT:=First_Tab2($_t_PurchaseValueList)
											$_t_PurchaseInvoiceList:=Substring:C12($_t_PurchaseInvoiceList; Length:C16($_t_PurchaseInvoiceT)+2; 32000)
											$_t_PurchaseCodeList:=Substring:C12($_t_PurchaseCodeList; Length:C16($_t_PurchaseCodeT)+2; 32000)
											$_t_PurchaseInvoiceDateList:=Substring:C12($_t_PurchaseInvoiceDateList; Length:C16($_t_PurchasedateT)+2; 32000)
											$_t_PurchaseValueList:=Substring:C12($_t_PurchaseValueList; Length:C16($_t_PurchaseAmountT)+2; 32000)
											If ($_t_PurchaseInvoiceT#"")
												CREATE RECORD:C68([PURCHASE_INVOICE_ALLOCATIONS:159])
												[PURCHASE_INVOICE_ALLOCATIONS:159]ID:5:=AA_GetNextID(->[PURCHASE_INVOICE_ALLOCATIONS:159]ID:5)
												[PURCHASE_INVOICE_ALLOCATIONS:159]PURCHASES_INVOICE_CODE:6:=[PURCHASE_INVOICES:37]Purchase_Code:1
												
												[PURCHASE_INVOICE_ALLOCATIONS:159]Purchase_Invoice_Number:4:=$_t_PurchaseInvoiceT
												[PURCHASE_INVOICE_ALLOCATIONS:159]Purchase_Code:1:=$_t_PurchaseCodeT
												[PURCHASE_INVOICE_ALLOCATIONS:159]Date:3:=Date:C102($_t_PurchasedateT)
												[PURCHASE_INVOICE_ALLOCATIONS:159]Amount:2:=Num:C11($_t_PurchaseAmountT)
												DB_SaveRecord(->[PURCHASE_INVOICE_ALLOCATIONS:159])
												
											End if 
										End while 
									End if 
									QUERY:C277([PURCHASE_INVOICE_ALLOCATIONS:159]; [PURCHASE_INVOICE_ALLOCATIONS:159]PURCHASES_INVOICE_CODE:6=[PURCHASE_INVOICES:37]Purchase_Code:1)
									
									[PURCHASE_INVOICES:37]Total_Paid:8:=Round:C94((Sum:C1([PURCHASE_INVOICE_ALLOCATIONS:159]Amount:2)); 2)
									
									DB_SaveRecord(->[PURCHASE_INVOICES:37])
									// ADD TO SET([PURCHASES];"Master")
									If (Size of array:C274($_at_PurchasesCodes)<$_l_PurchaseCodeRow)
										APPEND TO ARRAY:C911($_at_PurchasesCodes; [PURCHASE_INVOICES:37]Purchase_Code:1)
									Else 
										$_at_PurchasesCodes{$_l_PurchaseCodeRow}:=[PURCHASE_INVOICES:37]Purchase_Code:1
									End if 
									$_l_PurchaseCodeRow:=$_l_PurchaseCodeRow+1
									If (OK=1)
										USE NAMED SELECTION:C332("$Sel")
									End if 
								End if 
							End if 
							
						End for 
						If (OK=1)  //Post the Single Side if applicable
							If ($_bo_SinSid)
								If (Size of array:C274($_at_AnalysisUsed)>0)
									FIRST RECORD:C50([PURCHASE_INVOICES:37])
									For ($_l_Index; 1; Size of array:C274($_at_AnalysisUsed))
										If ($_ar_AnalysisAmount{$_l_Index}#0)
											CREATE RECORD:C68([TRANSACTION_BATCH_ITEMS:155])
											[TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31:=[TRANSACTION_BATCHES:30]Batch_Number:10
											[TRANSACTION_BATCH_ITEMS:155]ID:30:=AA_GetNextID(->[TRANSACTION_BATCH_ITEMS:155]ID:30)
											[TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1:=DB_GetLedgerTRANSPurINVPay
											RELATE ONE:C42([TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1)
											If (DB_GetLedgerByCompany)
												[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2:=RemoveTrail2(Substring:C12($_at_AnalysisUsed{$_l_Index}; 1; 5))
											Else 
												[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2:=$_at_AnalysisUsed{$_l_Index}
											End if 
											[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12:=vBank
											[TRANSACTION_BATCH_ITEMS:155]Cheque_Number:14:=vChequeNo
											TransB_DC
											[TRANSACTION_BATCH_ITEMS:155]Description:10:="Multiple Purchases_Payment"
											[TRANSACTION_BATCH_ITEMS:155]Amount:6:=$_ar_AnalysisAmount{$_l_Index}
											[TRANSACTION_BATCH_ITEMS:155]Total:9:=$_ar_AnalysisAmount{$_l_Index}
											[TRANSACTION_BATCH_ITEMS:155]Company_Code:13:=$_at_AnalysisCompany{$_l_Index}
											[TRANSACTION_BATCH_ITEMS:155]Purchase_invoice_Number:17:="Multiple"
											[TRANSACTION_BATCH_ITEMS:155]Purchase_Invoice_Code:22:="Multiple"
											[TRANSACTION_BATCH_ITEMS:155]Job_Code:23:=""
											[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5:=vDate
											
											Purch_PaySel3
											DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
										End if 
									End for 
								End if 
							End if 
						End if 
						
						If ((OK=1) & ((r1=1) | (r2=1)))
							FIRST RECORD:C50([PURCHASE_INVOICES:37])
							
							If (r2=1)
								CREATE RECORD:C68([TRANSACTION_BATCH_ITEMS:155])
								[TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31:=[TRANSACTION_BATCHES:30]Batch_Number:10
								[TRANSACTION_BATCH_ITEMS:155]ID:30:=AA_GetNextID(->[TRANSACTION_BATCH_ITEMS:155]ID:30)
								
								[TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1:=DB_GetLedgerTRANSPurINVPay
								RELATE ONE:C42([TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1)
								[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12:=vBank
								TransB_DC
								[TRANSACTION_BATCH_ITEMS:155]Description:10:="Bank Payment "+ACC_t_CurrencyCode+" "+String:C10(vPayment)
								[TRANSACTION_BATCH_ITEMS:155]Amount:6:=Gen_Round((v31-v61); 2; 2)
								[TRANSACTION_BATCH_ITEMS:155]Total:9:=Gen_Round((v31-v61); 2; 2)
								[TRANSACTION_BATCH_ITEMS:155]Cheque_Number:14:=vChequeNo
								[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19:=[PURCHASE_INVOICES:37]Currency_Code:23
								If ([PURCHASE_INVOICES:37]Analysis_Code:15#"")
									[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2:=[PURCHASE_INVOICES:37]Analysis_Code:15
								Else 
									[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2:=[TRANSACTION_TYPES:31]Analysis_Code:7
								End if 
								[TRANSACTION_BATCH_ITEMS:155]Purchase_invoice_Number:17:=[PURCHASE_INVOICES:37]Purchase_Invoice_Number:4
								[TRANSACTION_BATCH_ITEMS:155]Purchase_Invoice_Code:22:=[PURCHASE_INVOICES:37]Purchase_Code:1
								[TRANSACTION_BATCH_ITEMS:155]Company_Code:13:=[PURCHASE_INVOICES:37]Company_Code:2
								[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5:=vDate
								[TRANSACTION_BATCH_ITEMS:155]Period_Code:11:=[PERIODS:33]Period_Code:1
								[TRANSACTION_BATCH_ITEMS:155]Tax_Code:7:=[TRANSACTION_TYPES:31]Tax_Code:6
								[TRANSACTION_BATCH_ITEMS:155]UK_EC:18:=[PURCHASE_INVOICES:37]UK_EC:18
								If ([TRANSACTION_BATCH_ITEMS:155]UK_EC:18="")
									[TRANSACTION_BATCH_ITEMS:155]UK_EC:18:="U"
								End if 
								[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20:=[PURCHASE_INVOICES:37]Layer_Code:28
								If ([TRANSACTION_BATCH_ITEMS:155]Layer_Code:20="")
									[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20:=DB_GetLedgerActualLayer
								End if 
								If ([TRANSACTION_BATCH_ITEMS:155]BatchItemID:25=0)
									[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=AA_GetNextIDinMethod(->DS_l_BATCHITEMRef)
								End if 
								DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
							End if 
							
							CREATE RECORD:C68([TRANSACTION_BATCH_ITEMS:155])
							[TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31:=[TRANSACTION_BATCHES:30]Batch_Number:10
							[TRANSACTION_BATCH_ITEMS:155]ID:30:=AA_GetNextID(->[TRANSACTION_BATCH_ITEMS:155]ID:30)
							
							[TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1:=DB_GetLedgerTRANSPurINVPay
							RELATE ONE:C42([TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1)
							If (r1=1)
								[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12:=vBank
								[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3:=DB_GetLedgerExchangeControlACC
								TransB_DC
								[TRANSACTION_BATCH_ITEMS:155]Description:10:="Currency Adjustment"
								[TRANSACTION_BATCH_ITEMS:155]Amount:6:=vPayment
								[TRANSACTION_BATCH_ITEMS:155]Total:9:=vPayment
								[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19:=ACC_t_CurrencyCode
								[TRANSACTION_BATCH_ITEMS:155]Cheque_Number:14:=vChequeNo
							Else 
								[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12:=DB_GetLedgerExchangeACC
								TransB_DC
								[TRANSACTION_BATCH_ITEMS:155]Description:10:="Bank Charges"
								[TRANSACTION_BATCH_ITEMS:155]Amount:6:=v61
								[TRANSACTION_BATCH_ITEMS:155]Total:9:=v61
								[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19:=[PURCHASE_INVOICES:37]Currency_Code:23
							End if 
							
							If ([PURCHASE_INVOICES:37]Analysis_Code:15#"")
								[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2:=[PURCHASE_INVOICES:37]Analysis_Code:15
							Else 
								[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2:=[TRANSACTION_TYPES:31]Analysis_Code:7
							End if 
							[TRANSACTION_BATCH_ITEMS:155]Purchase_invoice_Number:17:=[PURCHASE_INVOICES:37]Purchase_Invoice_Number:4
							[TRANSACTION_BATCH_ITEMS:155]Purchase_Invoice_Code:22:=[PURCHASE_INVOICES:37]Purchase_Code:1
							[TRANSACTION_BATCH_ITEMS:155]Company_Code:13:=[PURCHASE_INVOICES:37]Company_Code:2
							[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5:=vDate
							[TRANSACTION_BATCH_ITEMS:155]Period_Code:11:=[PERIODS:33]Period_Code:1
							[TRANSACTION_BATCH_ITEMS:155]Tax_Code:7:=[TRANSACTION_TYPES:31]Tax_Code:6
							[TRANSACTION_BATCH_ITEMS:155]UK_EC:18:=[PURCHASE_INVOICES:37]UK_EC:18
							If ([TRANSACTION_BATCH_ITEMS:155]UK_EC:18="")
								[TRANSACTION_BATCH_ITEMS:155]UK_EC:18:="U"
							End if 
							[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20:=[PURCHASE_INVOICES:37]Layer_Code:28
							If ([TRANSACTION_BATCH_ITEMS:155]Layer_Code:20="")
								[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20:=DB_GetLedgerActualLayer
							End if 
							If ([TRANSACTION_BATCH_ITEMS:155]BatchItemID:25=0)
								[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=AA_GetNextIDinMethod(->DS_l_BATCHITEMRef)
							End if 
							DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
							
						End if 
						
						If ((DB_GetModuleSettingByNUM(Module_NominalLedger)>0) & (OK=1))
							DB_SaveRecord(->[TRANSACTION_BATCHES:30])
							vAdd:=0
							$_l_TransPostStatus:=TransactionBatch_Post
							UNLOAD RECORD:C212([TRANSACTION_BATCHES:30])
						End if 
					End if 
					
					If (DB_GetLedgerPostBatch)
						If (OK=1) & ($_l_TransPostStatus>=0)
							DB_bo_RecordModified:=True:C214
						Else 
							Gen_Alert("All postings made since opening the Payments screen have been Cancelled")
							CANCEL:C270
							OK:=0
						End if 
					Else 
						If ($_l_TransPostStatus>=0)
							Transact_End
						Else 
							Transact_End(False:C215)
						End if 
					End if 
					
					If (OK=1)
						If (vSNo=1)
							QUERY:C277([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Purchase_Code:1=$_at_PurchasesCodes{1})
						Else 
							QUERY WITH ARRAY:C644([PURCHASE_INVOICES:37]Purchase_Code:1; $_at_PurchasesCodes)
							If (False:C215)
								$_l_PurchaseCodeRow:=2
								While ($_l_PurchaseCodeRow<vSNo)
									QUERY:C277([PURCHASE_INVOICES:37];  | ; [PURCHASE_INVOICES:37]Purchase_Code:1=$_at_PurchasesCodes{$_l_PurchaseCodeRow}; *)
									$_l_PurchaseCodeRow:=$_l_PurchaseCodeRow+1
								End while 
								QUERY:C277([PURCHASE_INVOICES:37];  | ; [PURCHASE_INVOICES:37]Purchase_Code:1=$_at_PurchasesCodes{$_l_PurchaseCodeRow})
							End if 
						End if 
						ORDER BY:C49([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Purchase_Code:1; >)
						
						If ((DB_GetModuleSettingByNUM(Module_ChequeWriter))>1)
							If (<>PurchPayRem)
								If (Records in selection:C76([PURCHASE_INVOICES:37])>1)
									Gen_Confirm("Do you want to print Remittance Advices"; "Yes"; "No")
									If (OK=1)
										Gen_PPMulti(->[PURCHASE_INVOICES:37]; "Remittance"; "Purchases_Pay"; "Remittance"; "Remittance"; "Purch_RemLP"; 0; ->[PURCHASE_INVOICES:37]Purchase_Code:1; "Remittance"; [PURCHASE_INVOICES:37]Analysis_Code:15)
									End if 
								Else 
									Gen_Confirm("Do you want to print a Remittance Advice"; "Yes"; "No")
									If (OK=1)
										//Gen_PPSingle (->[PURCHASES];"Remittance";"Purchases_Pay";"Remittance";"Remittance  `";"Purch_RemLP";0;->[PURCHASES]Purchase Code;"Remittance";[PURCHASES]Analysis Cod  `e)
										$_t_DocumentName:="Purchases "+[PURCHASE_INVOICES:37]Purchase_Invoice_Number:4  // 05/04/04 pb
										$_t_CurrentWindowTitle:=Get window title:C450
										SET WINDOW TITLE:C213($_t_DocumentName)
										$_l_Printed:=Gen_PPSingle(->[PURCHASE_INVOICES:37]; "Remittance"; "Purchases_Pay"; "Remittance"; "Remittance"; "Purch_RemLP"; 0; ->[PURCHASE_INVOICES:37]Purchase_Code:1; "Remittance"; [PURCHASE_INVOICES:37]Analysis_Code:15; False:C215; $_t_DocumentName)
										SET WINDOW TITLE:C213($_t_CurrentWindowTitle)
									End if 
								End if 
								//  OUTPUT LAYOUT([PURCHASES];"Remittance")
								//  PRINT SELECTION([PURCHASES])
								//   OUTPUT LAYOUT([PURCHASES];"Purchases_Pay")
							End if 
						End if 
						
						If (<>PurchPayChe)
							Purchases_CheqP(Records in selection:C76([PURCHASE_INVOICES:37]); 2)
						End if 
						
					End if 
					
				End if 
			End if 
			//  End if
			
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Purch_PaySel2"; $_t_oldMethodName)