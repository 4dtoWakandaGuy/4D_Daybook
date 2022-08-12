If (False:C215)
	//object Name: [COMPANIES]WS_Buttons.Variable29
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
	//ARRAY TEXT(WS_at_BUTTON32POPUP;0)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName; PAL_BUTTON)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].WS_Buttons.Variable29"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (WS_at_BUTTON32POPUP>0)
			PAL_BUTTON:=String:C10(WS_at_BUTTON32POPUP+31)
		End if 
		WS_at_BUTTON32POPUP:=0
		
		
End case 
ERR_MethodTrackerReturn("OBJ [COMPANIES].WS_Buttons.Variable29"; $_t_oldMethodName)
