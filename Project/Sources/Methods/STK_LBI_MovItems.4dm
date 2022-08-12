//%attributes = {}

If (False:C215)
	//Project Method Name:      STK_LBI_MovItems
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
	//ARRAY POINTER(STK_aptr_ItemPreferences;0)
	C_BOOLEAN:C305($_bo_Null; $_bo_OK; STK_bo_AddItem; STK_bo_REcall)
	C_LONGINT:C283($_l_Column; $_l_ExpectedDateColumn; $_l_Row)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_ArrayofArrayPointers; $_Ptr_ListBox; $_Ptr_ThisColumnArray; $_Ptr_ThisColumnField)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_LBI_MovItems")

//This method replaces the Area list call back ALModStockMovItem
$_t_oldMethodName:=ERR_MethodTracker("STK_LBI_MovItems")

$_Ptr_ListBox:=STK_aptr_ItemPreferences{1}
LISTBOX GET CELL POSITION:C971($_Ptr_ListBox->; $_l_Column; $_l_Row)

If ($_l_Column>0) & ($_l_Row>0)
	$_bo_OK:=LBi_ModIncl(->STK_aptr_ItemPreferences; $_l_Column; $_l_Row)
	If (($_bo_OK) & (OK=1))
		$_ptr_ArrayFieldPointers:=STK_aptr_ItemPreferences{2}
		$_Ptr_ThisColumnField:=$_ptr_ArrayFieldPointers->{$_l_Column}
		$_bo_Null:=(UTI_VarIsNull($_Ptr_ThisColumnField))
		If (Field:C253($_Ptr_ThisColumnField)=Field:C253(->[STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Delivery_Reference:43))
			//TRACE
			$_l_ExpectedDateColumn:=Find in array:C230($_ptr_ArrayFieldPointers->; ->[STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Expected_Date:44)
			If ($_l_ExpectedDateColumn>0)
				$_ptr_ArrayofArrayPointers:=STK_aptr_ItemPreferences{3}
				$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_ExpectedDateColumn}
				[STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Expected_Date:44:=$_Ptr_ThisColumnArray->{$_l_Row}
			End if 
			
		End if 
		STK_bo_REcall:=False:C215
		StockI_SubLPX($_Ptr_ThisColumnField)  //the during phase procedure
		STK_bo_AddItem:=True:C214
		LBi_ModUpdate(->STK_aptr_ItemPreferences; $_bo_Null; $_Ptr_ThisColumnField; $_l_Column; $_l_Row)
		
	End if 
End if 
ERR_MethodTrackerReturn("STK_LBI_MovItems"; $_t_oldMethodName)
