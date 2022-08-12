If (False:C215)
	//object Name: [USER]SD2_TabSettingForm.Variable9
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/10/2012 11:33
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD2_Lb_TabsByAction;0)
	//ARRAY LONGINT(SD_al_ActionGroupIncludes;0)
	//ARRAY LONGINT(SD_al_ActionIDs;0)
	//ARRAY LONGINT(SD2_al_ActionGroupIDs;0)
	//ARRAY LONGINT(SD2_al_TabIncludes;0)
	//ARRAY TEXT(SD_at_AllTabName;0)
	//ARRAY TEXT(SD2_at_AllActionNames;0)
	//ARRAY TEXT(SD2_at_TabNames;0)
	C_LONGINT:C283($_l_ActionGroupRow; $_l_ActionsIndex; $_l_TabIncludesColumnIndex; $_l_TabIndex; SD2_l_BUT1; SD2_l_But2; SD2_l_BUT3; SD2_l_BUT4; SD2_l_BUT5; SD2_l_BUT6; SD2_l_BUT7)
	C_LONGINT:C283(SD2_l_BUT8; SD2_l_BUT9)
	C_TEXT:C284($_t_oldMethodName; SD2_t_COL1; SD2_t_COL2; SD2_t_COL3; SD2_t_COL4; SD2_t_COL5; SD2_t_COL6; SD2_t_COL7; SD2_t_COL8; SD2_t_COL9; SD2_t_HED1)
	C_TEXT:C284(SD2_t_HED2; SD2_t_HED3; SD2_t_HED4; SD2_t_HED5; SD2_t_HED6; SD2_t_HED7; SD2_t_HED8; SD2_t_HED9)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_TabSettingForm.Variable9"; Form event code:C388)
ARRAY TEXT:C222(SD_at_AllTabName; 0)

ARRAY TEXT:C222(SD_at_AllTabName; Size of array:C274(SD2_at_AllActionNames))
For ($_l_ActionsIndex; 1; Size of array:C274(SD2_at_AllActionNames))
	For ($_l_TabIndex; 1; Size of array:C274(SD2_at_TabNames))
		If (Size of array:C274(SD2_al_TabIncludes{$_l_TabIndex})>0)
			For ($_l_TabIncludesColumnIndex; 1; Size of array:C274(SD2_al_TabIncludes{$_l_TabIndex}))
				If (SD2_al_TabIncludes{$_l_TabIndex}{$_l_TabIncludesColumnIndex}>0)
					If (SD2_al_TabIncludes{$_l_TabIndex}{$_l_TabIncludesColumnIndex}=SD_al_ActionIDs{$_l_ActionsIndex})
						If (SD_at_AllTabName{$_l_ActionsIndex}="")
							SD_at_AllTabName{$_l_ActionsIndex}:=SD2_at_TabNames{$_l_TabIndex}
						Else 
							SD_at_AllTabName{$_l_ActionsIndex}:=SD_at_AllTabName{$_l_ActionsIndex}+", "+SD2_at_TabNames{$_l_TabIndex}
						End if 
						$_l_TabIncludesColumnIndex:=Size of array:C274(SD2_al_TabIncludes{$_l_TabIndex})
					End if 
				Else 
					//It is a group
					$_l_ActionGroupRow:=Find in array:C230(SD2_al_ActionGroupIDs; Abs:C99(SD2_al_TabIncludes{$_l_TabIndex}{$_l_TabIncludesColumnIndex}))
					If ($_l_ActionGroupRow>0)
						For ($_l_ActionsIndex; 1; Size of array:C274(SD_al_ActionGroupIncludes{$_l_ActionGroupRow}))
							If (SD_al_ActionGroupIncludes{$_l_ActionGroupRow}{$_l_ActionsIndex}=SD_al_ActionIDs{$_l_ActionsIndex})
								If (SD_at_AllTabName{$_l_ActionsIndex}="")
									SD_at_AllTabName{$_l_ActionsIndex}:=SD2_at_TabNames{$_l_TabIndex}
								Else 
									SD_at_AllTabName{$_l_ActionsIndex}:=SD_at_AllTabName{$_l_ActionsIndex}+", "+SD2_at_TabNames{$_l_TabIndex}
								End if 
								$_l_ActionsIndex:=Size of array:C274(SD_al_ActionGroupIncludes{$_l_ActionGroupRow})
								$_l_TabIncludesColumnIndex:=Size of array:C274(SD2_al_TabIncludes{$_l_TabIndex})
							End if 
						End for 
						
					End if 
					
				End if 
				
			End for 
		Else 
			If (SD_at_AllTabName{$_l_ActionsIndex}="")
				SD_at_AllTabName{$_l_ActionsIndex}:=SD2_at_TabNames{$_l_TabIndex}
			Else 
				SD_at_AllTabName{$_l_ActionsIndex}:=SD_at_AllTabName{$_l_ActionsIndex}+", "+SD2_at_TabNames{$_l_TabIndex}
			End if 
		End if 
	End for 
	
End for 

LB_SetupListbox(->SD2_Lb_TabsByAction; "SD2_t"; "SD2_L"; 1; ->SD2_at_AllActionNames; ->SD_at_AllTabName)


LB_SetColumnHeaders(->SD2_Lb_TabsByAction; "SD2_L"; 1; "Actions"; "Tabs")



LB_SetColumnWidths(->SD2_Lb_TabsByAction; "SD2_t"; 1; 221; 281)

LB_SetEnterable(->SD2_Lb_TabsByAction; False:C215; 0)
LB_StyleSettings(->SD2_Lb_TabsByAction; "Black"; 9; "SD2_t"; ->[DIARY:12])

FORM GOTO PAGE:C247(2)
ERR_MethodTrackerReturn("OBJ [USER].SD2_TabSettingForm.Variable9"; $_t_oldMethodName)
