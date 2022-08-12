//%attributes = {}
If (False:C215)
	//Project Method Name:      Macro_Fix_Terms
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
	C_REAL:C285($_l_Index)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Macro_Fix_Terms")
CONFIRM:C162("Do you want to fix the Terms?")
If (OK=1)
	MESSAGE:C88("Fixing Terms")
	READ WRITE:C146([LIST_ITEMS:95])
	ALL RECORDS:C47([LIST_ITEMS:95])
	For ($_l_Index; 1; Records in selection:C76([LIST_ITEMS:95]))
		QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ListName:2=[LIST_ITEMS:95]List_Name:1)
		MESSAGE:C88("Fixing Terms: "+String:C10($_l_Index)+" of "+String:C10(Records in selection:C76([LIST_ITEMS:95]))+" scanned")
		If ([X_LISTS:111]x_ID:1#[LIST_ITEMS:95]X_ListID:4)
			MESSAGE:C88([LIST_ITEMS:95]List_Name:1+" fixed")
			[X_LISTS:111]x_ID:1:=[LIST_ITEMS:95]X_ListID:4
			DB_SaveRecord(->[X_LISTS:111])
			AA_CheckFileUnlocked(->[X_LISTS:111]x_ID:1)
		End if 
	End for 
End if 
//ALERT("Terms Fixed")
Gen_Alert("Terms Fixed!")
ERR_MethodTrackerReturn("Macro_Fix_Terms"; $_t_oldMethodName)
