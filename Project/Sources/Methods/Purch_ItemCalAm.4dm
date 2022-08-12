//%attributes = {}
If (False:C215)
	//Project Method Name:      Purch_ItemCalAm
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2009 16:42
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

$_t_oldMethodName:=ERR_MethodTracker("Purch_ItemCalAm")
If ([PURCHASE_INVOICE_ITEMS:158]Price_Per:10=0)
	[PURCHASE_INVOICE_ITEMS:158]Price_Per:10:=1
End if 
[PURCHASE_INVOICE_ITEMS:158]Cost_Amount:4:=Gen_Round((DivideBy([PURCHASE_INVOICE_ITEMS:158]Quantity:2; [PURCHASE_INVOICE_ITEMS:158]Price_Per:10)*[PURCHASE_INVOICE_ITEMS:158]Cost_Price:3); 2; 1)  //17/02/04 pb
ERR_MethodTrackerReturn("Purch_ItemCalAm"; $_t_oldMethodName)