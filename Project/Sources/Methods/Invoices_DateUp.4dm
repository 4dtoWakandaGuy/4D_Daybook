//%attributes = {}
If (False:C215)
	//Project Method Name:      Invoices_DateUp
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/09/2009 09:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Invoices_DateUp")
//RELATE ONE([TRANSACTIONS]Invoice No)
//[TRANSACTIONS]Trans_Date:=[INVOICES]Invoice Date
//DB_SaveRecord(->[TRANSACTIONS])
AA_CheckFileUnlocked(->[TRANSACTIONS:29]Transaction_ID:31)
QUERY:C277([TRANSACTION_BATCHES:30]; [TRANSACTION_BATCHES:30]Batch_Number:10=[TRANSACTIONS:29]Batch_Number:7)
QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTION_BATCHES:30]Batch_Number:10)

QUERY SELECTION:C341([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4=[INVOICES:39]Invoice_Number:1)
APPLY TO SELECTION:C70([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5:=[TRANSACTIONS:29]Trans_Date:5)
APPLY TO SELECTION:C70([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Period_Code:11:=[TRANSACTIONS:29]Period_Code:12)
[TRANSACTION_BATCHES:30]Batch_Date:1:=[TRANSACTIONS:29]Trans_Date:5
DB_SaveRecord(->[TRANSACTION_BATCHES:30])
ERR_MethodTrackerReturn("Invoices_DateUp"; $_t_oldMethodName)