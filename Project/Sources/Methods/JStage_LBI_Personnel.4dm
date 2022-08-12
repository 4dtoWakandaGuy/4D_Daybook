//%attributes = {}

If (False:C215)
	//Project Method Name:      JStage_LBI_Personnel
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
	//Array POINTER(JST_aptr_LBSettings;0)
	C_BOOLEAN:C305($_bo_Null; $_bo_OK)
	C_LONGINT:C283($_l_Column; $_l_Row)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_Ptr_ListBox; $_Ptr_ThisColumnField)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JStage_LBI_Personnel")

//NG this method replaces the area list call back ALModJobPersonnel


$_t_oldMethodName:=ERR_MethodTracker("JStage_LBI_Personnel")
$_Ptr_ListBox:=JST_aptr_LBSettings{1}
LISTBOX GET CELL POSITION:C971($_Ptr_ListBox->; $_l_Column; $_l_Row)


If ($_l_Column>0) & ($_l_Row>0)
	$_bo_OK:=LBi_ModIncl(->JST_aptr_LBSettings; $_l_Column; $_l_Row)
	If (($_bo_OK) & (OK=1))
		$_ptr_ArrayFieldPointers:=JST_aptr_LBSettings{2}
		$_Ptr_ThisColumnField:=$_ptr_ArrayFieldPointers->{$_l_Column}
		$_bo_Null:=(UTI_VarIsNull($_Ptr_ThisColumnField))
		JobPers_InLPX($_Ptr_ThisColumnField)
		
		LBi_ModUpdate(->JST_aptr_LBSettings; $_bo_Null; $_Ptr_ThisColumnField; $_l_Column; $_l_Row)
		
	End if 
End if 
ERR_MethodTrackerReturn("JStage_LBI_Personnel"; $_t_oldMethodName)