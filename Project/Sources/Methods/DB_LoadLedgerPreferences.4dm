//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_LoadLedgerPreferences
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2012 06:33
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_FromTransaction; $_bo_SavePreferences; $_bo_Unload; $1; $2; DM_bo_CreditsSequence; DM_bo_nomAllowUnProc; DM_bo_nomenforceAnalysis; DM_bo_nomLedgersBatched; DM_bo_nomLedgersRecJournal; DM_bo_nomPostatendofbatch)
	C_BOOLEAN:C305(DM_bo_nomPostbyCompany; DM_bo_nomTransinCalc; DM_bo_nomVatcash; DM_bo_SALESAllowInvoicecancel; DM_bo_SALESAllowInvoicenoPrint; DM_bo_SALESAllowInvoiceUnproc; DM_bo_SALESAllowInvoiceZero; DM_bo_SALESAllowPurchaseZero; DM_bo_SALESInvoiceAutoReceipt)
	C_DATE:C307(DM_D_SalesLEdgerStartDate)
	C_LONGINT:C283(<>PER_l_CurLoggedinDataOwnerID; $_l_LedgersData; $_l_offset; $_l_Process; $3; DB_l_CurrentOwnerRequest; DM_l_NomAgingStage1; DM_l_NomAgingStage2; DM_l_NomAgingStage3)
	C_TEXT:C284($_t_DocumentName; $_t_oldMethodName; $_t_OutputFolderPath; DM_T_BankAccBalanceAdjustments; DM_T_BankAccBalanceProfitBFWD; DM_T_BankAccBalanceProfitYTD; DM_T_BankAccCashFrom; DM_T_BankAccCashTo; DM_T_BankAccCurrencyCharges; DM_T_BankAccCurrencyExchange; DM_T_BankAccFrom)
	C_TEXT:C284(DM_T_BankAccTo; DM_T_NomActualLayer; DM_T_NomDefaultCreditStage; DM_T_NomDefaultPurchaseTax; DM_T_NomDefaultSalesTax; DM_T_NomPurchaseTerms; DM_T_NomSalesTerms; DM_T_nomTRANDepositReceipt; DM_T_nomTRANSDepositReconcile; DM_T_nomTRANSInvoicePost; DM_T_nomTRANSInvoicePrePay)
	C_TEXT:C284(DM_T_nomTRANSInvoiceReceipt; DM_T_nomTRANSPurchase; DM_T_nomTRANSPurchasePay; DM_T_nomTRANSPurchasePrePay; DM_T_nomVatCashACC; DM_T_nomVatECCreditor; DM_T_nomVatInput; DM_T_nomVatOutput)
	C_TIME:C306($_ti_DocumentRef)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_LoadLedgerPreferences")
$_bo_FromTransaction:=False:C215
If (Count parameters:C259>=2)
	$_bo_FromTransaction:=$2
End if 
If (Not:C34($_bo_FromTransaction))
	While (Semaphore:C143("LockLedgerPreferences"))
		DelayTicks(2)
	End while 
End if 
If (Count parameters:C259>=3)
	DB_l_CurrentOwnerRequest:=$3
End if 

If (Count parameters:C259>=1)
	$_bo_SavePreferences:=$1
Else 
	
	$_bo_SavePreferences:=False:C215
