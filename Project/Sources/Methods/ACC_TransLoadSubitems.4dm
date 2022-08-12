//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_TransLoadSubitems
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
	//ARRAY DATE(ACC_ad_aTransDate2;0)
	//ARRAY DATE(ACC_ad_BatchItemTransDate;0)
	//ARRAY LONGINT(ACC_al_BatchitemCompanion;0;0)
	//ARRAY LONGINT(ACC_al_BatchItemCreditID;0)
	//ARRAY LONGINT(ACC_al_BatchItemDebitID;0)
	//ARRAY LONGINT(ACC_al_BatchItemDelete;0)
	//ARRAY LONGINT(ACC_al_BatchItemID;0)
	//ARRAY REAL(ACC_ar_BatchItemAmounts;0)
	//ARRAY REAL(ACC_ar_BatchItemCreditAmount2;0)
	//ARRAY REAL(ACC_ar_BatchItemDebitAmount2;0)
	//ARRAY REAL(ACC_ar_BatchItemSecondAmt;0)
	//ARRAY REAL(ACC_ar_BatchItemTaxAmt;0)
	//ARRAY REAL(ACC_ar_BatchItemTotal;0)
	//ARRAY TEXT(ACC_at_AccountNames2;0)
	//ARRAY TEXT(ACC_at_AnalysisNames;0)
	//ARRAY TEXT(ACC_at_AnalysisNames2;0)
	//ARRAY TEXT(ACC_at_BatchItemAnalysisCode;0)
	//ARRAY TEXT(ACC_at_BatchItemAnalysisCode2;0)
	//ARRAY TEXT(ACC_at_BatchItemChequeNo;0)
	//ARRAY TEXT(ACC_at_BatchItemChequeNo2;0)
	//ARRAY TEXT(ACC_at_BatchItemCoCode;0)
	//ARRAY TEXT(ACC_at_BatchItemConstructIdent;0)
	//ARRAY TEXT(ACC_at_BatchItemCreditAcc;0)
	//ARRAY TEXT(ACC_at_BatchItemCreditIO;0)
	//ARRAY TEXT(ACC_at_BatchItemCurrencyCode;0)
	//ARRAY TEXT(ACC_at_BatchItemCurrencyCode2;0)
	//ARRAY TEXT(ACC_at_BatchItemDebitAcc;0)
	//ARRAY TEXT(ACC_at_BatchItemDebitIO;0)
	//ARRAY TEXT(ACC_at_BatchItemDescription;0)
	//ARRAY TEXT(ACC_at_BatchItemInvoiceNo;0)
	//ARRAY TEXT(ACC_at_BatchItemJobCode;0)
	//ARRAY TEXT(ACC_at_BatchItemlayerCode;0)
	//ARRAY TEXT(ACC_at_BatchItemLayerCode2;0)
	//ARRAY TEXT(ACC_at_BatchItemPeriodCode;0)
	//ARRAY TEXT(ACC_at_BatchItemPurchCode;0)
	//ARRAY TEXT(ACC_at_BatchItemPurchCode2;0)
	//ARRAY TEXT(ACC_at_BatchItemPurchinvno;0)
	//ARRAY TEXT(ACC_at_BatchItemTaxCode;0)
	//ARRAY TEXT(ACC_at_BatchItemTaxUKEC;0)
	//ARRAY TEXT(ACC_at_BatchItemTransCode2;0)
	//ARRAY TEXT(ACC_at_BatchItemTransTypeCode;0)
	//ARRAY TEXT(ACC_at_CompanyNames;0)
	//ARRAY TEXT(ACC_at_CompanyNames2;0)
	//ARRAY TEXT(ACC_at_CreditAccountNames;0)
	//ARRAY TEXT(ACC_at_CURRENCYNAME;0)
	//ARRAY TEXT(ACC_at_CURRENCYNAME2;0)
	//ARRAY TEXT(ACC_at_DebitAccountNames;0)
	//ARRAY TEXT(ACC_at_LayerNames;0)
	//ARRAY TEXT(ACC_at_LayerNames2;0)
	//ARRAY TEXT(ACC_at_TransAcc2;0)
	//ARRAY TEXT(ACC_at_TransCoCode2;0)
	//ARRAY TEXT(ACC_at_TransDescription2;0)
	//ARRAY TEXT(ACC_at_TransInvoiceno2;0)
	//ARRAY TEXT(ACC_at_TRANSIO2;0)
	//ARRAY TEXT(ACC_at_TransJobCode2;0)
	//ARRAY TEXT(ACC_at_TransPeriodCode2;0)
	//ARRAY TEXT(ACC_at_TransPurchInvNo2;0)
	C_BOOLEAN:C305($_bo_Consolidated; $1)
	C_DATE:C307(ACC_D_TransDate)
	C_LONGINT:C283($_l_Index; $_l_RecordsinSelection; ACC_l_BatchItemID; ACC_l_ColumnAnalysis; ACC_l_ColumnCheque; ACC_l_ColumnCompanyCode; ACC_l_ColumnCurrencyCode; ACC_l_ColumnJobCode; ACC_l_ColumnLayerCode; ACC_l_ColumnPICode; ACC_l_ColumnPoCode)
	C_LONGINT:C283(ACC_l_TransBatchItemID; ACC_l_TransCreditID; ACC_l_TransDebitID; AL_l_ColumnSInvNumber; DS_l_BATCHITEMRef)
	C_REAL:C285(ACC_R_TransAmount; ACC_R_TransSecondAmt; ACC_R_TransTaxAmt; ACC_R_TransTotal)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_oldMethodName; ACC_t_AnalysisNames; ACC_t_BatchItemAnalysisCode; ACC_t_CompanyName; ACC_t_CreditAccountName; ACC_t_CURRENCYNAME; ACC_t_DebitAccountName; ACC_t_LayerName; ACC_t_TransChequeNo; ACC_t_TransCoCode)
	C_TEXT:C284(ACC_t_TransCreditAcc; ACC_t_TransCreditIO; ACC_t_TransCurrencyCode; ACC_t_TransDebitAcc; ACC_t_TransDebitIO; ACC_T_TransDescription; ACC_t_TransEventCode; ACC_t_TransInvoiceNo; ACC_t_TransJobCode; ACC_t_TransLayerCode; ACC_t_TransPeriodCode)
	C_TEXT:C284(ACC_t_TransPurchCode; ACC_t_TransPurchinvno; ACC_t_TransTaxCode; ACC_t_TransTransCode; ACC_t_UKEC)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_TransLoadSubitems")
