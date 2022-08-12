//%attributes = {}
If (False:C215)
	//Project Method Name:      NTK_HTTP_SetData
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 11/12/2009 14:55`Method: NTK_HTTP_SetData
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BLOB:C604(CCM_Bl_TransRecord; HTTP_blb_Data)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("NTK_HTTP_SetData")
// (PM) HTTP_SetData
// Sets the data to send for a HTTP request
// This will overwrite any existing request parameters
// $1 = Pointer to blob with the data/payload

If (Count parameters:C259>=1)
	HTTP_blb_Data:=$1->
Else 
	SET BLOB SIZE:C606(CCM_Bl_TransRecord; 0)
End if 
ERR_MethodTrackerReturn("NTK_HTTP_SetData"; $_t_oldMethodName)