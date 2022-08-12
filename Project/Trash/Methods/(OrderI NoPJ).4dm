//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      OrderI_NoPJ
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
	C_LONGINT:C283(i)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrderI_NoPJ")
OrderI_No
[ORDER_ITEMS:25]Purchase_Order_Number:18:="*"+[PURCHASE_INVOICES:37]Purchase_Code:1
[ORDER_ITEMS:25]Person:14:=<>PER_t_CurrentUserInitials
[ORDER_ITEMS:25]Supplier_Code:20:=[PURCHASE_INVOICES:37]Company_Code:2
[ORDER_ITEMS:25]Received_Date:21:=[PURCHASE_INVOICES:37]Invoice_Date:5
[ORDER_ITEMS:25]Supplier_Invoice_Number:22:=[PURCHASE_INVOICES:37]Purchase_Invoice_Number:4
i:=i+1
ERR_MethodTrackerReturn("OrderI_NoPJ"; $_t_oldMethodName)