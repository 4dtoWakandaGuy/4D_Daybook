//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Invoices_ImpR
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 2/6/10 11:08 AM
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	C_BOOLEAN:C305($_bo_Ask; $_bo_AutoReceipt; $_bo_CashVat; $_bo_Partial; $_bo_Receipt; WIN_bo_TrackerInited)
	C_DATE:C307(<>DB_d_CurrentDate; vDate; vInvDate; vInvDate2)
	C_LONGINT:C283(<>SYS_l_CancelProcess; $_l_CurrentIndex; $_l_IndexCount; $_l_MaximumRecords; $_l_PeriodID; $_l_Process; $_l_RecordCount; $_l_TransPostStatus; $_l_WindowReferenceRow; DS_l_BATCHITEMRef; INV_isUnique)
	C_LONGINT:C283(vAdd; vIn; WIN_l_CurrentWinRef)
	C_REAL:C285($_r_Amount; $_r_Sum; $_r_VatCSAmount)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_AnalysisCode; $_t_BankAccount; $_t_ChequeNo; $_t_Comments; $_t_CompanyCode; $_t_CurrencyCode; $_t_CurrentOutputForm; $_t_DebtorsAccount; $_t_FieldDelimiter; $_t_ImportName)
	C_TEXT:C284($_t_InvoiceNumber; $_t_LayerCode; $_t_oldMethodName; $_t_Period; $_t_ReceiptNumber; $_t_RecordDelimiter; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vT; vText)
	C_TEXT:C284(WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Invoices_ImpR")
//Project Method Invoices_ImpR 26/3/2(ID 23317-17486)
//Invoices_ImpR - Receipts
$_t_CurrentOutputForm:=WIN_t_CurrentOutputform

$_l_Process:=Current process:C322
$_t_ImportName:="Import Invoices"
Start_Process
If (Invoices_File)
	If (vIn=1)
		QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=DB_GetLedgerTRANSRECpost; *)
		QUERY:C277([TRANSACTION_TYPES:31];  | ; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=DB_GetLedgerTRANSDeposit)
		If ((DB_GetLedgerTRANSRECpost#"") & (DB_GetLedgerTRANSDeposit#"") & (Records in selection:C76([TRANSACTION_TYPES:31])=2))
			vAdd:=1
			Gen_Confirm("Have you created a Receipts File in the correct Text format?"; "Yes"; "No")
			If (OK=1)
				Gen_Confirm("Do you want to auto-allocate Receipts where possible, "+"or leave them all as Deposits for later allocation?"; "Receipts"; "Deposits")
				$_bo_AutoReceipt:=(OK=1)
				If ($_bo_AutoReceipt)
					Gen_Confirm("Do you want to allow Partial matching (and negatives against postives), "+"or to only allow Perfect matching?  "+Char:C90(13)+"NB: This question is only meaningful if your import file contains "+"Invoices Nos - if not only Perfect is possible."; "Partial"; "Perfect")
					$_bo_Partial:=(OK=1)
				Else 
					$_bo_Partial:=False:C215
				End if 
				Gen_Confirm("The import will be divided into Batches if there are a large number of "+"records to import.  Do you want to be asked to "+"check the data before the final posting of each Batch?"; "Yes"; "No")
				$_bo_Ask:=(OK=1)
				OK:=1
				$_l_MaximumRecords:=0
				While ((OK=1) & (($_l_MaximumRecords<10) | ($_l_MaximumRecords>700)))
					$_l_MaximumRecords:=Num:C11(Gen_Request("Maximum records imported per Batch:"; "500"))
					If ((OK=1) & (($_l_MaximumRecords<10) | ($_l_MaximumRecords>700)))
						Gen_Alert("The maximum must be between 10 and 700")
					End if 
				End while 
				If (OK=1)
					
					OK:=1
					SET CHANNEL:C77(10; "")
					If (OK=1)
						$_l_CurrentIndex:=1
						$_l_IndexCount:=0
						While (($_l_CurrentIndex=1) & (OK=1) & (<>SYS_l_CancelProcess#$_l_Process))
							$_l_IndexCount:=$_l_IndexCount+1
							FLUSH CACHE:C297
							//  START TRANSACTION
							StartTransaction  // 13/05/02 pb
							
							READ WRITE:C146([TRANSACTION_BATCHES:30])
							CREATE RECORD:C68([TRANSACTION_BATCHES:30])
							BatchNo
							If ([TRANSACTION_BATCHES:30]Batch_Number:10=0)
								OK:=0
							Else 
								[TRANSACTION_BATCHES:30]Batch_Date:1:=<>DB_d_CurrentDate
								[TRANSACTION_BATCHES:30]Entry_Date:6:=<>DB_d_CurrentDate
								[TRANSACTION_BATCHES:30]Description:12:="Import Receipts"
								
								$_l_RecordCount:=1
								CREATE EMPTY SET:C140([INVOICES:39]; "IMaster")
								$_t_RecordDelimiter:=Char:C90(13)
								$_t_FieldDelimiter:=Char:C90(9)
								vText:="sdfsdf"
								Open_PrD_Window($_t_ImportName+" Batch "+String:C10($_l_IndexCount)+": Cmd-. to Cancel")
								While ((Length:C16(vText)>3) & (<>SYS_l_CancelProcess#$_l_Process) & ($_l_RecordCount<=$_l_MaximumRecords))
									RECEIVE PACKET:C104(vText; $_t_RecordDelimiter)
									Gen_ImpStrip
									$_t_InvoiceNumber:=First_Field(->vT; $_t_FieldDelimiter)
									$_t_CompanyCode:=First_Field(->vT; $_t_FieldDelimiter)
									vInvDate:=Date:C102(First_Field(->vT; $_t_FieldDelimiter))
									If (vInvDate<!1985-01-01!)
										vInvDate:=<>DB_d_CurrentDate
									End if 
									$_t_Period:=First_Field(->vT; $_t_FieldDelimiter)
									$_r_Amount:=Num:C11(First_Field(->vT; $_t_FieldDelimiter))
									$_t_AnalysisCode:=First_Field(->vT; $_t_FieldDelimiter)
									$_t_CurrencyCode:=First_Field(->vT; $_t_FieldDelimiter)
									$_t_LayerCode:=First_Field(->vT; $_t_FieldDelimiter)
									$_t_BankAccount:=First_Field(->vT; $_t_FieldDelimiter)
									$_t_DebtorsAccount:=First_Field(->vT; $_t_FieldDelimiter)
									$_t_Comments:=First_Field(->vT; $_t_FieldDelimiter)
									$_t_ChequeNo:=First_Field(->vT; $_t_FieldDelimiter)
									OK:=1
									
									If ((($_t_InvoiceNumber#"") | ($_t_CompanyCode#"")) & (Character code:C91(Substring:C12($_t_InvoiceNumber; Length:C16($_t_InvoiceNumber); 1))#64) & (Character code:C91(Substring:C12($_t_CompanyCode; Length:C16($_t_CompanyCode); 1))#64) & ($_t_InvoiceNumber#"Invoice N@") & ($_t_InvoiceNumber#"Inv N@"))
										If ($_r_Amount#0)
											
											$_bo_CashVat:=False:C215
											
											If ($_bo_AutoReceipt)
												If ($_t_InvoiceNumber#"")
													QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_InvoiceNumber; *)
													If ($_t_CompanyCode#"")
														QUERY:C277([INVOICES:39];  & ; [INVOICES:39]Company_Code:2=$_t_CompanyCode; *)
													End if 
													If ($_bo_Partial=False:C215)
														QUERY:C277([INVOICES:39];  & ; [INVOICES:39]Total_Due:7=$_r_Amount)
													Else 
														QUERY:C277([INVOICES:39])
													End if 
												Else 
													QUERY:C277([INVOICES:39]; [INVOICES:39]Company_Code:2=$_t_CompanyCode; *)
													QUERY:C277([INVOICES:39];  & ; [INVOICES:39]Total_Due:7=$_r_Amount)
												End if 
												$_bo_Receipt:=(Records in selection:C76([INVOICES:39])>0)
											Else 
												$_bo_Receipt:=False:C215
											End if 
											
											$_t_ReceiptNumber:=""
											If ($_bo_Receipt)
												LOAD RECORD:C52([INVOICES:39])
												If (Not:C34(Locked:C147([INVOICES:39])))
													If (([INVOICES:39]Debtors_Account:15=$_t_DebtorsAccount) | ($_t_DebtorsAccount=""))
														If (([INVOICES:39]Analysis_Code:17=$_t_AnalysisCode) | ($_t_AnalysisCode=""))
															If (([INVOICES:39]Currency_Code:27=$_t_CurrencyCode) | ($_t_CurrencyCode=""))
																If (([INVOICES:39]Layer_Code:38=$_t_LayerCode) | ($_t_LayerCode=""))
																	MESSAGE:C88("Line "+String:C10($_l_RecordCount)+": Receipt against "+[INVOICES:39]Invoice_Number:1+Char:C90(13))
																	Repeat 
																		$_t_ReceiptNumber:=Substring:C12("*R"+Gen_CodePref(15; ->[INVOICES:39]Invoice_Number:1; "*R"); 1; 11)
																		
																		SET QUERY DESTINATION:C396(3; INV_isUnique)
																		QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_ReceiptNumber)
																		SET QUERY DESTINATION:C396(0)
																	Until (INV_isUnique=0)
																	If ($_t_ReceiptNumber#"")
																		CREATE RECORD:C68([INVOICES_ALLOCATIONS:162])
																		[INVOICES_ALLOCATIONS:162]Company_Code:7:=[INVOICES:39]Company_Code:2
																		[INVOICES_ALLOCATIONS:162]INVOICES_CODE:6:=[INVOICES:39]Invoice_Number:1
																		[INVOICES_ALLOCATIONS:162]ID:5:=AA_GetNextID(->[INVOICES_ALLOCATIONS:162]ID:5)
																		
																		[INVOICES_ALLOCATIONS:162]Invoice_Number:1:=$_t_ReceiptNumber
																		[INVOICES_ALLOCATIONS:162]Date:3:=vInvDate
																		[INVOICES_ALLOCATIONS:162]Amount:2:=$_r_Amount
																		DB_SaveRecord(->[INVOICES_ALLOCATIONS:162])
																		
																		INV_AllocationCreate([INVOICES:39]Invoice_Number:1; $_t_ReceiptNumber; vInvDate; $_r_Amount; [INVOICES:39]Period_Code:13)
																		
																		$_r_Sum:=(Round:C94(INV_CalculateAllocations([INVOICES:39]Invoice_Number:1; True:C214); 2))
																		[INVOICES:39]Total_Paid:6:=Gen_Round(($_r_Sum); 2; 2)
																		[INVOICES:39]Total_Due:7:=Gen_Round(([INVOICES:39]Total_Invoiced:5-[INVOICES:39]Total_Paid:6); 2; 2)
																		
																		$_r_VatCSAmount:=0
																		If ([INVOICES:39]Cash_TAX:41)
																			If ([INVOICES:39]Cash_TAX_Due:40#0)
																				If ((($_r_Amount>=[INVOICES:39]Total_Due:7) & ([INVOICES:39]Total_Due:7>=0)) | (($_r_Amount<=[INVOICES:39]Total_Due:7) & ([INVOICES:39]Total_Due:7<0)))
																					$_r_VatCSAmount:=[INVOICES:39]Cash_TAX_Due:40
																					[INVOICES:39]Cash_TAX_Due:40:=0
																				Else 
																					$_r_VatCSAmount:=Gen_Round(([INVOICES:39]Cash_TAX_Due:40*($_r_Amount/[INVOICES:39]Total_Due:7)); 2; 2)
																					[INVOICES:39]Cash_TAX_Due:40:=Gen_Round(([INVOICES:39]Cash_TAX_Due:40-$_r_VatCSAmount); 2; 2)
																				End if 
																			End if 
																		End if 
																		
																		DB_SaveRecord(->[INVOICES:39])
																		$_t_InvoiceNumber:=[INVOICES:39]Invoice_Number:1
																		vInvDate2:=[INVOICES:39]Invoice_Date:4
																		$_t_CompanyCode:=[INVOICES:39]Company_Code:2
																		$_t_AnalysisCode:=[INVOICES:39]Analysis_Code:17
																		$_t_CurrencyCode:=[INVOICES:39]Currency_Code:27
																		$_t_LayerCode:=[INVOICES:39]Layer_Code:38
																		$_t_DebtorsAccount:=[INVOICES:39]Debtors_Account:15
																		$_bo_CashVat:=[INVOICES:39]Cash_TAX:41
																	Else 
																		MESSAGE:C88("Receipt No could not be created"+Char:C90(13))
																		$_bo_Receipt:=False:C215
																	End if 
																Else 
																	MESSAGE:C88("Line "+String:C10($_l_RecordCount)+": Deposit (Different Layer)"+Char:C90(13))
																	$_bo_Receipt:=False:C215
																End if 
															Else 
																MESSAGE:C88("Line "+String:C10($_l_RecordCount)+": Deposit (Different Currency)"+Char:C90(13))
																$_bo_Receipt:=False:C215
															End if 
														Else 
															MESSAGE:C88("Line "+String:C10($_l_RecordCount)+": Deposit (Different Analysis)"+Char:C90(13))
															$_bo_Receipt:=False:C215
														End if 
													Else 
														MESSAGE:C88("Line "+String:C10($_l_RecordCount)+": Deposit (Different Debtors Acc)"+Char:C90(13))
														$_bo_Receipt:=False:C215
													End if 
												Else 
													MESSAGE:C88("Line "+String:C10($_l_RecordCount)+": Deposit (Invoice Locked)"+Char:C90(13))
													$_bo_Receipt:=False:C215
												End if 
											Else 
												MESSAGE:C88("Line "+String:C10($_l_RecordCount)+": Deposit"+Char:C90(13))
											End if 
											
											If ($_t_CurrencyCode="")
												$_t_CurrencyCode:=<>SYS_t_BaseCurrency
											End if 
											If ($_t_LayerCode="")
												$_t_LayerCode:=DB_GetLedgerActualLayer
											End if 
											
											CREATE RECORD:C68([INVOICES:39])
											If ($_t_ReceiptNumber#"")
												[INVOICES:39]Invoice_Number:1:=$_t_ReceiptNumber
											Else 
												InvP_No
												$_t_ReceiptNumber:=[INVOICES:39]Invoice_Number:1
											End if 
											If ($_t_ReceiptNumber#"")
												[INVOICES:39]Company_Code:2:=$_t_CompanyCode
												[INVOICES:39]Invoice_Date:4:=vInvDate
												[INVOICES:39]Posted_Date:8:=<>DB_d_CurrentDate
												
												If ($_bo_Receipt)
													QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=DB_GetLedgerTRANSRECpost)
													[INVOICES:39]State:10:=-3
												Else 
													QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=DB_GetLedgerTRANSDeposit)
													[INVOICES:39]State:10:=-2
												End if 
												[INVOICES:39]Comments:12:=Replace string:C233($_t_Comments; "*"; Char:C90(13))
												[INVOICES:39]Period_Code:13:=$_t_Period
												RELATE ONE:C42([INVOICES:39]Period_Code:13)
												If ([PERIODS:33]Period_Code:1="")
													vDate:=[INVOICES:39]Invoice_Date:4
													$_l_PeriodID:=Check_Period
													[INVOICES:39]Period_Code:13:=[PERIODS:33]Period_Code:1
												End if 
												Check_PerCloseI
												[INVOICES:39]Debtors_Account:15:=$_t_DebtorsAccount
												RELATE ONE:C42([INVOICES:39]Debtors_Account:15)
												If ([ACCOUNTS:32]Account_Code:2="")
													[INVOICES:39]Debtors_Account:15:=[TRANSACTION_TYPES:31]Credit_Account:5
												End if 
												[INVOICES:39]Bank_Account:16:=$_t_BankAccount
												RELATE ONE:C42([INVOICES:39]Bank_Account:16)
												If ([ACCOUNTS:32]Account_Code:2="")
													[INVOICES:39]Bank_Account:16:=[TRANSACTION_TYPES:31]Debit_Account:4
												End if 
												[INVOICES:39]Currency_Code:27:=$_t_CurrencyCode
												[INVOICES:39]Layer_Code:38:=$_t_LayerCode
												[INVOICES:39]Cash_TAX:41:=$_bo_CashVat
												[INVOICES:39]Cheque_Number:36:=$_t_ChequeNo
												[INVOICES:39]Analysis_Code:17:=$_t_AnalysisCode
												
												If ($_bo_Receipt)
													CREATE RECORD:C68([INVOICES_ALLOCATIONS:162])
													[INVOICES_ALLOCATIONS:162]Company_Code:7:=[INVOICES:39]Company_Code:2
													[INVOICES_ALLOCATIONS:162]INVOICES_CODE:6:=[INVOICES:39]Invoice_Number:1
													[INVOICES_ALLOCATIONS:162]ID:5:=AA_GetNextID(->[INVOICES_ALLOCATIONS:162]ID:5)
													
													[INVOICES_ALLOCATIONS:162]Invoice_Number:1:=$_t_InvoiceNumber
													[INVOICES_ALLOCATIONS:162]Date:3:=vInvDate2
													[INVOICES_ALLOCATIONS:162]Amount:2:=Gen_Round($_r_Amount; 2; 2)
													DB_SaveRecord(->[INVOICES_ALLOCATIONS:162])
													
													INV_AllocationCreate([INVOICES:39]Invoice_Number:1; $_t_InvoiceNumber; vInvDate2; Gen_Round($_r_Amount; 2; 2); [INVOICES:39]Period_Code:13)
													CREATE RECORD:C68([TRANSACTION_BATCH_ITEMS:155])
													[TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31:=[TRANSACTION_BATCHES:30]Batch_Number:10
													[TRANSACTION_BATCH_ITEMS:155]ID:30:=AA_GetNextID(->[TRANSACTION_BATCH_ITEMS:155]ID:30)
													
													[TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1:=DB_GetLedgerTRANSRECpost
													If ([INVOICES:39]Analysis_Code:17#"")
														[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2:=[INVOICES:39]Analysis_Code:17
													Else 
														[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2:=[TRANSACTION_TYPES:31]Analysis_Code:7
													End if 
													[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3:=[INVOICES:39]Bank_Account:16
													[TRANSACTION_BATCH_ITEMS:155]Cheque_Number:14:=$_t_ChequeNo
													[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12:=[INVOICES:39]Debtors_Account:15
													TransB_DC
													[TRANSACTION_BATCH_ITEMS:155]Description:10:="Invoice "+[INVOICES:39]Invoice_Number:1+" Receipt"
													[TRANSACTION_BATCH_ITEMS:155]Amount:6:=Gen_Round($_r_Amount; 2; 2)
													[TRANSACTION_BATCH_ITEMS:155]Total:9:=Gen_Round($_r_Amount; 2; 2)
													
													If ([INVOICES:39]Cash_TAX:41)
														[TRANSACTION_BATCH_ITEMS:155]Credit_IO:16:="OC"
														If ($_r_VatCSAmount#0)
															[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8:=$_r_VatCSAmount
															[TRANSACTION_BATCH_ITEMS:155]Tax_Code:7:=DB_GetLedgerDefaultSalesTax
															[TRANSACTION_BATCH_ITEMS:155]Amount:6:=Gen_Round(([TRANSACTION_BATCH_ITEMS:155]Amount:6-$_r_VatCSAmount); 2; 2)
														End if 
													End if 
													
													[TRANSACTION_BATCH_ITEMS:155]Company_Code:13:=[INVOICES:39]Company_Code:2
													[TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4:=[INVOICES:39]Invoice_Number:1
													[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5:=vInvDate
													Inv_PaySel3
													[INVOICES:39]Total_Paid:6:=Gen_Round($_r_Amount; 2; 2)
													
												Else 
													[INVOICES:39]Total_Paid:6:=Gen_Round($_r_Amount; 2; 2)
													[INVOICES:39]Total_Due:7:=Gen_Round((0-$_r_Amount); 2; 2)
													Inv_DepPost2
												End if 
												If ([TRANSACTION_BATCH_ITEMS:155]BatchItemID:25=0)
													[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=AA_GetNextIDinMethod(->DS_l_BATCHITEMRef)
												End if 
												DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
												
												DB_SaveRecord(->[INVOICES:39])
												ADD TO SET:C119([INVOICES:39]; "IMaster")
												
											Else 
												MESSAGE:C88("Deposit No could not be created"+Char:C90(13))
											End if 
										Else 
											MESSAGE:C88("Line "+String:C10($_l_RecordCount)+" does not have an Amount"+Char:C90(13))
										End if 
									Else 
										MESSAGE:C88("Line "+String:C10($_l_RecordCount)+" has no Invoice No or Company Code"+Char:C90(13))
									End if 
									
									$_l_RecordCount:=$_l_RecordCount+1
									OK:=1
								End while 
								CLOSE WINDOW:C154
								If (WIN_bo_TrackerInited)
									$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
									If ($_l_WindowReferenceRow>0)
										WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
									End if 
								End if 
								If (Length:C16(vText)<=3)
									$_l_CurrentIndex:=0
								End if 
								If (<>SYS_l_CancelProcess=$_l_Process)
									OK:=0
								End if 
								
								//Checking, Printing & Processing
								USE SET:C118("IMaster")
								$_l_TransPostStatus:=0
								If ((Records in selection:C76([INVOICES:39])>0) & (OK=1))
									If ($_bo_Ask)
										Gen_Confirm("Do you want to View the Receipts and/or Deposits created in Batch "+String:C10($_l_IndexCount)+"?  "+"NB: You cannot make any changes"; "View"; "Post")
										If (OK=1)
											DB_t_CurrentFormUsage:=""
											//vNo:=Records in selection([INVOICES])
											//Open_Pro_Window ($_t_ImportName;0;1;->[INVOICES];WIN_t_CurrentOutputform)
											//FS_SetFormSort (WIN_t_CurrentOutputform)
											//WIn_SetFormSize (1;->[INVOICES];WIN_t_CurrentOutputform)
											//D`ISPLAY SELECTION([INVOICES];*)
											//Close_ProWin
											DBI_MenuSelectRecords(Table name:C256(Table:C252(->[INVOICES:39])))
										End if 
									End if 
									
									If ($_bo_Ask)
										Gen_Confirm("Please confirm that all of these Receipts and/or Deposits in Batch "+String:C10($_l_IndexCount)+" should be Posted."; "Post"; "Cancel")
									End if 
									If (OK=1)
										QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTION_BATCHES:30]Batch_Number:10)
										
										TransB_InLPTot
										DB_SaveRecord(->[TRANSACTION_BATCHES:30])
										If (OK=1)
											vAdd:=0
											
											$_l_TransPostStatus:=TransactionBatch_Post
										End if 
									End if 
								End if 
								If ($_l_TransPostStatus<0)
									Transact_End(False:C215)
									
								Else 
									Transact_End
								End if 
								If (OK=0) | ($_l_TransPostStatus<0)
									Gen_Alert("The import failed or has been Cancelled"; "Cancel")
									OK:=0
								End if 
								
							End if 
							
							If (OK=0)
								$_l_CurrentIndex:=0
							End if 
							
							FLUSH CACHE:C297
							If ($_l_CurrentIndex>0)
								DelayTicks(6000)
							End if 
						End while 
						SET CHANNEL:C77(11)
						
					End if 
				End if 
			End if 
		Else 
			Gen_Alert("Required Setups have not been completed"; "")
		End if 
	End if 
End if 
Process_End
WIN_t_CurrentOutputform:=$_t_CurrentOutputForm
ERR_MethodTrackerReturn("Invoices_ImpR"; $_t_oldMethodName)