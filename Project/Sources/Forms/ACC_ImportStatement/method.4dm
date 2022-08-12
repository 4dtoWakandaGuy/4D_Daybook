If (False:C215)
	//Project Form Method Name:      ACC_ImportStatement
	//------------------ Method Notes ------------------
	
	// Parameters
	// Declarations
	// ----------------------------------------------------
	// Project method Amendments
	
	// Nigel Greenlee12/2/2012 20:01 v7.0.0/1
	// Added
	
	// Block of lines added from line 23to line 35
	// Block of lines added from line 45to line 47
	// Edited
	// (1)If (False)` ----------------------------------------------------(Changed to)End if 
	//------------------ Revision Control ----------------
	//Date Created: 12/2/2012 15:34
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(ACC_lb_Transactions;0)
	//ARRAY POINTER(DB_aptr_BankStatements;0)
	ARRAY TEXT:C222($_at_StatementCodes; 0)
	//ARRAY TEXT(ACC_at_BankAccountCodes;0)
	//ARRAY TEXT(ACC_at_DBAccountCode;0)
	C_BOOLEAN:C305($_bo_newLevel; ABC_bo_UnReconciled; DB_bo_ButtonCall; DB_bo_NoLoad)
	C_DATE:C307(ACC_D_TransactsFrom; ACC_D_TransactsFromOLD; ACC_D_TransactsFromPick; ACC_D_TransactsTo; ACC_D_TransactsToOLD; ACC_D_TransactstoPick; SD_D_Date)
	C_LONGINT:C283($_l_ButtonFunction; $_l_Event; $_l_FieldNumber; $_l_offset; $_l_PreferenceID; $_l_ReuseLevel; $_l_TableNumber; ABS_l_BUT1; ABS_l_BUT10; ABS_l_BUT11; ABS_l_BUT12)
	C_LONGINT:C283(ABS_l_BUT13; ABS_l_BUT14; ABS_l_BUT15; ABS_l_BUT16; ABS_l_BUT17; ABS_l_BUT18; ABS_l_BUT19; ABS_l_BUT2; ABS_l_BUT20; ABS_l_BUT21; ABS_l_BUT22)
	C_LONGINT:C283(ABS_l_BUT23; ABS_l_BUT24; ABS_l_BUT25; ABS_l_BUT26; ABS_l_BUT27; ABS_l_BUT3; ABS_l_BUT4; ABS_l_BUT5; ABS_l_BUT6; ABS_l_BUT7; ABS_l_BUT8)
	C_LONGINT:C283(ABS_l_BUT9; ACC_EventCall; DB_l_ButtonClickedFunction)
	C_POINTER:C301($_ptr_FocusObject; SD_ptr_Date1)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName; ABC_t_AccountCode; ACC_t_DBAccountCode; oABS_COL1; oABS_COL10; oABS_COL11; oABS_COL12; oABS_COL13; oABS_COL14; oABS_COL15)
	C_TEXT:C284(oABS_COL16; oABS_COL17; oABS_COL18; oABS_COL19; oABS_COL2; oABS_COL20; oABS_COL21; oABS_COL22; oABS_COL23; oABS_COL24; oABS_COL25)
	C_TEXT:C284(oABS_COL26; oABS_COL27; oABS_COL3; oABS_COL4; oABS_COL5; oABS_COL6; oABS_COL7; oABS_COL8; oABS_COL9; oABS_HED1; oABS_HED10)
	C_TEXT:C284(oABS_HED11; oABS_HED12; oABS_HED13; oABS_HED14; oABS_HED15; oABS_HED16; oABS_HED17; oABS_HED18; oABS_HED19; oABS_HED2; oABS_HED20)
	C_TEXT:C284(oABS_HED21; oABS_HED22; oABS_HED23; oABS_HED24; oABS_HED25; oABS_HED26; oABS_HED27; oABS_HED3; oABS_HED4; oABS_HED5; oABS_HED6)
	C_TEXT:C284(oABS_HED7; oABS_HED8; oABS_HED9)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("FM [projectForm]/ACC_ImportStatement/{formMethod}"; Form event code:C388)

