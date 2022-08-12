If (False:C215)
	//object Name: Object Name:      CONFIG_SETUP.oDMLicenceNew
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/10/2012 10:23
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(DM_abo_DisableModule;0)
	//ARRAY BOOLEAN(DM_abo_ModuleDisabled;0)
	//ARRAY INTEGER(<>Mod_l_MaxModules;0)
	//ARRAY INTEGER(DB_aI_aMod;0)
	//ARRAY LONGINT(DM_al_MaxUsers;0)
	//ARRAY LONGINT(DM_al_ModuleNUM;0)
	//ARRAY LONGINT(DM_al_ModuleNumbers;0)
	//ARRAY TEXT(<>Mod_at_ModuleName;0)
	//ARRAY TEXT(DM_at_ModuleNames;0)
	C_DATE:C307(DM_d_LicenceExpiryDate)
	C_LONGINT:C283($_l_Index; $_l_ModulePosition; DM_l_MaxUsers; DM_l_MaxWPUsers)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ CONFIG_SETUP.oDMLicenceNew"; Form event code:C388)
//If (DM_d
If (False:C215)
	DM_d_LicenceExpiryDate:=DB_GetLicenceExpiryDate
	DM_l_MaxUsers:=DB_GetLicenceMaxUsers
	DM_l_MaxWPUsers:=DB_GetLicenceMaxUsers("WP")
	DB_LoadLicenceOverridesPrefs
	ARRAY INTEGER:C220(DB_aI_aMod; <>Mod_l_MaxModules)
	ARRAY LONGINT:C221(MOD_aI_ModuleShowIcon; <>Mod_l_MaxModules)
	ARRAY LONGINT:C221(DB_al_ModuleShowText; <>Mod_l_MaxModules)
	ARRAY LONGINT:C221(DB_aI_ModuleExecuteStartup; <>Mod_l_MaxModules)
	DB_GetLicencedModuleSettings(->DB_aI_aMod)
	//DM_t_VersionMIN:=VER_GetVersion
	Modules_Array
	ARRAY TEXT:C222(DM_at_ModuleNames; 0)
	ARRAY LONGINT:C221(DM_al_ModuleNUM; 0)
	ARRAY BOOLEAN:C223(DM_abo_ModuleDisabled; 0)
	ARRAY LONGINT:C221(DM_al_MaxUsers; 0)
	For ($_l_Index; 1; Size of array:C274(<>Mod_at_ModuleName))
		If (<>Mod_at_ModuleName{$_l_Index}#"Macintosh@") & (<>Mod_at_ModuleName{$_l_Index}#"Windows@") & (<>Mod_at_ModuleName{$_l_Index}#"International@")
			
			If (DB_aI_aMod{$_l_Index}>0)
				APPEND TO ARRAY:C911(DM_at_ModuleNames; <>Mod_at_ModuleName{$_l_Index})
				APPEND TO ARRAY:C911(DM_al_ModuleNUM; $_l_Index)
				APPEND TO ARRAY:C911(DM_abo_ModuleDisabled; False:C215)
				If (<>Mod_at_ModuleName{$_l_Index}#"Word@")
					APPEND TO ARRAY:C911(DM_al_MaxUsers; DM_l_MaxUsers)
				Else 
					APPEND TO ARRAY:C911(DM_al_MaxUsers; DM_l_MaxWPUsers)
				End if 
				$_l_ModulePosition:=Find in array:C230(DM_al_ModuleNumbers; $_l_Index)
				If ($_l_ModulePosition>0)
					DM_abo_ModuleDisabled{Size of array:C274(DM_abo_ModuleDisabled)}:=DM_abo_DisableModule{$_l_ModulePosition}
				End if 
				
			End if 
		End if 
	End for 
End if 
ERR_MethodTrackerReturn("OBJ CONFIG_SETUP.oDMLicenceNew"; $_t_oldMethodName)
