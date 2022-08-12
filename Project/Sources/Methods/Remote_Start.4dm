//%attributes = {}
If (False:C215)
	//Project Method Name:      Remote_Start
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/10/2011 14:31
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Unload)
	C_LONGINT:C283(<>SYS_l_LoggedInaccount; $_l_Process)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Remote_Start")
Menu_Record("Remote_Start"; "Start Auto Process")
If ((DB_GetModuleSettingByNUM(21))>0)
	READ ONLY:C145([USER:15])
	$_bo_Unload:=(Records in selection:C76([USER:15])=0)
	If (<>SYS_l_LoggedInaccount=0)
		QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=0)
	Else 
		QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=<>SYS_l_LoggedInaccount)
	End if 
	ALERT:C41("NOT AVAILABLE")
	
	If ($_bo_Unload)
		UNLOAD RECORD:C212([USER:15])
	End if 
End if 
ERR_MethodTrackerReturn("Remote_Start"; $_t_oldMethodName)
