//%attributes = {}
If (False:C215)
	//Project Method Name:      MIR_SetFolderPath
	//------------------ Method Notes ------------------
	//Based on Mirror_PreparePath
	
	// Declare parameters
	
	// Declare local variables
	
	// Reassign for readability
	//------------------ Revision Control ----------------
	//Date Created: 14/03/2010 15:03
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $1; $_t_CreatePath; $_t_FolderPath; $_t_NextFolder)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MIR_SetFolderPath")



$_t_FolderPath:=$1

If ($_t_FolderPath#"")
	//Folder separator:=DB_DirSymbol 
	// prepare the paths.  For windows, we need to go passed the drive specified
	If (Not:C34(Is macOS:C1572))
		If (Position:C15(":\\"; $_t_FolderPath)#0)
			$_t_CreatePath:=Substring:C12($_t_FolderPath; 0; Position:C15("\\"; $_t_FolderPath))
			$_t_FolderPath:=Substring:C12($_t_FolderPath; Position:C15("\\"; $_t_FolderPath)+1)
		End if 
		
	End if 
	
	// if the path does not end with the directory glyph or separator, we add it
	If ($_t_FolderPath[[Length:C16($_t_FolderPath)]]#Folder separator:K24:12)
		$_t_FolderPath:=$_t_FolderPath+Folder separator:K24:12
	End if 
	
	Repeat 
		// find the next folder in the directory tree
		$_t_NextFolder:=Substring:C12($_t_FolderPath; 0; Position:C15(Folder separator:K24:12; $_t_FolderPath))
		$_t_FolderPath:=Substring:C12($_t_FolderPath; Position:C15(Folder separator:K24:12; $_t_FolderPath)+1)
		
		$_t_CreatePath:=$_t_CreatePath+$_t_NextFolder
		
		// create the folder if it does not exist
		Case of 
			: (Test path name:C476($_t_CreatePath)<0)
				CREATE FOLDER:C475($_t_CreatePath)
			: (Test path name:C476($_t_CreatePath)=1)
				$_t_NextFolder:=""
		End case 
		
	Until ($_t_NextFolder="")
	
End if 
//End of method
ERR_MethodTrackerReturn("MIR_SetFolderPath"; $_t_oldMethodName)