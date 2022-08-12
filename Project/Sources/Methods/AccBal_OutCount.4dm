//%attributes = {}
If (False:C215)
	//Project Method Name:      AccBal_OutCount
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
	C_REAL:C285($Bal)
	C_TEXT:C284($_t_oldMethodName; vRec; vText)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("AccBal_OutCount")
$Bal:=Gen_Round((Sum:C1([ACCOUNT_BALANCES:34]Balance:3)); 2; 2)
vText:=vText+"Balance: "+String:C10($Bal; "|Accounts")+vRec
ERR_MethodTrackerReturn("AccBal_OutCount"; $_t_oldMethodName)
