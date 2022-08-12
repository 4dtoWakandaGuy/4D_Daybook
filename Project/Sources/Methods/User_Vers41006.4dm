//%attributes = {}
If (False:C215)
	//Project Method Name:      User_Vers41006
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

$_t_oldMethodName:=ERR_MethodTracker("User_Vers41006")
//User_Vers41006
User_Message(Char:C90(13)+"      Updating Email Addresses"+Char:C90(13))

//change addresses
//find ']Email Address' in Macros & replace

READ WRITE:C146([COMPANIES:2])
QUERY:C277([COMPANIES:2]; [COMPANIES:2]EMail_After_At:55#"")
DB_lockFile(->[COMPANIES:2])
APPLY TO SELECTION:C70([COMPANIES:2]; Gen_EmailAddr(->[COMPANIES:2]Email_Before_At:58; ->[COMPANIES:2]EMail_After_At:55; 2))

AA_CheckFileUnlockedByTableNUM(Table:C252(->[COMPANIES:2]))
READ ONLY:C145([COMPANIES:2])
UNLOAD RECORD:C212([COMPANIES:2])

READ WRITE:C146([CONTACTS:1])
QUERY:C277([CONTACTS:1]; [CONTACTS:1]EMail_After_At:24#"")
DB_lockFile(->[CONTACTS:1])
APPLY TO SELECTION:C70([CONTACTS:1]; Gen_EmailAddr(->[CONTACTS:1]Email_Before_At:30; ->[CONTACTS:1]EMail_After_At:24; 2))

AA_CheckFileUnlockedByTableNUM(Table:C252(->[CONTACTS:1]))
READ ONLY:C145([CONTACTS:1])
UNLOAD RECORD:C212([CONTACTS:1])

User_Message(Char:C90(13)+"      Updating Macros"+Char:C90(13))
READ WRITE:C146([SCRIPTS:80])
QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Recording_Text:4="@]Email Address@")
DB_lockFile(->[SCRIPTS:80])
APPLY TO SELECTION:C70([SCRIPTS:80]; [SCRIPTS:80]Recording_Text:4:=Replace string:C233([SCRIPTS:80]Recording_Text:4; "]Email Address"; "]Email AfterAt"))

AA_CheckFileUnlockedByTableNUM(Table:C252(->[SCRIPTS:80]))
READ ONLY:C145([SCRIPTS:80])
UNLOAD RECORD:C212([SCRIPTS:80])
ERR_MethodTrackerReturn("User_Vers41006"; $_t_oldMethodName)