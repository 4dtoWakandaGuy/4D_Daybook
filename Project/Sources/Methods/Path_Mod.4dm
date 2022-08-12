//%attributes = {}
If (False:C215)
	//Project Method Name:      Path_Mod
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
	//ARRAY LONGINT(<>Mod_al_ModuleAccessType;0)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Path_Mod")
Case of 
	: ($1="ooglebook")
		<>Mod_al_ModuleAccessType{1}:=5
	: ($1="sproglicate")
		<>Mod_al_ModuleAccessType{1}:=1
End case 
ERR_MethodTrackerReturn("Path_Mod"; $_t_oldMethodName)