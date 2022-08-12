//%attributes = {}
If (False:C215)
	//Project Method Name:      UTI_GetFolderName
	//------------------ Method Notes ------------------
	// uti_GetFolderName
	// get FolderName only from complete Pathname
	// $0 -> folder name or empty string
	// $1 -> full path name
	// uti_GetFolderName
	// get FolderName only from complete Pathname
	// $0 -> folder name or empty string
	// $1 -> full path name
	
	//$0:=HFSParentName($1)
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $0; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("UTI_GetFolderName")

If (Count parameters:C259>=1)
	$0:=PathFromPathName($1)
Else 
	$0:=""
End if 
ERR_MethodTrackerReturn("UTI_GetFolderName"; $_t_oldMethodName)
