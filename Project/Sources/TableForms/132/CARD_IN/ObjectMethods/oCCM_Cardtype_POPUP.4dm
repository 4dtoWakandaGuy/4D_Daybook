If (False:C215)
	//object Method Name: Object Name:      [xCreditCardDetails].CARD_IN.oCCM_Cardtype_POPUP
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
	//ARRAY LONGINT(CCM_al_CardTypes;0)
	//ARRAY TEXT(CCM_at_CARDTYPES;0)
	C_LONGINT:C283($_l_AddedItemID; $_l_Event; $_l_ListID)
	C_TEXT:C284($_t_oldMethodName; CCM_t_CardType)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [xCreditCardDetails].CARD_IN.oCCM_Cardtype_POPUP"; Form event code:C388)
$_l_Event:=Form event code:C388
Case of 
	: ($_l_Event=On Clicked:K2:4)
		If (CCM_at_CARDTYPES>0)
			If (CCM_al_CardTypes{CCM_at_CARDTYPES}>0)
				
				[xCreditCardDetails:132]Card_TypeNUM:4:=CCM_al_CardTypes{CCM_at_CARDTYPES}
				[xCreditCardDetails:132]Card_TypeName:5:=CCM_at_CARDTYPES{CCM_at_CARDTYPES}
				CCM_t_CardType:=[xCreditCardDetails:132]Card_TypeName:5
			Else 
				$_l_AddedItemID:=AA_ListAddItem(->[xCreditCardDetails:132]Card_TypeNUM:4)
				$_l_ListID:=AA_LoadList(->[xCreditCardDetails:132]Card_TypeNUM:4; ->CCM_at_CARDTYPES; ->CCM_al_CardTypes; True:C214)
				
			End if 
			
			
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ [xCreditCardDetails].CARD_IN.oCCM_Cardtype_POPUP"; $_t_oldMethodName)
