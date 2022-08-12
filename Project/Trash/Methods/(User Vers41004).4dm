//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      User Vers41004
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

$_t_oldMethodName:=ERR_MethodTracker("User Vers41004")
//User Vers41004
User_Message(Char:C90(13)+"      Updating Personnel"+Char:C90(13))
READ WRITE:C146([PERSONNEL:11])
QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Email_Address:36="False"; *)
QUERY:C277([PERSONNEL:11];  | ; [PERSONNEL:11]Email_Address:36="True")
DB_lockFile(->[PERSONNEL:11])
APPLY TO SELECTION:C70([PERSONNEL:11]; [PERSONNEL:11]Email_Address:36:="")

AA_CheckFileUnlockedByTableNUM(Table:C252(->[PERSONNEL:11]))
READ ONLY:C145([PERSONNEL:11])
UNLOAD RECORD:C212([PERSONNEL:11])
ERR_MethodTrackerReturn("User Vers41004"; $_t_oldMethodName)