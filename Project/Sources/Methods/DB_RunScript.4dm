//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_RunScript
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:      15/05/2010 19:24
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>MenuProc; <>SCPT_l_RecordEdit; <>SCPT_l_PlayerActive; $_l_Process)
	C_TEXT:C284($_t_MenuItemParameter; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_RunScript")
$_t_MenuItemParameter:=Get selected menu item parameter:C1005
If (<>MenuProc=0)
	<>MenuProc:=1
End if 
If (<>SCPT_l_PlayerActive=0)
	<>SCPT_l_PlayerActive:=1
	If (<>SCPT_l_RecordEdit=0)
		
		If (DB_GetModuleSettingByNUM(Module_Macros)>1)
			Macro($_t_MenuItemParameter)
		End if 
	Else 
		Gen_Alert("You cannot play a Macro while the Macro Editor is being used"; "Cancel")
	End if 
	<>SCPT_l_PlayerActive:=0
Else 
	Gen_Alert("Another Macro is currently being played"; "Cancel")
End if 
ERR_MethodTrackerReturn("DB_RunScript"; $_t_oldMethodName)