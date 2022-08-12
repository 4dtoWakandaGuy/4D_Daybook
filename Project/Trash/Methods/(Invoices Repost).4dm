//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Invoices Repost
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/02/2010 16:48
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(<>DB_d_CurrentDate; vDate; vInvDate)
	C_LONGINT:C283($_l_PeriodID; $_l_TransPostStatus; vBatchNo; vRe)
	C_REAL:C285(vSubtotal; vTotal; vVAT)
	C_TEXT:C284($_t_InvoiceDateString; $_t_LastWord; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vInvNo; vNumber)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Invoices Repost")
//Invoices Repost
Start_Process
If (Invoices_File)
	vInvNo:=Gen_Request("Invoice No to repost:")
	If (OK=1)
		QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=vInvNo)
		If (Records in selection:C76([INVOICES:39])=1)
			If ([INVOICES:39]Total_Invoiced:5#0)
				Gen_Confirm("This will clear the Invoiced amount & repost it."; ""; "")
				If (OK=1)
					vBatchNo:=Num:C11(Gen_Request("Batch No to repost"))
					If (OK=1)
						QUERY:C277([TRANSACTION_BATCHES:30]; [TRANSACTION_BATCHES:30]Batch_Number:10=vBatchNo)
						$_t_LastWord:=Substring:C12(LastWord2([TRANSACTION_BATCHES:30]Description:12); 1; 11)
						If ($_t_LastWord=[INVOICES:39]Invoice_Number:1)
							
							Inv_InvCalc
							If (vTotal=0)
								Gen_Alert("There is nothing to Invoice on Invoice "+[INVOICES:39]Invoice_Number:1; "Cancel")
							Else 
								OK:=1
								If (OK=1)
									vRe:=0
									vInvDate:=!00-00-00!
									While ((vInvDate=!00-00-00!) & (OK=1))
										$_t_InvoiceDateString:=String:C10([INVOICES:39]Invoice_Date:4)
										vInvDate:=Date:C102(Gen_Request("Invoice Date:"; $_t_InvoiceDateString))
										vDate:=vInvDate
										$_l_PeriodID:=Check_Period
										Check_PerClose
									End while 
									If (OK=1)
										Inv_InvCalc
										FORM SET OUTPUT:C54([INVOICES:39]; "Form")
										DB_t_CurrentFormUsage:="Invoice"
										Open_Pro_Window("Repost Invoice")
										PRINT SELECTION:C60([INVOICES:39])
										Close_ProWin
										READ WRITE:C146([TRANSACTION_BATCHES:30])
										READ WRITE:C146([TRANSACTIONS:29])
										
										FIRST RECORD:C50([INVOICES:39])
										If ((DB_t_CurrentFormUsage="Invoice") & (OK=1) & (vRe=0))
											Gen_Confirm("Was Invoice "+vNumber+" printed OK?  Repost the Amounts?"; "Yes"; "No")
											If (OK=1)
												StartTransaction
												QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Batch_Number:7=[TRANSACTION_BATCHES:30]Batch_Number:10)
												FIRST RECORD:C50([TRANSACTIONS:29])
												While (Not:C34(End selection:C36([TRANSACTIONS:29])))
													[TRANSACTIONS:29]Amount:6:=0-[TRANSACTIONS:29]Amount:6
													[TRANSACTIONS:29]Tax_Amount:16:=0-[TRANSACTIONS:29]Tax_Amount:16
													[TRANSACTIONS:29]Total:17:=0-[TRANSACTIONS:29]Total:17
													DB_SaveRecord(->[TRANSACTIONS:29])
													AA_CheckFileUnlocked(->[TRANSACTIONS:29]Transaction_ID:31)
													Post_Balances
													NEXT RECORD:C51([TRANSACTIONS:29])
												End while 
												DELETE SELECTION:C66([TRANSACTIONS:29])
												QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTION_BATCHES:30]Batch_Number:10)
												
												While (Not:C34(End selection:C36([TRANSACTION_BATCH_ITEMS:155])))
													DELETE RECORD:C58([TRANSACTION_BATCH_ITEMS:155])
													QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTION_BATCHES:30]Batch_Number:10)
													
												End while 
												
												[INVOICES:39]Invoice_Date:4:=vInvDate
												[INVOICES:39]Total_Invoiced_Excluding_Tax:26:=vSubtotal
												[INVOICES:39]Total_Tax:35:=vVAT
												[INVOICES:39]Total_Invoiced:5:=vTotal
												[INVOICES:39]Total_Due:7:=Gen_Round(([INVOICES:39]Total_Invoiced:5-[INVOICES:39]Total_Paid:6); 2; 2)
												If (DB_GetLedgerCashvatACC#"")
													[INVOICES:39]Cash_TAX:41:=True:C214
													[INVOICES:39]Cash_TAX_Due:40:=[INVOICES:39]Total_Tax:35
												End if 
												[TRANSACTION_BATCHES:30]Batch_Date:1:=vInvDate
												[TRANSACTION_BATCHES:30]Entry_Date:6:=<>DB_d_CurrentDate
												QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=DB_GetLedgerTRANSINVpost)
												
												Inv_InvPostP
												DB_SaveRecord(->[INVOICES:39])
												
												[TRANSACTION_BATCHES:30]Batch_Amount:3:=vSubtotal
												[TRANSACTION_BATCHES:30]Batch_Tax:4:=vVAT
												[TRANSACTION_BATCHES:30]Batch_Total:5:=vTotal
												DB_SaveRecord(->[TRANSACTION_BATCHES:30])
												$_l_TransPostStatus:=TransactionBatch_Post
												If ($_l_TransPostStatus>=0)
													//VALIDATE TRANSACTION
													Transact_End(True:C214)
												Else 
													Gen_Alert("The Posting of  invoice"+[INVOICES:39]Invoice_Number:1+"  has been cancelled!")
													Transact_End(False:C215)
													
													//CANCEL TRANSACTION
												End if 
											End if 
										End if 
									End if 
								End if 
							End if 
							
						Else 
							Gen_Alert("That Batch no wasn't for that Invoice"; "Cancel")
						End if 
					End if 
				End if 
			Else 
				Gen_Alert("That Invoice has not been Printed"; "Cancel")
			End if 
		End if 
	End if 
End if 
Process_End
ERR_MethodTrackerReturn("Invoices Repost"; $_t_oldMethodName)