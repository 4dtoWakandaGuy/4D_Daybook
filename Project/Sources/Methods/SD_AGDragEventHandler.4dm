//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_AGDragEventHandler
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
	//ARRAY TEXT(WS_at_DiaryVIewTab;0)
	C_BOOLEAN:C305($_bo_ReadOnlyState; SD_bo_AgendaQueryDone; SD_bo_NoAgendaEvent)
	C_DATE:C307($_d_CurrentDateDoFrom; $_d_CurrentDateDoTo; $2; SD_D_CurrentviewDate)
	C_LONGINT:C283($_l_Back; $_l_CurrentDiaryID; $_l_DateSpan; $_l_DiaryID; $_l_TimeSpan; WS_l_SELECTEDDIARYVIEWTAB)
	C_REAL:C285($1; $4)
	C_TEXT:C284($_t_oldMethodName; SD_t_Periodstr; vDateString)
	C_TIME:C306($_ti_CurrentTimeDoFrom; $_ti_CurrentTimeDoTo; $3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_AGDragEventHandler")
$_l_DiaryID:=$1
$_bo_ReadOnlyState:=Read only state:C362([DIARY:12])
$_l_CurrentDiaryID:=[DIARY:12]x_ID:50
CREATE SET:C116([DIARY:12]; "AGTempSet_"+String:C10(Current process:C322))


If ($_l_CurrentDiaryID>0)
	If (SD_RecordModified(->[DIARY:12]))
		SuperDiary_SaveChk
	End if 
End if 

READ WRITE:C146([DIARY:12])
QUERY:C277([DIARY:12]; [DIARY:12]x_ID:50=$_l_DiaryID)
If (Not:C34([DIARY:12]Done:14))
	$_d_CurrentDateDoFrom:=[DIARY:12]Date_Do_From:4
	$_d_CurrentDateDoTo:=[DIARY:12]Date_Do_To:33
	$_ti_CurrentTimeDoFrom:=[DIARY:12]Time_Do_From:6
	$_ti_CurrentTimeDoTo:=[DIARY:12]Time_Do_To:35
	$_l_DateSpan:=$_d_CurrentDateDoTo-$_d_CurrentDateDoFrom
	$_l_TimeSpan:=$_ti_CurrentTimeDoTo-$_ti_CurrentTimeDoFrom
	If (Count parameters:C259>=3)
		Case of 
			: (Count parameters:C259=3)
				[DIARY:12]Date_Do_From:4:=$2
				[DIARY:12]Date_Do_To:33:=$2+$_l_DateSpan
				[DIARY:12]Time_Do_To:35:=$3
				
				[DIARY:12]Time_Do_From:6:=Time:C179(Time string:C180($3-$_l_TimeSpan))
				If ([DIARY:12]Time_Do_To:35>?23:59:59?)
					$_l_Back:=[DIARY:12]Time_Do_To:35-?23:59:59?
					[DIARY:12]Time_Do_To:35:=?23:59:59?
				End if 
				If ([DIARY:12]Time_Do_From:6>[DIARY:12]Time_Do_To:35)  //Dragged before midnight!
					[DIARY:12]Time_Do_From:6:=?00:00:01?
				End if 
			: (Count parameters:C259=4)
				Case of 
					: ($4=7)  //Top changed
						[DIARY:12]Time_Do_From:6:=$3
					: ($4=8)  //Top changed
						[DIARY:12]Time_Do_To:35:=$3
				End case 
				
		End case 
		
		DB_SaveRecord(->[DIARY:12])
		
	End if 
	UNLOAD RECORD:C212([DIARY:12])
	If ($_bo_ReadOnlyState)
		READ ONLY:C145([DIARY:12])
	End if 
	If ($_l_CurrentDiaryID>0)
		QUERY:C277([DIARY:12]; [DIARY:12]x_ID:50=$_l_CurrentDiaryID)
	End if 
	SD_bo_NoAgendaEvent:=False:C215
	SD_bo_AgendaQueryDone:=True:C214
	
	If (False:C215)
		//and reload
		WS_l_SELECTEDDIARYVIEWTAB:=WS_at_DiaryVIewTab
		SD_t_Periodstr:=(MonthName(SD_D_CurrentviewDate))+" "+String:C10(Year of:C25(SD_D_CurrentviewDate))
		vDateString:=String:C10(SD_D_CurrentviewDate; 7)
		SD_DiaryViewCalc
	End if 
	
End if 
ERR_MethodTrackerReturn("SD_AGDragEventHandler"; $_t_oldMethodName)
