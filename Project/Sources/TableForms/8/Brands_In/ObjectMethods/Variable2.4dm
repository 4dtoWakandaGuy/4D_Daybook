If (False:C215)
	//object Name: [PRODUCT_BRANDS]Brands_In.Variable2
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRODUCT_BRANDS].Brands_In.Variable2"; Form event code:C388)
Gen_ExportButt(->[PRODUCT_BRANDS:8]Export:3)
ERR_MethodTrackerReturn("OBJ [PRODUCT_BRANDS].Brands_In.Variable2"; $_t_oldMethodName)