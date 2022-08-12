
If (False:C215)
	//Database Method Name:      LAY_lb_LBArea
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/08/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_ColumnVisible; 0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	ARRAY POINTER:C280($_aptr_ColumnVars; 0)
	ARRAY POINTER:C280($_aptr_HeaderVars; 0)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	C_BOOLEAN:C305($_bo_isOn; $_bo_update; LAY_bo_FiltersActive; Lay_bo_UpdateFilters)
	C_LONGINT:C283($_l_FIeldNumber; $_l_FormEvent; $_l_index; $_l_SelectedColumn; $_l_SelectedRow; $_l_TableNumber; DB_l_CurrentDisplayedForm)
	C_POINTER:C301($_ptr_CurrentTableForm; $_ptr_ExcludeArray; $_ptr_FocusObject; $_ptr_IncludeArray)
	C_TEXT:C284($_t_ColumnName; $_t_oldMethodName; DB_t_CurrentContext)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [projectForm]/DB_OutputForm/oFilterLBObject"; Form event code:C388)
$_l_FormEvent:=Form event code:C388
Case of 
	: ($_l_FormEvent=On Header Click:K2:40)
		//with all these ares the last two columns are the include exclude...so...
		///this then is pretty generic for this screen...
		$_ptr_FocusObject:=Focus object:C278
		LISTBOX GET ARRAYS:C832($_ptr_FocusObject->; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVars; $_aptr_HeaderVars; $_abo_ColumnVisible; $_aptr_ColumnStyles)
		RESOLVE POINTER:C394(Self:C308; $_t_ColumnName; $_l_TableNumber; $_l_FIeldNumber)
		$_l_SelectedRow:=Self:C308->
		//$_l_SelectedColumn:=LB_GetColumn (->LAY_lb_CountyCodes;"";$_t_ColumnName
		
		$_l_SelectedColumn:=LB_GetColumn($_ptr_FocusObject; ""; $_t_ColumnName)
		$_ptr_IncludeArray:=$_aptr_ColumnVars{Size of array:C274($_aptr_ColumnVars)-1}
		$_ptr_ExcludeArray:=$_aptr_ColumnVars{Size of array:C274($_aptr_ColumnVars)}
		
		Case of 
				
			: ($_l_SelectedColumn=(Size of array:C274($_aptr_ColumnVars)-1))
				
				If (Size of array:C274($_ptr_IncludeArray->)>=1)
					$_bo_isOn:=$_ptr_IncludeArray->{1}
					For ($_l_index; 1; Size of array:C274($_ptr_IncludeArray->))
						If ($_bo_isOn)
							$_ptr_IncludeArray->{$_l_index}:=False:C215
							$_ptr_ExcludeArray->{$_l_index}:=True:C214
						Else 
							$_ptr_IncludeArray->{$_l_index}:=True:C214
							$_ptr_ExcludeArray->{$_l_index}:=False:C215
						End if 
					End for 
				End if 
				
				LAY_bo_FiltersActive:=True:C214
				Lay_bo_UpdateFilters:=True:C214
				
			: ($_l_SelectedColumn=Size of array:C274($_aptr_ColumnVars))
				If (Size of array:C274($_ptr_ExcludeArray->)>=1)
					$_bo_isOn:=$_ptr_ExcludeArray->{1}
					For ($_l_index; 1; Size of array:C274($_ptr_ExcludeArray->))
						If ($_bo_isOn)
							$_ptr_IncludeArray->{$_l_index}:=True:C214
							$_ptr_ExcludeArray->{$_l_index}:=False:C215
						Else 
							$_ptr_IncludeArray->{$_l_index}:=False:C215
							$_ptr_ExcludeArray->{$_l_index}:=True:C214
						End if 
					End for 
				End if 
				
				LAY_bo_FiltersActive:=True:C214
				Lay_bo_UpdateFilters:=True:C214
				
		End case 
		If (Lay_bo_UpdateFilters)
			Lay_bo_UpdateFilters:=False:C215
			SEL_CurrentRecordSelection
			$_ptr_CurrentTableForm:=Table:C252(DB_l_CurrentDisplayedForm)
			SRCH_Applyfilterstoselection($_ptr_CurrentTableForm)
			DB_SetWindowTitle(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		End if 
	: ($_l_FormEvent=On Data Change:K2:15)
		$_ptr_FocusObject:=Focus object:C278
		LISTBOX GET ARRAYS:C832($_ptr_FocusObject->; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVars; $_aptr_HeaderVars; $_abo_ColumnVisible; $_aptr_ColumnStyles)
		LISTBOX GET CELL POSITION:C971($_ptr_FocusObject->; $_l_SelectedColumn; $_l_SelectedRow)
		$_ptr_IncludeArray:=$_aptr_ColumnVars{Size of array:C274($_aptr_ColumnVars)-1}
		$_ptr_ExcludeArray:=$_aptr_ColumnVars{Size of array:C274($_aptr_ColumnVars)}
		
		
		$_bo_update:=False:C215
		Case of 
			: ($_l_SelectedColumn=(Size of array:C274($_aptr_ColumnVars)-1))
				If ($_ptr_IncludeArray->{$_l_SelectedRow})
					$_ptr_ExcludeArray->{$_l_SelectedRow}:=False:C215
				Else 
					$_ptr_ExcludeArray->{$_l_SelectedRow}:=True:C214
				End if 
				$_bo_update:=True:C214
			: ($_l_SelectedColumn=(Size of array:C274($_aptr_ColumnVars)))
				If ($_ptr_ExcludeArray->{$_l_SelectedRow})
					$_ptr_IncludeArray->{$_l_SelectedRow}:=False:C215
				Else 
					$_ptr_IncludeArray->{$_l_SelectedRow}:=True:C214
				End if 
				$_bo_update:=True:C214
		End case 
		If ($_bo_update)
			LAY_bo_FiltersActive:=True:C214
			Lay_bo_UpdateFilters:=True:C214
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [projectForm]/DB_OutputForm/oFilterLBObject"; $_t_oldMethodName)
