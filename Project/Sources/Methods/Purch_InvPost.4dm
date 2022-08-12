//%attributes = {}
If (False:C215)
	//Project Method Name:      Purch_InvPost
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
	ARRAY REAL:C219($_ar_PICostAmounts; 0)
	ARRAY REAL:C219($_ar_PIQuantities; 0)
	ARRAY REAL:C219($_ar_PISalesPrices; 0)
	ARRAY REAL:C219($_ar_PITaxAmounts; 0)
	ARRAY TEXT:C222($_at_PIAnalysisCodes; 0)
	ARRAY TEXT:C222($_at_PIProductCodes; 0)
	ARRAY TEXT:C222($_at_PIProductDescriptions; 0)
	ARRAY TEXT:C222($_at_PIPurchaseAccounts; 0)
	ARRAY TEXT:C222($_at_PITaxCodes; 0)
	C_DATE:C307(<>DB_d_CurrentDate; $_d_PIPurchaseDate; vDate)
	C_LONGINT:C283($_l_PIItemIndex; $_l_PostPIIndex; $_l_SizeofArray; $_l_TransPostStatus; DS_l_BATCHITEMRef)
	C_REAL:C285(vSubtotal; vTotal; vVAT)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_oldMethodName; $_t_PICreditorsAcc; $_t_PICurrencyCode; $_t_PILayerCode; $_t_PIPeriodCode; $_t_PIPurchaseCode; $_t_PIPurchaseCompanyCode; $_t_PIPurchaseInvNo; $_t_PIUKECCode)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Purch_InvPost")
//Project Method Purch_InvPost 26/3/2(ID 13515-3800)

