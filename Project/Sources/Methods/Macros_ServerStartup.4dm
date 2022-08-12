//%attributes = {}
If (False:C215)
	//Project Method Name:      Macros_ServerStartup
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/02/2010 17:33
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>SCPT_l_CheckVersion)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Macros_ServerStartup")

//This method will run on the server at start up(or single user)
// it will check the macros are updated and run an update if they are not

READ ONLY:C145([SCRIPTS:80])
<>SCPT_l_CheckVersion:=Macro_CurrentVersionCheck
QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Checked:12<<>SCPT_l_CheckVersion)
If (Records in selection:C76([SCRIPTS:80])>0)
	READ WRITE:C146([SCRIPTS:80])
	LOAD RECORD:C52([SCRIPTS:80])
	DB_lockFile(->[SCRIPTS:80])
	APPLY TO SELECTION:C70([SCRIPTS:80]; [SCRIPTS:80]Table_Number:8:=[SCRIPTS:80]Table_Number:8)  //THe macro trigger does the update
	AA_CheckFileUnlockedByTableNUM(Table:C252(->[SCRIPTS:80]))
	//if the macros needed updating then so might list layouts
	DB_UpdateLIstLayoutFormulas
	
	
End if 
UNLOAD RECORD:C212([SCRIPTS:80])
READ ONLY:C145([SCRIPTS:80])
ERR_MethodTrackerReturn("Macros_ServerStartup"; $_t_oldMethodName)