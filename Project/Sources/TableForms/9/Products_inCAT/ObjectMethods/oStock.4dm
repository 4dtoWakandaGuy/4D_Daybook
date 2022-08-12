If (False:C215)
	//object Name: [PRODUCTS]Products_inCAT.oStock
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:08
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

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRODUCTS].Products_inCAT.oStock"; Form event code:C388)
ERR_MethodTrackerReturn("OBJ [PRODUCTS].Products_inCAT.oStock"; $_t_oldMethodName)