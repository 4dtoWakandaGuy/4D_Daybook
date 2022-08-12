If (False:C215)
	//object Name: [COMPANIES]dRequest.oComboBoxStringValues
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
	//ARRAY TEXT(GEN_at_ComboBoxValues;0)
	C_LONGINT:C283($_l_event; $_l_SelectedRow)
	C_TEXT:C284($_t_oldMethodName; VT)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dRequest.oComboBoxStringValues"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Data Change:K2:15)
		BEEP:C151
		$_l_SelectedRow:=Find in array:C230(GEN_at_ComboBoxValues; GEN_at_ComboBoxValues{0})
		If ($_l_SelectedRow<0)
			GEN_at_ComboBoxValues{0}:=""
		End if 
		VT:=GEN_at_ComboBoxValues{0}
	: ($_l_event=On Clicked:K2:4)
		VT:=GEN_at_ComboBoxValues{0}
End case 
ERR_MethodTrackerReturn("OBJ [COMPANIES].dRequest.oComboBoxStringValues"; $_t_oldMethodName)
