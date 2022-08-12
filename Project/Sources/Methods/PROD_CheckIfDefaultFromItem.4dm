//%attributes = {}
If (False:C215)
	//Project Method Name:      PROD_CheckIfDefaultFromItem
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2012 16:08
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(PROD_bo_GetValuesFromItem)
	C_POINTER:C301($1; PROD_P_ItemProdCodeField)
	C_TEXT:C284($_t_ConfirmMessage; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PROD_CheckIfDefaultFromItem")

//PROD_CheckIfDefaultFromItem
//Added 03/09/08 -kmw
//
//Asks user if they want to use values from the current line item in the product
//Sets PROD_bo_GetValuesFromItem to true if they say yes
//
PROD_P_ItemProdCodeField:=$1


OK:=0
Case of 
	: (Field:C253(PROD_P_ItemProdCodeField)=Field:C253(->[ORDER_ITEMS:25]Product_Code:2))
		If ([ORDER_ITEMS:25]Product_Name:13#"") | ([ORDER_ITEMS:25]Description:44#"") | (([ORDER_ITEMS:25]Tax_Code:12#DB_GetLedgerDefaultSalesTax) & ([ORDER_ITEMS:25]Tax_Code:12#[COMPANIES:2]Default_TAX:41)) | ([ORDER_ITEMS:25]Price_Per:50>1) | ([ORDER_ITEMS:25]Sales_Price:4#0) | ([ORDER_ITEMS:25]Retail_Price:38#0) | ([ORDER_ITEMS:25]Standard_Price:39#0)
			$_t_ConfirmMessage:="Base Product details on Sales Order Item details?"
			If ([ORDER_ITEMS:25]Product_Name:13#"")
				$_t_ConfirmMessage:=$_t_ConfirmMessage+" ("+[ORDER_ITEMS:25]Product_Name:13+")"
			End if 
			Gen_Confirm($_t_ConfirmMessage)
		Else 
			OK:=0
		End if 
	: (Field:C253(PROD_P_ItemProdCodeField)=Field:C253(->[PURCHASE_ORDERS_ITEMS:169]Product_Code:1))
		If ([PURCHASE_ORDERS_ITEMS:169]Product_Name:2#"") | ([PURCHASE_ORDERS_ITEMS:169]Description:13#"") | (([PURCHASE_ORDERS_ITEMS:169]Tax_Code:7#DB_GetLedgerDefaultSalesTax) & ([PURCHASE_ORDERS_ITEMS:169]Tax_Code:7#[COMPANIES:2]Default_TAX:41)) | ([PURCHASE_ORDERS_ITEMS:169]Price_Per:12>1) | ([PURCHASE_ORDERS_ITEMS:169]Original_Cost:11#0) | ([PURCHASE_ORDERS_ITEMS:169]Cost_Price:4#0)
			$_t_ConfirmMessage:="Base Product details on Purchase Order Item details?"
			If ([PURCHASE_ORDERS_ITEMS:169]Product_Name:2#"")
				$_t_ConfirmMessage:=$_t_ConfirmMessage+" ("+[PURCHASE_ORDERS_ITEMS:169]Product_Name:2+")"
			End if 
			Gen_Confirm("Base new Product on details from Purchase Order Item? ("+[PURCHASE_ORDERS_ITEMS:169]Product_Name:2+")")
		Else 
			OK:=0
		End if 
	Else 
		OK:=0
End case 
If (OK=1)
	PROD_bo_GetValuesFromItem:=True:C214
Else 
	PROD_bo_GetValuesFromItem:=False:C215
End if 
ERR_MethodTrackerReturn("PROD_CheckIfDefaultFromItem"; $_t_oldMethodName)
