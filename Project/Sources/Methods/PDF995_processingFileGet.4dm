//%attributes = {}
If (False:C215)
	//Project Method Name:      PDF995_processingFileGet
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/03/2010 16:57
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284(<>PDF995_processingFilePathStr; $_t_oldMethodName; $0; $rootDirPathStr)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PDF995_processingFileGet")

PDF995_constantsInit
If (Is Windows:C1573)
	
	If (<>PDF995_processingFilePathStr="")
		<>PDF995_processingFilePathStr:=PDF995_rootDirPathGet+"PDF995.txt"
	End if 
End if 

$0:=<>PDF995_processingFilePathStr

ERR_MethodTrackerReturn("PDF995_processingFileGet"; $_t_oldMethodName)
