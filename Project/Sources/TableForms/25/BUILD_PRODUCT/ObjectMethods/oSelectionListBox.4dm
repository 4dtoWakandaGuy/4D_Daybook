If (False:C215)
	//object Name: [ORDER_ITEMS]BUILD_PRODUCT.oSelectionListBox
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:30
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(OI_lb_SelectProduct;0)
	C_LONGINT:C283($_l_Column; $_l_event; $_l_Row)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDER_ITEMS].BUILD_PRODUCT.oSelectionListBox"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Data Change:K2:15)
		
		LISTBOX GET CELL POSITION:C971(OI_lb_SelectProduct; $_l_Column; $_l_Row)
		If ($_l_Row>0)
			PRD_BuildFormSelectProduct($_l_Row; $_l_Column)
			
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [ORDER_ITEMS].BUILD_PRODUCT.oSelectionListBox"; $_t_oldMethodName)
