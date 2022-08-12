//%attributes = {}

If (False:C215)
	//Project Method Name:      LBi_ArrayFillT
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
	C_LONGINT:C283($_l_Countparameters; $_l_Element; $_l_FieldNumber; $_l_index; $_l_Row; $_l_SizeofArray; $_l_Start; $_l_TableNumber; $2)
	C_POINTER:C301($_ptr_Variable; $1)
	C_TEXT:C284($_t_Data; $_t_oldMethodName; $_t_Value; $_t_VariableName; $10; $11; $12; $13; $3; $4; $5)
	C_TEXT:C284($6; $7; $8; $9; DB_t_Methodname)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LBi_ArrayFillT")

//NG 20/7/06 This method is a replacement for ALArrayFillT
//NOTE JULY 2007 ALarrayFillT is now modified so these do not match!!
$_t_oldMethodName:=ERR_MethodTracker("LBi_ArrayFillT")
DB_t_Methodname:=Current method name:C684
//ALArrayfillT
//$1» = array to fill
//$2… = values (text) to fill in

If (Count parameters:C259>=2)
	$_l_Countparameters:=Count parameters:C259  //First_Parameter is array to fill
	$_l_Row:=$2
	//$_l_Start:=Size of array($1->)+1
	
	//make sure the array is the right size
	//INSERT ELEMENT($1->;$_l_Start;$_l_Countparameters)
	
	//For ($_l_index;1;$_l_Countparameters)
	//$_t_Data:=${$_l_index+1}  `two statements for the compiler
	//$1->{$_l_Start+$_l_index-1}:=$_t_Data
	//End for
	
	
	If (GenValidatePointer($1))
		RESOLVE POINTER:C394($1; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_ptr_Variable:=Get pointer:C304($_t_VariableName)
		If (Type:C295($1->)=13)  //it is a 2D array
			If (Size of array:C274($_ptr_Variable->)<$_l_Row)  //First make sure there are enough rows this should never happen but just in case
				Repeat 
					$_l_SizeofArray:=Size of array:C274($_ptr_Variable->)
					INSERT IN ARRAY:C227($_ptr_Variable->; $_l_SizeofArray+1; 1)
				Until (Size of array:C274($_ptr_Variable->)>=$_l_Row)
			End if 
			$_l_Start:=1  //Size of array($_ptr_Variable->{$_l_Row})+1
			
		Else 
			$_l_Start:=1  //Size of array($1->)+1
		End if 
		
		For ($_l_index; 3; $_l_Countparameters)
			$_t_Data:=${$_l_index}  //two statements for the compiler
			$_t_Value:=${$_l_index}  //two statements for the compiler
			$_l_Element:=$_l_Start+($_l_index-3)
			If (Type:C295($1->)=13)  //it is a 2D array
				
				If ($_l_Element>Size of array:C274($_ptr_Variable->{$_l_Row}))
					APPEND TO ARRAY:C911($_ptr_Variable->{$_l_Row}; $_t_Value)
				Else 
					$_ptr_Variable->{$_l_Row}{$_l_Element}:=$_t_Value
				End if 
				If (Size of array:C274($_ptr_Variable->{$_l_Row})<11)
					Repeat 
						APPEND TO ARRAY:C911($_ptr_Variable->{$_l_Row}; "")
					Until (Size of array:C274($_ptr_Variable->{$_l_Row})=11)
				End if 
			Else 
				
				
				If ($_l_Element>Size of array:C274($1->))
					APPEND TO ARRAY:C911($1->; $_t_Value)
				Else 
					$1->{$_l_Element}:=$_t_Value
				End if 
				If (Size of array:C274($1->)<11)
					Repeat 
						APPEND TO ARRAY:C911($1->; "")
					Until (Size of array:C274($1->)=11)
				End if 
			End if 
		End for 
	End if 
End if 
ERR_MethodTrackerReturn("LBi_ArrayFillT"; $_t_oldMethodName)