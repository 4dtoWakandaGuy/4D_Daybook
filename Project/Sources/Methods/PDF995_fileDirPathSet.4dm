//%attributes = {}
If (False:C215)
	//Project Method Name:      PDF995_fileDirPathSet
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
	//ARRAY TEXT(PDF_at_995tempPaths;0)
	C_LONGINT:C283($_l_DocumentIndex)
	C_TEXT:C284($_t_DirectorySymbol; $_t_DocumentPath; $_t_DocumentPath2; $_t_oldMethodName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PDF995_fileDirPathSet")

$_t_DocumentPath:=$1

ARRAY TEXT:C222(PDF_at_995tempPaths; 0)

If (Is Windows:C1573)
	$_t_DirectorySymbol:=Folder separator:K24:12  //"\\"
	
	Case of 
		: ($_t_DocumentPath="")
			//inalid path
		: (Test path name:C476($_t_DocumentPath)=Is a document:K24:1)
			//path is ok already do nothing
			
		: (Test path name:C476($_t_DocumentPath)=Is a folder:K24:2)
			//path is ok already do nothing
			
		Else 
			PDF995_text2Array($_t_DocumentPath; ->PDF_at_995tempPaths; $_t_DirectorySymbol; True:C214)
			
			$_t_DocumentPath2:=""
			
			For ($_l_DocumentIndex; 1; Size of array:C274(PDF_at_995tempPaths))
				If (($_l_DocumentIndex=1) & ($_t_DocumentPath2=""))
					$_t_DocumentPath2:=PDF_at_995tempPaths{1}
				Else 
					$_t_DocumentPath2:=$_t_DocumentPath2+$_t_DirectorySymbol+PDF_at_995tempPaths{$_l_DocumentIndex}
					If (Test path name:C476($_t_DocumentPath2)#Is a folder:K24:2)
						CREATE FOLDER:C475($_t_DocumentPath2)
					End if 
				End if 
			End for 
	End case 
End if 

ERR_MethodTrackerReturn("PDF995_fileDirPathSet"; $_t_oldMethodName)
