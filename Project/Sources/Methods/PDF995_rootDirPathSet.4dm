//%attributes = {}
If (False:C215)
	//Project Method Name:      PDF995_rootDirPathSet
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/08/2009 17:34
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284(<>PDF995_rootDirStr; $_t_oldMethodName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PDF995_rootDirPathSet")

<>PDF995_rootDirStr:=$1

ERR_MethodTrackerReturn("PDF995_rootDirPathSet"; $_t_oldMethodName)
