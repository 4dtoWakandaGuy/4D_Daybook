//%attributes = {}
If (False:C215)
	//Project Method Name:      User_Start
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/10/2010 15:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SCPT_bo_NoAutoScripts)
	C_LONGINT:C283($_l_ModuleAccess)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("User_Start")
//User_Start
$_l_ModuleAccess:=(DB_GetModuleSettingByNUM(Module_Macros))
DB_SetModuleSetting(Module_Macros; 2)
//◊SinProc:=False
<>SCPT_bo_NoAutoScripts:=False:C215
[USER:15]Town:4:=""
DB_SaveRecord(->[USER:15])
Load_Fields
Startup_Import
//See also $Start2 section at base of User_Details

//Macro_Import (»[MACROS];»[MACROS]Macro Code;0;"mStart")
//If (OK=1)
// Macro ("mStart")
//End if
DB_SetModuleSetting(Module_Macros; $_l_ModuleAccess)
ERR_MethodTrackerReturn("User_Start"; $_t_oldMethodName)