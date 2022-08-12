//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Cont Del
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:42
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

$_t_oldMethodName:=ERR_MethodTracker("Cont Del")
//Cont Del
READ WRITE:C146([DIARY:12])

READ WRITE:C146([INFORMATION:55])
Minor_DelRecords(->[DIARY:12]; ->[DIARY:12]Diary_Code:3; "Diary")
If (Not:C34(In transaction:C397))
	DB_lockFile(->[DIARY:12])
	APPLY TO SELECTION:C70([DIARY:12]; [DIARY:12]Deleted:43:=1)
	
	AA_CheckFileUnlockedByTableNUM(Table:C252(->[DIARY:12]))
Else 
	FIRST RECORD:C50([DIARY:12])
	For ($_l_Index; 1; Records in selection:C76([DIARY:12]))
		[DIARY:12]Deleted:43:=1
		DB_SaveRecord(->[DIARY:12])
		AA_CheckFileUnlocked(->[DIARY:12]x_ID:50)
		NEXT RECORD:C51([DIARY:12])
	End for 
End if 

If (Not:C34(In transaction:C397))
	DB_lockFile(->[INFORMATION:55])
	APPLY TO SELECTION:C70([INFORMATION:55]; [INFORMATION:55]Deleted:10:=1)
	
	AA_CheckFileUnlockedByTableNUM(Table:C252(->[INFORMATION:55]))
Else 
	
	FIRST RECORD:C50([INFORMATION:55])
	For ($_l_Index; 1; Records in selection:C76([INFORMATION:55]))
		[INFORMATION:55]Deleted:10:=1
		DB_SaveRecord(->[INFORMATION:55])
		AA_CheckFileUnlocked(->[INFORMATION:55]QualityRecordID:16)
		NEXT RECORD:C51([INFORMATION:55])
	End for 
End if 

//DELETE SELECTION([QUALITIES])

READ WRITE:C146([CUSTOM_FIELDS:98])
DB_lockFile(->[CUSTOM_FIELDS:98])
APPLY TO SELECTION:C70([CUSTOM_FIELDS:98]; [CUSTOM_FIELDS:98]Deleted:8:=1)

AA_CheckFileUnlockedByTableNUM(Table:C252(->[CUSTOM_FIELDS:98]))
//DELETE SELECTION([FURTHER FIELDS])
READ ONLY:C145([CUSTOM_FIELDS:98])
ERR_MethodTrackerReturn("Cont Del"; $_t_oldMethodName)