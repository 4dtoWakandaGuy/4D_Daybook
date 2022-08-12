//%attributes = {"invisible":true,"shared":true}

If (False:C215)
	//Project Method Name:      CODE_IgnoreMethods
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  10/12/2019
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 

//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_MethodNames; 0)
	C_BOOLEAN:C305($_bo_ArrayCalled)
	C_POINTER:C301($_ptr_MethodNamesArray; $1)
End if 
//Code Starts Here
If (False:C215)
	//-------------------- Method Set Up -------------------
	//Project Method Name:      CODE_IgnoreMethods
	//Parameter Detail:
	//------------------ Method Narrative ------------------
	
	//------------------ Methods/Table List ----------------
	
	//Table(If any): 
	
	//Module: 
	
	//Calling Menu/Method/Form/Object Method: 
	//
	//Related Methods: 
	
	//
	//------------------ Assumptions ----------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/03/2017
	//Created BY: Nigel Greenlee
	
	////28/03/2017
	//Modified By: Nigel Greenlee
	
End if 
C_POINTER:C301($_ptr_MethodNamesArray; $1)
C_BOOLEAN:C305($_bo_ArrayCalled)

If (Count parameters:C259>=1)
	$_ptr_MethodNamesArray:=$1
	$_bo_ArrayCalled:=True:C214
End if 
If ($_bo_ArrayCalled)
	ARRAY TEXT:C222($_at_MethodNames; 0)
	//append to the above array and methods you need the code handler to not alter-these would normally be methods in which there is code that has code in parenthisis which you would not want the code handler altering!
	APPEND TO ARRAY:C911($_at_MethodNames; "CORE_*")
	APPEND TO ARRAY:C911($_at_MethodNames; "JUNK*")
	APPEND TO ARRAY:C911($_at_MethodNames; "COMPILER_*")
	APPEND TO ARRAY:C911($_at_MethodNames; "error*")
	APPEND TO ARRAY:C911($_at_MethodNames; "ERR_*")
	APPEND TO ARRAY:C911($_at_MethodNames; "AA_JUNK*")
	APPEND TO ARRAY:C911($_at_MethodNames; "DIFFu_*")
	APPEND TO ARRAY:C911($_at_MethodNames; "DB_FIXMETHODS2019*")
	
	COPY ARRAY:C226($_at_MethodNames; $_ptr_MethodNamesArray->)
	
End if 
