//%attributes = {}
If (False:C215)
	//Project Method Name:      PDF995_targetPathSet
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
	C_BOOLEAN:C305($_bo_OK; $_bo_SetINIFile; $2)
	C_TEXT:C284(<>PDF995_taregtFilePathStr; $_t_oldMethodName; $_t_TargetPath; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PDF995_targetPathSet")

If (Count parameters:C259>0)
	$_t_TargetPath:=$1
Else 
	$_t_TargetPath:=""
End if 
//
If (Count parameters:C259>1)
	$_bo_SetINIFile:=$2
Else 
	$_bo_SetINIFile:=False:C215
End if 

If (Is Windows:C1573)
	
	If ($_t_TargetPath="")
		$_t_TargetPath:=PDF995_rootDirPathGet+"PDF995.PDF"
	End if 
	
	<>PDF995_taregtFilePathStr:=$_t_TargetPath
	
	If (($_bo_SetINIFile) & (Test path name:C476(PDF995_iNIFilePathGet)=Is a document:K24:1))
		PDF995_iNIConfigSetParams
	End if 
End if 

ERR_MethodTrackerReturn("PDF995_targetPathSet"; $_t_oldMethodName)
