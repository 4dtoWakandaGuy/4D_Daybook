//%attributes = {}
If (False:C215)
	//Project Method Name:      TrananalReport
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:                28/09/2011 13:57 v7.0.0/1
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_BatchNumbers; 0)
	C_LONGINT:C283($_l_IndexBatchItems; $_l_IndexBatchNumbers; $_l_IndexInvoices)
	C_TEXT:C284($_t_CurrentAnalysis; $_t_oldMethodName)
	C_TIME:C306($_ti_DocumentRef)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("TrananalReport")
$_ti_DocumentRef:=Create document:C266(""; "TEXT")
ALL RECORDS:C47([INVOICES:39])
FIRST RECORD:C50([INVOICES:39])
ORDER BY:C49([INVOICES:39]; [INVOICES:39]Invoice_Date:4; >)

For ($_l_IndexInvoices; 1; Records in selection:C76([INVOICES:39]))
	MESSAGE:C88([INVOICES:39]Invoice_Number:1)
	If ([INVOICES:39]Invoice_Number:1#"")
		$_t_CurrentAnalysis:=[INVOICES:39]Analysis_Code:17
		SEND PACKET:C103($_ti_DocumentRef; "Invoice Number"+[INVOICES:39]Invoice_Number:1+Char:C90(9)+"Analysis Code="+[INVOICES:39]Analysis_Code:17+Char:C90(13))
		QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4=[INVOICES:39]Invoice_Number:1)
		If (Records in selection:C76([TRANSACTION_BATCH_ITEMS:155])>0)
			
			DISTINCT VALUES:C339([TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31; $_al_BatchNumbers)
			For ($_l_IndexBatchItems; 1; Records in selection:C76([TRANSACTION_BATCH_ITEMS:155]))
				//SEND PACKET($_ti_DocumentRef;String([TRANS IN_TRANS SUB]BatchItemID)+Char(9)+String([TRANS IN_TRANS SUB]Parent_record_code)+Char(9)+String([TRANS IN_TRANS SUB]Amount)+Char(9)+{[TRANS IN_TRANS SUB]Invoice No)+Char(13))
				
				NEXT RECORD:C51([TRANSACTION_BATCH_ITEMS:155])
			End for 
			
			For ($_l_IndexBatchNumbers; 1; Size of array:C274($_al_BatchNumbers))
				QUERY:C277([TRANSACTION_BATCHES:30]; [TRANSACTION_BATCHES:30]Batch_Number:10=$_al_BatchNumbers{$_l_IndexBatchNumbers})
				SEND PACKET:C103($_ti_DocumentRef; String:C10($_al_BatchNumbers{$_l_IndexBatchNumbers})+Char:C90(13))
				QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Batch_Number:7=$_al_BatchNumbers{$_l_IndexBatchNumbers})
				//QUERY([TRANSACTIONS]; & ;[TRANSACTIONS]Batch No=$_t_CurrentAnalysis)
				//QUERY([TRANSACTIONS]; & ;[TRANSACTIONS]Invoice No=[INVOICES]Invoice No)
				For ($_l_IndexBatchItems; 1; Records in selection:C76([TRANSACTIONS:29]))
					
					SEND PACKET:C103($_ti_DocumentRef; String:C10([TRANSACTIONS:29]BatchItem_X_ID:30)+Char:C90(9)+String:C10([TRANSACTIONS:29]Batch_Number:7)+Char:C90(9)+[TRANSACTIONS:29]Invoice_Number:4+Char:C90(13))
					NEXT RECORD:C51([TRANSACTIONS:29])
				End for 
			End for 
		End if 
	Else 
		SEND PACKET:C103($_ti_DocumentRef; "No Batch?"+Char:C90(13))
		
		
	End if 
	
	NEXT RECORD:C51([INVOICES:39])
End for 
CLOSE DOCUMENT:C267($_ti_DocumentRef)
ERR_MethodTrackerReturn("TrananalReport"; $_t_oldMethodName)