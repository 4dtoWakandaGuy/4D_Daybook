If (False:C215)
	//object Name: Object Name:      CCM_PostValuesTest.Button1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:03
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(HTTP_at_Data;0)
	//ARRAY TEXT(HTTP_at_FieldNames;0)
	C_BLOB:C604($_blb_Response; CCM_Bl_TransRecord)
	C_LONGINT:C283($_l_Error; $_l_Index)
	C_POINTER:C301(HTTP_BlobPtr)
	C_TEXT:C284($_t_oldMethodName; HTTPClient_Response; HTTPClient_URL)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ CCM_PostValuesTest.Button1"; Form event code:C388)

// (OM) HTTPClient_SendButton
//```

NTK_NewRequest(HTTPClient_URL)

// Add the request parameters
For ($_l_Index; 1; Size of array:C274(HTTP_at_FieldNames))
	NTK_HTTP_Addparameter(HTTP_at_FieldNames{$_l_Index}; HTTP_at_Data{$_l_Index}; ->CCM_Bl_TransRecord)
End for 

// Send the request

$_l_Error:=NTK_HTTP_POST(HTTP_BlobPtr; ->CCM_Bl_TransRecord)



// Clean up
NTK_HTTP_DeleteRequest


HTTPClient_Response:=BLOB to text:C555(HTTP_BlobPtr->; Mac text without length:K22:10)
ERR_MethodTrackerReturn("OBJ CCM_PostValuesTest.Button1"; $_t_oldMethodName)
