//%attributes = {}
If (False:C215)
	//Project Method Name:      UTI_ArrayDeleteElements
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
	C_LONGINT:C283($_l_DeletePosition; $_l_Elements; $_l_Index; $1; $2)
	C_POINTER:C301($_Ptr_Array)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("UTI_ArrayDeleteElements")
//Method: UTI_ArrayDeleteElements
//
//Purpose: Deletes elements from arrays

//$1 - longint, point to delete from
//$2 - longint, number of elements to delete
//$3...$n - pointers to arrays to delete from

If (Count parameters:C259>=3)
	$_l_DeletePosition:=$1
	$_l_Elements:=$2
	For ($_l_Index; 3; Count parameters:C259)
		$_Ptr_Array:=${$_l_Index}
		DELETE FROM ARRAY:C228($_Ptr_Array->; $_l_DeletePosition; $_l_Elements)
	End for 
End if 
//LOG_ResetMethod
ERR_MethodTrackerReturn("UTI_ArrayDeleteElements"; $_t_oldMethodName)
