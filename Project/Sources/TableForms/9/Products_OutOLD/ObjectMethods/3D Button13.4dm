If (False:C215)
	//object Name: [PRODUCTS]Products_Out.3D Button13
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRODUCTS].Products_Out.3D Button13"; Form event code:C388)
WT_SORT_TABLE_3(->[PRODUCTS:9]; "Text3"; ->[PRODUCTS:9]Product_Name:2)
ERR_MethodTrackerReturn("OBJ [PRODUCTS].Products_Out.3D Button13"; $_t_oldMethodName)