//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Purchases_CheqN
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 11/04/2010 00:11
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_RecordModified)
	C_LONGINT:C283($_l_Index; $1; vSNo)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Purchases_CheqN")
Case of 
	: ($1=1)
		//  START TRANSACTION
		StartTransaction  // 13/05/02 pb
		
	: ($1=2)
		If (DB_GetLedgerPostBatch=False:C215)
			//  START TRANSACTION
			StartTransaction  // 13/05/02 pb
			
		End if 
End case 
READ WRITE:C146([PURCHASE_INVOICES:37])
READ WRITE:C146([TRANSACTIONS:29])
READ WRITE:C146([TRANSACTION_BATCHES:30])
FIRST RECORD:C50([PURCHASE_INVOICES:37])
OK:=1
MESSAGES OFF:C175

While ((Not:C34(End selection:C36([PURCHASE_INVOICES:37]))) & (OK=1))
	If (Locked:C147([PURCHASE_INVOICES:37]))
		OK:=0
	Else 
		[PURCHASE_INVOICES:37]Cheque_Number:26:=String:C10(vSNo)
		DB_SaveRecord(->[PURCHASE_INVOICES:37])
		
		If (OK=1)
			QUERY:C277([PURCHASE_INVOICE_ALLOCATIONS:159]; [PURCHASE_INVOICE_ALLOCATIONS:159]PURCHASES_INVOICE_CODE:6=[PURCHASE_INVOICES:37]Purchase_Code:1)
			
			
			QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Purchase_Code:24=[PURCHASE_INVOICE_ALLOCATIONS:159]Purchase_Code:1; *)
			If (Records in selection:C76([PURCHASE_INVOICE_ALLOCATIONS:159])>1)
				QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Purchase_Code:24=[PURCHASE_INVOICE_ALLOCATIONS:159]Purchase_Code:1; *)
				NEXT RECORD:C51([PURCHASE_INVOICE_ALLOCATIONS:159])
				While (Not:C34(End selection:C36([PURCHASE_INVOICE_ALLOCATIONS:159])))
					QUERY:C277([TRANSACTIONS:29];  | ; [TRANSACTIONS:29]Purchase_Code:24=[PURCHASE_INVOICE_ALLOCATIONS:159]Purchase_Code:1; *)
					NEXT RECORD:C51([PURCHASE_INVOICE_ALLOCATIONS:159])
				End while 
			Else 
				QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Purchase_Code:24=[PURCHASE_INVOICE_ALLOCATIONS:159]Purchase_Code:1; *)
			End if 
			QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Trans_Date:5=[PURCHASE_INVOICES:37]Invoice_Date:5)
			QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_Type_Code:1=DB_GetLedgerTRANSPurINVPay; *)
			QUERY SELECTION:C341([TRANSACTIONS:29];  | ; [TRANSACTIONS:29]Transaction_Type_Code:1=DB_GetLedgerTRANSPREpost)
			
			QUERY:C277([TRANSACTION_BATCHES:30]; [TRANSACTION_BATCHES:30]Batch_Number:10=[TRANSACTIONS:29]Batch_Number:7)
			If (Locked:C147([TRANSACTION_BATCHES:30]))
				OK:=0
			Else 
				QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTION_BATCHES:30]Batch_Number:10)
				
				While (Not:C34(End selection:C36([TRANSACTION_BATCH_ITEMS:155])))
					If ([TRANSACTION_BATCH_ITEMS:155]Company_Code:13=[PURCHASE_INVOICES:37]Company_Code:2)
						[TRANSACTION_BATCH_ITEMS:155]Cheque_Number:14:=[PURCHASE_INVOICES:37]Cheque_Number:26
						DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
						
						
					End if 
					NEXT RECORD:C51([TRANSACTION_BATCH_ITEMS:155])
				End while 
				DB_SaveRecord(->[TRANSACTION_BATCHES:30])
				If (OK=1)
					
					QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Batch_Number:7=[TRANSACTION_BATCHES:30]Batch_Number:10; *)
					QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Company_Code:9=[PURCHASE_INVOICES:37]Company_Code:2)
					If (Not:C34(In transaction:C397))
						DB_lockFile(->[TRANSACTIONS:29])
						APPLY TO SELECTION:C70([TRANSACTIONS:29]; [TRANSACTIONS:29]Cheque_Number:13:=[PURCHASE_INVOICES:37]Cheque_Number:26)
						
						AA_CheckFileUnlockedByTableNUM(Table:C252(->[TRANSACTIONS:29]))
					Else 
						FIRST RECORD:C50([TRANSACTIONS:29])
						For ($_l_Index; 1; Records in selection:C76([TRANSACTIONS:29]))
							[TRANSACTIONS:29]Cheque_Number:13:=[PURCHASE_INVOICES:37]Cheque_Number:26
							DB_SaveRecord(->[TRANSACTIONS:29])
							AA_CheckFileUnlockedByTableNUM(Table:C252(->[TRANSACTIONS:29]))
							NEXT RECORD:C51([TRANSACTIONS:29])
						End for 
					End if 
					
					If (Records in set:C195("LockedSet")>0)
						OK:=0
					End if 
					
				End if 
			End if 
		End if 
		vSNo:=vSNo+1
		NEXT RECORD:C51([PURCHASE_INVOICES:37])
	End if 
End while 

If (OK=0)
	Gen_Confirm("A Purchase or General Ledger record was locked by another User or Process."+"  Do you want to continue waiting?"; "Yes"; "No")
	If (OK=1)
		DelayTicks(60*30)
		Purchases_CheqN(0)
	End if 
End if 
READ ONLY:C145([TRANSACTIONS:29])
READ ONLY:C145([TRANSACTION_BATCHES:30])
UNLOAD RECORD:C212([TRANSACTIONS:29])
UNLOAD RECORD:C212([TRANSACTION_BATCHES:30])
MESSAGES ON:C181
Case of 
	: ($1=1)
		Transact_End
	: ($1=2)
		If (DB_GetLedgerPostBatch)
			If (OK=1)
				DB_bo_RecordModified:=True:C214
			Else 
				Gen_Alert("All postings made since opening the Payments screen have been Cancelled")
				CANCEL:C270
				OK:=0
			End if 
		Else 
			Transact_End
		End if 
End case 
ERR_MethodTrackerReturn("Purchases_CheqN"; $_t_oldMethodName)
