//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_SaveOldPrefstoNew
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/01/2013 12:14
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DM_bo_CreditsSequence; DM_bo_nomAllowUnProc; DM_bo_nomenforceAnalysis; DM_bo_nomLedgersBatched; DM_bo_nomLedgersRecJournal; DM_bo_nomPostatendofbatch; DM_bo_nomPostbyCompany; DM_bo_nomTransinCalc; DM_bo_nomVatcash; DM_bo_SALESAllowInvoicecancel; DM_bo_SALESAllowInvoicenoPrint)
	C_BOOLEAN:C305(DM_bo_SALESAllowInvoiceUnproc; DM_bo_SALESAllowInvoiceZero; DM_bo_SALESAllowPurchaseZero; DM_bo_SALESInvoiceAutoReceipt)
	C_DATE:C307(DM_D_SalesLEdgerStartDate)
	C_LONGINT:C283(DM_l_NomAgingStage1; DM_l_NomAgingStage2; DM_l_NomAgingStage3)
	C_TEXT:C284($_t_oldMethodName; DM_T_BankAccBalanceAdjustments; DM_T_BankAccBalanceProfitBFWD; DM_T_BankAccBalanceProfitYTD; DM_T_BankAccCashFrom; DM_T_BankAccCashTo; DM_T_BankAccCurrencyCharges; DM_T_BankAccCurrencyExchange; DM_T_BankAccFrom; DM_T_BankAccTo; DM_T_NomActualLayer)
	C_TEXT:C284(DM_T_NomDefaultCreditStage; DM_T_NomDefaultPurchaseTax; DM_T_NomDefaultSalesTax; DM_T_NomPurchaseTerms; DM_T_NomSalesTerms; DM_T_nomTRANDepositReceipt; DM_T_nomTRANSInvoicePost; DM_T_nomTRANSInvoicePrePay; DM_T_nomTRANSInvoiceReceipt; DM_T_nomTRANSPurchase; DM_T_nomTRANSPurchasePay)
	C_TEXT:C284(DM_T_nomTRANSPurchasePrePay; DM_T_nomVatCashACC; DM_T_nomVatECCreditor; DM_T_nomVatInput; DM_T_nomVatOutput)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_SaveOldPrefstoNew")

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
DM_bo_SALESAllowPurchaseZero:=[USER:15]Zero Invoices:169
DM_bo_nomLedgersBatched:=[USER:15]NL LedgerBat:190
DM_bo_nomLedgersRecJournal:=[USER:15]NL Rec Jour:163
DM_bo_nomAllowUnProc:=[USER:15]NL Unproc:188
DM_bo_nomPostatendofbatch:=[USER:15]PayRec Batch:213
DM_bo_nomPostbyCompany:=[USER:15]PayRec ByCo:205
DM_bo_nomenforceAnalysis:=[USER:15]PL Analysis:227
DM_bo_nomTransinCalc:=[USER:15]TransIn Calc:145
DM_bo_SALESAllowInvoiceZero:=[USER:15]Zero Invoices:169
DM_bo_SALESAllowInvoicecancel:=[USER:15]Invoices Cancel:72
DM_bo_SALESAllowInvoicenoPrint:=[USER:15]Invoices NoPrin:132
DM_bo_SALESAllowInvoiceUnproc:=[USER:15]Invoices Unproc:71
DM_bo_SALESInvoiceAutoReceipt:=[USER:15]Invoices PayAft:133

//TRACE
DB_SaveLedgerPreferences(True:C214)

DB_SaveProductCodePreferences(True:C214)
ERR_MethodTrackerReturn("DB_SaveOldPrefstoNew"; $_t_oldMethodName)