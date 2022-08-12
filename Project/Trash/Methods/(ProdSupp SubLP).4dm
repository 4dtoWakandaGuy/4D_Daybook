//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      ProdSupp SubLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/09/2012 16:14
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(vMod2)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ProdSupp SubLP")
//ProdSupp SubLP
Case of 
	: (Modified:C32([PRODUCTS_SUPPLIERS:148]Company_Code:1))
		Check_Company(->[PRODUCTS_SUPPLIERS:148]Company_Code:1; ->[CONTACTS:1]Contact_Code:2; ->[PRODUCTS:9])
		
		Products_InMod
	: (Modified:C32([PRODUCTS_SUPPLIERS:148]Cost_Price:2))
		If ([PRODUCTS:9]Sales_Price:9=0)
			[PRODUCTS_SUPPLIERS:148]Margin:3:=0
		Else 
			[PRODUCTS_SUPPLIERS:148]Margin:3:=Gen_Round((DivideBy(([PRODUCTS:9]Sales_Price:9-[PRODUCTS_SUPPLIERS:148]Cost_Price:2); [PRODUCTS:9]Sales_Price:9)*100); 2; 1)  // 17/02/04 pb
		End if 
		Products_InMod
		vMod2:=True:C214
	: (Modified:C32([PRODUCTS_SUPPLIERS:148]Standard_Cost:5))
		Products_InMod
		vMod2:=True:C214
	: (Modified:C32([PRODUCTS_SUPPLIERS:148]Margin:3))
		[PRODUCTS_SUPPLIERS:148]Cost_Price:2:=Round:C94(([PRODUCTS:9]Sales_Price:9*((100-[PRODUCTS_SUPPLIERS:148]Margin:3)/100)); 2)
		Products_InMod
		vMod2:=True:C214
	: (Modified:C32([PRODUCTS_SUPPLIERS:148]Supplier_Product_Code:4))
		[PRODUCTS_SUPPLIERS:148]Supplier_Product_Code:4:=Uppercase:C13([PRODUCTS_SUPPLIERS:148]Supplier_Product_Code:4)
		Products_InMod
End case 
ERR_MethodTrackerReturn("ProdSupp SubLP"; $_t_oldMethodName)