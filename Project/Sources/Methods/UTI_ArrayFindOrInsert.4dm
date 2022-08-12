//%attributes = {}
If (False:C215)
	//Project Method Name:      UTI_ArrayFindOrInsert
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
	C_POINTER:C301($_Ptr_Array; $_ptr_Counter; $1; $2)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("UTI_ArrayFindOrInsert")
//******************************************************************************
//
//Method: UTI_ArrayFindOrInsert
//
//Written by  John Moore on 10/9/98
//
//Purpose: Looks for element in sorted array. If not found, inserts it
//
//$1 is pointer to sorted array
//$2 is pointer to variable/field containing value to place in array

//$0 is longint containing element position of (new) element

//******************************************************************************


If (Count parameters:C259>=1)
	$_Ptr_Array:=$1
	$_ptr_Array:=$2
	
	$_l_SizeofArray:=Size of array:C274($_Ptr_Array->)
	If ($_l_SizeofArray>0)
		$_l_LowPoint:=0  //lower boundary of range
		$_l_HighPoint:=$_l_SizeofArray+1  //Upper boundary of range
		
		While (($_l_LowPoint+1)#$_l_HighPoint)  //while range contains elements
			$_l_MidPoint:=($_l_LowPoint+$_l_HighPoint)\2  //calc midpoint of the range
			If ($_Ptr_Array->{$_l_MidPoint}<$_ptr_Array->)  //if value at midpoint
				$_l_LowPoint:=$_l_MidPoint  //reset lower boundary to midpoint
			Else 
				$_l_HighPoint:=$_l_MidPoint  //reset upper boundary to midpoint
			End if 
		End while 
		Case of   //***
			: ($_l_HighPoint>$_l_SizeofArray)  //empty array or target value >value of last element
				//must check this first to avoid range check errors ***
				INSERT IN ARRAY:C227($_Ptr_Array->; $_l_HighPoint)
				$_Ptr_Array->{$_l_HighPoint}:=$_ptr_Array->
				$0:=$_l_HighPoint
				
			: ($_Ptr_Array->{$_l_HighPoint}=$_ptr_Array->)  //exact match (most likely, so check next) ***
				$0:=$_l_HighPoint  //return element # of first match
				
			Else   //not exact match
				INSERT IN ARRAY:C227($_Ptr_Array->; $_l_HighPoint)
				$_Ptr_Array->{$_l_HighPoint}:=$_ptr_Array->
				$0:=$_l_HighPoint
				
		End case 
	Else 
		INSERT IN ARRAY:C227($_Ptr_Array->; 1)
		$_Ptr_Array->{1}:=$_ptr_Array->
		$0:=1
	End if 
End if 
ERR_MethodTrackerReturn("UTI_ArrayFindOrInsert"; $_t_oldMethodName)
