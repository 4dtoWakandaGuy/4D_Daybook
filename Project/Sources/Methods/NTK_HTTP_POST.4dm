//%attributes = {}
If (False:C215)
	//Project Method Name:      NTK_HTTP_POST
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 11/12/2009 15:13`Method: NTK_HTTP_POST
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Error; $0)
	C_POINTER:C301($_ptr_Response; $1; $2)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("NTK_HTTP_POST")

// (PM) HTTP_Post
// Performs a POST request
// $1 = Pointer to blob with response
// $0 = Error code

$_l_Error:=99999
If (Count parameters:C259>=2)
	$_ptr_Response:=$1
	
	$_l_Error:=NTK_SendRequest("POST"; $_ptr_Response; $2)
End if 
$0:=$_l_Error
ERR_MethodTrackerReturn("NTK_HTTP_POST"; $_t_oldMethodName)
