//%attributes = {}
If (False:C215)
	//Project Method Name:      Macro_IMAPLAY
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 19:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Macro_IMAPLAY")
If ((DB_GetModuleSettingByNUM(Module_IntServer))>1)
	Record_PlMacro($1)
End if 
ERR_MethodTrackerReturn("Macro_IMAPLAY"; $_t_oldMethodName)