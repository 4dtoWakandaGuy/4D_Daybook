//%attributes = {}
If (False:C215)
	//Project Method Name:      NTK_HTTP_Addparameter
	//------------------ Method Notes ------------------
	// (PM) HTTP_AddRequestParameter
	// Adds a request parameter to a HTTP request
	// $1 = Name
	// $2 = Value
	
	//------------------ Revision Control ----------------
	//Date Created: 11/12/2009 15:06`Method: NTK_HTTP_Addparameter
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_POINTER:C301($3)
	C_TEXT:C284($_t_Name; $_t_oldMethodName; $_t_Value; $1; $2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("NTK_HTTP_Addparameter")

If (Count parameters:C259>=3)
	$_t_Name:=$1
	$_t_Value:=$2
	
	// URL encode the parameters
	$_t_Name:=CCM_EncodeURL($_t_Name)
	$_t_Value:=CCM_EncodeURL($_t_Value)
	
	// If we already have request parameters, append a "&" character
	If (BLOB size:C605($3->)>0)
		TEXT TO BLOB:C554("&"; $3->; Mac text without length:K22:10; *)
	End if 
	
	// Append the request parameters
	TEXT TO BLOB:C554($_t_Name+"="+$_t_Value; $3->; Mac text without length:K22:10; *)
End if 
ERR_MethodTrackerReturn("NTK_HTTP_Addparameter"; $_t_oldMethodName)
