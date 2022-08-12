//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_updateSOUNDEX
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

$_t_oldMethodName:=ERR_MethodTracker("DB_updateSOUNDEX")
//This method will create a soundex
ALL RECORDS:C47([COMPANIES:2])

READ WRITE:C146([COMPANIES:2])
If (Not:C34(In transaction:C397))
	DB_lockFile(->[COMPANIES:2])
	APPLY TO SELECTION:C70([COMPANIES:2]; [COMPANIES:2]Phonetic_Name:64:=DB_BuildSoundex(DB_CompanyNameClean([COMPANIES:2]Company_Name:2)))
	
	
	AA_CheckFileUnlockedByTableNUM(Table:C252(->[COMPANIES:2]))
Else 
	FIRST RECORD:C50([COMPANIES:2])
	For ($_l_Index; 1; Records in selection:C76([COMPANIES:2]))
		[COMPANIES:2]Phonetic_Name:64:=DB_BuildSoundex(DB_CompanyNameClean([COMPANIES:2]Company_Name:2))
		
		
		DB_SaveRecord(->[COMPANIES:2])
		AA_CheckFileUnlocked(->[COMPANIES:2]x_ID:63)
		NEXT RECORD:C51([COMPANIES:2])
	End for 
End if 
ERR_MethodTrackerReturn("DB_updateSOUNDEX"; $_t_oldMethodName)