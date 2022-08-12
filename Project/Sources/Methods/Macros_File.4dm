//%attributes = {}
If (False:C215)
	//Project Method Name:      Macros_File
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 17:15
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0)
	C_LONGINT:C283(MOD_l_CurrentModuleAccess; vP)
	C_TEXT:C284($_t_oldMethodName; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Macros_File")
//DEFAULT TABLE([MACROS])
FORM SET INPUT:C55([SCRIPTS:80]; "Scripts_in")  //NG April 2004 removed reference to ◊screen
WIN_t_CurrentInputForm:="Scripts_in"
FORM SET OUTPUT:C54([SCRIPTS:80]; "Scripts_Out")
WIN_t_CurrentOutputform:="Scripts_Out"
vP:=1
MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_Macros)
$0:=True:C214
If (MOD_l_CurrentModuleAccess<2)
	Gen_Alert("You do not have access to the Macros_Module"; "Cancel")
	$0:=False:C215
	
Else 
	If (MOD_l_CurrentModuleAccess=3)
		READ ONLY:C145([SCRIPTS:80])
	Else 
		READ WRITE:C146([SCRIPTS:80])
	End if 
End if 
ERR_MethodTrackerReturn("Macros_File"; $_t_oldMethodName)
