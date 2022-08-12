//%attributes = {}
If (False:C215)
	//Project Method Name:      Comp_Del
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

$_t_oldMethodName:=ERR_MethodTracker("Comp_Del")
//Comp_Del
READ WRITE:C146([DIARY:12])
READ WRITE:C146([INFORMATION:55])

QUERY:C277([INFORMATION:55]; [INFORMATION:55]Company_Code:7=[COMPANIES:2]Company_Code:1)
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
Minor_DelRecords(->[CONTACTS:1]; ->[CONTACTS:1]Contact_Code:2; "Contacts")
//DELETE SELECTION([CONTACTS])
If (Not:C34(In transaction:C397))
	DB_lockFile(->[CONTACTS:1])
	APPLY TO SELECTION:C70([CONTACTS:1]; [CONTACTS:1]Deleted:32:=1)
	
	AA_CheckFileUnlockedByTableNUM(Table:C252(->[CONTACTS:1]))
Else 
	FIRST RECORD:C50([CONTACTS:1])
	For ($_l_Index; 1; Records in selection:C76([CONTACTS:1]))
		[CONTACTS:1]Deleted:32:=1
		DB_SaveRecord(->[CONTACTS:1])
		AA_CheckFileUnlocked(->[CONTACTS:1]x_ID:33)
		NEXT RECORD:C51([CONTACTS:1])
	End for 
End if 

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
//DELETE SELECTION([DIARY])
READ WRITE:C146([CUSTOM_FIELDS:98])
//DELETE SELECTION([FURTHER FIELDS])
DB_lockFile(->[CUSTOM_FIELDS:98])
APPLY TO SELECTION:C70([CUSTOM_FIELDS:98]; [CUSTOM_FIELDS:98]Deleted:8:=1)

AA_CheckFileUnlockedByTableNUM(Table:C252(->[CUSTOM_FIELDS:98]))
READ ONLY:C145([CUSTOM_FIELDS:98])
ERR_MethodTrackerReturn("Comp_Del"; $_t_oldMethodName)