If (False:C215)
	//object Name: [ACCOUNTS]Accounts_in.Invisible Button6
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:32
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(PAL_bo_BUtton3disabled; PAL_bo_BUtton5disabled)
	C_LONGINT:C283($_l_FieldNumber; $_l_TableNumber; PAL_BUTTON_5)
	C_POINTER:C301($_ptr_PalletButton)
	C_TEXT:C284($_t_oldMethodName; PAL_BUTTON)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ACCOUNTS].Accounts_in.Invisible Button6"; Form event code:C388)

If (PAL_bo_BUtton3disabled)  //Button 3 was requested to be disabled..but we are in an view that would have the remove button displayed.
	//in this case we have displayed and enabled button 3..but it must think it is button 5
	$_ptr_PalletButton:=->PAL_BUTTON_5
	RESOLVE POINTER:C394($_ptr_PalletButton; PAL_BUTTON; $_l_TableNumber; $_l_FieldNumber)
Else 
	$_ptr_PalletButton:=Self:C308
	RESOLVE POINTER:C394($_ptr_PalletButton; PAL_BUTTON; $_l_TableNumber; $_l_FieldNumber)
End if 
ERR_MethodTrackerReturn("OBJ [ACCOUNTS].Accounts_in.Invisible Button6"; $_t_oldMethodName)
