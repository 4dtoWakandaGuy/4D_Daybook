//%attributes = {}
If (False:C215)
	//Project Method Name:      LBI_InsertElem
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
	C_LONGINT:C283($_l_Index; $_l_InsertPoint; $_l_NumberofLines; $_l_SizeofArray; $2; $3)
	C_POINTER:C301($_ptr_ArrayofArrayPointers; $_ptr_ListBoxSetup; $_Ptr_ThisColumnArray; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("LBI_InsertElem")

//NG 21/07/2006 This method a direct replacement for ALinsertElem
If (Count parameters:C259>=3)
	$_ptr_ListBoxSetup:=$1
	$_l_InsertPoint:=$2
	$_l_NumberofLines:=$3
	$_ptr_ArrayofArrayPointers:=$_ptr_ListBoxSetup->{3}
	$_l_SizeofArray:=Size of array:C274($_ptr_ArrayofArrayPointers->)
	For ($_l_Index; 1; $_l_SizeofArray)
		$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_Index}
		INSERT IN ARRAY:C227($_Ptr_ThisColumnArray->; $_l_InsertPoint; $_l_NumberofLines)
	End for 
End if 
ERR_MethodTrackerReturn("LBi_InsertElem"; $_t_oldMethodName)