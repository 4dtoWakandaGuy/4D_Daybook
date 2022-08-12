If (False:C215)
	//object Name: [PURCHASE_ORDERS]dPurchOrd_Sel.oSupplierCode
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; vCompCode)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PURCHASE_ORDERS].dPurchOrd_Sel.oSupplierCode"; Form event code:C388)
Sel_LPCompCode(->vCompCode; ->[PURCHASE_ORDERS:57])
ERR_MethodTrackerReturn("OBJ [PURCHASE_ORDERS].dPurchOrd_Sel.oSupplierCode"; $_t_oldMethodName)