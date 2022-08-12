//%attributes = {}

If (False:C215)
	//Project Method Name:      ORD_LBI_DiaryItems
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
	//ARRAY POINTER(ORD_aPtr_LbDISetup;0)
	C_BOOLEAN:C305($_bo_Null; $_bo_OK)
	C_LONGINT:C283($_l_Column; $_l_Row)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_Ptr_ListBox; $_Ptr_ThisColumnField)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ORD_LBI_DiaryItems")

//NG This method replaces the callback method ALModOrdDiary  `NG April 2004 this method handles the calls to the diary from the Orders table1
//used in the form [orders]Jobs_TCIn


//`
//ALModCont
//These are set by the calling method-LBI_AreaScript(this method is called as an execute)
$_Ptr_ListBox:=ORD_aPtr_LbDISetup{1}
LISTBOX GET CELL POSITION:C971($_Ptr_ListBox->; $_l_Column; $_l_Row)
If ($_l_Column>0) & ($_l_Row>0)
	$_bo_OK:=LBi_ModIncl(->ORD_aPtr_LbDISetup; $_l_Column; $_l_Row)
	If (($_bo_OK) & (OK=1))
		$_ptr_ArrayFieldPointers:=ORD_aPtr_LbDISetup{2}
		$_Ptr_ThisColumnField:=$_ptr_ArrayFieldPointers->{$_l_Column}
		$_bo_Null:=(UTI_VarIsNull($_Ptr_ThisColumnField))
		Diary_InLPX($_Ptr_ThisColumnField; "Job")
		LBi_ModUpdate(->ORD_aPtr_LbDISetup; $_bo_Null; $_Ptr_ThisColumnField; $_l_Column; $_l_Row)
		
	End if 
Else 
	
	
	
End if 
ERR_MethodTrackerReturn("ORD_LBI_DiaryItems"; $_t_oldMethodName)