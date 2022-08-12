//%attributes = {}

If (False:C215)
	//Project Method Name:      PROD_LBI_Suppliers
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
	//Array POINTER(PRD_aPtr_RelatedConfiguration;0)
	C_BOOLEAN:C305($_bo_Null; $_bo_OK; $0; PROD_bo_AddSupplier)
	C_LONGINT:C283($_l_Column; $_l_Row)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_Ptr_ListBox; $_Ptr_ThisColumnField)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PROD_LBI_Suppliers")

//NG this method is a replacement for ALModPros. that was the call back method for The suppliers on Products
$_t_oldMethodName:=ERR_MethodTracker("PROD_LBI_Suppliers")
//ALModProS
$_Ptr_ListBox:=PRD_aPtr_RelatedConfiguration{1}
LISTBOX GET CELL POSITION:C971($_Ptr_ListBox->; $_l_Column; $_l_Row)

//$_l_Column:=LB_l_ColumnNumber
//$_l_Row:=LB_l_RowNumber
If ($_l_Column>0) & ($_l_Row>0)
	$_bo_OK:=LBi_ModIncl(->PRD_aPtr_RelatedConfiguration; $_l_Column; $_l_Row)
	If (($_bo_OK) & (OK=1))
		$_ptr_ArrayFieldPointers:=PRD_aPtr_RelatedConfiguration{2}
		$_Ptr_ThisColumnField:=$_ptr_ArrayFieldPointers->{$_l_Column}
		$_bo_Null:=(UTI_VarIsNull($_Ptr_ThisColumnField))
		ProdSupp_InLPX($_Ptr_ThisColumnField)
		PROD_bo_AddSupplier:=True:C214
		LBi_ModUpdate(->PRD_aPtr_RelatedConfiguration; $_bo_Null; $_Ptr_ThisColumnField; $_l_Column; $_l_Row)
	End if 
Else 
	$0:=True:C214
End if 
ERR_MethodTrackerReturn("PROD_LBI_Suppliers"; $_t_oldMethodName)