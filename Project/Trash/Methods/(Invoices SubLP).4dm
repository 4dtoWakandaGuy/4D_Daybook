//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Invoices SubLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/09/2009 06:58
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

$_t_oldMethodName:=ERR_MethodTracker("Invoices SubLP")
//Invoice Items Sub
Case of 
	: (Modified:C32([INVOICES_ITEMS:161]Product_Code:1))
		InvItems_InLPX(->[INVOICES_ITEMS:161]Product_Code:1)
	: (Modified:C32([INVOICES_ITEMS:161]Product_Name:2))
		InvItems_InLPX(->[INVOICES_ITEMS:161]Product_Name:2)
	: (Modified:C32([INVOICES_ITEMS:161]Description:13))
		InvItems_InLPX(->[INVOICES_ITEMS:161]Description:13)
	: (Modified:C32([INVOICES_ITEMS:161]Print_Description:14))
		InvItems_InLPX(->[INVOICES_ITEMS:161]Print_Description:14)
	: (Modified:C32([INVOICES_ITEMS:161]Quantity:3))
		InvItems_InLPX(->[INVOICES_ITEMS:161]Quantity:3)
	: (Modified:C32([INVOICES_ITEMS:161]Price_Per:16))
		InvItems_InLPX(->[INVOICES_ITEMS:161]Price_Per:16)
	: (Modified:C32([INVOICES_ITEMS:161]Sales_Price:4))
		InvItems_InLPX(->[INVOICES_ITEMS:161]Sales_Price:4)
	: (Modified:C32([INVOICES_ITEMS:161]Amount:5))
		InvItems_InLPX(->[INVOICES_ITEMS:161]Amount:5)
	: (Modified:C32([INVOICES_ITEMS:161]Tax_Code:6))
		InvItems_InLPX(->[INVOICES_ITEMS:161]Tax_Code:6)
	: (Modified:C32([INVOICES_ITEMS:161]Tax_Amount:7))
		InvItems_InLPX(->[INVOICES_ITEMS:161]Tax_Amount:7)
	: (Modified:C32([INVOICES_ITEMS:161]Total_Amount:8))
		InvItems_InLPX(->[INVOICES_ITEMS:161]Total_Amount:8)
	: (Modified:C32([INVOICES_ITEMS:161]Sales_Account:9))
		InvItems_InLPX(->[INVOICES_ITEMS:161]Sales_Account:9)
	: (Modified:C32([INVOICES_ITEMS:161]Analysis_Code:10))
		InvItems_InLPX(->[INVOICES_ITEMS:161]Analysis_Code:10)
End case 
ERR_MethodTrackerReturn("Invoices SubLP"; $_t_oldMethodName)