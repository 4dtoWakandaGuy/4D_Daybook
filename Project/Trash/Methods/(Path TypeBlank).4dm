//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Path TypeBlank
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
	ARRAY TEXT:C222($_at_Versions; 0)
	C_BOOLEAN:C305($_bo_Unload)
	C_LONGINT:C283(<>SYS_l_LoggedInaccount)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Path TypeBlank")
ARRAY TEXT:C222($_at_Versions; 1)
$_at_Versions{1}:="Rubbish"
ARRAY TO LIST:C287($_at_Versions; "Version")
READ WRITE:C146([USER:15])
$_bo_Unload:=(Records in selection:C76([USER:15])=0)
If (<>SYS_l_LoggedInaccount=0)
	QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=0)
Else 
	QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=<>SYS_l_LoggedInaccount)
End if 
[USER:15]Date FirstRun:214:=!00-00-00!
DB_SaveRecord(->[USER:15])

READ ONLY:C145([USER:15])
If ($_bo_Unload)
	UNLOAD RECORD:C212([USER:15])
End if 
ERR_MethodTrackerReturn("Path TypeBlank"; $_t_oldMethodName)
