//%attributes = {}
If (False:C215)
	//Project Method Name:      Standing_Check
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/04/2010 12:42
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_JournalIDS; 0)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283($_l_AddMode; $_l_BatchItemIndex; $_l_RecordsinSelection; $_l_TransinBatchNumber; $_l_TransPostStatus; $0; DS_l_BATCHITEMRef; Vadd; vNo)
	C_REAL:C285($VAT)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_CurrentOutputform; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Standing_Check")
//Standing_Check
$_t_CurrentOutputform:=WIN_t_CurrentOutputform
$0:=0
If ((DB_GetModuleSettingByNUM(Module_NominalLedger)=2) | (DB_GetModuleSettingByNUM(Module_NominalLedger)=4))
	//Standing_File
	QUERY:C277([REC_JOURNALS_DATES:160]; [REC_JOURNALS_DATES:160]Posting_Date:1<=<>DB_d_CurrentDate)
	SELECTION TO ARRAY:C260([REC_JOURNALS_DATES:160]REC_JOURNALS_CODE:4; $_al_JournalIDS)
	QUERY WITH ARRAY:C644([RECURRING_JOURNALS:38]x_ID:15; $_al_JournalIDS)
	
	vNo:=Records in selection:C76([RECURRING_JOURNALS:38])
	If (vNo>0)
		READ WRITE:C146([RECURRING_JOURNALS:38])
		Gen_Confirm("There "+Plural_Single("are"; vNo)+" "+String:C10(vNo)+" Recurring Journal"+Plural_Single("s"; vNo)+" to process.  Do you want to see "+Plural_Single("them"; vNo)+"?"; "Yes"; "No")
		If (OK=1)
			//DB_t_CurrentFormUsage:="Select"
			//Userset_Empty (->[REC JOURNALS])
			//vNo:=Records in selection([REC JOURNALS])
			//Open_Pro_Window ("Select Recurring Journals to Process";0;1;->[REC JOURNALS];WIN_t_CurrentOutputform)
			//FS_SetFormSort (WIN_t_CurrentOutputform)
			//WIn_SetFormSize (1;->[REC JOURNALS];WIN_t_CurrentOutputform)
			//D`ISPLAY SELECTION([REC JOURNALS];*)
			
			DBI_MenuSelectRecords(Table name:C256(Table:C252(->[RECURRING_JOURNALS:38])))
			
			If (Records in selection:C76([RECURRING_JOURNALS:38])>0)
				vNo:=Records in selection:C76([RECURRING_JOURNALS:38])
				If (vNo>0)
					Gen_Confirm("Process "+String:C10(vNo)+" Recurring Journal"+Plural_Single("s"; vNo)+"?"; "Yes"; "No")
					If (OK=1)
						//  START TRANSACTION
						StartTransaction  // 13/05/02 pb
						
						OK:=1
						COPY NAMED SELECTION:C331([RECURRING_JOURNALS:38]; "$Sel")
						QUERY SELECTION:C341([RECURRING_JOURNALS:38]; [RECURRING_JOURNALS:38]Copy_Batch:13#0)
						If (Records in selection:C76([RECURRING_JOURNALS:38])>0)
							FIRST RECORD:C50([RECURRING_JOURNALS:38])
							While ((Not:C34(End selection:C36([RECURRING_JOURNALS:38]))) & (OK=1))
								If (Check_LockMess(->[RECURRING_JOURNALS:38]; "Recurring Journal"))
									Standing_Check1
									If ([REC_JOURNALS_DATES:160]Posting_Date:1>!1980-01-01!)
										Standing_Check2
										If ((Records in selection:C76([PERIODS:33])=1) & (OK=1))
											QUERY:C277([TRANSACTION_BATCHES:30]; [TRANSACTION_BATCHES:30]Batch_Number:10=[RECURRING_JOURNALS:38]Copy_Batch:13)
											If (Records in selection:C76([TRANSACTION_BATCHES:30])>0)
												$_l_TransPostStatus:=0
												//START TRANSACTION
												StartTransaction
												READ WRITE:C146([TRANSACTION_BATCHES:30])
												READ WRITE:C146([TRANSACTION_BATCH_ITEMS:155])
												DUPLICATE RECORD:C225([TRANSACTION_BATCHES:30])
												$_l_TransinBatchNumber:=[TRANSACTION_BATCHES:30]Batch_Number:10
												BatchNo
												If (OK=1)
													[TRANSACTION_BATCHES:30]Batch_Date:1:=<>DB_d_CurrentDate
													[TRANSACTION_BATCHES:30]Entry_Date:6:=<>DB_d_CurrentDate
													[TRANSACTION_BATCHES:30]Description:12:="Recurring Journals Batch"+Char:C90(13)+[RECURRING_JOURNALS:38]Description:5
													QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=$_l_TransinBatchNumber)
													CREATE SET:C116([TRANSACTION_BATCH_ITEMS:155]; "$OLD")
													$_l_RecordsinSelection:=Records in selection:C76([TRANSACTION_BATCH_ITEMS:155])
													For ($_l_BatchItemIndex; 1; $_l_RecordsinSelection)
														USE SET:C118("$OLD")
														GOTO SELECTED RECORD:C245([TRANSACTION_BATCH_ITEMS:155]; $_l_BatchItemIndex)
														DUPLICATE RECORD:C225([TRANSACTION_BATCH_ITEMS:155])
														[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=0
														[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=AA_GetNextIDinMethod(->DS_l_BATCHITEMRef)
														[TRANSACTION_BATCH_ITEMS:155]ID:30:=0
														[TRANSACTION_BATCH_ITEMS:155]ID:30:=AA_GetNextID(->[TRANSACTION_BATCH_ITEMS:155]ID:30)
														[TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31:=[TRANSACTION_BATCHES:30]Batch_Number:10
														DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
														
													End for 
													QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTION_BATCHES:30]Batch_Number:10)
													FIRST RECORD:C50([TRANSACTION_BATCH_ITEMS:155])
													While (Not:C34(End selection:C36([TRANSACTION_BATCH_ITEMS:155])))
														[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=AA_GetNextIDinMethod(->DS_l_BATCHITEMRef)
														[TRANSACTION_BATCH_ITEMS:155]CreditTransID:26:=0
														[TRANSACTION_BATCH_ITEMS:155]DebitTransID:27:=0
														[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5:=[REC_JOURNALS_DATES:160]Posting_Date:1
														[TRANSACTION_BATCH_ITEMS:155]Period_Code:11:=[PERIODS:33]Period_Code:1
														If ([TRANSACTION_BATCH_ITEMS:155]Description:10#"RJ:@")
															[TRANSACTION_BATCH_ITEMS:155]Description:10:="RJ: "+[TRANSACTION_BATCH_ITEMS:155]Description:10
														End if 
														If ([RECURRING_JOURNALS:38]Reverse:14)
															TransB_LineRev
														End if 
														DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
														NEXT RECORD:C51([TRANSACTION_BATCH_ITEMS:155])
													End while 
													DB_SaveRecord(->[TRANSACTION_BATCHES:30])
													If (OK=1)
														Standing_Check3
														If (OK=1)
															$_l_AddMode:=Vadd
															vAdd:=1
															$_l_TransPostStatus:=TransactionBatch_Post
															Vadd:=$_l_AddMode
														End if 
													End if 
													
												End if 
												If ($_l_TransPostStatus>=0)
													//VALIDATE TRANSACTION
													Transact_End(True:C214)
												Else 
													//CANCEL TRANSACTION
													Transact_End(False:C215)
													Gen_Alert("The creation of the recurring journal entry has been cancelled")
													
												End if 
											Else 
												Gen_Alert("Batch No "+String:C10([RECURRING_JOURNALS:38]Copy_Batch:13)+" not found")
											End if 
										End if 
									End if 
								End if 
								NEXT RECORD:C51([RECURRING_JOURNALS:38])
							End while 
						End if 
						
						USE NAMED SELECTION:C332("$Sel")
						CLEAR NAMED SELECTION:C333("$Sel")
						If (OK=1)
							QUERY SELECTION:C341([RECURRING_JOURNALS:38]; [RECURRING_JOURNALS:38]Copy_Batch:13=0)
							If (Records in selection:C76([RECURRING_JOURNALS:38])>0)
								CREATE RECORD:C68([TRANSACTION_BATCHES:30])
								BatchNo
								If (OK=1)
									[TRANSACTION_BATCHES:30]Batch_Date:1:=<>DB_d_CurrentDate
									[TRANSACTION_BATCHES:30]Entry_Date:6:=<>DB_d_CurrentDate
									[TRANSACTION_BATCHES:30]Description:12:="Recurring Journals Batch"+Char:C90(13)+[RECURRING_JOURNALS:38]Description:5
									FIRST RECORD:C50([RECURRING_JOURNALS:38])
									While ((Not:C34(End selection:C36([RECURRING_JOURNALS:38]))) & (OK=1))
										If (Check_LockMess(->[RECURRING_JOURNALS:38]; "Recurring Journal"))
											Standing_Check1
											
											If ([REC_JOURNALS_DATES:160]Posting_Date:1>!1980-01-01!)
												Standing_Check2
												If ((Records in selection:C76([PERIODS:33])=1) & (OK=1))
													
													CREATE RECORD:C68([TRANSACTION_BATCH_ITEMS:155])
													[TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31:=[TRANSACTION_BATCHES:30]Batch_Number:10
													[TRANSACTION_BATCH_ITEMS:155]ID:30:=AA_GetNextID(->[TRANSACTION_BATCH_ITEMS:155]ID:30)
													[TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1:=[RECURRING_JOURNALS:38]Transaction_Type_Code:2
													RELATE ONE:C42([TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1)
													[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3:=[TRANSACTION_TYPES:31]Debit_Account:4
													[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12:=[TRANSACTION_TYPES:31]Credit_Account:5
													TransB_DC
													[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2:=[TRANSACTION_TYPES:31]Analysis_Code:7
													[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5:=[REC_JOURNALS_DATES:160]Posting_Date:1
													[TRANSACTION_BATCH_ITEMS:155]Period_Code:11:=[PERIODS:33]Period_Code:1
													If ([REC_JOURNALS_DATES:160]Amount:2=0)
														[TRANSACTION_BATCH_ITEMS:155]Amount:6:=[RECURRING_JOURNALS:38]Amount:6
													Else 
														[TRANSACTION_BATCH_ITEMS:155]Amount:6:=[REC_JOURNALS_DATES:160]Amount:2
													End if 
													[TRANSACTION_BATCHES:30]Batch_Amount:3:=[TRANSACTION_BATCHES:30]Batch_Amount:3+[TRANSACTION_BATCH_ITEMS:155]Amount:6
													[TRANSACTION_BATCH_ITEMS:155]Tax_Code:7:=[TRANSACTION_TYPES:31]Tax_Code:6
													RELATE ONE:C42([TRANSACTION_BATCH_ITEMS:155]Tax_Code:7)
													$VAT:=[TAX_CODES:35]Tax_Rate:3/100
													[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8:=Round:C94(([TRANSACTION_BATCH_ITEMS:155]Amount:6*$VAT); 2)
													[TRANSACTION_BATCHES:30]Batch_Tax:4:=[TRANSACTION_BATCHES:30]Batch_Tax:4+[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8
													[TRANSACTION_BATCH_ITEMS:155]Total:9:=Round:C94(([TRANSACTION_BATCH_ITEMS:155]Amount:6+[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8); 2)
													[TRANSACTION_BATCHES:30]Batch_Total:5:=[TRANSACTION_BATCHES:30]Batch_Total:5+[TRANSACTION_BATCH_ITEMS:155]Total:9
													[TRANSACTION_BATCH_ITEMS:155]Description:10:="RJ: "+[TRANSACTION_TYPES:31]Transaction_Type_Name:2
													[TRANSACTION_BATCH_ITEMS:155]Company_Code:13:=[RECURRING_JOURNALS:38]Company_Code:1
													[TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4:=[RECURRING_JOURNALS:38]Invoice_Number:9
													[TRANSACTION_BATCH_ITEMS:155]Purchase_invoice_Number:17:=[RECURRING_JOURNALS:38]Purchase_Invoice_Number:10
													If ([RECURRING_JOURNALS:38]Currency_Code:11#"")
														[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19:=[RECURRING_JOURNALS:38]Currency_Code:11
													Else 
														[RECURRING_JOURNALS:38]Currency_Code:11:=<>SYS_t_BaseCurrency
													End if 
													If ([RECURRING_JOURNALS:38]Invoice_Number:9#"")
														RELATE ONE:C42([RECURRING_JOURNALS:38]Invoice_Number:9)
														[TRANSACTION_BATCH_ITEMS:155]UK_EC:18:=[INVOICES:39]UK_EC:21
													Else 
														If ([RECURRING_JOURNALS:38]Purchase_Invoice_Number:10#"")
															RELATE ONE:C42([RECURRING_JOURNALS:38]Purchase_Invoice_Number:10)
															[TRANSACTION_BATCH_ITEMS:155]UK_EC:18:=[PURCHASE_INVOICES:37]UK_EC:18
														Else 
															[TRANSACTION_BATCH_ITEMS:155]UK_EC:18:="U"
														End if 
													End if 
													If ([TRANSACTION_BATCH_ITEMS:155]BatchItemID:25=0)
														[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=AA_GetNextIDinMethod(->DS_l_BATCHITEMRef)
													End if 
													DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
													
													Standing_Check3
												End if 
												
											Else 
												Gen_Confirm("Recurring Journal "+[RECURRING_JOURNALS:38]Transaction_Type_Code:2+" contains a nonsensical date"; "Skip it"; "Cancel all")
											End if 
										End if 
										NEXT RECORD:C51([RECURRING_JOURNALS:38])
									End while 
									QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTION_BATCHES:30]Batch_Number:10)
									If (Records in selection:C76([TRANSACTION_BATCH_ITEMS:155])=0)
										OK:=0
									End if 
									If (OK=1)
										DB_SaveRecord(->[TRANSACTION_BATCHES:30])
										If (OK=1)
											vAdd:=1
											$_l_TransPostStatus:=TransactionBatch_Post
										End if 
									End if 
								End if 
							End if 
						End if 
						Transact_End
						$0:=OK
					End if 
				End if 
			End if 
			Close_ProWin
		End if 
	End if 
End if 
UNLOAD RECORD:C212([RECURRING_JOURNALS:38])
vAdd:=0
DB_t_CurrentFormUsage:=""
WIN_t_CurrentOutputform:=$_t_CurrentOutputform
ERR_MethodTrackerReturn("Standing_Check"; $_t_oldMethodName)
