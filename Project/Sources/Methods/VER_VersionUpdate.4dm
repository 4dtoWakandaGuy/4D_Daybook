//%attributes = {}
If (False:C215)
	//Project Method Name:      VER_VersionUpdate
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/11/2010 15:16
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $t_DataVersion; $t_StructureVersion)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("VER_VersionUpdate")

If (ApplicationType_isSingleUser)
	
	$t_StructureVersion:=VER_GetVersion
	$t_DataVersion:=VER_GetVersion(1)
	
	
	
	
	
	
End if 
ERR_MethodTrackerReturn("VER_VersionUpdate"; $_t_oldMethodName)