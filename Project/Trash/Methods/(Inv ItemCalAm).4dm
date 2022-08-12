//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Inv ItemCalAm
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/09/2009 10:13
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

$_t_oldMethodName:=ERR_MethodTracker("Inv ItemCalAm")
If ([INVOICES_ITEMS:161]Price_Per:16=0)
	[INVOICES_ITEMS:161]Price_Per:16:=1
End if 
[INVOICES_ITEMS:161]Amount:5:=Gen_Round((([INVOICES_ITEMS:161]Quantity:3/[INVOICES_ITEMS:161]Price_Per:16)*[INVOICES_ITEMS:161]Sales_Price:4); 2; 2)
ERR_MethodTrackerReturn("Inv ItemCalAm"; $_t_oldMethodName)