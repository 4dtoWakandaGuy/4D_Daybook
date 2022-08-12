If (False:C215)
	//object Method Name: Object Name:      [xCreditCardDetails].CARD_IN.oCardOwnerShip2
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
	//ARRAY LONGINT(CCM_al_CardOwnerClasses;0)
	//ARRAY TEXT(CCM_at_CardOwnerClasses;0)
	C_LONGINT:C283($_l_Event; CCM_Rb_CompanyCard; CCM_Rb_PersonalCard)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [xCreditCardDetails].CARD_IN.oCardOwnerShip2"; Form event code:C388)
$_l_Event:=Form event code:C388
Case of 
	: ($_l_Event=On Clicked:K2:4)
		If (CCM_Rb_PersonalCard=0)
			[xCreditCardDetails:132]CardHolderClass:2:=CCM_al_CardOwnerClasses{Find in array:C230(CCM_at_CardOwnerClasses; "Company")}
			
			CCM_Rb_CompanyCard:=1
			
		Else 
			[xCreditCardDetails:132]CardHolderClass:2:=CCM_al_CardOwnerClasses{Find in array:C230(CCM_at_CardOwnerClasses; "Personal")}
			CCM_Rb_CompanyCard:=0
			
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [xCreditCardDetails].CARD_IN.oCardOwnerShip2"; $_t_oldMethodName)
