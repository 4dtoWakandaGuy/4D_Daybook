//%attributes = {}

If (False:C215)
	//Project Method Name:      SD2_LBi_Items
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
	//Array BOOLEAN(SD_lb_Workflow;0)
	//Array POINTER(SD2_aptr_ListControl;0)
	C_BOOLEAN:C305($_bo_Null; $_bo_OK)
	C_LONGINT:C283($_l_Column; $_l_Row)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_Ptr_ThisColumnField)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_LBi_Items")

//NG This method is  a replacement for the area list call back method ALModOrdI
//`

$_t_oldMethodName:=ERR_MethodTracker("SD2_LBi_Items")
//ALModCont
LISTBOX GET CELL POSITION:C971(SD_lb_Workflow; $_l_Column; $_l_Row)

If ($_l_Column>0) & ($_l_Row>0)
	$_bo_OK:=LBi_ModIncl(->SD2_aptr_ListControl; $_l_Column; $_l_Row)
	If (($_bo_OK) & (OK=1))
		$_ptr_ArrayFieldPointers:=SD2_aptr_ListControl{2}
		$_Ptr_ThisColumnField:=$_ptr_ArrayFieldPointers->{$_l_Column}
		$_bo_Null:=(UTI_VarIsNull($_Ptr_ThisColumnField))
		OrderI_InLPX($_Ptr_ThisColumnField)  //the during phase procedure
		LBi_ModUpdate(->SD2_aptr_ListControl; $_bo_Null; $_Ptr_ThisColumnField; $_l_Column; $_l_Row)
		
	End if 
Else 
	
	
	
End if 
ERR_MethodTrackerReturn("SD2_LBi_Items"; $_t_oldMethodName)