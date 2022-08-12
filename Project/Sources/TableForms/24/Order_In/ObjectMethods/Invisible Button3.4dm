
If (False:C215)
	//Form Name:      ORDERS.Orders_In.Invisible Button3
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  13/12/2019
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_FieldNumber; $_l_TableNumber)
	C_POINTER:C301($_ptr_PalletButton)
	C_TEXT:C284($_t_oldMethodName; PAL_BUTTON)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ:WS_Buttons,PAL_BUTTON_4"; Form event code:C388)
$_ptr_PalletButton:=Self:C308
RESOLVE POINTER:C394($_ptr_PalletButton; PAL_BUTTON; $_l_TableNumber; $_l_FieldNumber)
ERR_MethodTrackerReturn("OBJ:WS_Buttons,PAL_BUTTON_4"; $_t_oldMethodName)