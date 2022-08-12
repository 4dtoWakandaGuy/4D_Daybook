If (False:C215)
	//object Name: [USER]BK_StoreSetup.Variable4
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
	C_TEXT:C284($_t_BKFilePath; $_t_BKquery; $_t_BKResult; $_t_oldMethodName; BK_t_BKCONTEXT; DM_t_BKStoreName; DM_t_BkStorePassLock)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].BK_StoreSetup.Variable4"; Form event code:C388)
If (DM_t_BKStoreName#"") & (DM_t_BkStorePassLock#"")
	BK_t_BKCONTEXT:="ODR"
	$_t_BKFilePath:=DM_SetFilePath(""; "Temp")
	$_t_BKquery:=""
	$_t_BKResult:=""
	//$_t_BKquery:="*Ts>="+4DBKC_ToolsString ("GET TIMESTAMP GMT";String(Current date-1);String(Current time))
	
	//$_t_BKResult:=4DBKC_ImportFileFrom4DBK (DM_t_BKServerIP;DM_l_BkserverPort;30;60;DM_t_BKStorePassword;DM_t_BKStoreName;BK_t_BKCONTEXT;$_t_BKquery;$_t_BKFilePath)
	If ($_t_BKResult#("[err"+"@"))
		Gen_Alert("Connection OK")
		
	Else 
		Gen_Alert("Connection INVALID")
	End if 
	
Else 
	Gen_Alert("You must set a Store Name and Password first")
End if 
ERR_MethodTrackerReturn("OBJ [USER].BK_StoreSetup.Variable4"; $_t_oldMethodName)
