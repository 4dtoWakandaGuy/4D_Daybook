//%attributes = {}
If (False:C215)
	//Project Method Name:      CurrRates_In
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 31/08/2010 05:52
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CurrRates_In")
Gen_In("Enter Currency Rates"; "CurrRates_File"; "Master"; ->[CURRENCY_RATES:72])
ERR_MethodTrackerReturn("CurrRates_In"; $_t_oldMethodName)