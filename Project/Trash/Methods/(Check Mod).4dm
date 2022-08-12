//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Check Mod
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/01/2010 09:36
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(DB_aI_aMod;0)
	C_BOOLEAN:C305(<>DB_bo_ModuleSettingsinited)
	C_LONGINT:C283($_l_ModuleNumber; $1)
	C_TEXT:C284($_t_EventHandler; $_t_oldMethodName; $2; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Check Mod")
$_t_EventHandler:=Method called on event:C705
If ($_t_EventHandler="")
	Start_Event
End if 
Check_Modules
$_l_ModuleNumber:=$1
If (Current user:C182="Designer")
	DB_SetModuleSetting($1; 2)
End if 
//`ARRAY INTEGER(DB_aI_aMod;<>Mod_l_MaxModules)
//ARRAY longint(MOD_aI_ModuleShowIcon;<>Mod_l_MaxModules)
//ARRAY LONGINT(DB_al_ModuleShowText;<>Mod_l_MaxModules)
//ARRAY LONGINT(DB_aI_ModuleExecuteStartup;<>Mod_l_MaxModules)

If (DB_aI_aMod{$_l_ModuleNumber}<2)
	If (DB_t_CurrentFormUsage3="NoCheck")  //from Menu_ModBar2
		OK:=1  //needed cos otherwise Change Access can clears the ◊aMods too early
	Else 
		Gen_Alert("You do not have access to the "+$2+" module."; "Cancel")
		OK:=0
	End if 
Else 
	OK:=1
End if 
ERR_MethodTrackerReturn("Check Mod"; $_t_oldMethodName)