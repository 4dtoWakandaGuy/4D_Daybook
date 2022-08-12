If (False:C215)
	//object Name: [PRODUCTS]dProd_Sel.oBrandCode
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(cNAL)
	C_TEXT:C284($_t_oldMethodName; vBrand)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRODUCTS].dProd_Sel.oBrandCode"; Form event code:C388)
If (cNAL=0)
	Check_MinorNC(->vBrand; ""; ->[PRODUCT_BRANDS:8]; ->[PRODUCT_BRANDS:8]Brand_Code:1; ->[PRODUCT_BRANDS:8]Brand_Name:2; "Brand")
End if 
ERR_MethodTrackerReturn("OBJ [PRODUCTS].dProd_Sel.oBrandCode"; $_t_oldMethodName)
