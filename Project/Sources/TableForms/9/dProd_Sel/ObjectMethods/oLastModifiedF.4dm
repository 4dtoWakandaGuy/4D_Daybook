If (False:C215)
	//object Name: [PRODUCTS]dProd_Sel.oLastModifiedF
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/01/2013 21:28
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRODUCTS].dProd_Sel.oLastModifiedF"; Form event code:C388)
ERR_MethodTrackerReturn("OBJ [PRODUCTS].dProd_Sel.oLastModifiedF"; $_t_oldMethodName)