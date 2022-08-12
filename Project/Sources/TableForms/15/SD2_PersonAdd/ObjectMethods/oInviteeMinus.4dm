If (False:C215)
	//object Name: [USER]SD2_PersonAdd.oInviteeMinus
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:25
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD_lb_EventInvites;0)
	C_LONGINT:C283($_l_event; SD2_l_SelectedAdressee)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_PersonAdd.oInviteeMinus"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (SD2_l_SelectedAdressee>0)
			LISTBOX DELETE ROWS:C914(SD_lb_EventInvites; SD2_l_SelectedAdressee)
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [USER].SD2_PersonAdd.oInviteeMinus"; $_t_oldMethodName)
