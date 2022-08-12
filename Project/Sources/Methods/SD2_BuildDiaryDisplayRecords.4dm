//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_BuildDiaryDisplayRecords
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/11/2009 21:13
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_DiaryIDS; 0)
	ARRAY LONGINT:C221($_al_InstanceIDS; 0)
	ARRAY LONGINT:C221($_al_RecordIDS; 0)
	ARRAY LONGINT:C221($_al_ReusedIDS; 0)
	ARRAY LONGINT:C221($_al_ReUseIDS; 0)
	//ARRAY LONGINT(SD2_al_SearchUIDs;0)
	C_BOOLEAN:C305($_bo_Create; $_bo_Resave)
	C_LONGINT:C283($_l_CurrentRow; $_l_DIaryIndex; $_l_RecordRow; $_l_ReuseIndex; $_l_TimeSpan; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_BuildDiaryDisplayRecords")

SD2_LoadCurrentSchedules
ALL RECORDS:C47([X_DIaryDisplay:142])
CREATE SET:C116([X_DIaryDisplay:142]; "TEMP1")
QUERY WITH ARRAY:C644([X_DIaryDisplay:142]xDiaryInstanceUID:2; SD2_al_SearchUIDs)
//THIS FINDS ALL RECORDS RELATING TO A CURRENT ID
CREATE SET:C116([X_DIaryDisplay:142]; "TEMP2")
DIFFERENCE:C122("TEMP1"; "TEMP2"; "TEMP2")
USE SET:C118("TEMP2")
CLEAR SET:C117("TEMP2")
CLEAR SET:C117("TEMP1")
If (Count parameters:C259>=1)  //THAT GIVES US RECODs THAT CANB E RE-USED
	ARRAY LONGINT:C221($_al_ReUseIDS; 0)
	SELECTION TO ARRAY:C260([X_DIaryDisplay:142]xDiaryInstanceUID:2; $_al_ReUseIDS; [X_DIaryDisplay:142]xDiaryInstanceUID:2; $_al_InstanceIDS)
	QUERY:C277([X_DIaryDisplay:142]; [X_DIaryDisplay:142]xDiaryInstanceUID:2=$1)
	READ WRITE:C146([X_DIaryDisplay:142])
	ARRAY LONGINT:C221($_al_DiaryIDS; 0)
	ARRAY LONGINT:C221($_al_RecordIDS; 0)
	SELECTION TO ARRAY:C260([X_DIaryDisplay:142]x_DiaryViewRecordID:1; $_al_RecordIDS; [X_DIaryDisplay:142]xDiaryRecordID:3; $_al_DiaryIDS)
	SORT ARRAY:C229($_al_DiaryIDS; $_al_RecordIDS)
	//Find records for the current IDS
	$_l_CurrentRow:=1
	ORDER BY:C49([DIARY:12]; [DIARY:12]x_ID:50; >)
	FIRST RECORD:C50([DIARY:12])
	CREATE EMPTY SET:C140([DIARY:12]; "Instancetocreate")
	For ($_l_ReuseIndex; 1; Records in selection:C76([DIARY:12]))
		If ([DIARY:12]X_REOCCOURANCE:67="")
			QUERY:C277([X_DIaryDisplay:142]; [X_DIaryDisplay:142]xDiaryInstanceUID:2=$1; *)
			QUERY:C277([X_DIaryDisplay:142];  & ; [X_DIaryDisplay:142]xDiaryCode:4=[DIARY:12]Diary_Code:3)
			If (Records in selection:C76([X_DIaryDisplay:142])=0)
				ADD TO SET:C119([DIARY:12]; "Instancetocreate")
			Else 
				$_l_RecordRow:=Find in array:C230($_al_RecordIDS; [X_DIaryDisplay:142]x_DiaryViewRecordID:1)
				If ($_l_RecordRow>0)  //it should be- so we don't overwrite it remove it from the array
					DELETE FROM ARRAY:C228($_al_RecordIDS; $_l_RecordRow)
					DELETE FROM ARRAY:C228($_al_DiaryIDS; $_l_RecordRow)
				End if 
				//The record is here only update if we need to
				$_bo_Resave:=False:C215
				If ([X_DIaryDisplay:142]xDiaryCode:4#[DIARY:12]Diary_Code:3)
					$_bo_Resave:=True:C214
					[X_DIaryDisplay:142]xDiaryCode:4:=[DIARY:12]Diary_Code:3
				End if 
				If ([X_DIaryDisplay:142]xInstanceTimeFrom:7#[DIARY:12]Display_Time_From:53)
					$_bo_Resave:=True:C214
					[X_DIaryDisplay:142]xInstanceTimeFrom:7:=[DIARY:12]Display_Time_From:53
				End if 
				If ([X_DIaryDisplay:142]xInstanceTimeTo:8#[DIARY:12]Display_Time_To:54)
					$_bo_Resave:=True:C214
					[X_DIaryDisplay:142]xInstanceTimeTo:8:=[DIARY:12]Display_Time_To:54
				End if 
				$_l_TimeSpan:=([DIARY:12]Display_Time_To:54*1)-([DIARY:12]Display_Time_From:53*1)
				If ($_l_TimeSpan<30*60)  //if the time is less than 30 mins then set the time slot as 30 mins
					If ([X_DIaryDisplay:142]xInstanceTimeSlotFrom:9#[X_DIaryDisplay:142]xInstanceTimeFrom:7)
						$_bo_Resave:=True:C214
						[X_DIaryDisplay:142]xInstanceTimeSlotFrom:9:=[X_DIaryDisplay:142]xInstanceTimeFrom:7
					End if 
					If ([X_DIaryDisplay:142]xInstanceTimeSlotTo:10#Time:C179(Time string:C180(([X_DIaryDisplay:142]xInstanceTimeFrom:7*1)+(30*60))))
						$_bo_Resave:=True:C214
						[X_DIaryDisplay:142]xInstanceTimeSlotTo:10:=Time:C179(Time string:C180(([X_DIaryDisplay:142]xInstanceTimeFrom:7*1)+(30*60)))
					End if 
				Else 
					If ([X_DIaryDisplay:142]xInstanceTimeSlotFrom:9#[X_DIaryDisplay:142]xInstanceTimeFrom:7)
						$_bo_Resave:=True:C214
						[X_DIaryDisplay:142]xInstanceTimeSlotFrom:9:=[X_DIaryDisplay:142]xInstanceTimeFrom:7
					End if 
					If ([X_DIaryDisplay:142]xInstanceTimeSlotTo:10#[X_DIaryDisplay:142]xInstanceTimeTo:8)
						$_bo_Resave:=True:C214
						[X_DIaryDisplay:142]xInstanceTimeSlotTo:10:=[X_DIaryDisplay:142]xInstanceTimeTo:8
					End if 
				End if 
				If ([X_DIaryDisplay:142]xInstanceDescription:11#[DIARY:12]Display_Description:55)
					$_bo_Resave:=True:C214
					[X_DIaryDisplay:142]xInstanceDescription:11:=[DIARY:12]Display_Description:55
				End if 
				If ($_bo_Resave)
					SAVE RECORD:C53([X_DIaryDisplay:142])
				End if 
				UNLOAD RECORD:C212([X_DIaryDisplay:142])
			End if 
		Else 
			//Repeating event
		End if 
		NEXT RECORD:C51([DIARY:12])
	End for 
	//We go through the seleciton of Diary records twice-on the first pass we only handled the ones already there.
	//we will now handle the remainder
	USE SET:C118("Instancetocreate")
	CLEAR SET:C117("Instancetocreate")
	//it has not already been used by someone else
	ARRAY LONGINT:C221($_al_ReusedIDS; 0)
	For ($_l_DIaryIndex; 1; Records in selection:C76([DIARY:12]))
		If ([DIARY:12]X_REOCCOURANCE:67="")
			QUERY:C277([X_DIaryDisplay:142]; [X_DIaryDisplay:142]xDiaryInstanceUID:2=$1; *)
			QUERY:C277([X_DIaryDisplay:142];  & ; [X_DIaryDisplay:142]xDiaryCode:4=[DIARY:12]Diary_Code:3)
			If (Records in selection:C76([X_DIaryDisplay:142])=0)  //This is where it should be-there should be no record or we have an error
				If ($_l_CurrentRow<Size of array:C274($_al_RecordIDS))  //There are some records we can re-use against the current ID
					QUERY:C277([X_DIaryDisplay:142]; [X_DIaryDisplay:142]x_DiaryViewRecordID:1=$_al_RecordIDS{$_l_CurrentRow})
					APPEND TO ARRAY:C911($_al_ReusedIDS; $_al_RecordIDS{$_l_CurrentRow})
					$_l_CurrentRow:=$_l_CurrentRow+1
				Else 
					$_bo_Create:=True:C214
					If (Size of array:C274($_al_ReUseIDS)>0)  //These are records used by other instance IDS that are now dead so can be re-used
						For ($_l_ReuseIndex; Size of array:C274($_al_ReUseIDS); 1; -1)
							QUERY:C277([X_DIaryDisplay:142]; [X_DIaryDisplay:142]x_DiaryViewRecordID:1=$_al_ReUseIDS{$_l_ReuseIndex})
							If (Records in selection:C76([X_DIaryDisplay:142])=1)
								//check not loaded by someone else here-
								If ($_al_InstanceIDS{$_l_DIaryIndex}=[X_DIaryDisplay:142]xDiaryInstanceUID:2)  //it has not already been used by someone else
									//Set the UID and save it first
									[X_DIaryDisplay:142]xDiaryInstanceUID:2:=$1
									SAVE RECORD:C53([X_DIaryDisplay:142])
									$_bo_Create:=False:C215
									$_l_ReuseIndex:=0
								End if 
							End if 
						End for 
						
					End if 
					If ($_bo_Create)  //no record to re-use
						CREATE RECORD:C68([X_DIaryDisplay:142])
						[X_DIaryDisplay:142]x_DiaryViewRecordID:1:=AA_GetNextID(->[X_DIaryDisplay:142]x_DiaryViewRecordID:1)
						[X_DIaryDisplay:142]xDiaryInstanceUID:2:=$1
					End if 
				End if 
				[X_DIaryDisplay:142]xDiaryRecordID:3:=[DIARY:12]x_ID:50
				[X_DIaryDisplay:142]xDiaryCode:4:=[DIARY:12]Diary_Code:3
				[X_DIaryDisplay:142]xInstanceTimeFrom:7:=[DIARY:12]Display_Time_From:53
				[X_DIaryDisplay:142]xInstanceTimeTo:8:=[DIARY:12]Display_Time_To:54
				$_l_TimeSpan:=([DIARY:12]Display_Time_To:54*1)-([DIARY:12]Display_Time_From:53*1)
				If ($_l_TimeSpan<30*60)  //if the time is less than 30 mins then set the time slot as 30 mins
					[X_DIaryDisplay:142]xInstanceTimeSlotFrom:9:=[X_DIaryDisplay:142]xInstanceTimeFrom:7
					[X_DIaryDisplay:142]xInstanceTimeSlotTo:10:=Time:C179(Time string:C180(([X_DIaryDisplay:142]xInstanceTimeFrom:7*1)+(30*60)))
				Else 
					[X_DIaryDisplay:142]xInstanceTimeSlotFrom:9:=[X_DIaryDisplay:142]xInstanceTimeFrom:7
					[X_DIaryDisplay:142]xInstanceTimeSlotTo:10:=[X_DIaryDisplay:142]xInstanceTimeTo:8
				End if 
				[X_DIaryDisplay:142]xInstanceDescription:11:=[DIARY:12]Display_Description:55
				SAVE RECORD:C53([X_DIaryDisplay:142])
			Else 
				
			End if 
		Else 
			//Repeating event
		End if 
		NEXT RECORD:C51([DIARY:12])
	End for 
	If (Size of array:C274($_al_ReusedIDS)>0)
		For ($_l_ReuseIndex; 1; Size of array:C274($_al_ReusedIDS))
			$_l_RecordRow:=Find in array:C230($_al_RecordIDS; $_al_ReusedIDS{$_l_ReuseIndex})
			If ($_l_RecordRow>0)
				DELETE FROM ARRAY:C228($_al_RecordIDS; $_l_RecordRow)
			End if 
		End for 
		QUERY WITH ARRAY:C644([X_DIaryDisplay:142]x_DiaryViewRecordID:1; $_al_RecordIDS)
		APPLY TO SELECTION:C70([X_DIaryDisplay:142]; [X_DIaryDisplay:142]xDiaryInstanceUID:2:=-[X_DIaryDisplay:142]xDiaryInstanceUID:2)  //mark them so they can be re-used
	End if 
End if 
ERR_MethodTrackerReturn("SD2_BuildDiaryDisplayRecords"; $_t_oldMethodName)
