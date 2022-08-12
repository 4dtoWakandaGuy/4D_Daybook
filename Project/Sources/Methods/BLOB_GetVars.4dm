//%attributes = {}
If (False:C215)
	//Project Method Name:      BLOB_GetVars
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 16:41`Method: BLOB_GetVars
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

$_t_oldMethodName:=ERR_MethodTracker("BLOB_GetVars")
//Replaced by CAL4D_GetVarsFromBlob
ERR_MethodTrackerReturn("BLOB_GetVars"; $_t_oldMethodName)