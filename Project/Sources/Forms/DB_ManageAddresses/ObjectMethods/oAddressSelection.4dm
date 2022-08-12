
If (False:C215)
	//Object Name:      DB_ManageAddresses.oAddressSelection
	//------------------ Script Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  20/07/2020
	//Created BY:  Nigel Greenlee
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(CON_at_addresses;0)
	C_LONGINT:C283($_l_Column; $_l_Row)
	C_TEXT:C284(CON_t_SelectedAddress)
End if 
//Code Starts Here
Case of 
	: (Form event code:C388=On Clicked:K2:4)
		LISTBOX GET CELL POSITION:C971(Self:C308->; $_l_Column; $_l_Row)
		If ($_l_Row>0)
			Form:C1466.selectedAddress:=CON_at_addresses{$_l_Row}
			CON_t_SelectedAddress:=CON_at_addresses{$_l_Row}
			OBJECT SET ENABLED:C1123(*; "oButtonDelete"; True:C214)
		Else 
			Form:C1466.selectedAddress:=CON_at_addresses{$_l_Row}
			CON_t_SelectedAddress:=""
			OBJECT SET ENABLED:C1123(*; "oButtonDelete"; False:C215)
		End if 
End case 
