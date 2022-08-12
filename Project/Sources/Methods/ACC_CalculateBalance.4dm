//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_CalculateBalance
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
	//C_UNKNOWN($1)
	//C_UNKNOWN(vAccName)
	//C_UNKNOWN(vAccount)
	//C_UNKNOWN(vCode)
	//C_UNKNOWN(vTotal)
	C_REAL:C285(vTotal; vBalance)
	C_TEXT:C284($1; vAccName; vAccount; vCode; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_CalculateBalance")
//ACC_CalculateBalance
vBalance:=0
vTotal:=0
FIRST RECORD:C50([ACCOUNT_BALANCES:34])
vAccount:=[ACCOUNT_BALANCES:34]Account_Code:2
If (Count parameters:C259>=1)
	While (Not:C34(End selection:C36([ACCOUNT_BALANCES:34])))
		vCode:=[ACCOUNT_BALANCES:34]Account_Code:2
		RELATE ONE:C42([ACCOUNT_BALANCES:34]Account_Code:2)
		vAccName:=[ACCOUNTS:32]Account_Name:3
		vBalance:=vBalance+[ACCOUNT_BALANCES:34]Balance:3
		vTotal:=vTotal+[ACCOUNT_BALANCES:34]Balance:3
		NEXT RECORD:C51([ACCOUNT_BALANCES:34])
		If ([ACCOUNT_BALANCES:34]Account_Code:2#vAccount)
			If ($1="P")
				Print form:C5([ACCOUNT_BALANCES:34]; "PL_Detail"; Form detail:K43:1)
				
			End if 
			vBalance:=0
			vAccount:=[ACCOUNT_BALANCES:34]Account_Code:2
		End if 
	End while 
End if 
ERR_MethodTrackerReturn("ACC_CalculateBalance"; $_t_oldMethodName)
