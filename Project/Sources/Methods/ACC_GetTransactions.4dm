//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_GetTransactions
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2012 12:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_AccountCode; $_t_AnalysisCode; $_t_layerCode; $_t_LayerCurrency; $_t_oldMethodName; $_t_PeriodCode; $_t_TaxQuery; $_t_UniqueCode; $1; $2; $3)
	C_TEXT:C284($4; $5)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_GetTransactions")
//this method will get all the transactions for an account code
If (Count parameters:C259>=1)
	$_t_AccountCode:=$1
	$_t_PeriodCode:=$2
	$_t_LayerCurrency:=$3
	$_t_AnalysisCode:=$4
	$_t_layerCode:=$5
	
Else 
	$_t_accountCode:=[ACCOUNT_BALANCES:34]Account_Code:2
	$_t_PeriodCode:=[ACCOUNT_BALANCES:34]Period_Code:4
	$_t_AnalysisCode:=[ACCOUNT_BALANCES:34]Analysis_Code:1
	$_t_LayerCode:=[ACCOUNT_BALANCES:34]Layer_Code:5
	$_t_LayerCurrency:=[ACCOUNT_BALANCES:34]Currency_Code:6
End if 
Case of 
	: ($_t_accountCode=DB_GetLedgerVatInputACC)
		$_t_TaxQuery:=ACC_Buildunique(""; $_t_AnalysisCode; $_t_PeriodCode; $_t_LayerCode; $_t_LayerCurrency)
		QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Unique_StringIdentTAX:29=$_t_TaxQuery; *)
		QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]IO:18#"OS"; *)
		QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]IO:18#"IS"; *)
		QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Account_Code:3#DB_GetLedgerVatInputACC)
		CREATE SET:C116([TRANSACTIONS:29]; "$P1")
		//`````
		$_t_UniqueCode:=ACC_Buildunique(DB_GetLedgerVatInputACC; $_t_AnalysisCode; $_t_PeriodCode; $_t_LayerCode; $_t_LayerCurrency)
		QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Unique_StringIdent:28=$_t_UniqueCode; *)
		QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]IO:18#"OS"; *)
		QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]IO:18#"IS")
		CREATE SET:C116([TRANSACTIONS:29]; "$P2")
		UNION:C120("$P1"; "$P2"; "$P1")
		USE SET:C118("$P1")
		
		
	: ($_t_accountCode=DB_GetLedgerCashvatACC)
		$_t_TaxQuery:=ACC_Buildunique(""; $_t_AnalysisCode; $_t_PeriodCode; $_t_LayerCode; $_t_LayerCurrency)
		QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]IO:18="OC"; *)
		QUERY:C277([TRANSACTIONS:29];  | ; [TRANSACTIONS:29]IO:18="IC"; *)
		QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Unique_StringIdentTAX:29=$_t_TaxQuery; *)
		QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Account_Code:3#DB_GetLedgerCashvatACC)
		CREATE SET:C116([TRANSACTIONS:29]; "$P1")
		
		QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]IO:18="OS"; *)
		QUERY:C277([TRANSACTIONS:29];  | ; [TRANSACTIONS:29]IO:18="IS"; *)
		QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Unique_StringIdentTAX:29=$_t_TaxQuery; *)
		QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Account_Code:3#DB_GetLedgerCashvatACC)
		CREATE SET:C116([TRANSACTIONS:29]; "$P2")
		UNION:C120("$P1"; "$P2"; "$P1")
		USE SET:C118("$P1")
		
		
	Else 
		QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Unique_StringIdent:28=[ACCOUNT_BALANCES:34]Unique_StringIdent:8)
End case 
ERR_MethodTrackerReturn("ACC_GetTransactions"; $_t_oldMethodName)
