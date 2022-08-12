If (False:C215)
	//object Name: [USER]CC_CreditCardProcessor.oLbCreditCards
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 03/03/2012 01:02
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(CCM_al_CardRecordIDs;0)
	//ARRAY TEXT(CCM_at_AVSFailCodes;0)
	//ARRAY TEXT(CCM_at_CardIssuers;0)
	//ARRAY TEXT(CCM_at_CardNumbers;0)
	//ARRAY TEXT(CCM_at_CardOwnerName;0)
	//ARRAY TEXT(CCM_at_CardTypes;0)
	C_LONGINT:C283($_l_Column; $_l_event; $_l_Row; CCM_l_cardIDtoAuth; CCM_l_SelectedCardID)
	C_TEXT:C284($_t_oldMethodName; CC_t_AuthCode; CC_T_CardNumber; CC_T_NameonCard; CCM_t_CardIssuer; CCM_t_CardType; CCM_T_Warning)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].CC_CreditCardProcessor.oLbCreditCards"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Clicked:K2:4)
		LISTBOX GET CELL POSITION:C971(*; "oLbCreditCards"; $_l_Column; $_l_Row)
		
		If (CC_t_AuthCode="")
			CCM_l_SelectedCardID:=CCM_al_CardRecordIDs{$_l_Row}
			
			//there is nothing to save on this form..just load the card infor to the variables
			CCM_t_CardType:=CCM_at_CardTypes{$_l_Row}
			CCM_t_CardIssuer:=CCM_at_CardIssuers{$_l_Row}
			CC_T_NameonCard:=CCM_at_CardOwnerName{$_l_Row}
			CC_T_CardNumber:=CCM_at_CardNumbers{$_l_Row}
			CCM_l_cardIDtoAuth:=CCM_al_CardRecordIDs{$_l_Row}
			If (CCM_at_AVSFailCodes{$_l_Row}#"")
				If (CCM_at_AVSFailCodes{$_l_Row}[[1]]="-")
					CCM_T_Warning:="There was an address verification problem with this address the "+Substring:C12(CCM_at_AVSFailCodes{$_l_Row}; 2; Length:C16(CCM_at_AVSFailCodes{$_l_Row}))+", you should try to correct this"
				Else 
					CCM_T_Warning:="There was an address verification problem with this address the "+CCM_at_AVSFailCodes{$_l_Row}+", you should try to correct this"
				End if 
			Else 
				CCM_T_Warning:=""
			End if 
			
		Else 
			Gen_Alert("Authorization has already been obtained, you cannot swap card to use!")
			
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [USER].CC_CreditCardProcessor.oLbCreditCards"; $_t_oldMethodName)
