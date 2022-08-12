If (False:C215)
	//object Method Name: Object Name:      CONFIG_SETUP.Variable71
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 03/03/2012 01:32
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Event; $_l_FieldNumber; $_l_TableNumber)
	C_POINTER:C301($_ptr_PalletButton)
	C_TEXT:C284($_t_oldMethodName; PAL_BUTTON)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ CONFIG_SETUP.Variable71")

$_t_oldMethodName:=ERR_MethodTracker("OBJ CONFIG_SETUP.Variable71"; Form event code:C388)
$_ptr_PalletButton:=Self:C308
RESOLVE POINTER:C394($_ptr_PalletButton; PAL_BUTTON; $_l_TableNumber; $_l_FieldNumber)
$_l_Event:=Form event code:C388
Case of 
	: ($_l_Event=On Long Click:K2:37)
		BEEP:C151
		
		
		
End case 
ERR_MethodTrackerReturn("OBJ CONFIG_SETUP.Variable71"; $_t_oldMethodName)
