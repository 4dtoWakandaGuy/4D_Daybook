//%attributes = {}
If (False:C215)
	//Project Method Name:      Projects_Mod
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
	C_BOOLEAN:C305($_bo_AutoFind)
	C_LONGINT:C283(vA)
	C_TEXT:C284($_t_oldMethodName; $_t_ProjectsCodeFind; $1; $2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Projects_Mod")
If (Count parameters:C259>=2)
	$_bo_AutoFind:=($2="TRUE")
	$_t_ProjectsCodeFind:=$1
End if 
Gen_Mod("View Projects"; "Projects_File"; "AMaster"; ->[PROJECTS:89]; ->vA; "Projects_Sel"; "Projects"; $_bo_AutoFind; $_t_ProjectsCodeFind)
ERR_MethodTrackerReturn("Projects_Mod"; $_t_oldMethodName)
