//%attributes = {}
If (False:C215)
	//Project Method Name:      IME_DBEncrypt
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
	C_TEXT:C284($_t_Input; $_t_oldMethodName; $_t_Output; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IME_DBEncrypt")
//IME_DBEncrypt

//Prepare a URL for use within Daybook
//Add the daybook prefix and encrypt

$_t_Input:=$1

If ($_t_Input="daybook@")
	$_t_Output:=IME_EncryptWebRef($_t_Input)
Else 
	$_t_Output:=IME_EncryptWebRef("daybook"+$_t_Input)
End if 

$0:=$_t_Output
ERR_MethodTrackerReturn("IME_DBEncrypt"; $_t_oldMethodName)