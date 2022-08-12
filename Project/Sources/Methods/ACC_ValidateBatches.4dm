//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_ValidateBatches
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/11/2009 17:13`Method: ACC_ValidateBatches
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_BatchNumbers; 0)
	C_BOOLEAN:C305($_bo_IsPLYT)
	C_LONGINT:C283($_l_Index; $_l_Index2)
	C_REAL:C285($_r_CreditAmount; $_r_CreditTotal; $_r_CreditVAT; $_r_DebitAmount; $_r_DebitTotal; $_r_DebitVAT; $_r_Value)
	C_TEXT:C284($_t_CreditIO; $_t_DebitIO; $_t_oldMethodName)
	C_TIME:C306($_ti_DocumentRef)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_ValidateBatches")
//this method will check that each batch in the system is balancing
//by their very nature only batch items that ha ve a
//single sided posting can be wrong
QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Debit_Account:3=""; *)
QUERY:C277([TRANSACTION_BATCH_ITEMS:155];  | ; [TRANSACTION_BATCH_ITEMS:155]Credit_Account:12="")
SELECTION TO ARRAY:C260([TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31; $_al_BatchNumbers)
QUERY WITH ARRAY:C644([TRANSACTION_BATCHES:30]Batch_Number:10; $_al_BatchNumbers)


$_ti_DocumentRef:=?00:00:00?
For ($_l_Index; 1; Records in selection:C76([TRANSACTION_BATCHES:30]))
	QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTION_BATCHES:30]Batch_Number:10)
	
	FIRST RECORD:C50([TRANSACTION_BATCH_ITEMS:155])
	$_r_Value:=0
	$_bo_IsPLYT:=False:C215
	For ($_l_Index2; 1; Records in selection:C76([TRANSACTION_BATCH_ITEMS:155]))
		Case of 
			: ([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3="") & ([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12#"")
				$_r_Value:=$_r_Value+[TRANSACTION_BATCH_ITEMS:155]Amount:6
				$_bo_IsPLYT:=([TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1="PLYT")
			: ([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3#"") & ([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12="")
				$_r_Value:=$_r_Value-[TRANSACTION_BATCH_ITEMS:155]Amount:6
				$_bo_IsPLYT:=([TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1="PLYT")
			: ([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3#"") & ([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12#"")
		End case 
		NEXT RECORD:C51([TRANSACTION_BATCH_ITEMS:155])
	End for 
	If ($_r_Value#0) & (Not:C34($_bo_IsPLYT))
		If ($_ti_DocumentRef=?00:00:00?)
			//  ALERT("There are errors to be reported, please create document to put them in"
			Gen_Alert("There are errors to be reported. Please create a document to put them in.")
			$_ti_DocumentRef:=DB_CreateDocument(""; "TEXT")
			If ($_ti_DocumentRef#?00:00:00?)
				SEND PACKET:C103($_ti_DocumentRef; "Batch Balance Validation"+Char:C90(13)+"Please check the following batch numbers"+Char:C90(13))
			End if 
		End if 
		If ($_ti_DocumentRef#?00:00:00?)
			SEND PACKET:C103($_ti_DocumentRef; String:C10([TRANSACTION_BATCHES:30]Batch_Number:10)+Char:C90(9)+"Imbalance"+String:C10($_r_Value)+Char:C90(13))
		End if 
	End if 
	NEXT RECORD:C51([TRANSACTION_BATCHES:30])
End for 
If ($_ti_DocumentRef#?00:00:00?)
	CLOSE DOCUMENT:C267($_ti_DocumentRef)
Else 
	
	CONFIRM:C162("There are no imbalanced Batches(TRANS IN).Check Transactions?"; "Yes"; "No")
	
	$_ti_DocumentRef:=DB_CreateDocument(""; "TEXT")
	If (OK=1)
		CREATE EMPTY SET:C140([TRANSACTIONS:29]; "USED")
		ALL RECORDS:C47([TRANSACTION_BATCHES:30])
		For ($_l_Index2; 1; Records in selection:C76([TRANSACTION_BATCHES:30]))
			QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTION_BATCHES:30]Batch_Number:10)
			
			For ($_l_Index; 1; Records in selection:C76([TRANSACTION_BATCH_ITEMS:155]))
				Case of 
					: (([TRANSACTION_BATCH_ITEMS:155]Debit_IO:15#"N") & ([TRANSACTION_BATCH_ITEMS:155]Credit_IO:16="N"))
						$_r_DebitAmount:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Amount:6; 2; 2)
						$_r_DebitVAT:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8; 2; 2)
						$_r_DebitTotal:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Total:9; 2; 2)
						$_t_DebitIO:=[TRANSACTION_BATCH_ITEMS:155]Debit_IO:15
						$_r_CreditAmount:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Total:9); 2; 2)
						$_r_CreditVAT:=0
						$_r_CreditTotal:=$_r_CreditAmount
						$_t_CreditIO:=[TRANSACTION_BATCH_ITEMS:155]Credit_IO:16
					: (([TRANSACTION_BATCH_ITEMS:155]Debit_IO:15="N") & ([TRANSACTION_BATCH_ITEMS:155]Credit_IO:16#"N"))
						$_r_CreditAmount:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Amount:6); 2; 2)
						$_r_CreditVAT:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8); 2; 2)
						$_r_CreditTotal:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Total:9); 2; 2)
						$_t_CreditIO:=[TRANSACTION_BATCH_ITEMS:155]Credit_IO:16
						$_r_DebitAmount:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Total:9; 2; 2)
						$_r_DebitVAT:=0
						$_r_DebitTotal:=$_r_DebitAmount
						$_t_DebitIO:=[TRANSACTION_BATCH_ITEMS:155]Debit_IO:15
					Else 
						$_r_CreditAmount:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Amount:6); 2; 2)
						$_r_CreditVAT:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8); 2; 2)
						$_r_CreditTotal:=Gen_Round((0-[TRANSACTION_BATCH_ITEMS:155]Total:9); 2; 2)
						$_t_CreditIO:=[TRANSACTION_BATCH_ITEMS:155]Credit_IO:16
						$_r_DebitAmount:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Amount:6; 2; 2)
						$_r_DebitVAT:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8; 2; 2)
						$_r_DebitTotal:=Gen_Round([TRANSACTION_BATCH_ITEMS:155]Total:9; 2; 2)
						$_t_DebitIO:=[TRANSACTION_BATCH_ITEMS:155]Debit_IO:15
				End case 
				If ([TRANSACTION_BATCH_ITEMS:155]Credit_Account:12#"")
					QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Batch_Number:7=[TRANSACTION_BATCHES:30]Batch_Number:10; *)
					QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Account_Code:3=[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12; *)
					QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Analysis_Code:2=[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2; *)
					QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Layer_Code:23=[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20; *)
					QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Currency_Code:22=[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19; *)
					QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Amount:6=$_r_CreditAmount; *)
					QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Tax_Amount:16=$_r_CreditVAT)
					If (Records in selection:C76([TRANSACTIONS:29])>0)
						CREATE SET:C116([TRANSACTIONS:29]; "Matching")
						DIFFERENCE:C122("Matching"; "USED"; "Matching")
						USE SET:C118("Matching")
						If (Records in selection:C76([TRANSACTIONS:29])>0)
							REDUCE SELECTION:C351([TRANSACTIONS:29]; 1)
							ADD TO SET:C119([TRANSACTIONS:29]; "USED")
						Else 
							//no transactions
							SEND PACKET:C103($_ti_DocumentRef; "Batch no"+String:C10([TRANSACTION_BATCHES:30]Batch_Number:10)+"Batch item number"+String:C10($_l_Index)+String:C10([TRANSACTION_BATCH_ITEMS:155]Amount:6)+" No Transactions")
							
						End if 
					Else 
						//no transactions
						SEND PACKET:C103($_ti_DocumentRef; "Batch no"+String:C10([TRANSACTION_BATCHES:30]Batch_Number:10)+"Batch item number"+String:C10($_l_Index)+String:C10([TRANSACTION_BATCH_ITEMS:155]Amount:6)+" No Transactions")
					End if 
				End if 
				If ([TRANSACTION_BATCH_ITEMS:155]Debit_Account:3#"")
					QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Batch_Number:7=[TRANSACTION_BATCHES:30]Batch_Number:10; *)
					QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Account_Code:3=[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3; *)
					QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Analysis_Code:2=[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2; *)
					QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Layer_Code:23=[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20; *)
					QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Currency_Code:22=[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19; *)
					QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Amount:6=$_r_DebitAmount; *)
					QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Tax_Amount:16=$_r_DebitVAT)
					If (Records in selection:C76([TRANSACTIONS:29])>0)
						CREATE SET:C116([TRANSACTIONS:29]; "Matching")
						DIFFERENCE:C122("Matching"; "USED"; "Matching")
						USE SET:C118("Matching")
						If (Records in selection:C76([TRANSACTIONS:29])>0)
							REDUCE SELECTION:C351([TRANSACTIONS:29]; 1)
							ADD TO SET:C119([TRANSACTIONS:29]; "USED")
						Else 
							//no transactions
							SEND PACKET:C103($_ti_DocumentRef; "Batch no"+String:C10([TRANSACTION_BATCHES:30]Batch_Number:10)+"Batch item number"+String:C10($_l_Index)+String:C10([TRANSACTION_BATCH_ITEMS:155]Amount:6)+" No Transactions")
							
						End if 
					Else 
						//no transactions
						SEND PACKET:C103($_ti_DocumentRef; "Batch no"+String:C10([TRANSACTION_BATCHES:30]Batch_Number:10)+"Batch item number"+String:C10($_l_Index)+String:C10([TRANSACTION_BATCH_ITEMS:155]Amount:6)+" No Transactions")
					End if 
				End if 
				NEXT RECORD:C51([TRANSACTION_BATCH_ITEMS:155])
				
				
			End for 
			NEXT RECORD:C51([TRANSACTION_BATCHES:30])
		End for 
		//now we have all the used transactons in a set called USED
		ALL RECORDS:C47([TRANSACTIONS:29])
		CREATE SET:C116([TRANSACTIONS:29]; "ALL")
		DIFFERENCE:C122("ALL"; "USED"; "ALL")
		USE SET:C118("ALL")
		//these transactions were not used
		SEND PACKET:C103($_ti_DocumentRef; "The following transactions were not used at all")
		For ($_l_Index; 1; Records in selection:C76([TRANSACTIONS:29]))
			SEND PACKET:C103($_ti_DocumentRef; [TRANSACTIONS:29]Transaction_Type_Code:1+Char:C90(9)+[TRANSACTIONS:29]Analysis_Code:2+Char:C90(9)+[TRANSACTIONS:29]Account_Code:3+Char:C90(9))
			SEND PACKET:C103($_ti_DocumentRef; [TRANSACTIONS:29]Invoice_Number:4+Char:C90(9)+String:C10([TRANSACTIONS:29]Trans_Date:5)+Char:C90(9)+String:C10([TRANSACTIONS:29]Amount:6)+Char:C90(9)+String:C10([TRANSACTIONS:29]Batch_Number:7))
			SEND PACKET:C103($_ti_DocumentRef; String:C10([TRANSACTIONS:29]Tax_Amount:16)+Char:C90(9)+String:C10([TRANSACTIONS:29]Total:17)+Char:C90(9)+[TRANSACTIONS:29]IO:18+Char:C90(9)+[TRANSACTIONS:29]Currency_Code:22+Char:C90(9)+[TRANSACTIONS:29]Layer_Code:23)
			SEND PACKET:C103($_ti_DocumentRef; Char:C90(13))
			
			NEXT RECORD:C51([TRANSACTIONS:29])
			
		End for 
		
	End if 
	
End if 
ERR_MethodTrackerReturn("ACC_ValidateBatches"; $_t_oldMethodName)
