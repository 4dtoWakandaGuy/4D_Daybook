//%attributes = {}
If (False:C215)
	//Project Method Name: LBi_AreaSort
	//------------------ Method Notes ------------------
	//------------------ Revision Control ----------------
	//Date Created:   20/05/2010 11:55
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>FS_al_FormSortDirection;0)
	//ARRAY LONGINT(<>FS_al_FormSortFieldNum;0)
	//ARRAY LONGINT(<>FS_al_FormSortTableNum;0)
	//ARRAY TEXT(<>FS_at_FormReference;0)
	//ARRAY TEXT(<>FS_at_FormSortvariable;0)
	C_BOOLEAN:C305(<>FS_bo_FSettingsLoaded; $_bo_isSet; $_bo_ProcessVisible; $_bo_SetSort; $4)
	C_LONGINT:C283(<>FS_l_SortFieldNUM; $_l_AreaType; $_l_CurrentSortColumn; $_l_FieldNumber; $_l_FormRow; $_l_Index; $_l_KeyTableNumber; $_l_NumberofColumns; $_l_ProcessState; $_l_ProcessTime; $0)
	C_LONGINT:C283($2; FS_l_FieldType; FS_l_SortDirection; FS_l_SortFieldNUM; FS_l_SortTableNUM)
	C_POINTER:C301($_ptr_areaTypeVariable; $_ptr_ArrayFieldPointers; $_ptr_Field; $_Ptr_ListBox; $_Ptr_ListBoxVar; $_ptr_Table; $3)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_AreaName; $_t_CurrentOutputform; $_t_oldMethodName; $_t_processName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LBi_AreaSort")
// pass this method the current form reference and it will get and sort the data
//$2=POINTER TO TABLE

$_t_AreaName:=$1
If (Count parameters:C259>=4)
	$_bo_SetSort:=$4
Else 
	$_bo_SetSort:=True:C214
End if 
If (Count parameters:C259<2)
	
	$_l_KeyTableNumber:=Table:C252(Current default table:C363)
Else 
	$_Ptr_ListBoxVar:=$3
	If ($2>=0)
		$_l_KeyTableNumber:=$2
	Else 
		$_l_KeyTableNumber:=Abs:C99($2)
	End if 
End if 

If ($_l_KeyTableNumber=Table:C252(->[INVOICES:39]))
	PROCESS PROPERTIES:C336(Current process:C322; $_t_processName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible)
	$_t_AreaName:=$_t_AreaName+" "+$_t_processName
	If (Length:C16($_t_AreaName)>55)
		$_t_AreaName:=Substring:C12($_t_AreaName; 1; 55)
	End if 
End if 

If (Not:C34(<>FS_bo_FSettingsLoaded))
	FSettings_loadPreferences(<>PER_t_CurrentUserInitials)
