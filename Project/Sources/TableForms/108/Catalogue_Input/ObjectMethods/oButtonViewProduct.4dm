If (False:C215)
	//object Name: [CATALOGUE]Catalogue_Input.Button1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/09/2012 09:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(CAT_lb_Products;0)
	//ARRAY LONGINT(CAT_al_CatProductIDS;0)
	C_LONGINT:C283($_l_ProductID; $_l_Row; WS_l_SELECTEDPRODUCT)
	C_TEXT:C284($_t_CurrentOutputform; $_t_oldMethodName; WIN_t_CurrentOutputform)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CATALOGUE].Catalogue_Input.Button1"; Form event code:C388)


//show product detail
$_l_Row:=CAT_lb_Products
//If (WS_l_SelectedProduct>0)
If ($_l_Row>0)
	//$_l_ProductID:=CAT_al_CatProductIDS{WS_l_SelectedProduct}
	$_l_ProductID:=CAT_al_CatProductIDS{$_l_Row}
	
	$_t_CurrentOutputform:=WIN_t_CurrentOutputform
	Products_File
	QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]X_ID:43=$_l_ProductID)
	MODIFY RECORD:C57([PRODUCTS:9]; *)
	WS_AutoscreenSize(2; 400; 700)
	WIN_t_CurrentOutputform:=$_t_CurrentOutputform
	
End if 
ERR_MethodTrackerReturn("OBJ [CATALOGUE].Catalogue_Input.Button1"; $_t_oldMethodName)
