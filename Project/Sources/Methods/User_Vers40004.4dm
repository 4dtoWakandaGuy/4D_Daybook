//%attributes = {}
If (False:C215)
	//Project Method Name:      User_Vers40004
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

$_t_oldMethodName:=ERR_MethodTracker("User_Vers40004")
//SEARCH([LIST LAYOUTS];[LIST LAYOUTS]Layout Ref="02503")
//If (Records in selection([LIST LAYOUTS])=0)
// MESSAGE(Char(13)+"      Creating Order Item List Definitions")
// ALListLay02503
//Else
// UNLOAD RECORD([LIST LAYOUTS])
//End if
READ WRITE:C146([LIST_ITEMS:95])
CREATE RECORD:C68([LIST_ITEMS:95])
[LIST_ITEMS:95]List_Name:1:="Del Terms"
[LIST_ITEMS:95]List_Entry:2:="EXW"
DB_SaveRecord(->[LIST_ITEMS:95])
AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
CREATE RECORD:C68([LIST_ITEMS:95])
[LIST_ITEMS:95]List_Name:1:="Del Terms"
[LIST_ITEMS:95]List_Entry:2:="FOB"
DB_SaveRecord(->[LIST_ITEMS:95])
AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
UNLOAD RECORD:C212([LIST_ITEMS:95])
READ ONLY:C145([LIST_ITEMS:95])
ERR_MethodTrackerReturn("User_Vers40004"; $_t_oldMethodName)