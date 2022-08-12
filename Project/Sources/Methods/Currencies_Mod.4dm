//%attributes = {}
If (False:C215)
	//Project Method Name:      Currencies_Mod
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:40If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_AutoFind)
	C_TEXT:C284($_t_oldMethodName; $_t_SetName; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Currencies_Mod")
$_t_SetName:=""
$_bo_AutoFind:=False:C215
If (Count parameters:C259>=2)
	$_bo_AutoFind:=($2="TRUE")
	
	CREATE EMPTY SET:C140([CURRENCIES:71]; "CurrencyFound")
	QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]Currency_Code:1=$1)
	If (Records in selection:C76([CURRENCIES:71])>0)
		CREATE SET:C116([CURRENCIES:71]; "CurrencyFound")
	End if 
	$_t_SetName:="CurrencyFound"
End if 
Minor_Mod(->[CURRENCIES:71]; "Currencies"; ""; ""; $_t_SetName; $_bo_AutoFind)
ERR_MethodTrackerReturn("Currencies_Mod"; $_t_oldMethodName)