//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      PurchOrd FrmILP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/03/2010 10:14
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>POShowDisc; <>POTheirCode)
	C_REAL:C285(vAmount; vPrice; vQuantity; vRate)
	C_TEXT:C284($_t_oldMethodName; vDesc; vInvNoT; vProdCode; vProdName; VprodShortCode; vQtyT)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PurchOrd FrmILP")
BEEP:C151
vProdCode:=[PURCHASE_ORDERS_ITEMS:169]Product_Code:1
vProdName:=[PURCHASE_ORDERS_ITEMS:169]Product_Name:2
VprodShortCode:=""
If ((<>POShowDisc) & ([PURCHASE_ORDERS_ITEMS:169]Discount:10#0))
	vProdName:=vProdName+" @ "+String:C10([PURCHASE_ORDERS_ITEMS:169]Discount:10)+"% Discount"
End if 
If (<>POTheirCode)
	RELATE ONE:C42([PURCHASE_ORDERS_ITEMS:169]Product_Code:1)
	QUERY:C277([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Product_Code:8=[PRODUCTS:9]Product_Code:1)
	QUERY SELECTION:C341([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Company_Code:1=[PURCHASE_ORDERS:57]Company_Code:1)
	If ((Records in selection:C76([PRODUCTS_SUPPLIERS:148])>0) & ([PRODUCTS_SUPPLIERS:148]Supplier_Product_Code:4#""))
		vProdName:=vProdName+"  ("+[PRODUCTS_SUPPLIERS:148]Supplier_Product_Code:4+")"
		VprodShortCode:=[PRODUCTS:9]Short_Code:19
	Else 
		If (Records in selection:C76([PRODUCTS_SUPPLIERS:148])>0)
			VprodShortCode:=[PRODUCTS:9]Short_Code:19
		End if 
	End if 
End if 
vPrice:=[PURCHASE_ORDERS_ITEMS:169]Cost_Price:4
vQuantity:=[PURCHASE_ORDERS_ITEMS:169]Quantity:3
vQtyT:=String:C10([PURCHASE_ORDERS_ITEMS:169]Quantity:3)

vDesc:=vProdName
vAmount:=[PURCHASE_ORDERS_ITEMS:169]Cost_Amount:5
RELATE ONE:C42([PURCHASE_ORDERS_ITEMS:169]Tax_Code:7)
vRate:=[TAX_CODES:35]Tax_Rate:3
If ([PURCHASE_ORDERS_ITEMS:169]Price_Per:12=0)
	vInvNoT:="1"
Else 
	vInvNoT:=String:C10([PURCHASE_ORDERS_ITEMS:169]Price_Per:12)
End if 
//vDesc:="HELLO"
ERR_MethodTrackerReturn("PurchOrd FrmILP"; $_t_oldMethodName)