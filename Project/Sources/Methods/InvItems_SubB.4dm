//%attributes = {}
If (False:C215)
	//Project Method Name:      InvItems_SubB
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
	C_BOOLEAN:C305(<>PersAnOver; <>SalesItemDP)
	C_TEXT:C284(<>Per_t_CurrentDefaultAnalCode; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("InvItems_SubB")
//Project Method InvItems_SubB 26/3/2(ID 10631-974)

If ([INVOICES_ITEMS:161]Tax_Code:6="")
	If ([COMPANIES:2]Default_TAX:41="")
		If (([INVOICES:39]UK_EC:21="E") & ([INVOICES:39]TAX_Registration_Number:20#""))
			[INVOICES_ITEMS:161]Tax_Code:6:="Z"
		Else 
			[INVOICES_ITEMS:161]Tax_Code:6:=DB_GetLedgerDefaultSalesTax
		End if 
	Else 
		[INVOICES_ITEMS:161]Tax_Code:6:=[COMPANIES:2]Default_TAX:41
	End if 
End if 
If ([INVOICES_ITEMS:161]Sales_Account:9="")
	[INVOICES_ITEMS:161]Sales_Account:9:=[TRANSACTION_TYPES:31]Credit_Account:5
	If ([INVOICES:39]Analysis_Code:17#"")
		[INVOICES_ITEMS:161]Analysis_Code:10:=[INVOICES:39]Analysis_Code:17
	Else 
		If (<>PersAnOver)
			[INVOICES_ITEMS:161]Analysis_Code:10:=<>Per_t_CurrentDefaultAnalCode
		Else 
			[INVOICES_ITEMS:161]Analysis_Code:10:=[TRANSACTION_TYPES:31]Analysis_Code:7
		End if 
	End if 
	[INVOICES_ITEMS:161]Print_Description:14:=<>SalesItemDP
End if 
If ([INVOICES_ITEMS:161]Price_Per:16=0)
	[INVOICES_ITEMS:161]Price_Per:16:=1
End if 
ERR_MethodTrackerReturn("InvItems_SubB"; $_t_oldMethodName)