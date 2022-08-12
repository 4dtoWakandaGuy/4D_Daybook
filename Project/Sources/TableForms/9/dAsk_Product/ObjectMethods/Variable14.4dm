If (False:C215)
	//object Name: [PRODUCTS]dAsk Product.Variable14
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
	//ARRAY TEXT(GEN_at_Identity;0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRODUCTS].dAsk Product.Variable14"; Form event code:C388)
MESSAGES OFF:C175
QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=GEN_at_Identity{GEN_at_Identity})
MESSAGES ON:C181
ERR_MethodTrackerReturn("OBJ [PRODUCTS].dAsk Product.Variable14"; $_t_oldMethodName)