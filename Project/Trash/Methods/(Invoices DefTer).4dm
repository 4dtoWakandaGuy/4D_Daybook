//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Invoices DefTer
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2012 15:18
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

$_t_oldMethodName:=ERR_MethodTracker("Invoices DefTer")
If ([COMPANIES:2]SL_Terms:40="")
	[INVOICES:39]Terms:11:=DB_GetLedgerDefaultTerms
Else 
	[INVOICES:39]Terms:11:=[COMPANIES:2]SL_Terms:40
End if 
ERR_MethodTrackerReturn("Invoices DefTer"; $_t_oldMethodName)