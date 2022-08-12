//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Purch PPrint
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/09/2009 20:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(PI_bo_Addingitem)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Purch PPrint")
Menu_Record("Purch PPrint"; "Print")
If (Modified record:C314([PURCHASE_INVOICES:37]))
	DB_SaveRecord(->[PURCHASE_INVOICES:37])
End if 
If (PI_bo_Addingitem)
	DB_SaveRecord(->[PURCHASE_INVOICE_ITEMS:158])
End if 
PI_bo_Addingitem:=False:C215
If ([PURCHASE_INVOICES:37]Purchase_Code:1="*@")
	FORM SET OUTPUT:C54([PURCHASE_INVOICES:37]; "Remittance")
Else 
	FORM SET OUTPUT:C54([PURCHASE_INVOICES:37]; "Form")
End if 
PRINT RECORD:C71([PURCHASE_INVOICES:37])
FORM SET OUTPUT:C54([PURCHASE_INVOICES:37]; "Purchases Out")
ERR_MethodTrackerReturn("Purch PPrint"; $_t_oldMethodName)