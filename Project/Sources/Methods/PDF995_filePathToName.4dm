//%attributes = {}
If (False:C215)
	//Project Method Name:      PDF995_filePathToName
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/03/2010 16:29
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_CharacterCode; $_l_DirectorySymbol; $_l_DocumentLength)
	C_TEXT:C284($_t_DocumenName; $_t_FIleDocumentPath; $_t_oldMethodName; $0; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PDF995_filePathToName")

If (Count parameters:C259>0)
	$_t_FIleDocumentPath:=$1
Else 
	$_t_FIleDocumentPath:=DOCUMENT
End if 

$_t_DocumenName:=""
//get length of the whole path
$_l_DocumentLength:=Length:C16($_t_FIleDocumentPath)

If ($_l_DocumentLength>0)
	
	$_l_DirectorySymbol:=Character code:C91(Folder separator:K24:12)
	
	While ($_l_DocumentLength>0)  //read characters in the path backwards
		IDLE:C311
		$_l_CharacterCode:=Character code:C91($_t_FIleDocumentPath[[$_l_DocumentLength]])
		If ($_l_CharacterCode=$_l_DirectorySymbol)  //we got the path separator quit loop
			$_l_DocumentLength:=0
		Else   //keep reading until the path separator is found
			$_t_DocumenName:=Char:C90($_l_CharacterCode)+$_t_DocumenName
			$_l_DocumentLength:=$_l_DocumentLength-1
		End if 
	End while 
End if 
//</code>

//<return>
$0:=$_t_DocumenName
//</return>
ERR_MethodTrackerReturn("PDF995_filePathToName"; $_t_oldMethodName)
