//%attributes = {}
If (False:C215)
	//Project Method Name:      Purchases_Alloc
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 31/10/2010 12:48
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_PurchaseInvoiceCodes; 0)
	C_BOOLEAN:C305(<>AutoFind)
	C_LONGINT:C283(<>MENU_l_BarModule)
	C_TEXT:C284($_t_NextPurchaseCodes; $_t_oldMethodName; $_t_PurchaseCode; $_t_PurchaseCodesList)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Purchases_Alloc")
$_t_PurchaseCode:=[PURCHASE_INVOICES:37]Purchase_Code:1
If (Modified record:C314([PURCHASE_INVOICES:37]))
	DB_SaveRecord(->[PURCHASE_INVOICES:37])
End if 
COPY NAMED SELECTION:C331([PURCHASE_INVOICES:37]; "PA")
QUERY:C277([PURCHASE_INVOICE_ALLOCATIONS:159]; [PURCHASE_INVOICE_ALLOCATIONS:159]Purchase_Code:1=$_t_PurchaseCode)
SELECTION TO ARRAY:C260([PURCHASE_INVOICE_ALLOCATIONS:159]PURCHASES_INVOICE_CODE:6; $_at_PurchaseInvoiceCodes)
QUERY WITH ARRAY:C644([PURCHASE_INVOICES:37]Purchase_Code:1; $_at_PurchaseInvoiceCodes)

If (Records in selection:C76([PURCHASE_INVOICES:37])=0)
	USE NAMED SELECTION:C332("PA")
	QUERY:C277([PURCHASE_INVOICE_ALLOCATIONS:159]; [PURCHASE_INVOICE_ALLOCATIONS:159]PURCHASES_INVOICE_CODE:6=[PURCHASE_INVOICES:37]Purchase_Code:1)
	
	
	CREATE EMPTY SET:C140([PURCHASE_INVOICES:37]; "Extra")
	If (Records in selection:C76([PURCHASE_INVOICE_ALLOCATIONS:159])>0)
		$_t_PurchaseCodesList:=""
		While (Not:C34(End selection:C36([PURCHASE_INVOICE_ALLOCATIONS:159])))
			$_t_PurchaseCodesList:=$_t_PurchaseCodesList+[PURCHASE_INVOICE_ALLOCATIONS:159]Purchase_Code:1+Char:C90(9)
			NEXT RECORD:C51([PURCHASE_INVOICE_ALLOCATIONS:159])
		End while 
		While (($_t_PurchaseCodesList#"") & ($_t_PurchaseCodesList#" "))
			$_t_NextPurchaseCodes:=First_Tab2($_t_PurchaseCodesList)
			$_t_PurchaseCodesList:=Substring:C12($_t_PurchaseCodesList; Length:C16($_t_NextPurchaseCodes)+2; 32000)
			If ($_t_NextPurchaseCodes#"")
				QUERY:C277([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Purchase_Code:1=$_t_NextPurchaseCodes)
				ADD TO SET:C119([PURCHASE_INVOICES:37]; "Extra")
			End if 
		End while 
	End if 
	USE SET:C118("Extra")
End if 
If (Records in selection:C76([PURCHASE_INVOICES:37])>0)
	COPY NAMED SELECTION:C331([PURCHASE_INVOICES:37]; "◊PA")
	//◊AutoOut:=False
	//◊AutoFind:=True
	//ZPurchases_Mod
	DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[PURCHASE_INVOICES:37])); <>MENU_l_BarModule; "◊PA")
Else 
	<>AutoFind:=False:C215
End if 
USE NAMED SELECTION:C332("PA")
CLEAR NAMED SELECTION:C333("PA")
ERR_MethodTrackerReturn("Purchases_Alloc"; $_t_oldMethodName)
