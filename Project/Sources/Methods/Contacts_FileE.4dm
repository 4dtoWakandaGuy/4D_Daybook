//%attributes = {}
If (False:C215)
	//Project Method Name:      Contacts_FileE
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
	C_LONGINT:C283(MOD_l_CurrentModuleAccess; vO; w3)
	C_TEXT:C284($_t_oldMethodName; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Contacts_FileE")
Companies_File
OrdersV_File

FORM SET INPUT:C55([CONTACTS:1]; "Contact_In")  //NG April 2004 removed reference to ◊screen and changed the form here
WIN_t_CurrentInputForm:="Contact_In"
FORM SET OUTPUT:C54([CONTACTS:1]; "Contacts_Out")
WIN_t_CurrentOutputform:="Contacts_Out"
vO:=1
MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_Companies)
w3:=1
//ARRAY POINTER(aDiarIPtrs;0)
//ARRAY POINTER(aOrdeIPtrs;0)
If ((DB_GetModuleSettingByNUM(Module_Enquiries)<2) | (DB_GetModuleSettingByNUM(14)<2) | (DB_GetModuleSettingByNUM(Module_DiaryManager)<2))
	Gen_Alert(Term_OrdWT("You need to have access to Enquiries")+", Diary and Campaign Manager.")
	vO:=0
	OK:=0
Else 
	If (MOD_l_CurrentModuleAccess#3)
		READ WRITE:C146([CONTACTS:1])
		If ((DB_GetModuleSettingByNUM(Module_DiaryManager))#2)
			READ WRITE:C146([DIARY:12])
		End if 
		If ((DB_GetModuleSettingByNUM(Module_Enquiries))#2)
			READ WRITE:C146([ORDERS:24])
			READ WRITE:C146([ORDER_ITEMS:25])
		End if 
		If ((DB_GetModuleSettingByNUM(14))=2)
			READ ONLY:C145([INFORMATION:55])
		Else 
			READ WRITE:C146([INFORMATION:55])
		End if 
	End if 
End if 
SYS_bo_StatsView:=<>SYS_bo_StatsView
If ((vAdd=0) & (<>SYS_bo_StatsView))
	Contacts_SV
End if 
ERR_MethodTrackerReturn("Contacts_FileE"; $_t_oldMethodName)