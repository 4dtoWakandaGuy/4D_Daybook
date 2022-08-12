//%attributes = {}
If (False:C215)
	//Project Method Name:      Startup_SetOB
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
	C_LONGINT:C283(<>SYS_l_LoggedInaccount)
	C_TEXT:C284(<>SYS_t_ACCOpenBalancesStatus; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Startup_SetOB")
//Startup_SetOB
Start_Process
DB_t_CurrentFormUsage:="Again"
READ WRITE:C146([USER:15])
$_bo_Unload:=(Records in selection:C76([USER:15])=0)
If (<>SYS_l_LoggedInaccount=0)
	QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=0)
Else 
	QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=<>SYS_l_LoggedInaccount)
End if 
If (Not:C34(Locked:C147([USER:15])))
	Startup_Page2
Else 
	Gen_Alert("Opening Balances cannot be accessed whilst the Preferences are in use")
End if 
<>SYS_t_ACCOpenBalancesStatus:=[USER:15]Opening Balance:49
If ($_bo_Unload)
	UNLOAD RECORD:C212([USER:15])
End if 
READ ONLY:C145([USER:15])
Process_End
ERR_MethodTrackerReturn("Startup_SetOB"; $_t_oldMethodName)
