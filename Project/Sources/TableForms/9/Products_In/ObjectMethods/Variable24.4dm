If (False:C215)
	//object Name: [PRODUCTS]Products_In.Variable24
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRODUCTS].Products_In.Variable24"; Form event code:C388)
Gen_ExportButtU(->[PRODUCTS:9]Export:22)
ERR_MethodTrackerReturn("OBJ [PRODUCTS].Products_In.Variable24"; $_t_oldMethodName)