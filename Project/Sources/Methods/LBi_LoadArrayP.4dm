//%attributes = {}

If (False:C215)
	//Project Method Name:      LBi_LoadArrayP
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
	C_POINTER:C301($_ptr_array; $_ptr_array2)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LBi_LoadArrayP")

//NG 20/7/06 this method is a direct replacement for ALLoadArrayP

$_ptr_array:=Get pointer:C304("a"+$1+"FldP")
$_ptr_array2:=Get pointer:C304("a"+$1+"ArrP")
LBi_LoadArrays($_ptr_array; $_ptr_array2)
ERR_MethodTrackerReturn("LBi_LoadArrayP"; $_t_oldMethodName)