//%attributes = {}
If (False:C215)
	//Project Method Name:      IME_FoldersClear
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
	//ARRAY TEXT(IME_at_Folders;0)
	C_LONGINT:C283(<>IME_l_MaxFolders; $_l_Index)
	C_TEXT:C284($_t_oldMethodName; IME_t_FolderORef; IME_t_FolderPrefix)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IME_FoldersClear")
//IME_FoldersClear
//Rollo 11/8/99

ARRAY TEXT:C222(IME_at_Folders; <>IME_l_MaxFolders)
For ($_l_Index; 1; <>IME_l_MaxFolders)
	IME_at_Folders{$_l_Index}:=""
End for 
IME_t_FolderORef:=""
IME_t_FolderPrefix:=""
ERR_MethodTrackerReturn("IME_FoldersClear"; $_t_oldMethodName)