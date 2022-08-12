If (False:C215)
	//object Name: [USER]SD2_ActionMacroEditor.oMacroEditItem_DEL
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
	//ARRAY LONGINT(SD2_al_mScriptEvents;0)
	//ARRAY TEXT(SD2_at_mScriptCodes;0)
	//ARRAY TEXT(SD2_at_mScriptEvents;0)
	//ARRAY TEXT(SD2_at_mScriptNames;0)
	C_LONGINT:C283(Badd; SD2_l_FormEdits; SD2_l_mScriptEvent; SD2_l_MSelected)
	C_TEXT:C284($_t_oldMethodName; SD2_t_mScriptCode; SD2_t_mScriptEvent; SD2_t_mScriptName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_ActionMacroEditor.oMacroEditItem_DEL"; Form event code:C388)
If (SD2_l_MSelected>0)
	Gen_Confirm("Are you sure you want to delete "+SD2_at_mScriptCodes{SD2_l_MSelected}+" from this diary action?"; "No"; "Yes")
	If (OK=0)
		DELETE FROM ARRAY:C228(SD2_at_mScriptCodes; SD2_l_MSelected; 1)
		DELETE FROM ARRAY:C228(SD2_at_mScriptNames; SD2_l_MSelected; 1)
		DELETE FROM ARRAY:C228(SD2_at_mScriptEvents; SD2_l_MSelected; 1)
		DELETE FROM ARRAY:C228(SD2_al_mScriptEvents; SD2_l_MSelected; 1)
		SD2_l_MSelected:=0
		SD2_t_mScriptCode:=SD2_at_mScriptCodes{SD2_l_MSelected}
		SD2_t_mScriptName:=SD2_at_mScriptNames{SD2_l_MSelected}
		SD2_t_mScriptEvent:=SD2_at_mScriptEvents{SD2_l_MSelected}
		SD2_l_mScriptEvent:=SD2_al_mScriptEvents{SD2_l_MSelected}
		SD2_l_FormEdits:=SD2_l_FormEdits+1
		OBJECT SET TITLE:C194(Badd; "Save")
		OBJECT SET VISIBLE:C603(*; "oMacroEditItem"; False:C215)
	End if 
	
Else 
	//Ignore
End if 
ERR_MethodTrackerReturn("OBJ [USER].SD2_ActionMacroEditor.oMacroEditItem_DEL"; $_t_oldMethodName)
