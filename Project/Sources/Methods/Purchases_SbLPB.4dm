//%attributes = {}
If (False:C215)
	//Project Method Name:      Purchases_SbLPB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/08/2009 21:21
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>PersAnOver)
	C_TEXT:C284(<>Per_t_CurrentDefaultAnalCode; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Purchases_SbLPB")
//Project Method Purchases_SbLPB /3/2(ID 255-942)

If (([PURCHASE_INVOICE_ITEMS:158]Description:13="") & ([PURCHASE_INVOICE_ITEMS:158]Product_Code:1#""))
	RELATE ONE:C42([PURCHASE_INVOICE_ITEMS:158]Product_Code:1)
	[PURCHASE_INVOICE_ITEMS:158]Description:13:=[PRODUCTS:9]Product_Name:2
End if 
If ([PURCHASE_INVOICE_ITEMS:158]Tax_Code:5="")
	Purchases_SubTa
End if 
If ([PURCHASE_INVOICE_ITEMS:158]Purchase_Account:8="")
	[PURCHASE_INVOICE_ITEMS:158]Purchase_Account:8:=[TRANSACTION_TYPES:31]Debit_Account:4
	If ([PURCHASE_INVOICES:37]Analysis_Code:15#"")
		[PURCHASE_INVOICE_ITEMS:158]Analysis_Code:9:=[PURCHASE_INVOICES:37]Analysis_Code:15
	Else 
		If (<>PersAnOver)
			[PURCHASE_INVOICE_ITEMS:158]Analysis_Code:9:=<>Per_t_CurrentDefaultAnalCode
		Else 
			[PURCHASE_INVOICE_ITEMS:158]Analysis_Code:9:=[TRANSACTION_TYPES:31]Analysis_Code:7
		End if 
	End if 
End if 
If ([PURCHASE_INVOICE_ITEMS:158]Price_Per:10=0)
	[PURCHASE_INVOICE_ITEMS:158]Price_Per:10:=1
End if 
If ([PURCHASE_INVOICE_ITEMS:158]Quantity:2=0)
	[PURCHASE_INVOICE_ITEMS:158]Quantity:2:=1
End if 
ERR_MethodTrackerReturn("Purchases_SbLPB"; $_t_oldMethodName)