//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_GetObjectNumber
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_GetObjectNumber (->object) --> Number
	
	// Returns the number at the end of the object's variable name.
	// All object variable names look something like this: <>Cal4D_Image001_pic
	
	// Access Type: Private
	
	// Parameters:
	//   $1 : Pointer : To a form object
	
	// Returns:
	//   $0 : Longint : The number embedded in the variable name
	
	// Created by Dave Batton on Aug 1, 2004
	// ----------------------------------------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:33`Method: Cal4D_GetObjectNumber
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_FieldNumber; $_l_ObjectPosition; $_l_TableNumber; $0)
	C_POINTER:C301($_ptr_Object; $1)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_GetObjectNumber")


$_ptr_Object:=$1

RESOLVE POINTER:C394($_ptr_Object; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
$_t_VariableName:=Substring:C12($_t_VariableName; Position:C15("_"; $_t_VariableName)+1)  // Remove the "<>Cal4D_" at the beginning. Mostly we need to get rid of the first "_" to search for the second one.
$_t_VariableName:=Substring:C12($_t_VariableName; 1; Position:C15("_"; $_t_VariableName)-1)  // Take off the variable type indicator.
$_t_VariableName:=Substring:C12($_t_VariableName; Length:C16($_t_VariableName)-2; 3)  // Get just the last three characters.
$_l_ObjectPosition:=Num:C11($_t_VariableName)  // Convert it to a number variable.

$0:=$_l_ObjectPosition
ERR_MethodTrackerReturn("Cal4D_GetObjectNumber"; $_t_oldMethodName)