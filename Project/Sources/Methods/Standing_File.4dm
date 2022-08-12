//%attributes = {}
If (False:C215)
	//Project Method Name:      Standing_File
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/09/2012 09:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>MENU_l_BarModule; MOD_l_CurrentModuleAccess)
	C_TEXT:C284($_t_oldMethodName; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Standing_File")

FORM SET INPUT:C55([RECURRING_JOURNALS:38]; "Standing_In")  //NG April 2004 Removed ◊Screen
WIN_t_CurrentInputForm:="Standing_In"
FORM SET OUTPUT:C54([RECURRING_JOURNALS:38]; "Standing_Out")
WIN_t_CurrentOutputform:="Standing_Out"
MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(<>MENU_l_BarModule)
If (MOD_l_CurrentModuleAccess#3)
	READ WRITE:C146([RECURRING_JOURNALS:38])
End if 
ERR_MethodTrackerReturn("Standing_File"; $_t_oldMethodName)