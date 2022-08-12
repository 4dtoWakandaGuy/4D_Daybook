//%attributes = {}
If (False:C215)
	//Project Method Name:      LBi_FindElem
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
	C_LONGINT:C283($_l_KeyPosition; $0)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_ArrayofArrayPointers; $_Ptr_KeyField; $_ptr_ListboxSetup; $_Ptr_ThisColumnArray; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("LBi_FindElem")

//This method is a replacement for ALFindElem

//ALFindElem - finds the relevant row from the value of the record's key field
$_ptr_ListboxSetup:=$1
$_ptr_ArrayFieldPointers:=$_ptr_ListboxSetup->{2}
$_Ptr_KeyField:=$_ptr_ListboxSetup->{8}
$_l_KeyPosition:=Find in array:C230($_ptr_ArrayFieldPointers->; $_Ptr_KeyField)
If ($_l_KeyPosition>0)
	$_ptr_ArrayofArrayPointers:=$_ptr_ListboxSetup->{3}
	$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_KeyPosition}
	$0:=Find in array:C230($_Ptr_ThisColumnArray->; $_Ptr_KeyField->)
Else 
	$0:=-2
End if 
ERR_MethodTrackerReturn("LBi_FindElem"; $_t_oldMethodName)