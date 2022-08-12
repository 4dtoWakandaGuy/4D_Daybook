If (False:C215)
	//object Method Name: Object Name:      [xCreditCardDetails].CARD_IN.oCCM_CardClass_POPUP
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
	//ARRAY LONGINT(CCM_al_CardClasses;0)
	//ARRAY TEXT(CCM_at_CardClasses;0)
	C_LONGINT:C283($_l_Event)
	C_TEXT:C284($_t_oldMethodName; CCM_t_CardClass)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [xCreditCardDetails].CARD_IN.oCCM_CardClass_POPUP"; Form event code:C388)
$_l_Event:=Form event code:C388
Case of 
	: ($_l_Event=On Clicked:K2:4)
		If (CCM_at_CardClasses>0)
			[xCreditCardDetails:132]CardClass:3:=CCM_al_CardClasses{CCM_at_CardClasses}
			CCM_t_CardClass:=CCM_at_CardClasses{CCM_at_CardClasses}
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ [xCreditCardDetails].CARD_IN.oCCM_CardClass_POPUP"; $_t_oldMethodName)
