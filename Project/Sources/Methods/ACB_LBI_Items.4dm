//%attributes = {}
If (False:C215)
	//Project Method Name:      ACB_LBI_Items
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  27/01/2011 18:00 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(ACB_al_SubAreaTables;0)
	//ARRAY POINTER(ACB_aptr_SubAreaPointers;0)
	C_BOOLEAN:C305($_bo_Null; $_bo_OK)
	C_LONGINT:C283($_l_Column; $_l_Row; $_l_TablePosition)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_Ptr_ListBoxArea; $_ptr_ListboxSetup; $_Ptr_ThisColumnField)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACB_LBI_Items")
$_l_TablePosition:=Find in array:C230(ACB_al_SubAreaTables; Table:C252(->[TRANSACTIONS:29]))
If ($_l_TablePosition>0)
	
	$_ptr_ListboxSetup:=ACB_aptr_SubAreaPointers{$_l_TablePosition}
	$_Ptr_ListBoxArea:=$_ptr_ListboxSetup->{1}
	LISTBOX GET CELL POSITION:C971($_Ptr_ListBoxArea->; $_l_Column; $_l_Row)
	
	If ($_l_Column>0) & ($_l_Row>0)
		$_bo_OK:=LBi_ModIncl($_ptr_ListboxSetup; $_l_Column; $_l_Row)
		If (($_bo_OK) & (OK=1))
			$_ptr_ArrayFieldPointers:=$_ptr_ListboxSetup->{2}
			$_Ptr_ThisColumnField:=$_ptr_ArrayFieldPointers->{$_l_Column}
			$_bo_Null:=(UTI_VarIsNull($_Ptr_ThisColumnField))
			//OrderI_InLPX ($_Ptr_ThisColumnField)  `the during phase procedure
			//LBi_ModUpdate ($_ptr_ListboxSetup;$_bo_Null;$_Ptr_ThisColumnField;$_l_Column;$_l_Row)
		End if 
	Else 
		
	End if 
End if 
ERR_MethodTrackerReturn("ACC_LBI_Items"; $_t_oldMethodName)