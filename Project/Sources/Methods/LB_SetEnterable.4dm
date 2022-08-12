//%attributes = {}
If (False:C215)
	//Project Method Name:      LB_SetEnterable
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/03/2010 06:41
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
	ARRAY TEXT:C222($_at_ArrayNames; 0)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	C_BOOLEAN:C305($2)
	C_LONGINT:C283($_l_ColumnPosition; $_l_CountColumns; $_l_FieldNumber; $_l_Index; $_l_TableNumber)
	C_POINTER:C301($_Ptr_ListBoxArea; $1)
	C_REAL:C285($3)
	C_TEXT:C284($_t_ColumnName; $_t_oldMethodName; $4)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LB_SetEnterable")
//LB_SetEnterable
// Set enterable properties for an entire Listbox area or individual coilumns
// parameters: $1 = pointer to the LB area
// $2 = True for enterbale, false for non-enterable
// $3 = a column number, or 0 to apply to all columns
// $4 = array name, or blank (use this instead of $3 if preferred)

$_Ptr_ListBoxArea:=$1
ARRAY TEXT:C222($_at_ColumnNames; 0)
ARRAY TEXT:C222($_at_HeaderNames; 0)
ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
LISTBOX GET ARRAYS:C832($1->; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)

$_l_CountColumns:=LISTBOX Get number of columns:C831($_Ptr_ListBoxArea->)
$_t_ColumnName:=""
If (Count parameters:C259>=4)
	$_t_ColumnName:=$4
End if 
Case of 
	: (($3=0) & ($_t_ColumnName=""))  // apply to all cols
		For ($_l_Index; 1; $_l_CountColumns)
			OBJECT SET ENTERABLE:C238(*; $_at_ColumnNames{$_l_Index}; $2)
		End for 
		
	: ($3>0)
		If ($3<=Size of array:C274($_at_ColumnNames))
			$_t_ColumnName:=$_at_ColumnNames{$3}
			OBJECT SET ENTERABLE:C238(*; $_t_ColumnName; $2)
		Else 
			
		End if 
	: ($_t_ColumnName#"")
		ARRAY TEXT:C222($_at_ArrayNames; Size of array:C274($_aptr_ColumnVariables))
		For ($_l_Index; 1; Size of array:C274($_aptr_ColumnVariables))
			RESOLVE POINTER:C394($_aptr_ColumnVariables{$_l_Index}; $_at_ArrayNames{$_l_Index}; $_l_TableNumber; $_l_FieldNumber)
		End for 
		$_l_ColumnPosition:=Find in array:C230($_at_ArrayNames; $_t_ColumnName)
		If ($_l_ColumnPosition>0)
			OBJECT SET ENTERABLE:C238(*; $_at_ColumnNames{$_l_ColumnPosition}; $2)
		Else 
			//TRACE
		End if 
	Else 
		//TRACE
		
End case 
ERR_MethodTrackerReturn("LB_SetEnterable"; $_t_oldMethodName)