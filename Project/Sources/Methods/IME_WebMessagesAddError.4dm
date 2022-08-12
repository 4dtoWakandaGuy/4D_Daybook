//%attributes = {}
If (False:C215)
	//Project Method Name:      IME_WebMessagesAddError
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
	//Array TEXT(IME_at_ErrorMessageName;0)
	//Array TEXT(IME_at_ErrorMessageText;0)
	C_LONGINT:C283($NewSizeOfArray)
	C_TEXT:C284($_t_oldMethodName; $1; $2; $ErrorMessageName; $ErrorMessageText)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IME_WebMessagesAddError")  //added 27/02/08

$ErrorMessageName:=$1
$ErrorMessageText:=$2


$NewSizeOfArray:=Size of array:C274(IME_at_ErrorMessageName)+1
INSERT IN ARRAY:C227(IME_at_ErrorMessageName; $NewSizeOfArray)
INSERT IN ARRAY:C227(IME_at_ErrorMessageText; $NewSizeOfArray)
IME_at_ErrorMessageName{$NewSizeOfArray}:=$1
IME_at_ErrorMessageText{$NewSizeOfArray}:=$2
ERR_MethodTrackerReturn("IME_WebMessagesAddError"; $_t_oldMethodName)