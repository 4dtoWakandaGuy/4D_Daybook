//%attributes = {}
If (False:C215)
	//Project Method Name:      AA_UpdateListVersion
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:40
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("AA_UpdateListVersion")
//this method will load a list record and change the number of it
//this can then be used to force a reload of a list on a client machine
//AA_UpdateListVersion
If (Count parameters:C259>=1)
	If ($1>0)
		While (Semaphore:C143("AddingToList"))
			DelayTicks
		End while 
		READ WRITE:C146([X_LISTS:111])
		QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ID:1=$1)
		[X_LISTS:111]X_ListVersion:5:=[X_LISTS:111]X_ListVersion:5+1
		DB_SaveRecord(->[X_LISTS:111])
		AA_CheckFileUnlocked(->[X_LISTS:111]x_ID:1)
		UNLOAD RECORD:C212([X_LISTS:111])
		CLEAR SEMAPHORE:C144("AddingToList")
	End if 
End if 
ERR_MethodTrackerReturn("AA_UpdateListVersion"; $_t_oldMethodName)
