//%attributes = {}
If (False:C215)
	//Project Method Name:      LB_GetColumn
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
	ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
	ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	C_LONGINT:C283($_l_FieldNumber; $_l_Index; $_l_TableNumber; $0)
	C_POINTER:C301($_Ptr_ListBoxArea; $1)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName; $_t_VariableName2; $2; $3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LB_GetColumn")
// LB_GetColumn
// replacement for AL_Getcoilumn
// 30/06/06 pb
// parameters: $1 = pointer to the listbox area
// $2 = pointer to the column
// returns the column number of the selected column
// example: $_t_VariableName:=LB_GetColumn (self;->column)

//C_LONGINT($_t_VariableNames)

$_Ptr_ListBoxArea:=$1
If (Count parameters:C259>=2)
	$_t_VariableName:=$2
Else 
	RESOLVE POINTER:C394($_Ptr_ListBoxArea; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
End if 


//$_t_VariableNames:=Get number of listbox columns($_Ptr_ListBoxArea->)
//$0:=Find in array($_Ptr_ListBoxArea->;True)
ARRAY TEXT:C222($_at_ColumnNames; 0)
ARRAY TEXT:C222($_at_HeaderNames; 0)
ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
ARRAY POINTER:C280($_aptr_ColumnStyles; 0)

$0:=0
LISTBOX GET ARRAYS:C832($_Ptr_ListBoxArea->; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)
Case of 
	: (Count parameters:C259<=2)
		For ($_l_Index; 1; Size of array:C274($_aptr_ColumnVariables))
			RESOLVE POINTER:C394($_aptr_ColumnVariables{$_l_Index}; $_t_VariableName2; $_l_TableNumber; $_l_FieldNumber)
			If ($_t_VariableName2=$_t_VariableName)
				$0:=$_l_Index
				$_l_Index:=Size of array:C274($_aptr_ColumnVariables)
			End if 
		End for 
		If (Count parameters:C259<2)  //Only if we passed no column names
			If ($0=0)
				//Maybe header selected
				For ($_l_Index; 1; Size of array:C274($_aptr_HeaderVariables))
					RESOLVE POINTER:C394($_aptr_HeaderVariables{$_l_Index}; $_t_VariableName2; $_l_TableNumber; $_l_FieldNumber)
					If ($_t_VariableName2=$_t_VariableName)
						$0:=$_l_Index
						$_l_Index:=Size of array:C274($_aptr_ColumnVariables)
					End if 
				End for 
			End if 
		End if 
	: (Count parameters:C259=3)
		For ($_l_Index; 1; Size of array:C274($_aptr_HeaderVariables))
			RESOLVE POINTER:C394($_aptr_HeaderVariables{$_l_Index}; $_t_VariableName2; $_l_TableNumber; $_l_FieldNumber)
			If ($_t_VariableName2=$3)
				$0:=$_l_Index
				$_l_Index:=Size of array:C274($_aptr_ColumnVariables)
			End if 
		End for 
End case 
ERR_MethodTrackerReturn("LB_GetColumn"; $_t_oldMethodName)