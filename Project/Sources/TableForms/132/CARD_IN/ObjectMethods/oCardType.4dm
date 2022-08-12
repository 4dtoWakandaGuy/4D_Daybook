If (False:C215)
	//object Method Name: Object Name:      [xCreditCardDetails].CARD_IN.Variable5
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
	C_LONGINT:C283($_l_AddedItemID; $_l_CardTypeRow; $_l_CharacterPosition; $_l_EndHighlight; $_l_Event; $_l_Index; $_l_ListID; $_l_StartHighlight)
	C_TEXT:C284($_t_EditedText; $_t_Keystroke; $_t_oldMethodName; $CCM_t_CardType; CCM_t_CardType)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [xCreditCardDetails].CARD_IN.Variable5"; Form event code:C388)
$_l_Event:=Form event code:C388

Case of 
	: ($_l_Event=On After Keystroke:K2:26)
		$_t_EditedText:=Get edited text:C655
		$_t_Keystroke:=Keystroke:C390
		If (Character code:C91($_t_Keystroke)#Backspace:K15:36)
			GET HIGHLIGHT:C209(CCM_t_CardType; $_l_StartHighlight; $_l_EndHighlight)
			
			For ($_l_Index; 1; Size of array:C274(CCM_at_CARDTYPES))
				$_l_CharacterPosition:=Position:C15($_t_EditedText; CCM_at_CARDTYPES{$_l_Index})
				If ($_l_CharacterPosition=1)
					[xCreditCardDetails:132]Card_TypeNUM:4:=CCM_al_CardTypes{$_l_Index}
					[xCreditCardDetails:132]Card_TypeName:5:=CCM_at_CARDTYPES{$_l_Index}
					$CCM_t_CardType:=[xCreditCardDetails:132]Card_TypeName:5
					$_l_CharacterPosition:=Position:C15($_t_EditedText; $CCM_t_CardType)
					CCM_t_CardType:=$CCM_t_CardType
					HIGHLIGHT TEXT:C210(CCM_t_CardType; $_l_EndHighlight; Length:C16(CCM_t_CardType)+1)
					$_l_Index:=99999
				End if 
			End for 
			
		End if 
		
	: ($_l_Event=On Losing Focus:K2:8) | ($_l_Event=On Data Change:K2:15)
		If (CCM_t_CardType#"")
			$_l_CardTypeRow:=Find in array:C230(CCM_at_CARDTYPES; CCM_t_CardType)
			If ($_l_CardTypeRow<0)
				Gen_Confirm("This is a new card type?"; "Yes"; "No")
				
				If (ok=1)
					$_l_AddedItemID:=AA_ListAddItem(->[xCreditCardDetails:132]Card_TypeNUM:4; CCM_t_CardType)
					$_l_ListID:=AA_LoadList(->[xCreditCardDetails:132]Card_TypeNUM:4; ->CCM_at_CARDTYPES; ->CCM_al_CardTypes; True:C214)
					$_l_CardTypeRow:=Find in array:C230(CCM_at_CARDTYPES; CCM_t_CardType)
					[xCreditCardDetails:132]Card_TypeNUM:4:=CCM_al_CardTypes{$_l_CardTypeRow}
					[xCreditCardDetails:132]Card_TypeName:5:=CCM_at_CARDTYPES{$_l_CardTypeRow}
					
				Else 
					CCM_t_CardType:=""
					
				End if 
			Else 
				[xCreditCardDetails:132]Card_TypeNUM:4:=CCM_al_CardTypes{$_l_CardTypeRow}
				[xCreditCardDetails:132]Card_TypeName:5:=CCM_at_CARDTYPES{$_l_CardTypeRow}
			End if 
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ [xCreditCardDetails].CARD_IN.Variable5"; $_t_oldMethodName)
