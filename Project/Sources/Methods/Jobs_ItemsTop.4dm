//%attributes = {}
If (False:C215)
	//Project Method Name:      Jobs_ItemsTop
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 19:08
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Jobs_ItemsTop")
If ((DB_GetModuleSettingByNUM(Module_Assemblies))>1)
	Menu_Record("Jobs_ItemsTop"; "Show Top Level Items")
	Jobs_InLPOI
End if 
ERR_MethodTrackerReturn("Jobs_ItemsTop"; $_t_oldMethodName)