//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Inv_InvPostP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/04/2010 12:15
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(vInvDate)
	C_LONGINT:C283($_l_BatchItemID; $_l_BatchItemReference; $_l_RecordsInSelection; $_l_RecordsinSelectionInvoiceIte; DS_l_BATCHITEMRef)
	C_REAL:C285(vSubtotal; vTotal; vVAT)
	C_TEXT:C284($_t_oldMethodName; $_t_SalesAccount; $_t_SalesAnalysisCode)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Inv_InvPostP")
//Inv_InvPostP
Inv_InvCalc
If (([INVOICES:39]Total_Invoiced_Excluding_Tax:26#vSubtotal) | ([INVOICES:39]Total_Tax:35#vVAT) | ([INVOICES:39]Total_Invoiced:5#vTotal))
	Gen_Alert("Invoice "+[INVOICES:39]Invoice_Number:1+" was not posted because the Total figures at its base did not equal "+"the sum of its Items.  This may indicate a data corruption."; "Cancel")
	OK:=0
Else 
	OK:=1
	$_t_SalesAccount:=[INVOICES_ITEMS:161]Sales_Account:9
	$_t_SalesAnalysisCode:=[INVOICES_ITEMS:161]Analysis_Code:10
	$_l_RecordsinSelectionInvoiceIte:=Records in selection:C76([INVOICES_ITEMS:161])
	QUERY:C277([INVOICES_ITEMS:161]; [INVOICES_ITEMS:161]Sales_Account:9=$_t_SalesAccount; *)
	QUERY:C277([INVOICES_ITEMS:161];  & ; [INVOICES_ITEMS:161]Analysis_Code:10=$_t_SalesAnalysisCode)
	
	If (($_l_RecordsinSelectionInvoiceIte>1) & ($_l_RecordsinSelectionInvoiceIte=Records in selection:C76([INVOICES_ITEMS:161])))
		QUERY:C277([INVOICES_ITEMS:161]; [INVOICES_ITEMS:161]INVOICES_CODE:18=[INVOICES:39]Invoice_Number:1)
		FIRST RECORD:C50([INVOICES_ITEMS:161])
		CREATE RECORD:C68([TRANSACTION_BATCH_ITEMS:155])
		[TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31:=[TRANSACTION_BATCHES:30]Batch_Number:10
		[TRANSACTION_BATCH_ITEMS:155]ID:30:=AA_GetNextID(->[TRANSACTION_BATCH_ITEMS:155]ID:30)
		[TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1:=DB_GetLedgerTRANSINVpost
		[TRANSACTION_BATCH_ITEMS:155]Description:10:="All Invoice Items"
		If ([INVOICES:39]Debtors_Account:15#"")
			[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3:=[INVOICES:39]Debtors_Account:15
		Else 
			[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3:=[TRANSACTION_TYPES:31]Debit_Account:4
		End if 
		RELATE ONE:C42([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3)
		[TRANSACTION_BATCH_ITEMS:155]Debit_IO:15:=[ACCOUNTS:32]IO:5
		[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12:=[INVOICES_ITEMS:161]Sales_Account:9
		[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2:=[INVOICES_ITEMS:161]Analysis_Code:10
		If ([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12="")
			[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12:=[TRANSACTION_TYPES:31]Credit_Account:5
			[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2:=[TRANSACTION_TYPES:31]Analysis_Code:7
		End if 
		RELATE ONE:C42([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12)
		[TRANSACTION_BATCH_ITEMS:155]Credit_IO:16:=[ACCOUNTS:32]IO:5
		If ((DB_GetLedgerCashvatACC#"") & (DB_GetLedgerisCashVAT))
			[TRANSACTION_BATCH_ITEMS:155]Credit_IO:16:=[TRANSACTION_BATCH_ITEMS:155]Credit_IO:16+"S"
		End if 
		[TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4:=[INVOICES:39]Invoice_Number:1
		[TRANSACTION_BATCH_ITEMS:155]Job_Code:23:=[INVOICES:39]Booking_Code:24
		[TRANSACTION_BATCH_ITEMS:155]Company_Code:13:=[INVOICES:39]Company_Code:2
		[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5:=vInvDate
		[TRANSACTION_BATCH_ITEMS:155]Period_Code:11:=[INVOICES:39]Period_Code:13
		[TRANSACTION_BATCH_ITEMS:155]Tax_Code:7:=[INVOICES_ITEMS:161]Tax_Code:6
		//  RELATE ONE([TRANS IN_TRANS SUB]Tax Code)
		[TRANSACTION_BATCH_ITEMS:155]Amount:6:=vSubtotal
		[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8:=vVAT
		[TRANSACTION_BATCH_ITEMS:155]Total:9:=vTotal
		[TRANSACTION_BATCH_ITEMS:155]UK_EC:18:=[INVOICES:39]UK_EC:21
		[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19:=[INVOICES:39]Currency_Code:27
		[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20:=[INVOICES:39]Layer_Code:38
		[TRANSACTION_BATCH_ITEMS:155]Second_Amount:21:=Gen_Round((Sum:C1([INVOICES_ITEMS:161]Cost_Amount:15)); 2; 2)
		If ([TRANSACTION_BATCH_ITEMS:155]BatchItemID:25=0)
			[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=AA_GetNextIDinMethod(->DS_l_BATCHITEMRef)
		End if 
		DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
	Else 
		QUERY:C277([INVOICES_ITEMS:161]; [INVOICES_ITEMS:161]INVOICES_CODE:18=[INVOICES:39]Invoice_Number:1)
		FIRST RECORD:C50([INVOICES_ITEMS:161])
		
		$_l_BatchItemReference:=0
		$_l_BatchItemID:=0
		$_l_RecordsInSelection:=Records in selection:C76([INVOICES_ITEMS:161])
		$_l_BatchItemID:=(AA_GetNextID(->[TRANSACTION_BATCH_ITEMS:155]ID:30; -$_l_RecordsInSelection))-$_l_RecordsInSelection
		$_l_BatchItemReference:=(AA_GetNextIDinMethod(->DS_l_BATCHITEMRef; -$_l_RecordsInSelection))-$_l_RecordsInSelection
		
		While (Not:C34(End selection:C36([INVOICES_ITEMS:161])))
			If (([INVOICES_ITEMS:161]Amount:5#0) | ([INVOICES_ITEMS:161]Tax_Amount:7#0) | ([INVOICES_ITEMS:161]Total_Amount:8#0))
				CREATE RECORD:C68([TRANSACTION_BATCH_ITEMS:155])
				[TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31:=[TRANSACTION_BATCHES:30]Batch_Number:10
				If ($_l_BatchItemID>0)
					[TRANSACTION_BATCH_ITEMS:155]ID:30:=$_l_BatchItemID
					$_l_BatchItemID:=$_l_BatchItemID+1
				Else 
					[TRANSACTION_BATCH_ITEMS:155]ID:30:=AA_GetNextID(->[TRANSACTION_BATCH_ITEMS:155]ID:30)
				End if 
				
				[TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1:=DB_GetLedgerTRANSINVpost
				[TRANSACTION_BATCH_ITEMS:155]Description:10:=[INVOICES_ITEMS:161]Product_Code:1+": "+[INVOICES_ITEMS:161]Product_Name:2
				If ([INVOICES:39]Debtors_Account:15#"")
					[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3:=[INVOICES:39]Debtors_Account:15
				Else 
					[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3:=[TRANSACTION_TYPES:31]Debit_Account:4
				End if 
				RELATE ONE:C42([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3)
				[TRANSACTION_BATCH_ITEMS:155]Debit_IO:15:=[ACCOUNTS:32]IO:5
				[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12:=[INVOICES_ITEMS:161]Sales_Account:9
				[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2:=[INVOICES_ITEMS:161]Analysis_Code:10
				If ([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12="")
					[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12:=[TRANSACTION_TYPES:31]Credit_Account:5
					[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2:=[TRANSACTION_TYPES:31]Analysis_Code:7
				End if 
				RELATE ONE:C42([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12)
				[TRANSACTION_BATCH_ITEMS:155]Credit_IO:16:=[ACCOUNTS:32]IO:5
				If ((DB_GetLedgerCashvatACC#"") & (DB_GetLedgerisCashVAT))
					[TRANSACTION_BATCH_ITEMS:155]Credit_IO:16:=[TRANSACTION_BATCH_ITEMS:155]Credit_IO:16+"S"
				End if 
				[TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4:=[INVOICES:39]Invoice_Number:1
				[TRANSACTION_BATCH_ITEMS:155]Job_Code:23:=[INVOICES:39]Booking_Code:24
				[TRANSACTION_BATCH_ITEMS:155]Company_Code:13:=[INVOICES:39]Company_Code:2
				[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5:=vInvDate
				[TRANSACTION_BATCH_ITEMS:155]Period_Code:11:=[INVOICES:39]Period_Code:13
				[TRANSACTION_BATCH_ITEMS:155]Tax_Code:7:=[INVOICES_ITEMS:161]Tax_Code:6
				//  RELATE ONE([TRANS IN_TRANS SUB]Tax Code)
				[TRANSACTION_BATCH_ITEMS:155]Amount:6:=[INVOICES_ITEMS:161]Amount:5
				[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8:=[INVOICES_ITEMS:161]Tax_Amount:7
				[TRANSACTION_BATCH_ITEMS:155]Total:9:=[INVOICES_ITEMS:161]Total_Amount:8
				[TRANSACTION_BATCH_ITEMS:155]UK_EC:18:=[INVOICES:39]UK_EC:21
				[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19:=[INVOICES:39]Currency_Code:27
				[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20:=[INVOICES:39]Layer_Code:38
				[TRANSACTION_BATCH_ITEMS:155]Second_Amount:21:=[INVOICES_ITEMS:161]Cost_Amount:15
				If ([TRANSACTION_BATCH_ITEMS:155]BatchItemID:25=0)
					If ($_l_BatchItemReference>0)
						[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=$_l_BatchItemReference
						$_l_BatchItemReference:=$_l_BatchItemReference+1
					Else 
						[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=AA_GetNextIDinMethod(->DS_l_BATCHITEMRef)
					End if 
				End if 
				DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
			End if 
			NEXT RECORD:C51([INVOICES_ITEMS:161])
		End while 
	End if 
End if 
ERR_MethodTrackerReturn("Inv_InvPostP"; $_t_oldMethodName)