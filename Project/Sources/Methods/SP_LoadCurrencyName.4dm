//%attributes = {}
If (False:C215)
	//Project Method Name:      SP_LoadCurrencyName
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($1)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_oldMethodName; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SP_LoadCurrencyName")
$0:=""
If (Count parameters:C259>=1)
	If ($1>0)
		QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]X_ID:3=$1)
		$0:=[CURRENCIES:71]Currency_Code:1
	Else 
		$0:=<>SYS_t_BaseCurrency
	End if 
End if 
ERR_MethodTrackerReturn("SP_LoadCurrencyName"; $_t_oldMethodName)