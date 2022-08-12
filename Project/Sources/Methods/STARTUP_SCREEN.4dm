//%attributes = {}

If (False:C215)
	//Project Method Name:      STARTUP_SCREEN
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Unload)
	C_LONGINT:C283(<>RecBarUp; <>SYS_l_LoggedInaccount)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STARTUP_SCREEN")

//$_t_oldMethodName:=ERR_MethodTracker ("STARTUP_SCREEN")
If (Not:C34(VER_4DServer))
	SET ABOUT:C316("About_Daybook..."; "About_From_Help")
End if 
<>RecBarUp:=0
READ ONLY:C145([USER:15])
$_bo_Unload:=(Records in selection:C76([USER:15])=0)
If (<>SYS_l_LoggedInaccount=0)
	QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=0)
Else 
	QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=<>SYS_l_LoggedInaccount)
End if 
DB_GetOrganisationScreenName


About_Daybook
If ($_bo_Unload)
	UNLOAD RECORD:C212([USER:15])
End if 
//SD3_l_CalendarStartDayNumber:=0  ` added NG October 2004
//ERR_MethodTrackerReturn ("STARTUP_SCREEN";$_t_oldMethodName)
