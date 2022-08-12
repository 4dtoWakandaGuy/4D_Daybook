If (False:C215)
	//object Name: [xCreditCardDetails]CARD IN.oButtonAccept
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
	C_BOOLEAN:C305(CCM_bo_SaveCardDetails)
	C_TEXT:C284($_t_oldMethodName; CCM_T_CardNumber; CCM_t_CardType; CCM_t_EndDate; CCM_T_NameOnCard)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [xCreditCardDetails].CARD_IN.oButtonAccept"; Form event code:C388)
If (CCM_T_CardNumber#"")
	If (CCM_t_EndDate#"")
		If (CCM_T_NameOnCard#"")
			If (CCM_t_CardType#"")
				CCM_bo_SaveCardDetails:=True:C214
				ACCEPT:C269
			Else 
				Gen_Alert("You must enter the credit provider(Card Type)")
				
			End if 
		Else 
			Gen_Alert("You must enter the name on the card")
		End if 
	Else 
		Gen_Alert("You must enter an expiry date for this card")
	End if 
	
Else 
	Gen_Alert("You must enter a card number before saving")
End if 
ERR_MethodTrackerReturn("OBJ [xCreditCardDetails].CARD_IN.oButtonAccept"; $_t_oldMethodName)
