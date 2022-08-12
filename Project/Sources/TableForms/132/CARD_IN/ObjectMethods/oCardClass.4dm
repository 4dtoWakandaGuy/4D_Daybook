If (False:C215)
	//object Method Name: Object Name:      [xCreditCardDetails].CARD_IN.Variable10
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
	C_LONGINT:C283($_l_CardClassPosition; $_l_EndHighlight; $_l_Event; $_l_Index; $_l_StartHighlight)
	C_TEXT:C284($_t_EditedText; $_t_Keystroke; $_t_oldMethodName; $CCM_t_CardClass; CCM_t_CardClass)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [xCreditCardDetails].CARD_IN.Variable10"; Form event code:C388)
$_l_Event:=Form event code:C388

Case of 
	: ($_l_Event=On After Keystroke:K2:26)
		$_t_EditedText:=Get edited text:C655
		$_t_Keystroke:=Keystroke:C390
		If (Character code:C91($_t_Keystroke)#Backspace:K15:36)
			GET HIGHLIGHT:C209(CCM_t_CardClass; $_l_StartHighlight; $_l_EndHighlight)
			
			For ($_l_Index; 1; Size of array:C274(CCM_at_CardClasses))
				$_l_CardClassPosition:=Position:C15($_t_EditedText; CCM_at_CardClasses{$_l_Index})
				If ($_l_CardClassPosition=1)
					[xCreditCardDetails:132]CardClass:3:=CCM_al_CardClasses{$_l_Index}
					$CCM_t_CardClass:=CCM_at_CardClasses{$_l_Index}
					$_l_CardClassPosition:=Position:C15($_t_EditedText; $CCM_t_CardClass)
					CCM_t_CardClass:=$CCM_t_CardClass
					HIGHLIGHT TEXT:C210(CCM_t_CardClass; $_l_EndHighlight; Length:C16(CCM_t_CardClass)+1)
					$_l_Index:=99999
				End if 
			End for 
			
		End if 
		
	: ($_l_Event=On Losing Focus:K2:8) | ($_l_Event=On Data Change:K2:15)
		
		
End case 
ERR_MethodTrackerReturn("OBJ [xCreditCardDetails].CARD_IN.Variable10"; $_t_oldMethodName)
