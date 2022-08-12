//%attributes = {}
If (False:C215)
	//Project Method Name:      Calc_BalArr
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
	ARRAY REAL:C219($_ar_AccountBalances; 0)
	C_LONGINT:C283($_l_ArraySize; $_l_Index)
	C_REAL:C285(vBalance)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Calc_BalArr")
vBalance:=0
If (Records in selection:C76([ACCOUNT_BALANCES:34])>0)
	SELECTION TO ARRAY:C260([ACCOUNT_BALANCES:34]Balance:3; $_ar_AccountBalances)
	$_l_ArraySize:=Size of array:C274($_ar_AccountBalances)
	For ($_l_Index; 1; $_l_ArraySize)
		vBalance:=vBalance+$_ar_AccountBalances{$_l_Index}
	End for 
	vBalance:=Gen_Round(vBalance; 2; 2)
End if 
ERR_MethodTrackerReturn("Calc_BalArr"; $_t_oldMethodName)
