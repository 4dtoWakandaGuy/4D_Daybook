If (False:C215)
	//object Method Name: Object Name:      ACC_ImportStatement.oImport1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/02/2012 14:04
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($_D_OpeningBalanceDate; $_d_OpeningBalanceDate2)
	C_LONGINT:C283($_l_offset; ACC_l_LoadPreferencesID)
	C_REAL:C285($_r_OpeningBalance; $_r_OpeningBalance2; ABR_R_Balance)
	C_TEXT:C284($_t_oldMethodName; ABC_t_AccountCode)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ ACC_ImportStatement.oImport1"; Form event code:C388)

$_D_OpeningBalanceDate:=!00-00-00!
$_r_OpeningBalance:=0

ACC_l_LoadPreferencesID:=PREF_GetPreferenceID("Bank Account"+String:C10(ABC_t_AccountCode))
QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=ACC_l_LoadPreferencesID)
$_l_offset:=0
If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
	BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_D_OpeningBalanceDate; $_l_offset)
	If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_r_OpeningBalance; $_l_offset)
	End if 
End if 

If (Records in selection:C76([PREFERENCES:116])>0)
End if 
If (ABC_t_AccountCode#"")
	ACC_EditImportSettings(ABC_t_AccountCode)
	COPY NAMED SELECTION:C331([ACC_Bank_Statements:198]; "$Temp")
	$_d_OpeningBalanceDate2:=!00-00-00!
	$_r_OpeningBalance2:=0
	$_l_offset:=0
	If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_d_OpeningBalanceDate2; $_l_offset)
		If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_r_OpeningBalance2; $_l_offset)
		End if 
	End if 
	//if the date or opening balance are changed
	If (($_r_OpeningBalance2#0) & ($_d_OpeningBalanceDate2#!00-00-00!)) & (($_r_OpeningBalance2#$_r_OpeningBalance) | ($_d_OpeningBalanceDate2#$_D_OpeningBalanceDate))
		READ WRITE:C146([ACC_Bank_Statements:198])
		QUERY:C277([ACC_Bank_Statements:198]; [ACC_Bank_Statements:198]Bank_TransactionDate:5>=$_d_OpeningBalanceDate2)
		ORDER BY:C49([ACC_Bank_Statements:198]; [ACC_Bank_Statements:198]Bank_TransactionDate:5; [ACC_Bank_Statements:198]Bank_TransactionTimeStamp:12; >)
		ABR_R_Balance:=$_r_OpeningBalance2
		//TRACE
		APPLY TO SELECTION:C70([ACC_Bank_Statements:198]; [ACC_Bank_Statements:198]Bank_Balance:10:=ABR_CalculateBalance(->ABR_R_Balance))
	End if 
	
	
End if 
ERR_MethodTrackerReturn("OBJ ACC_ImportStatement.oImport1"; $_t_oldMethodName)
