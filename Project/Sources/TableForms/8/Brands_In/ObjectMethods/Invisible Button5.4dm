If (False:C215)
	//object Name: [PRODUCT_BRANDS]Brands_In.Invisible Button5
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
	C_LONGINT:C283($_l_FieldNumber; $_l_TableNumber)
	C_POINTER:C301($_ptr_PalletButton)
	C_TEXT:C284($_t_oldMethodName; PAL_BUTTON)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRODUCT_BRANDS].Brands_In.Invisible Button5"; Form event code:C388)
$_ptr_PalletButton:=Self:C308
RESOLVE POINTER:C394($_ptr_PalletButton; PAL_BUTTON; $_l_TableNumber; $_l_FieldNumber)
ERR_MethodTrackerReturn("OBJ [PRODUCT_BRANDS].Brands_In.Invisible Button5"; $_t_oldMethodName)