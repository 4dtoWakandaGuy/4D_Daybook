//%attributes = {}
If (False:C215)
	//Project Method Name:      NTK_NewRequest
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 11/12/2009 14:57`Method: NTK_NewRequest
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BLOB:C604(CCM_Bl_TransRecord)
	C_BOOLEAN:C305($0)
	C_LONGINT:C283(HTTP_Port; HTTP_TimeOut)
	C_TEXT:C284($_t_oldMethodName; $1; HTTP_Host; HTTP_Path; HTTP_Protocol; HTTP_URL)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("NTK_NewRequest")
// (PM) HTTP_NewRequest
// Initializes a new HTTP request
// $1 = URL


If (Count parameters:C259>=1)
	$0:=True:C214
	// Set the default properties (url and empty data/blob)
	NTK_HTTP_SETURL($1)
	NTK_HTTP_SetData
	NTK_SetTimeOut(10)
Else 
	$0:=False:C215
End if 
ERR_MethodTrackerReturn("NTK_NewRequest"; $_t_oldMethodName)
