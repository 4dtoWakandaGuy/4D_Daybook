//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_ContactSoundexBuilder
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:40If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Index)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_ContactSoundexBuilder")
//Now we build a soundex of that
READ WRITE:C146([CONTACTS:1])
ALL RECORDS:C47([CONTACTS:1])
QUERY:C277([CONTACTS:1]; [CONTACTS:1]Soundex:37=""; *)
QUERY:C277([CONTACTS:1];  & ; [CONTACTS:1]Surname:5#"")
MESSAGES ON:C181

//StartTransaction
If (Not:C34(In transaction:C397))
	DB_lockFile(->[CONTACTS:1])
	APPLY TO SELECTION:C70([CONTACTS:1]; [CONTACTS:1]Soundex:37:=DB_BuildSoundex(DB_ContactNameClean([CONTACTS:1]Surname:5)))
	
	AA_CheckFileUnlockedByTableNUM(Table:C252(->[CONTACTS:1]))
Else 
	FIRST RECORD:C50([CONTACTS:1])
	For ($_l_Index; 1; Records in selection:C76([CONTACTS:1]))
		[CONTACTS:1]Soundex:37:=DB_BuildSoundex(DB_ContactNameClean([CONTACTS:1]Surname:5))
		DB_SaveRecord(->[CONTACTS:1])
		AA_CheckFileUnlocked(->[CONTACTS:1]x_ID:33)
		NEXT RECORD:C51([CONTACTS:1])
	End for 
End if 
//Transact_End (True)




UNLOAD RECORD:C212([CONTACTS:1])
READ ONLY:C145([CONTACTS:1])
ERR_MethodTrackerReturn("DB_ContactSoundexBuilder"; $_t_oldMethodName)