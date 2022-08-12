If (False:C215)
	//object Method Name: Object Name:      [xCreditCardDetails].CARD_IN.Field2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Event)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [xCreditCardDetails].CARD_IN.Field2"; Form event code:C388)
$_l_Event:=Form event code:C388

Case of 
	: ($_l_Event=On After Keystroke:K2:26)
		
	: ($_l_Event=On Losing Focus:K2:8) | ($_l_Event=On Data Change:K2:15)
		
		
End case 
ERR_MethodTrackerReturn("OBJ [xCreditCardDetails].CARD_IN.Field2"; $_t_oldMethodName)
