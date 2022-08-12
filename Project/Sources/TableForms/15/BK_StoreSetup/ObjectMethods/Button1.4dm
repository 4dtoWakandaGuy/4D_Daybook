If (False:C215)
	//object Name: [USER]BK_StoreSetup.Button1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:12
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DM_Bo_BKedit)
	C_TEXT:C284($_t_oldMethodName; $_t_Password; DM_t_BkStorePassLock; DM_t_BKStorePassword)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].BK_StoreSetup.Button1"; Form event code:C388)
//this will open a small window and set the keycode handler
$_t_Password:=Gen_Request("Enter new Password"; "")
If ($_t_Password#"") & (OK=1)
	DM_t_BKStorePassword:=$_t_Password
	DM_t_BkStorePassLock:="*"*Length:C16(DM_t_BKStorePassword)
	OBJECT SET ENTERABLE:C238(DM_t_BkStorePassLock; False:C215)
	DM_Bo_BKedit:=True:C214
	
End if 
ERR_MethodTrackerReturn("OBJ [USER].BK_StoreSetup.Button1"; $_t_oldMethodName)
