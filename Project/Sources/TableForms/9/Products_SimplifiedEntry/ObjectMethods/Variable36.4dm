If (False:C215)
	//object Name: [PRODUCTS]Products_SimplifiedEntry.Variable36
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
	//ARRAY TEXT(PROD_at_SupplierOption;0)
	C_LONGINT:C283($_l_Setting; Prod_l_listedonly)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRODUCTS].Products_SimplifiedEntry.Variable36"; Form event code:C388)
If (Prod_l_listedonly=1)
	$_l_Setting:=0
	[PRODUCTS:9]x_Supplier_Update_Option:47:=$_l_Setting ?+ PROD_at_SupplierOption
	[PRODUCTS:9]x_Supplier_Update_Option:47:=[PRODUCTS:9]x_Supplier_Update_Option:47 ?+ 4
Else 
	$_l_Setting:=0
	[PRODUCTS:9]x_Supplier_Update_Option:47:=$_l_Setting ?+ PROD_at_SupplierOption
End if 
ERR_MethodTrackerReturn("OBJ [PRODUCTS].Products_SimplifiedEntry.Variable36"; $_t_oldMethodName)
