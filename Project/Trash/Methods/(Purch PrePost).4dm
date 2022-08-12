//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Purch PrePost
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
	C_DATE:C307(<>DB_d_CurrentDate; vDate)
	C_LONGINT:C283($_l_TransPostStatus; DS_l_BATCHITEMRef)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Purch PrePost")
//Project Method Purch PrePost 26/3/2(ID 12869-2444)

//Purch PrePost
OK:=1
[PURCHASE_INVOICES:37]State:24:=-2
[PURCHASE_INVOICES:37]Posted_Date:12:=<>DB_d_CurrentDate
[PURCHASE_INVOICES:37]Total_Invoiced:7:=0
[PURCHASE_INVOICES:37]Total_Due:9:=Round:C94(([PURCHASE_INVOICES:37]Total_Invoiced:7-[PURCHASE_INVOICES:37]Total_Paid:8); 2)
DB_SaveRecord(->[PURCHASE_INVOICES:37])
If ((DB_GetModuleSettingByNUM(Module_NominalLedger)>0) & (OK=1))
	READ WRITE:C146([TRANSACTION_BATCHES:30])
	CREATE RECORD:C68([TRANSACTION_BATCHES:30])
	BatchNo
	$_l_TransPostStatus:=0
	//START TRANSACTION
	StartTransaction
	If ([TRANSACTION_BATCHES:30]Batch_Number:10=0)
		OK:=0
		$_l_TransPostStatus:=-1
	Else 
		[TRANSACTION_BATCHES:30]Batch_Date:1:=[PURCHASE_INVOICES:37]Invoice_Date:5
		[TRANSACTION_BATCHES:30]Entry_Date:6:=<>DB_d_CurrentDate
		[TRANSACTION_BATCHES:30]Description:12:="Posting of Purchase Pre-Payment "+[PURCHASE_INVOICES:37]Purchase_Code:1+" "+[PURCHASE_INVOICES:37]Company_Code:2
		QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=DB_GetLedgerTRANSPURPrePay)
		vDate:=[PURCHASE_INVOICES:37]Invoice_Date:5
		CREATE RECORD:C68([TRANSACTION_BATCH_ITEMS:155])
		[TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31:=[TRANSACTION_BATCHES:30]Batch_Number:10
		[TRANSACTION_BATCH_ITEMS:155]ID:30:=AA_GetNextID(->[TRANSACTION_BATCH_ITEMS:155]ID:30)
		
		[TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1:=DB_GetLedgerTRANSPURPrePay
		[TRANSACTION_BATCH_ITEMS:155]Description:10:=[PURCHASE_INVOICES:37]Comments:16
		If ([PURCHASE_INVOICES:37]Creditors_Account:13#"")
			[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3:=[PURCHASE_INVOICES:37]Creditors_Account:13
		Else 
			[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3:=[TRANSACTION_TYPES:31]Debit_Account:4
		End if 
		If ([PURCHASE_INVOICES:37]Bank_Account:14#"")
			[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12:=[PURCHASE_INVOICES:37]Bank_Account:14
		Else 
			[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12:=[TRANSACTION_TYPES:31]Credit_Account:5
		End if 
		[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2:=[PURCHASE_INVOICES:37]Analysis_Code:15
		TransB_DC
		[TRANSACTION_BATCH_ITEMS:155]Purchase_invoice_Number:17:=[PURCHASE_INVOICES:37]Purchase_Invoice_Number:4
		[TRANSACTION_BATCH_ITEMS:155]Purchase_Invoice_Code:22:=[PURCHASE_INVOICES:37]Purchase_Code:1
		[TRANSACTION_BATCH_ITEMS:155]Company_Code:13:=[PURCHASE_INVOICES:37]Company_Code:2
		[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5:=[PURCHASE_INVOICES:37]Invoice_Date:5
		[TRANSACTION_BATCH_ITEMS:155]Period_Code:11:=[PURCHASE_INVOICES:37]Period_Code:3
		[TRANSACTION_BATCH_ITEMS:155]Tax_Code:7:=[TRANSACTION_TYPES:31]Tax_Code:6
		[TRANSACTION_BATCH_ITEMS:155]Amount:6:=[PURCHASE_INVOICES:37]Total_Paid:8
		[TRANSACTION_BATCH_ITEMS:155]Total:9:=[TRANSACTION_BATCH_ITEMS:155]Amount:6
		[TRANSACTION_BATCHES:30]Batch_Amount:3:=[PURCHASE_INVOICES:37]Total_Paid:8
		[TRANSACTION_BATCHES:30]Batch_Tax:4:=0
		[TRANSACTION_BATCHES:30]Batch_Total:5:=[PURCHASE_INVOICES:37]Total_Paid:8
		[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19:=[PURCHASE_INVOICES:37]Currency_Code:23
		If ([TRANSACTION_BATCH_ITEMS:155]Currency_Code:19="")
			[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19:=<>SYS_t_BaseCurrency
		End if 
		[TRANSACTION_BATCH_ITEMS:155]UK_EC:18:=[PURCHASE_INVOICES:37]UK_EC:18
		[TRANSACTION_BATCH_ITEMS:155]Cheque_Number:14:=[PURCHASE_INVOICES:37]Cheque_Number:26
		[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20:=[PURCHASE_INVOICES:37]Layer_Code:28
		If ([TRANSACTION_BATCH_ITEMS:155]Layer_Code:20="")
			[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20:=DB_GetLedgerActualLayer
		End if 
		If ([TRANSACTION_BATCH_ITEMS:155]BatchItemID:25=0)
			[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=AA_GetNextIDinMethod(->DS_l_BATCHITEMRef)
		End if 
		DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
		
		DB_SaveRecord(->[TRANSACTION_BATCHES:30])
		//TransactionBatch_Post
		$_l_TransPostStatus:=TransactionBatch_Post
	End if 
	If ($_l_TransPostStatus>=0)
		//VALIDATE TRANSACTION
		Transact_End(True:C214)
	Else 
		
		//CANCEL TRANSACTION
		Transact_End(False:C215)
	End if 
End if 
ERR_MethodTrackerReturn("Purch PrePost"; $_t_oldMethodName)
