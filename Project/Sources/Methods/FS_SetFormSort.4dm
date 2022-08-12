//%attributes = {}
If (False:C215)
	//Project Method Name:      FS_SetFormSort
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 03/10/2012 18:59:59If (False)// ----------------------------------------------------
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
	//ARRAY TEXT(<>FS_at_FormSortTextLabelName;0)
	//ARRAY TEXT(<>FS_at_FormSortvariable;0)
	//ARRAY TEXT(<>FS_at_FormSortVarLabelName;0)
	C_BOOLEAN:C305(<>FS_bo_FSettingsLoaded; $_bo_ProcessVisible)
	C_LONGINT:C283(<>FS_l_SortFieldNUM; $_l_CurrentSortTable; $_l_FormRow; $_l_ProcessState; $_l_ProcessTime; $_l_SortFIeldNUM; $2; FS_l_SortDirection; FS_l_SortFieldNUM; FS_l_SortTableNUM)
	C_POINTER:C301($_ptr_SortField; $_ptr_SortVarName; $_ptr_Table)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_CurrentOutputform; $_t_FormName; $_t_oldMethodName; $_t_processName; $1; FS_t_SortFieldTXT; FS_t_SortVariableName; WT_t_SortFieldVARNAME)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FS_SetFormSort")
// pass this method the current form reference and it will get and sort the data
//$2=POINTER TO TABLE
$_t_FormName:=$1
If (Count parameters:C259<2)
	
	$_l_CurrentSortTable:=0  //Table(Current default table)
Else 
	$_l_CurrentSortTable:=$2
End if 

If ($_l_CurrentSortTable=Table:C252(->[INVOICES:39]))
	PROCESS PROPERTIES:C336(Current process:C322; $_t_processName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible)
	$_t_FormName:=$_t_FormName+" "+$_t_processName
	If (Length:C16($_t_FormName)>55)
		$_t_FormName:=Substring:C12($_t_FormName; 1; 55)
	End if 
End if 
If (Not:C34(<>FS_bo_FSettingsLoaded))
	FSettings_loadPreferences(<>PER_t_CurrentUserInitials)
End if 

