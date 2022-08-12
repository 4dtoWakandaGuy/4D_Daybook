If (False:C215)
	//object Name: [PRODUCTS]Products_SimplifiedEntry.Field20
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
	//ARRAY TEXT(Prod_at_SupplierOption;0)
	C_LONGINT:C283(Prod_l_ListedOnly)
	C_TEXT:C284($_t_oldMethodName; PROD_t_SupplierOption)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRODUCTS].Products_SimplifiedEntry.Field20"; Form event code:C388)
If ([PRODUCTS:9]Price_Updates:25)
	OBJECT SET VISIBLE:C603(PROD_t_SupplierOption; True:C214)
	OBJECT SET VISIBLE:C603(Prod_at_SupplierOption; True:C214)
	OBJECT SET VISIBLE:C603(Prod_l_ListedOnly; True:C214)
Else 
	[PRODUCTS:9]x_Supplier_Update_Option:47:=0
	OBJECT SET VISIBLE:C603(PROD_t_SupplierOption; False:C215)
	OBJECT SET VISIBLE:C603(Prod_at_SupplierOption; False:C215)
	OBJECT SET VISIBLE:C603(Prod_l_ListedOnly; False:C215)
	
End if 
ERR_MethodTrackerReturn("OBJ [PRODUCTS].Products_SimplifiedEntry.Field20"; $_t_oldMethodName)