End if 
If (<>FS_bo_FSettingsLoaded)
	
	If (FS_l_SortTableNUM=0)
		//coming into the form -read from the arrays
		While (Semaphore:C143("$WriteFormsortPref"))
			DelayTicks(2)
		End while 
		$_l_FormRow:=Find in array:C230(<>FS_at_FormReference; $_t_AreaName)
		If ($_l_FormRow>0)
			FS_l_SortDirection:=<>FS_al_FormSortDirection{$_l_FormRow}
			If (FS_l_SortDirection>1)
				FS_l_SortDirection:=1
			End if 
			If (FS_l_SortDirection<-1)
				FS_l_SortDirection:=-1
			End if 
			FS_t_SortVariableName:=<>FS_at_FormSortvariable{$_l_FormRow}
			FS_l_SortFieldNUM:=<>FS_al_FormSortFieldNum{$_l_FormRow}  //Longint
			//NOTE THIS IS THE FIELD NOT THE COLUMN
			If ($_bo_SetSort)
				If (FS_l_SortFieldNUM#0)
					FS_l_SortTableNUM:=<>FS_al_FormSortTableNum{$_l_FormRow}
					$_ptr_ArrayFieldPointers:=$_Ptr_ListBoxVar->{2}
					If (Size of array:C274($_Ptr_ListBoxVar->)>=19)
						$_ptr_areaTypeVariable:=$_Ptr_ListBoxVar->{19}
						$_l_AreaType:=$_ptr_areaTypeVariable->
					Else 
						$_l_AreaType:=1
						$_ptr_areaTypeVariable:=->$_l_AreaType
					End if 
					$_l_NumberofColumns:=Size of array:C274($_ptr_ArrayFieldPointers->)
					$_Ptr_ListBox:=$_Ptr_ListBoxVar->{1}
					$_bo_isSet:=False:C215
					For ($_l_Index; 1; $_l_NumberofColumns)
						
						If (Abs:C99(FS_l_SortFieldNUM)=Field:C253($_ptr_ArrayFieldPointers->{$_l_Index})) & (Table:C252($_ptr_ArrayFieldPointers->{$_l_Index})=FS_l_SortTableNUM)
							If (FS_l_SortDirection>=0)
								//AL_SetSort NG TODO:($_Ptr_ListBox->;$_l_Index)
								If ($_ptr_areaTypeVariable-><3)
									LISTBOX SORT COLUMNS:C916($_Ptr_ListBox->; $_l_Index; >)
								Else 
									$_ptr_Table:=Table:C252(<>FS_al_FormSortTableNum{$_l_FormRow})
									$_ptr_Field:=Field:C253(<>FS_al_FormSortTableNum{$_l_FormRow}; Abs:C99(FS_l_SortFieldNUM))
									ORDER BY:C49($_ptr_Table->; $_ptr_Field->; >)
								End if 
							Else 
								If ($_ptr_areaTypeVariable-><3)
									//AL_SetSort NG TODO:($_Ptr_ListBox->;-($_l_Index))
									LISTBOX SORT COLUMNS:C916($_Ptr_ListBox->; $_l_Index; <)
								Else 
									$_ptr_Table:=Table:C252(<>FS_al_FormSortTableNum{$_l_FormRow})
									$_ptr_Field:=Field:C253(<>FS_al_FormSortTableNum{$_l_FormRow}; Abs:C99(FS_l_SortFieldNUM))
									
									ORDER BY:C49($_ptr_Table->; $_ptr_Field->; <)
								End if 
							End if 
							$_bo_isSet:=True:C214
							$_l_Index:=$_l_NumberofColumns
						End if 
					End for 
					If (Not:C34($_bo_isSet))
						//AL_SetSort NG TODO:($_Ptr_ListBox->;0)
						LISTBOX SORT COLUMNS:C916($_Ptr_ListBox->; 0; >)
					End if 
					
				Else 
					$_Ptr_ListBox:=$_Ptr_ListBoxVar->{1}
					
					//Sort field is actually a column(subtable)
					If (FS_l_SortDirection>=0)
						$_l_CurrentSortColumn:=Abs:C99(FS_l_SortFieldNUM)
						//AL_SetSort NG TODO:($_Ptr_ListBox->;Abs(FS_l_SortFieldNUM))
						
						If ($_ptr_areaTypeVariable-><3)
							LISTBOX SORT COLUMNS:C916($_Ptr_ListBox->; Abs:C99(FS_l_SortFieldNUM); >)
						Else 
							$_l_CurrentSortColumn:=Abs:C99(FS_l_SortFieldNUM)
							$_l_FieldNumber:=Field:C253($_ptr_ArrayFieldPointers->{$_l_CurrentSortColumn})
							$_ptr_Table:=Table:C252(<>FS_al_FormSortTableNum{$_l_FormRow})
							$_ptr_Field:=Field:C253(<>FS_al_FormSortTableNum{$_l_FormRow}; $_l_FieldNumber)
							ORDER BY:C49($_ptr_Table->; $_ptr_Field->; >)
						End if 
					Else 
						//AL_SetSort NG TODO:($_Ptr_ListBox->;-(Abs(FS_l_SortFieldNUM)))
						
						If ($_ptr_areaTypeVariable-><3)
							LISTBOX SORT COLUMNS:C916($_Ptr_ListBox->; Abs:C99(FS_l_SortFieldNUM); <)
						Else 
							$_l_CurrentSortColumn:=Abs:C99(FS_l_SortFieldNUM)
							$_l_FieldNumber:=Field:C253($_ptr_ArrayFieldPointers->{$_l_CurrentSortColumn})
							$_ptr_Table:=Table:C252(<>FS_al_FormSortTableNum{$_l_FormRow})
							$_ptr_Field:=Field:C253(<>FS_al_FormSortTableNum{$_l_FormRow}; $_l_FieldNumber)
							ORDER BY:C49($_ptr_Table->; $_ptr_Field->; <)
						End if 
					End if 
				End if 
				
			Else 
				$0:=Abs:C99(FS_l_SortFieldNUM)
			End if 
		End if 
		CLEAR SEMAPHORE:C144("$WriteFormsortPref")
	Else 
		//read from the variables
		$_l_FormRow:=Find in array:C230(<>FS_at_FormReference; $_t_AreaName)
		
		If ($_l_FormRow>0)
			FS_t_SortVariableName:=<>FS_at_FormSortvariable{$_l_FormRow}
			FS_l_SortFieldNUM:=<>FS_al_FormSortFieldNum{$_l_FormRow}  //Longint
			FS_l_SortDirection:=<>FS_al_FormSortDirection{$_l_FormRow}
			If ($_bo_SetSort)
				If (Abs:C99(FS_l_SortFieldNUM)>=0)
					FS_l_SortTableNUM:=<>FS_al_FormSortTableNum{$_l_FormRow}
					If (Not:C34(Is nil pointer:C315($_Ptr_ListBoxVar)))
						
						If (Size of array:C274($_Ptr_ListBoxVar->)>=19)
							//$_Ptr_ListBoxVar:=$_1
							$_ptr_ArrayFieldPointers:=$_Ptr_ListBoxVar->{2}
							$_l_NumberofColumns:=Size of array:C274($_ptr_ArrayFieldPointers->)
							$_Ptr_ListBox:=$_Ptr_ListBoxVar->{1}
							If (Size of array:C274($_Ptr_ListBoxVar->)>=19)
								$_ptr_areaTypeVariable:=$_Ptr_ListBoxVar->{19}
							Else 
								$_l_AreaType:=1
								$_ptr_areaTypeVariable:=->$_l_AreaType
							End if 
							$_bo_isSet:=False:C215
							For ($_l_Index; 1; $_l_NumberofColumns)
								
								If (Abs:C99(FS_l_SortFieldNUM)=Field:C253($_ptr_ArrayFieldPointers->{$_l_Index})) & (Table:C252($_ptr_ArrayFieldPointers->{$_l_Index})=FS_l_SortTableNUM)
									If (FS_l_SortDirection>=0)
										
										If ($_ptr_areaTypeVariable-><3)
											LISTBOX SORT COLUMNS:C916($_Ptr_ListBox->; $_l_Index; >)
										Else 
											$_ptr_Table:=Table:C252(FS_l_SortTableNUM)
											$_ptr_Field:=Field:C253(FS_l_SortTableNUM; Abs:C99(FS_l_SortFieldNUM))
											ORDER BY:C49($_ptr_Table->; $_ptr_Field->; >)
										End if 
									Else 
										//AL_SetSort NG TODO:($_Ptr_ListBox->;-$_l_Index)
										
										If ($_ptr_areaTypeVariable-><3)
											LISTBOX SORT COLUMNS:C916($_Ptr_ListBox->; $_l_Index; <)
										Else 
											$_ptr_Table:=Table:C252(FS_l_SortTableNUM)
											$_ptr_Field:=Field:C253(FS_l_SortTableNUM; Abs:C99(FS_l_SortFieldNUM))
											ORDER BY:C49($_ptr_Table->; $_ptr_Field->; <)
										End if 
									End if 
									$_bo_isSet:=True:C214
									$_l_Index:=$_l_NumberofColumns
								End if 
							End for 
							
							
							If (Not:C34($_bo_isSet))
								//AL_SetSort NG TODO:($_Ptr_ListBox->;0)
								LISTBOX SORT COLUMNS:C916($_Ptr_ListBox->; 0; <)
							End if 
						End if 
					End if 
				Else 
					//Sort field is actually a column(subtable)
					
					$_Ptr_ListBox:=$_Ptr_ListBoxVar->{1}
					If (FS_l_SortDirection>=0)
						//AL_SetSort NG TODO:($_Ptr_ListBox->;Abs(FS_l_SortFieldNUM))
						LISTBOX SORT COLUMNS:C916($_Ptr_ListBox->; Abs:C99(FS_l_SortFieldNUM); >)
						If ($_ptr_areaTypeVariable-><3)
							LISTBOX SORT COLUMNS:C916($_Ptr_ListBox->; Abs:C99(FS_l_SortFieldNUM); >)
						Else 
							$_l_CurrentSortColumn:=Abs:C99(FS_l_SortFieldNUM)
							$_l_FieldNumber:=Field:C253($_ptr_ArrayFieldPointers->{$_l_CurrentSortColumn})
							$_ptr_Table:=Table:C252(FS_l_SortTableNUM)
							$_ptr_Field:=Field:C253(FS_l_SortTableNUM; $_l_FieldNumber)
							ORDER BY:C49($_ptr_Table->; $_ptr_Field->; >)
						End if 
					Else 
						//AL_SetSort NG TODO:($_Ptr_ListBox->;-(Abs(FS_l_SortFieldNUM)))
						If ($_ptr_areaTypeVariable-><3)
							LISTBOX SORT COLUMNS:C916($_Ptr_ListBox->; Abs:C99(FS_l_SortFieldNUM); <)
						Else 
							$_l_CurrentSortColumn:=Abs:C99(FS_l_SortFieldNUM)
							$_l_FieldNumber:=Field:C253($_ptr_ArrayFieldPointers->{$_l_CurrentSortColumn})
							$_ptr_Table:=Table:C252(FS_l_SortTableNUM)
							$_ptr_Field:=Field:C253(FS_l_SortTableNUM; $_l_FieldNumber)
							ORDER BY:C49($_ptr_Table->; $_ptr_Field->; <)
						End if 
					End if 
				End if 
				
			Else 
				$0:=Abs:C99(FS_l_SortFieldNUM)
			End if 
		Else 
			$_Ptr_ListBox:=$_Ptr_ListBoxVar->{1}
			//AL_SetSort NG TODO:($_Ptr_ListBox->;0)
			LISTBOX SORT COLUMNS:C916($_Ptr_ListBox->; 0; >)
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("LBi_AreaSort"; $_t_oldMethodName)