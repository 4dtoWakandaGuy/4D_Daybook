//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_GetVolumeFromPath
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:40If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN($0)
	ARRAY TEXT:C222($_at_Volumes; 0)
	C_LONGINT:C283($_l_CharacterPosition)
	C_TEXT:C284($_t_StructurePath; $_t_VolumeName; $0; $1; $_t_oldMethodName; $_t_StructurePath; $_t_VolumeName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_GetVolumeFromPath")


If (Count parameters:C259>0)
	$_t_StructurePath:=$1
Else 
	$_t_StructurePath:=StructureFilePath  //Mon, Dec 18, 2006 balinderwalia: changed to work for engine version
	//$_t_StructurePath:=Structure file
End if 

//Folder separator:=DB_DirSymbol 
$_l_CharacterPosition:=Position:C15(Folder separator:K24:12; $_t_StructurePath)

If ($_l_CharacterPosition>0)
	$_t_VolumeName:=Substring:C12($_t_StructurePath; 1; $_l_CharacterPosition-1)
	If (Is Windows:C1573)
		$_t_VolumeName:=$_t_VolumeName+Folder separator:K24:12
	End if 
End if 
ARRAY TEXT:C222($_at_Volumes; 0)  //NG MAY 2004
If ($_t_VolumeName#"")
	VOLUME LIST:C471($_at_Volumes)
	$_l_CharacterPosition:=Find in array:C230($_at_Volumes; $_t_VolumeName)
	If ($_l_CharacterPosition>0)
		$0:=$_t_VolumeName
	End if 
End if 
ERR_MethodTrackerReturn("DB_GetVolumeFromPath"; $_t_oldMethodName)
