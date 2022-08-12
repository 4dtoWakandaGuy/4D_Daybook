If (False:C215)
	//object Name: [PRODUCTS]dAsk Product.Variable12
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
	//ARRAY BOOLEAN(PROD_lb_Products;0)
	//ARRAY TEXT(GEN_at_Identity;0)
	//ARRAY TEXT(GEN_at_Name;0)
	//ARRAY TEXT(GEN_at_RecordCode;0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRODUCTS].dAsk Product.Variable12"; Form event code:C388)
If (GEN_at_Identity>1)
	GEN_at_Identity:=GEN_at_Identity-1
	GEN_at_Name:=GEN_at_Name-1
	GEN_at_RecordCode:=GEN_at_RecordCode-1
	LISTBOX SELECT ROW:C912(PROD_lb_Products; GEN_at_Identity)
	LB_SetScroll(->PROD_lb_Products; GEN_at_Identity)
	
End if 
ERR_MethodTrackerReturn("OBJ [PRODUCTS].dAsk Product.Variable12"; $_t_oldMethodName)
