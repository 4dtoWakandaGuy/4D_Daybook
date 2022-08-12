//%attributes = {}
If (False:C215)
	//Project Method Name:      PDF995_batchFileGet
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
	C_TEXT:C284(<>PDF995_batchFilePathStr; $_t_oldMethodName; $0; $rootDirPathStr)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PDF995_batchFileGet")


If (Is Windows:C1573)
	If ((<>PDF995_batchFilePathStr="") | (<>PDF995_batchFilePathStr#"@.BAT@"))  //◊PDF995_batchFilePathStr:="C:\\4D_PDF995_process.bat"
		$rootDirPathStr:=PDF995_rootDirPathGet  //$rootDirPathStr+"PDF995\\"
		PDF995_fileDirPathSet($rootDirPathStr)
		
		<>PDF995_batchFilePathStr:=$rootDirPathStr+"PDF995.BAT"
	End if 
End if 

$0:=<>PDF995_batchFilePathStr

ERR_MethodTrackerReturn("PDF995_batchFileGet"; $_t_oldMethodName)
