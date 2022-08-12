//%attributes = {}

If (False:C215)
	//Project Method Name:      PO_LBI_PoItems
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
	//Array POINTER(POI_aptr_LBSetup;0)
	C_BOOLEAN:C305($_bo_Null; $_bo_OK; $0; DB_bo_RecordModified; PO_bo_AddItem)
	C_LONGINT:C283($_l_Column; $_l_Row)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_Ptr_ListBox; $_Ptr_ThisColumnField)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PO_LBI_PoItems")

//NG this method is to replace ALModPuO1 that was the call back method for the area list area. This is the area specific method for the Listbox area
$_t_oldMethodName:=ERR_MethodTracker("PO_LBI_PoItems")

$_Ptr_ListBox:=POI_aptr_LBSetup{1}
LISTBOX GET CELL POSITION:C971($_Ptr_ListBox->; $_l_Column; $_l_Row)
If ($_l_Column>0) & ($_l_Row>0)
	$_bo_OK:=LBi_ModIncl(->POI_aptr_LBSetup; $_l_Column; $_l_Row)
	If (($_bo_OK) & (OK=1))
		$_ptr_ArrayFieldPointers:=POI_aptr_LBSetup{2}
		$_Ptr_ThisColumnField:=$_ptr_ArrayFieldPointers->{$_l_Column}
		$_bo_Null:=(UTI_VarIsNull($_Ptr_ThisColumnField))
		PuOItems_InLPX($_Ptr_ThisColumnField)
		LBi_ModUpdate(->POI_aptr_LBSetup; $_bo_Null; $_Ptr_ThisColumnField; $_l_Column; $_l_Row)
		If (DB_bo_RecordModified)
			PO_bo_AddItem:=True:C214
		End if 
	End if 
Else 
	$0:=True:C214
End if 
ERR_MethodTrackerReturn("PO_LBI_PoItems"; $_t_oldMethodName)