$_l_Event:=Form event code:C388
Case of 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		$_l_PreferenceID:=PREF_GetPreferenceID("Bank Statements")
		$_l_offset:=0
		
		ACC_D_TransactstoPick:=!00-00-00!
		ACC_D_TransactsFromPick:=!00-00-00!
		ABC_t_AccountCode:=""
		ACC_D_TransactsFrom:=!00-00-00!
		ACC_D_TransactsTo:=!00-00-00!
		ACC_t_DBAccountCode:=""
		ARRAY TEXT:C222(ACC_at_DBAccountCode; 0)
		QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_PreferenceID)
		ARRAY TEXT:C222($_at_StatementCodes; 0)
		ARRAY TEXT:C222(ACC_at_BankAccountCodes; 0)
		If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_at_StatementCodes; $_l_offset)
			If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; ACC_at_DBAccountCode; $_l_offset)
			End if 
		End if 
		If (Size of array:C274($_at_StatementCodes)=0)
			OBJECT SET VISIBLE:C603(ABC_t_AccountCode; True:C214)
			OBJECT SET VISIBLE:C603(*; "oAddNewAccount"; True:C214)
			OBJECT SET VISIBLE:C603(ACC_at_BankAccountCodes; False:C215)
			ACC_at_BankAccountCodes:=0
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
		
		ARRAY TEXT:C222(ACC_at_DBAccountCode; Size of array:C274($_at_StatementCodes))
		ACC_t_DBAccountCode:=ACC_at_DBAccountCode{ACC_at_BankAccountCodes}
		QUERY:C277([ACC_Bank_Statements:198]; [ACC_Bank_Statements:198]Bank_Account_Number:2=ABC_t_AccountCode)
		ORDER BY:C49([ACC_Bank_Statements:198]; [ACC_Bank_Statements:198]Bank_TransactionDate:5; [ACC_Bank_Statements:198]Bank_TransactionTimeStamp:12; >)
		FIRST RECORD:C50([ACC_Bank_Statements:198])
		ACC_D_TransactsFrom:=[ACC_Bank_Statements:198]Bank_TransactionDate:5
		LAST RECORD:C200([ACC_Bank_Statements:198])
		ACC_D_Transactsto:=[ACC_Bank_Statements:198]Bank_TransactionDate:5
		FIRST RECORD:C50([ACC_Bank_Statements:198])
		If (False:C215)
			LB_SetEnterable(->ACC_lb_Transactions; False:C215; 0)
			//`  1.23457e+24+last4 digitsof card
			LBi_InclSetupJustStyle(->ACC_lb_Transactions)
		End if 
		ARRAY POINTER:C280(DB_aptr_BankStatements; 0)
		$_bo_newLevel:=True:C214
		$_l_ReuseLevel:=0
		LBi_ArrDefFill(->DB_aptr_BankStatements; ->ACC_lb_Transactions; ->[ACC_Bank_Statements:198]x_ID:1; ->[ACC_Bank_Statements:198]x_ID:1; "411111000"; ""; 1; "Bank Statements"; "Bank Statement"; ""; $_bo_newLevel; $_l_ReuseLevel)
		LBi_LoadSetup(->DB_aptr_BankStatements)
		
		DB_SetFormSortOrder(Table:C252(->[ACC_Bank_Statements:198]); ""; 0; 0; ->DB_aptr_BankStatements)
		ACC_D_TransactsFromPick:=ACC_D_TransactsFrom
		ACC_D_TransactsToPick:=ACC_D_TransactsTo
	: ($_l_Event=On Data Change:K2:15)
		
		$_ptr_FocusObject:=Focus object:C278
		RESOLVE POINTER:C394($_ptr_FocusObject; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		Case of 
			: ("ACC_D_TransactsFrom"=$_t_VariableName) | ("ACC_D_Transactsto"=$_t_VariableName)
				QUERY:C277([ACC_Bank_Statements:198]; [ACC_Bank_Statements:198]Bank_Account_Number:2=ABC_t_AccountCode)
				If (ACC_D_TransactsFrom>!00-00-00!)
					QUERY SELECTION:C341([ACC_Bank_Statements:198]; [ACC_Bank_Statements:198]Bank_TransactionDate:5>=ACC_D_TransactsFrom)
				End if 
				If (ACC_D_Transactsto>!00-00-00!)
					QUERY SELECTION:C341([ACC_Bank_Statements:198]; [ACC_Bank_Statements:198]Bank_TransactionDate:5<=ACC_D_Transactsto)
				End if 
				If (ABC_bo_UnReconciled)
					QUERY SELECTION BY FORMULA:C207([ACC_Bank_Statements:198]; Abs:C99([ACC_Bank_Statements:198]Bank_ReconciledAmount:11)<((Abs:C99([ACC_Bank_Statements:198]Bank_CreditAmount:9))+(Abs:C99([ACC_Bank_Statements:198]Bank_DebitAmount:8))))
				End if 
				
				ORDER BY:C49([ACC_Bank_Statements:198]; [ACC_Bank_Statements:198]Bank_TransactionDate:5; >)
				FIRST RECORD:C50([ACC_Bank_Statements:198])
				ACC_D_TransactsFrom:=[ACC_Bank_Statements:198]Bank_TransactionDate:5
				LAST RECORD:C200([ACC_Bank_Statements:198])
				ACC_D_Transactsto:=[ACC_Bank_Statements:198]Bank_TransactionDate:5
				FIRST RECORD:C50([ACC_Bank_Statements:198])
				ACC_D_TransactsFromPick:=ACC_D_TransactsFrom
				ACC_D_TransactsToPick:=ACC_D_TransactsTo
		End case 
	: ($_l_Event=On Open Detail:K2:23)
		ACC_D_TransactsFromOLD:=ACC_D_TransactsFrom
		ACC_D_TransactsToOLD:=ACC_D_TransactsTo
		COPY NAMED SELECTION:C331([ACC_Bank_Statements:198]; "TempSelection")
	: ($_l_Event=On Close Detail:K2:24)
		USE NAMED SELECTION:C332("TempSelection")
		ACC_D_TransactsFromOLD:=ACC_D_TransactsFrom
		ACC_D_TransactsToOLD:=ACC_D_TransactsToOLD
		ACC_D_TransactsFromPick:=ACC_D_TransactsFrom
		ACC_D_TransactsToPick:=ACC_D_TransactsTo
		DB_SetFormSortOrder(Table:C252(->[ACC_Bank_Statements:198]); ""; 0; 0; ->DB_aptr_BankStatements)
		
	: ($_l_Event=On Outside Call:K2:11)
		If (ACC_EventCall>0)
			SD_ptr_Date1->:=SD_D_Date
			
		End if 
		$_l_ButtonFunction:=DB_l_ButtonClickedFunction
		DB_l_ButtonClickedFunction:=0
		Case of 
			: ($_l_ButtonFunction=DB_GetButtonFunction("Cancel"))
				CANCEL:C270
			: ($_l_ButtonFunction=DB_GetButtonFunction("Close"))
				CANCEL:C270
		End case 
	: ($_l_Event=On Clicked:K2:4)
		If (False:C215)
			ACC_D_TransactsFrom:=ACC_D_TransactsFromPick
			ACC_D_TransactsTo:=ACC_D_TransactsToPick
			If (ABC_bo_UnReconciled)
				QUERY SELECTION BY FORMULA:C207([ACC_Bank_Statements:198]; Abs:C99([ACC_Bank_Statements:198]Bank_ReconciledAmount:11)<((Abs:C99([ACC_Bank_Statements:198]Bank_CreditAmount:9))+(Abs:C99([ACC_Bank_Statements:198]Bank_DebitAmount:8))))
			Else 
				QUERY:C277([ACC_Bank_Statements:198]; [ACC_Bank_Statements:198]Bank_Account_Number:2=ABC_t_AccountCode)
				If (ACC_D_TransactsFrom>!00-00-00!)
					QUERY SELECTION:C341([ACC_Bank_Statements:198]; [ACC_Bank_Statements:198]Bank_TransactionDate:5>=ACC_D_TransactsFrom)
				End if 
				If (ACC_D_Transactsto>!00-00-00!)
					QUERY SELECTION:C341([ACC_Bank_Statements:198]; [ACC_Bank_Statements:198]Bank_TransactionDate:5<=ACC_D_Transactsto)
				End if 
				ORDER BY:C49([ACC_Bank_Statements:198]; [ACC_Bank_Statements:198]Bank_TransactionDate:5; [ACC_Bank_Statements:198]Bank_TransactionTimeStamp:12; >)
				FIRST RECORD:C50([ACC_Bank_Statements:198])
				ACC_D_TransactsFrom:=[ACC_Bank_Statements:198]Bank_TransactionDate:5
				LAST RECORD:C200([ACC_Bank_Statements:198])
				ACC_D_Transactsto:=[ACC_Bank_Statements:198]Bank_TransactionDate:5
				FIRST RECORD:C50([ACC_Bank_Statements:198])
			End if 
			
		End if 
		
End case 





//Nigel Greenlee19/05/2012 17:05 v7.0.0/83
//Edited
//(235)(Changed to)ACC_D_TransactsTo:=ACC_D_TransactsToPick


//Nigel Greenlee19/05/2012 17:09 v7.0.0/83


//Nigel Greenlee28/08/2012 14:24 v7.0.0/1
//Added

//Block of lines added from line 117to line 147
//Block of lines added from line 156to line 158//(163)ACC_D_TransactstoPick:=!00/00/00!
//(164)ACC_D_TransactsFromPick:=!00/00/00!
//(209)ACC_D_TransactsFromPick:=ACC_D_TransactsFrom
//(210)ACC_D_TransactsToPick:=ACC_D_TransactsTo
//(216): ("ACC_D_TransactsFrom"=$_t_VariableName) | ("ACC_D_Transactsto"=$_t_VariableName)
//(226)End if
//(227)
//(234)ACC_D_TransactsFromPick:=ACC_D_TransactsFrom
//(235)ACC_D_TransactsToPick:=ACC_D_TransactsTo

//Block of lines added from line 241to line 250
//Block of lines added from line 285to line 290
//Edited

//Block of lines edited from line 1to line 10
//Block of lines edited from line 12to line 106
//Block of lines edited from line 108to line 110//(112) (Changed to) // Block of lines Deleted from line 82to line 109` (129)BLOB TO VARIABLE([Preferences]DataBlob;$_at_StatementCodes)

//Block of lines edited from line 114to line 116

//Nigel Greenlee31/08/2012 11:43 v7.0.0/1
//Edited
//(242)USE NAMED SELECTION([ACC_Bank_Statements];"TempSelection")(Changed to)USE NAMED SELECTION("TempSelection")
ERR_MethodTrackerReturn("FM ACC_ImportStatement"; $_t_oldMethodName)
