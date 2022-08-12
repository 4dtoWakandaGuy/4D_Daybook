//%attributes = {}

If (False:C215)
	//Project Method Name:      PUR_Lbi_PIitems
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
	//ARRAY BOOLEAN(PI_LB_PurchaseInvoiceItems;0)
	//ARRAY POINTER(PUR_aPtr_LBItemsSetup;0)
	C_BOOLEAN:C305($_bo_Null; $_bo_OK; PI_bo_Addingitem)
	C_LONGINT:C283($_l_Column; $_l_Row; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_WindowTop)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_Ptr_ThisColumnField)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PUR_Lbi_PIitems")

//NG THis method replaces  which was the call back method for the area list area on Purchases
$_t_oldMethodName:=ERR_MethodTracker("PUR_Lbi_PIitems")
//ALModPurI
LISTBOX GET CELL POSITION:C971(PI_LB_PurchaseInvoiceItems; $_l_Column; $_l_Row)
If ($_l_Column>0) & ($_l_Row>0)
	$_bo_OK:=LBi_ModIncl(->PUR_aPtr_LBItemsSetup; $_l_Column; $_l_Row)
	If (($_bo_OK) & (OK=1))
		$_ptr_ArrayFieldPointers:=PUR_aPtr_LBItemsSetup{2}
		$_Ptr_ThisColumnField:=$_ptr_ArrayFieldPointers->{$_l_Column}
		$_bo_Null:=(UTI_VarIsNull($_Ptr_ThisColumnField))
		PurItems_InLPX($_Ptr_ThisColumnField)
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
		SET WINDOW RECT:C444($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom+1)
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
		LBi_ModUpdate(->PUR_aPtr_LBItemsSetup; $_bo_Null; $_Ptr_ThisColumnField; $_l_Column; $_l_Row)
		PI_bo_Addingitem:=True:C214
	End if 
End if 
ERR_MethodTrackerReturn("PUR_Lbi_PIitems"; $_t_oldMethodName)