If (Count parameters:C259=1)
	$_bo_Consolidated:=$1
Else 
	$_bo_Consolidated:=True:C214
End if 

//This method bring the Batch items into an area list area
//so we can display them in an area list window

//and
If ([TRANSACTION_BATCHES:30]Batch_Number:10#0)
	QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTION_BATCHES:30]Batch_Number:10)
Else 
	REDUCE SELECTION:C351([TRANSACTION_BATCH_ITEMS:155]; 0)
End if 

$_l_RecordsinSelection:=Records in selection:C76([TRANSACTION_BATCH_ITEMS:155])
ARRAY LONGINT:C221(ACC_al_BatchItemDelete; 0)  //to track deletions

ARRAY REAL:C219(ACC_ar_BatchItemAmounts; $_l_RecordsinSelection)
ARRAY TEXT:C222(ACC_at_BatchItemAnalysisCode; $_l_RecordsinSelection)
ARRAY LONGINT:C221(ACC_al_BatchItemID; $_l_RecordsinSelection)
ARRAY TEXT:C222(ACC_at_BatchItemChequeNo; $_l_RecordsinSelection)
ARRAY TEXT:C222(ACC_at_BatchItemCoCode; $_l_RecordsinSelection)
ARRAY TEXT:C222(ACC_at_BatchItemCreditAcc; $_l_RecordsinSelection)
ARRAY TEXT:C222(ACC_at_BatchItemCreditIO; $_l_RecordsinSelection)
ARRAY LONGINT:C221(ACC_al_BatchItemCreditID; $_l_RecordsinSelection)
ARRAY TEXT:C222(ACC_at_BatchItemCurrencyCode; $_l_RecordsinSelection)
ARRAY TEXT:C222(ACC_at_BatchItemDebitAcc; $_l_RecordsinSelection)
ARRAY TEXT:C222(ACC_at_BatchItemDebitIO; $_l_RecordsinSelection)
ARRAY LONGINT:C221(ACC_al_BatchItemDebitID; $_l_RecordsinSelection)
ARRAY TEXT:C222(ACC_at_BatchItemDescription; $_l_RecordsinSelection)

