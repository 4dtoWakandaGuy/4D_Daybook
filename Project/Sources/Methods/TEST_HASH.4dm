//%attributes = {}
If (False:C215)
	//Project Method Name:      TEST_HASH
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 03/12/2009 14:01`Method: TEST_HASH
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("TEST_HASH")
//$key_len:=Length($1)
//$Key:=$1
//$Data:=$2
ERR_MethodTrackerReturn("TEST_HASH"; $_t_oldMethodName)