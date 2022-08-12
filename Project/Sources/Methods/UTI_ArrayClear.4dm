//%attributes = {}
If (False:C215)
	//Project Method Name:      UTI_ArrayClear
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
	C_LONGINT:C283($_l_Index; $_l_SizeofArray)
	C_POINTER:C301($_Ptr_Array)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("UTI_ArrayClear")
//******************************************************************************
//
//Method: UTI_ArrayClear
//
//Written by  jmoore on 4/27/99
//
//Purpose: general purpose routine for clearing an array or arrays
//
//$1...$n - pointer to array
//
//******************************************************************************
If (Count parameters:C259>=0)
	For ($_l_Index; 1; Count parameters:C259)
		$_Ptr_Array:=${$_l_Index}
		$_l_SizeofArray:=Size of array:C274($_Ptr_Array->)
		If ($_l_SizeofArray>0)
			DELETE FROM ARRAY:C228($_Ptr_Array->; 1; $_l_SizeofArray)
		End if 
	End for 
End if 
ERR_MethodTrackerReturn("UTI_ArrayClear"; $_t_oldMethodName)
