//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      User Vers41000
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

$_t_oldMethodName:=ERR_MethodTracker("User Vers41000")
QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]List_Name:1="Lists"; *)
QUERY:C277([LIST_ITEMS:95];  & ; [LIST_ITEMS:95]List_Entry:2="Pictures")
If (Records in selection:C76([LIST_ITEMS:95])=0)
	User_Message(Char:C90(13)+"      Creating Pictures List"+Char:C90(13))
	READ WRITE:C146([LIST_ITEMS:95])
	CREATE RECORD:C68([LIST_ITEMS:95])
	[LIST_ITEMS:95]List_Name:1:="Lists"
	[LIST_ITEMS:95]List_Entry:2:="Pictures"
	DB_SaveRecord(->[LIST_ITEMS:95])
	AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
End if 
UNLOAD RECORD:C212([LIST_ITEMS:95])
ERR_MethodTrackerReturn("User Vers41000"; $_t_oldMethodName)