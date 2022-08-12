//%attributes = {}
If (False:C215)
	//Project Method Name:      IME_WebMessagesAddWarning
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
	//ARRAY TEXT(IME_at_WarningMessageName;0)
	//ARRAY TEXT(IME_at_WarningMessageText;0)
	C_LONGINT:C283($_l_NewSizeofArray)
	C_TEXT:C284($_t_oldMethodName; $1; $2; $WarningMessageName; $WarningMessageText)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IME_WebMessagesAddWarning")  //added 27/02/08

$WarningMessageName:=$1
$WarningMessageText:=$2


$_l_NewSizeofArray:=Size of array:C274(IME_at_WarningMessageName)+1
INSERT IN ARRAY:C227(IME_at_WarningMessageName; $_l_NewSizeofArray)
INSERT IN ARRAY:C227(IME_at_WarningMessageText; $_l_NewSizeofArray)
IME_at_WarningMessageName{$_l_NewSizeofArray}:=$1
IME_at_WarningMessageText{$_l_NewSizeofArray}:=$2
ERR_MethodTrackerReturn("IME_WebMessagesAddWarning"; $_t_oldMethodName)