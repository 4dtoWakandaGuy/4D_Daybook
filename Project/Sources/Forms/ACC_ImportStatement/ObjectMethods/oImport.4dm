If (False:C215)
	//object Method Name: Object Name:      ACC_ImportStatement.oImport
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/02/2012 13:36
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY POINTER(DB_aptr_BankStatements;0)
	C_DATE:C307($_D_OpeningBalanceDate; ACC_D_TransactsFrom; ACC_D_Transactsto)
	C_LONGINT:C283($_l_offset; ACC_l_LoadPreferencesID)
	C_REAL:C285($_r_OpeningBalance; ABR_R_Balance)
	C_TEXT:C284($_t_oldMethodName; ABC_t_AccountCode)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ ACC_ImportStatement.oImport"; Form event code:C388)
If (ABC_t_AccountCode#"")
	QUERY:C277([ACC_Bank_Statements:198]; [ACC_Bank_Statements:198]Bank_Account_Number:2=ABC_t_AccountCode)
	CREATE SET:C116([ACC_Bank_Statements:198]; "Before")
	ACC_ImportStatementRecords(ABC_t_AccountCode)
	QUERY:C277([ACC_Bank_Statements:198]; [ACC_Bank_Statements:198]Bank_Account_Number:2=ABC_t_AccountCode)
	CREATE SET:C116([ACC_Bank_Statements:198]; "AFTER")
	DIFFERENCE:C122("AFTER"; "Before"; "AFTER")
	ACC_l_LoadPreferencesID:=PREF_GetPreferenceID("Bank Account"+String:C10(ABC_t_AccountCode))
	QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=ACC_l_LoadPreferencesID)
	If (Records in selection:C76([PREFERENCES:116])>0)
		$_l_offset:=0
		$_D_OpeningBalanceDate:=!00-00-00!
		$_r_OpeningBalance:=0
		If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_D_OpeningBalanceDate; $_l_offset)
			If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_r_OpeningBalance; $_l_offset)
			End if 
		End if 
		If ($_r_OpeningBalance#0) & ($_D_OpeningBalanceDate#!00-00-00!)
			READ WRITE:C146([ACC_Bank_Statements:198])
			QUERY:C277([ACC_Bank_Statements:198]; [ACC_Bank_Statements:198]Bank_TransactionDate:5>=$_D_OpeningBalanceDate)
			ORDER BY:C49([ACC_Bank_Statements:198]; [ACC_Bank_Statements:198]Bank_TransactionDate:5; [ACC_Bank_Statements:198]Bank_TransactionTimeStamp:12; >)
			ABR_R_Balance:=$_r_OpeningBalance
			APPLY TO SELECTION:C70([ACC_Bank_Statements:198]; [ACC_Bank_Statements:198]Bank_Balance:10:=ABR_CalculateBalance(->ABR_R_Balance))
		End if 
	End if 
	USE SET:C118("AFTER")
	//here we set the the date range on the form based on that selection..note that this is only the imported data displayed
	//usually that would be all the records for those dates.
	
	ORDER BY:C49([ACC_Bank_Statements:198]; [ACC_Bank_Statements:198]Bank_TransactionDate:5; >)
	FIRST RECORD:C50([ACC_Bank_Statements:198])
	ACC_D_TransactsFrom:=[ACC_Bank_Statements:198]Bank_TransactionDate:5
	LAST RECORD:C200([ACC_Bank_Statements:198])
	ACC_D_Transactsto:=[ACC_Bank_Statements:198]Bank_TransactionDate:5
	FIRST RECORD:C50([ACC_Bank_Statements:198])
	DB_SetFormSortOrder(Table:C252(->[ACC_Bank_Statements:198]); ""; 0; 0; ->DB_aptr_BankStatements)
	
	
Else 
	Gen_Alert("You must set a bank account code first!")
	
End if 
ERR_MethodTrackerReturn("OBJ ACC_ImportStatement.oImport"; $_t_oldMethodName)