ARRAY TEXT:C222(ACC_at_BatchItemInvoiceNo; $_l_RecordsinSelection)
ARRAY TEXT:C222(ACC_at_BatchItemJobCode; $_l_RecordsinSelection)
ARRAY TEXT:C222(ACC_at_BatchItemlayerCode; $_l_RecordsinSelection)
ARRAY TEXT:C222(ACC_at_BatchItemPeriodCode; $_l_RecordsinSelection)
ARRAY TEXT:C222(ACC_at_BatchItemPurchinvno; $_l_RecordsinSelection)
ARRAY TEXT:C222(ACC_at_BatchItemPurchCode; $_l_RecordsinSelection)
ARRAY REAL:C219(ACC_ar_BatchItemSecondAmt; $_l_RecordsinSelection)
ARRAY REAL:C219(ACC_ar_BatchItemTaxAmt; $_l_RecordsinSelection)
ARRAY TEXT:C222(ACC_at_BatchItemTaxCode; $_l_RecordsinSelection)
ARRAY REAL:C219(ACC_ar_BatchItemTotal; $_l_RecordsinSelection)
ARRAY TEXT:C222(ACC_at_BatchItemTransTypeCode; $_l_RecordsinSelection)
ARRAY DATE:C224(ACC_ad_BatchItemTransDate; $_l_RecordsinSelection)
ARRAY TEXT:C222(ACC_at_BatchItemTaxUKEC; $_l_RecordsinSelection)

ARRAY TEXT:C222(ACC_at_CURRENCYNAME; $_l_RecordsinSelection)
ARRAY TEXT:C222(ACC_at_DebitAccountNames; $_l_RecordsinSelection)  //²
ARRAY TEXT:C222(ACC_at_CreditAccountNames; $_l_RecordsinSelection)  //²
ARRAY TEXT:C222(ACC_at_CompanyNames; $_l_RecordsinSelection)  //²
ARRAY TEXT:C222(ACC_at_AnalysisNames; $_l_RecordsinSelection)  //²
ARRAY TEXT:C222(ACC_at_LayerNames; $_l_RecordsinSelection)  //)²
ARRAY LONGINT:C221(ACC_al_BatchItemID; $_l_RecordsinSelection)

//````
ARRAY REAL:C219(ACC_ar_BatchItemDebitAmount2; 0)
ARRAY REAL:C219(ACC_ar_BatchItemCreditAmount2; 0)
ARRAY TEXT:C222(ACC_at_BatchItemAnalysisCode2; 0)

ARRAY TEXT:C222(ACC_at_BatchItemChequeNo2; 0)
ARRAY TEXT:C222(ACC_at_TransCoCode2; 0)

ARRAY TEXT:C222(ACC_at_BatchItemCurrencyCode2; 0)
ARRAY TEXT:C222(ACC_at_TransAcc2; 0)
ARRAY TEXT:C222(ACC_at_TRANSIO2; 0)

ARRAY TEXT:C222(ACC_at_TransDescription2; 0)

ARRAY TEXT:C222(ACC_at_TransInvoiceno2; 0)
ARRAY TEXT:C222(ACC_at_TransJobCode2; 0)
ARRAY TEXT:C222(ACC_at_BatchItemLayerCode2; 0)
ARRAY TEXT:C222(ACC_at_TransPeriodCode2; 0)
ARRAY TEXT:C222(ACC_at_TransPurchInvNo2; 0)
ARRAY TEXT:C222(ACC_at_BatchItemPurchCode2; 0)

ARRAY TEXT:C222(ACC_at_BatchItemTransCode2; 0)
ARRAY DATE:C224(ACC_ad_aTransDate2; 0)


ARRAY TEXT:C222(ACC_at_CURRENCYNAME2; 0)
ARRAY TEXT:C222(ACC_at_AccountNames2; 0)  //²

