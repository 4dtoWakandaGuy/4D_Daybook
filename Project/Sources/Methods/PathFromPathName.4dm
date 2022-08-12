//%attributes = {}
If (False:C215)
	//Project Method Name:      PathFromPathName
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_CharacterIndex; $_l_SourcePathLength)
	C_TEXT:C284($_t_DirectorySymbol; $_t_oldMethodName; $_t_ResultPath; $_t_SourcePath; $0; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PathFromPathName")
If (False:C215)
	// FileGetPath
	//
	// Accepts a full path and returns the path without the file name.
	// For example:
	//
	// Input       Root:Documents:Foo.pdf
	// Output     Root:Documents:
	//
End if 




$_t_SourcePath:=$1

$_t_ResultPath:=$_t_SourcePath
$_l_SourcePathLength:=Length:C16($_t_SourcePath)
$_t_DirectorySymbol:=Directory_Symbol

For ($_l_CharacterIndex; $_l_SourcePathLength; 1; -1)
	
	If ($_t_SourcePath[[$_l_CharacterIndex]]=$_t_DirectorySymbol)
		// We're at the directory mark, bail.
		$_t_ResultPath:=Substring:C12($_t_SourcePath; 1; $_l_CharacterIndex)
		$_l_CharacterIndex:=0
	End if 
	
End for 

$0:=$_t_ResultPath

// End of routine.
ERR_MethodTrackerReturn("PathFromPathName"; $_t_oldMethodName)
