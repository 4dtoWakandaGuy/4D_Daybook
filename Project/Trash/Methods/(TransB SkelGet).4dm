//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      TransB SkelGet
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/01/2010 16:42
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_CopyPreviousDate; $_bo_Reverse; ACC_bo_ConsilidatedView; DB_bo_RecordModified)
	C_DATE:C307(<>DB_d_CurrentDate; $_d_BatchDate; vDate)
	C_LONGINT:C283($_l_BatchNumber; $_l_BatchNumberOLD; $_l_BatchNumberSearch; $_l_BatchState; $_l_DuplicateIndex; $_l_PeriodID; $_l_RecordNumber; $_l_RecordsinSelection; DS_l_BATCHITEMRef)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_oldMethodName; $_t_Text)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("TransB SkelGet")
//TransB SkelGet
Menu_Record("TransB SkelGet"; "Copy Previous Batch")
OK:=1
If ([TRANSACTION_BATCHES:30]State:15>0)
	Gen_Alert("This Function can only be used for Unprocessed Transactions"; "Cancel")
Else 
	
	If (Records in selection:C76([TRANSACTION_BATCH_ITEMS:155])>0)
		Gen_Confirm("This Copy Previous Function will delete current Transaction lines. Is this OK?"; ""; "")
	End if 
	If (OK=1)
		$_l_BatchNumberSearch:=Num:C11(Gen_Request("Batch No to Copy:"))
		If (OK=1)
			If ([TRANSACTION_BATCHES:30]Batch_Number:10=0)
				BatchNo
			End if 
			$_l_BatchNumber:=[TRANSACTION_BATCHES:30]Batch_Number:10
			$_d_BatchDate:=[TRANSACTION_BATCHES:30]Batch_Date:1
			$_l_BatchState:=[TRANSACTION_BATCHES:30]State:15
			DB_SaveRecord(->[TRANSACTION_BATCHES:30])
			COPY NAMED SELECTION:C331([TRANSACTION_BATCHES:30]; "$Sel")
			QUERY:C277([TRANSACTION_BATCHES:30]; [TRANSACTION_BATCHES:30]Batch_Number:10=$_l_BatchNumberSearch)
			If (Records in selection:C76([TRANSACTION_BATCHES:30])>0)
				$_l_RecordNumber:=Record number:C243([TRANSACTION_BATCHES:30])
				USE NAMED SELECTION:C332("$Sel")
				GOTO RECORD:C242([TRANSACTION_BATCHES:30]; $_l_RecordNumber)
				$_t_Text:=""
				QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTION_BATCHES:30]Batch_Number:10)
				
				
				While ((Not:C34(End selection:C36([TRANSACTION_BATCH_ITEMS:155]))) & ($_t_Text=""))
					If ([TRANSACTION_TYPES:31]Transaction_Type_Code:1#[TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1)
						RELATE ONE:C42([TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1)
					End if 
					If ([TRANSACTION_TYPES:31]No_NL_Postings:23)
						$_t_Text:="Transaction Type "+[TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1
					End if 
					If ([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3#"")
						If ([ACCOUNTS:32]Account_Code:2#[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3)
							RELATE ONE:C42([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3)
						End if 
						If ([ACCOUNTS:32]No_NL_Postings:9)
							$_t_Text:="Account "+[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3
						End if 
					End if 
					If ([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12#"")
						If ([ACCOUNTS:32]Account_Code:2#[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12)
							RELATE ONE:C42([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12)
						End if 
						If ([ACCOUNTS:32]No_NL_Postings:9)
							$_t_Text:="Account "+[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12
						End if 
					End if 
					NEXT RECORD:C51([TRANSACTION_BATCH_ITEMS:155])
				End while 
				If ($_t_Text="")
					USE NAMED SELECTION:C332("$Sel")
					DELETE RECORD:C58([TRANSACTION_BATCHES:30])
					GOTO RECORD:C242([TRANSACTION_BATCHES:30]; $_l_RecordNumber)
					Gen_Confirm("Do you want to reverse the amounts"+Char:C90(13)+"(ie cancel out a previous posting) ?"; "Same"; "Reverse")
					If (OK=1)
						$_bo_Reverse:=False:C215
					Else 
						$_bo_Reverse:=True:C214
					End if 
					vDate:=!00-00-00!
					DUPLICATE RECORD:C225([TRANSACTION_BATCHES:30])
					
					$_l_BatchNumberOLD:=[TRANSACTION_BATCHES:30]Batch_Number:10
					[TRANSACTION_BATCHES:30]Batch_Number:10:=$_l_BatchNumber
					[TRANSACTION_BATCHES:30]Entry_Date:6:=<>DB_d_CurrentDate
					[TRANSACTION_BATCHES:30]State:15:=$_l_BatchState
					[TRANSACTION_BATCHES:30]Posted_Date:16:=!00-00-00!
					If (<>SYS_bo_CopyPreviousDate=False:C215)
						[TRANSACTION_BATCHES:30]Batch_Date:1:=$_d_BatchDate
					End if 
					If ($_bo_Reverse)
						[TRANSACTION_BATCHES:30]Description:12:="Reversal of Batch "+String:C10($_l_BatchNumberSearch)+Char:C90(13)+[TRANSACTION_BATCHES:30]Description:12
					Else 
						[TRANSACTION_BATCHES:30]Description:12:="Template: Batch "+String:C10($_l_BatchNumberSearch)+Char:C90(13)+[TRANSACTION_BATCHES:30]Description:12
					End if 
					
					If (<>SYS_bo_CopyPreviousDate=False:C215)
						vDate:=$_d_BatchDate
						$_l_PeriodID:=Check_Period
						Check_PerClose
					End if 
					QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=$_l_BatchNumberOLD)
					CREATE SET:C116([TRANSACTION_BATCH_ITEMS:155]; "$DupSet")
					$_l_RecordsinSelection:=Records in selection:C76([TRANSACTION_BATCH_ITEMS:155])
					For ($_l_DuplicateIndex; 1; $_l_RecordsinSelection)
						USE SET:C118("$DupSet")
						GOTO SELECTED RECORD:C245([TRANSACTION_BATCH_ITEMS:155]; $_l_DuplicateIndex)
						DUPLICATE RECORD:C225([TRANSACTION_BATCH_ITEMS:155])
						[TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31:=[TRANSACTION_BATCHES:30]Batch_Number:10
						[TRANSACTION_BATCH_ITEMS:155]ID:30:=AA_GetNextID(->[TRANSACTION_BATCH_ITEMS:155]ID:30)
						[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=AA_GetNextIDinMethod(->DS_l_BATCHITEMRef)
						[TRANSACTION_BATCH_ITEMS:155]CreditTransID:26:=0
						[TRANSACTION_BATCH_ITEMS:155]DebitTransID:27:=0
						If (<>SYS_bo_CopyPreviousDate)
							If (vDate#[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5)
								vDate:=[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5
								RELATE ONE:C42([TRANSACTION_BATCH_ITEMS:155]Period_Code:11)
								If ([PERIODS:33]Period_Code:1="")
									[TRANSACTION_BATCH_ITEMS:155]Period_Code:11:=Periods_ConvCal([TRANSACTION_BATCH_ITEMS:155]Period_Code:11)
									RELATE ONE:C42([TRANSACTION_BATCH_ITEMS:155]Period_Code:11)
								End if 
								Check_PerClose
							End if 
							[TRANSACTION_BATCH_ITEMS:155]Period_Code:11:=[PERIODS:33]Period_Code:1
						Else 
							[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5:=$_d_BatchDate
							[TRANSACTION_BATCH_ITEMS:155]Period_Code:11:=[PERIODS:33]Period_Code:1
						End if 
						If ($_bo_Reverse)
							TransB_LineRev
						End if 
						If ([TRANSACTION_BATCH_ITEMS:155]Currency_Code:19="")
							[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19:=<>SYS_t_BaseCurrency
						End if 
						If ([TRANSACTION_BATCH_ITEMS:155]Layer_Code:20="")
							[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20:=DB_GetLedgerActualLayer
						End if 
						
						DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
					End for 
					If (False:C215)  // all moved to the above
						While (Not:C34(End selection:C36([TRANSACTION_BATCH_ITEMS:155])))
							If (<>SYS_bo_CopyPreviousDate)
								If (vDate#[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5)
									vDate:=[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5
									RELATE ONE:C42([TRANSACTION_BATCH_ITEMS:155]Period_Code:11)
									If ([PERIODS:33]Period_Code:1="")
										[TRANSACTION_BATCH_ITEMS:155]Period_Code:11:=Periods_ConvCal([TRANSACTION_BATCH_ITEMS:155]Period_Code:11)
										RELATE ONE:C42([TRANSACTION_BATCH_ITEMS:155]Period_Code:11)
									End if 
									Check_PerClose
								End if 
								[TRANSACTION_BATCH_ITEMS:155]Period_Code:11:=[PERIODS:33]Period_Code:1
							Else 
								[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5:=$_d_BatchDate
								[TRANSACTION_BATCH_ITEMS:155]Period_Code:11:=[PERIODS:33]Period_Code:1
							End if 
							If ($_bo_Reverse)
								TransB_LineRev
							End if 
							If ([TRANSACTION_BATCH_ITEMS:155]Currency_Code:19="")
								[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19:=<>SYS_t_BaseCurrency
							End if 
							If ([TRANSACTION_BATCH_ITEMS:155]Layer_Code:20="")
								[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20:=DB_GetLedgerActualLayer
							End if 
							If ([TRANSACTION_BATCH_ITEMS:155]BatchItemID:25=0)
								[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=AA_GetNextIDinMethod(->DS_l_BATCHITEMRef)
							End if 
							DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
							NEXT RECORD:C51([TRANSACTION_BATCH_ITEMS:155])
						End while 
					End if 
					
				Else 
					Gen_Alert("That Batch cannot be copied since it uses "+$_t_Text+", the posting of which is not allowed in the "+Term_NLWT("Nominal")+" Ledger"; "Cancel")
					USE NAMED SELECTION:C332("$Sel")
				End if 
			Else 
				Gen_Alert("Transaction Batch not found"; "Cancel")
				USE NAMED SELECTION:C332("$Sel")
			End if 
			QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTION_BATCHES:30]Batch_Number:10)
			CLEAR NAMED SELECTION:C333("$Sel")
			If (Screen width:C187>800)
				// If (Size of array(ACC_aptr_Transaction)>0)
				//   TransB_InLPß ("S")
				//  End if
				ACC_TransLoadSubitems(ACC_bo_ConsilidatedView)
			End if 
			
		End if 
	End if 
	DB_bo_RecordModified:=True:C214
End if 
ERR_MethodTrackerReturn("TransB SkelGet"; $_t_oldMethodName)
