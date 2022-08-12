//%attributes = {}
If (False:C215)
	//Project Method Name:      PDF995_rootDirNameGet
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/08/2009 11:01
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284(<>PDF995_rootDirNameStr; $_t_oldMethodName; $0)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PDF995_rootDirNameGet")


PDF995_constantsInit

If (<>PDF995_rootDirNameStr="")
	<>PDF995_rootDirNameStr:="PDF995"
End if 

$0:=<>PDF995_rootDirNameStr

ERR_MethodTrackerReturn("PDF995_rootDirNameGet"; $_t_oldMethodName)
