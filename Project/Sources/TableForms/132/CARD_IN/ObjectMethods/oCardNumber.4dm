If (False:C215)
	//object Method Name: Object Name:      [xCreditCardDetails].CARD_IN.Variable8
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
	C_BOOLEAN:C305($_bo_CheckSum)
	C_LONGINT:C283($_l_Break; $_l_CardTypePosition; $_l_Current; $_l_DoubleSpacePosition; $_l_Event; $_l_Index; $_l_Number1; $_l_Security)
	C_TEXT:C284($_t_OldCardNumber; $_t_oldMethodName; CC_T_CCX99999999999; CCM_T_CardNumber; CCM_t_CardType)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [xCreditCardDetails].CARD_IN.Variable8"; Form event code:C388)
$_l_Event:=Form event code:C388
Case of 
		
	: ($_l_Event=On Data Change:K2:15)
		$_t_OldCardNumber:=CC_T_CCX99999999999
		$_l_Break:=4
		$_l_Current:=0
		Repeat 
			$_l_DoubleSpacePosition:=Position:C15("  "; CCM_T_CardNumber)
			If ($_l_DoubleSpacePosition>0)
				CCM_T_CardNumber:=Replace string:C233(CCM_T_CardNumber; "  "; " ")
			End if 
		Until ($_l_DoubleSpacePosition=0)
		//As AMEX card numbers always start with a 3, VISA with a 4 and MC with a 5, it wo
		
		If (Length:C16(CCM_T_CardNumber)>0)
			$_l_Number1:=Num:C11(CCM_T_CardNumber[[1]])
			Case of 
				: ($_l_Number1=3)  //Amex
					$_l_CardTypePosition:=Find in array:C230(CCM_at_CARDTYPES; "AMEX")
					If ($_l_CardTypePosition>0)
						[xCreditCardDetails:132]Card_TypeNUM:4:=CCM_al_CardTypes{$_l_CardTypePosition}
						[xCreditCardDetails:132]Card_TypeName:5:=CCM_at_CARDTYPES{$_l_CardTypePosition}
						CCM_t_CardType:=[xCreditCardDetails:132]Card_TypeName:5
					End if 
				: ($_l_Number1=4)  // Visa
					$_l_CardTypePosition:=Find in array:C230(CCM_at_CARDTYPES; "Visa")
					If ($_l_CardTypePosition>0)
						[xCreditCardDetails:132]Card_TypeNUM:4:=CCM_al_CardTypes{$_l_CardTypePosition}
						[xCreditCardDetails:132]Card_TypeName:5:=CCM_at_CARDTYPES{$_l_CardTypePosition}
						CCM_t_CardType:=[xCreditCardDetails:132]Card_TypeName:5
					End if 
				: ($_l_Number1=5)  //MasterCard
					$_l_CardTypePosition:=Find in array:C230(CCM_at_CARDTYPES; "MasterCard")
					If ($_l_CardTypePosition>0)
						[xCreditCardDetails:132]Card_TypeNUM:4:=CCM_al_CardTypes{$_l_CardTypePosition}
						[xCreditCardDetails:132]Card_TypeName:5:=CCM_at_CARDTYPES{$_l_CardTypePosition}
						CCM_t_CardType:=[xCreditCardDetails:132]Card_TypeName:5
					End if 
			End case 
		End if 
		For ($_l_Index; Length:C16(CCM_T_CardNumber); 1; -1)
			If (CCM_T_CardNumber[[$_l_Index]]#" ")
				$_l_Current:=$_l_Current+1
			End if 
			If ($_l_Current=$_l_Break)
				If ($_l_Index>1)
					If (CCM_T_CardNumber[[$_l_Index-1]]#" ")
						CCM_T_CardNumber:=Substring:C12(CCM_T_CardNumber; 1; $_l_Index-1)+" "+Substring:C12(CCM_T_CardNumber; $_l_Index; Length:C16(CCM_T_CardNumber))
						$_l_Current:=0
					Else 
						$_l_Current:=0
					End if 
				End if 
				
			End if 
			
		End for 
		
		$_bo_CheckSum:=CCM_CheckSum(CCM_BuildCardNumber(CCM_T_CardNumber))
		If (Not:C34($_bo_CheckSum))
			Gen_Alert("That is not a valid card number!")
			$_l_Security:=4
			$_l_Break:=4
			$_l_Current:=0
			CCM_T_CardNumber:=""
			CC_T_CCX99999999999:=$_t_OldCardNumber
			If (CC_T_CCX99999999999#"")
				For ($_l_index; 1; (Length:C16(CC_T_CCX99999999999)-$_l_Security))
					$_l_Current:=$_l_Current+1
					If (CC_T_CCX99999999999[[$_l_index]]#" ")
						If ($_l_Current=$_l_Break)
							If ($_l_index<Length:C16(CC_T_CCX99999999999))
								If (CC_T_CCX99999999999[[$_l_index+1]]=" ")
									CCM_T_CardNumber:=CCM_T_CardNumber+"X"
								Else 
									CCM_T_CardNumber:=CCM_T_CardNumber+"X "
								End if 
							Else 
								CCM_T_CardNumber:=CCM_T_CardNumber+"X"
							End if 
							$_l_Current:=0
						Else 
							CCM_T_CardNumber:=CCM_T_CardNumber+"X"
						End if 
						
					Else 
						$_l_Current:=0
						CCM_T_CardNumber:=CCM_T_CardNumber+" "
					End if 
				End for 
				
			End if 
			If ($_l_Security>0)
				CCM_T_CardNumber:=CCM_T_CardNumber+Substring:C12(CC_T_CCX99999999999; (Length:C16(CC_T_CCX99999999999)-$_l_Security); (Length:C16(CC_T_CCX99999999999)))
			End if 
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ [xCreditCardDetails].CARD_IN.Variable8"; $_t_oldMethodName)