ARRAY TEXT:C222(ACC_at_CompanyNames2; 0)  //²
ARRAY TEXT:C222(ACC_at_AnalysisNames2; 0)  //²
ARRAY TEXT:C222(ACC_at_LayerNames2; 0)  //)²
ARRAY TEXT:C222(ACC_at_BatchItemConstructIdent; 0)
ARRAY LONGINT:C221(ACC_al_BatchitemCompanion; 0; 0)
//```


//````
//Current fields displayed are
//trans Code
FIRST RECORD:C50([TRANSACTION_BATCH_ITEMS:155])
For ($_l_Index; 1; $_l_RecordsinSelection)
	If ([TRANSACTION_BATCH_ITEMS:155]BatchItemID:25=0)
		
		[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=AA_GetNextIDinMethod(->DS_l_BATCHITEMRef)
	End if 
	
	ACC_ar_BatchItemAmounts{$_l_Index}:=[TRANSACTION_BATCH_ITEMS:155]Amount:6
	ACC_at_BatchItemAnalysisCode{$_l_Index}:=[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2
	ACC_al_BatchItemID{$_l_Index}:=[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25
	ACC_al_BatchItemID{$_l_Index}:=[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25
	ACC_at_BatchItemChequeNo{$_l_Index}:=[TRANSACTION_BATCH_ITEMS:155]Cheque_Number:14
	ACC_at_BatchItemCoCode{$_l_Index}:=[TRANSACTION_BATCH_ITEMS:155]Company_Code:13
	ACC_at_BatchItemCreditAcc{$_l_Index}:=[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12
	ACC_at_BatchItemCreditIO{$_l_Index}:=[TRANSACTION_BATCH_ITEMS:155]Credit_IO:16
	ACC_al_BatchItemCreditID{$_l_Index}:=[TRANSACTION_BATCH_ITEMS:155]CreditTransID:26
	ACC_at_BatchItemCurrencyCode{$_l_Index}:=[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19
	ACC_at_BatchItemDebitAcc{$_l_Index}:=[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3
	ACC_at_BatchItemDebitIO{$_l_Index}:=[TRANSACTION_BATCH_ITEMS:155]Debit_IO:15
	ACC_al_BatchItemDebitID{$_l_Index}:=[TRANSACTION_BATCH_ITEMS:155]DebitTransID:27
	ACC_at_BatchItemDescription{$_l_Index}:=[TRANSACTION_BATCH_ITEMS:155]Description:10
	ACC_at_BatchItemInvoiceNo{$_l_Index}:=[TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4
	ACC_at_BatchItemJobCode{$_l_Index}:=[TRANSACTION_BATCH_ITEMS:155]Job_Code:23
	ACC_at_BatchItemlayerCode{$_l_Index}:=[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20
	ACC_at_BatchItemPeriodCode{$_l_Index}:=[TRANSACTION_BATCH_ITEMS:155]Period_Code:11
	ACC_at_BatchItemPurchinvno{$_l_Index}:=[TRANSACTION_BATCH_ITEMS:155]Purchase_invoice_Number:17
	ACC_at_BatchItemPurchCode{$_l_Index}:=[TRANSACTION_BATCH_ITEMS:155]Purchase_Invoice_Code:22
	ACC_ar_BatchItemSecondAmt{$_l_Index}:=[TRANSACTION_BATCH_ITEMS:155]Second_Amount:21
	ACC_ar_BatchItemTaxAmt{$_l_Index}:=[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8
	ACC_at_BatchItemTaxCode{$_l_Index}:=[TRANSACTION_BATCH_ITEMS:155]Tax_Code:7
	ACC_ar_BatchItemTotal{$_l_Index}:=[TRANSACTION_BATCH_ITEMS:155]Total:9
	ACC_at_BatchItemTransTypeCode{$_l_Index}:=[TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1
	
	ACC_ad_BatchItemTransDate{$_l_Index}:=[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5
	ACC_at_BatchItemTaxUKEC{$_l_Index}:=[TRANSACTION_BATCH_ITEMS:155]UK_EC:18
	NEXT RECORD:C51([TRANSACTION_BATCH_ITEMS:155])
End for 
SORT ARRAY:C229(ACC_at_BatchItemAnalysisCode; ACC_at_BatchItemlayerCode; ACC_ar_BatchItemAmounts; ACC_al_BatchItemID; ACC_al_BatchItemID; ACC_at_BatchItemChequeNo; ACC_at_BatchItemCoCode; ACC_at_BatchItemCreditAcc; ACC_at_BatchItemCreditIO; ACC_al_BatchItemCreditID; ACC_at_BatchItemCurrencyCode; ACC_at_BatchItemDebitAcc; ACC_at_BatchItemDebitIO; ACC_al_BatchItemDebitID; ACC_at_BatchItemDescription; ACC_at_BatchItemInvoiceNo; ACC_at_BatchItemJobCode; ACC_at_BatchItemPeriodCode; ACC_at_BatchItemPurchinvno; ACC_at_BatchItemPurchCode; ACC_ar_BatchItemSecondAmt; ACC_ar_BatchItemTaxAmt; ACC_at_BatchItemTaxCode; ACC_ar_BatchItemTotal; ACC_at_BatchItemTransTypeCode; ACC_ad_BatchItemTransDate; ACC_at_BatchItemTaxUKEC; ACC_at_CURRENCYNAME; ACC_at_DebitAccountNames; ACC_at_CreditAccountNames; ACC_at_CompanyNames; ACC_at_AnalysisNames; ACC_at_LayerNames; >)
For ($_l_Index; 1; Size of array:C274(ACC_at_BatchItemAnalysisCode))
	If (ACC_at_BatchItemAnalysisCode{$_l_Index}#"")
		If ([ANALYSES:36]Analysis_Code:1#ACC_at_BatchItemAnalysisCode{$_l_Index})
			READ ONLY:C145([ANALYSES:36])
			QUERY:C277([ANALYSES:36]; [ANALYSES:36]Analysis_Code:1=ACC_at_BatchItemAnalysisCode{$_l_Index})
		End if 
		ACC_at_AnalysisNames{$_l_Index}:=[ANALYSES:36]Analysis_Name:2
	End if 
	
End for 
SORT ARRAY:C229(ACC_at_BatchItemlayerCode; ACC_at_BatchItemAnalysisCode; ACC_ar_BatchItemAmounts; ACC_al_BatchItemID; ACC_al_BatchItemID; ACC_at_BatchItemChequeNo; ACC_at_BatchItemCoCode; ACC_at_BatchItemCreditAcc; ACC_at_BatchItemCreditIO; ACC_al_BatchItemCreditID; ACC_at_BatchItemCurrencyCode; ACC_at_BatchItemDebitAcc; ACC_at_BatchItemDebitIO; ACC_al_BatchItemDebitID; ACC_at_BatchItemDescription; ACC_at_BatchItemInvoiceNo; ACC_at_BatchItemJobCode; ACC_at_BatchItemPeriodCode; ACC_at_BatchItemPurchinvno; ACC_at_BatchItemPurchCode; ACC_ar_BatchItemSecondAmt; ACC_ar_BatchItemTaxAmt; ACC_at_BatchItemTaxCode; ACC_ar_BatchItemTotal; ACC_at_BatchItemTransTypeCode; ACC_ad_BatchItemTransDate; ACC_at_BatchItemTaxUKEC; ACC_at_CURRENCYNAME; ACC_at_DebitAccountNames; ACC_at_CreditAccountNames; ACC_at_CompanyNames; ACC_at_AnalysisNames; ACC_at_LayerNames; >)
For ($_l_Index; 1; Size of array:C274(ACC_at_BatchItemAnalysisCode))
	If (ACC_at_BatchItemlayerCode{$_l_Index}#"")
		If ([LAYERS:76]Layer_Code:1#ACC_at_BatchItemlayerCode{$_l_Index})
			READ ONLY:C145([LAYERS:76])
			QUERY:C277([LAYERS:76]; [LAYERS:76]Layer_Code:1=ACC_at_BatchItemlayerCode{$_l_Index})
		End if 
		ACC_at_LayerNames{$_l_Index}:=[LAYERS:76]Layer_Name:2
	End if 
	
End for 
SORT ARRAY:C229(ACC_at_BatchItemCoCode; ACC_at_BatchItemlayerCode; ACC_at_BatchItemAnalysisCode; ACC_ar_BatchItemAmounts; ACC_al_BatchItemID; ACC_al_BatchItemID; ACC_at_BatchItemChequeNo; ACC_at_BatchItemCreditAcc; ACC_at_BatchItemCreditIO; ACC_al_BatchItemCreditID; ACC_at_BatchItemCurrencyCode; ACC_at_BatchItemDebitAcc; ACC_at_BatchItemDebitIO; ACC_al_BatchItemDebitID; ACC_at_BatchItemDescription; ACC_at_BatchItemInvoiceNo; ACC_at_BatchItemJobCode; ACC_at_BatchItemPeriodCode; ACC_at_BatchItemPurchinvno; ACC_at_BatchItemPurchCode; ACC_ar_BatchItemSecondAmt; ACC_ar_BatchItemTaxAmt; ACC_at_BatchItemTaxCode; ACC_ar_BatchItemTotal; ACC_at_BatchItemTransTypeCode; ACC_ad_BatchItemTransDate; ACC_at_BatchItemTaxUKEC; ACC_at_CURRENCYNAME; ACC_at_DebitAccountNames; ACC_at_CreditAccountNames; ACC_at_CompanyNames; ACC_at_AnalysisNames; ACC_at_LayerNames; >)
For ($_l_Index; 1; Size of array:C274(ACC_at_BatchItemAnalysisCode))
	If (ACC_at_BatchItemCoCode{$_l_Index}#"")
		If ([COMPANIES:2]Company_Code:1#ACC_at_BatchItemCoCode{$_l_Index})
			READ ONLY:C145([COMPANIES:2])
			QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=ACC_at_BatchItemCoCode{$_l_Index})
		End if 
		ACC_at_CompanyNames{$_l_Index}:=[COMPANIES:2]Company_Name:2
	End if 
	
End for 

//ACC_at_BatchItemCreditAcc
SORT ARRAY:C229(ACC_at_BatchItemCreditAcc; ACC_at_BatchItemCoCode; ACC_at_BatchItemlayerCode; ACC_at_BatchItemAnalysisCode; ACC_ar_BatchItemAmounts; ACC_al_BatchItemID; ACC_al_BatchItemID; ACC_at_BatchItemChequeNo; ACC_at_BatchItemCreditIO; ACC_al_BatchItemCreditID; ACC_at_BatchItemCurrencyCode; ACC_at_BatchItemDebitAcc; ACC_at_BatchItemDebitIO; ACC_al_BatchItemDebitID; ACC_at_BatchItemDescription; ACC_at_BatchItemInvoiceNo; ACC_at_BatchItemJobCode; ACC_at_BatchItemPeriodCode; ACC_at_BatchItemPurchinvno; ACC_at_BatchItemPurchCode; ACC_ar_BatchItemSecondAmt; ACC_ar_BatchItemTaxAmt; ACC_at_BatchItemTaxCode; ACC_ar_BatchItemTotal; ACC_at_BatchItemTransTypeCode; ACC_ad_BatchItemTransDate; ACC_at_BatchItemTaxUKEC; ACC_at_CURRENCYNAME; ACC_at_DebitAccountNames; ACC_at_CreditAccountNames; ACC_at_CompanyNames; ACC_at_AnalysisNames; ACC_at_LayerNames; >)
For ($_l_Index; 1; Size of array:C274(ACC_at_BatchItemAnalysisCode))
	If (ACC_at_BatchItemCreditAcc{$_l_Index}#"")
		If ([ACCOUNTS:32]Account_Code:2#ACC_at_BatchItemCreditAcc{$_l_Index})
			READ ONLY:C145([ACCOUNTS:32])
			QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2=ACC_at_BatchItemCreditAcc{$_l_Index})
		End if 
		ACC_at_CreditAccountNames{$_l_Index}:=[ACCOUNTS:32]Account_Name:3
	End if 
	
End for 

SORT ARRAY:C229(ACC_at_BatchItemDebitAcc; ACC_at_BatchItemCreditAcc; ACC_at_BatchItemCoCode; ACC_at_BatchItemlayerCode; ACC_at_BatchItemAnalysisCode; ACC_ar_BatchItemAmounts; ACC_al_BatchItemID; ACC_al_BatchItemID; ACC_at_BatchItemChequeNo; ACC_at_BatchItemCreditIO; ACC_al_BatchItemCreditID; ACC_at_BatchItemCurrencyCode; ACC_at_BatchItemDebitIO; ACC_al_BatchItemDebitID; ACC_at_BatchItemDescription; ACC_at_BatchItemInvoiceNo; ACC_at_BatchItemJobCode; ACC_at_BatchItemPeriodCode; ACC_at_BatchItemPurchinvno; ACC_at_BatchItemPurchCode; ACC_ar_BatchItemSecondAmt; ACC_ar_BatchItemTaxAmt; ACC_at_BatchItemTaxCode; ACC_ar_BatchItemTotal; ACC_at_BatchItemTransTypeCode; ACC_ad_BatchItemTransDate; ACC_at_BatchItemTaxUKEC; ACC_at_CURRENCYNAME; ACC_at_DebitAccountNames; ACC_at_CreditAccountNames; ACC_at_CompanyNames; ACC_at_AnalysisNames; ACC_at_LayerNames; >)
For ($_l_Index; 1; Size of array:C274(ACC_at_BatchItemAnalysisCode))
	If (ACC_at_BatchItemDebitAcc{$_l_Index}#"")
		If ([ACCOUNTS:32]Account_Code:2#ACC_at_BatchItemDebitAcc{$_l_Index})
			READ ONLY:C145([ACCOUNTS:32])
			QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2=ACC_at_BatchItemDebitAcc{$_l_Index})
		End if 
		ACC_at_DebitAccountNames{$_l_Index}:=[ACCOUNTS:32]Account_Name:3
	End if 
	
End for 
SORT ARRAY:C229(ACC_at_BatchItemCurrencyCode; ACC_at_BatchItemDebitAcc; ACC_at_BatchItemCreditAcc; ACC_at_BatchItemCoCode; ACC_at_BatchItemlayerCode; ACC_at_BatchItemAnalysisCode; ACC_ar_BatchItemAmounts; ACC_al_BatchItemID; ACC_al_BatchItemID; ACC_at_BatchItemChequeNo; ACC_at_BatchItemCreditIO; ACC_al_BatchItemCreditID; ACC_at_BatchItemDebitIO; ACC_al_BatchItemDebitID; ACC_at_BatchItemDescription; ACC_at_BatchItemInvoiceNo; ACC_at_BatchItemJobCode; ACC_at_BatchItemPeriodCode; ACC_at_BatchItemPurchinvno; ACC_at_BatchItemPurchCode; ACC_ar_BatchItemSecondAmt; ACC_ar_BatchItemTaxAmt; ACC_at_BatchItemTaxCode; ACC_ar_BatchItemTotal; ACC_at_BatchItemTransTypeCode; ACC_ad_BatchItemTransDate; ACC_at_BatchItemTaxUKEC; ACC_at_CURRENCYNAME; ACC_at_DebitAccountNames; ACC_at_CreditAccountNames; ACC_at_CompanyNames; ACC_at_AnalysisNames; ACC_at_LayerNames; >)
For ($_l_Index; 1; Size of array:C274(ACC_at_BatchItemAnalysisCode))
	If (ACC_at_BatchItemCurrencyCode{$_l_Index}#"")
		If ([CURRENCIES:71]Currency_Code:1#ACC_at_BatchItemCurrencyCode{$_l_Index})
			READ ONLY:C145([CURRENCIES:71])
			QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]Currency_Code:1=ACC_at_BatchItemCurrencyCode{$_l_Index})
		End if 
		ACC_at_CURRENCYNAME{$_l_Index}:=[CURRENCIES:71]Currency_Name:2
		If (ACC_at_CURRENCYNAME{$_l_Index}="")
			If (ACC_at_BatchItemCurrencyCode{$_l_Index}=<>SYS_t_BaseCurrency)
				ACC_at_CURRENCYNAME{$_l_Index}:="Base"
			Else 
				ACC_at_CURRENCYNAME{$_l_Index}:=ACC_at_BatchItemCurrencyCode{$_l_Index}
			End if 
			
		End if 
	End if 
	
End for 

ACC_TransSetDisplay("Trans_SetDisplay"; $_l_RecordsinSelection)
ERR_MethodTrackerReturn("ACC_TransLoadSubitems"; $_t_oldMethodName)
