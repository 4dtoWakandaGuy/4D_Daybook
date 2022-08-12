If (False:C215)
	//object Name: [PRODUCTS]dProd_Sel.oSupplierCode
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
	C_TEXT:C284($_t_oldMethodName; vsupplier)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRODUCTS].dProd_Sel.oSupplierCode"; Form event code:C388)
Sel_LPCompCode(->vsupplier; ->[PRODUCTS:9])
ERR_MethodTrackerReturn("OBJ [PRODUCTS].dProd_Sel.oSupplierCode"; $_t_oldMethodName)