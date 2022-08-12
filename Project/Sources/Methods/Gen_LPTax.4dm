//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_LPTax
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2012 16:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_LPTax")
If ([COMPANIES:2]Default_TAX:41="")
	$0:=DB_GetLedgerDefaultSalesTax
Else 
	$0:=[COMPANIES:2]Default_TAX:41
End if 
ERR_MethodTrackerReturn("Gen_LPTax"; $_t_oldMethodName)