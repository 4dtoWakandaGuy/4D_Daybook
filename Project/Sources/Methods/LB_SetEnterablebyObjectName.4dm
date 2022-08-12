//%attributes = {}

If (False:C215)
	//Database Method Name:      LB_SetEnterablebyObjectName
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  29/08/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_ColumnVisible; 0)
	ARRAY POINTER:C280($_aptr_ColumnVars; 0)
	ARRAY POINTER:C280($_aptr_HeaderVars; 0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	ARRAY TEXT:C222($_at_ArrayNames; 0)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_Headernames; 0)
	C_BOOLEAN:C305($_bo_Enterable; $2)
	C_LONGINT:C283($_l_ColumnNumber; $_l_ColumnPosition; $_l_FieldNumber; $_l_Index; $_l_ListboxColumnsCount; $_l_TableNumber; $3)
	C_TEXT:C284($_t_AreaName; $_t_ColumnVarName; $_t_OldMethodName; $1; $4)
End if 

//Code Starts Here
$_t_OldMethodName:=ERR_MethodTracker("LB_SetEnterablebyObjectName")
//LB_SetEnterable
// Set enterable properties for an entire Listbox area or individual coilumns
// parameters: $1 = pointer to the LB area
// $2 = True for enterbale, false for non-enterable
// $3 = a column number, or 0 to apply to all columns
// $4 = array name, or blank (use this instead of $3 if preferred)

$_t_ColumnVarName:=""

$_t_AreaName:=$1
$_l_ColumnNumber:=$3
$_bo_Enterable:=$2
If (Count parameters:C259>=4)
	$_t_ColumnVarName:=$4
End if 
LISTBOX GET ARRAYS:C832(*; $_t_AreaName; $_at_ColumnNames; $_at_Headernames; $_aptr_ColumnVars; $_aptr_HeaderVars; $_abo_ColumnVisible; $_aptr_ColumnStyles)

$_l_ListboxColumnsCount:=LISTBOX Get number of columns:C831(*; $_t_AreaName)

Case of 
	: (($_l_ColumnNumber=0) & ($_t_ColumnVarName=""))  // apply to all cols
		For ($_l_Index; 1; $_l_ListboxColumnsCount)
			OBJECT SET ENTERABLE:C238(*; $_at_ColumnNames{$_l_Index}; $_bo_Enterable)
		End for 
		
	: ($_l_ColumnNumber>0)
		If ($_l_ColumnNumber<=Size of array:C274($_at_ColumnNames))
			$_t_ColumnVarName:=$_at_ColumnNames{$_l_ColumnNumber}
			OBJECT SET ENTERABLE:C238(*; $_t_ColumnVarName; $_bo_Enterable)
		Else 
			
		End if 
	: ($_t_ColumnVarName#"")
		ARRAY TEXT:C222($_at_ArrayNames; Size of array:C274($_aptr_ColumnVars))
		For ($_l_Index; 1; Size of array:C274($_aptr_ColumnVars))
			RESOLVE POINTER:C394($_aptr_ColumnVars{$_l_Index}; $_at_ArrayNames{$_l_Index}; $_l_TableNumber; $_l_FieldNumber)
		End for 
		$_l_ColumnPosition:=Find in array:C230($_at_ArrayNames; $_t_ColumnVarName)
		If ($_l_ColumnPosition>0)
			OBJECT SET ENTERABLE:C238(*; $_at_ColumnNames{$_l_ColumnPosition}; $_bo_Enterable)
		Else 
			//TRACE
		End if 
	Else 
		//TRACE
		
End case 
ERR_MethodTrackerReturn("LB_SetEnterablebyObjectName"; $_t_OldMethodName)