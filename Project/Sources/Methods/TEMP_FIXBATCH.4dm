//%attributes = {}
If (False:C215)
	//Project Method Name:      TEMP_FIXBATCH
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_REAL:C285(MRecords; MRequestNo)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("TEMP_FIXBATCH")
MRequestNo:=14106

QUERY:C277([TRANSACTION_BATCHES:30]; [TRANSACTION_BATCHES:30]Batch_Number:10=MRequestNo)
MRecords:=Records in selection:C76([TRANSACTION_BATCHES:30])
If (MRecords=1)
	Gen_Confirm("This is going to delete the batch, the transactions and the PO Allocation"; "CONTINUE"; "STOP")
	If (OK=1)
		READ WRITE:C146([PURCHASE_INVOICES:37])
		QUERY:C277([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Purchase_Code:1="*S18232")
		DELETE RECORD:C58([PURCHASE_INVOICES:37])
		READ WRITE:C146([TRANSACTIONS:29])
		QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Batch_Number:7=MRequestNo)
		DELETE RECORD:C58([TRANSACTIONS:29])
		
		READ WRITE:C146([TRANSACTION_BATCHES:30])
		LOAD RECORD:C52([TRANSACTION_BATCHES:30])
		DELETE RECORD:C58([TRANSACTION_BATCHES:30])
		Gen_Alert("All DONE, you should now re-enter the PO allocation")
		
	End if 
	
End if 
ERR_MethodTrackerReturn("TEMP_FIXBATCH"; $_t_oldMethodName)