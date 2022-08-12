//%attributes = {}
If (False:C215)
	//Project Method Name:      SD3_LBI_ITEMS
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   28/07/2010 08:22
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY POINTER(SD2_aptr_LBOrderItemsSetup;0)
	C_BOOLEAN:C305($_bo_Null; $_bo_OK; $0k)
	C_LONGINT:C283($_l_Column; $_l_Row; LB_l_ColumnNumber; LB_l_RowNumber)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_Ptr_ThisColumnField)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD3_LBI_ITEMS")

$_l_Column:=LB_l_ColumnNumber
$_l_Row:=LB_l_RowNumber
If (LB_l_ColumnNumber>0) & (LB_l_RowNumber>0)
	$_bo_OK:=LBi_ModIncl(->SD2_aptr_LBOrderItemsSetup; $_l_Column; $_l_Row)
	If (($_bo_OK) & (OK=1))
		$_ptr_ArrayFieldPointers:=SD2_aptr_LBOrderItemsSetup{2}
		$_Ptr_ThisColumnField:=$_ptr_ArrayFieldPointers->{LB_l_ColumnNumber}
		$_bo_Null:=(UTI_VarIsNull($_Ptr_ThisColumnField))
		OrderI_InLPX($_Ptr_ThisColumnField)  //the during phase procedure
		LBi_ModUpdate(->SD2_aptr_LBOrderItemsSetup; $_bo_Null; $_Ptr_ThisColumnField; $_l_Column; $_l_Row)
		
	End if 
Else 
	
End if 
ERR_MethodTrackerReturn("SD3_LBI_ITEMS"; $_t_oldMethodName)