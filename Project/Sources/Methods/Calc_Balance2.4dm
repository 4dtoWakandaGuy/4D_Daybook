//%attributes = {}
If (False:C215)
	//Project Method Name:      Calc_Balance2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(CUR_at_OutCurrencyCode;0)
	//ARRAY TEXT(CUR_at_OutCurrencyCode2;0)
	C_BOOLEAN:C305($_bo_Continue)
	C_LONGINT:C283($_l_CurrencyCount; $_l_CurrencyIndex)
	C_POINTER:C301($2)
	C_REAL:C285($_r_Balance; VBalance)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_InputCurrency; $_t_oldMethodName; $_t_OutputCurrency; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Calc_Balance2")

If (Count parameters:C259>=1)
	$_t_OutputCurrency:=$1
Else 
	$_t_OutputCurrency:=<>SYS_t_BaseCurrency
End if 
If (Count parameters:C259>=2)
	Case of 
		: (Size of array:C274($2->)=1)
			$_t_InputCurrency:=$2->{1}
		: (Size of array:C274($2->)>1)
			$_t_InputCurrency:=""
		Else 
			$_t_InputCurrency:=$_t_OutputCurrency
	End case 
Else 
	ARRAY TEXT:C222(CUR_at_OutCurrencyCode; 0)
	DISTINCT VALUES:C339([ACCOUNT_BALANCES:34]Currency_Code:6; CUR_at_OutCurrencyCode)
	If (Size of array:C274(CUR_at_OutCurrencyCode)=1)
		$_t_InputCurrency:=CUR_at_OutCurrencyCode{1}
	Else 
		$_t_InputCurrency:=""
		
	End if 
End if 
$_bo_Continue:=False:C215
ARRAY TEXT:C222(CUR_at_OutCurrencyCode2; 0)
DISTINCT VALUES:C339([ACCOUNT_BALANCES:34]Currency_Code:6; CUR_at_OutCurrencyCode2)
If (Size of array:C274(CUR_at_OutCurrencyCode2)=1)
	$_bo_Continue:=True:C214
Else 
	$_l_CurrencyCount:=0
	For ($_l_CurrencyIndex; 1; Size of array:C274(CUR_at_OutCurrencyCode2))
		If (CUR_at_OutCurrencyCode2{$_l_CurrencyIndex}#"")
			$_l_CurrencyCount:=$_l_CurrencyCount+1
		End if 
	End for 
	If ($_l_CurrencyCount<=1)
		$_bo_Continue:=True:C214
	End if 
End if 


If ($_bo_Continue) | ($_t_OutputCurrency="") & ($_t_InputCurrency=$_t_OutputCurrency)
	
	Calc_BalArr
	
Else 
	If (Count parameters:C259>=2)
		$_r_Balance:=CUR_CalcBalConv($2; $_t_OutputCurrency)
		VBalance:=$_r_Balance
		//Calc_BalConv
	Else 
		$_r_Balance:=CUR_CalcBalConv(->CUR_at_OutCurrencyCode; $_t_OutputCurrency)
		VBalance:=$_r_Balance
	End if 
	
End if 
//See also Balances LP
ERR_MethodTrackerReturn("Calc_Balance2"; $_t_oldMethodName)
