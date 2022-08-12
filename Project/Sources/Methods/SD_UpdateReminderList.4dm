//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_UpdateReminderList
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 31/01/2010 19:48
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SM_al_RecordNumbers;0)
	C_BOOLEAN:C305($_bo_OK)
	C_LONGINT:C283($_l_Delay; $_l_offset; $_l_RecordRow; $_l_Repeats)
	C_REAL:C285($1; $3)
	C_TEXT:C284($_t_oldMethodName; $2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_UpdateReminderList")
ARRAY LONGINT:C221(SM_al_RecordNumbers; 0)
While (Semaphore:C143("CreatingDiaryReminders"))
	DelayTicks(60)
End while 
READ WRITE:C146([USER_SETS:105])
QUERY:C277([USER_SETS:105]; [USER_SETS:105]SET_ID:3=$1; *)
QUERY:C277([USER_SETS:105];  & ; [USER_SETS:105]Set_Table:5=-(Table:C252(->[DIARY:12])); *)
QUERY:C277([USER_SETS:105];  & ; [USER_SETS:105]USER_INITIALS:2=$2)
If (Records in selection:C76([USER_SETS:105])=0)
	
	
	QUERY:C277([DIARY:12]; [DIARY:12]Person:8=$2; *)
	QUERY:C277([DIARY:12];  & ; [DIARY:12]Alarm_Timeframe:48#0; *)
	QUERY:C277([DIARY:12];  & ; [DIARY:12]Done:14=False:C215)
	CREATE SET:C116([DIARY:12]; "set1")
	QUERY:C277([DIARY:12]; [DIARY:12]Person:8#$2; *)
	QUERY:C277([DIARY:12];  & ; [DIARY:12]Alarm_Timeframe:48#0; *)
	QUERY:C277([DIARY:12];  & ; [DIARY:12]Done:14=False:C215)
	CREATE SET:C116([DIARY:12]; "Set2")
	QUERY:C277([DIARY_ITEMOWNERS:106]; [DIARY_ITEMOWNERS:106]PERSONNEL_ID:2=$1)
	RELATE ONE SELECTION:C349([DIARY_ITEMOWNERS:106]; [DIARY:12])
	CREATE SET:C116([DIARY:12]; "Set3")
	INTERSECTION:C121("Set3"; "Set2"; "Set3")
	UNION:C120("Set1"; "Set3"; "Set1")
	USE SET:C118("Set1")
	CLEAR SET:C117("Set1")
	CLEAR SET:C117("Set2")
	CLEAR SET:C117("set3")
	LONGINT ARRAY FROM SELECTION:C647([DIARY:12]; SM_al_RecordNumbers)
	CREATE RECORD:C68([USER_SETS:105])
	
	SET BLOB SIZE:C606([USER_SETS:105]SET_BLOB:4; 0)
	
	VARIABLE TO BLOB:C532(SM_al_RecordNumbers; [USER_SETS:105]SET_BLOB:4)
	CREATE RECORD:C68([USER_SETS:105])
	[USER_SETS:105]SET_ID:3:=$1
	[USER_SETS:105]Set_Table:5:=-(Table:C252(->[DIARY:12]))
	[USER_SETS:105]USER_INITIALS:2:=$2
Else 
	
	$_bo_OK:=False:C215
	$_l_Repeats:=0
	$_l_Delay:=1
	Repeat 
		$_l_Repeats:=$_l_Repeats+1
		$_bo_OK:=Check_Locked(->[USER_SETS:105]; 1)
		If (Not:C34($_bo_OK))
			If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
				//only increase every 10 tries
				$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
			End if 
			DelayTicks(2*$_l_Delay)
		End if 
	Until ($_bo_OK=True:C214)
	
End if 
$_l_offset:=0
BLOB TO VARIABLE:C533([USER_SETS:105]SET_BLOB:4; SM_al_RecordNumbers; $_l_offset)
If ($3<0)
	//remove from set
	$_l_RecordRow:=Find in array:C230(SM_al_RecordNumbers; Abs:C99($3))
	If ($_l_RecordRow>0)
		DELETE FROM ARRAY:C228(SM_al_RecordNumbers; $_l_RecordRow)
	End if 
Else 
	$_l_RecordRow:=Find in array:C230(SM_al_RecordNumbers; $3)
	If ($_l_RecordRow<0)
		INSERT IN ARRAY:C227(SM_al_RecordNumbers; Size of array:C274(SM_al_RecordNumbers)+1; 1)
		SM_al_RecordNumbers{Size of array:C274(SM_al_RecordNumbers)}:=$3
	End if 
End if 

SET BLOB SIZE:C606([USER_SETS:105]SET_BLOB:4; 0)
VARIABLE TO BLOB:C532(SM_al_RecordNumbers; [USER_SETS:105]SET_BLOB:4)
DB_SaveRecord(->[USER_SETS:105])
AA_CheckFileUnlocked(->[USER_SETS:105]x_RecID:1)
UNLOAD RECORD:C212([USER_SETS:105])
READ ONLY:C145([USER_SETS:105])
CLEAR SEMAPHORE:C144("CreatingDiaryReminders")
ERR_MethodTrackerReturn("SD_UpdateReminderList"; $_t_oldMethodName)
