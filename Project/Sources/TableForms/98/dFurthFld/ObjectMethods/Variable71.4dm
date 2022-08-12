If (False:C215)
	//object Name: [CUSTOM_FIELDS]dFurthFld.Variable71
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/05/2011 17:19
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

$_t_oldMethodName:=ERR_MethodTracker("OBJ [CUSTOM_FIELDS].dFurthFld.Variable71"; Form event code:C388)
$_ptr_PalletButton:=Self:C308
RESOLVE POINTER:C394($_ptr_PalletButton; PAL_BUTTON; $_l_TableNumber; $_l_FieldNumber)
$_l_event:=Form event code:C388
ERR_MethodTrackerReturn("OBJ [CUSTOM_FIELDS].dFurthFld.Variable71"; $_t_oldMethodName)