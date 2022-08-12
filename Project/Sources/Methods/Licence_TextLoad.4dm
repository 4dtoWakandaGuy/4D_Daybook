//%attributes = {}
If (False:C215)
	//Project Method Name:      Licence_TextLoad
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/03/2010 15:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_DirectoryPath; $_t_DirectorySymbol; $_t_NewResourcePath; $_t_oldMethodName; $_t_StructurePath; tLicenceText; tLicenceText2)
	C_TIME:C306($_ti_DocumentRef)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Licence_TextLoad")
//$_t_StructurePath:=Structure file
$_t_StructurePath:=StructureFilePath  //Mon, Dec 18, 2006 balinderwalia: changed to work for engine version
$_t_DirectoryPath:=PathFromPathName($_t_StructurePath)
$_t_DirectorySymbol:=Directory_Symbol
//$_t_NewResourcePath:=$_t_DirectoryPath+"Resources"+$_t_DirectorySymbol+"DaybookConstants.bundle"+$_t_DirectorySymbol+"Contents"+$_t_DirectorySymbol+"Resources"+$_t_DirectorySymbol+"User Constants.rsrc"
$_t_NewResourcePath:=$_t_DirectoryPath+"Resources"+$_t_DirectorySymbol+"Cleardaylicence.txt"

$_t_StructurePath:=Get 4D folder:C485(Database folder:K5:14)


If (Not:C34(Test path name:C476($_t_StructurePath+"Resources")=Is a folder:K24:2))
	CREATE FOLDER:C475($_t_StructurePath+"Resources")
End if 
$_t_NewResourcePath:=$_t_StructurePath+"Resources"+Folder separator:K24:12+"Cleardaylicence.txt"


If (Is a document:K24:1=(Test path name:C476($_t_NewResourcePath)))
	$_ti_DocumentRef:=Open document:C264($_t_NewResourcePath)
Else 
	
	$_ti_DocumentRef:=Create document:C266($_t_NewResourcePath)
End if 
RECEIVE PACKET:C104($_ti_DocumentRef; tLicenceText; 32000)
RECEIVE PACKET:C104($_ti_DocumentRef; tLicenceText2; 32000)
tLicenceText:=tLicenceText+tLicenceText2
tLicenceText2:=""
CLOSE DOCUMENT:C267($_ti_DocumentRef)
ERR_MethodTrackerReturn("Licence_TextLoad"; $_t_oldMethodName)