//%attributes = {}
If (False:C215)
	//Project Method Name:      LB_ReduceArrayBasedOnLBSelect
	//------------------ Method Notes ------------------
	//Parameters:
	//$1 = Pointer to the Listbox area
	//$2 = Pointer to an array to be reduced to just those line numbers that match the highlighted lines in the Listbox
	//$3 = Boolean if set to true makes this function set the array to the inverse of the highlighted lines (ie all lines that are UN-highlighted). if not passed defaults to false
	//
	//Takes a Listbox area and an array (ANY ARRAY) and reduces the array to line numbers matching the highlighted lines in the listbox
	//
	//NOTE: It is up to the developer to ensure that a sensible array that matches one of the LB columns is used. The only validation this method does is to ensure that the array is of the correct length.
	//
	//Example: (as used in SD2_DiaryViewManageSelectionNEW to create an array called $_at_DiaryRecordCodes that contains only highlighted diary codes)
	//$_ptr_ArrayofArrayPointers:=SD2_aptr_ListControl{3}
	//$_ptr_ArrayFieldPointers:=SD2_aptr_ListControl{2}
	//$_Ptr_KeyField:=SD2_aptr_ListControl{8}
	//$_l_KeyPosition:=Find in array($_ptr_ArrayFieldPointers->;$_Ptr_KeyField)
	//If ($_l_KeyPosition>0)  `it should be
	//$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_KeyPosition}
	//End if
	//ARRAY STRING(55;$_at_DiaryrecordCodes;0)
	//COPY ARRAY($_Ptr_ThisColumnArray->;$_at_DiaryrecordCodes)
	//LB_ReduceArrayBasedOnLBSelect(->SD_lb_Workflow;->$_at_DiaryRecordCodes)
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Hightlighted; $_bo_ReturnInverse; $3)
	C_LONGINT:C283($_Index; $_SizeofArray; $_SizeofArray2)
	C_POINTER:C301($_ptr_ArrayToReduce; $_ptr_ListboxArea; $1; $2)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LB_ReduceArrayBasedOnLBSelect")
//LB_ReduceArrayBasedOnLBSelect
//
//Added 20/06/08 -kmw
//
//
//
//
$_ptr_ListboxArea:=$1
$_ptr_ArrayToReduce:=$2
If (Count parameters:C259>2)
	$_bo_ReturnInverse:=$3
Else 
	$_bo_ReturnInverse:=False:C215
End if 
//
//
$_SizeofArray:=Size of array:C274($_ptr_ListboxArea->)
$_SizeofArray2:=Size of array:C274($_ptr_ArrayToReduce->)
//
If ($_SizeofArray=$_SizeofArray2)
	For ($_Index; $_SizeofArray; 1; -1)
		$_bo_Hightlighted:=$_ptr_ListboxArea->{$_Index}
		If ($_bo_Hightlighted=$_bo_ReturnInverse)  //If $_bo_ReturnInverse AND $_bo_Hightlighted then we must delete. If NOT $_bo_ReturnInverse AND NOT $_bo_Hightlighted then we must delete. Therefore delete if $_bo_Hightlighted = $bReturnInvoice
			DELETE FROM ARRAY:C228($_ptr_ArrayToReduce->; $_Index)
		End if 
	End for 
Else 
	Gen_Alert("Developer error in method LB_ReduceArrayBasedOnLBSelect. Array sizes do not match"+".")
End if 
//
//
ERR_MethodTrackerReturn("LB_ReduceArrayBasedOnLBSelect"; $_t_oldMethodName)