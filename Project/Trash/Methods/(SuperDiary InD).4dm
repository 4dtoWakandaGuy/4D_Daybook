//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      SuperDiary_InD
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
	C_LONGINT:C283($_l_FieldNumber; $_l_SourceProcess; $_l_TableNumber; $srcElement)
	C_POINTER:C301($_ptr_FocusObject; $srcObject)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SuperDiary_InD")
//SuperDiary_InD
//could use last area?
$_ptr_FocusObject:=Focus object:C278
//resolve the pointer to get the variable name of the last object
//$_ptr_FocusObject= pointer to last object edited ($1)
//$_t_VariableName= name of last object edited ($2)
RESOLVE POINTER:C394($_ptr_FocusObject; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
SuperDiary_InLPX($_ptr_FocusObject; $_t_VariableName)

// $1:= $_ptr_FocusObject= pointer to last object edited
// $2:= $_t_VariableName= name of last object edited
ERR_MethodTrackerReturn("SuperDiary_InD"; $_t_oldMethodName)