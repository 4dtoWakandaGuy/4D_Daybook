//%attributes = {}
If (False:C215)
	//Project Method Name:      Text_ReplaceN
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_CharacterPosition; $_l_EndHighlight; $_l_StartHighlight)
	C_POINTER:C301($_ptr_FocusObject)
	C_TEXT:C284(<>TextFind; <>TextReplace; $_t_oldMethodName; $_t_Text)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Text_ReplaceN")
Menu_Record("Text_ReplaceN"; "Replace Next")
$_ptr_FocusObject:=Focus object:C278
If (Type:C295($_ptr_FocusObject->)=2)
	If (<>TextFind#"")
		GET HIGHLIGHT:C209($_ptr_FocusObject->; $_l_StartHighlight; $_l_EndHighlight)
		$_t_Text:=Substring:C12($_ptr_FocusObject->; $_l_StartHighlight; 32600)
		$_l_CharacterPosition:=Position:C15(<>TextFind; $_t_Text)
		If ($_l_CharacterPosition>0)
			$_t_Text:=Replace string:C233($_t_Text; <>TextFind; <>TextReplace; 1)
			$_ptr_FocusObject->:=Substring:C12($_ptr_FocusObject->; 1; $_l_StartHighlight-1)+$_t_Text
			$_l_CharacterPosition:=$_l_StartHighlight+$_l_CharacterPosition+Length:C16(<>TextReplace)-1
			HIGHLIGHT TEXT:C210($_ptr_FocusObject->; $_l_CharacterPosition; $_l_CharacterPosition)
		Else 
			BEEP:C151
		End if 
	Else 
		BEEP:C151
	End if 
	
Else 
	Gen_Alert("This Function can only be used for Text fields"; "")
End if 
ERR_MethodTrackerReturn("Text_ReplaceN"; $_t_oldMethodName)
