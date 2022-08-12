//%attributes = {}

If (False:C215)
	//Project Method Name:      LBi_DragCol
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
	C_BOOLEAN:C305($_bo_ColumnEnterable; $_bo_ColumnLock; $_bo_LockUpdate)
	C_LONGINT:C283($_l_ColumnFooter; $_l_ColumnWIdth; $_l_Index; $_l_LastLockColumn; $_l_NumberofColumns; $_l_ThisColumnFormat; bd36; bd37)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_ArrayOfArrayNames; $_ptr_ArrayofArrayPointers; $_ptr_ArrayofColumnColors; $_ptr_ArrayofColumnFonts; $_ptr_ArrayofColumnFooters; $_ptr_ArrayOfColumnFormats; $_Ptr_ArrayofColumnFormulas; $_ptr_ArrayofColumnLabels; $_ptr_ArrayofColumnLockFlags; $_ptr_ArrayofColumnWIdths)
	C_POINTER:C301($_ptr_ArrayReferences; $_Ptr_DraggedColumnArray; $_ptr_EnterabilityArray; $_ptr_ListboxArea; $_ptr_ListboxSetup; $_Ptr_ThisArray; $_Ptr_ThisField; $1)
	C_TEXT:C284($_t_ColumnColor; $_t_ColumnFont; $_t_ColumnLabel; $_t_oldMethodName; $_t_ThisColumnFormula)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LBi_DragCol")

//NG 20/7/06 This method is a replacement for ALDragCOl
//ALDragCol - updates nec when user drags a column
$_ptr_ListboxSetup:=$1
$_ptr_ListboxArea:=$_ptr_ListboxSetup->{1}
$_ptr_ArrayFieldPointers:=$_ptr_ListboxSetup->{2}
$_ptr_ArrayofArrayPointers:=$_ptr_ListboxSetup->{3}
$_ptr_ArrayOfArrayNames:=$_ptr_ListboxSetup->{4}
$_ptr_ArrayOfColumnFormats:=$_ptr_ListboxSetup->{5}
$_Ptr_ArrayofColumnFormulas:=$_ptr_ListboxSetup->{6}
$_ptr_ArrayReferences:=$_ptr_ListboxSetup->{9}
$_ptr_ArrayofColumnLabels:=$_ptr_ListboxSetup->{12}
$_ptr_ArrayofColumnWIdths:=$_ptr_ListboxSetup->{13}
$_ptr_EnterabilityArray:=$_ptr_ListboxSetup->{14}
$_ptr_ArrayofColumnLockFlags:=$_ptr_ListboxSetup->{15}
$_ptr_ArrayofColumnFonts:=$_ptr_ListboxSetup->{16}
$_ptr_ArrayofColumnColors:=$_ptr_ListboxSetup->{17}
$_ptr_ArrayofColumnFooters:=$_ptr_ListboxSetup->{18}

$_l_NumberofColumns:=Size of array:C274($_ptr_ArrayofColumnLockFlags->)
For ($_l_Index; 1; $_l_NumberofColumns)
	If ($_ptr_ArrayofColumnLockFlags->{$_l_Index})
		$_l_LastLockColumn:=$_l_Index
	End if 
End for 

