//%attributes = {}

If (False:C215)
	//Database Method Name:      LAY_ComboBoxCode
	//------------------ Method Notes ------------------
	//this is the code behing the generic combo box for filters. Dependant on what the box is used for this might run Different code
	
	//------------------ Revision Control ----------------
	//Date Created:  01/09/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(ACC_at_PeriodFromCode;0)
	//ARRAY TEXT(ACC_at_PeriodToCode;0)
	C_BOOLEAN:C305(LAY_bo_FiltersActive; Lay_bo_UpdateFilters)
	C_LONGINT:C283($_l_ArrayRow; $_l_EditedTextLength; $_l_FormEvent; $_l_HighlightLength; $1; DB_but_ClearFiltersButton; DB_l_CurrentDisplayedForm)
	C_POINTER:C301($_ptr_CurrentObject; $_ptr_Table; $2)
	C_TEXT:C284($_t_EditedText; $_t_Keystroke; $_t_oldMethodName; DB_t_CurrentContext)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("LAY_ComboBoxCode")

$_l_FormEvent:=$1
$_ptr_CurrentObject:=$2
Case of 
	: ($_ptr_CurrentObject=(->ACC_at_PeriodFromCode))
		
		Case of 
			: ($_l_FormEvent=On After Keystroke:K2:26)
				$_t_Keystroke:=Keystroke:C390
				If (Character code:C91($_t_Keystroke)#Backspace:K15:36)
					$_t_EditedText:=Get edited text:C655
					$_l_EditedTextLength:=Length:C16($_t_EditedText)
					$_l_ArrayRow:=Find in array:C230(ACC_at_PeriodFromCode; $_t_EditedText+"@")
					If ($_l_ArrayRow>0)
						ACC_at_PeriodFromCode{0}:=ACC_at_PeriodFromCode{$_l_ArrayRow}
						$_l_HighlightLength:=Length:C16(ACC_at_PeriodFromCode{0})
						HIGHLIGHT TEXT:C210(ACC_at_PeriodFromCode{0}; $_l_EditedTextLength+1; $_l_HighlightLength+1)
						LAY_bo_FiltersActive:=True:C214
						Lay_bo_UpdateFilters:=True:C214
						$_l_ArrayRow:=Find in array:C230(ACC_at_PeriodFromCode; $_t_EditedText)
						If ($_l_ArrayRow>0)
							Lay_bo_UpdateFilters:=False:C215
							SEL_CurrentRecordSelection
							$_ptr_Table:=Table:C252(DB_l_CurrentDisplayedForm)
							SRCH_Applyfilterstoselection($_ptr_Table)
							DB_SetWindowTitle(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
							OBJECT SET VISIBLE:C603(*; "oFiltersActiveText"; True:C214)
							OBJECT SET ENABLED:C1123(*; "oClearFilters"; True:C214)
							
						End if 
						
					Else 
						ACC_at_PeriodFromCode{0}:=Substring:C12($_t_EditedText; 1; $_l_EditedTextLength-1)
						
					End if 
				End if 
			: ($_l_FormEvent=On After Edit:K2:43)
				
			: ($_l_FormEvent=On Losing Focus:K2:8)
				If (ACC_at_PeriodFromCode{0}="")
					ACC_at_PeriodFromCode{0}:=ACC_at_PeriodFromCode{Size of array:C274(ACC_at_PeriodFromCode)}
				End if 
				LAY_bo_FiltersActive:=True:C214
				Lay_bo_UpdateFilters:=True:C214
			: ($_l_FormEvent=On Clicked:K2:4)
				If (ACC_at_PeriodFromCode{0}="")
					ACC_at_PeriodFromCode{0}:=ACC_at_PeriodFromCode{Size of array:C274(ACC_at_PeriodFromCode)}
				End if 
				LAY_bo_FiltersActive:=True:C214
				Lay_bo_UpdateFilters:=True:C214
				
		End case 
		
	: ($_ptr_CurrentObject=(->ACC_at_PeriodToCode))
		Case of 
			: ($_l_FormEvent=On After Keystroke:K2:26)
				$_t_Keystroke:=Keystroke:C390
				If (Character code:C91($_t_Keystroke)#Backspace:K15:36)
					$_t_EditedText:=Get edited text:C655
					$_l_EditedTextLength:=Length:C16($_t_EditedText)
					$_l_ArrayRow:=Find in array:C230(ACC_at_PeriodtoCode; $_t_EditedText+"@")
					If ($_l_ArrayRow>0)
						ACC_at_PeriodtoCode{0}:=ACC_at_PeriodtoCode{$_l_ArrayRow}
						$_l_HighlightLength:=Length:C16(ACC_at_PeriodtoCode{0})
						HIGHLIGHT TEXT:C210(ACC_at_PeriodtoCode{0}; $_l_EditedTextLength+1; $_l_HighlightLength+1)
						LAY_bo_FiltersActive:=True:C214
						Lay_bo_UpdateFilters:=True:C214
						$_l_ArrayRow:=Find in array:C230(ACC_at_PeriodFromCode; $_t_EditedText)
						If ($_l_ArrayRow>0)
							//Lay_bo_UpdateFilters:=False
							SEL_CurrentRecordSelection
							$_ptr_Table:=Table:C252(DB_l_CurrentDisplayedForm)
							SRCH_Applyfilterstoselection($_ptr_Table)
							DB_SetWindowTitle(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
							OBJECT SET VISIBLE:C603(*; "oFiltersActiveText"; True:C214)
							OBJECT SET ENABLED:C1123(*; "oClearFilters"; True:C214)
						End if 
					Else 
						ACC_at_PeriodtoCode{0}:=Substring:C12($_t_EditedText; 1; $_l_EditedTextLength-1)
						
					End if 
				End if 
			: ($_l_FormEvent=On Losing Focus:K2:8)
				If (ACC_at_PeriodtoCode{0}="")
					ACC_at_PeriodtoCode{0}:=ACC_at_PeriodtoCode{1}
				End if 
				LAY_bo_FiltersActive:=True:C214
				Lay_bo_UpdateFilters:=True:C214
			: ($_l_FormEvent=On Clicked:K2:4)
				If (ACC_at_PeriodtoCode{0}="")
					ACC_at_PeriodtoCode{0}:=ACC_at_PeriodtoCode{1}
				End if 
				LAY_bo_FiltersActive:=True:C214
				Lay_bo_UpdateFilters:=True:C214
		End case 
End case 
ERR_MethodTrackerReturn("LAY_ComboBoxCode"; $_t_oldMethodName)
