//%attributes = {}
If (False:C215)
	//Project Method Name:      Purch_InvCalc
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2009 09:22
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_REAL:C285(vSubtotal; vTotal; vVAT)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Purch_InvCalc")
//Purch_InvCalc
QUERY:C277([PURCHASE_INVOICE_ITEMS:158]; [PURCHASE_INVOICE_ITEMS:158]PURCHASE_INVOICE_CODE:17=[PURCHASE_INVOICES:37]Purchase_Code:1)


vSubtotal:=Round:C94((Sum:C1([PURCHASE_INVOICE_ITEMS:158]Cost_Amount:4)); 2)
vVAT:=Round:C94((Sum:C1([PURCHASE_INVOICE_ITEMS:158]Tax_Amount:6)); 2)
vTotal:=Round:C94((Sum:C1([PURCHASE_INVOICE_ITEMS:158]Total_Amount:7)); 2)
ERR_MethodTrackerReturn("Purch_InvCalc"; $_t_oldMethodName)