End if 
If (Not:C34($_bo_SavePreferences))  //note to save they must be loaded!!
	If (Application type:C494=4D Server:K5:6)
		If (Is macOS:C1572)
			
			$_t_OutputFolderPath:=DB_GetDocumentPath
			
		Else 
			
			$_t_OutputFolderPath:=DB_GetDocumentPath
			
			
		End if 
		$_t_DocumentName:=$_t_OutputFolderPath+"LoadLedgerPrefs.txt"
		
		If (Test path name:C476($_t_DocumentName)#Is a document:K24:1)
			$_ti_DocumentRef:=Create document:C266($_t_DocumentName; "TEXT")
		Else 
			$_ti_DocumentRef:=Append document:C265($_t_DocumentName; "TEXT")
		End if 
		If (DB_l_CurrentOwnerRequest>0)
			//SEND PACKET($_ti_DocumentRef;String(DB_l_CurrentOwnerRequest))
			
		Else 
			//SEND PACKET($_ti_DocumentRef;String(<>PER_l_CurLoggedinDataOwnerID))
		End if 
		//Close DocUMENT($_ti_DocumentRef)
	End if 
	
	If (Application type:C494=4D Server:K5:6)
		If (DB_l_CurrentOwnerRequest>0)
			$_l_LedgersData:=PREF_GetPreferenceID("Ledger Settings"; True:C214; DB_l_CurrentOwnerRequest)
		Else 
			$_l_LedgersData:=PREF_GetPreferenceID("Ledger Settings"; True:C214; <>PER_l_CurLoggedinDataOwnerID)
		End if 
	Else 
		$_l_LedgersData:=PREF_GetPreferenceID("Ledger Settings"; True:C214; <>PER_l_CurLoggedinDataOwnerID)
	End if 
	READ ONLY:C145([PREFERENCES:116])
	QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_LedgersData)
	If (Application type:C494=4D Server:K5:6)
		If (DB_l_CurrentOwnerRequest>0)
			SEND PACKET:C103($_ti_DocumentRef; String:C10(DB_l_CurrentOwnerRequest)+Char:C90(Tab:K15:37)+String:C10($_l_LedgersData))
			
			
			
		Else 
			SEND PACKET:C103($_ti_DocumentRef; String:C10(<>PER_l_CurLoggedinDataOwnerID)+Char:C90(Tab:K15:37)+String:C10($_l_LedgersData))
		End if 
		SEND PACKET:C103($_ti_DocumentRef; Char:C90(Tab:K15:37)+String:C10(Type:C295(DM_D_SalesLEdgerStartDate)))
		SEND PACKET:C103($_ti_DocumentRef; Char:C90(Tab:K15:37)+String:C10(Type:C295(DM_T_BankAccFrom)))
		SEND PACKET:C103($_ti_DocumentRef; Char:C90(Tab:K15:37)+String:C10(Type:C295(DM_T_BankAccTo)))
		SEND PACKET:C103($_ti_DocumentRef; Char:C90(Tab:K15:37)+String:C10(Type:C295(DM_T_BankAccCurrencyExchange)))
		SEND PACKET:C103($_ti_DocumentRef; Char:C90(Tab:K15:37)+String:C10(Type:C295(DM_T_BankAccCurrencyCharges)))
		SEND PACKET:C103($_ti_DocumentRef; Char:C90(Tab:K15:37)+String:C10(Type:C295(DM_T_BankAccBalanceAdjustments)))
		SEND PACKET:C103($_ti_DocumentRef; Char:C90(Tab:K15:37)+String:C10(Type:C295(DM_T_BankAccBalanceProfitBFWD)))
		SEND PACKET:C103($_ti_DocumentRef; Char:C90(Tab:K15:37)+String:C10(Type:C295(DM_T_BankAccBalanceProfitYTD)))
		SEND PACKET:C103($_ti_DocumentRef; Char:C90(Tab:K15:37)+String:C10(Type:C295(DM_T_BankAccCashFrom)))
		SEND PACKET:C103($_ti_DocumentRef; Char:C90(Tab:K15:37)+String:C10(Type:C295(DM_T_BankAccCashTo)))
		SEND PACKET:C103($_ti_DocumentRef; Char:C90(Tab:K15:37)+String:C10(Type:C295(DM_T_nomVatInput)))
		SEND PACKET:C103($_ti_DocumentRef; Char:C90(Tab:K15:37)+String:C10(Type:C295(DM_bo_CreditsSequence)))
		SEND PACKET:C103($_ti_DocumentRef; Char:C90(Tab:K15:37)+String:C10(Type:C295(DM_T_NomActualLayer)))
		SEND PACKET:C103($_ti_DocumentRef; Char:C90(Tab:K15:37)+String:C10(Type:C295(DM_T_NomSalesTerms)))
		SEND PACKET:C103($_ti_DocumentRef; Char:C90(Tab:K15:37)+String:C10(Type:C295(DM_T_NomPurchaseTerms)))
		SEND PACKET:C103($_ti_DocumentRef; Char:C90(Tab:K15:37)+String:C10(Type:C295(DM_T_NomDefaultCreditStage)))
		SEND PACKET:C103($_ti_DocumentRef; Char:C90(Tab:K15:37)+String:C10(Type:C295(DM_l_NomAgingStage1)))
		SEND PACKET:C103($_ti_DocumentRef; Char:C90(Tab:K15:37)+String:C10(Type:C295(DM_l_NomAgingStage2)))
		SEND PACKET:C103($_ti_DocumentRef; Char:C90(Tab:K15:37)+String:C10(Type:C295(DM_l_NomAgingStage3)))
		SEND PACKET:C103($_ti_DocumentRef; Char:C90(Tab:K15:37)+String:C10(Type:C295(DM_T_NomDefaultPurchaseTax)))
		SEND PACKET:C103($_ti_DocumentRef; Char:C90(Tab:K15:37)+String:C10(Type:C295(DM_T_NomDefaultSalesTax)))
		SEND PACKET:C103($_ti_DocumentRef; Char:C90(Tab:K15:37)+String:C10(Type:C295(DM_bo_nomVatcash)))
		SEND PACKET:C103($_ti_DocumentRef; Char:C90(Tab:K15:37)+String:C10(Type:C295(DM_T_nomVatCashACC)))
		SEND PACKET:C103($_ti_DocumentRef; Char:C90(Tab:K15:37)+String:C10(Type:C295(DM_T_nomVatECCreditor)))
		SEND PACKET:C103($_ti_DocumentRef; Char:C90(Tab:K15:37)+String:C10(Type:C295(DM_T_nomTRANSDepositReconcile)))
		SEND PACKET:C103($_ti_DocumentRef; Char:C90(Tab:K15:37)+String:C10(Type:C295(DM_T_nomTRANDepositReceipt)))
		SEND PACKET:C103($_ti_DocumentRef; Char:C90(Tab:K15:37)+String:C10(Type:C295(DM_T_nomTRANSInvoicePost)))
		SEND PACKET:C103($_ti_DocumentRef; Char:C90(Tab:K15:37)+String:C10(Type:C295(DM_T_nomTRANSInvoiceReceipt)))
		SEND PACKET:C103($_ti_DocumentRef; Char:C90(Tab:K15:37)+String:C10(Type:C295(DM_T_nomTRANSInvoicePrePay)))
		SEND PACKET:C103($_ti_DocumentRef; Char:C90(Tab:K15:37)+String:C10(Type:C295(DM_T_nomTRANSPurchasePrePay)))
		SEND PACKET:C103($_ti_DocumentRef; Char:C90(Tab:K15:37)+String:C10(Type:C295(DM_T_nomTRANSPurchase)))
		SEND PACKET:C103($_ti_DocumentRef; Char:C90(Tab:K15:37)+String:C10(Type:C295(DM_T_nomTRANSPurchasePay)))
		SEND PACKET:C103($_ti_DocumentRef; Char:C90(Tab:K15:37)+String:C10(Type:C295(DM_bo_SALESAllowPurchaseZero)))
		SEND PACKET:C103($_ti_DocumentRef; Char:C90(Tab:K15:37)+String:C10(Type:C295(DM_bo_nomLedgersBatched)))
		SEND PACKET:C103($_ti_DocumentRef; Char:C90(Tab:K15:37)+String:C10(Type:C295(DM_bo_nomLedgersRecJournal)))
		SEND PACKET:C103($_ti_DocumentRef; Char:C90(Tab:K15:37)+String:C10(Type:C295(DM_bo_nomAllowUnProc)))
		SEND PACKET:C103($_ti_DocumentRef; Char:C90(Tab:K15:37)+String:C10(Type:C295(DM_bo_nomPostatendofbatch)))
		SEND PACKET:C103($_ti_DocumentRef; Char:C90(Tab:K15:37)+String:C10(Type:C295(DM_bo_nomPostbyCompany)))
		SEND PACKET:C103($_ti_DocumentRef; Char:C90(Tab:K15:37)+String:C10(Type:C295(DM_bo_nomenforceAnalysis)))
		SEND PACKET:C103($_ti_DocumentRef; Char:C90(Tab:K15:37)+String:C10(Type:C295(DM_bo_nomTransinCalc)))
		SEND PACKET:C103($_ti_DocumentRef; Char:C90(Tab:K15:37)+String:C10(Type:C295(DM_bo_SALESAllowInvoiceZero)))
		SEND PACKET:C103($_ti_DocumentRef; Char:C90(Tab:K15:37)+String:C10(Type:C295(DM_bo_SALESAllowInvoicecancel)))
		SEND PACKET:C103($_ti_DocumentRef; Char:C90(Tab:K15:37)+String:C10(Type:C295(DM_bo_SALESAllowInvoicenoPrint)))
		SEND PACKET:C103($_ti_DocumentRef; Char:C90(Tab:K15:37)+String:C10(Type:C295(DM_bo_SALESAllowInvoiceUnproc)))
		SEND PACKET:C103($_ti_DocumentRef; Char:C90(Tab:K15:37)+String:C10(Type:C295(DM_bo_SALESInvoiceAutoReceipt)))
		SEND PACKET:C103($_ti_DocumentRef; Char:C90(Tab:K15:37)+String:C10(BLOB size:C605([PREFERENCES:116]DataBlob:2)))
		SEND PACKET:C103($_ti_DocumentRef; Char:C90(13))
		
		
		CLOSE DOCUMENT:C267($_ti_DocumentRef)
	End if 
	
	
	
	If (Records in selection:C76([PREFERENCES:116])=0)
		If (In transaction:C397)
			//If we are in a transaction and creating this record we must do that outside the transaction
			If (Application type:C494=4D Server:K5:6)
				If (DB_l_CurrentOwnerRequest>0)
					$_l_Process:=New process:C317("DB_LoadLedgerPreferences"; DB_ProcessMemoryinit(4); "Load Ledger Preferences"; False:C215; True:C214; DB_l_CurrentOwnerRequest)
				Else 
					$_l_Process:=New process:C317("DB_LoadLedgerPreferences"; DB_ProcessMemoryinit(4); "Load Ledger Preferences"; False:C215; True:C214)
				End if 
			Else 
				$_l_Process:=New process:C317("DB_LoadLedgerPreferences"; DB_ProcessMemoryinit(4); "Load Ledger Preferences"; False:C215; True:C214)
			End if 
			
			While (Process state:C330($_l_Process)>=0)
				DelayTicks(5)
			End while 
		Else 
			$_bo_Unload:=(Records in selection:C76([USER:15])=0)
			If (Records in selection:C76([USER:15])>1)
				If (Application type:C494=4D Server:K5:6)
					If (DB_l_CurrentOwnerRequest>0)
						QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=DB_l_CurrentOwnerRequest)  //this should not ever happen actually
					Else 
						QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=<>PER_l_CurLoggedinDataOwnerID)
					End if 
				Else 
					
					QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=<>PER_l_CurLoggedinDataOwnerID)
				End if 
			Else 
				ALL RECORDS:C47([USER:15])
				
			End if 
			
			DM_D_SalesLEdgerStartDate:=[USER:15]SL New Date:154
			DM_T_BankAccFrom:=[USER:15]Bank From:15
			DM_T_BankAccTo:=[USER:15]Bank To:16
			DM_T_BankAccCurrencyExchange:=[USER:15]Exch Contr Acc:186
			DM_T_BankAccCurrencyCharges:=[USER:15]Bank ExCh Acc:187
			DM_T_BankAccBalanceAdjustments:=[USER:15]BS Profit Adj:225
			DM_T_BankAccBalanceProfitBFWD:=[USER:15]BS Profit BFWD:29
			DM_T_BankAccBalanceProfitYTD:=[USER:15]BS Profit YTD:26
			DM_T_BankAccCashFrom:=[USER:15]Cash From:17
			DM_T_BankAccCashTo:=[USER:15]Cash To:18
			DM_T_nomVatInput:=[USER:15]VAT Input:19
			DM_T_nomVatOutput:=[USER:15]VAT Output:20
			DM_bo_CreditsSequence:=[USER:15]Credit Note Sep:118
			DM_T_NomActualLayer:=[USER:15]Actual Layer:146
			DM_T_NomSalesTerms:=[USER:15]Default Terms:113
			DM_T_NomPurchaseTerms:=[USER:15]Default Terms:113
			DM_T_NomDefaultCreditStage:=[USER:15]Def Cred Stage:90
			DM_l_NomAgingStage1:=[USER:15]AD 1:34
			DM_l_NomAgingStage2:=[USER:15]AD 2:35
			DM_l_NomAgingStage3:=[USER:15]AD 3:36
			DM_T_NomDefaultPurchaseTax:=[USER:15]Def Purch Tax:131
			DM_T_NomDefaultSalesTax:=[USER:15]Def VAT Code:91
			DM_bo_nomVatcash:=[USER:15]VAT Cash:212
			DM_T_nomVatCashACC:=[USER:15]VAT CashAcc:211
			DM_T_nomVatECCreditor:=[USER:15]VAT EC Creditor:75
			DM_T_nomTRANSDepositReconcile:=[USER:15]Deposit Rec:60  //Replaces <>DepRTrans
			DM_T_nomTRANDepositReceipt:=[USER:15]Deposit Trans:59
			DM_T_nomTRANSInvoicePost:=[USER:15]Invoice Trans:21
			DM_T_nomTRANSInvoiceReceipt:=[USER:15]InvoiceP Trans:24
			DM_T_nomTRANSInvoicePrePay:=[USER:15]PrePay Rec:62
			DM_T_nomTRANSPurchasePrePay:=[USER:15]PrePay Trans:61
			DM_T_nomTRANSPurchase:=[USER:15]Purch Trans:27
			DM_T_nomTRANSPurchasePay:=[USER:15]PurchP Trans:28
			DM_bo_SALESAllowPurchaseZero:=[USER:15]Zero Invoices:169  //``... note this is being split so seperate vals can be set for p n i
			DM_bo_nomLedgersBatched:=[USER:15]NL LedgerBat:190  //²  //Post all transaction via batches...
			
			DM_bo_nomLedgersRecJournal:=[USER:15]NL Rec Jour:163
			DM_bo_nomAllowUnProc:=[USER:15]NL Unproc:188
			DM_bo_nomPostatendofbatch:=[USER:15]PayRec Batch:213  //`??????
			DM_bo_nomPostbyCompany:=[USER:15]PayRec ByCo:205
			DM_bo_nomenforceAnalysis:=[USER:15]PL Analysis:227
			
			
			DM_bo_nomTransinCalc:=[USER:15]TransIn Calc:145
			DM_bo_SALESAllowInvoiceZero:=[USER:15]Zero Invoices:169
			DM_bo_SALESAllowInvoicecancel:=[USER:15]Invoices Cancel:72
			DM_bo_SALESAllowInvoicenoPrint:=[USER:15]Invoices NoPrin:132
			DM_bo_SALESAllowInvoiceUnproc:=[USER:15]Invoices Unproc:71
			DM_bo_SALESInvoiceAutoReceipt:=[USER:15]Invoices PayAft:133
			
			
			
			
			If ($_bo_Unload)
				UNLOAD RECORD:C212([USER:15])
			End if 
			
			CREATE RECORD:C68([PREFERENCES:116])
			[PREFERENCES:116]IDNumber:1:=$_l_LedgersData
			If (Application type:C494=4D Server:K5:6)
				If (DB_l_CurrentOwnerRequest>0)
					[PREFERENCES:116]Preference_DataID:7:=DB_l_CurrentOwnerRequest
				Else 
					[PREFERENCES:116]Preference_DataID:7:=<>PER_l_CurLoggedinDataOwnerID
				End if 
			Else 
				
				[PREFERENCES:116]Preference_DataID:7:=<>PER_l_CurLoggedinDataOwnerID
			End if 
			VARIABLE TO BLOB:C532(DM_D_SalesLEdgerStartDate; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_BankAccFrom; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_BankAccTo; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_BankAccCurrencyExchange; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_BankAccCurrencyCharges; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_BankAccBalanceAdjustments; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_BankAccBalanceProfitBFWD; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_BankAccBalanceProfitYTD; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_BankAccCashFrom; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_BankAccCashTo; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_nomVatInput; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_nomVatOutput; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_bo_CreditsSequence; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_NomActualLayer; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_NomSalesTerms; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_NomPurchaseTerms; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_NomDefaultCreditStage; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_l_NomAgingStage1; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_l_NomAgingStage2; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_l_NomAgingStage3; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_NomDefaultPurchaseTax; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_NomDefaultSalesTax; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_bo_nomVatcash; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_nomVatCashACC; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_nomVatECCreditor; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_nomTRANSDepositReconcile; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_nomTRANDepositReceipt; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_nomTRANSInvoicePost; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_nomTRANSInvoiceReceipt; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_nomTRANSInvoicePrePay; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_nomTRANSPurchasePrePay; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_nomTRANSPurchase; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_nomTRANSPurchasePay; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_bo_SALESAllowPurchaseZero; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_bo_nomLedgersBatched; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_bo_nomLedgersRecJournal; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_bo_nomAllowUnProc; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_bo_nomPostatendofbatch; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_bo_nomPostbyCompany; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_bo_nomenforceAnalysis; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_bo_nomTransinCalc; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_bo_SALESAllowInvoiceZero; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_bo_SALESAllowInvoicecancel; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_bo_SALESAllowInvoicenoPrint; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_bo_SALESAllowInvoiceUnproc; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_bo_SALESInvoiceAutoReceipt; [PREFERENCES:116]DataBlob:2; *)
			DB_SaveRecord(->[PREFERENCES:116])
			UNLOAD RECORD:C212([PREFERENCES:116])
			READ ONLY:C145([PREFERENCES:116])
			
		End if 
	Else 
		$_l_offset:=0
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_D_SalesLEdgerStartDate; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_T_BankAccFrom; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_T_BankAccTo; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_T_BankAccCurrencyExchange; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_T_BankAccCurrencyCharges; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_T_BankAccBalanceAdjustments; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_T_BankAccBalanceProfitBFWD; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_T_BankAccBalanceProfitYTD; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_T_BankAccCashFrom; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_T_BankAccCashTo; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_T_nomVatInput; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_T_nomVatOutput; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_bo_CreditsSequence; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_T_NomActualLayer; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_T_NomSalesTerms; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_T_NomPurchaseTerms; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_T_NomDefaultCreditStage; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_l_NomAgingStage1; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_l_NomAgingStage2; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_l_NomAgingStage3; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_T_NomDefaultPurchaseTax; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_T_NomDefaultSalesTax; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_bo_nomVatcash; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_T_nomVatCashACC; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_T_nomVatECCreditor; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_T_nomTRANSDepositReconcile; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_T_nomTRANDepositReceipt; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_T_nomTRANSInvoicePost; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_T_nomTRANSInvoiceReceipt; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_T_nomTRANSInvoicePrePay; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_T_nomTRANSPurchasePrePay; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_T_nomTRANSPurchase; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_T_nomTRANSPurchasePay; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_bo_SALESAllowPurchaseZero; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_bo_nomLedgersBatched; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_bo_nomLedgersRecJournal; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_bo_nomAllowUnProc; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_bo_nomPostatendofbatch; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_bo_nomPostbyCompany; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_bo_nomenforceAnalysis; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_bo_nomTransinCalc; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_bo_SALESAllowInvoiceZero; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_bo_SALESAllowInvoicecancel; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_bo_SALESAllowInvoicenoPrint; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_bo_SALESAllowInvoiceUnproc; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_bo_SALESInvoiceAutoReceipt; $_l_offset)
	End if 
	
