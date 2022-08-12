//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_GetModuleSetting
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/01/2010 17:21
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(DB_aI_aMod;0)
	//ARRAY LONGINT(<>Mod_al_ModuleAccessType;0)
	C_BOOLEAN:C305(DB_bo_ModuleSettingsinited)
	C_LONGINT:C283(<>Mod_l_MaxModules; $_l_ModuleNumber; $_l_Retries; $0)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_GetModuleSetting")
$_l_Retries:=0

While (Semaphore:C143("$CheckingModules"))
	If ($_l_Retries>0)
		DelayTicks
	End if 
	$_l_Retries:=$_l_Retries+1
End while 
If (<>Mod_l_MaxModules=0)
	GET PROCESS VARIABLE:C371(-1; <>Mod_l_MaxModules; <>Mod_l_MaxModules)
	If (<>Mod_l_MaxModules=0)
		<>Mod_l_MaxModules:=45
	End if 
End if 
ARRAY LONGINT:C221(<>Mod_al_ModuleAccessType; <>Mod_l_MaxModules)

If (<>PER_t_CurrentUserInitials#"") & (<>PER_t_CurrentUserInitials#"~SV")
	
	If (Not:C34(DB_bo_ModuleSettingsinited))
		//ALERT("Loading the module settings")
		While (Semaphore:C143("$CheckingModules"))
			DelayTicks(2)
		End while 
		
		If (Not:C34(DB_bo_ModuleSettingsinited))
			
			
			Check_Modules
			
		End if 
		CLEAR SEMAPHORE:C144("$InitingModules")
		DB_bo_ModuleSettingsinited:=True:C214
		CLEAR SEMAPHORE:C144("$CheckingModules")
	End if 
Else 
	
	
	Check_Modules
	
	
	
End if 

If (Count parameters:C259>=1)
	$_l_ModuleNumber:=CONTEXTS_GETID("ModuleClass"; Table:C252(->[DOCUMENTS:7]); $1)
	
	If ($_l_ModuleNumber>=1)
		If ($_l_ModuleNumber<=Size of array:C274(DB_aI_aMod))
			
			$0:=DB_aI_aMod{$_l_ModuleNumber}
		Else 
			$0:=2
		End if 
	Else 
		$0:=2
	End if 
	
Else 
	$0:=0
End if 
CLEAR SEMAPHORE:C144("$CheckingModules")
CLEAR SEMAPHORE:C144("$ModifyingModulesArray")
ERR_MethodTrackerReturn("DB_GetModuleSetting"; $_t_oldMethodName)