//%attributes = {}
If (False:C215)
	//Project Method Name:      BLOB_PutVars
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 16:43`Method: BLOB_PutVars
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

$_t_oldMethodName:=ERR_MethodTracker("BLOB_PutVars")
//REPLACED BY CAL4D_VarstoBlob
ERR_MethodTrackerReturn("BLOB_PutVars"; $_t_oldMethodName)