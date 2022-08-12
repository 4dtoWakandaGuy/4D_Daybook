//%attributes = {}
If (False:C215)
	//Project Method Name:      QR_GetRealData
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/09/2012 08:36
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
	C_LONGINT:C283($_l_FieldNumber; $_l_TableNumber; $2; LB_l_CurrentRow)
	C_POINTER:C301($_Ptr_ListBoxArea; $_ptr_Variable)
	C_REAL:C285($0)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("QR_GetRealData")

If (Count parameters:C259>=1)
	$_Ptr_ListBoxArea:=Get pointer:C304($1)
	If (LB_l_CurrentRow=0)
		LB_l_CurrentRow:=1
	End if 
	
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
	ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
	ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	LISTBOX GET ARRAYS:C832($_Ptr_ListBoxArea->; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)
	RESOLVE POINTER:C394($_aptr_ColumnVariables{$2}; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
	
	$_ptr_Variable:=Get pointer:C304($_t_VariableName)
	If (LB_l_CurrentRow>Size of array:C274($_ptr_Variable->))
		//The calc column size runs this code so when the print starts its already at the end of the rows so reset it!!!
		LB_l_CurrentRow:=1
	End if 
	If (LB_l_CurrentRow<=Size of array:C274($_ptr_Variable->))
		$0:=$_ptr_Variable->{LB_l_CurrentRow}
	Else 
		$0:=0
		
		//$0:=""
	End if 
Else 
	$0:=0
	//$0:=""
End if 
If ($2=Size of array:C274($_aptr_ColumnVariables))
	LB_l_CurrentRow:=LB_l_CurrentRow+1
End if 
ERR_MethodTrackerReturn("QR_GetRealData"; $_t_oldMethodName)
