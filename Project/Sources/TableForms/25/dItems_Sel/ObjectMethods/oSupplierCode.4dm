If (False:C215)
	//object Name: [ORDER_ITEMS]dItems_Sel.oSupplierCode
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
	C_TEXT:C284($_t_oldMethodName; vProbCode)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDER_ITEMS].dItems_Sel.oSupplierCode"; Form event code:C388)
Sel_LPCompCode(->vProbCode; ->[ORDER_ITEMS:25])
ERR_MethodTrackerReturn("OBJ [ORDER_ITEMS].dItems_Sel.oSupplierCode"; $_t_oldMethodName)