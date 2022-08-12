//%attributes = {}
If (False:C215)
	//Project Method Name:      Products_File
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 31/03/2010 18:18
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_StatsView)
	C_LONGINT:C283(<>Mod_l_MaxModules; MOD_l_CurrentModuleAccess; vP)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Products_File")
//TRACE
If (<>Mod_l_MaxModules=0)
	GET PROCESS VARIABLE:C371(-1; <>Mod_l_MaxModules; <>Mod_l_MaxModules)
End if 

Products_FileI
Products_FileO
vP:=1
MOD_l_CurrentModuleAccess:=(DB_GetModuleSettingByNUM(Module_Products))
If (MOD_l_CurrentModuleAccess#3)
	READ WRITE:C146([PRODUCTS:9])
	READ WRITE:C146([PRICE_TABLE:28])
	If ((DB_GetModuleSettingByNUM(Module_Assemblies)>1) & (DB_GetModuleSettingByNUM(Module_Assemblies)#3))
		READ WRITE:C146([COMPONENTS:86])
	End if 
	If ((DB_GetModuleSettingByNUM(Module_Subscriptions)=2) | (DB_GetModuleSettingByNUM(Module_Subscriptions)=4))
		READ WRITE:C146([SUBSCRIPTIONS:93])
	End if 
	If ((DB_GetModuleSettingByNUM(1))#5)
		READ WRITE:C146([CONTRACT_RECORD_ANALYSIS:88])
	End if 
End if 
SYS_bo_StatsView:=<>SYS_bo_StatsView
If ((vAdd=0) & (<>SYS_bo_StatsView))
	Products_SV
End if 
ERR_MethodTrackerReturn("Products_File"; $_t_oldMethodName)
