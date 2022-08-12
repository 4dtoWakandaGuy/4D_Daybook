//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_StructureFolder
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
	C_LONGINT:C283($_l_CharacterPosition)
	C_TEXT:C284($_t_DirectorySymbol; $_t_oldMethodName; $_t_StructurePath; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_StructureFolder")

$_t_StructurePath:=StructureFilePath



$_t_Return:=""
Repeat 
	IDLE:C311
	$_l_CharacterPosition:=Position:C15(Folder separator:K24:12; $_t_StructurePath)
	$_t_Return:=$_t_Return+Substring:C12($_t_StructurePath; 1; $_l_CharacterPosition)
	$_t_StructurePath:=Delete string:C232($_t_StructurePath; 1; $_l_CharacterPosition)
Until ($_l_CharacterPosition=0)
ERR_MethodTrackerReturn("DB_StructureFolder"; $_t_oldMethodName)