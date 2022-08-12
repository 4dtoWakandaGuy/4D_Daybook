//%attributes = {}

If (False:C215)
	//Project Method Name:      LBi_DelAllElem
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
	C_LONGINT:C283($_l_FieldNumber; $_l_Index; $_l_SizeofArray; $_l_SizeofArray2; $_l_TableNumber)
	C_POINTER:C301($_ptr_ArrayofArrayPointers; $_Ptr_ThisColumnArray; $_ptr_Variable; $1)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName; DB_t_Methodname)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LBi_DelAllElem")

//NG 21/7/06 This method is a replacement for ALDelAllElem

$_t_oldMethodName:=ERR_MethodTracker("LBi_DelAllElem")
DB_t_Methodname:=Current method name:C684
//ALDelAllElem - deletes all the rows of an AL Area
If (Count parameters:C259>=1)
	If (GenValidatePointer($1))
		RESOLVE POINTER:C394($1; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_ptr_Variable:=Get pointer:C304($_t_VariableName)
		If (Type:C295($1->)=13)  //it is a 2D array
			$_ptr_ArrayofArrayPointers:=$_ptr_Variable->{$_l_TableNumber}{3}
			$_l_SizeofArray:=Size of array:C274($_ptr_Variable->{$_l_TableNumber})
		Else 
			$_ptr_ArrayofArrayPointers:=$1->{3}
			$_l_SizeofArray:=Size of array:C274($_ptr_ArrayofArrayPointers->)
		End if 
		RESOLVE POINTER:C394($_ptr_ArrayofArrayPointers; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_ptr_Variable:=Get pointer:C304($_t_VariableName)
		For ($_l_Index; 1; $_l_SizeofArray)
			If (Type:C295($_ptr_ArrayofArrayPointers->)=13)  //it is a 2D array
				$_Ptr_ThisColumnArray:=$_ptr_Variable->{$_l_TableNumber}{$_l_Index}
				$_l_SizeofArray2:=Size of array:C274($_Ptr_ThisColumnArray->)
				If ($_l_SizeofArray2>0)
					DELETE FROM ARRAY:C228($_Ptr_ThisColumnArray->; 1; $_l_SizeofArray2)
				End if 
			Else 
				$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_Index}
				$_l_SizeofArray2:=Size of array:C274($_Ptr_ThisColumnArray->)
				If ($_l_SizeofArray2>0)
					DELETE FROM ARRAY:C228($_Ptr_ThisColumnArray->; 1; $_l_SizeofArray2)
				End if 
			End if 
			
		End for 
	End if 
End if 
ERR_MethodTrackerReturn("LBi_DelAllElem"; $_t_oldMethodName)