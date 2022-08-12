//%attributes = {}
If (False:C215)
	//Project Method Name:      FIX_ANALYSIS_CODE_1
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
	C_LONGINT:C283($_l_Index; $_l_Index2; $_l_Index3)
	C_TEXT:C284($_t_AnalysisCode; $_t_oldMethodName; $_t_POCode; vWT_AnalysisCodeReq; ACC_t_AnalysisPeriodtoFix; vWT_MESSAGE)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FIX_ANALYSIS_CODE_1")
//P`roject Method FIX_ANALYSIS_COD/3/2(ID 21381-2158)

//FIX_ANALYSIS_CODE_1: WT>11/08/00: fixes the Anaylsis Codes
MESSAGES ON:C181
READ WRITE:C146(*)

//ALL RECORDS([PURCHASES])`10/07/02 pb
QUERY:C277([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Period_Code:3#""; *)
QUERY:C277([PURCHASE_INVOICES:37];  & ; [PURCHASE_INVOICE_ITEMS:158]Analysis_Code:9="")
If (Records in selection:C76([PURCHASE_INVOICES:37])>0)
	CREATE SET:C116([PURCHASE_INVOICES:37]; "$Set1")
End if 
USE SET:C118("$Set1")  //PURCHASES
If (Records in set:C195("$Set1")>0)
	For ($_l_Index; 1; Records in set:C195("$Set1"))  //PURCHASES
		USE SET:C118("$Set1")
		GOTO SELECTED RECORD:C245([PURCHASE_INVOICES:37]; $_l_Index)
		MESSAGE:C88("Please wait, processing Purchase Invoice record number "+String:C10($_l_Index)+" of "+String:C10(Records in set:C195("$Set1")))
		$_t_AnalysisCode:=[PURCHASE_INVOICES:37]Analysis_Code:15
		$_t_POCode:=[PURCHASE_INVOICES:37]Purchase_Invoice_Number:4
		QUERY:C277([PURCHASE_INVOICE_ITEMS:158]; [PURCHASE_INVOICE_ITEMS:158]PURCHASE_INVOICE_CODE:17=[PURCHASE_INVOICES:37]Purchase_Code:1)
		FIRST RECORD:C50([PURCHASE_INVOICE_ITEMS:158])
		For ($_l_Index2; 1; Records in selection:C76([PURCHASE_INVOICE_ITEMS:158]))
			If ([PURCHASE_INVOICE_ITEMS:158]Analysis_Code:9="")
				[PURCHASE_INVOICE_ITEMS:158]Analysis_Code:9:=[PURCHASE_INVOICES:37]Analysis_Code:15
				DB_SaveRecord(->[PURCHASE_INVOICE_ITEMS:158])
				
			End if 
			NEXT RECORD:C51([PURCHASE_INVOICE_ITEMS:158])
		End for 
		DB_SaveRecord(->[PURCHASE_INVOICES:37])
		QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Purchase_invoice_Number:17=[PURCHASE_INVOICES:37]Purchase_Invoice_Number:4)
		SELECTION TO ARRAY:C260([TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31; $_al_BatchNumbers)
		QUERY WITH ARRAY:C644([TRANSACTION_BATCHES:30]Batch_Number:10; $_al_BatchNumbers)
		
		If (Records in selection:C76([TRANSACTION_BATCHES:30])>0)
			FIRST RECORD:C50([TRANSACTION_BATCHES:30])
			For ($_l_Index2; 1; Records in selection:C76([TRANSACTION_BATCHES:30]))
				QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTION_BATCHES:30]Batch_Number:10; *)
				QUERY:C277([TRANSACTION_BATCH_ITEMS:155];  & ; [TRANSACTION_BATCH_ITEMS:155]Purchase_invoice_Number:17=[PURCHASE_INVOICES:37]Purchase_Invoice_Number:4)
				
				FIRST RECORD:C50([TRANSACTION_BATCH_ITEMS:155])
				For ($_l_Index3; 1; Records in selection:C76([TRANSACTION_BATCH_ITEMS:155]))
					If ([TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2="")
						[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2:=$_t_AnalysisCode
						DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
					End if 
					NEXT RECORD:C51([TRANSACTION_BATCH_ITEMS:155])
				End for 
				DB_SaveRecord(->[TRANSACTION_BATCHES:30])
				NEXT RECORD:C51([TRANSACTION_BATCHES:30])
			End for 
		End if 
		NEXT RECORD:C51([PURCHASE_INVOICES:37])
	End for 
End if 
ERR_MethodTrackerReturn("FIX_ANALYSIS_CODE_1"; $_t_oldMethodName)