If (<>FS_bo_FSettingsLoaded)
	While (Semaphore:C143("$WriteFormsortPref"))  //To make sure it does not change during the read
		DelayTicks(2)
	End while 
	If (FS_l_SortTableNUM=0)
		//coming into the form -read from the arrays
		
		$_l_FormRow:=Find in array:C230(<>FS_at_FormReference; $_t_FormName)
		If ($_l_FormRow>0)
			FS_l_SortDirection:=<>FS_al_FormSortDirection{$_l_FormRow}
			//BECAUSE THE SORT THING ALWAY SWAPS THIS
			//I HAVE TO SWAP IT HERE
			//FS_l_SortDirection:=Abs(FS_l_SortDirection-1)
			If (FS_l_SortDirection>1)
				FS_l_SortDirection:=1
			End if 
			If (FS_l_SortDirection<-1)
				FS_l_SortDirection:=-1
			End if 
			
			FS_t_SortVariableName:=<>FS_at_FormSortvariable{$_l_FormRow}
			FS_l_SortFieldNUM:=0  //Longint
			$_l_SortFIeldNUM:=<>FS_al_FormSortFieldNum{$_l_FormRow}  //Longint
			//NOTE THIS IS THE FIELD NOT THE COLUMN
			FS_l_SortTableNUM:=<>FS_al_FormSortTableNum{$_l_FormRow}
			If (<>FS_at_FormSortTextLabelName{$_l_FormRow}#"")
				FS_t_SortFieldTXT:=<>FS_at_FormSortTextLabelName{$_l_FormRow}
				If ($_l_SortFIeldNUM>0)
					If (FS_l_SortTableNUM>0)
						If (FS_l_SortTableNUM<Get last table number:C254)
							If (Is table number valid:C999(FS_l_SortTableNUM))
								$_ptr_Table:=Table:C252(FS_l_SortTableNUM)
								If ($_l_SortFIeldNUM<Get last field number:C255(FS_l_SortTableNUM))
									If (Is field number valid:C1000(FS_l_SortTableNUM; $_l_SortFIeldNUM))
										$_ptr_SortField:=Field:C253(FS_l_SortTableNUM; $_l_SortFIeldNUM)
										WT_SORT_TABLE_3($_ptr_Table; FS_t_SortFieldTXT; $_ptr_SortField; False:C215)
									End if 
								End if 
							End if 
							
						End if 
					End if 
				Else 
					If (FS_l_SortTableNUM>0) & (FS_t_SortVariableName#"")
						
						
						
						If (FS_l_SortTableNUM<Get last table number:C254)
							If (Is table number valid:C999(FS_l_SortTableNUM))
								$_ptr_Table:=Table:C252(FS_l_SortTableNUM)
								If ($_l_SortFIeldNUM<Get last field number:C255(FS_l_SortTableNUM))
									$_ptr_SortField:=Get pointer:C304(FS_t_SortVariableName)
									WT_SORT_TABLE_3($_ptr_Table; FS_t_SortFieldTXT; $_ptr_SortField)
								End if 
							End if 
						End if 
						
					End if 
					
				End if 
			Else 
				WT_t_SortFieldVARNAME:=<>FS_at_FormSortVarLabelName{$_l_FormRow}
				$_ptr_SortVarName:=Get pointer:C304(WT_t_SortFieldVARNAME)
				If (WT_t_SortFieldVARNAME#"")
					If (Not:C34(Undefined:C82($_ptr_SortVarName->)))
						If ($_l_SortFIeldNUM>0)
							If (FS_l_SortTableNUM>0)
								
								If (FS_l_SortTableNUM<Get last table number:C254)
									$_ptr_Table:=Table:C252(FS_l_SortTableNUM)
									If ($_l_SortFIeldNUM<Get last field number:C255(FS_l_SortTableNUM))
										$_ptr_SortField:=Field:C253(FS_l_SortTableNUM; $_l_SortFIeldNUM)
										WT_SORT_TABLE_2($_ptr_Table; $_ptr_SortVarName; $_ptr_SortField)
									End if 
									
								End if 
								
							End if 
						Else 
							If (FS_l_SortTableNUM>0) & (FS_t_SortVariableName#"")
								$_ptr_Table:=Table:C252(FS_l_SortTableNUM)
								$_ptr_SortField:=Get pointer:C304(FS_t_SortVariableName)
								If (Not:C34(Undefined:C82($_ptr_SortVarName->)))
									WT_SORT_TABLE_2($_ptr_Table; $_ptr_SortVarName; $_ptr_SortField)
								End if 
							End if 
							
						End if 
					End if 
				End if 
			End if 
		End if 
	Else 
		//read from the variables
		$_l_FormRow:=Find in array:C230(<>FS_at_FormReference; $_t_FormName)
		If ($_l_FormRow>0)
			//FS_l_SortDirection:=Abs(FS_l_SortDirection-1)
			If (FS_t_SortFieldTXT#"")
				If (FS_l_SortFieldNUM>0)
					If (FS_l_SortTableNUM>0)
						$_ptr_Table:=Table:C252(FS_l_SortTableNUM)
						$_ptr_SortField:=Field:C253(FS_l_SortTableNUM; FS_l_SortFieldNUM)
						WT_SORT_TABLE_3($_ptr_Table; FS_t_SortFieldTXT; $_ptr_SortField; False:C215)
					End if 
				Else 
					If (FS_l_SortTableNUM>0) & (FS_t_SortVariableName#"")
						$_ptr_Table:=Table:C252(FS_l_SortTableNUM)
						$_ptr_SortField:=Get pointer:C304(FS_t_SortVariableName)
						WT_SORT_TABLE_3($_ptr_Table; FS_t_SortFieldTXT; $_ptr_SortField; False:C215)
					End if 
				End if 
			Else 
				If (WT_t_SortFieldVARNAME#"")
					$_ptr_SortVarName:=Get pointer:C304(WT_t_SortFieldVARNAME)
					If (FS_l_SortFieldNUM>0)
						If (FS_l_SortTableNUM>0)
							$_ptr_Table:=Table:C252(FS_l_SortTableNUM)
							$_ptr_SortField:=Field:C253(FS_l_SortTableNUM; FS_l_SortFieldNUM)
							WT_SORT_TABLE_2($_ptr_Table; $_ptr_SortVarName; $_ptr_SortField; False:C215)
						End if 
						
					Else 
						If (FS_l_SortTableNUM>0) & (FS_t_SortVariableName#"")
							$_ptr_Table:=Table:C252(FS_l_SortTableNUM)
							$_ptr_SortField:=Get pointer:C304(FS_t_SortVariableName)
							WT_SORT_TABLE_2($_ptr_Table; $_ptr_SortVarName; $_ptr_SortField; False:C215)
						End if 
					End if 
				End if 
			End if 
		End if 
	End if 
	CLEAR SEMAPHORE:C144("$WriteFormsortPref")
	
End if 
ERR_MethodTrackerReturn("FS_SetFormSort"; $_t_oldMethodName)