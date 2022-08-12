//%attributes = {}
If (False:C215)
	//Project Method Name:      Comp_SelFProd
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/06/2010 18:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_Companies; 0)
	ARRAY TEXT:C222($_at_ProductCodes; 0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Comp_SelFProd")
SELECTION TO ARRAY:C260([PRODUCTS:9]Product_Code:1; $_at_ProductCodes)
QUERY WITH ARRAY:C644([PRODUCTS_SUPPLIERS:148]Product_Code:8; $_at_ProductCodes)
SELECTION TO ARRAY:C260([PRODUCTS_SUPPLIERS:148]Company_Code:1; $_at_Companies)
QUERY WITH ARRAY:C644([COMPANIES:2]Company_Code:1; $_at_Companies)
//Join_SelFastSub (->[PRODUCTS_SUPPLIERS];->[PRODUCTS_SUPPLIERS]Company Code;->[COMPANIES];->[COMPANIES]Company Code;->[PRODUCTS_SUPPLIERS])
//INTERSECTION("Extra";"CMaster";"CMaster")
CREATE SET:C116([COMPANIES:2]; "Master")
ERR_MethodTrackerReturn("Comp_SelFProd"; $_t_oldMethodName)