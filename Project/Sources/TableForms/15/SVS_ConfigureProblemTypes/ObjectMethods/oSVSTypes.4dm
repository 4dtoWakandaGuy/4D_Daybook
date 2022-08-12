If (False:C215)
	//object Name: [USER]SVS_ConfigureProblemTypes.oSVSTypes
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:24
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SVS_abo_IsCreated;0)
	//ARRAY BOOLEAN(SVS_lb_ProblemTypes;0)
	//ARRAY LONGINT(SD2_al_ProblemTypeIDs;0)
	//ARRAY TEXT(SD_at_ProblemTypeActionCodes;0)
	//ARRAY TEXT(SD_at_ProblemTypeActions;0)
	//ARRAY TEXT(SD2_at_ProblemTypeNames;0)
	//ARRAY TEXT(SVS_at_ActionCodes;0)
	//ARRAY TEXT(SVS_at_ActionName;0)
	C_LONGINT:C283($_l_Element; $_l_event; $_l_FieldNumber; $_l_Index; $_l_ProblemTypeRow; $_l_SelectedRow; $_l_TableNumber; SVS_l_ProblemTypeID; SVS_l_ProbTypeID)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName; SVS_t_problemTypeName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SVS_ConfigureProblemTypes.oSVSTypes"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_SelectedRow:=Self:C308->
		If ($_l_SelectedRow>0)
			LISTBOX SELECT ROW:C912(SVS_lb_ProblemTypes; $_l_SelectedRow; 0)
			If (SVS_l_ProblemTypeID#0)
				If (SVS_l_ProblemTypeID=-1)
					If (SVS_t_problemTypeName#"")
						SVS_l_ProbTypeID:=AA_GetNextID(->SVS_l_ProbTypeID)
						APPEND TO ARRAY:C911(SD2_al_ProblemTypeIDs; SVS_l_ProbTypeID)
						APPEND TO ARRAY:C911(SD2_at_ProblemTypeNames; SVS_t_problemTypeName)
						INSERT IN ARRAY:C227(SD_at_ProblemTypeActionCodes; Size of array:C274(SD_at_ProblemTypeActionCodes)+1; 1)
						INSERT IN ARRAY:C227(SD_at_ProblemTypeActions; Size of array:C274(SD_at_ProblemTypeActions)+1; 1)
						
						SVS_t_problemTypeName:=""
						$_l_Element:=0
						For ($_l_Index; 1; Size of array:C274(SVS_abo_IsCreated))
							If (SVS_abo_IsCreated{$_l_Index})
								$_l_Element:=$_l_Element+1
								If ($_l_Element>Size of array:C274(SD_at_ProblemTypeActionCodes{$_l_ProblemTypeRow}))
									APPEND TO ARRAY:C911(SD_at_ProblemTypeActionCodes{$_l_ProblemTypeRow}; SVS_at_ActionCodes{$_l_Index})
									APPEND TO ARRAY:C911(SD_at_ProblemTypeActions{$_l_ProblemTypeRow}; SVS_at_ActionName{$_l_Index})
								Else 
									SD_at_ProblemTypeActionCodes{$_l_ProblemTypeRow}{$_l_Element}:=SVS_at_ActionCodes{$_l_Index}
									SD_at_ProblemTypeActions{$_l_ProblemTypeRow}{$_l_Element}:=SVS_at_ActionName{$_l_Index}
								End if 
							End if 
						End for 
						
					End if 
				Else 
					//existing-update it
					
					$_l_ProblemTypeRow:=Find in array:C230(SD2_al_ProblemTypeIDs; SVS_l_ProblemTypeID)
					If (SVS_t_problemTypeName#"")
						SD2_at_ProblemTypeNames{$_l_ProblemTypeRow}:=SVS_t_problemTypeName
						SVS_t_problemTypeName:=""
					End if 
					For ($_l_Index; 1; Size of array:C274(SD_at_ProblemTypeActionCodes{$_l_ProblemTypeRow}))
						SD_at_ProblemTypeActionCodes{$_l_ProblemTypeRow}{$_l_Index}:=""
						SD_at_ProblemTypeActions{$_l_ProblemTypeRow}{$_l_Index}:=""
					End for 
					$_l_Element:=0
					For ($_l_Index; 1; Size of array:C274(SVS_abo_IsCreated))
						If (SVS_abo_IsCreated{$_l_Index})
							$_l_Element:=$_l_Element+1
							If ($_l_Element>Size of array:C274(SD_at_ProblemTypeActionCodes{$_l_ProblemTypeRow}))
								APPEND TO ARRAY:C911(SD_at_ProblemTypeActionCodes{$_l_ProblemTypeRow}; SVS_at_ActionCodes{$_l_Index})
								APPEND TO ARRAY:C911(SD_at_ProblemTypeActions{$_l_ProblemTypeRow}; SVS_at_ActionName{$_l_Index})
							Else 
								SD_at_ProblemTypeActionCodes{$_l_ProblemTypeRow}{$_l_Element}:=SVS_at_ActionCodes{$_l_Index}
								SD_at_ProblemTypeActions{$_l_ProblemTypeRow}{$_l_Element}:=SVS_at_ActionName{$_l_Index}
							End if 
						End if 
					End for 
					
				End if 
			End if 
			SVS_l_ProblemTypeID:=SD2_al_ProblemTypeIDs{$_l_SelectedRow}
			SVS_t_problemTypeName:=SD2_at_ProblemTypeNames{$_l_SelectedRow}
			For ($_l_Index; 1; Size of array:C274(SVS_abo_IsCreated))
				SVS_abo_IsCreated{$_l_Index}:=False:C215
			End for 
			For ($_l_Index; 1; Size of array:C274(SD_at_ProblemTypeActionCodes{$_l_SelectedRow}))
				$_l_ProblemTypeRow:=Find in array:C230(SVS_at_ActionCodes; SD_at_ProblemTypeActionCodes{$_l_SelectedRow}{$_l_Index})
				If ($_l_ProblemTypeRow>0)
					SVS_abo_IsCreated{$_l_ProblemTypeRow}:=True:C214
				End if 
				
			End for 
			
			
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [USER].SVS_ConfigureProblemTypes.oSVSTypes"; $_t_oldMethodName)
