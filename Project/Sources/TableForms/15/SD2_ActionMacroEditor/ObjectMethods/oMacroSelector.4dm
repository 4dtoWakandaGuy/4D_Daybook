If (False:C215)
	//object Name: [USER]SD2_ActionMacroEditor.oMacroSelector
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/10/2012 12:13
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD2_Lb_MacroSelector;0)
	//ARRAY LONGINT(SD2_al_mScriptEvents;0)
	//ARRAY TEXT(SD2_at_mScriptCodes;0)
	//ARRAY TEXT(SD2_at_mScriptEvents;0)
	//ARRAY TEXT(SD2_at_mScriptNames;0)
	//ARRAY TEXT(SD2_at_ScriptNames;0)
	C_BOOLEAN:C305($_bo_IsChanged)
	C_LONGINT:C283($_l_ArraySize; $_l_Column; $_l_event; $_l_FieldNumber; $_l_Row; $_l_TableNumber; Badd; SD2_l_FormEdits; SD2_l_mScriptEvent; SD2_l_MSelected)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName; SD2_t_mScriptCode; SD2_t_mScriptEvent; SD2_t_mScriptName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_ActionMacroEditor.oMacroSelector"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		If ($_l_Row>0)
			$_l_Column:=LB_GetColumn(->SD2_Lb_MacroSelector; $_t_VariableName)
			Case of 
				: ($_l_Column=1)
					
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
											SD2_at_mScriptCodes{SD2_l_MSelected}:=SD2_t_mScriptCode
											SD2_at_ScriptNames{SD2_l_MSelected}:=SD2_t_mScriptName
											SD2_at_mScriptEvents{SD2_l_MSelected}:=SD2_t_mScriptEvent
											SD2_al_mScriptEvents{SD2_l_MSelected}:=SD2_l_mScriptEvent
										End if 
									Else 
										Gen_Confirm("Save changes to macro event?"; "No"; "Yes")
										If (OK=0)
											SD2_l_FormEdits:=SD2_l_FormEdits+1
											SD2_at_mScriptEvents{SD2_l_MSelected}:=SD2_t_mScriptEvent
											SD2_al_mScriptEvents{SD2_l_MSelected}:=SD2_l_mScriptEvent
										End if 
									End if 
								Else 
									Gen_Confirm("Save changes to macro code?"; "Yes"; "No")
									If (OK=1)
										SD2_l_FormEdits:=SD2_l_FormEdits+1
										SD2_at_mScriptCodes{SD2_l_MSelected}:=SD2_t_mScriptCode
										SD2_at_ScriptNames{SD2_l_MSelected}:=SD2_t_mScriptName
									End if 
								End if 
							End if 
						: (SD2_l_MSelected<0)
							//New entry
							If (SD2_t_mScriptCode#"") & (SD2_t_mScriptEvent#"")
								Gen_Confirm("save "+SD2_t_mScriptCode+" for "+SD2_t_mScriptEvent+"?"; "Yes"; "No")
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
								End if 
								
								
							End if 
							
					End case 
					SD2_l_MSelected:=$_l_Row
					SD2_t_mScriptCode:=SD2_at_mScriptCodes{SD2_l_MSelected}
					SD2_t_mScriptName:=SD2_at_mScriptNames{SD2_l_MSelected}
					SD2_t_mScriptEvent:=SD2_at_mScriptEvents{SD2_l_MSelected}
					SD2_l_mScriptEvent:=SD2_al_mScriptEvents{SD2_l_MSelected}
					OBJECT SET TITLE:C194(Badd; "Save")
					If (SD2_l_MSelected>0)
						OBJECT SET VISIBLE:C603(*; "oMacroEditItem"; True:C214)
					Else 
						OBJECT SET VISIBLE:C603(*; "oMacroEditItem"; False:C215)
					End if 
					
					
			End case 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [USER].SD2_ActionMacroEditor.oMacroSelector"; $_t_oldMethodName)
