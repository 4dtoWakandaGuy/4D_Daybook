//%attributes = {}

If (False:C215)
	//Project Method Name:      ORD_LBI_Items
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
	//ARRAY LONGINT(ORD_al_SubAreaTables;0)
	//ARRAY POINTER(ORD_aptr_SubAreaPointers;0)
	C_BOOLEAN:C305($_bo_Null; $_bo_OK; ORD_bo_NoRebuild; ORD_bo_Rebuild)
	C_LONGINT:C283($_l_Column; $_l_Row; $_l_TableRow; DB_l_ButtonClickedFunction)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_ListboxArea; $_ptr_ListBoxSetup; $_Ptr_ThisColumnField)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ORD_LBI_Items")

//NG This method is  a replacement for the area list call back method ALModOrdI
//`

$_t_oldMethodName:=ERR_MethodTracker("ORD_LBI_Items")
//ALModCont
$_l_TableRow:=Find in array:C230(ORD_al_SubAreaTables; Table:C252(->[ORDER_ITEMS:25]))
If ($_l_TableRow>0)
	$_ptr_ListBoxSetup:=ORD_aptr_SubAreaPointers{$_l_TableRow}
	$_ptr_ListboxArea:=$_ptr_ListBoxSetup->{1}
	LISTBOX GET CELL POSITION:C971($_ptr_ListboxArea->; $_l_Column; $_l_Row)
	//TRACE
	
	If ($_l_Column>0) & ($_l_Row>0)
		$_bo_OK:=LBi_ModIncl($_ptr_ListBoxSetup; $_l_Column; $_l_Row)
		If (($_bo_OK) & (OK=1))
			$_ptr_ArrayFieldPointers:=$_ptr_ListBoxSetup->{2}
			$_Ptr_ThisColumnField:=$_ptr_ArrayFieldPointers->{$_l_Column}
			$_bo_Null:=(UTI_VarIsNull($_Ptr_ThisColumnField))
			ORD_bo_NoRebuild:=True:C214
			ORD_bo_Rebuild:=False:C215
			OrderI_InLPX($_Ptr_ThisColumnField)  //the during phase procedure
			
			LBi_ModUpdate($_ptr_ListBoxSetup; $_bo_Null; $_Ptr_ThisColumnField; $_l_Column; $_l_Row)
			If (ORD_bo_Rebuild)
				ORD_bo_Rebuild:=False:C215
				DB_l_ButtonClickedFunction:=DB_GetButtonFunction("ReloadOrderItems")
				POST OUTSIDE CALL:C329(Current process:C322)
			End if 
		End if 
	Else 
		
	End if 
End if 
ERR_MethodTrackerReturn("ORD_LBI_Items"; $_t_oldMethodName)
