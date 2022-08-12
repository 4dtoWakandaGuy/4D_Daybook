//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Contacts File
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 13:44
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_StatsView)
	C_LONGINT:C283(MOD_l_CurrentModuleAccess; vO; WIN_CURRENTMENU)
	C_TEXT:C284($_t_oldMethodName; CON_t_DisplayType; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Contacts File")

FORM SET INPUT:C55([CONTACTS:1]; "Contacts_InM13")  //NG April 2004 removed reference to ◊screen
FORM SET OUTPUT:C54([CONTACTS:1]; "Contacts Out")
WIN_t_CurrentOutputform:="Contacts Out"

WIN_t_CurrentInputForm:="Contacts_InM13"
WIN_CURRENTMENU:=99
vO:=1
MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_Companies)

If (MOD_l_CurrentModuleAccess#3)
	READ WRITE:C146([CONTACTS:1])
End if 
SYS_bo_StatsView:=<>SYS_bo_StatsView
If ((vAdd=0) & (<>SYS_bo_StatsView))
	Contacts_SV
End if 
ERR_MethodTrackerReturn("Contacts File"; $_t_oldMethodName)