If (False:C215)
	//object Name: [COMPANIES]WS_Buttons.Invisible Button18
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_event; $_l_FieldNumber; $_l_TableNumber)
	C_POINTER:C301($_ptr_PalletButton)
	C_TEXT:C284($_t_oldMethodName; PAL_BUTTON)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].WS_Buttons.Invisible Button18"; Form event code:C388)
$_ptr_PalletButton:=Self:C308
RESOLVE POINTER:C394($_ptr_PalletButton; PAL_BUTTON; $_l_TableNumber; $_l_FieldNumber)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Long Click:K2:37)
		BEEP:C151
	Else 
End case 
ERR_MethodTrackerReturn("OBJ [COMPANIES].WS_Buttons.Invisible Button18"; $_t_oldMethodName)