//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      SuperDiary_File
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/03/2010 10:59
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0)
	C_LONGINT:C283(MOD_l_CurrentModuleAccess; vD; vProcaMod)
	C_TEXT:C284($_t_oldMethodName; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SuperDiary_File")
//DEFAULT TABLE([DIARY])
FORM SET INPUT:C55([PERSONNEL:11]; "Diary_View")
WIN_t_CurrentInputForm:="Diary_View"
FORM SET OUTPUT:C54([PERSONNEL:11]; "ALL_FIELDS")
WIN_t_CurrentOutputform:="SuperDiary"
vD:=1
vProcaMod:=2
MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_DiaryManager)
$0:=True:C214
If (MOD_l_CurrentModuleAccess<2)
	Gen_Alert("You do not have access to the Time Manger Module"; "Cancel")
	OK:=0
	vD:=0
	$0:=False:C215
Else 
	Diary_FileP
End if 
ERR_MethodTrackerReturn("SuperDiary_File"; $_t_oldMethodName)