//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_TransactionsCheck
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:        18/09/2010 20:59
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	C_BOOLEAN:C305(WIN_bo_TrackerInited)
	C_LONGINT:C283(<>SYS_l_CancelProcess; $_l_BatchNumber; $_l_OK; $_l_Process; $_l_WindowReferenceRow; ch0; ch1; ch2; ch3; ch4; ch5)
	C_LONGINT:C283(ch6; ch7; ch8; r0; r1; WIN_l_CurrentWinRef)
	C_REAL:C285($_r_Total)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_TransactionsCheck")
If (Count parameters:C259=0)
	If (Records in set:C195("ListboxSet0")>0)
		USE SET:C118("ListboxSet0")
	End if 
Else 
	//use the current selection
End if 
If (Records in selection:C76([TRANSACTIONS:29])>0)
	
	Open_AnyTypeWindow(267; 483; 5; Get localized string:C991("MenuItem_CheckTransactions"))
	DIALOG:C40([TRANSACTIONS:29]; "dAsk_Check")
	CLOSE WINDOW:C154
	$_l_OK:=OK
	OK:=1
	If (WIN_bo_TrackerInited)
		$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
		If ($_l_WindowReferenceRow>0)
			WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
		End if 
	End if 
	If ($_l_OK=1)
		$_l_Process:=Current process:C322
		CREATE SET:C116([TRANSACTIONS:29]; "$Master")
		
		If (ch0=1)
			Gen_Confirm(Get localized string:C991("Text_areyouready")+" "+Get localized string:C991("Text_CheckFor")+" "+Get localized string:C991("Table_Transactions")+" "+Get localized string:C991("UnknownAccounts"); Get localized string:C991("Text_Yes"); Get localized string:C991("Text_No"))
			
			If (OK=1)
				USE SET:C118("$Master")
				ORDER BY:C49([TRANSACTIONS:29]; [TRANSACTIONS:29]Account_Code:3; >)
				Trans_Check3(->[TRANSACTIONS:29]Account_Code:3; ->[ACCOUNTS:32]Account_Code:2; Get localized string:C991("Table_Transactions")+" "+Get localized string:C991("UnknownAccounts"))
				ORDER BY:C49([TRANSACTIONS:29]; [TRANSACTIONS:29]Account_Code:3; >)
				Trans_Check2(Get localized string:C991("Table_Transactions")+" "+Get localized string:C991("UnknownAccounts"))
			End if 
		End if 
		
		If (ch1=1)
			Gen_Confirm(Get localized string:C991("Text_areyouready")+" "+Get localized string:C991("Text_CheckFor")+" "+Get localized string:C991("Table_Transactions")+" "+Get localized string:C991("UnknownAnalysis"); Get localized string:C991("Text_Yes"); Get localized string:C991("Text_No"))
			
			If (OK=1)
				USE SET:C118("$Master")
				ORDER BY:C49([TRANSACTIONS:29]; [TRANSACTIONS:29]Analysis_Code:2; >)
				Trans_Check3(->[TRANSACTIONS:29]Analysis_Code:2; ->[ANALYSES:36]Analysis_Code:1; Get localized string:C991("Table_Transactions")+" "+Get localized string:C991("UnknownAnalysis"))
				ORDER BY:C49([TRANSACTIONS:29]; [TRANSACTIONS:29]Analysis_Code:2; >)
				Trans_Check2(Get localized string:C991("Table_Transactions")+" "+Get localized string:C991("UnknownAnalysis"))
			End if 
		End if 
		
		If (ch2=1)
			If ((DB_GetModuleSettingByNUM(Module_MultiCurrency))>1)
				Gen_Confirm(Get localized string:C991("Text_areyouready")+" "+Get localized string:C991("Text_CheckFor")+" "+Get localized string:C991("Table_Transactions")+" "+Get localized string:C991("UnknownCurrencies"); Get localized string:C991("Text_Yes"); Get localized string:C991("Text_No"))
				
				
				If (OK=1)
					USE SET:C118("$Master")
					ORDER BY:C49([TRANSACTIONS:29]; [TRANSACTIONS:29]Currency_Code:22; >)
					Trans_Check3(->[TRANSACTIONS:29]Currency_Code:22; ->[CURRENCIES:71]Currency_Code:1; Get localized string:C991("Table_Transactions")+" "+Get localized string:C991("UnknownCurrencies"))
					ORDER BY:C49([TRANSACTIONS:29]; [TRANSACTIONS:29]Currency_Code:22; >)
					Trans_Check2(Get localized string:C991("Table_Transactions")+" "+Get localized string:C991("UnknownCurrencies"))
				End if 
			End if 
		End if 
		
		If (ch3=1)
			If ((DB_GetModuleSettingByNUM(Module_MultiLayer))>1)
				Gen_Confirm(Get localized string:C991("Text_areyouready")+" "+Get localized string:C991("Text_CheckFor")+" "+Get localized string:C991("Table_Transactions")+" "+Get localized string:C991("UnknownLayers"); Get localized string:C991("Text_Yes"); Get localized string:C991("Text_No"))
				
				If (OK=1)
					USE SET:C118("$Master")
					ORDER BY:C49([TRANSACTIONS:29]; [TRANSACTIONS:29]Layer_Code:23; >)
					Trans_Check3(->[TRANSACTIONS:29]Layer_Code:23; ->[LAYERS:76]Layer_Code:1; Get localized string:C991("Table_Transactions")+" "+Get localized string:C991("UnknownLayers"))
					ORDER BY:C49([TRANSACTIONS:29]; [TRANSACTIONS:29]Layer_Code:23; >)
					Trans_Check2(Get localized string:C991("Table_Transactions")+" "+Get localized string:C991("UnknownLayers"))
				End if 
			End if 
		End if 
		
		If (ch4=1)
			Gen_Confirm(Get localized string:C991("Text_areyouready")+" "+Get localized string:C991("Text_CheckFor")+" "+Get localized string:C991("Table_Transactions")+" "+Get localized string:C991("UnknownTypes"); Get localized string:C991("Text_Yes"); Get localized string:C991("Text_No"))
			
			
			If (OK=1)
				USE SET:C118("$Master")
				ORDER BY:C49([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_Type_Code:1; >)
				Trans_Check3(->[TRANSACTIONS:29]Transaction_Type_Code:1; ->[TRANSACTION_TYPES:31]Transaction_Type_Code:1; Get localized string:C991("Table_Transactions")+" "+Get localized string:C991("UnknownTypes"))
				ORDER BY:C49([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_Type_Code:1; >)
				Trans_Check2(Get localized string:C991("Table_Transactions")+" "+Get localized string:C991("UnknownTypes"))
			End if 
		End if 
		
		If (ch5=1)
			Gen_Confirm(Get localized string:C991("Text_areyouready")+" "+Get localized string:C991("Text_CheckFor")+" "+Get localized string:C991("Table_Transactions")+" "+Get localized string:C991("UnknownTaxCodes"); Get localized string:C991("Text_Yes"); Get localized string:C991("Text_No"))
			
			If (OK=1)
				USE SET:C118("$Master")
				ORDER BY:C49([TRANSACTIONS:29]; [TRANSACTIONS:29]Tax_Code:20; >)
				Trans_Check3(->[TRANSACTIONS:29]Tax_Code:20; ->[TAX_CODES:35]Tax_Code:1; Get localized string:C991("Table_Transactions")+" "+Get localized string:C991("UnknownTaxCodes"))
				ORDER BY:C49([TRANSACTIONS:29]; [TRANSACTIONS:29]Tax_Code:20; >)
				Trans_Check2(Get localized string:C991("Table_Transactions")+" "+Get localized string:C991("UnknownTaxCodes"))
			End if 
		End if 
		
		If (ch6=1)
			Gen_Confirm(Get localized string:C991("Text_areyouready")+" "+Get localized string:C991("Text_CheckFor")+" "+Get localized string:C991("Table_Transactions")+" "+Get localized string:C991("IncorrectIO"); Get localized string:C991("Text_Yes"); Get localized string:C991("Text_No"))
			
			If (OK=1)
				USE SET:C118("$Master")
				QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]IO:18#"I"; *)
				QUERY SELECTION:C341([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]IO:18#"O"; *)
				QUERY SELECTION:C341([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Tax_Amount:16#0)
				ORDER BY:C49([TRANSACTIONS:29]; [TRANSACTIONS:29]IO:18; >)
				Trans_Check2(Get localized string:C991("Table_Transactions")+" "+Get localized string:C991("IncorrectIO"))
			End if 
		End if 
		
		If (ch7=1)
			Gen_Confirm(Get localized string:C991("Text_areyouready")+" "+Get localized string:C991("Text_CheckFor")+" "+Get localized string:C991("Table_Transactions")+" "+Get localized string:C991("UnknownInvoiceNumbers"); Get localized string:C991("Text_Yes"); Get localized string:C991("Text_No"))
			If (OK=1)
				USE SET:C118("$Master")
				QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Invoice_Number:4#"")
				ORDER BY:C49([TRANSACTIONS:29]; [TRANSACTIONS:29]Invoice_Number:4; >)
				Trans_Check3(->[TRANSACTIONS:29]Invoice_Number:4; ->[INVOICES:39]Invoice_Number:1; Get localized string:C991("Table_Transactions")+" "+Get localized string:C991("UnknownInvoiceNumbers"))
				ORDER BY:C49([TRANSACTIONS:29]; [TRANSACTIONS:29]Invoice_Number:4; >)
				Trans_Check2(Get localized string:C991("Table_Transactions")+" "+Get localized string:C991("UnknownInvoiceNumbers"))
			End if 
		End if 
		
		If (ch8=1)
			Gen_Confirm(Get localized string:C991("Text_areyouready")+" "+Get localized string:C991("Text_CheckFor")+" "+Get localized string:C991("Table_Transactions")+" "+Get localized string:C991("UnknownPurchaseInvoiceNumbers"); Get localized string:C991("Text_Yes"); Get localized string:C991("Text_No"))
			
			If (OK=1)
				USE SET:C118("$Master")
				QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Purchase_invoice_number:19#"")
				ORDER BY:C49([TRANSACTIONS:29]; [TRANSACTIONS:29]Purchase_invoice_number:19; >)
				Trans_Check3(->[TRANSACTIONS:29]Purchase_invoice_number:19; ->[PURCHASE_INVOICES:37]Purchase_Invoice_Number:4; Get localized string:C991("Table_Transactions")+" "+Get localized string:C991("UnknownPurchaseInvoiceNumbers"))
				ORDER BY:C49([TRANSACTIONS:29]; [TRANSACTIONS:29]Purchase_invoice_number:19; >)
				Trans_Check2(Get localized string:C991("Table_Transactions")+" "+Get localized string:C991("UnknownPurchaseInvoiceNumbers"))
			End if 
		End if 
		
		If (r0=1)
			Gen_Confirm(Get localized string:C991("Text_areyouready")+" "+Get localized string:C991("Text_CheckFor")+" "+Get localized string:C991("Table_Transactions")+" "+Get localized string:C991("InvalidBatchBalance"); Get localized string:C991("Text_Yes"); Get localized string:C991("Text_No"))
			
			If (OK=1)
				Open_PrD_Window(Get localized string:C991("Table_Transactions")+" "+Get localized string:C991("InvalidBatchBalance"))
				MESSAGE:C88(Char:C90(13))
				USE SET:C118("$Master")
				ORDER BY:C49([TRANSACTIONS:29]; [TRANSACTIONS:29]Batch_Number:7; >)
				FIRST RECORD:C50([TRANSACTIONS:29])
				CREATE EMPTY SET:C140([TRANSACTIONS:29]; "Extra")
				While ((Not:C34(End selection:C36([TRANSACTIONS:29]))) & (<>SYS_l_CancelProcess#$_l_Process))
					$_l_BatchNumber:=[TRANSACTIONS:29]Batch_Number:7
					$_r_Total:=0
					MESSAGE:C88("  "+String:C10($_l_BatchNumber)+Char:C90(13))
					While ((Not:C34(End selection:C36([TRANSACTIONS:29]))) & ($_l_BatchNumber=[TRANSACTIONS:29]Batch_Number:7) & (<>SYS_l_CancelProcess#$_l_Process))
						$_r_Total:=$_r_Total+[TRANSACTIONS:29]Total:17
						NEXT RECORD:C51([TRANSACTIONS:29])
					End while 
					If ($_r_Total#0)
						CUT NAMED SELECTION:C334([TRANSACTIONS:29]; "$Sel")
						QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Batch_Number:7=$_l_BatchNumber)
						CREATE SET:C116([TRANSACTIONS:29]; "Extra2")
						INTERSECTION:C121("Master"; "Extra2"; "Extra2")
						UNION:C120("Extra"; "Extra2"; "Extra")
						USE NAMED SELECTION:C332("$Sel")
					End if 
				End while 
				USE SET:C118("Extra")
				CLEAR SET:C117("Extra")
				CLEAR SET:C117("Extra2")
				QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_Type_Code:1#"PLYT")
				CLOSE WINDOW:C154
				If (WIN_bo_TrackerInited)
					$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
					If ($_l_WindowReferenceRow>0)
						WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
					End if 
				End if 
				
				ORDER BY:C49([TRANSACTIONS:29]Batch_Number:7; >)
				Trans_Check2(Get localized string:C991("Table_Transactions")+" "+Get localized string:C991("InvalidBatchBalance"))
			End if 
		End if 
		
		If (r1=1)
			Gen_Confirm(Get localized string:C991("Text_areyouready")+" "+Get localized string:C991("Text_CheckFor")+" "+Get localized string:C991("Table_Transactions")+" "+Get localized string:C991("MissingAccountBalance"); Get localized string:C991("Text_Yes"); Get localized string:C991("Text_No"))
			
			If (OK=1)
				Open_PrD_Window(Get localized string:C991("Table_Transactions")+" "+Get localized string:C991("MissingAccountBalance"))
				MESSAGE:C88(Char:C90(13))
				USE SET:C118("Master")
				//       SORT SELECTION([TRANSACTIONS]Period Code;>;[TRANSACTIONS]Account Code;>;[
				FIRST RECORD:C50([TRANSACTIONS:29])
				CREATE EMPTY SET:C140([TRANSACTIONS:29]; "Extra")
				While ((Not:C34(End selection:C36([TRANSACTIONS:29])) & (<>SYS_l_CancelProcess#$_l_Process)))
					
					
					QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Account_Code:2=[TRANSACTIONS:29]Account_Code:3; *)
					QUERY:C277([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Analysis_Code:1=[TRANSACTIONS:29]Analysis_Code:2; *)
					QUERY:C277([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Period_Code:4=[TRANSACTIONS:29]Period_Code:12; *)
					QUERY:C277([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Currency_Code:6=[TRANSACTIONS:29]Currency_Code:22; *)
					QUERY:C277([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Layer_Code:5=[TRANSACTIONS:29]Layer_Code:23)
					If (Records in selection:C76([ACCOUNT_BALANCES:34])=0)
						ADD TO SET:C119([ACCOUNT_BALANCES:34]; "Extra")
					End if 
					
					NEXT RECORD:C51([TRANSACTIONS:29])
				End while 
				USE SET:C118("Extra")
				CLEAR SET:C117("Extra")
				CLOSE WINDOW:C154
				If (WIN_bo_TrackerInited)
					$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
					If ($_l_WindowReferenceRow>0)
						WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
					End if 
				End if 
				
				ORDER BY:C49([TRANSACTIONS:29]; [TRANSACTIONS:29]Period_Code:12; >; [TRANSACTIONS:29]Account_Code:3; >; [TRANSACTIONS:29]Analysis_Code:2; >; [TRANSACTIONS:29]Currency_Code:22; >; [TRANSACTIONS:29]Layer_Code:23; >)
				Trans_Check2(Get localized string:C991("Table_Transactions")+" "+Get localized string:C991("MissingAccountBalance"))
				If (Records in selection:C76([TRANSACTIONS:29])>0)
					Gen_Confirm("Would you now like to post these as Balances?"+Char:C90(13)+"(NB: You should also run Check Account Balances on the affected Periods)"; Get localized string:C991("Text_Yes"); Get localized string:C991("Text_No"))
					If (OK=1)
						READ WRITE:C146([ACCOUNT_BALANCES:34])
						FIRST RECORD:C50([TRANSACTIONS:29])
						
						While ((Not:C34(End selection:C36([TRANSACTIONS:29]))) & (<>SYS_l_CancelProcess#$_l_Process))
							Post_Balances
							NEXT RECORD:C51([TRANSACTIONS:29])
						End while 
						READ ONLY:C145([ACCOUNT_BALANCES:34])
					End if 
				End if 
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("ACC_TransactionsCheck"; $_t_oldMethodName)