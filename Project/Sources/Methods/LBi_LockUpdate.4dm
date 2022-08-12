//%attributes = {}
If (False:C215)
	//Project Method Name:      LBi_LockUpdate
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_UpdateLocked)
	C_LONGINT:C283($_l_CurrentLockedColumn; $_l_Index; $_l_SIzeofArray)
	C_POINTER:C301($_ptr_ArrayOfColumFormats; $_ptr_ArrayofColumnLockFlags; $_ptr_ArrayReferences; $_Ptr_ListBox; $_ptr_ListboxSetup; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("LBi_LockUpdate")

//NG 19/7/06 this method is a direct replacement for ALLockUpdate
//Now of course at the moment we dont have a column lock in the list box--but the method will still operate to hold the lock and of course when we set up a way of locking it will display

//AlLockUpdate
$_ptr_ListboxSetup:=$1
$_Ptr_ListBox:=$_ptr_ListboxSetup->{1}
$_ptr_ArrayofColumnLockFlags:=$_ptr_ListboxSetup->{15}
$_ptr_ArrayReferences:=$_ptr_ListboxSetup->{9}
$_l_SIzeofArray:=Size of array:C274($_ptr_ArrayofColumnLockFlags->)
//$_l_CurrentLockedColumn:=AL_GetColLock ($_Ptr_ListBox->)
$_bo_UpdateLocked:=False:C215
For ($_l_Index; 1; $_l_SIzeofArray)
	If (($_l_Index=$_l_CurrentLockedColumn)#$_ptr_ArrayofColumnLockFlags->{$_l_Index})
		//$_l_CurrentLockedColumn:=$_l_Index
		$_ptr_ArrayofColumnLockFlags->{$_l_Index}:=($_l_Index=$_l_CurrentLockedColumn)
		$_bo_UpdateLocked:=True:C214
	End if 
End for 
If ($_bo_UpdateLocked)
	$_ptr_ArrayReferences->{4}:=Substring:C12($_ptr_ArrayReferences->{4}; 1; 2)+"2"+Substring:C12($_ptr_ArrayReferences->{4}; 4; 99)
	//$_ptr_ArrayReferences»{4}≤3≥:="2"
End if 
ERR_MethodTrackerReturn("LBi_LockUpdate"; $_t_oldMethodName)