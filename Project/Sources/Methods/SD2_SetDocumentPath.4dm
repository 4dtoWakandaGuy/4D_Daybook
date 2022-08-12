//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_SetDocumentPath
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/03/2010 15:16
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_FolderisOK)
	C_TEXT:C284($_t_ApplicationPath; Folder separator:K24:12; $_t_FolderPath; $_t_oldMethodName; $0)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_SetDocumentPath")


//Folder separator:=DB_DirSymbol 

$_t_ApplicationPath:=PathFromPathName(Data file:C490)
$_t_FolderPath:=$_t_ApplicationPath+"Documents"  //make a folder for the folders
$_l_FolderisOK:=Test path name:C476($_t_FolderPath)
If ($_l_FolderisOK<0)  //folder does not exist
	CREATE FOLDER:C475($_t_FolderPath)
End if 

$_t_FolderPath:=$_t_ApplicationPath+"Documents"  //$2 is never empty
$_l_FolderisOK:=Test path name:C476($_t_FolderPath)
If ($_l_FolderisOK<0)  //folder does not exist
	CREATE FOLDER:C475($_t_FolderPath)  //so create it
End if 
$_t_FolderPath:=$_t_FolderPath+Folder separator:K24:12+String:C10(Year of:C25(Current date:C33(*)))
If (Test path name:C476($_t_FolderPath)#Is a folder:K24:2)
	CREATE FOLDER:C475($_t_FolderPath)
End if 

$_t_FolderPath:=$_t_FolderPath+Folder separator:K24:12+MonthName(Current date:C33(*))
If (Test path name:C476($_t_FolderPath)#Is a folder:K24:2)
	CREATE FOLDER:C475($_t_FolderPath)
End if 
$0:=$_t_FolderPath
ERR_MethodTrackerReturn("SD2_SetDocumentPath"; $_t_oldMethodName)
