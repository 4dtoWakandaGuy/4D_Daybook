//%attributes = {}
If (False:C215)
	//Project Method Name:      NTK_HTTP_DeleteRequest
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 11/12/2009 15:15`Method: NTK_HTTP_DeleteRequest
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(HTTP_Port; HTTP_TimeOut)
	C_TEXT:C284($_t_oldMethodName; HTTP_Host; HTTP_Path; HTTP_Protocol; HTTP_URL)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("NTK_HTTP_DeleteRequest")
// (PM) HTTP_DeleteRequest
// Destroys a HTTP request object

// Clear all the variables used by the HTTP module
HTTP_URL:=""
HTTP_Protocol:=""
HTTP_Host:=""
HTTP_Path:=""
HTTP_Port:=0
HTTP_TimeOut:=0
//SET BLOB SIZE(HTTP_blb_Data;0)
ERR_MethodTrackerReturn("NTK_HTTP_DeleteRequest"; $_t_oldMethodName)