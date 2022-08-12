If (False:C215)
	//object Method Name: Object Name:      Balance_Filters.oAccDateFrom
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:03
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(ACC_at_PeriodFromCode;0)
	C_BOOLEAN:C305(LAY_bo_FiltersActive; Lay_bo_UpdateFilters)
	C_LONGINT:C283($_l_ArrayRow; $_l_EditedTextLength; $_l_Event; $_l_HighlightLength)
	C_TEXT:C284($_t_EditedText; $_t_Keystroke; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ DB_OutputForm.oAccDateFrom"; Form event code:C388)
$_l_Event:=Form event code:C388
Case of 
	: ($_l_Event=On After Keystroke:K2:26)
		$_t_Keystroke:=Keystroke:C390
		If (Character code:C91($_t_Keystroke)#Backspace:K15:36)
			$_t_EditedText:=Get edited text:C655
			$_l_EditedTextLength:=Length:C16($_t_EditedText)
			$_l_ArrayRow:=Find in array:C230(ACC_at_PeriodFromCode; $_t_EditedText+"@")
			If ($_l_ArrayRow>0)
				ACC_at_PeriodFromCode{0}:=ACC_at_PeriodFromCode{$_l_ArrayRow}
				$_l_HighlightLength:=Length:C16(ACC_at_PeriodFromCode{0})
				//HIGHLIGHT TEXT(ACC_at_PeriodFromCode{0};$_l_EditedTextLength+1;$_l_HighlightLength+1)
				LAY_bo_FiltersActive:=True:C214
				Lay_bo_UpdateFilters:=True:C214
				$_l_ArrayRow:=Find in array:C230(ACC_at_PeriodFromCode; $_t_EditedText)
				If ($_l_ArrayRow>0)
					Lay_bo_UpdateFilters:=False:C215
					//SEL_CurrentRecordSelection 
					//$_ptr_Table:=Table(DB_l_CurrentDisplayedForm)
					//SRCH_Applyfilterstoselection ($_ptr_Table)
					//DB_SetWindowTitle (DB_l_CurrentDisplayedForm;DB_t_CurrentContext)
					//OBJECT SET VISIBLE(*;"oFiltersActiveText";True)
					//_o_ENABLE BUTTON(DB_but_ClearFiltersButton)
				Else 
					
				End if 
				
			Else 
				ACC_at_PeriodFromCode{0}:=Substring:C12($_t_EditedText; 1; $_l_EditedTextLength-1)
				
			End if 
		End if 
	: ($_l_Event=On After Edit:K2:43)
		
	: ($_l_Event=On Losing Focus:K2:8)
		If (ACC_at_PeriodFromCode{0}="")
			ACC_at_PeriodFromCode{0}:=ACC_at_PeriodFromCode{Size of array:C274(ACC_at_PeriodFromCode)}
		End if 
		LAY_bo_FiltersActive:=True:C214
		Lay_bo_UpdateFilters:=True:C214
	: ($_l_Event=On Clicked:K2:4)
		If (ACC_at_PeriodFromCode{0}="")
			ACC_at_PeriodFromCode{0}:=ACC_at_PeriodFromCode{Size of array:C274(ACC_at_PeriodFromCode)}
		End if 
		LAY_bo_FiltersActive:=True:C214
		Lay_bo_UpdateFilters:=True:C214
		
End case 
ERR_MethodTrackerReturn("OBJ DB_OutputForm.oAccDateFrom"; $_t_oldMethodName)
