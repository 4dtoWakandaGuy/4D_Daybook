//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      User Vers37115
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

$_t_oldMethodName:=ERR_MethodTracker("User Vers37115")
User_Message(Char:C90(13)+"      Searching Diary")
READ WRITE:C146([DIARY:12])
QUERY:C277([DIARY:12]; [DIARY:12]Done:14=False:C215)
QUERY SELECTION BY FORMULA:C207([DIARY:12]; [DIARY:12]Personal_Priority:31#([DIARY:12]Person:8+"@"))
If (Records in selection:C76([DIARY:12])>0)
	User_Message(Char:C90(13)+"      Updating "+String:C10(Records in selection:C76([DIARY:12]))+" Diary Items")
	DB_lockFile(->[DIARY:12])
	APPLY TO SELECTION:C70([DIARY:12]; Diary_PersPrior)
	
	AA_CheckFileUnlockedByTableNUM(Table:C252(->[DIARY:12]))
End if 
READ ONLY:C145([DIARY:12])
UNLOAD RECORD:C212([DIARY:12])

User_Message(Char:C90(13)+"      Copying Lists")
READ WRITE:C146([LIST_ITEMS:95])
Gen_ListtoLists("Delivery Methods"; "Del Methods")
Gen_ListtoLists("Terms"; "Terms")
Gen_ListtoLists("Titles"; "Titles")
Gen_ListtoLists("VAT Prefixes"; "VAT Prefixes")
Gen_ListtoLists("Ad Formats"; "Ad Formats")
Gen_ListtoLists("Ad Colours"; "Ad Colours")
//Gen_ListtoLists ("Quality Groups";"Qual Groups")
QualGroups_Arr2
READ WRITE:C146([LIST_ITEMS:95])
Gen_ListtoLists("Quality SubGroups"; "Qual SubGroups")
Gen_ListtoLists("Usage Periods"; "Usage Periods")
Gen_ListtoLists("Usage Countries"; "Usage Countries")
Gen_ListtoLists("Mailsort"; "Mailsort")
//Gen_ListtoLists ("Skill Levels";"Skill Levels")
Gen_ListtoLists("Info From"; "Info From")
READ ONLY:C145([LIST_ITEMS:95])
UNLOAD RECORD:C212([LIST_ITEMS:95])

[USER:15]No Cont Titles:121:=False:C215
ERR_MethodTrackerReturn("User Vers37115"; $_t_oldMethodName)