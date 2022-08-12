//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Invoices Alloc
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/11/2010 05:51
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_UseOld)
	C_LONGINT:C283(<>MENU_l_BarModule; $_l_AllocationIndex)
	C_TEXT:C284($_t_InvoiceNumber; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Invoices Alloc")
$_bo_UseOld:=False:C215
$_t_InvoiceNumber:=[INVOICES:39]Invoice_Number:1
DB_SaveRecord(->[INVOICES:39])
COPY NAMED SELECTION:C331([INVOICES:39]; "IA")
If ($_bo_UseOld)
	
Else 
	CREATE EMPTY SET:C140([INVOICES:39]; "Extra")
	INV_GetAllocations($_t_InvoiceNumber)
	For ($_l_AllocationIndex; 1; Records in selection:C76([XInvoiceAllocation:126]))
		Case of 
			: ([XInvoiceAllocation:126]xInvoiceNumber:2#"") & ([XInvoiceAllocation:126]xInvoiceNumber:2#$_t_InvoiceNumber)
				QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=[XInvoiceAllocation:126]xInvoiceNumber:2)
			: ([XInvoiceAllocation:126]xCreditNumber:3#"") & ([XInvoiceAllocation:126]xCreditNumber:3#$_t_InvoiceNumber)
				QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=[XInvoiceAllocation:126]xCreditNumber:3)
			: ([XInvoiceAllocation:126]xReceiptNumber:4#"") & ([XInvoiceAllocation:126]xReceiptNumber:4#$_t_InvoiceNumber)
				QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=[XInvoiceAllocation:126]xReceiptNumber:4)
			: ([XInvoiceAllocation:126]xDepositNumber:5#"") & ([XInvoiceAllocation:126]xDepositNumber:5#$_t_InvoiceNumber)
				QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=[XInvoiceAllocation:126]xDepositNumber:5)
				
		End case 
		If (Records in selection:C76([INVOICES:39])>0)
			ADD TO SET:C119([INVOICES:39]; "Extra")
		End if 
		NEXT RECORD:C51([XInvoiceAllocation:126])
	End for 
	USE SET:C118("Extra")
	CLEAR SET:C117("Extra")
End if 

If (Records in selection:C76([INVOICES:39])>0)
	COPY NAMED SELECTION:C331([INVOICES:39]; "IA1")
	//◊AutoOut:=False
	//◊AutoFind:=True
	//ZInvoices_Mod
	DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[INVOICES:39])); <>MENU_l_BarModule; "IA1")
	
End if 
USE NAMED SELECTION:C332("IA")
CLEAR NAMED SELECTION:C333("IA")
ERR_MethodTrackerReturn("Invoices Alloc"; $_t_oldMethodName)