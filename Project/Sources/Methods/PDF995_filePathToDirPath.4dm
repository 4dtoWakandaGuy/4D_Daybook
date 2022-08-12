//%attributes = {}
If (False:C215)
	//Project Method Name:      PDF995_filePathToDirPath
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
	C_LONGINT:C283($_l_CharacterIndex; $_l_PathLength)
	C_TEXT:C284($_t_DirectorySymbol; $_t_DocumentPath; $_t_DocumentPath2; $_t_oldMethodName; $0; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PDF995_filePathToDirPath")




If (Count parameters:C259>0)
	
	$_t_DocumentPath:=$1
	
	$_t_DocumentPath2:=$_t_DocumentPath
	$_l_PathLength:=Length:C16($_t_DocumentPath)
	$_t_DirectorySymbol:=Folder separator:K24:12  //"\\"  //PDF only works on windows
	
	For ($_l_CharacterIndex; $_l_PathLength; 1; -1)
		
		If ($_t_DocumentPath[[$_l_CharacterIndex]]=$_t_DirectorySymbol)
			// We're at the directory mark, bail.
			$_t_DocumentPath2:=Substring:C12($_t_DocumentPath; 1; $_l_CharacterIndex)
			$_l_CharacterIndex:=0
		End if 
		
	End for 
	
End if 

$0:=$_t_DocumentPath2

ERR_MethodTrackerReturn("PDF995_filePathToDirPath"; $_t_oldMethodName)
