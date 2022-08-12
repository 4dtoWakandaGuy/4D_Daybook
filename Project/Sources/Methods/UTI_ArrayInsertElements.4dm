//%attributes = {}
If (False:C215)
	//Project Method Name:      UTI_ArrayInsertElements
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
	C_LONGINT:C283($_l_Elements; $_l_Index; $_l_InsertPoint; $1; $2)
	C_POINTER:C301($_Ptr_Array)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("UTI_ArrayInsertElements")
//Method: UTI_ArrayInsertElements
//
//Purpose:
//
//$1 - longint, point to insert at
//$2 - longint, number of elements to insert
//$3...$n - pointers to arrays to insert in
//
$_l_InsertPoint:=$1
$_l_Elements:=$2
For ($_l_Index; 3; Count parameters:C259)
	$_Ptr_Array:=${$_l_Index}
	INSERT IN ARRAY:C227($_Ptr_Array->; $_l_InsertPoint; $_l_Elements)
End for 

//LOG_ResetMethod
ERR_MethodTrackerReturn("UTI_ArrayInsertElements"; $_t_oldMethodName)
