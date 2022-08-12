//%attributes = {}
If (False:C215)
	//Project Method Name:      PDF995_constantsInit
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/08/2009 19:04
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>PDF995_autoLaunchBool)
	C_TEXT:C284(<>PDF995_batchFilePathStr; <>PDF995_IniFilePathCopyStr; <>PDF995_IniFilePathStr; <>PDF995_printerNameStr; <>PDF995_processingFilePathStr; <>PDF995_rootDirNameStr; <>PDF995_rootDirStr; <>PDF995_taregtFilePathStr; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PDF995_constantsInit")


ERR_MethodTrackerReturn("PDF995_constantsInit"; $_t_oldMethodName)
