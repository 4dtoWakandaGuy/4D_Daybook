//%attributes = {}

If (False:C215)
	//Project Method Name:      DB_UserHas4DWriteAccess
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  21/01/2020
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN($0)
	C_BOOLEAN:C305($0; $_bo_4dWriteInstalled)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("DB_UserHas4DWriteAccess")
$_bo_4DWriteInstalled:=False:C215
If (UTIL_4DwriteEnabled) & (User in group:C338(Current user:C182; "4D Write Group"))
	$_bo_4DWriteInstalled:=True:C214
End if 

$0:=$_bo_4dWriteInstalled
ERR_MethodTrackerReturn("DB_UserHas4DWriteAccess"; $_t_oldMethodName)