//Purch_InvPost
OK:=1
[PURCHASE_INVOICES:37]State:24:=2
[PURCHASE_INVOICES:37]Posted_Date:12:=<>DB_d_CurrentDate
If ([PURCHASE_INVOICES:37]Analysis_Code:15="")
	QUERY:C277([PURCHASE_INVOICE_ITEMS:158]; [PURCHASE_INVOICE_ITEMS:158]PURCHASE_INVOICE_CODE:17=[PURCHASE_INVOICES:37]Purchase_Code:1)
	
	
	
	FIRST RECORD:C50([PURCHASE_INVOICE_ITEMS:158])
	For ($_l_PIItemIndex; 1; Records in selection:C76([PURCHASE_INVOICE_ITEMS:158]))
		If ([PURCHASE_INVOICE_ITEMS:158]Analysis_Code:9#"")
			[PURCHASE_INVOICES:37]Analysis_Code:15:=[PURCHASE_INVOICE_ITEMS:158]Analysis_Code:9
			$_l_PIItemIndex:=Records in selection:C76([PURCHASE_INVOICE_ITEMS:158])
		End if 
		NEXT RECORD:C51([PURCHASE_INVOICE_ITEMS:158])
	End for 
	
End if 
QUERY:C277([PURCHASE_INVOICE_ITEMS:158]; [PURCHASE_INVOICE_ITEMS:158]PURCHASE_INVOICE_CODE:17=[PURCHASE_INVOICES:37]Purchase_Code:1)
FIRST RECORD:C50([PURCHASE_INVOICE_ITEMS:158])
For ($_l_PIItemIndex; 1; Records in selection:C76([PURCHASE_INVOICE_ITEMS:158]))
	If ([PURCHASE_INVOICE_ITEMS:158]Analysis_Code:9="")
		[PURCHASE_INVOICE_ITEMS:158]Analysis_Code:9:=[PURCHASE_INVOICES:37]Analysis_Code:15
		DB_SaveRecord(->[PURCHASE_INVOICE_ITEMS:158])
		
	End if 
	
	NEXT RECORD:C51([PURCHASE_INVOICE_ITEMS:158])
	
End for 
//`Here update the totals
QUERY:C277([PURCHASE_INVOICE_ITEMS:158]; [PURCHASE_INVOICE_ITEMS:158]PURCHASE_INVOICE_CODE:17=[PURCHASE_INVOICES:37]Purchase_Code:1)

If ((DB_GetLedgerCashvatACC#"") & (DB_GetLedgerisCashVAT))
	[PURCHASE_INVOICES:37]Cash_TAX:33:=True:C214
	[PURCHASE_INVOICES:37]Cash_TAX_Due:32:=[PURCHASE_INVOICES:37]Total_Tax:25
End if 
[PURCHASE_INVOICES:37]Total_Due:9:=Gen_Round(([PURCHASE_INVOICES:37]Total_Invoiced:7-[PURCHASE_INVOICES:37]Total_Paid:8); 2; 2)
DB_SaveRecord(->[PURCHASE_INVOICES:37])
If ((DB_GetModuleSettingByNUM(Module_NominalLedger)>0) & (OK=1))
	READ WRITE:C146([TRANSACTION_BATCHES:30])
	CREATE RECORD:C68([TRANSACTION_BATCHES:30])
	BatchNo
	If ([TRANSACTION_BATCHES:30]Batch_Number:10=0)
		OK:=0
	Else 
		[TRANSACTION_BATCHES:30]Batch_Date:1:=[PURCHASE_INVOICES:37]Invoice_Date:5
		[TRANSACTION_BATCHES:30]Entry_Date:6:=<>DB_d_CurrentDate
		[TRANSACTION_BATCHES:30]Description:12:="Posting of Purchase Invoice "+[PURCHASE_INVOICES:37]Purchase_Code:1+" "+[PURCHASE_INVOICES:37]Company_Code:2+Char:C90(13)+[PURCHASE_INVOICES:37]Comments:16
		QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=DB_GetLedgerTRANSPURpost)
		vDate:=[PURCHASE_INVOICES:37]Invoice_Date:5
		vSubtotal:=0
		vVAT:=0
		vTotal:=0
		QUERY:C277([PURCHASE_INVOICE_ITEMS:158]; [PURCHASE_INVOICE_ITEMS:158]PURCHASE_INVOICE_CODE:17=[PURCHASE_INVOICES:37]Purchase_Code:1)
		$_t_PICreditorsAcc:=[PURCHASE_INVOICES:37]Creditors_Account:13
		$_t_PIPurchaseInvNo:=[PURCHASE_INVOICES:37]Purchase_Invoice_Number:4
		$_t_PIPurchaseCode:=[PURCHASE_INVOICES:37]Purchase_Code:1
		$_t_PIPurchaseCompanyCode:=[PURCHASE_INVOICES:37]Company_Code:2
		$_d_PIPurchaseDate:=[PURCHASE_INVOICES:37]Invoice_Date:5
		$_t_PIPeriodCode:=[PURCHASE_INVOICES:37]Period_Code:3
		$_t_PICurrencyCode:=[PURCHASE_INVOICES:37]Currency_Code:23
		$_t_PIUKECCode:=[PURCHASE_INVOICES:37]UK_EC:18
		$_t_PILayerCode:=[PURCHASE_INVOICES:37]Layer_Code:28
		FIRST RECORD:C50([PURCHASE_INVOICE_ITEMS:158])
		SELECTION TO ARRAY:C260([PURCHASE_INVOICE_ITEMS:158]Product_Code:1; $_at_PIProductCodes; [PURCHASE_INVOICE_ITEMS:158]Description:13; $_at_PIProductDescriptions; [PURCHASE_INVOICE_ITEMS:158]Purchase_Account:8; $_at_PIPurchaseAccounts; [PURCHASE_INVOICE_ITEMS:158]Analysis_Code:9; $_at_PIAnalysisCodes; [PURCHASE_INVOICE_ITEMS:158]Tax_Code:5; $_at_PITaxCodes; [PURCHASE_INVOICE_ITEMS:158]Cost_Amount:4; $_ar_PICostAmounts; [PURCHASE_INVOICE_ITEMS:158]Tax_Amount:6; $_ar_PITaxAmounts; [PURCHASE_INVOICE_ITEMS:158]Sales_Price:15; $_ar_PISalesPrices; [PURCHASE_INVOICE_ITEMS:158]Quantity:2; $_ar_PIQuantities)
		$_l_SizeofArray:=Size of array:C274($_at_PIProductCodes)
		For ($_l_PostPIIndex; 1; $_l_SizeofArray)
			
			//While (Not(End selection([PURCHASES_ITEMS]Sales Price)))
			CREATE RECORD:C68([TRANSACTION_BATCH_ITEMS:155])
			[TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31:=[TRANSACTION_BATCHES:30]Batch_Number:10
			[TRANSACTION_BATCH_ITEMS:155]ID:30:=AA_GetNextID(->[TRANSACTION_BATCH_ITEMS:155]ID:30)
			
			[TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1:=DB_GetLedgerTRANSPURpost
			[TRANSACTION_BATCH_ITEMS:155]Description:10:=$_at_PIProductCodes{$_l_PostPIIndex}+": "+$_at_PIProductDescriptions{$_l_PostPIIndex}
			If ($_t_PICreditorsAcc#"")
				[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12:=$_t_PICreditorsAcc
			Else 
				[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12:=[TRANSACTION_TYPES:31]Credit_Account:5
			End if 
			If ($_at_PIPurchaseAccounts{$_l_PostPIIndex}#"")
				[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3:=$_at_PIPurchaseAccounts{$_l_PostPIIndex}
				[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2:=$_at_PIAnalysisCodes{$_l_PostPIIndex}
			Else 
				[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3:=[TRANSACTION_TYPES:31]Debit_Account:4
				[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2:=[TRANSACTION_TYPES:31]Analysis_Code:7
			End if 
			TransB_DC
			If ((DB_GetLedgerCashvatACC#"") & (DB_GetLedgerisCashVAT))
				[TRANSACTION_BATCH_ITEMS:155]Debit_IO:15:=[TRANSACTION_BATCH_ITEMS:155]Debit_IO:15+"S"
			End if 
			[TRANSACTION_BATCH_ITEMS:155]Purchase_invoice_Number:17:=$_t_PIPurchaseInvNo
			[TRANSACTION_BATCH_ITEMS:155]Purchase_Invoice_Code:22:=$_t_PIPurchaseCode
			[TRANSACTION_BATCH_ITEMS:155]Company_Code:13:=$_t_PIPurchaseCompanyCode
			[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5:=$_d_PIPurchaseDate
			[TRANSACTION_BATCH_ITEMS:155]Period_Code:11:=$_t_PIPeriodCode
			[TRANSACTION_BATCH_ITEMS:155]Tax_Code:7:=$_at_PITaxCodes{$_l_PostPIIndex}
			[TRANSACTION_BATCH_ITEMS:155]Amount:6:=$_ar_PICostAmounts{$_l_PostPIIndex}
			vSubtotal:=vSubtotal+[TRANSACTION_BATCH_ITEMS:155]Amount:6
			[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8:=$_ar_PITaxAmounts{$_l_PostPIIndex}
			vVAT:=vVAT+[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8
			[TRANSACTION_BATCH_ITEMS:155]Total:9:=Gen_Round(([TRANSACTION_BATCH_ITEMS:155]Amount:6+[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8); 2; 2)
			vTotal:=vTotal+[TRANSACTION_BATCH_ITEMS:155]Total:9
			[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19:=$_t_PICurrencyCode
			If ([TRANSACTION_BATCH_ITEMS:155]Currency_Code:19="")
				[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19:=<>SYS_t_BaseCurrency
			End if 
			[TRANSACTION_BATCH_ITEMS:155]Second_Amount:21:=Gen_Round(($_ar_PISalesPrices{$_l_PostPIIndex}*$_ar_PIQuantities{$_l_PostPIIndex}); 2; 2)
			[TRANSACTION_BATCH_ITEMS:155]UK_EC:18:=$_t_PIUKECCode
			[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20:=$_t_PILayerCode
			If ([TRANSACTION_BATCH_ITEMS:155]Layer_Code:20="")
				[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20:=DB_GetLedgerActualLayer
			End if 
			If ([TRANSACTION_BATCH_ITEMS:155]BatchItemID:25=0)
				[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=AA_GetNextIDinMethod(->DS_l_BATCHITEMRef)
			End if 
			DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
			//NEXT RECORD([PURCHASES_ITEMS])
			//End while
		End for 
		[TRANSACTION_BATCHES:30]Batch_Amount:3:=Gen_Round(vSubtotal; 2; 2)
		[TRANSACTION_BATCHES:30]Batch_Tax:4:=Gen_Round(vVAT; 2; 2)
		[TRANSACTION_BATCHES:30]Batch_Total:5:=Gen_Round(vTotal; 2; 2)
		DB_SaveRecord(->[TRANSACTION_BATCHES:30])
		$_l_TransPostStatus:=TransactionBatch_Post
		If ($_l_TransPostStatus>=0)
			//VALIDATE TRANSACTION
			Transact_End(True:C214)
		Else 
			Gen_Alert("The posting of this purchase Invoice has been cancelled")
			
			//CANCEL TRANSACTION
			Transact_End(False:C215)
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Purch_InvPost"; $_t_oldMethodName)
