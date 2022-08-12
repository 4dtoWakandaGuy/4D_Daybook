If (False:C215)
	//object Name: [PRODUCTS]Product List.Field4
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
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRODUCTS].Product List.Field4"; Form event code:C388)
RELATE ONE:C42([PRODUCTS:9]Brand_Code:4)
ERR_MethodTrackerReturn("OBJ [PRODUCTS].Product List.Field4"; $_t_oldMethodName)