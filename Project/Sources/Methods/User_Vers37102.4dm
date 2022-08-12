//%attributes = {}
If (False:C215)
	//Project Method Name:      User_Vers37102
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
	ARRAY DATE:C224($_ad_DatesDoFrom; 0)
	ARRAY DATE:C224($_ad_DatesDone; 0)
	ARRAY TIME:C1223($_ati_TimeDoFrom; 0)
	ARRAY TIME:C1223($_ati_TimeDoneFrom; 0)
	ARRAY TIME:C1223($_ati_TimeDoneTo; 0)
	C_LONGINT:C283($_l_CountRecords; $i)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("User_Vers37102")
//User_Vers37102
//Update DiaryTos to be the same as the Froms
READ WRITE:C146([DIARY:12])
QUERY:C277([DIARY:12]; [DIARY:12]Date_Done_From:5=!00-00-00!)
$_l_CountRecords:=Records in selection:C76([DIARY:12])
If ($_l_CountRecords>0)
	User_Message(Char:C90(13)+"    Updating "+String:C10($_l_CountRecords)+" Diary Items")
	ARRAY DATE:C224($_ad_DatesDoFrom; $_l_CountRecords)
	ARRAY TIME:C1223($_ati_TimeDoFrom; $_l_CountRecords)
	ARRAY TIME:C1223($_ati_TimeDoneTo; $_l_CountRecords)
	SELECTION TO ARRAY:C260([DIARY:12]Date_Do_From:4; $_ad_DatesDoFrom; [DIARY:12]Time_Do_From:6; $_ati_TimeDoFrom; [DIARY:12]Time_Done_From:7; $_ati_TimeDoneFrom)
	For ($i; 1; $_l_CountRecords)
		If ($_ati_TimeDoneFrom{$i}>0)
			$_ati_TimeDoFrom{$i}:=$_ati_TimeDoneFrom{$i}
		End if 
	End for 
	ARRAY TO SELECTION:C261($_ad_DatesDoFrom; [DIARY:12]Date_Do_To:33; $_ati_TimeDoFrom; [DIARY:12]Time_Do_To:35)
End if 
QUERY:C277([DIARY:12]; [DIARY:12]Date_Done_From:5#!00-00-00!)
$_l_CountRecords:=Records in selection:C76([DIARY:12])
If ($_l_CountRecords>0)
	User_Message(Char:C90(13)+"    Updating "+String:C10($_l_CountRecords)+" Diary Items")
	ARRAY DATE:C224($_ad_DatesDoFrom; $_l_CountRecords)
	ARRAY DATE:C224($_ad_DatesDone; $_l_CountRecords)
	ARRAY TIME:C1223($_ati_TimeDoFrom; $_l_CountRecords)
	ARRAY TIME:C1223($_ati_TimeDoneTo; $_l_CountRecords)
	SELECTION TO ARRAY:C260([DIARY:12]Date_Do_From:4; $_ad_DatesDoFrom; [DIARY:12]Time_Do_From:6; $_ati_TimeDoFrom; [DIARY:12]Date_Done_From:5; $_ad_DatesDone; [DIARY:12]Time_Done_From:7; $_ati_TimeDoneFrom)
	ARRAY TO SELECTION:C261($_ad_DatesDoFrom; [DIARY:12]Date_Do_To:33; $_ati_TimeDoFrom; [DIARY:12]Time_Do_To:35; $_ad_DatesDone; [DIARY:12]Date_Done_To:34; $_ati_TimeDoneFrom; [DIARY:12]Time_Done_To:36)
End if 
UNLOAD RECORD:C212([DIARY:12])
READ ONLY:C145([DIARY:12])

[USER:15]Time Day:198:=8
[USER:15]Time Day Start:199:=?09:00:00?
ERR_MethodTrackerReturn("User_Vers37102"; $_t_oldMethodName)
