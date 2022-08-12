//%attributes = {}
If (False:C215)
	//Project Method Name:      LBi_SubKeyUp
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/11/2010 11:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Index; $_l_NumberofColumns; $_l_NumberofRows; $2)
	C_POINTER:C301($_ptr_ArrayofArrayPointers; $_ptr_ListboxSetup; $_Ptr_ThisColumnArray; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("LBi_SubKeyUp")

//NG 19/7/2006 This methid is a direct replacement for ALSubKeyup

//ALSubKeyUp - updates the subfile key nos where necessary
If (Count parameters:C259>=2)
	//TRACE
	$_ptr_ListboxSetup:=->$1
	$_ptr_ArrayofArrayPointers:=$_ptr_ListboxSetup->{3}
	$_l_NumberofColumns:=Size of array:C274($_ptr_ArrayofArrayPointers->)  //the no of columns
	$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{1}
	$_l_NumberofRows:=Size of array:C274($_Ptr_ThisColumnArray->)  //the no of rows
	
	$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_NumberofColumns}  //pointer to the last array (ie the key)
	If ($2=-1)
		$_Ptr_ThisColumnArray->{$_l_NumberofRows}:=$_l_NumberofRows
	Else 
		For ($_l_Index; 1; $_l_NumberofRows)
			If ($_Ptr_ThisColumnArray->{$_l_Index}>=$2)
				$_Ptr_ThisColumnArray->{$_l_Index}:=$_Ptr_ThisColumnArray->{$_l_Index}-1
			End if 
		End for 
	End if 
End if 
ERR_MethodTrackerReturn("LBi_SubKeyUp"; $_t_oldMethodName)