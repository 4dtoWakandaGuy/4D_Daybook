//%attributes = {}

If (False:C215)
	//Project Method Name:      LBi_ArrayFillN
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
	C_LONGINT:C283($_l_Element; $_l_FieldNumber; $_l_Index; $_l_NumberofParameters; $_l_SizeofArray; $_l_TableNumber)
	C_POINTER:C301($_ptr_Variable; $1)
	C_REAL:C285($_r_Data)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName; DB_t_Methodname)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LBi_ArrayFillN")

//NG 20/7/06 This method is a replacement for ALArrayFillN
DB_t_Methodname:=Current method name:C684
//ALArrayFillN
//$1» = array to fill
//$2… = values (pointers) to fill in

If (Count parameters:C259>=2)
	If (GenValidatePointer($1))
		$_l_NumberofParameters:=Count parameters:C259-1  //First_Parameter is array to fill
		$_l_SizeofArray:=Size of array:C274($1->)+1
		//make sure the array is the right size
		INSERT IN ARRAY:C227($1->; $_l_SizeofArray; $_l_NumberofParameters)
		
		//For ($_l_Index;1;$_l_NumberofParameters)
		//$_r_Data:=${$_l_Index+1}  `two statements for the compiler
		//$1->{$_l_SizeofArray+$_l_Index-1}:=$_r_Data
		//End for
		RESOLVE POINTER:C394($1; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_ptr_Variable:=Get pointer:C304($_t_VariableName)
		For ($_l_Index; 1; $_l_NumberofParameters)
			$_r_Data:=${$_l_Index+1}  //two statements for the compiler
			$_l_Element:=$_l_SizeofArray+$_l_Index-1
			If (Type:C295($1->)=13)  //it is a 2D array
				$_ptr_Variable->{$_l_TableNumber}{$_l_Element}:=$_r_Data
			Else 
				
				$1->{$_l_Element}:=$_r_Data
			End if 
		End for 
	End if 
End if 
ERR_MethodTrackerReturn("LBi_ArrayFillN"; $_t_oldMethodName)