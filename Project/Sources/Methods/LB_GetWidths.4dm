//%attributes = {}
If (False:C215)
	//Project Method Name:      LB_GetWidths
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/04/2010 14:31
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
	ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	C_LONGINT:C283($_l_Column; $_l_CountParameters; $_l_CurrentParameter; $_l_Index; $2)
	C_POINTER:C301($_Ptr_VariableToSet; $1)
	C_TEXT:C284($_t_ColumnName; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LB_GetWidths")
// LB_GetWidths
// replaces AL_GetWidths(an area list function)
// 03/07/06 pb
// Parameters: $1 = the LB area
// $2 = column at which to get the first width
// $3 - $n - names of variables to contain the column widths
ARRAY TEXT:C222($_at_ColumnNames; 0)
ARRAY TEXT:C222($_at_HeaderNames; 0)
ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
$_l_CountParameters:=Count parameters:C259-2

LISTBOX GET ARRAYS:C832($1->; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)
$_l_CurrentParameter:=2
For ($_l_Index; $2; $2+($_l_CountParameters-1))
	If ($_l_Index<=Size of array:C274($_aptr_ColumnVariables))
		//$_l_Column:=$_aptr_ColumnVariables{$_l_Index}
		$_l_CurrentParameter:=$_l_CurrentParameter+1
		$_Ptr_VariableToSet:=${$_l_CurrentParameter}
		$_t_ColumnName:=$_at_ColumnNames{$_l_Index}
		$_Ptr_VariableToSet->:=LISTBOX Get column width:C834(*; $_t_ColumnName)
	End if 
	
End for 
ERR_MethodTrackerReturn("LB_GetWidths"; $_t_oldMethodName)