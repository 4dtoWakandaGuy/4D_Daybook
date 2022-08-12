//%attributes = {}
If (False:C215)
	//Project Method Name:      UTI_ArrayInsertAt
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
	C_LONGINT:C283($_l_HighPoint; $_l_LowPoint; $_l_MidPoint; $_l_SizeofArray; $0)
	C_POINTER:C301($_Ptr_Array; $_Ptr_Value; $1; $2; $CounterPtr)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("UTI_ArrayInsertAt")

//(P)UTI_ArrayInsertAt(Pointer;Pointer) -> longint

//$1 is pointer to sorted array
//$2 is pointer to variable/field containing value to place in array

//$0 is longint containing element position to insert new element
//Switch off range-checking for the duration
//%R-
If (Count parameters:C259>=2)
	$_Ptr_Array:=$1
	$_Ptr_Value:=$2
	
	$_l_SizeofArray:=Size of array:C274($_Ptr_Array->)
	If ($_l_SizeofArray>0)
		$_l_LowPoint:=0  //lower boundary of range
		$_l_HighPoint:=$_l_SizeofArray+1  //Upper boundary of range
		
		While (($_l_LowPoint+1)#$_l_HighPoint)  //while range contains elements
			$_l_MidPoint:=($_l_LowPoint+$_l_HighPoint)\2  //calc midpoint of the range
			If ($_Ptr_Array->{$_l_MidPoint}<$_Ptr_Value->)  //if value at midpoint
				$_l_LowPoint:=$_l_MidPoint  //reset lower boundary to midpoint
			Else 
				$_l_HighPoint:=$_l_MidPoint  //reset upper boundary to midpoint
			End if 
		End while 
		$0:=$_l_HighPoint
	Else 
		$0:=1
	End if 
Else 
	$0:=0
End if 
//Switch on range-checking again
//%R+
ERR_MethodTrackerReturn("UTI_ArrayInsertAt"; $_t_oldMethodName)
