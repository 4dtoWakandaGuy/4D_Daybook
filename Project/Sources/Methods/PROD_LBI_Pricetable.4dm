//%attributes = {}
If (False:C215)
	//Project Method Name:      PROD_LBI_Pricetable
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/11/2009`Method: PROD_LBI_Pricetable`Description
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(PRD_lb_RelatedData;0)
	//ARRAY POINTER(PRD_aPtr_RelatedConfiguration;0)
	C_BOOLEAN:C305($_bo_Null; $_bo_OK; $0; $0k)
	C_LONGINT:C283($_l_Column; $_l_Row; $bd36; $bd37)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_Ptr_ThisColumnField)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PROD_LBI_Pricetable")

//NG this method is a replacement for ALModPros. that was the call back method for The suppliers on Products

//ALModProS
LISTBOX GET CELL POSITION:C971(PRD_lb_RelatedData; $_l_Column; $_l_Row)

//$_l_Column:=$_l_Column
//$_l_Row:=$_l_Row
If ($_l_Column>0) & ($_l_Row>0)
	$_bo_OK:=LBi_ModIncl(->PRD_aPtr_RelatedConfiguration; $_l_Column; $_l_Row)
	If (($_bo_OK) & (OK=1))
		$_ptr_ArrayFieldPointers:=PRD_aPtr_RelatedConfiguration{2}
		$_Ptr_ThisColumnField:=$_ptr_ArrayFieldPointers->{$_l_Column}
		$_bo_Null:=(UTI_VarIsNull($_Ptr_ThisColumnField))
		ProdPriceTable_inLPX($_Ptr_ThisColumnField)
		LBi_ModUpdate(->PRD_aPtr_RelatedConfiguration; $_bo_Null; $_Ptr_ThisColumnField; $_l_Column; $_l_Row)
	End if 
Else 
	$0:=True:C214
End if 

//NG This method is  a replacement for the area list call back method ALModOrdI
ERR_MethodTrackerReturn("PROD_LBI_Pricetable"; $_t_oldMethodName)