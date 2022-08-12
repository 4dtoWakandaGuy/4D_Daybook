If (False:C215)
	//object Method Name: Object Name:      Balance_Filters.oAccCur
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
	//ARRAY BOOLEAN(CUR_abo_Exclude;0)
	//ARRAY BOOLEAN(CUR_abo_Include;0)
	//ARRAY BOOLEAN(CUR_lb_CurCodes;0)
	C_BOOLEAN:C305($_bo_isOn; $_bo_Update; LAY_bo_FiltersActive; Lay_bo_UpdateFilters)
	C_LONGINT:C283($_l_Event; $_l_FieldNumber; $_l_Index; $_l_SelectedColumn; $_l_SelectedRow; $_l_TableNumber)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ DB_OutputForm.oAccCur"; Form event code:C388)
$_l_Event:=Form event code:C388
Case of 
	: ($_l_Event=On Header Click:K2:40)
		
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_SelectedRow:=Self:C308->
		$_l_SelectedColumn:=LB_GetColumn(->CUR_lb_CurCodes; ""; $_t_VariableName)
		Case of 
				
			: ($_l_SelectedColumn=3)
				If (Size of array:C274(CUR_abo_Include)>=1)
					$_bo_isOn:=CUR_abo_Include{1}
					For ($_l_Index; 1; Size of array:C274(CUR_abo_Include))
						If ($_bo_isOn)
							CUR_abo_Include{$_l_Index}:=False:C215
							CUR_abo_Exclude{$_l_Index}:=True:C214
						Else 
							CUR_abo_Include{$_l_Index}:=True:C214
							CUR_abo_Exclude{$_l_Index}:=False:C215
						End if 
					End for 
				End if 
				
				LAY_bo_FiltersActive:=True:C214
				Lay_bo_UpdateFilters:=True:C214
				
			: ($_l_SelectedColumn=4)
				If (Size of array:C274(CUR_abo_Include)>=1)
					$_bo_isOn:=CUR_abo_Exclude{1}
					For ($_l_Index; 1; Size of array:C274(CUR_abo_Include))
						If ($_bo_isOn)
							CUR_abo_Include{$_l_Index}:=True:C214
							CUR_abo_Exclude{$_l_Index}:=False:C215
						Else 
							CUR_abo_Include{$_l_Index}:=False:C215
							CUR_abo_Exclude{$_l_Index}:=True:C214
						End if 
					End for 
				End if 
				
				LAY_bo_FiltersActive:=True:C214
				Lay_bo_UpdateFilters:=True:C214
				
		End case 
		If (Lay_bo_UpdateFilters)
			//Lay_bo_UpdateFilters:=False
			//SEL_CurrentRecordSelection 
			//$_ptr_Table:=Table(DB_l_CurrentDisplayedForm)
			//SRCH_Applyfilterstoselection ($_ptr_Table)
			//DB_SetWindowTitle (DB_l_CurrentDisplayedForm;DB_t_CurrentContext)
		End if 
		
	: ($_l_Event=On Data Change:K2:15)
		LISTBOX GET CELL POSITION:C971(CUR_lb_CurCodes; $_l_SelectedColumn; $_l_SelectedRow)
		$_bo_Update:=False:C215
		Case of 
			: ($_l_SelectedColumn=3)
				If (CUR_abo_Include{$_l_SelectedRow})
					CUR_abo_Exclude{$_l_SelectedRow}:=False:C215
				Else 
					CUR_abo_Exclude{$_l_SelectedRow}:=True:C214
				End if 
				$_bo_Update:=True:C214
			: ($_l_SelectedColumn=4)
				If (CUR_abo_Exclude{$_l_SelectedRow})
					CUR_abo_Include{$_l_SelectedRow}:=False:C215
				Else 
					CUR_abo_Include{$_l_SelectedRow}:=False:C215
				End if 
				$_bo_Update:=True:C214
		End case 
		If ($_bo_Update)
			LAY_bo_FiltersActive:=True:C214
			Lay_bo_UpdateFilters:=True:C214
		End if 
End case 
ERR_MethodTrackerReturn("OBJ DB_OutputForm.oAccCur"; $_t_oldMethodName)
