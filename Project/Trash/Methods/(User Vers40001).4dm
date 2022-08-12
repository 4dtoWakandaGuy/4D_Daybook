//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      User Vers40001
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("User Vers40001")
READ WRITE:C146([MODULES:63])
QUERY:C277([MODULES:63]; [MODULES:63]Module:2="Nominal Ledger")
DB_lockFile(->[MODULES:63])
APPLY TO SELECTION:C70([MODULES:63]; [MODULES:63]Module:2:="General Ledger")

AA_CheckFileUnlockedByTableNUM(Table:C252(->[MODULES:63]))
READ ONLY:C145([MODULES:63])
UNLOAD RECORD:C212([MODULES:63])
ERR_MethodTrackerReturn("User Vers40001"; $_t_oldMethodName)