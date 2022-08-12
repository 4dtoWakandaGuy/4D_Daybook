If (False:C215)
	//object Name: [USER]SD2_ActionMacroEditor.oMacroEditItem_POP
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
	//ARRAY LONGINT(SD2_al_EventIDs;0)
	//ARRAY LONGINT(SD2_al_mScriptEvents;0)
	//ARRAY TEXT(SD2_at_EventNames;0)
	C_LONGINT:C283($_l_event; $_l_ScriptEventRow; SD2_l_mScriptEvent)
	C_TEXT:C284($_t_oldMethodName; SD2_t_mScriptEvent)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_ActionMacroEditor.oMacroEditItem_POP"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Clicked:K2:4)
		$_l_ScriptEventRow:=Find in array:C230(SD2_al_mScriptEvents; SD2_al_EventIDs{SD2_at_EventNames})
		If ($_l_ScriptEventRow>0)
			Gen_Alert("Sorry you already have a macro for that event, you  may only set one macro for ea"+"ch event")
		Else 
			SD2_t_mScriptEvent:=SD2_at_EventNames{SD2_at_EventNames}
			SD2_l_mScriptEvent:=SD2_al_EventIDs{SD2_at_EventNames}
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [USER].SD2_ActionMacroEditor.oMacroEditItem_POP"; $_t_oldMethodName)
