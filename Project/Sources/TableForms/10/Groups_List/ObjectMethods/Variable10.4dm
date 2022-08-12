If (False:C215)
	//object Name: [PRODUCT_GROUPS]Groups List.Variable10
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
	C_TEXT:C284($_t_oldMethodName; vPPage)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRODUCT_GROUPS].Groups List.Variable10"; Form event code:C388)
vPPage:="Page "+String:C10(Printing page:C275)
ERR_MethodTrackerReturn("OBJ [PRODUCT_GROUPS].Groups List.Variable10"; $_t_oldMethodName)