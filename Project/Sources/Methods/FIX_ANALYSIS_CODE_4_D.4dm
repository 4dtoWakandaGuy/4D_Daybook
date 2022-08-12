//%attributes = {}
If (False:C215)
	//Project Method Name:      FIX_ANALYSIS_CODE_4_D
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/09/2012 10:03
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_BatchNumbers; 0)
	C_LONGINT:C283($_l_BatchItemIndex; $_l_Index)
	C_TEXT:C284($_t_oldMethodName; ACC_t_AnalysisPeriodtoFix; vWT_AnalysisCode; vWT_AnalysisCodeReq; vWT_MESSAGE; vWT_POCode; vWT_SUBInvoice No; vWT_SUBInvoiceCode)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FIX_ANALYSIS_CODE_4_D")
//Project Method FIX_ANALYSIS_COD/3/2(ID 13685-2046)

//FIX_ANALYSIS_CODE_4: WT>11/15/00: fixes the Anaylsis Codes: [TRANS IN]
MESSAGES ON:C181
READ WRITE:C146(*)

//ALL RECORDS([TRANS IN])`10/07/02 pb
QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2=""; *)
QUERY:C277([TRANSACTION_BATCH_ITEMS:155];  & ; [TRANSACTION_BATCH_ITEMS:155]Period_Code:11=ACC_t_AnalysisPeriodtoFix)
SELECTION TO ARRAY:C260([TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31; $_al_BatchNumbers)
QUERY WITH ARRAY:C644([TRANSACTION_BATCHES:30]Batch_Number:10; $_al_BatchNumbers)

CREATE SET:C116([TRANSACTION_BATCHES:30]; "WT_One")
USE SET:C118("WT_One")  //[TRANS IN]
For ($_l_Index; 1; Records in set:C195("WT_One"))  //[TRANS IN]
	USE SET:C118("WT_One")
	GOTO SELECTED RECORD:C245([TRANSACTION_BATCHES:30]; $_l_Index)
	QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTION_BATCHES:30]Batch_Number:10)
	
	If (Records in selection:C76([TRANSACTION_BATCH_ITEMS:155])>0)
		USE SET:C118("WT_One")
		READ WRITE:C146([TRANSACTION_BATCHES:30])
		GOTO SELECTED RECORD:C245([TRANSACTION_BATCHES:30]; $_l_Index)
		QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTION_BATCHES:30]Batch_Number:10)
		
		MESSAGE:C88("Please wait, processing Trans-In record number "+String:C10($_l_Index)+" of "+String:C10(Records in set:C195("WT_One")))
		FIRST RECORD:C50([TRANSACTION_BATCH_ITEMS:155])
		vWT_SUBInvoice No:=[TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4
		vWT_SUBInvoiceCode:=[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2
		vWT_AnalysisCode:=[INVOICES:39]Analysis_Code:17
		vWT_POCode:=[INVOICES:39]Invoice_Number:1
		QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=vWT_SUBInvoice No)
		If (Records in selection:C76([INVOICES:39])=0)
			vWT_SUBInvoice No:=[TRANSACTION_BATCH_ITEMS:155]Purchase_invoice_Number:17
			QUERY:C277([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Purchase_Invoice_Number:4=vWT_SUBInvoice No)
			vWT_AnalysisCode:=[PURCHASE_INVOICES:37]Analysis_Code:15
		End if 
	End if 
	For ($_l_BatchItemIndex; 1; Records in selection:C76([TRANSACTION_BATCH_ITEMS:155]))
		If ([TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2="")
			[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2:=vWT_AnalysisCode
			DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
			
		End if 
		NEXT RECORD:C51([TRANSACTION_BATCH_ITEMS:155])
	End for 
	DB_SaveRecord(->[TRANSACTION_BATCHES:30])
	NEXT RECORD:C51([TRANSACTION_BATCHES:30])
End for 
ERR_MethodTrackerReturn("FIX_ANALYSIS_CODE_4_D"; $_t_oldMethodName)