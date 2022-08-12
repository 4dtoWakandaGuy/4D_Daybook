//%attributes = {}
If (False:C215)
	//Project Method Name:      MIR_GetFolderpathName
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
	C_TEXT:C284($_t_oldMethodName; $0; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MIR_GetFolderpathName")

// Based on
//Mirror_tGetFolderPathnames




If (Count parameters:C259>=1)
	$0:=PathFromPathName($1)
End if 
ERR_MethodTrackerReturn("MIR_GetFolderpathName"; $_t_oldMethodName)
