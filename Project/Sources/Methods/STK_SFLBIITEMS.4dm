//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_SFLBIITEMS
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/09/2011 15:31
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY POINTER(STK_aptr_ItemPreferences;0)
	C_BOOLEAN:C305($_bo_Null; $_bo_OK; $0k; STK_bo_AddItem)
	C_LONGINT:C283($_l_Column; $_l_Row)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_Ptr_ListBox; $_Ptr_ThisColumnField)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_SFLBIITEMS")
$_Ptr_ListBox:=STK_aptr_ItemPreferences{1}
LISTBOX GET CELL POSITION:C971($_Ptr_ListBox->; $_l_Column; $_l_Row)

If ($_l_Column>0) & ($_l_Row>0)
	$_bo_OK:=LBi_ModIncl(->STK_aptr_ItemPreferences; $_l_Column; $_l_Row)
	If (($_bo_OK) & (OK=1))
		$_ptr_ArrayFieldPointers:=STK_aptr_ItemPreferences{2}
		$_Ptr_ThisColumnField:=$_ptr_ArrayFieldPointers->{$_l_Column}
		$_bo_Null:=(UTI_VarIsNull($_Ptr_ThisColumnField))
		STK_SFITEM_Lpx($_Ptr_ThisColumnField)
		//StockI_SubLPX ($_Ptr_ThisColumnField)  `the during phase procedure
		STK_bo_AddItem:=True:C214
		LBi_ModUpdate(->STK_aptr_ItemPreferences; $_bo_Null; $_Ptr_ThisColumnField; $_l_Column; $_l_Row)
	End if 
End if 
ERR_MethodTrackerReturn("STK_SFLBIITEMS"; $_t_oldMethodName)