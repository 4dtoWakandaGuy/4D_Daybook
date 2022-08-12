//%attributes = {}

If (False:C215)
	//Project Method Name:      INV_LBI_Items
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
	//Array POINTER(INV_aptr_ListboxSetup;0)
	C_BOOLEAN:C305($_bo_Null; $_bo_OK; DB_bo_RecordModified; INV_bo_Addingitem)
	C_LONGINT:C283($_l_Column; $_l_Row)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_ListboxArea; $_Ptr_ThisColumnField)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("INV_LBI_Items")

//NG this method replaces the area list call back ALModInvI


//``
$_t_oldMethodName:=ERR_MethodTracker("INV_LBI_Items")
$_ptr_ListboxArea:=->INV_aptr_ListboxSetup
$_Ptr_ListBoxArea:=$_ptr_ListboxArea->{1}
LISTBOX GET CELL POSITION:C971($_Ptr_ListBoxArea->; $_l_Column; $_l_Row)

If ($_l_Column>0) & ($_l_Row>0)
	$_bo_OK:=LBi_ModIncl($_ptr_ListboxArea; $_l_Column; $_l_Row)
	If (($_bo_OK) & (OK=1))
		$_ptr_ArrayFieldPointers:=$_ptr_ListboxArea->{2}
		$_Ptr_ThisColumnField:=$_ptr_ArrayFieldPointers->{$_l_Column}
		$_bo_Null:=(UTI_VarIsNull($_Ptr_ThisColumnField))
		InvItems_InLPX($_Ptr_ThisColumnField)
		LBi_ModUpdate($_ptr_ListboxArea; $_bo_Null; $_Ptr_ThisColumnField; $_l_Column; $_l_Row)
		If (DB_bo_RecordModified)
			INV_bo_Addingitem:=True:C214  //adding or editing an item
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("INV_LBI_Items"; $_t_oldMethodName)