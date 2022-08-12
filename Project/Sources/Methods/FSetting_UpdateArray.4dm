//%attributes = {}
If (False:C215)
	//Project Method Name:      FSetting_UpdateArray
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/04/2010 18:11
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
	C_LONGINT:C283(<>l_FS_FieldSortChangedAlert; <>WT_SortFieldName_2; $_l_FormReferenceRow; $_l_Process; $_l_ProcessState; $_l_ProcessTime; $2; $3; $4)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_Alert; $_t_CurrentOutputform; $_t_FormName; $_t_oldMethodName; $_t_processName; $1; $5; $6; $7; FS_t_SortFieldTXT)
	C_TEXT:C284(WT_t_SortFieldVARNAME)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FSetting_UpdateArray")
//this method will store the variables back into the array
//pass this method the following
//$1;-the form reference
//$2-The sort direction
//$3-The sort field num
//$4-the sort table num
//$5=the sort varaible(if $3=0)
//$6=The sort label (type text) name
//$7=The sort label (variable) name(if $5="")
If (Not:C34(<>FS_bo_FSettingsLoaded))
	FSettings_loadPreferences(<>PER_t_CurrentUserInitials)
End if 
If (<>FS_bo_FSettingsLoaded)
	$_t_FormName:=$1
	If ($4=Table:C252(->[INVOICES:39])) & (False:C215)
		//this allows for different sort prefs for different views
		//these use the same form but are different processes
		PROCESS PROPERTIES:C336(Current process:C322; $_t_processName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible)
		$_t_FormName:=$_t_FormName+" "+$_t_processName
		If (Length:C16($_t_FormName)>55)
			$_t_FormName:=Substring:C12($_t_FormName; 1; 55)
		End if 
		
	End if 
	While (Semaphore:C143("$WriteFormsortPref"))
		DelayTicks(2)
	End while 
	$_l_FormReferenceRow:=Find in array:C230(<>FS_at_FormReference; $_t_FormName)
	If ($_l_FormReferenceRow>0)
		$_t_Alert:=""
		If ($2#<>FS_al_FormSortDirection{$_l_FormReferenceRow})
			$_t_Alert:="You have changed the sort direction"
			If ($3#<>FS_al_FormSortFieldNum{$_l_FormReferenceRow}) | ($5#<>FS_at_FormSortvariable{$_l_FormReferenceRow})
				$_t_Alert:=$_t_Alert+" and the sort field"
			Else 
				If ($3=0) & ($5="")
					$_t_Alert:=""
				End if 
				
			End if 
		Else 
			If ($5#<>FS_at_FormSortvariable{$_l_FormReferenceRow}) | ($3#<>FS_al_FormSortFieldNum{$_l_FormReferenceRow})
				$_t_Alert:=$_t_Alert+"You have changed the sort field"
				If ($3=0) & ($5="")
					$_t_Alert:=""
				End if 
				
			End if 
			
		End if 
		If (Gen_Option)
			<>l_FS_FieldSortChangedAlert:=0
		End if 
		If ($_t_Alert#"")
			
			If (<>l_FS_FieldSortChangedAlert=0)
				$_t_Alert:=$_t_Alert+". Do you wish to save this as the default?"
				//CONFIRM($_t_Alert;"Yes";"No")
				Gen_Confirm4($_t_Alert; "Yes"; "No"; True:C214)
				<>l_FS_FieldSortChangedAlert:=cb_dConfirm4
			Else 
				OK:=1  //User asked not show message again but just sort it by changed sort field
			End if 
		Else 
			OK:=1
		End if 
		If (OK=1)
			<>FS_at_FormReference{$_l_FormReferenceRow}:=$_t_FormName
			If (Count parameters:C259>=2)
				<>FS_al_FormSortDirection{$_l_FormReferenceRow}:=$2
				If (Count parameters:C259>=3)
					<>FS_al_FormSortFieldNum{$_l_FormReferenceRow}:=$3
					If (Count parameters:C259>=4)
						<>FS_al_FormSortTableNum{$_l_FormReferenceRow}:=$4
						If (Count parameters:C259>=5)
							<>FS_at_FormSortvariable{$_l_FormReferenceRow}:=$5
							If (Count parameters:C259>=6)
								<>FS_at_FormSortTextLabelName{$_l_FormReferenceRow}:=$6
								If (Count parameters:C259>=7)
									<>FS_at_FormSortVarLabelName{$_l_FormReferenceRow}:=$7
								End if 
							End if 
						End if 
					End if 
				End if 
			End if 
			
		End if 
		
	Else 
		//no settings for this form exist so just save them
		If (Count parameters:C259>=4)
			If ($4>0)
				While (Semaphore:C143("$WriteFormsortPref"))
					DelayTicks(10)
				End while 
				
				INSERT IN ARRAY:C227(<>FS_at_FormReference; 9999; 1)
				INSERT IN ARRAY:C227(<>FS_al_FormSortDirection; 9999; 1)
				INSERT IN ARRAY:C227(<>FS_al_FormSortFieldNum; 9999; 1)
				INSERT IN ARRAY:C227(<>FS_al_FormSortTableNum; 9999; 1)
				INSERT IN ARRAY:C227(<>FS_at_FormSortvariable; 9999; 1)
				INSERT IN ARRAY:C227(<>FS_at_FormSortTextLabelName; 9999; 1)
				INSERT IN ARRAY:C227(<>FS_at_FormSortVarLabelName; 9999; 1)
				<>FS_at_FormReference{Size of array:C274(<>FS_at_FormReference)}:=$_t_FormName
				If (Count parameters:C259>=2)
					<>FS_al_FormSortDirection{Size of array:C274(<>FS_at_FormReference)}:=$2
					If (Count parameters:C259>=3)
						<>FS_al_FormSortFieldNum{Size of array:C274(<>FS_al_FormSortFieldNum)}:=$3
						If (Count parameters:C259>=4)
							<>FS_al_FormSortTableNum{Size of array:C274(<>FS_al_FormSortFieldNum)}:=$4
							If (Count parameters:C259>=5)
								<>FS_at_FormSortvariable{Size of array:C274(<>FS_at_FormSortvariable)}:=$5
								If (Count parameters:C259>=6)
									<>FS_at_FormSortTextLabelName{Size of array:C274(<>FS_at_FormSortTextLabelName)}:=$6
									If (Count parameters:C259>=7)
										<>FS_at_FormSortVarLabelName{Size of array:C274(<>FS_at_FormSortVarLabelName)}:=$7
									End if 
								End if 
							End if 
						End if 
					End if 
				End if 
				
				CLEAR SEMAPHORE:C144("$WriteFormsortPref")
			End if 
		End if 
		
	End if 
	CLEAR SEMAPHORE:C144("$WriteFormsortPref")
	$_l_Process:=New process:C317("FSetting_savePreferences"; 256000; "Save form settings"; *)
End if 
ERR_MethodTrackerReturn("FSetting_UpdateArray"; $_t_oldMethodName)
