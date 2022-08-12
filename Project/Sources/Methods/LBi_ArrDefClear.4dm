//%attributes = {}

If (False:C215)
	//Project Method Name:      LBi_ArrDefClear
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
	C_LONGINT:C283($_l_FieldNumber; $_l_SizeofArray; $_l_TableNumber)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_ArrayOfArrayNames; $_ptr_ArrayofArrayPointers; $_ptr_ListboxArea; $_ptr_ListboxSetup; $1)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName; DB_t_Methodname)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LBi_ArrDefClear")

//NG 21/7/2006 This method is a replacement for ALArrDefClear

$_t_oldMethodName:=ERR_MethodTracker("LBi_ArrDefClear")
DB_t_Methodname:=Current method name:C684
//ALArrDefClear  Called to reset AL arrays to size 0
If (Count parameters:C259>=1)
	If (GenValidatePointer($1))
		$_ptr_ListboxSetup:=$1
		RESOLVE POINTER:C394($_ptr_ListboxSetup; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_ptr_ListboxArea:=Get pointer:C304($_t_VariableName)
		If (Type:C295($_ptr_ListboxSetup->)=13)  //it is a 2D array
			$_ptr_ArrayFieldPointers:=$_ptr_ListboxArea->{$_l_TableNumber}{2}
			$_ptr_ArrayofArrayPointers:=$_ptr_ListboxArea->{$_l_TableNumber}{3}
			$_ptr_ArrayOfArrayNames:=$_ptr_ListboxArea->{$_l_TableNumber}{4}
		Else 
			$_ptr_ArrayFieldPointers:=$_ptr_ListboxSetup->{2}
			$_ptr_ArrayofArrayPointers:=$_ptr_ListboxSetup->{3}
			$_ptr_ArrayOfArrayNames:=$_ptr_ListboxSetup->{4}
		End if 
		
		$_l_SizeofArray:=Size of array:C274($_ptr_ArrayFieldPointers->)
		If ($_l_SizeofArray>0)
			DELETE FROM ARRAY:C228($_ptr_ArrayFieldPointers->; 1; $_l_SizeofArray)
			DELETE FROM ARRAY:C228($_ptr_ArrayofArrayPointers->; 1; $_l_SizeofArray)
			DELETE FROM ARRAY:C228($_ptr_ArrayOfArrayNames->; 1; $_l_SizeofArray)
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("LBi_ArrDefClear"; $_t_oldMethodName)