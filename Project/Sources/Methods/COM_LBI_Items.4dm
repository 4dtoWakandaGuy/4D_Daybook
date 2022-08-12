//%attributes = {}

If (False:C215)
	//Project Method Name:      COM_LBI_Items
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
	C_BOOLEAN:C305($_bo_Null; $_bo_OK; Co_bo_addingSubentity)
	C_LONGINT:C283($_l_Column; $_l_Row)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_Ptr_ListBoxArea; $_ptr_ListboxSetup; $_Ptr_ThisColumnField)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("COM_LBI_Items")

//NG this mehtod replaces al mod contact.
//this was the call back method from the companies screen.
//we have never implemented direct input for any of the areas on this screen other than CONTACTS so this method only handles data entry for contacts
$_t_oldMethodName:=ERR_MethodTracker("COM_LBI_Items")
//ALModCont
$_ptr_ListboxSetup:=->COM_aptr_LBItemsSetup
$_Ptr_ListBoxArea:=$_ptr_ListboxSetup->{1}
LISTBOX GET CELL POSITION:C971($_Ptr_ListBoxArea->; $_l_Column; $_l_Row)
If ($_l_Column>0) & ($_l_Row>0)
	$_bo_OK:=LBi_ModIncl($_ptr_ListboxSetup; $_l_Column; $_l_Row)
	Co_bo_addingSubentity:=False:C215  //Always-its only set to true if we are adding and its not saved
	
	If (($_bo_OK) & (OK=1))
		$_ptr_ArrayFieldPointers:=$_ptr_ListboxSetup->{2}
		$_Ptr_ThisColumnField:=$_ptr_ArrayFieldPointers->{$_l_Column}
		$_bo_Null:=(UTI_VarIsNull($_Ptr_ThisColumnField))
		Contacts_InLPX($_Ptr_ThisColumnField)
		LBi_ModUpdate($_ptr_ListboxSetup; $_bo_Null; $_Ptr_ThisColumnField; $_l_Column; $_l_Row)
		//the following was done in the during phase
		
	End if 
Else 
	
	
	
End if 
ERR_MethodTrackerReturn("COM_LBI_Items"; $_t_oldMethodName)