//NG TODO AL_GetDragCol ($_ptr_ListboxArea->;bd36;bd37;bd35)
If (bd36#bd37)
	$_Ptr_ThisField:=$_ptr_ArrayFieldPointers->{bd36}
	$_Ptr_DraggedColumnArray:=$_ptr_ArrayofArrayPointers->{bd36}
	$_Ptr_ThisArray:=$_ptr_ArrayOfArrayNames->{bd36}
	$_l_ThisColumnFormat:=$_ptr_ArrayOfColumnFormats->{bd36}
	$_t_ThisColumnFormula:=$_Ptr_ArrayofColumnFormulas->{bd36}
	$_t_ColumnLabel:=$_ptr_ArrayofColumnLabels->{bd36}
	$_l_ColumnWIdth:=$_ptr_ArrayofColumnWIdths->{bd36}
	$_bo_ColumnEnterable:=$_ptr_EnterabilityArray->{bd36}
	$_bo_ColumnLock:=$_ptr_ArrayofColumnLockFlags->{bd36}
	$_t_ColumnFont:=$_ptr_ArrayofColumnFonts->{bd36}
	$_t_ColumnColor:=$_ptr_ArrayofColumnColors->{bd36}
	$_l_ColumnFooter:=$_ptr_ArrayofColumnFooters->{bd36}
	If (bd37>bd36)
		For ($_l_Index; bd36; bd37-1)
			$_ptr_ArrayFieldPointers->{$_l_Index}:=$_ptr_ArrayFieldPointers->{$_l_Index+1}
			$_ptr_ArrayofArrayPointers->{$_l_Index}:=$_ptr_ArrayofArrayPointers->{$_l_Index+1}
			$_ptr_ArrayOfArrayNames->{$_l_Index}:=$_ptr_ArrayOfArrayNames->{$_l_Index+1}
			$_ptr_ArrayOfColumnFormats->{$_l_Index}:=$_ptr_ArrayOfColumnFormats->{$_l_Index+1}
			$_Ptr_ArrayofColumnFormulas->{$_l_Index}:=$_Ptr_ArrayofColumnFormulas->{$_l_Index+1}
			$_ptr_ArrayofColumnLabels->{$_l_Index}:=$_ptr_ArrayofColumnLabels->{$_l_Index+1}
			$_ptr_ArrayofColumnWIdths->{$_l_Index}:=$_ptr_ArrayofColumnWIdths->{$_l_Index+1}
			$_ptr_EnterabilityArray->{$_l_Index}:=$_ptr_EnterabilityArray->{$_l_Index+1}
			$_ptr_ArrayofColumnLockFlags->{$_l_Index}:=$_ptr_ArrayofColumnLockFlags->{$_l_Index+1}
			$_ptr_ArrayofColumnFonts->{$_l_Index}:=$_ptr_ArrayofColumnFonts->{$_l_Index+1}
			$_ptr_ArrayofColumnColors->{$_l_Index}:=$_ptr_ArrayofColumnColors->{$_l_Index+1}
			$_ptr_ArrayofColumnFooters->{$_l_Index}:=$_ptr_ArrayofColumnFooters->{$_l_Index+1}
		End for 
	Else 
		For ($_l_Index; bd36; bd37+1; -1)
			$_ptr_ArrayFieldPointers->{$_l_Index}:=$_ptr_ArrayFieldPointers->{$_l_Index-1}
			$_ptr_ArrayofArrayPointers->{$_l_Index}:=$_ptr_ArrayofArrayPointers->{$_l_Index-1}
			$_ptr_ArrayOfArrayNames->{$_l_Index}:=$_ptr_ArrayOfArrayNames->{$_l_Index-1}
			$_ptr_ArrayOfColumnFormats->{$_l_Index}:=$_ptr_ArrayOfColumnFormats->{$_l_Index-1}
			$_Ptr_ArrayofColumnFormulas->{$_l_Index}:=$_Ptr_ArrayofColumnFormulas->{$_l_Index-1}
			$_ptr_ArrayofColumnLabels->{$_l_Index}:=$_ptr_ArrayofColumnLabels->{$_l_Index-1}
			$_ptr_ArrayofColumnWIdths->{$_l_Index}:=$_ptr_ArrayofColumnWIdths->{$_l_Index-1}
			$_ptr_EnterabilityArray->{$_l_Index}:=$_ptr_EnterabilityArray->{$_l_Index-1}
			$_ptr_ArrayofColumnLockFlags->{$_l_Index}:=$_ptr_ArrayofColumnLockFlags->{$_l_Index-1}
			$_ptr_ArrayofColumnFonts->{$_l_Index}:=$_ptr_ArrayofColumnFonts->{$_l_Index-1}
			$_ptr_ArrayofColumnColors->{$_l_Index}:=$_ptr_ArrayofColumnColors->{$_l_Index-1}
			$_ptr_ArrayofColumnFooters->{$_l_Index}:=$_ptr_ArrayofColumnFooters->{$_l_Index-1}
		End for 
	End if 
	$_ptr_ArrayFieldPointers->{bd37}:=$_Ptr_ThisField
	$_ptr_ArrayofArrayPointers->{bd37}:=$_Ptr_DraggedColumnArray
	$_ptr_ArrayOfArrayNames->{bd37}:=$_Ptr_ThisArray
	$_ptr_ArrayOfColumnFormats->{bd37}:=$_l_ThisColumnFormat
	$_Ptr_ArrayofColumnFormulas->{bd37}:=$_t_ThisColumnFormula
	$_ptr_ArrayofColumnLabels->{bd37}:=$_t_ColumnLabel
	$_ptr_ArrayofColumnWIdths->{bd37}:=$_l_ColumnWIdth
	$_ptr_EnterabilityArray->{bd37}:=$_bo_ColumnEnterable
	$_ptr_ArrayofColumnLockFlags->{bd37}:=$_bo_ColumnLock
	$_ptr_ArrayofColumnFonts->{bd37}:=$_t_ColumnFont
	$_ptr_ArrayofColumnColors->{bd37}:=$_t_ColumnColor
	$_ptr_ArrayofColumnFooters->{bd37}:=$_l_ColumnFooter
	
	$_bo_LockUpdate:=False:C215
	
	For ($_l_Index; 1; $_l_NumberofColumns)
		If (($_l_Index=$_l_LastLockColumn)#$_ptr_ArrayofColumnLockFlags->{$_l_Index})
			$_ptr_ArrayofColumnLockFlags->{$_l_Index}:=($_l_Index=$_l_LastLockColumn)
			$_bo_LockUpdate:=True:C214
		End if 
	End for 
	
	If ($_bo_LockUpdate)
		$_ptr_ArrayReferences->{4}:=Substring:C12($_ptr_ArrayReferences->{4}; 1; 2)+"22"+Substring:C12($_ptr_ArrayReferences->{4}; 5; 99)
		//$_ptr_ArrayReferences»{4}≤3≥:="2"
		//$_ptr_ArrayReferences»{4}≤4≥:="2"
	Else 
		$_ptr_ArrayReferences->{4}:=Substring:C12($_ptr_ArrayReferences->{4}; 1; 3)+"2"+Substring:C12($_ptr_ArrayReferences->{4}; 5; 99)
		//$_ptr_ArrayReferences»{4}≤4≥:="2"
	End if 
	
End if 
ERR_MethodTrackerReturn("LBi_DragCol"; $_t_oldMethodName)