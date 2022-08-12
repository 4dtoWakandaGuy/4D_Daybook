If (False:C215)
	//object Name: [ORDER_ITEMS]BUILD_PRODUCT.oButtonCancel1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/12/2010 06:37
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(OI_bo_ProductEnter)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDER_ITEMS]BUILD_PRODUCT.oButtonCancel1"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		Gen_Confirm("Are you sure you wish to cancel entering this product?"; "No"; "Yes")
		If (OK=0)
			OI_bo_ProductEnter:=False:C215
			CANCEL:C270
		End if 
		OK:=1
End case 
ERR_MethodTrackerReturn("OBJ [ORDER_ITEMS].BUILD_PRODUCT.oButtonCancel1"; $_t_oldMethodName)
