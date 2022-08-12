//%attributes = {}
If (False:C215)
	//Project Method Name:      LBi_Resize
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
	C_BOOLEAN:C305($_bo_UpdateSize)
	C_LONGINT:C283($_l_Index; $_l_NumberofColumns; LB_l_ColumnWidth)
	C_POINTER:C301($_ptr_ArrayofColumnWIdths; $_ptr_ArrayReferences; $_ptr_ListboxArea; $_ptr_ListboxSetup; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("LBi_Resize")

//NG 19/7/2006 this method is a direct replacement for ALResize

//AlResize a column

$_ptr_ListboxSetup:=$1
$_ptr_ArrayReferences:=$_ptr_ListboxSetup->{9}
$_ptr_ListboxArea:=$_ptr_ListboxSetup->{1}
$_ptr_ArrayofColumnWIdths:=$_ptr_ListboxSetup->{13}
$_l_NumberofColumns:=Size of array:C274($_ptr_ArrayofColumnWIdths->)
$_bo_UpdateSize:=False:C215
For ($_l_Index; 1; $_l_NumberofColumns)
	LB_l_ColumnWidth:=0
	LB_GetWidths($_ptr_ListboxArea; $_l_Index; ->LB_l_ColumnWidth)
	If (LB_l_ColumnWidth#$_ptr_ArrayofColumnWIdths->{$_l_Index})
		$_ptr_ArrayofColumnWIdths->{$_l_Index}:=LB_l_ColumnWidth
		$_bo_UpdateSize:=True:C214
	End if 
End for 
ERR_MethodTrackerReturn("LBi_Resize"; $_t_oldMethodName)