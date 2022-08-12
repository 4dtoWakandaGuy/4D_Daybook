//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_ArrayDeclare
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2012 06:31
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(ACC_abo_BalProfitCalculated;0)
	//ARRAY REAL(ACC_ar_BalAccountDetailsAmount;0;0)
	//ARRAY REAL(ACC_ar_BalConvertedACCPrfTotals;0;0)
	//ARRAY REAL(ACC_ar_BalConvertedAccTotals;0;0)
	//ARRAY REAL(ACC_ar_BalConvertedAmounts;0;0)
	//ARRAY REAL(ACC_ar_BalConvertedProfitAmount;0;0)
	//ARRAY REAL(ACC_ar_BalCurrencyTotalAmounts;0;0)
	//ARRAY REAL(ACC_ar_BalOuptutAccountBalance;0)
	//ARRAY REAL(ACC_ar_OutputACCprofBalance;0)
	//ARRAY TEXT(ACC_at_BalAccountCodes;0)
	//ARRAY TEXT(ACC_at_BalAccountIdentity;0)
	//ARRAY TEXT(ACC_at_BalAccountPLString;0)
	//ARRAY TEXT(ACC_at_BalAnalysisCodes;0)
	//ARRAY TEXT(ACC_at_BalCurrencyCodes;0)
	//ARRAY TEXT(ACC_at_BalCurrencyCodesRange;0)
	//ARRAY TEXT(ACC_at_BalCurrencyDetailsCode;0;0)
	//ARRAY TEXT(ACC_at_BalCurrencyTotalsCC;0;0)
	//ARRAY TEXT(ACC_at_BalLayerCodes;0)
	//ARRAY TEXT(ACC_at_BalPeriodCodes;0)
	C_BOOLEAN:C305(ACC_Bo_CheckBalance)
	C_LONGINT:C283($_l_ArraySize)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_ArrayDeclare")

ARRAY REAL:C219(ACC_ar_BalAccountDetailsAmount; 0; 0)
ARRAY TEXT:C222(ACC_at_BalCurrencyDetailsCode; 0; 0)
ARRAY REAL:C219(ACC_ar_BalConvertedAmounts; 0; 0)
ARRAY REAL:C219(ACC_ar_BalConvertedProfitAmount; 0; 0)

//``
ARRAY REAL:C219(ACC_ar_BalCurrencyTotalAmounts; 0; 0)
ARRAY TEXT:C222(ACC_at_BalCurrencyTotalsCC; 0; 0)
ARRAY REAL:C219(ACC_ar_BalConvertedAccTotals; 0; 0)
ARRAY REAL:C219(ACC_ar_BalConvertedACCPrfTotals; 0; 0)

ARRAY TEXT:C222(ACC_at_BalAccountIdentity; 0)
ARRAY TEXT:C222(ACC_at_BalAccountCodes; 0)
ARRAY TEXT:C222(ACC_at_BalAnalysisCodes; 0)
ARRAY TEXT:C222(ACC_at_BalPeriodCodes; 0)
ARRAY TEXT:C222(ACC_at_BalLayerCodes; 0)
ARRAY TEXT:C222(ACC_at_BalCurrencyCodes; 0)
ARRAY TEXT:C222(ACC_at_BalAccountPLString; 0)
ARRAY TEXT:C222(ACC_at_BalCurrencyCodesRange; 0)
ARRAY REAL:C219(ACC_ar_BalOuptutAccountBalance; 0)
ARRAY BOOLEAN:C223(ACC_abo_BalProfitCalculated; 0)
$_l_ArraySize:=Records in selection:C76([ACCOUNT_BALANCES:34])
ARRAY TEXT:C222(ACC_at_BalAccountIdentity; $_l_ArraySize)
ARRAY TEXT:C222(ACC_at_BalAccountCodes; $_l_ArraySize)
ARRAY TEXT:C222(ACC_at_BalAnalysisCodes; $_l_ArraySize)
ARRAY TEXT:C222(ACC_at_BalPeriodCodes; $_l_ArraySize)
ARRAY TEXT:C222(ACC_at_BalLayerCodes; $_l_ArraySize)
ARRAY TEXT:C222(ACC_at_BalCurrencyCodes; $_l_ArraySize)
ARRAY TEXT:C222(ACC_at_BalAccountPLString; $_l_ArraySize)
ARRAY REAL:C219(ACC_ar_BalOuptutAccountBalance; $_l_ArraySize)
ARRAY REAL:C219(ACC_ar_OutputACCprofBalance; $_l_ArraySize)
ARRAY BOOLEAN:C223(ACC_abo_BalProfitCalculated; $_l_ArraySize)


//```````````````
ARRAY REAL:C219(ACC_ar_BalAccountDetailsAmount; $_l_ArraySize; 0)
ARRAY TEXT:C222(ACC_at_BalCurrencyDetailsCode; $_l_ArraySize; 0)
ARRAY REAL:C219(ACC_ar_BalConvertedAmounts; $_l_ArraySize; 0)
ARRAY REAL:C219(ACC_ar_BalConvertedProfitAmount; $_l_ArraySize; 0)
ARRAY REAL:C219(ACC_ar_BalCurrencyTotalAmounts; $_l_ArraySize; 0)
ARRAY TEXT:C222(ACC_at_BalCurrencyTotalsCC; $_l_ArraySize; 0)
ARRAY REAL:C219(ACC_ar_BalConvertedAccTotals; $_l_ArraySize; 0)
ARRAY REAL:C219(ACC_ar_BalConvertedACCPrfTotals; $_l_ArraySize; 0)

//```````
ERR_MethodTrackerReturn("ACC_ArrayDeclare"; $_t_oldMethodName)
