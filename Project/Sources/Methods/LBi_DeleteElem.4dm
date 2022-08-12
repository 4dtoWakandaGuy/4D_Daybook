//%attributes = {}

If (False:C215)
	//Project Method Name:      LBi_DeleteElem
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_DeleteRowStart; $_l_Index; $_l_NumberofRowstoDelete; $_l_SizeofArray; $2; $3)
	C_POINTER:C301($_ptr_ArrayofArrayPointers; $_ptr_ListBoxSetup; $_Ptr_ThisColumnArray; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LBi_DeleteElem")

//NG 18/7/06 Direct replacement for ALDeleteElement
$_t_oldMethodName:=ERR_MethodTracker("LBi_DeleteElem")
//ALDeleteElem - delete one or more specific rows
//$_ptr_ListBoxSetup=Pointer to area
//$2=Row number to start deletion at
//$3=Number of rows to delete(1 if omited)
If (Count parameters:C259>=2)
	$_ptr_ListBoxSetup:=$1
	$_l_DeleteRowStart:=$2
	If (Count parameters:C259>=3)
		$_l_NumberofRowstoDelete:=$3
	Else 
		$_l_NumberofRowstoDelete:=1
	End if 
	$_ptr_ArrayofArrayPointers:=$_ptr_ListBoxSetup->{3}
	$_l_SizeofArray:=Size of array:C274($_ptr_ArrayofArrayPointers->)
	For ($_l_Index; 1; $_l_SizeofArray)
		$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_Index}
		DELETE FROM ARRAY:C228($_Ptr_ThisColumnArray->; $_l_DeleteRowStart; $_l_NumberofRowstoDelete)
	End for 
End if 
ERR_MethodTrackerReturn("LBi_DeleteElem"; $_t_oldMethodName)