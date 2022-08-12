If (False:C215)
	//object Name: [PURCHASE_ORDERS]dPurchOrd_Sel.Variable7
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/07/2012 11:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(WS_bo_InsearchScreen)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PURCHASE_ORDERS].dPurchOrd_Sel.Variable7"; Form event code:C388)
WS_bo_InsearchScreen:=False:C215
ERR_MethodTrackerReturn("OBJ [PURCHASE_ORDERS].dPurchOrd_Sel.Variable7"; $_t_oldMethodName)