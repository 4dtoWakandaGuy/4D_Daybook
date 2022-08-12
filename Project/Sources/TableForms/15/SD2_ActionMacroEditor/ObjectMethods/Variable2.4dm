If (False:C215)
	//object Name: [USER]SD2_ActionMacroEditor.Variable2
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
	//ARRAY TEXT(SD2_at_ScriptNames;0)
	C_BOOLEAN:C305($_bo_AutoSave; $_bo_IsChanged)
	C_LONGINT:C283($_l_ArraySize; SD2_l_FormEdits; SD2_l_mScriptEvent; SD2_l_MSelected)
	C_TEXT:C284($_t_oldMethodName; SD2_t_mScriptCode; SD2_t_mScriptEvent; SD2_t_mScriptName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_ActionMacroEditor.Variable2"; Form event code:C388)

$_bo_AutoSave:=False:C215
Case of 
	: (SD2_l_MSelected>0)
		If (SD2_t_mScriptCode#"") & (SD2_t_mScriptEvent#"")
			$_bo_IsChanged:=False:C215
			If (SD2_t_mScriptEvent#SD2_at_mScriptEvents{SD2_l_MSelected})
				$_bo_IsChanged:=True:C214
				If (SD2_t_mScriptCode#SD2_at_mScriptCodes{SD2_l_MSelected})
					Gen_Confirm("Save changes to macro code and event?"; "No"; "Yes")
					If (OK=0)
						SD2_l_FormEdits:=SD2_l_FormEdits+1
						$_bo_AutoSave:=True:C214
						SD2_at_mScriptCodes{SD2_l_MSelected}:=SD2_t_mScriptCode
						SD2_at_ScriptNames{SD2_l_MSelected}:=SD2_t_mScriptName
						SD2_at_mScriptEvents{SD2_l_MSelected}:=SD2_t_mScriptEvent
						SD2_al_mScriptEvents{SD2_l_MSelected}:=SD2_l_mScriptEvent
					End if 
				Else 
					Gen_Confirm("Save changes to macro event?"; "No"; "Yes")
					If (OK=0)
						SD2_l_FormEdits:=SD2_l_FormEdits+1
						$_bo_AutoSave:=True:C214
						
						SD2_at_mScriptEvents{SD2_l_MSelected}:=SD2_t_mScriptEvent
						SD2_al_mScriptEvents{SD2_l_MSelected}:=SD2_l_mScriptEvent
					End if 
				End if 
			Else 
				Gen_Confirm("Save changes to macro code?"; "Yes"; "No")
				If (OK=1)
					SD2_l_FormEdits:=SD2_l_FormEdits+1
					$_bo_AutoSave:=True:C214
					
					SD2_at_mScriptCodes{SD2_l_MSelected}:=SD2_t_mScriptCode
					SD2_at_ScriptNames{SD2_l_MSelected}:=SD2_t_mScriptName
				End if 
			End if 
		End if 
	: (SD2_l_MSelected<0)
		//New entry
		If (SD2_t_mScriptCode#"") & (SD2_t_mScriptEvent#"")
			Gen_Confirm("Save "+SD2_t_mScriptCode+" for "+SD2_t_mScriptEvent+"?"; "Yes"; "No")
			If (Ok=1)
				$_l_ArraySize:=Size of array:C274(SD2_at_mScriptCodes)+1
				INSERT IN ARRAY:C227(SD2_at_mScriptCodes; $_l_ArraySize; 1)
				INSERT IN ARRAY:C227(SD2_at_mScriptNames; $_l_ArraySize; 1)
				INSERT IN ARRAY:C227(SD2_at_mScriptEvents; $_l_ArraySize; 1)
				INSERT IN ARRAY:C227(SD2_al_mScriptEvents; $_l_ArraySize; 1)
				SD2_at_mScriptCodes{$_l_ArraySize}:=SD2_t_mScriptCode
				SD2_at_mScriptNames{$_l_ArraySize}:=SD2_t_mScriptName
				SD2_at_mScriptEvents{$_l_ArraySize}:=SD2_t_mScriptEvent
				SD2_al_mScriptEvents{$_l_ArraySize}:=SD2_l_mScriptEvent
				SD2_l_FormEdits:=SD2_l_FormEdits+1
				$_bo_AutoSave:=True:C214
				
			End if 
			
			
		End if 
		
End case 
If (SD2_l_FormEdits>0)  //Modifications made
	If (Not:C34($_bo_AutoSave))
		Gen_Confirm("Save Changes to the macros for this action?"; "Yes"; "No")
		If (OK=1)
			$_bo_AutoSave:=True:C214
		Else 
			SD2_l_FormEdits:=0
		End if 
		CANCEL:C270
	Else 
		CANCEL:C270
	End if 
Else 
	CANCEL:C270
End if 
ERR_MethodTrackerReturn("OBJ [USER].SD2_ActionMacroEditor.Variable2"; $_t_oldMethodName)
