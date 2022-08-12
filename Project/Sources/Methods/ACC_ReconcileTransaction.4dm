//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_ReconcileTransaction
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/02/2012 14:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(ABR_abo_UNSelected;0)
	//ARRAY DATE(ABR_ad_ResolvedDate;0)
	//ARRAY DATE(ABR_ad_unResolvedDate;0)
	//ARRAY LONGINT(ABR_al_BRTransactionID;0)
	//ARRAY LONGINT(ABR_al_ResolvedBatch;0)
	//ARRAY LONGINT(ABR_al_TransactionID;0)
	//ARRAY LONGINT(ABR_al_unResolvedBatch;0)
	//ARRAY LONGINT(ABR_al_UNTransactionID;0)
	//ARRAY LONGINT(ACC_al_PartReconcileID;0)
	//ARRAY LONGINT(GEN_al_DropDownMenuID;0)
	//ARRAY REAL(ABR_A_TRReconcilledAmt;0)
	//ARRAY REAL(ABR_ar_AlreadyReconciledAmount;0)
	//ARRAY REAL(ABR_ar_ReconcilledAmount;0)
	//ARRAY REAL(ABR_ar_ResolvedTRAmount;0)
	//ARRAY REAL(ABR_ar_TransactionBalance;0)
	//ARRAY REAL(ABR_ar_TRYUNReconcilledAmt;0)
	//ARRAY REAL(ABR_ar_unResolvedTRAmount;0)
	//ARRAY REAL(ACC_ar_PartReconcile;0)
	ARRAY TEXT:C222($_at_DBAccountCodes; 0)
	ARRAY TEXT:C222($_at_StatementCodes; 0)
	//ARRAY TEXT(ABR_at_AccountCodesRange;0)
	//ARRAY TEXT(ABR_at_CurrencyCode;0)
	//ARRAY TEXT(ABR_at_DbAccountCodes;0)
	//ARRAY TEXT(ABR_at_ResolvedAccountCOde;0)
	//ARRAY TEXT(ABR_at_ResolvedCheque;0)
	//ARRAY TEXT(ABR_at_ResolvedPeriod;0)
	//ARRAY TEXT(ABR_at_unCurrencyCode;0)
	//ARRAY TEXT(ABR_at_unResolvedAccountCOde;0)
	//ARRAY TEXT(ABR_at_UnResolvedCheque;0)
	//ARRAY TEXT(ABR_at_unResolvedDescription;0)
	//ARRAY TEXT(ABR_at_unResolvedPeriod;0)
	//ARRAY TEXT(ABR_ResolvedDescription;0)
	//ARRAY TEXT(ACC_at_BankAccounts;0)
	//ARRAY TEXT(GEN_at_DropDownMenu;0)
	C_BOOLEAN:C305($_bo_NoLoad; $_bo_ReadOnlyState; $_bo_Reconciles; $_bo_Update; ABR_bo_NextRecord; ABR_bo_PreviousRecord; ABR_bo_WindowisOpen; ACC_aBo_ReconcileManual; ACC_bo_Reconcile; DB_bo_FromTest; DB_bo_UNITTEST)
	C_BOOLEAN:C305(GEN_Bo_ShowCreate)
	C_DATE:C307($_d_TransactionDate)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_BankAccountPosition; $_l_CheckNumPosition; $_l_CurrentWinRefOLD; $_l_Index; $_l_NextUnselected; $_l_offset; $_l_partReconciledPosition; $_l_PreferenceID; $_l_Start; $_l_TransactionPosition)
	C_LONGINT:C283($1; ABR_l_BankRecID; ABR_l_DefaultFilterDates; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_REAL:C285($_r_AmountToReconcile; $_r_Sum; $3; ABR_R_ReconcilleAmount; ACC_R_SelectedReconcilles)
	C_TEXT:C284(<>SYS_t_LastSavedTableName; $_t_CheckNum; $_t_DBAccountCode; $_t_oldMethodName; $2; $6; DB_t_WindowTitle)
	C_TIME:C306(DB_ti_UTDOC)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_ReconcileTransaction")
//This method takes a single transaction from a bank statement and tries to find the daybook transaction to reconcile agains
//the relationship between the transaction and the bank statement line is stored
//$1=the transaction ID
//$2=The bank account number
//$3=the amount of the transaction
//`$4=The already reconcilled amount-if this >0 we look for the reconcilled transaction first
//$5=C if this is a credit amount (incoming) or 'D' if its an outgoing amount.
//$6= the daybook bank accounts

If (DB_bo_UNITTEST) & (Not:C34(DB_bo_FromTest))
	DB_ti_UTDOC:=?00:00:00?
	If (DB_ti_UTDOC=?00:00:00?)
		DB_ti_UTDOC:=Create document:C266("PO_LoadDFPriceGroup"; "TEXT")
	End if 
	//Call with $6 empty
	
	CLOSE DOCUMENT:C267(DB_ti_UTDOC)
	
Else 
	
	COPY NAMED SELECTION:C331([ACC_Bank_Statements:198]; "$Temp")
	ACC_aBo_ReconcileManual:=False:C215
	
	If (Count parameters:C259>=6)
		If ($6="")
			$_l_PreferenceID:=PREF_GetPreferenceID("Bank Statements")
			$_bo_Update:=False:C215
			READ WRITE:C146([PREFERENCES:116])
			QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_PreferenceID)
			$_l_offset:=0
			ARRAY TEXT:C222($_at_StatementCodes; 0)
			ARRAY TEXT:C222($_at_DBAccountCodes; 0)
			QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_PreferenceID)
			
			If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_at_StatementCodes; $_l_offset)
				If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_at_DBAccountCodes; $_l_offset)
				End if 
			End if 
			$_l_BankAccountPosition:=Find in array:C230($_at_StatementCodes; $2)
			If ($_l_BankAccountPosition<0)
				$_bo_Update:=True:C214
				APPEND TO ARRAY:C911($_at_StatementCodes; $2)
				APPEND TO ARRAY:C911($_at_DBAccountCodes; "")
			End if 
			
			$_t_DBAccountCode:=""
			$_l_BankAccountPosition:=Find in array:C230($_at_StatementCodes; $2)
			If (Size of array:C274($_at_DBAccountCodes)>=$_l_BankAccountPosition)
				$_t_DBAccountCode:=$_at_DBAccountCodes{$_l_BankAccountPosition}
			End if 
			
			If ($_t_DBAccountCode="")
				$_t_DBAccountCode:=""
				If (DB_GetSalesLedgerBankFrom#"")
					If (DB_GetSalesLedgerBankTo#"")
						QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2>=DB_GetSalesLedgerBankFrom; *)
						QUERY:C277([ACCOUNTS:32];  & ; [ACCOUNTS:32]Account_Code:2<=DB_GetSalesLedgerBankTo)
						SELECTION TO ARRAY:C260([ACCOUNTS:32]Account_Code:2; ACC_at_BankAccounts)
						ARRAY TEXT:C222(GEN_at_DropDownMenu; 0)
						ARRAY LONGINT:C221(GEN_al_DropDownMenuID; 0)
						For ($_l_Index; 1; Size of array:C274(ACC_at_BankAccounts))
							APPEND TO ARRAY:C911(GEN_al_DropDownMenuID; $_l_Index)
							APPEND TO ARRAY:C911(GEN_at_DropDownMenu; ACC_at_BankAccounts{$_l_Index})
						End for 
						DB_t_WindowTitle:="Select Daybook Account For this Bank Account"
						$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
						WIN_l_CurrentWinRef:=Open window:C153(20; 20; 20; 20; -1986)
						GEN_Bo_ShowCreate:=False:C215
						DIALOG:C40([USER:15]; "Gen_PopUpChoice")
						CLOSE WINDOW:C154
						WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
						If (GEN_at_DropDownMenu>0)
							$_bo_Update:=True:C214
							$_t_DBAccountCode:=ACC_at_BankAccounts{GEN_at_DropDownMenu}
							$_at_DBAccountCodes{$_l_BankAccountPosition}:=$_t_DBAccountCode
						End if 
					Else 
						$_bo_Update:=True:C214
						$_t_DBAccountCode:=DB_GetSalesLedgerBankFrom
						$_at_DBAccountCodes{$_l_BankAccountPosition}:=$_t_DBAccountCode
					End if 
					
				Else 
					If (DB_GetSalesLedgerBankTo#"")
						$_bo_Update:=True:C214
						$_t_DBAccountCode:=DB_GetSalesLedgerBankTo
						$_at_DBAccountCodes{$_l_BankAccountPosition}:=DB_GetSalesLedgerBankTo
					End if 
					
				End if 
			End if 
			If ($_bo_Update)
				SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
				
				VARIABLE TO BLOB:C532($_at_StatementCodes; [PREFERENCES:116]DataBlob:2; *)
				VARIABLE TO BLOB:C532($_at_DBAccountCodes; [PREFERENCES:116]DataBlob:2; *)
				<>SYS_t_LastSavedTableName:="PREFERENCES"
				SAVE RECORD:C53([PREFERENCES:116])
				
			End if 
			UNLOAD RECORD:C212([PREFERENCES:116])
			READ ONLY:C145([PREFERENCES:116])
		Else 
			$_t_DBAccountCode:=$6
		End if 
		
		If ($_t_DBAccountCode="")
			//Then the range is all the bank accounts
			ARRAY TEXT:C222(ABR_at_AccountCodesRange; 0)
			If (DB_GetSalesLedgerBankFrom#"")
				If (DB_GetSalesLedgerBankTo#"")
					QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2>=DB_GetSalesLedgerBankFrom; *)
					QUERY:C277([ACCOUNTS:32];  & ; [ACCOUNTS:32]Account_Code:2<=DB_GetSalesLedgerBankTo)
					SELECTION TO ARRAY:C260([ACCOUNTS:32]Account_Code:2; ABR_at_AccountCodesRange)
					SORT ARRAY:C229(ABR_at_AccountCodesRange; >)
				Else 
					ARRAY TEXT:C222(ABR_at_AccountCodesRange; 1)
					ABR_at_AccountCodesRange{1}:=DB_GetSalesLedgerBankFrom
					
				End if 
			Else 
				If (DB_GetSalesLedgerBankTo#"")
					ARRAY TEXT:C222(ABR_at_AccountCodesRange; 1)
					ABR_at_AccountCodesRange{1}:=DB_GetSalesLedgerBankTo
					
				End if 
			End if 
			
		Else 
			ARRAY TEXT:C222(ABR_at_AccountCodesRange; 1)
			ABR_at_AccountCodesRange{1}:=$_t_DBAccountCode
		End if 
		ABR_bo_NextRecord:=False:C215
		ABR_bo_PreviousRecord:=False:C215
		ABR_bo_WindowisOpen:=False:C215
		ABR_l_BankRecID:=$1
		ABR_R_ReconcilleAmount:=$3
		Repeat 
			ABR_bo_NextRecord:=False:C215
			ABR_bo_PreviousRecord:=False:C215
			ARRAY TEXT:C222(ABR_at_DbAccountCodes; 0)
			ARRAY REAL:C219(ABR_ar_ReconcilledAmount; 0)
			ARRAY LONGINT:C221(ABR_al_TransactionID; 0)
			ARRAY TEXT:C222(ABR_at_ResolvedAccountCOde; 0)
			ARRAY LONGINT:C221(ABR_al_ResolvedBatch; 0)
			ARRAY TEXT:C222(ABR_at_ResolvedCheque; 0)
			ARRAY TEXT:C222(ABR_at_CurrencyCode; 0)
			ARRAY DATE:C224(ABR_ad_ResolvedDate; 0)
			ARRAY TEXT:C222(ABR_at_ResolvedPeriod; 0)
			ARRAY REAL:C219(ABR_ar_ResolvedTRAmount; 0)
			ARRAY TEXT:C222(ABR_ResolvedDescription; 0)
			
			ARRAY TEXT:C222(ABR_at_unResolvedAccountCOde; 0)
			ARRAY LONGINT:C221(ABR_al_unResolvedBatch; 0)
			ARRAY TEXT:C222(ABR_at_UnResolvedCheque; 0)
			ARRAY TEXT:C222(ABR_at_unCurrencyCode; 0)
			ARRAY DATE:C224(ABR_ad_unResolvedDate; 0)
			ARRAY TEXT:C222(ABR_at_unResolvedPeriod; 0)
			ARRAY REAL:C219(ABR_ar_unResolvedTRAmount; 0)
			ARRAY TEXT:C222(ABR_at_unResolvedDescription; 0)
			ARRAY LONGINT:C221(ABR_al_UNTransactionID; 0)
			
			
			
			If (Size of array:C274(ABR_at_AccountCodesRange)>0)
				QUERY:C277([Bank_Reconcile:199]; [Bank_Reconcile:199]Bank_RecordID:2=ABR_l_BankRecID)
				If (Records in selection:C76([Bank_Reconcile:199])>0)
					// Some reconcilled amounts are already there for this line
					$_bo_NoLoad:=False:C215
					If (Records in selection:C76([Bank_Reconcile:199])=1)
						If ([Bank_Reconcile:199]Reconciled_TransactionID:5<0)
							ACC_aBo_ReconcileManual:=True:C214
							$_bo_NoLoad:=True:C214
						End if 
					End if 
					If ($_bo_NoLoad=False:C215)
						SELECTION TO ARRAY:C260([Bank_Reconcile:199]Bank_Account_Number:3; ABR_at_DbAccountCodes; [Bank_Reconcile:199]Reconciled_Amount:4; ABR_ar_ReconcilledAmount; [Bank_Reconcile:199]Reconciled_TransactionID:5; ABR_al_BRTransactionID)
						QUERY WITH ARRAY:C644([TRANSACTIONS:29]Transaction_ID:31; ABR_al_BRTransactionID)
						SELECTION TO ARRAY:C260([TRANSACTIONS:29]Account_Code:3; ABR_at_ResolvedAccountCOde; [TRANSACTIONS:29]Batch_Number:7; ABR_al_ResolvedBatch; [TRANSACTIONS:29]Cheque_Number:13; ABR_at_ResolvedCheque; [TRANSACTIONS:29]Currency_Code:22; ABR_at_CurrencyCode; [TRANSACTIONS:29]Entry_Date:11; ABR_ad_ResolvedDate; [TRANSACTIONS:29]Period_Code:12; ABR_at_ResolvedPeriod; [TRANSACTIONS:29]Total:17; ABR_ar_ResolvedTRAmount; [TRANSACTIONS:29]Description:8; ABR_ResolvedDescription)
						//[TRANSACTIONS]ReconcilledAmount;ABR_ar_AlreadyReconciledAmount)
						SELECTION TO ARRAY:C260([TRANSACTIONS:29]Transaction_ID:31; ABR_al_TransactionID)
						ARRAY REAL:C219(ABR_A_TRReconcilledAmt; 0)
						ARRAY REAL:C219(ABR_A_TRReconcilledAmt; Size of array:C274(ABR_al_TransactionID))
						
						For ($_l_Index; 1; Size of array:C274(ABR_al_TransactionID))
							$_l_Start:=1
							Repeat 
								$_l_TransactionPosition:=Find in array:C230(ABR_al_BRTransactionID; ABR_al_TransactionID{$_l_Index}; $_l_Start)
								If ($_l_TransactionPosition>0)
									$_l_Start:=$_l_TransactionPosition+1
									ABR_A_TRReconcilledAmt{$_l_Index}:=ABR_A_TRReconcilledAmt{$_l_Index}+ABR_ar_ReconcilledAmount{$_l_TransactionPosition}
								End if 
							Until ($_l_TransactionPosition<0)
						End for 
						
					End if 
				End if 
				
				If ([ACC_Bank_Statements:198]Bank_ReconciledAmount:11<ABR_R_ReconcilleAmount)
					$_r_AmountToReconcile:=ABR_R_ReconcilleAmount-[ACC_Bank_Statements:198]Bank_ReconciledAmount:11
					If (Size of array:C274(ABR_at_AccountCodesRange)>1)
						QUERY WITH ARRAY:C644([TRANSACTIONS:29]Account_Code:3; ABR_at_AccountCodesRange)
					Else 
						QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Account_Code:3=ABR_at_AccountCodesRange{1})
					End if 
					QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Reconciled:14=False:C215)
					$_l_CheckNumPosition:=Position:C15("<CHECKNUM>"; [ACC_Bank_Statements:198]Bank_Transaction_Details:7)
					If ($_l_CheckNumPosition>0)
						CREATE SET:C116([TRANSACTIONS:29]; "$temp")
						$_t_CheckNum:=Substring:C12([ACC_Bank_Statements:198]Bank_Transaction_Details:7; $_l_CheckNumPosition+Length:C16("<CHECKNUM>"))
						
						$_l_CheckNumPosition:=Position:C15(Char:C90(9); $_t_CheckNum)
						If ($_l_CheckNumPosition=0)
							$_l_CheckNumPosition:=Position:C15(" "; $_t_CheckNum)
						End if 
						If ($_l_CheckNumPosition>0)
							$_t_CheckNum:=Substring:C12($_t_CheckNum; 1; $_l_CheckNumPosition-1)
						End if 
						If ($_t_CheckNum#"")
							QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Cheque_Number:13=$_t_CheckNum)
							If (Records in selection:C76([TRANSACTIONS:29])=0)
								USE SET:C118("$temp")
							Else 
								$_r_Sum:=Sum:C1([TRANSACTIONS:29]Total:17)
								If ($_r_Sum<$_r_AmountToReconcile)
									USE SET:C118("$temp")
								End if 
							End if 
						End if 
					End if 
					//QUERY SELECTION([TRANSACTIONS];[TRANSACTIONS]Total=$3)
					//
					CREATE SET:C116([TRANSACTIONS:29]; "$temp")
					QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]ReconcilledAmount:34>0)
					If (Records in selection:C76([TRANSACTIONS:29])>0)
						CREATE SET:C116([TRANSACTIONS:29]; "$temp2")
						QUERY SELECTION BY FORMULA:C207([TRANSACTIONS:29]; [TRANSACTIONS:29]ReconcilledAmount:34<[TRANSACTIONS:29]Total:17)
						CREATE SET:C116([TRANSACTIONS:29]; "$temp3")
						DIFFERENCE:C122("$temp"; "$temp2"; "$temp")
						UNION:C120("$temp3"; "$temp"; "$temp")
						
						
					End if 
					USE SET:C118("$temp")
					ABR_l_DefaultFilterDates:=0
					If (Records in selection:C76([TRANSACTIONS:29])>1000)
						ABR_l_DefaultFilterDates:=30
						//Gen_Confirm ("There are over 1000 possible accounting transactions. Would you like to focus on transaction within 30 days of the bank transaction date";"Yes";"No")
						//If (OK=1)
						$_d_TransactionDate:=[ACC_Bank_Statements:198]Bank_TransactionDate:5
						QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Trans_Date:5>=$_d_TransactionDate-30; *)
						QUERY SELECTION:C341([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Trans_Date:5<=$_d_TransactionDate+30)
						//End if
					End if 
					CREATE SET:C116([TRANSACTIONS:29]; "ToReconcileset")
					QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31=0)
					If (Records in selection:C76([TRANSACTIONS:29])>0)
						READ WRITE:C146([TRANSACTIONS:29])
						APPLY TO SELECTION:C70([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31:=AA_GetNextID(->[TRANSACTIONS:29]Transaction_ID:31))
						UNLOAD RECORD:C212([TRANSACTIONS:29])
						READ ONLY:C145([TRANSACTIONS:29])
					End if 
					USE SET:C118("ToReconcileset")
					
					//These are all the transaction that COULD be reconcilled agains this amount.
					//This could be a lot of records. so now we will let the user select the ones that reconcille against this transaction
					//we will then verify that the SUM of selected records do not exceed the amount-if they do then it they cannot be assigned
					ARRAY REAL:C219(ABR_ar_TRYUNReconcilledAmt; 0)
					ARRAY REAL:C219(ABR_ar_TransactionBalance; 0)
					SELECTION TO ARRAY:C260([TRANSACTIONS:29]Account_Code:3; ABR_at_unResolvedAccountCOde; [TRANSACTIONS:29]Batch_Number:7; ABR_al_unResolvedBatch; [TRANSACTIONS:29]Cheque_Number:13; ABR_at_UnResolvedCheque; [TRANSACTIONS:29]Currency_Code:22; ABR_at_unCurrencyCode; [TRANSACTIONS:29]Entry_Date:11; ABR_ad_unResolvedDate; [TRANSACTIONS:29]Period_Code:12; ABR_at_unResolvedPeriod; [TRANSACTIONS:29]Total:17; ABR_ar_unResolvedTRAmount; [TRANSACTIONS:29]Description:8; ABR_at_unResolvedDescription)
					SELECTION TO ARRAY:C260([TRANSACTIONS:29]Transaction_ID:31; ABR_al_UNTransactionID; [TRANSACTIONS:29]ReconcilledAmount:34; ABR_ar_AlreadyReconciledAmount)
					ARRAY REAL:C219(ABR_ar_TRYUNReconcilledAmt; Size of array:C274(ABR_al_UNTransactionID))
					ARRAY REAL:C219(ABR_ar_TransactionBalance; Size of array:C274(ABR_al_UNTransactionID))
					For ($_l_Index; 1; Size of array:C274(ABR_al_UNTransactionID))
						ABR_ar_TransactionBalance{$_l_Index}:=ABR_ar_unResolvedTRAmount{$_l_Index}-ABR_ar_AlreadyReconciledAmount{$_l_Index}
					End for 
					COPY NAMED SELECTION:C331([TRANSACTIONS:29]; "ToReconcile")
					
				End if 
				
				Open window:C153(60; 60; 60; 60; 8; ""; "ACC_CloseReconcile")
				If (Size of array:C274(ABR_at_unResolvedAccountCOde)>0)
					WS_AutoscreenSize(1; 658; 680; Table name:C256(->[ACC_Bank_Statements:198])+"_"+"ReconcileWindow")
				Else 
					WS_AutoscreenSize(1; 658; 680; Table name:C256(->[ACC_Bank_Statements:198])+"_"+"ReconcileWindowSmall")
				End if 
				ACC_bo_Reconcile:=False:C215
				
				DIALOG:C40("ACC_ReconcileSelectTransactions")
				
				//CLOSE WINDOW
				If (Size of array:C274(ABR_at_unResolvedAccountCOde)>0)
					INT_LoadFormSizes(<>PER_l_CurrentUserID; Table name:C256(->[ACC_Bank_Statements:198])+"_"+"ReconcileWindow")
					CLOSE WINDOW:C154
				Else 
					INT_LoadFormSizes(<>PER_l_CurrentUserID; Table name:C256(->[ACC_Bank_Statements:198])+"_"+"ReconcileWindowSmall")
					CLOSE WINDOW:C154
				End if 
				If (ACC_bo_Reconcile)
					ACC_R_SelectedReconcilles:=0
					$_bo_ReadOnlyState:=Read only state:C362([ACC_Bank_Statements:198])
					If ($_bo_ReadOnlyState)
						READ WRITE:C146([ACC_Bank_Statements:198])
					End if 
					LOAD RECORD:C52([ACC_Bank_Statements:198])
					$_bo_Reconciles:=False:C215
					For ($_l_Index; 1; Size of array:C274(ABR_abo_UNSelected))
						$_l_NextUnselected:=Find in array:C230(ABR_abo_UNSelected; True:C214; $_l_Index)
						If ($_l_NextUnselected>0)
							$_l_Index:=$_l_NextUnselected
							$_l_partReconciledPosition:=Find in array:C230(ACC_al_PartReconcileID; ABR_al_UNTransactionID{$_l_Index})
							If ($_l_partReconciledPosition<0)
								READ WRITE:C146([TRANSACTIONS:29])
								QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31=ABR_al_UNTransactionID{$_l_Index})
								CREATE RECORD:C68([Bank_Reconcile:199])
								[Bank_Reconcile:199]x_ID:1:=AA_GetNextID(->[Bank_Reconcile:199]x_ID:1)
								[Bank_Reconcile:199]Reconciled_Amount:4:=[TRANSACTIONS:29]Total:17
								[Bank_Reconcile:199]Reconciled_TransactionID:5:=[TRANSACTIONS:29]Transaction_ID:31
								[Bank_Reconcile:199]Bank_Account_Number:3:=[ACC_Bank_Statements:198]Bank_Account_Number:2
								[Bank_Reconcile:199]Bank_RecordID:2:=[ACC_Bank_Statements:198]x_ID:1
								<>SYS_t_LastSavedTableName:="Bank_Reconcile"
								SAVE RECORD:C53([Bank_Reconcile:199])
								[TRANSACTIONS:29]ReconcilledAmount:34:=[TRANSACTIONS:29]Total:17
								[TRANSACTIONS:29]Reconciled:14:=True:C214
								<>SYS_t_LastSavedTableName:="TRANSACTIONS"
								SAVE RECORD:C53([TRANSACTIONS:29])
								$_bo_Reconciles:=True:C214
								ACC_R_SelectedReconcilles:=ACC_R_SelectedReconcilles+[TRANSACTIONS:29]Total:17
							Else 
								READ WRITE:C146([TRANSACTIONS:29])
								QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31=ABR_al_UNTransactionID{$_l_Index})
								
								CREATE RECORD:C68([Bank_Reconcile:199])
								[Bank_Reconcile:199]x_ID:1:=AA_GetNextID(->[Bank_Reconcile:199]x_ID:1)
								[Bank_Reconcile:199]Reconciled_Amount:4:=ACC_ar_PartReconcile{$_l_partReconciledPosition}
								[Bank_Reconcile:199]Reconciled_TransactionID:5:=[TRANSACTIONS:29]Transaction_ID:31
								[Bank_Reconcile:199]Bank_Account_Number:3:=[ACC_Bank_Statements:198]Bank_Account_Number:2
								[Bank_Reconcile:199]Bank_RecordID:2:=[ACC_Bank_Statements:198]x_ID:1
								<>SYS_t_LastSavedTableName:="Bank_Reconcile"
								SAVE RECORD:C53([Bank_Reconcile:199])
								$_bo_Reconciles:=True:C214
								[TRANSACTIONS:29]ReconcilledAmount:34:=[TRANSACTIONS:29]ReconcilledAmount:34+ACC_ar_PartReconcile{$_l_partReconciledPosition}
								If (Abs:C99([TRANSACTIONS:29]ReconcilledAmount:34)>=Abs:C99([TRANSACTIONS:29]Total:17))
									[TRANSACTIONS:29]ReconcilledAmount:34:=[TRANSACTIONS:29]Total:17
									[TRANSACTIONS:29]Reconciled:14:=True:C214
								End if 
								<>SYS_t_LastSavedTableName:="TRANSACTIONS"
								SAVE RECORD:C53([TRANSACTIONS:29])
								ACC_R_SelectedReconcilles:=ACC_R_SelectedReconcilles+(ACC_ar_PartReconcile{$_l_partReconciledPosition})
							End if 
							
						Else 
							$_l_Index:=Size of array:C274(ABR_abo_UNSelected)
							
						End if 
					End for 
					If ($_bo_Reconciles)  //if we reconcile and previously this was marked as 'over ride' delete the over-ride record
						READ WRITE:C146([Bank_Reconcile:199])
						QUERY:C277([Bank_Reconcile:199]; [Bank_Reconcile:199]Bank_RecordID:2=ABR_l_BankRecID; *)
						QUERY:C277([Bank_Reconcile:199];  & ; [Bank_Reconcile:199]Reconciled_TransactionID:5<0)
						If (Records in selection:C76([Bank_Reconcile:199])>0)
							DELETE SELECTION:C66([Bank_Reconcile:199])
						End if 
					End if 
					[ACC_Bank_Statements:198]Bank_ReconciledAmount:11:=Abs:C99([ACC_Bank_Statements:198]Bank_ReconciledAmount:11)+Abs:C99(ACC_R_SelectedReconcilles)
					If ((Not:C34($_bo_Reconciles)) & (ACC_aBo_ReconcileManual))
						//The check box is ticked and nothing is reconcilled...
						[ACC_Bank_Statements:198]Bank_ReconciledAmount:11:=Abs:C99([ACC_Bank_Statements:198]Bank_CreditAmount:9)+Abs:C99([ACC_Bank_Statements:198]Bank_DebitAmount:8)
						QUERY:C277([Bank_Reconcile:199]; [Bank_Reconcile:199]Bank_RecordID:2=[ACC_Bank_Statements:198]x_ID:1; *)
						QUERY:C277([Bank_Reconcile:199];  & ; [Bank_Reconcile:199]Reconciled_TransactionID:5<0)
						If (Records in selection:C76([Bank_Reconcile:199])=0)  //only create the record if its not already created
							CREATE RECORD:C68([Bank_Reconcile:199])
							[Bank_Reconcile:199]x_ID:1:=AA_GetNextID(->[Bank_Reconcile:199]x_ID:1)
							[Bank_Reconcile:199]Reconciled_Amount:4:=[ACC_Bank_Statements:198]Bank_ReconciledAmount:11
							[Bank_Reconcile:199]Reconciled_TransactionID:5:=-1
							[Bank_Reconcile:199]Bank_Account_Number:3:=[ACC_Bank_Statements:198]Bank_Account_Number:2
							[Bank_Reconcile:199]Bank_RecordID:2:=[ACC_Bank_Statements:198]x_ID:1
							<>SYS_t_LastSavedTableName:="Bank_Reconcile"
							SAVE RECORD:C53([Bank_Reconcile:199])
						End if 
					End if 
					<>SYS_t_LastSavedTableName:="ACC_Bank_Statements"
					SAVE RECORD:C53([ACC_Bank_Statements:198])
					If ($_bo_ReadOnlyState)
						UNLOAD RECORD:C212([ACC_Bank_Statements:198])
						READ ONLY:C145([ACC_Bank_Statements:198])
					End if 
					LOAD RECORD:C52([ACC_Bank_Statements:198])
				End if 
				
				
				
				
			End if 
			Case of 
				: (ABR_bo_NextRecord)
					If (Selected record number:C246([ACC_Bank_Statements:198])<Records in selection:C76([ACC_Bank_Statements:198]))
						NEXT RECORD:C51([ACC_Bank_Statements:198])
					Else 
						ABR_bo_NextRecord:=False:C215
					End if 
				: (ABR_bo_PreviousRecord)
					If (Selected record number:C246([ACC_Bank_Statements:198])>1)
						
						PREVIOUS RECORD:C110([ACC_Bank_Statements:198])
					Else 
						ABR_bo_PreviousRecord:=False:C215
					End if 
					
			End case 
			ABR_l_BankRecID:=[ACC_Bank_Statements:198]x_ID:1
			If ([ACC_Bank_Statements:198]Bank_CreditAmount:9#0)
				ABR_R_ReconcilleAmount:=[ACC_Bank_Statements:198]Bank_CreditAmount:9
			Else 
				ABR_R_ReconcilleAmount:=[ACC_Bank_Statements:198]Bank_DebitAmount:8
			End if 
		Until (ABR_bo_NextRecord=False:C215) & (ABR_bo_PreviousRecord=False:C215)
	End if 
	
	USE NAMED SELECTION:C332("$Temp")
	
End if 
ERR_MethodTrackerReturn("ACC_ReconcileTransaction"; $_t_oldMethodName)