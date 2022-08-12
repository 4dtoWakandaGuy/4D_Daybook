//%attributes = {}
If (False:C215)
	//Project Method Name:      User_Vers37108
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
	ARRAY DATE:C224($_ad_DatesDone; 0)
	ARRAY TEXT:C222($_at_DiaryPersons; 0)
	C_LONGINT:C283($_l_CountRecords; $i)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("User_Vers37108")
READ WRITE:C146([DIARY:12])
QUERY:C277([DIARY:12]; [DIARY:12]Date_Done_From:5#!00-00-00!; *)
QUERY:C277([DIARY:12];  & ; [DIARY:12]Date_Done_To:34=!00-00-00!)
$_l_CountRecords:=Records in selection:C76([DIARY:12])
If ($_l_CountRecords>0)
	User_Message(Char:C90(13)+"    Updating "+String:C10($_l_CountRecords)+" Diary Date Done fields")
	ARRAY DATE:C224($_ad_DatesDone; $_l_CountRecords)
	SELECTION TO ARRAY:C260([DIARY:12]Date_Done_From:5; $_ad_DatesDone)
	ARRAY TO SELECTION:C261($_ad_DatesDone; [DIARY:12]Date_Done_To:34)
	UNLOAD RECORD:C212([DIARY:12])
End if 
QUERY:C277([DIARY:12]; [DIARY:12]Originator:23#""; *)
QUERY:C277([DIARY:12];  & ; [DIARY:12]Person:8="")
$_l_CountRecords:=Records in selection:C76([DIARY:12])
If ($_l_CountRecords>0)
	User_Message(Char:C90(13)+"    Updating "+String:C10($_l_CountRecords)+" Diary Person fields")
	ARRAY TEXT:C222($_at_DiaryPersons; $_l_CountRecords)
	SELECTION TO ARRAY:C260([DIARY:12]Originator:23; $_at_DiaryPersons)
	ARRAY TO SELECTION:C261($_at_DiaryPersons; [DIARY:12]Person:8)
	UNLOAD RECORD:C212([DIARY:12])
End if 
READ ONLY:C145([DIARY:12])
ERR_MethodTrackerReturn("User_Vers37108"; $_t_oldMethodName)
