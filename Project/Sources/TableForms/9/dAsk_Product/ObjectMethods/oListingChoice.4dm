If (False:C215)
	//object Name: [PRODUCTS]dAsk Product.oListingChoice
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
	//ARRAY TEXT(PROD_at_DisplayDetail;0)
	C_TEXT:C284($_t_DisplayName; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRODUCTS].dAsk Product.oListingChoice"; Form event code:C388)
If (PROD_at_DisplayDetail=0)
	PROD_at_DisplayDetail:=1
End if 
Products_Arr(PROD_at_DisplayDetail)
$_t_DisplayName:=DB_LoadDisplayPref(Table:C252(->[PRODUCTS:9]); "dAsk_Product"; PROD_at_DisplayDetail{PROD_at_DisplayDetail}; True:C214)


LB_SetColumnHeaders(->PROD_lb_Products; "PROD_L"; 1; "Code"; "Name"; "Short Code"; PROD_at_DisplayDetail{PROD_at_DisplayDetail})
GEN_at_Identity:=1
LISTBOX SELECT ROW:C912(PROD_lb_Products; GEN_at_Identity)
LB_SetScroll(->PROD_lb_Products; GEN_at_Identity)
ERR_MethodTrackerReturn("OBJ:dAsk Product,PROD_at_DisplayDetail"; $_t_oldMethodName)
