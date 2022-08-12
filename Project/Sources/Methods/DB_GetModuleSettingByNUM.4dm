//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_GetModuleSettingByNUM
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/01/2012 10:20
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(DB_aI_aMod;0)
	//ARRAY LONGINT(<>Mod_al_ModuleAccessType;0)
	ARRAY LONGINT:C221($_al_WebEnabledModules; 0)
	ARRAY LONGINT:C221($_al_WebEnabledState; 0)
	//ARRAY LONGINT(DBWS_al_ModuleAccess;0)
	ARRAY TEXT:C222($_at_WebClassName; 0)
	C_BOOLEAN:C305(DB_bo_ModuleSettingsinited)
	C_LONGINT:C283(<>Mod_l_MaxModules; $_l_ModuleNumber; $_l_ModuleRow; $1)
	C_REAL:C285($0)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_Context; $_t_oldMethodName; $2; DBWS_t_LogedinUser)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_GetModuleSettingByNUM")


//$times:=0

If (Count parameters:C259>=2)
	$_t_Context:=$2
Else 
	$_t_Context:=""
End if 

<>Mod_l_MaxModules:=45

ARRAY LONGINT:C221(<>Mod_al_ModuleAccessType; <>Mod_l_MaxModules)
Case of 
	: ($_t_Context="Web")
		ARRAY LONGINT:C221($_al_WebEnabledModules; 0)
		ARRAY LONGINT:C221($_al_WebEnabledState; 0)  //0=Read only 2=Read and write 3)=read write and report
		ARRAY TEXT:C222($_at_WebClassName; 0)
		
		//Here add the modules as we do them
		//APPEND TO ARRAY($_al_WebEnabledModules;Module_DiaryManager)
		//APPEND TO ARRAY($_al_WebEnabledState;2)
		
		APPEND TO ARRAY:C911($_al_WebEnabledModules; Module_Companies)
		APPEND TO ARRAY:C911($_al_WebEnabledState; 2)
		APPEND TO ARRAY:C911($_at_WebClassName; "modulecos")
		APPEND TO ARRAY:C911($_al_WebEnabledModules; Module_SalesOrders)
		APPEND TO ARRAY:C911($_al_WebEnabledState; 3)
		APPEND TO ARRAY:C911($_at_WebClassName; "moduleorders")
		APPEND TO ARRAY:C911($_al_WebEnabledModules; Module_Products)
		APPEND TO ARRAY:C911($_al_WebEnabledState; 0)
		APPEND TO ARRAY:C911($_at_WebClassName; "moduleproducts")
		
		If (DBWS_t_LogedinUser#"") & (DBWS_t_LogedinUser#"~SV")
			
			
			
			
			
			
			Check_Modules
			
			
			
		Else 
			Check_Modules
			
			
		End if 
		
		If (Count parameters:C259>=1)
			
			$_l_ModuleNumber:=$1
			If ($_l_ModuleNumber>=1)
				If ($_l_ModuleNumber<=Size of array:C274(DBWS_al_ModuleAccess))
					$_l_ModuleRow:=Find in array:C230($_al_WebEnabledModules; $_l_ModuleNumber)
					If ($_l_ModuleRow>0)
						$0:=DBWS_al_ModuleAccess{$_l_ModuleNumber}
					Else 
						$0:=0
					End if 
				Else 
					$0:=2
				End if 
			Else 
				$0:=2
			End if 
			
		Else 
			$0:=0
		End if 
	Else 
		
		If (<>PER_t_CurrentUserInitials#"") & (<>PER_t_CurrentUserInitials#"~SV")
			Check_Modules
		Else 
			Check_Modules
			
		End if 
		
		If (Count parameters:C259>=1)
			
			$_l_ModuleNumber:=$1
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
		
End case 
ERR_MethodTrackerReturn("DB_GetModuleSetting"; $_t_oldMethodName)