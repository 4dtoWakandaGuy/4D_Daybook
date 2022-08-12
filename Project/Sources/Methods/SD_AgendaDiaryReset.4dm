//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_AgendaDiaryReset
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
	C_LONGINT:C283($1)
	C_TEXT:C284($_t_oldMethodName; $_t_PersonInitials)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_AgendaDiaryReset")

//NG November 2004
//This method is called after the colour settings screen to modify diary records
// It is passsed the parameter of the Users ID

If (Count parameters:C259>=1)
	If ($1>0)
		READ ONLY:C145([PERSONNEL:11])
		QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=$1)
		$_t_PersonInitials:=[PERSONNEL:11]Initials:1
		If ($_t_PersonInitials#"")
			READ WRITE:C146([DIARY:12])
			
			QUERY:C277([DIARY:12]; [DIARY:12]Person:8=$_t_PersonInitials)
			DB_lockFile(->[DIARY:12])
			APPLY TO SELECTION:C70([DIARY:12]; AG_SetDiaryColours)
			AA_CheckFileUnlockedByTableNUM(Table:C252(->[DIARY:12]))
			UNLOAD RECORD:C212([DIARY:12])
			READ ONLY:C145([DIARY:12])
			
		End if 
	End if 
	
End if 
ERR_MethodTrackerReturn("SD_AgendaDiaryReset"; $_t_oldMethodName)
