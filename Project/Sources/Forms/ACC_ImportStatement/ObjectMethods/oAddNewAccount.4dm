If (False:C215)
	//object Method Name: Object Name:      ACC_ImportStatement.oAddNewAccount
	//------------------ Method Notes ------------------
	//Note this is only displayed when there are not accounts or one account
	//------------------ Revision Control ----------------
	//Date Created: 16/02/2012 12:19
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(GEN_al_DropDownMenuID;0)
	ARRAY TEXT:C222($_at_StatementCodes; 0)
	//ARRAY TEXT(ACC_at_BankAccountCodes;0)
	//ARRAY TEXT(ACC_at_BankAccounts;0)
	//ARRAY TEXT(ACC_at_DBAccountCode;0)
	//ARRAY TEXT(GEN_at_DropDownMenu;0)
	C_BOOLEAN:C305(GEN_Bo_ShowCreate)
	C_DATE:C307(ACC_D_TransactsFrom; ACC_D_Transactsto)
	C_LONGINT:C283($_l_AccountRow; $_l_CurrentWinRefOLD; $_l_Event; $_l_Index; $_l_offset; $_l_PreferenceID; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_TEXT:C284($_t_AccountNumber; $_t_DBAccountNumber; $_t_oldMethodName; ABC_t_AccountCode; ACC_t_DBAccountCode; DB_t_WindowTitle)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [projectForm]/ACC_ImportStatement/oAddNewAccount"; Form event code:C388)
$_l_Event:=Form event code:C388
Case of 
	: ($_l_Event=On Clicked:K2:4)
		$_t_AccountNumber:=Gen_Request("Enter Bank Account Number"; "")
		
		If ($_t_AccountNumber#"")
			$_t_DBAccountNumber:=""
			If (DB_GetSalesLedgerBankFrom#"")
				If (DB_GetSalesLedgerBankTo#"")
					QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2>=DB_GetSalesLedgerBankFrom; *)
					QUERY:C277([ACCOUNTS:32];  & ; [ACCOUNTS:32]Account_Code:2<=DB_GetSalesLedgerBankTo)
					SELECTION TO ARRAY:C260([ACCOUNTS:32]Account_Code:2; ACC_at_BankAccounts)
					SORT ARRAY:C229(ACC_at_BankAccounts; >)
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
						$_t_DBAccountNumber:=ACC_at_BankAccounts{GEN_at_DropDownMenu}
					End if 
				Else 
					$_t_DBAccountNumber:=DB_GetSalesLedgerBankFrom
				End if 
				
			Else 
				If (DB_GetSalesLedgerBankTo#"")
					$_t_DBAccountNumber:=DB_GetSalesLedgerBankTo
				End if 
				
			End if 
			READ WRITE:C146([PREFERENCES:116])
			$_l_PreferenceID:=PREF_GetPreferenceID("Bank Statements")
			If ([PREFERENCES:116]IDNumber:1#$_l_PreferenceID)
				QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_PreferenceID)
				If (Records in selection:C76([PREFERENCES:116])=0)
					CREATE RECORD:C68([PREFERENCES:116])
					[PREFERENCES:116]IDNumber:1:=$_l_PreferenceID
					SAVE RECORD:C53([PREFERENCES:116])
				End if 
			Else 
				LOAD RECORD:C52([PREFERENCES:116])
			End if 
			$_l_offset:=0
			ARRAY TEXT:C222($_at_StatementCodes; 0)
			
			If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_at_StatementCodes; $_l_offset)
				If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; ACC_at_DBAccountCode; $_l_offset)
				End if 
			End if 
			
			ARRAY TEXT:C222(ACC_at_DBAccountCode; Size of array:C274($_at_StatementCodes))
			APPEND TO ARRAY:C911($_at_StatementCodes; $_t_AccountNumber)
			APPEND TO ARRAY:C911(ACC_at_DBAccountCode; $_t_DBAccountNumber)
			
			SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
			VARIABLE TO BLOB:C532($_at_StatementCodes; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(ACC_at_DBAccountCode; [PREFERENCES:116]DataBlob:2; *)
			SAVE RECORD:C53([PREFERENCES:116])
			
			COPY ARRAY:C226($_at_StatementCodes; ACC_at_BankAccountCodes)
			APPEND TO ARRAY:C911(ACC_at_BankAccountCodes; "-")
			APPEND TO ARRAY:C911(ACC_at_BankAccountCodes; "Add New Account")
			$_l_AccountRow:=Find in array:C230(ACC_at_BankAccountCodes; $_t_AccountNumber)
			If ($_l_AccountRow>0)
				ABC_t_AccountCode:=ACC_at_BankAccountCodes{$_l_AccountRow}
				ACC_t_DBAccountCode:=ACC_at_DBAccountCode{$_l_AccountRow}
				ACC_at_BankAccountCodes:=$_l_AccountRow
			Else 
				ABC_t_AccountCode:=ACC_at_BankAccountCodes{1}
				ACC_t_DBAccountCode:=ACC_at_DBAccountCode{1}
				ACC_at_BankAccountCodes:=1
			End if 
			
		Else 
		End if 
		
		
		If (Size of array:C274($_at_StatementCodes)=0)
			OBJECT SET VISIBLE:C603(ABC_t_AccountCode; True:C214)
			OBJECT SET VISIBLE:C603(*; "oAddNewAccount"; True:C214)
			OBJECT SET VISIBLE:C603(ACC_at_BankAccountCodes; False:C215)
		Else 
			OBJECT SET VISIBLE:C603(ABC_t_AccountCode; False:C215)
			OBJECT SET VISIBLE:C603(*; "oAddNewAccount"; False:C215)
			OBJECT SET VISIBLE:C603(ACC_at_BankAccountCodes; True:C214)
			COPY ARRAY:C226($_at_StatementCodes; ACC_at_BankAccountCodes)
			APPEND TO ARRAY:C911(ACC_at_BankAccountCodes; "-")
			APPEND TO ARRAY:C911(ACC_at_BankAccountCodes; "Add New Account")
			ABC_t_AccountCode:=ACC_at_BankAccountCodes{1}
			ACC_at_BankAccountCodes:=1
		End if 
		
		
		QUERY:C277([ACC_Bank_Statements:198]; [ACC_Bank_Statements:198]Bank_Account_Number:2=ABC_t_AccountCode)
		If (ACC_D_TransactsFrom>!00-00-00!)
			QUERY SELECTION:C341([ACC_Bank_Statements:198]; [ACC_Bank_Statements:198]Bank_TransactionDate:5>=ACC_D_TransactsFrom)
		End if 
		If (ACC_D_Transactsto>!00-00-00!)
			QUERY SELECTION:C341([ACC_Bank_Statements:198]; [ACC_Bank_Statements:198]Bank_TransactionDate:5<=ACC_D_Transactsto)
		End if 
		ORDER BY:C49([ACC_Bank_Statements:198]; [ACC_Bank_Statements:198]Bank_TransactionDate:5; >)
		FIRST RECORD:C50([ACC_Bank_Statements:198])
		ACC_D_TransactsFrom:=[ACC_Bank_Statements:198]Bank_TransactionDate:5
		LAST RECORD:C200([ACC_Bank_Statements:198])
		ACC_D_Transactsto:=[ACC_Bank_Statements:198]Bank_TransactionDate:5
		FIRST RECORD:C50([ACC_Bank_Statements:198])
		
End case 
ERR_MethodTrackerReturn("OBJ ACC_ImportStatement.oAddNewAccount"; $_t_oldMethodName)
