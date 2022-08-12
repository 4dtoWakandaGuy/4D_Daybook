//%attributes = {}

If (False:C215)
	//Project Method Name:      FLD_LBI_DefItems
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
	//Array POINTER(COM_aptr_LBItemsSetup;0)
	C_BOOLEAN:C305($_bo_Null; $_bo_OK; $0)
	C_LONGINT:C283($_l_Column; $_l_Row)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_Ptr_ListBoxArea; $_ptr_ListboxSetup; $_Ptr_ThisColumnField)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FLD_LBI_DefItems")

//NG this method replaces the call back method  `ALModFFD - Further Field Defs
$_t_oldMethodName:=ERR_MethodTracker("FLD_LBI_DefItems")
$_ptr_ListboxSetup:=->COM_aptr_LBItemsSetup
$_Ptr_ListBoxArea:=$_ptr_ListboxSetup->{1}
LISTBOX GET CELL POSITION:C971($_Ptr_ListBoxArea->; $_l_Column; $_l_Row)


If ($_l_Column>0) & ($_l_Row>0)
	$_bo_OK:=LBi_ModIncl($_ptr_ListboxSetup; $_l_Column; $_l_Row)
	If (($_bo_OK) & (OK=1))
		$_ptr_ArrayFieldPointers:=$_ptr_ListboxSetup->{2}
		$_Ptr_ThisColumnField:=$_ptr_ArrayFieldPointers->{$_l_Column}
		$_bo_Null:=(UTI_VarIsNull($_Ptr_ThisColumnField))
		FurthFldD_InLPX($_Ptr_ThisColumnField)
		LBi_ModUpdate($_ptr_ListboxSetup; $_bo_Null; $_Ptr_ThisColumnField; $_l_Column; $_l_Row)
	End if 
Else 
	$0:=True:C214
End if 
ERR_MethodTrackerReturn("FLD_LBI_DefItems"; $_t_oldMethodName)