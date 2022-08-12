//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Invoices CredSt
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2012 15:22
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

$_t_oldMethodName:=ERR_MethodTracker("Invoices CredSt")
If ([INVOICES:39]Credit_Stage:22="")
	If ([COMPANIES:2]Default_Credit_Stage:42#"")
		[INVOICES:39]Credit_Stage:22:=[COMPANIES:2]Default_Credit_Stage:42
	Else 
		[INVOICES:39]Credit_Stage:22:=DB_GetLedgerInvoiceDefaultStage
	End if 
End if 
ERR_MethodTrackerReturn("Invoices CredSt"; $_t_oldMethodName)