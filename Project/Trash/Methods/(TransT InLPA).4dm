//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      TransT_InLPA
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/10/2011 14:31
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Unload)
	C_LONGINT:C283(<>SYS_l_LoggedInaccount)
	C_TEXT:C284(<>WIP_t_CIPTRANS; <>WIP_t_CIWTrans; <>WIP_t_TRPTrans; <>WIP_t_TRWTrans; $_t_oldMethodName; $_t_TransactionTypeCodeOLD; DM_T_nomTRANDepositReceipt; DM_T_nomTRANSDepositReconcile; DM_T_nomTRANSInvoicePost; DM_T_nomTRANSInvoicePrePay; DM_T_nomTRANSInvoiceReceipt)
	C_TEXT:C284(DM_T_nomTRANSPurchase; DM_T_nomTRANSPurchasePay; DM_T_nomTRANSPurchasePrePay)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("TransT_InLPA")
//TransT_InLPA
$_t_TransactionTypeCodeOLD:=Old:C35([TRANSACTION_TYPES:31]Transaction_Type_Code:1)
If ($_t_TransactionTypeCodeOLD#"")
	If (TransT_ChPrefs($_t_TransactionTypeCodeOLD; False:C215)=False:C215)
		READ WRITE:C146([USER:15])
		$_bo_Unload:=(Records in selection:C76([USER:15])=0)
		If (<>SYS_l_LoggedInaccount=0)
			QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=0)
		Else 
			QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=<>SYS_l_LoggedInaccount)
		End if 
		If (Locked:C147([USER:15]))
			Gen_Alert("The change to Preferences could not be saved - record in use")
		Else 
			Case of 
				: ($_t_TransactionTypeCodeOLD=DB_GetLedgerTRANSINVpost)
					DM_T_nomTRANSInvoicePost:=[TRANSACTION_TYPES:31]Transaction_Type_Code:1
					DB_SaveLedgerPreferences
				: ($_t_TransactionTypeCodeOLD=DB_GetLedgerTRANSRECpost)
					DM_T_nomTRANSInvoiceReceipt:=[TRANSACTION_TYPES:31]Transaction_Type_Code:1
					DB_SaveLedgerPreferences
				: ($_t_TransactionTypeCodeOLD=DB_GetLedgerTRANSDeposit)
					DM_T_nomTRANDepositReceipt:=[TRANSACTION_TYPES:31]Transaction_Type_Code:1
					DB_SaveLedgerPreferences
				: ($_t_TransactionTypeCodeOLD=DB_GetLedgerTransDepositRec)
					DM_T_nomTRANSDepositReconcile:=[TRANSACTION_TYPES:31]Transaction_Type_Code:1
					DB_SaveLedgerPreferences
				: ($_t_TransactionTypeCodeOLD=DB_GetLedgerTRANSPURpost)
					DM_T_nomTRANSPurchase:=[TRANSACTION_TYPES:31]Transaction_Type_Code:1
					DB_SaveLedgerPreferences
				: ($_t_TransactionTypeCodeOLD=DB_GetLedgerTRANSPurINVPay)
					DM_T_nomTRANSPurchasePay:=[TRANSACTION_TYPES:31]Transaction_Type_Code:1
					DB_SaveLedgerPreferences
				: ($_t_TransactionTypeCodeOLD=DB_GetLedgerTRANSPURPrePay)
					DM_T_nomTRANSPurchasePrePay:=[TRANSACTION_TYPES:31]Transaction_Type_Code:1
					DB_SaveLedgerPreferences
				: ($_t_TransactionTypeCodeOLD=DB_GetLedgerTRANSPREpost)
					DM_T_nomTRANSInvoicePrePay:=[TRANSACTION_TYPES:31]Transaction_Type_Code:1
					DB_SaveLedgerPreferences
				: ($_t_TransactionTypeCodeOLD=<>WIP_t_TRPTrans)
					<>WIP_t_TRPTrans:=[TRANSACTION_TYPES:31]Transaction_Type_Code:1
					[USER:15]WIP TR Trans:200:=[TRANSACTION_TYPES:31]Transaction_Type_Code:1
				: ($_t_TransactionTypeCodeOLD=<>WIP_t_CIPTRANS)
					<>WIP_t_CIPTRANS:=[TRANSACTION_TYPES:31]Transaction_Type_Code:1
					[USER:15]WIP CI Trans:201:=[TRANSACTION_TYPES:31]Transaction_Type_Code:1
				: ($_t_TransactionTypeCodeOLD=<>WIP_t_TRWTrans)
					<>WIP_t_TRWTrans:=[TRANSACTION_TYPES:31]Transaction_Type_Code:1
					[USER:15]WIP TRWO Trans:202:=[TRANSACTION_TYPES:31]Transaction_Type_Code:1
				: ($_t_TransactionTypeCodeOLD=<>WIP_t_CIWTrans)
					<>WIP_t_CIWTrans:=[TRANSACTION_TYPES:31]Transaction_Type_Code:1
					[USER:15]WIP CIWO Trans:203:=[TRANSACTION_TYPES:31]Transaction_Type_Code:1
			End case 
			DB_SaveRecord(->[USER:15])
		End if 
		If ($_bo_Unload)
			UNLOAD RECORD:C212([USER:15])
		End if 
		READ ONLY:C145([USER:15])
	End if 
End if 
ERR_MethodTrackerReturn("TransT_InLPA"; $_t_oldMethodName)
