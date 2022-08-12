//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      User Vers5000
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/09/2009 07:47
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>SYS_l_MaxConnectedUsers; $_l_AddedItemID; $_l_FieldNumber; $_l_Index; $_l_ListID; $_l_RecordID; $_l_RestrictionListID; $_l_TableNumber)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("User Vers5000")

MESSAGE:C88(Char:C90(13)+"   Version Updating in progress"+Char:C90(13)+"   Please wait ..."+Char:C90(13))

[USER:15]SuperDiaryActive:245:=True:C214
DB_SaveRecord(->[USER:15])  //Tue, Mar 7, 2006 bwalia: added

AA_CheckFileUnlockedByTableNUM(Table:C252(->[USER:15]))
UNLOAD RECORD:C212([USER:15])
If (False:C215)
	READ ONLY:C145([USER:15])
	READ WRITE:C146([X_LISTS:111])
	ALL RECORDS:C47([X_LISTS:111])
	DELETE SELECTION:C66([X_LISTS:111])
	READ WRITE:C146([LIST_ITEMS:95])
	QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ListID:4>0)
	
	DB_lockFile(->[LIST_ITEMS:95])
	APPLY TO SELECTION:C70([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ListID:4:=0)
	
	AA_CheckFileUnlockedByTableNUM(Table:C252(->[LIST_ITEMS:95]))
	UNLOAD RECORD:C212([LIST_ITEMS:95])
	READ ONLY:C145([LIST_ITEMS:95])
	
	SET PROCESS VARIABLE:C370(-1; <>SYS_l_MaxConnectedUsers; 1)
	READ WRITE:C146([x_ListUsage:112])
	ALL RECORDS:C47([x_ListUsage:112])
	DELETE SELECTION:C66([x_ListUsage:112])
	
	<>SYS_l_MaxConnectedUsers:=1
	
	$_l_ListID:=AA_GetListbyName("Record Access"; True:C214)
	$_l_RestrictionListID:=AA_GetListbyName("Table Restriction"; True:C214)
	
	$_l_TableNumber:=Table:C252(->[COMPANIES:2])
	$_l_FieldNumber:=Field:C253(->[COMPANIES:2]Record_State:62)
	$_l_ListID:=AA_GetListID($_l_TableNumber; $_l_FieldNumber; "Company Record States")
	
	$_l_AddedItemID:=AA_ListAddItembyID($_l_ListID; "Clean")
End if 

<>SYS_l_MaxConnectedUsers:=0
If (False:C215)
	READ WRITE:C146([COMPANIES:2])
	QUERY:C277([COMPANIES:2]; [COMPANIES:2]x_ID:63=0)
	If (Records in selection:C76([COMPANIES:2])>0)
		$_l_RecordID:=AA_GetNextIDinMethod(->[COMPANIES:2]x_ID:63; -(Records in selection:C76([COMPANIES:2])))
		For ($_l_Index; 1; Records in selection:C76([COMPANIES:2]))
			[COMPANIES:2]x_ID:63:=$_l_RecordID
			$_l_RecordID:=$_l_RecordID+1
			DB_SaveRecord(->[COMPANIES:2])
			AA_CheckFileUnlocked(->[COMPANIES:2]x_ID:63)
			NEXT RECORD:C51([COMPANIES:2])
			ERASE WINDOW:C160
			MESSAGE:C88("Updating Company Record "+String:C10($_l_Index)+" of "+String:C10(Records in selection:C76([COMPANIES:2])))
			
			
		End for 
	End if 
End if 


READ WRITE:C146([CONTACTS:1])
QUERY:C277([CONTACTS:1]; [CONTACTS:1]x_ID:33=0)
If (Records in selection:C76([CONTACTS:1])>0)
	User_Message(Char:C90(13)+"   Updating Contact Records")
	$_l_RecordID:=AA_GetNextIDinMethod(->[CONTACTS:1]x_ID:33; -(Records in selection:C76([CONTACTS:1])))
	For ($_l_Index; 1; Records in selection:C76([CONTACTS:1]))
		[CONTACTS:1]x_ID:33:=$_l_RecordID
		$_l_RecordID:=$_l_RecordID+1
		DB_SaveRecord(->[CONTACTS:1])
		AA_CheckFileUnlocked(->[CONTACTS:1]x_ID:33)
		NEXT RECORD:C51([CONTACTS:1])
		ERASE WINDOW:C160
		User_Message(Char:C90(13)+"   Updating Contact Record "+String:C10($_l_Index)+" of "+String:C10(Records in selection:C76([CONTACTS:1])))
		
	End for 
End if 


READ WRITE:C146([DIARY:12])
QUERY:C277([DIARY:12]; [DIARY:12]x_ID:50=0)
If (Records in selection:C76([DIARY:12])>0)
	User_Message(Char:C90(13)+"   Updating Diary Records")
	$_l_RecordID:=AA_GetNextIDinMethod(->[DIARY:12]x_ID:50; -(Records in selection:C76([DIARY:12])))
	
	For ($_l_Index; 1; Records in selection:C76([DIARY:12]))
		[DIARY:12]x_ID:50:=$_l_RecordID
		$_l_RecordID:=$_l_RecordID+1
		DB_SaveRecord(->[DIARY:12])
		AA_CheckFileUnlocked(->[DIARY:12]x_ID:50)
		NEXT RECORD:C51([DIARY:12])
		ERASE WINDOW:C160
		User_Message(Char:C90(13)+"   Updating Diary Record "+String:C10($_l_Index)+"  of  "+String:C10(Records in selection:C76([DIARY:12])))
		
	End for 
End if 

UNLOAD RECORD:C212([DIARY:12])
READ ONLY:C145([DIARY:12])

UNLOAD RECORD:C212([CONTACTS:1])
READ ONLY:C145([CONTACTS:1])
UNLOAD RECORD:C212([COMPANIES:2])
<>SYS_l_MaxConnectedUsers:=1
User_Message(Char:C90(13)+"   Converting Qualities")
UPD_ConvertQualities
//User_Vers50001
ERR_MethodTrackerReturn("User Vers5000"; $_t_oldMethodName)
