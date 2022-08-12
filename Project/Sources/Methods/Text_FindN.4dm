//%attributes = {}
If (False:C215)
	//Project Method Name:      Text_FindN
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
	C_TEXT:C284(<>TextFind; $_t_oldMethodName; $Req; $_t_Text)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Text_FindN")
Menu_Record("Text_FindN"; "Find Next")
$_ptr_FocusObject:=Focus object:C278
If (Type:C295($_ptr_FocusObject->)=2)
	If (<>TextFind#"")
		GET HIGHLIGHT:C209($_ptr_FocusObject->; $_l_StartHighlight; $_l_EndHighlight)
		$Req:=Substring:C12($_ptr_FocusObject->; $_l_StartHighlight; $_l_EndHighlight-$_l_StartHighlight)
		If ($Req=<>TextFind)
			$_l_StartHighlight:=$_l_EndHighlight
		End if 
		$_t_Text:=Substring:C12($_ptr_FocusObject->; $_l_StartHighlight; 32600)
		$_l_CharacterPosition:=Position:C15(<>TextFind; $_t_Text)
		If ($_l_CharacterPosition>0)
			$_ptr_FocusObject->:=Substring:C12($_ptr_FocusObject->; 1; $_l_StartHighlight-1)+$_t_Text
			HIGHLIGHT TEXT:C210($_ptr_FocusObject->; $_l_StartHighlight+$_l_CharacterPosition-1; $_l_StartHighlight+$_l_CharacterPosition+Length:C16(<>TextFind)-1)
		Else 
			
			BEEP:C151
		End if 
	Else 
		BEEP:C151
	End if 
	
Else 
	Gen_Alert("This Function can only be used for Text fields"; "")
End if 
ERR_MethodTrackerReturn("Text_FindN"; $_t_oldMethodName)
