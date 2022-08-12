//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_SetModuleSetting
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
	//ARRAY INTEGER(DB_aI_aMod;0)
	C_BOOLEAN:C305(DB_bo_ModuleSettingsinited)
	C_LONGINT:C283(<>Mod_l_MaxModules; $_l_ModuleNumber; $1; $2)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_SetModuleSetting")

If (<>Mod_l_MaxModules=0)
	<>Mod_l_MaxModules:=45
End if 
ARRAY INTEGER:C220(DB_aI_aMod; <>Mod_l_MaxModules)
If (<>PER_t_CurrentUserInitials#"") & (<>PER_t_CurrentUserInitials#"~SV")
	Check_Modules
Else 
	
	Check_Modules
	
End if 

If (Count parameters:C259>=2)
	$_l_ModuleNumber:=$1  //
	
	If ($_l_ModuleNumber>=1)
		If ($_l_ModuleNumber<=Size of array:C274(DB_aI_aMod))
			
			DB_aI_aMod{$_l_ModuleNumber}:=$2
			//ALERT(Process_Name (Current process)+String($_l_ModuleNumber)+String(Size of array(◊aMod)))
			
		Else 
			ARRAY INTEGER:C220(DB_aI_aMod; $_l_ModuleNumber)
			DB_aI_aMod{$_l_ModuleNumber}:=$2
		End if 
	Else 
		
	End if 
	
Else 
	
End if 
ERR_MethodTrackerReturn("DB_GetModuleSetting"; $_t_oldMethodName)