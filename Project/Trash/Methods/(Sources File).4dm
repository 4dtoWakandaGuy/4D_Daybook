//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Sources File
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 18:43
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0)
	C_LONGINT:C283(<>Mod_l_MaxModules; MOD_l_CurrentModuleAccess; vP)
	C_TEXT:C284($_t_oldMethodName; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Sources File")
If (<>Mod_l_MaxModules=0)
	GET PROCESS VARIABLE:C371(-1; <>Mod_l_MaxModules; <>Mod_l_MaxModules)
End if 

FORM SET INPUT:C55([SOURCES:6]; "Sources_In13")  //NG April 2004 Removed ◊Screen
WIN_t_CurrentInputForm:="Sources_In13"
FORM SET OUTPUT:C54([SOURCES:6]; "Sources out")
WIN_t_CurrentOutputform:="Sources out"
vP:=1
MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_DataManager)
$0:=True:C214

If ((DB_GetModuleSettingByNUM(1)=5) & (MOD_l_CurrentModuleAccess<2))
	Gen_Alert("You do not have access to the Data Manager Module"; "Cancel")
	$0:=False:C215
Else 
	If (MOD_l_CurrentModuleAccess#3)
		READ WRITE:C146([SOURCES:6])
	End if 
End if 
ERR_MethodTrackerReturn("Sources File"; $_t_oldMethodName)