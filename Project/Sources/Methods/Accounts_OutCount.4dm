//%attributes = {}
If (False:C215)
	//Project Method Name:      Accounts_OutCount
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:40
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(CUR_at_CurrencyToconvert;0)
	C_REAL:C285($_r_Sum; vBalance)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_oldMethodName; vText)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Accounts_OutCount")
//Accounts_OutCountnt
FIRST RECORD:C50([ACCOUNTS:32])
$_r_Sum:=0
While (Not:C34(End selection:C36([ACCOUNTS:32])))
	QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Account_Code:2=[ACCOUNTS:32]Account_Code:2)
	CREATE SET:C116([ACCOUNT_BALANCES:34]; "Extra3")
	INTERSECTION:C121("Extra2"; "Extra3"; "Extra3")
	USE SET:C118("Extra3")
	DISTINCT VALUES:C339([ACCOUNT_BALANCES:34]Currency_Code:6; CUR_at_CurrencyToconvert)
	Calc_Balance2(<>SYS_t_BaseCurrency; ->CUR_at_CurrencyToconvert)
	$_r_Sum:=Gen_Round(($_r_Sum+vBalance); 2; 2)
	NEXT RECORD:C51([ACCOUNTS:32])
End while 
vText:=vText+"Total Balance: "+String:C10($_r_Sum; "|Accounts")
ERR_MethodTrackerReturn("Accounts_OutCount"; $_t_oldMethodName)
