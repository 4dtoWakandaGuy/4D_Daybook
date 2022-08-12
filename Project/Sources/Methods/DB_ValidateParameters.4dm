//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_ValidateParameters
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
	C_BOOLEAN:C305($_bo_CountisOK; $0)
	C_LONGINT:C283($_l_Count; $_l_Maximum; $_l_Minimum; $2; $3; $4)
	C_TEXT:C284($_t_ErrorText; $_t_oldMethodName; $1; $methodName_text)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_ValidateParameters")

$_bo_CountisOK:=False:C215  // Default.
If (Count parameters:C259>=4)  // Test that this routine has enough parameters!
	$methodName_text:=$1
	$_l_Minimum:=$2
	$_l_Maximum:=$3
	$_l_Count:=$4
	If (($_l_Count<$_l_Minimum) | ($_l_Count>$_l_Maximum))  // Not enough parameters | Too many parameters
		$_bo_CountisOK:=False:C215  // This is a good place to log or display an error.
		$_t_ErrorText:=""
		$_t_ErrorText:=$_t_ErrorText+Char:C90(Double quote:K15:41)+$methodName_text+Char:C90(Double quote:K15:41)
		$_t_ErrorText:=$_t_ErrorText+" called with "+String:C10($_l_Count)+" parameter(s). "
		$_t_ErrorText:=$_t_ErrorText+Char:C90(Carriage return:K15:38)+Char:C90(Carriage return:K15:38)
		$_t_ErrorText:=$_t_ErrorText+"At least "+String:C10($_l_Minimum)
		$_t_ErrorText:=$_t_ErrorText+" required and at most "+String:C10($_l_Maximum)+" allowed."
		ALERT:C41($_t_ErrorText)
	Else 
		$_bo_CountisOK:=True:C214
	End if 
Else   // The ParameterCountIsOkay routine didn't get enough parameters.
	// This is a good place to log or display an error.
	$_t_ErrorText:=""
	$_t_ErrorText:=$_t_ErrorText+" called with "+String:C10($_l_Count)+" parameter(s). "
	$_t_ErrorText:=$_t_ErrorText+Char:C90(Carriage return:K15:38)
	$_t_ErrorText:=$_t_ErrorText+"Four parameters are required"
	ALERT:C41($_t_ErrorText)
End if   //(Count parameters>=4)
$0:=$_bo_CountisOK
ERR_MethodTrackerReturn("DB_ValidateParameters"; $_t_oldMethodName)