If (False:C215)
	//object Method Name: Object Name:      [xCreditCardDetails].CARD_IN.Field4
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
	//ARRAY TEXT(CCM_at_CardIssuers;0)
	C_LONGINT:C283($_l_AddedItemID; $_l_CardIssuerRow; $_l_CharacterPosition; $_l_EndHighlight; $_l_Event; $_l_Index; $_l_StartHighlight)
	C_TEXT:C284($_t_EditedText; $_t_Keystroke; $_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [xCreditCardDetails].CARD_IN.Field4"; Form event code:C388)
$_l_Event:=Form event code:C388

Case of 
	: ($_l_Event=On After Keystroke:K2:26)
		$_t_EditedText:=Get edited text:C655
		$_t_Keystroke:=Keystroke:C390
		If (Character code:C91($_t_Keystroke)#Backspace:K15:36)
			GET HIGHLIGHT:C209([xCreditCardDetails:132]Card_Issuer:6; $_l_StartHighlight; $_l_EndHighlight)
			
			For ($_l_Index; 1; Size of array:C274(CCM_at_CardIssuers))
				$_l_CharacterPosition:=Position:C15($_t_EditedText; CCM_at_CardIssuers{$_l_Index})
				If ($_l_CharacterPosition=1)
					[xCreditCardDetails:132]Card_Issuer:6:=CCM_at_CardIssuers{$_l_Index}
					HIGHLIGHT TEXT:C210([xCreditCardDetails:132]Card_Issuer:6; $_l_EndHighlight; Length:C16([xCreditCardDetails:132]Card_Issuer:6)+1)
					$_l_Index:=99999
				End if 
			End for 
			
		End if 
		
	: ($_l_Event=On Losing Focus:K2:8) | ($_l_Event=On Data Change:K2:15)
		If ([xCreditCardDetails:132]Card_Issuer:6#"")
			$_l_CardIssuerRow:=Find in array:C230(CCM_at_CardIssuers; [xCreditCardDetails:132]Card_Issuer:6)
			If ($_l_CardIssuerRow<0)
				$_l_AddedItemID:=AA_ListAddItem(->[xCreditCardDetails:132]Card_Issuer:6; [xCreditCardDetails:132]Card_Issuer:6)
				
			End if 
			
		End if 
		
		
End case 
ERR_MethodTrackerReturn("OBJ [xCreditCardDetails].CARD_IN.Field4"; $_t_oldMethodName)
