//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Check_ModMess
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//Array Text(<>Mod_at_ModuleName;0)
	C_BOOLEAN:C305($0)
	C_LONGINT:C283($1; $2)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Check_ModMess")
If (Count parameters:C259=2)
	If ((DB_GetModuleSettingByNUM($1)>1) | (DB_GetModuleSettingByNUM($2)>1))
		$0:=True:C214
		OK:=1
	Else 
		Gen_Alert("You do not have access to either the "+<>Mod_at_ModuleName{$1}+" or the "+<>Mod_at_ModuleName{$2}+" Module"; "Cancel")
		$0:=False:C215
		OK:=0
	End if 
Else 
	If (DB_GetModuleSettingByNUM($1)>1)
		$0:=True:C214
		OK:=1
	Else 
		Gen_Alert("You do not have access to the "+<>Mod_at_ModuleName{$1}+" Module"; "Cancel")
		$0:=False:C215
		OK:=0
	End if 
End if 
ERR_MethodTrackerReturn("Check_ModMess"; $_t_oldMethodName)