//%attributes = {}
If (False:C215)
	//Project Method Name:      PDF995_processingFileSet
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 11:49
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284(<>PDF995_processingFilePathStr; $_t_oldMethodName; $_t_ProcessingDocument; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PDF995_processingFileSet")



If (Count parameters:C259>0)
	$_t_ProcessingDocument:=$1
Else 
	$_t_ProcessingDocument:=""
End if 

If (Is Windows:C1573)
	PDF995_constantsInit
	
	If ($_t_ProcessingDocument="")
		$_t_ProcessingDocument:=PDF995_processingFileGet
		
	Else 
		<>PDF995_processingFilePathStr:=$_t_ProcessingDocument
	End if 
	
	If (Test path name:C476($_t_ProcessingDocument)#Is a document:K24:1)
		PDF995_fileDirPathSet(PDF995_filePathToDirPath($_t_ProcessingDocument))
		CLOSE DOCUMENT:C267(DB_CreateDocument($_t_ProcessingDocument))
	End if 
	
	PDF995_batchFileSet(PDF995_batchFileGet; $_t_ProcessingDocument)
End if   //</code>

//<return>
//$0 :=
//</return>
ERR_MethodTrackerReturn("PDF995_processingFileSet"; $_t_oldMethodName)
