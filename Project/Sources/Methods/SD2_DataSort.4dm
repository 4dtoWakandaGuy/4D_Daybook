//%attributes = {}

If (False:C215)
	//Project Method Name:      SD2_DataSort
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
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
	C_LONGINT:C283($_l_ColumnsIndex; $_l_FormRow; $_l_ProcessState; $_l_ProcessTime; $_l_SizeofArray; $_l_Table; $0; $2; FS_l_SortDirection; FS_l_SortFieldNUM; FS_l_SortTableNUM)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_ListboxArea; $3)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_AreaName; $_t_oldMethodName; $_t_processName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_DataSort")

//The method is used to sort the data using the list box preference...but it sorts the data not the arrays.it is needed because i want to limit the number of records displayed at any-one time
//so i need to set up  selections-they need to be in the right order
//NG 20/7/06 this method is a replacement for ALAreaSort
//NG this method will sort the area list arrays. It is created so that any off screen values also get sorted.
//NG this method will sort the area list arrays. It is created so that any off screen values also get sorted.
$_t_oldMethodName:=ERR_MethodTracker("SD2_DataSort")
// pass this method the current form reference and it will get and sort the data
//$2=POINTER TO TABLE
If (Count parameters:C259>=1)
	$_t_AreaName:=$1
	If (Count parameters:C259>=4)
		$_bo_SetSort:=$4
	Else 
		$_bo_SetSort:=True:C214
	End if 
	If (Count parameters:C259<2)
		
		$_l_Table:=Table:C252(Current default table:C363)
	Else 
		
		If ($2>=0)
			$_l_Table:=$2
		Else 
			$_l_Table:=Abs:C99($2)
		End if 
	End if 
	
	If ($_l_Table=Table:C252(->[INVOICES:39]))
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
					If (FS_l_SortFieldNUM>=0)
						FS_l_SortTableNUM:=<>FS_al_FormSortTableNum{$_l_FormRow}
						$_ptr_ArrayFieldPointers:=$3->{2}
						$_l_SizeofArray:=Size of array:C274($_ptr_ArrayFieldPointers->)
						$_ptr_ListboxArea:=$3->{1}
						$_bo_isSet:=False:C215
						For ($_l_ColumnsIndex; 1; $_l_SizeofArray)
							
							If (FS_l_SortFieldNUM=Field:C253($_ptr_ArrayFieldPointers->{$_l_ColumnsIndex})) & (Table:C252($_ptr_ArrayFieldPointers->{$_l_ColumnsIndex})=FS_l_SortTableNUM)
								If (FS_l_SortDirection>=0)
									//AL_SetSort NG TODO:($_ptr_ListboxArea->;$_l_ColumnsIndex)
									LISTBOX SORT COLUMNS:C916($_ptr_ListboxArea->; $_l_ColumnsIndex; >)
								Else 
									//AL_SetSort NG TODO:($_ptr_ListboxArea->;-($_l_ColumnsIndex))
									LISTBOX SORT COLUMNS:C916($_ptr_ListboxArea->; $_l_ColumnsIndex; <)
								End if 
								$_bo_isSet:=True:C214
								$_l_ColumnsIndex:=999999
							End if 
						End for 
						If (Not:C34($_bo_isSet))
							//AL_SetSort NG TODO:($_ptr_ListboxArea->;0)
							LISTBOX SORT COLUMNS:C916($_ptr_ListboxArea->; 0; >)
						End if 
						
					Else 
						$_ptr_ListboxArea:=$3->{1}
						
						//Sort field is actually a column(subtable)
						If (FS_l_SortDirection>=0)
							//AL_SetSort NG TODO:($_ptr_ListboxArea->;Abs(FS_l_SortFieldNUM))
							LISTBOX SORT COLUMNS:C916($_ptr_ListboxArea->; Abs:C99(FS_l_SortFieldNUM); >)
						Else 
							//AL_SetSort NG TODO:($_ptr_ListboxArea->;-(Abs(FS_l_SortFieldNUM)))
							LISTBOX SORT COLUMNS:C916($_ptr_ListboxArea->; Abs:C99(FS_l_SortFieldNUM); <)
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
					If (FS_l_SortFieldNUM>=0)
						FS_l_SortTableNUM:=<>FS_al_FormSortTableNum{$_l_FormRow}
						$_ptr_ArrayFieldPointers:=$3->{2}
						$_l_SizeofArray:=Size of array:C274($_ptr_ArrayFieldPointers->)
						$_ptr_ListboxArea:=$3->{1}
						$_bo_isSet:=False:C215
						For ($_l_ColumnsIndex; 1; $_l_SizeofArray)
							
							If (FS_l_SortFieldNUM=Field:C253($_ptr_ArrayFieldPointers->{$_l_ColumnsIndex})) & (Table:C252($_ptr_ArrayFieldPointers->{$_l_ColumnsIndex})=FS_l_SortTableNUM)
								If (FS_l_SortDirection>=0)
									//AL_SetSort NG TODO:($_ptr_ListboxArea->;$_l_ColumnsIndex)
									LISTBOX SORT COLUMNS:C916($_ptr_ListboxArea->; $_l_ColumnsIndex; >)
								Else 
									//AL_SetSort NG TODO:($_ptr_ListboxArea->;-$_l_ColumnsIndex)
									LISTBOX SORT COLUMNS:C916($_ptr_ListboxArea->; $_l_ColumnsIndex; <)
								End if 
								$_bo_isSet:=True:C214
								$_l_ColumnsIndex:=999999
							End if 
						End for 
						If (Not:C34($_bo_isSet))
							//AL_SetSort NG TODO:($_ptr_ListboxArea->;0)
							LISTBOX SORT COLUMNS:C916($_ptr_ListboxArea->; 0; <)
						End if 
					Else 
						//Sort field is actually a column(subtable)
						
						$_ptr_ListboxArea:=$3->{1}
						If (FS_l_SortDirection>=0)
							//AL_SetSort NG TODO:($_ptr_ListboxArea->;Abs(FS_l_SortFieldNUM))
							LISTBOX SORT COLUMNS:C916($_ptr_ListboxArea->; Abs:C99(FS_l_SortFieldNUM); >)
						Else 
							//AL_SetSort NG TODO:($_ptr_ListboxArea->;-(Abs(FS_l_SortFieldNUM)))
							LISTBOX SORT COLUMNS:C916($_ptr_ListboxArea->; Abs:C99(FS_l_SortFieldNUM); <)
						End if 
					End if 
					
				Else 
					$0:=Abs:C99(FS_l_SortFieldNUM)
				End if 
			Else 
				$_ptr_ListboxArea:=$3->{1}
				//AL_SetSort NG TODO:($_ptr_ListboxArea->;0)
				LISTBOX SORT COLUMNS:C916($_ptr_ListboxArea->; 0; >)
			End if 
		End if 
	End if 
	
End if 
ERR_MethodTrackerReturn("SD2_DataSort"; $_t_oldMethodName)
