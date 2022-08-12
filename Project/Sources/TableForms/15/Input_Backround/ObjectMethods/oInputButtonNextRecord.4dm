If (False:C215)
	//object Name: [USER]Input_Backround.Invisible Button7
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/08/2012 14:44
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].Input_Backround.Invisible Button7"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		$_ptr_PalletButton:=Self:C308
		RESOLVE POINTER:C394($_ptr_PalletButton; PAL_BUTTON; $_l_TableNumber; $_l_FieldNumber)
		PAL_BUTTON:=PAL_BUTTON+"8"
		ERR_MethodTrackerReturn("OBJ [USER].Input_Backround.Invisible Button7"; $_t_oldMethodName)
End case 
