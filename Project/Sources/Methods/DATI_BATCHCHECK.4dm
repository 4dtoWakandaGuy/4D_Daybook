//%attributes = {}
If (False:C215)
	//Project Method Name:      DATI_BATCHCHECK
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 11:58
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_CheckTransactionMatch; 0)
	C_LONGINT:C283(<>LASTUSEDBATCH; $_l_Index; $_l_Index2)
	C_TEXT:C284(<>User_AccAdministrator; <>User_AccErrCode; $_t_oldMethodName)
	C_TIME:C306($_ti_DocumentRef)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DATI_BATCHCHECK")
CREATE EMPTY SET:C140([TRANSACTIONS:29]; "AllUsedTransactions")
CREATE EMPTY SET:C140([TRANSACTION_BATCHES:30]; "NoDebittransaction")
CREATE EMPTY SET:C140([TRANSACTION_BATCHES:30]; "NoCredittransaction")

<>LastUsedBatch:=0
<>User_AccAdministrator:="JCK"
<>User_AccErrCode:="Q"
MESSAGES OFF:C175
Repeat 
	ARRAY LONGINT:C221($_al_CheckTransactionMatch; 0)
	If (<>LastUsedBatch>0)
		QUERY:C277([TRANSACTION_BATCHES:30]; [TRANSACTION_BATCHES:30]Batch_Number:10><>LastUsedBatch)
	Else 
		ALL RECORDS:C47([TRANSACTION_BATCHES:30])
	End if 
	
	FIRST RECORD:C50([TRANSACTION_BATCHES:30])
	For ($_l_Index; 1; Records in selection:C76([TRANSACTION_BATCHES:30]))
		<>LastUsedBatch:=[TRANSACTION_BATCHES:30]Batch_Number:10
		QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Batch_Number:7=[TRANSACTION_BATCHES:30]Batch_Number:10)
		QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTION_BATCHES:30]Batch_Number:10)
		
		
		FIRST RECORD:C50([TRANSACTION_BATCH_ITEMS:155])
		For ($_l_Index2; 1; Records in selection:C76([TRANSACTION_BATCH_ITEMS:155]))
			If ([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3#"")
				QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Batch_Number:7=[TRANSACTION_BATCHES:30]Batch_Number:10; *)
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Account_Code:3=[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3; *)
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Amount:6=[TRANSACTION_BATCH_ITEMS:155]Amount:6; *)
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Tax_Amount:16=[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8)
				Case of 
					: (Records in selection:C76([TRANSACTIONS:29])=1)
						ADD TO SET:C119([TRANSACTIONS:29]; "AllUsedTransactions")
						If ([TRANSACTIONS:29]Tax_Amount:16>0)
							If ([TRANSACTION_BATCH_ITEMS:155]UK_EC:18="")
								[TRANSACTION_BATCH_ITEMS:155]UK_EC:18:=[TRANSACTIONS:29]UK_EC:21
							End if 
							If ([TRANSACTION_BATCH_ITEMS:155]UK_EC:18="")
								[TRANSACTION_BATCH_ITEMS:155]UK_EC:18:="U"
							End if 
							[TRANSACTION_BATCH_ITEMS:155]Tax_Code:7:="S"
						End if 
						If ([TRANSACTION_BATCH_ITEMS:155]Currency_Code:19="")
							[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19:="£"
						End if 
						DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
						
					: (Records in selection:C76([TRANSACTIONS:29])>1)
						CREATE SET:C116([TRANSACTIONS:29]; "AllValidTransactions")
						DIFFERENCE:C122("AllValidTransactions"; "AllUsedTransactions"; "AllValidTransactions")
						USE SET:C118("AllValidTransactions")
						REDUCE SELECTION:C351([TRANSACTIONS:29]; 1)
						If ([TRANSACTIONS:29]Tax_Amount:16>0)
							If ([TRANSACTION_BATCH_ITEMS:155]UK_EC:18="")
								[TRANSACTION_BATCH_ITEMS:155]UK_EC:18:=[TRANSACTIONS:29]UK_EC:21
							End if 
							If ([TRANSACTION_BATCH_ITEMS:155]UK_EC:18="")
								[TRANSACTION_BATCH_ITEMS:155]UK_EC:18:="U"
							End if 
							[TRANSACTION_BATCH_ITEMS:155]Tax_Code:7:="S"
						End if 
						If ([TRANSACTION_BATCH_ITEMS:155]Currency_Code:19="")
							[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19:="£"
						End if 
						DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
						
						ADD TO SET:C119([TRANSACTIONS:29]; "AllUsedTransactions")
						CLEAR SET:C117("AllValidTransactions")
					Else 
						//  TRACE
						//here add batch to faulty batches
						ADD TO SET:C119([TRANSACTION_BATCHES:30]; "NoDebittransaction")
				End case 
			End if 
			If ([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12#"")
				QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Batch_Number:7=[TRANSACTION_BATCHES:30]Batch_Number:10; *)
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Account_Code:3=[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12; *)
				If ([TRANSACTION_BATCH_ITEMS:155]Total:9>0)
					QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Amount:6=-([TRANSACTION_BATCH_ITEMS:155]Total:9))
				Else 
					QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Amount:6=Abs:C99([TRANSACTION_BATCH_ITEMS:155]Total:9))
				End if 
				
				Case of 
					: (Records in selection:C76([TRANSACTIONS:29])=1)
						ADD TO SET:C119([TRANSACTIONS:29]; "AllUsedTransactions")
					: (Records in selection:C76([TRANSACTIONS:29])>1)
						CREATE SET:C116([TRANSACTIONS:29]; "AllValidTransactions")
						DIFFERENCE:C122("AllValidTransactions"; "AllUsedTransactions"; "AllValidTransactions")
						USE SET:C118("AllValidTransactions")
						REDUCE SELECTION:C351([TRANSACTIONS:29]; 1)
						ADD TO SET:C119([TRANSACTIONS:29]; "AllUsedTransactions")
						CLEAR SET:C117("AllValidTransactions")
					Else 
						//  TRACE
						ADD TO SET:C119([TRANSACTION_BATCHES:30]; "NoCredittransaction")
						
				End case 
			End if 
			NEXT RECORD:C51([TRANSACTION_BATCH_ITEMS:155])
		End for 
		
		DB_SaveRecord(->[TRANSACTION_BATCHES:30])
		NEXT RECORD:C51([TRANSACTION_BATCHES:30])
	End for 
	ALL RECORDS:C47([TRANSACTIONS:29])
	CREATE SET:C116([TRANSACTIONS:29]; "ALL")
	DIFFERENCE:C122("All"; "AllusedTransactions"; "ALL")
	//All is now the transactions that dont link to batches.
	USE SET:C118("ALL")
	If (Records in selection:C76([TRANSACTIONS:29])>0)
		//Create a diary record
		$_ti_DocumentRef:=DB_CreateDocument("Transactions_CheckBatch.TXT"; "TEXT")
		SEND PACKET:C103($_ti_DocumentRef; "The following Transaction do not appear to relate to any")
		SEND PACKET:C103($_ti_DocumentRef; "Batch, Please validate these manually"+Char:C90(13))
		SEND PACKET:C103($_ti_DocumentRef; "Trans Code"+Char:C90(9)+"Analysis Code"+Char:C90(9))
		SEND PACKET:C103($_ti_DocumentRef; "Account Code"+Char:C90(9)+"Invoice Nº"+Char:C90(9))
		SEND PACKET:C103($_ti_DocumentRef; "Transaction Date"+Char:C90(9)+"Amount"+Char:C90(9))
		SEND PACKET:C103($_ti_DocumentRef; "Batch Nº"+Char:C90(9)+"Company Code"+Char:C90(9))
		SEND PACKET:C103($_ti_DocumentRef; "Entry Date"+Char:C90(9)+"Period Code"+Char:C90(9))
		SEND PACKET:C103($_ti_DocumentRef; "Cheque Nº"+Char:C90(9)+"Reconciled"+Char:C90(9)+"Tax Amount"+Char:C90(9))
		SEND PACKET:C103($_ti_DocumentRef; "Total"+Char:C90(9)+"IO"+Char:C90(9))
		SEND PACKET:C103($_ti_DocumentRef; "Purchase Inv_No"+Char:C90(9)+"Tax Code"+Char:C90(9))
		SEND PACKET:C103($_ti_DocumentRef; "UKEC"+Char:C90(9)+"Currency Code"+Char:C90(9))
		SEND PACKET:C103($_ti_DocumentRef; "Layer Code"+Char:C90(9)+"Purchase Code"+Char:C90(9))
		SEND PACKET:C103($_ti_DocumentRef; "Job Code"+Char:C90(9))
		
		SEND PACKET:C103($_ti_DocumentRef; "Tax Period"+Char:C90(13))
		
		
		FIRST RECORD:C50([TRANSACTIONS:29])
		For ($_l_Index; 1; Records in selection:C76([TRANSACTIONS:29]))
			SEND PACKET:C103($_ti_DocumentRef; [TRANSACTIONS:29]Transaction_Type_Code:1+Char:C90(9)+[TRANSACTIONS:29]Analysis_Code:2+Char:C90(9))
			SEND PACKET:C103($_ti_DocumentRef; [TRANSACTIONS:29]Account_Code:3+Char:C90(9)+[TRANSACTIONS:29]Invoice_Number:4+Char:C90(9))
			SEND PACKET:C103($_ti_DocumentRef; String:C10([TRANSACTIONS:29]Trans_Date:5)+Char:C90(9)+String:C10([TRANSACTIONS:29]Amount:6)+Char:C90(9))
			SEND PACKET:C103($_ti_DocumentRef; String:C10([TRANSACTIONS:29]Batch_Number:7)+Char:C90(9)+[TRANSACTIONS:29]Company_Code:9+Char:C90(9))
			SEND PACKET:C103($_ti_DocumentRef; String:C10([TRANSACTIONS:29]Entry_Date:11)+Char:C90(9)+[TRANSACTIONS:29]Period_Code:12+Char:C90(9))
			SEND PACKET:C103($_ti_DocumentRef; [TRANSACTIONS:29]Cheque_Number:13+Char:C90(9)+String:C10(Num:C11([TRANSACTIONS:29]Reconciled:14))+Char:C90(9))
			SEND PACKET:C103($_ti_DocumentRef; String:C10([TRANSACTIONS:29]Tax_Amount:16)+Char:C90(9)+String:C10([TRANSACTIONS:29]Total:17)+Char:C90(9)+[TRANSACTIONS:29]IO:18+Char:C90(9))
			SEND PACKET:C103($_ti_DocumentRef; [TRANSACTIONS:29]Purchase_invoice_number:19+Char:C90(9)+[TRANSACTIONS:29]Tax_Code:20+Char:C90(9))
			SEND PACKET:C103($_ti_DocumentRef; [TRANSACTIONS:29]UK_EC:21+Char:C90(9)+[TRANSACTIONS:29]Currency_Code:22+Char:C90(9))
			SEND PACKET:C103($_ti_DocumentRef; [TRANSACTIONS:29]Layer_Code:23+Char:C90(9)+[TRANSACTIONS:29]Purchase_Code:24+Char:C90(9))
			SEND PACKET:C103($_ti_DocumentRef; [TRANSACTIONS:29]Job_Code:25+Char:C90(9))
			SEND PACKET:C103($_ti_DocumentRef; "Tax Period"+Char:C90(13))
			NEXT RECORD:C51([TRANSACTIONS:29])
		End for 
		CLOSE DOCUMENT:C267($_ti_DocumentRef)
		CREATE RECORD:C68([DIARY:12])
		DiarySetCode
		[DIARY:12]Date_Do_From:4:=Current date:C33(*)
		[DIARY:12]Person:8:=<>User_AccAdministrator
		[DIARY:12]Action_Code:9:=<>User_AccErrCode
		[DIARY:12]Action_Details:10:="There are faulty transactions which need validating, please locate"
		[DIARY:12]Action_Details:10:=[DIARY:12]Action_Details:10+" Document Transactions_CheckBatch.TXT"
		[DIARY:12]Action_Details:10:=[DIARY:12]Action_Details:10+" Correct any faulty data"
		DB_SaveRecord(->[DIARY:12])
		AA_CheckFileUnlocked(->[DIARY:12]x_ID:50)
		
	End if 
	USE SET:C118("NoDebittransaction")
	If (Records in selection:C76([TRANSACTIONS:29])>0)
		//Create a diary record
		$_ti_DocumentRef:=DB_CreateDocument("Batch_CheckTransactionD.TXT"; "TEXT")
		SEND PACKET:C103($_ti_DocumentRef; "The following Batches do not appear to have a related ")
		SEND PACKET:C103($_ti_DocumentRef; "Debit transaction for one or more batch items, Please validate these manually"+Char:C90(13))
		SEND PACKET:C103($_ti_DocumentRef; "Batch Date"+Char:C90(9)+"[TRANS IN]Batch No"+Char:C90(13))
		FIRST RECORD:C50([TRANSACTION_BATCHES:30])
		For ($_l_Index; 1; Records in selection:C76([TRANSACTION_BATCHES:30]))
			SEND PACKET:C103($_ti_DocumentRef; String:C10([TRANSACTION_BATCHES:30]Batch_Date:1)+Char:C90(9)+String:C10([TRANSACTION_BATCHES:30]Batch_Number:10)+Char:C90(13))
			NEXT RECORD:C51([TRANSACTION_BATCHES:30])
		End for 
		CLOSE DOCUMENT:C267($_ti_DocumentRef)
		CREATE RECORD:C68([DIARY:12])
		DiarySetCode
		[DIARY:12]Date_Do_From:4:=Current date:C33(*)
		[DIARY:12]Person:8:=<>User_AccAdministrator
		[DIARY:12]Action_Code:9:=<>User_AccErrCode
		[DIARY:12]Action_Details:10:="There are faulty Batches which need validating, please locate"
		[DIARY:12]Action_Details:10:=[DIARY:12]Action_Details:10+" Batch_CheckTransactionD.TXT"
		[DIARY:12]Action_Details:10:=[DIARY:12]Action_Details:10+" Correct any faulty data"
		DB_SaveRecord(->[DIARY:12])
		AA_CheckFileUnlocked(->[DIARY:12]x_ID:50)
		
	End if 
	USE SET:C118("NoCredittransaction")
	If (Records in selection:C76([TRANSACTIONS:29])>0)
		//Create a diary record
		$_ti_DocumentRef:=DB_CreateDocument("Batch_CheckTransactionC.TXT"; "TEXT")
		SEND PACKET:C103($_ti_DocumentRef; "The following Batches do not appear to have a related ")
		SEND PACKET:C103($_ti_DocumentRef; "Credit transaction for one or more batch items, Please validate these manually"+Char:C90(13))
		SEND PACKET:C103($_ti_DocumentRef; "Batch Date"+Char:C90(9)+"[TRANS IN]Batch No"+Char:C90(13))
		FIRST RECORD:C50([TRANSACTION_BATCHES:30])
		For ($_l_Index; 1; Records in selection:C76([TRANSACTION_BATCHES:30]))
			SEND PACKET:C103($_ti_DocumentRef; String:C10([TRANSACTION_BATCHES:30]Batch_Date:1)+Char:C90(9)+String:C10([TRANSACTION_BATCHES:30]Batch_Number:10)+Char:C90(13))
			NEXT RECORD:C51([TRANSACTION_BATCHES:30])
		End for 
		CLOSE DOCUMENT:C267($_ti_DocumentRef)
		CREATE RECORD:C68([DIARY:12])
		DiarySetCode
		[DIARY:12]Date_Do_From:4:=Current date:C33(*)
		[DIARY:12]Person:8:=<>User_AccAdministrator
		[DIARY:12]Action_Code:9:=<>User_AccErrCode
		[DIARY:12]Action_Details:10:="There are faulty Batches which need validating, please locate"
		[DIARY:12]Action_Details:10:=[DIARY:12]Action_Details:10+" Batch_CheckTransactionC.TXT"
		[DIARY:12]Action_Details:10:=[DIARY:12]Action_Details:10+" Correct any faulty data"
		DB_SaveRecord(->[DIARY:12])
		AA_CheckFileUnlocked(->[DIARY:12]x_ID:50)
		
	End if 
	
	CLEAR SET:C117("All")
Until (OK=0)

CLEAR SET:C117("AllusedTransactions")
ERR_MethodTrackerReturn("DATI_BATCHCHECK"; $_t_oldMethodName)