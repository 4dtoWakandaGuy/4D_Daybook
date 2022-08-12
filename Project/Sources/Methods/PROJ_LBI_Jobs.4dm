//%attributes = {}

If (False:C215)
	//Project Method Name:      PROJ_LBI_Jobs
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
	//Array POINTER(PTR_aptr_LbSetup;0)
	C_BOOLEAN:C305($_bo_Null; $_bo_OK)
	C_LONGINT:C283($_l_ColumnNumber; $_l_RowNumber; LB_l_ColumnNumber; LB_l_RowNumber)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_Ptr_ListBox; $_Ptr_ThisColumnField)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PROJ_LBI_Jobs")

//THis method replaces the area list call back ALModProjJob
$_t_oldMethodName:=ERR_MethodTracker("PROJ_LBI_Jobs")
$_Ptr_ListBox:=PTR_aptr_LbSetup{1}
LISTBOX GET CELL POSITION:C971($_Ptr_ListBox->; $_l_ColumnNumber; $_l_RowNumber)

//NG April 2004
$_l_RowNumber:=LB_l_RowNumber
$_l_ColumnNumber:=LB_l_ColumnNumber
If ($_l_ColumnNumber>0) & ($_l_RowNumber>0)
	$_bo_OK:=LBi_ModIncl(->PTR_aptr_LbSetup; $_l_ColumnNumber; $_l_RowNumber)
	If (($_bo_OK) & (OK=1))
		$_ptr_ArrayFieldPointers:=PTR_aptr_LbSetup{2}
		$_Ptr_ThisColumnField:=$_ptr_ArrayFieldPointers->{$_l_ColumnNumber}
		$_bo_Null:=(UTI_VarIsNull($_Ptr_ThisColumnField))
		
		
		
		Jobs_INLPX($_Ptr_ThisColumnField)  //the during phase procedure
		LBi_ModUpdate(->PTR_aptr_LbSetup; $_bo_Null; $_Ptr_ThisColumnField; $_l_ColumnNumber; $_l_RowNumber)
		
	End if 
	
Else 
	
End if 
ERR_MethodTrackerReturn("PROJ_LBI_Jobs"; $_t_oldMethodName)