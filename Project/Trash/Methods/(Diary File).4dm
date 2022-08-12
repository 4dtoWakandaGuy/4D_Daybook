//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Diary File
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 18:30
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0)
	C_LONGINT:C283(MOD_l_CurrentModuleAccess; vD; vProcaMod)
	C_TEXT:C284($_t_oldMethodName; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary File")
//DEFAULT TABLE([DIARY])
Diary_FileI
FORM SET OUTPUT:C54([DIARY:12]; "Diary")
WIN_t_CurrentOutputform:="Diary"
vD:=1
vProcaMod:=2
MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_DiaryManager)
$0:=True:C214  // added NG June 2004
If (MOD_l_CurrentModuleAccess<2)
	Gen_Alert("You do not have access to the Diary_Module"; "Cancel")
	OK:=0
	vD:=0
	//ABORT` ` removed NG June 2004
	$0:=False:C215  // added NG June 2004
Else 
	Diary_FileP
End if 
ERR_MethodTrackerReturn("Diary File"; $_t_oldMethodName)