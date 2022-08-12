//%attributes = {}
If (False:C215)
	//Project Method Name:      User_Vers41010
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

$_t_oldMethodName:=ERR_MethodTracker("User_Vers41010")
QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]List_Name:1="Lists"; *)
QUERY:C277([LIST_ITEMS:95];  & ; [LIST_ITEMS:95]List_Entry:2="Rate Types")
If (Records in selection:C76([LIST_ITEMS:95])=0)
	User_Message(Char:C90(13)+"      Creating Currency Rate Types List"+Char:C90(13))
	READ WRITE:C146([LIST_ITEMS:95])
	CREATE RECORD:C68([LIST_ITEMS:95])
	[LIST_ITEMS:95]List_Name:1:="Lists"
	[LIST_ITEMS:95]List_Entry:2:="Rate Types"
	DB_SaveRecord(->[LIST_ITEMS:95])
	AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
	CREATE RECORD:C68([LIST_ITEMS:95])
	[LIST_ITEMS:95]List_Name:1:="Rate Types"
	[LIST_ITEMS:95]List_Entry:2:="Current"
	DB_SaveRecord(->[LIST_ITEMS:95])
	AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
	CREATE RECORD:C68([LIST_ITEMS:95])
	[LIST_ITEMS:95]List_Name:1:="Rate Types"
	[LIST_ITEMS:95]List_Entry:2:="Average"
	DB_SaveRecord(->[LIST_ITEMS:95])
	AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
End if 
UNLOAD RECORD:C212([LIST_ITEMS:95])


QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1="ITX @"; *)
QUERY:C277([SCRIPTS:80];  | ; [SCRIPTS:80]Script_Code:1="IMA @")
If (Records in selection:C76([SCRIPTS:80])>0)
	User_Message(Char:C90(13)+"      Updating ITX and IMA Macros"+Char:C90(13))
	READ WRITE:C146([SCRIPTS:80])
	DB_lockFile(->[SCRIPTS:80])
	APPLY TO SELECTION:C70([SCRIPTS:80]; [SCRIPTS:80]Recording_Text:4:=Replace string:C233(Replace string:C233([SCRIPTS:80]Recording_Text:4; "<<"; "<*"); ">>"; "*>"))
	
	AA_CheckFileUnlockedByTableNUM(Table:C252(->[SCRIPTS:80]))
End if 
UNLOAD RECORD:C212([SCRIPTS:80])
READ ONLY:C145([SCRIPTS:80])
ERR_MethodTrackerReturn("User_Vers41010"; $_t_oldMethodName)