Else 
	If ($_bo_SavePreferences)
		If (In transaction:C397)
			//If we are in a transaction and creating or saving this record we must do that outside the transaction
			If (Application type:C494=4D Server:K5:6)
				If (DB_l_CurrentOwnerRequest>0)
					$_l_Process:=New process:C317("DB_LoadLedgerPreferences"; DB_ProcessMemoryinit(4); "Save Ledger Preferences"; True:C214; True:C214; DB_l_CurrentOwnerRequest)
				Else 
					$_l_Process:=New process:C317("DB_LoadLedgerPreferences"; DB_ProcessMemoryinit(4); "Save Ledger Preferences"; True:C214; True:C214)
				End if 
			Else 
				$_l_Process:=New process:C317("DB_LoadLedgerPreferences"; DB_ProcessMemoryinit(4); "Save Ledger Preferences"; True:C214; True:C214)
			End if 
			
			While (Process state:C330($_l_Process)>=0)
				DelayTicks(5)
			End while 
		Else 
			//note they must be loaded to save them
			
			If (Application type:C494=4D Server:K5:6)
				If (DB_l_CurrentOwnerRequest>0)
					$_l_LedgersData:=PREF_GetPreferenceID("Ledger Settings"; True:C214; DB_l_CurrentOwnerRequest)
				Else 
					$_l_LedgersData:=PREF_GetPreferenceID("Ledger Settings"; True:C214; <>PER_l_CurLoggedinDataOwnerID)
				End if 
			Else 
				$_l_LedgersData:=PREF_GetPreferenceID("Ledger Settings"; True:C214; <>PER_l_CurLoggedinDataOwnerID)
			End if 
			
			//QUERY([PREFERENCES];[PREFERENCES]IDNumber=$_l_LedgersData)
			//TRACE
			//$_bo_OK:=Check_Locked (->[PREFERENCES];1)
			READ WRITE:C146([PREFERENCES:116])
			QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_LedgersData)
			If (Records in selection:C76([PREFERENCES:116])=0)
				CREATE RECORD:C68([PREFERENCES:116])
				[PREFERENCES:116]IDNumber:1:=$_l_LedgersData
				If (Application type:C494=4D Server:K5:6)
					If (DB_l_CurrentOwnerRequest>0)
						[PREFERENCES:116]Preference_DataID:7:=DB_l_CurrentOwnerRequest
					Else 
						[PREFERENCES:116]Preference_DataID:7:=<>PER_l_CurLoggedinDataOwnerID
					End if 
				Else 
					
					[PREFERENCES:116]Preference_DataID:7:=<>PER_l_CurLoggedinDataOwnerID
				End if 
			End if 
			SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
			VARIABLE TO BLOB:C532(DM_D_SalesLEdgerStartDate; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_BankAccFrom; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_BankAccTo; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_BankAccCurrencyExchange; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_BankAccCurrencyCharges; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_BankAccBalanceAdjustments; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_BankAccBalanceProfitBFWD; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_BankAccBalanceProfitYTD; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_BankAccCashFrom; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_BankAccCashTo; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_nomVatInput; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_nomVatOutput; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_bo_CreditsSequence; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_NomActualLayer; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_NomSalesTerms; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_NomPurchaseTerms; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_NomDefaultCreditStage; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_l_NomAgingStage1; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_l_NomAgingStage2; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_l_NomAgingStage3; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_NomDefaultPurchaseTax; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_NomDefaultSalesTax; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_bo_nomVatcash; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_nomVatCashACC; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_nomVatECCreditor; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_nomTRANSDepositReconcile; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_nomTRANDepositReceipt; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_nomTRANSInvoicePost; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_nomTRANSInvoiceReceipt; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_nomTRANSInvoicePrePay; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_nomTRANSPurchasePrePay; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_nomTRANSPurchase; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_T_nomTRANSPurchasePay; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_bo_SALESAllowPurchaseZero; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_bo_nomLedgersBatched; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_bo_nomLedgersRecJournal; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_bo_nomAllowUnProc; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_bo_nomPostatendofbatch; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_bo_nomPostbyCompany; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_bo_nomenforceAnalysis; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_bo_nomTransinCalc; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_bo_SALESAllowInvoiceZero; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_bo_SALESAllowInvoicecancel; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_bo_SALESAllowInvoicenoPrint; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_bo_SALESAllowInvoiceUnproc; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_bo_SALESInvoiceAutoReceipt; [PREFERENCES:116]DataBlob:2; *)
			DB_SaveRecord(->[PREFERENCES:116])
			UNLOAD RECORD:C212([PREFERENCES:116])
			READ ONLY:C145([PREFERENCES:116])
			
		End if 
	End if 
End if 
If (Not:C34($_bo_FromTransaction))
	CLEAR SEMAPHORE:C144("LockLedgerPreferences")
End if 
ERR_MethodTrackerReturn("DB_LoadLedgerPreferences"; $_t_oldMethodName)