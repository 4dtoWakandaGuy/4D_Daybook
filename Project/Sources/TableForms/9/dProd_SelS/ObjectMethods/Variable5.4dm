If (False:C215)
	//object Name: [PRODUCTS]dProd_SelS.Variable5
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
	C_BOOLEAN:C305(WS_bo_InsearchScreen)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRODUCTS].dProd_SelS.Variable5"; Form event code:C388)
WS_bo_InsearchScreen:=False:C215
ERR_MethodTrackerReturn("OBJ [PRODUCTS].dProd_SelS.Variable5"; $_t_oldMethodName)