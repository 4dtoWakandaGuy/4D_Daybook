//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_ServerSideCreateQuery
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/01/2010 15:37
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN($0)
	//C_UNKNOWN($3)
	//C_UNKNOWN($4)
	ARRAY DATE:C224($_ad_DiaryDatesFrom; 0)
	ARRAY DATE:C224($_ad_DiaryDatesTo; 0)
	ARRAY LONGINT:C221($_al_DiaryIDS; 0)
	ARRAY LONGINT:C221($_al_DiaryPersonIDS; 0)
	ARRAY TEXT:C222($_at_DiaryActions; 0)
	ARRAY TEXT:C222($_at_DiaryCodes; 0)
	ARRAY TEXT:C222($_at_DiaryCodesForPersons; 0)
	ARRAY TEXT:C222($_at_ResultCodes; 0)
	ARRAY TEXT:C222($_at_StatusCodes; 0)
	ARRAY TEXT:C222($_at_UUIDS; 0)
	ARRAY TIME:C1223($_ati_DiaryTimesFrom; 0)
	ARRAY TIME:C1223($_ati_DiaryTimesTo; 0)
	C_BLOB:C604($1)
	C_BOOLEAN:C305(<>SD2_bo_DiaryViewsInited)
	C_DATE:C307($_d_StartDate; $_d_EndDate; $_d_StartDate)
	C_LONGINT:C283($_l_DiaryViewID; $_l_IncludeDocs; $_l_Index; $_l_Offset; $_l_OpenClosed; $_l_PersonCount; $_l_PersonID; $_l_ResultsCount; $_l_StatusCount; $_l_UUIDElement; $_l_ActionsCount)
	C_LONGINT:C283($_l_DiaryViewID; $_l_IncludeDocs; $_l_Index; $_l_Offset; $_l_OpenClosed; $_l_PersonCount; $_l_PersonID; $_l_ResultsCount; $_l_StatusCount; $_l_UUIDElement; SD2_l_DiaryVIewID)
	C_POINTER:C301($3; $4; $2)
	C_TEXT:C284($_t_oldMethodName; $_t_ResultCode; $_t_StatusCode; $0; $_t_ActionCode; $_t_oldMethodName; $_t_ResultCode; $_t_StatusCode)
	C_TIME:C306($_ti_StartTime; $_ti_EndTime; $_ti_StartTime)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_ServerSideCreateQuery")
//The one bit of informations(or rather 2) which will significantly reduce the amount of work needed to be done by the manger process is the start and end date of the query

$_t_ResultCode:=""
$_t_StatusCode:=""
$_l_PersonCount:=0
$_l_Offset:=0
$_d_StartDate:=!00-00-00!
$_d_EndDate:=!00-00-00!
$_ti_StartTime:=?00:00:00?
$_ti_EndTime:=?00:00:00?
$_l_OpenClosed:=0
BLOB TO VARIABLE:C533($1; $_l_PersonCount; $_l_Offset)
For ($_l_Index; 1; $_l_PersonCount)
	If (BLOB size:C605($1)>=$_l_Offset)
		$_l_PersonID:=0
		BLOB TO VARIABLE:C533($1; $_l_PersonID; $_l_Offset)
		If ($_l_PersonID>0)
			APPEND TO ARRAY:C911($_al_DiaryPersonIDS; $_l_PersonID)
		End if 
	End if 
End for 
If (BLOB size:C605($1)>=$_l_Offset)
	BLOB TO VARIABLE:C533($1; $_l_ActionsCount; $_l_Offset)
	For ($_l_Index; 1; $_l_ActionsCount)
		If (BLOB size:C605($1)>=$_l_Offset)
			$_t_ActionCode:=""
			BLOB TO VARIABLE:C533($1; $_t_ActionCode; $_l_Offset)
			If ($_t_ActionCode#"")
				APPEND TO ARRAY:C911($_at_DiaryActions; $_t_ActionCode)
			End if 
		End if 
	End for 
	If (BLOB size:C605($1)>=$_l_Offset)
		BLOB TO VARIABLE:C533($1; $_l_IncludeDocs; $_l_Offset)
		If (BLOB size:C605($1)>=$_l_Offset)
			BLOB TO VARIABLE:C533($1; $_d_StartDate; $_l_Offset)
			If (BLOB size:C605($1)>=$_l_Offset)
				BLOB TO VARIABLE:C533($1; $_d_EndDate; $_l_Offset)
				If (BLOB size:C605($1)>=$_l_Offset)
					BLOB TO VARIABLE:C533($1; $_ti_StartTime; $_l_Offset)
					If (BLOB size:C605($1)>=$_l_Offset)
						BLOB TO VARIABLE:C533($1; $_ti_EndTime; $_l_Offset)
						If (BLOB size:C605($1)>=$_l_Offset)
							BLOB TO VARIABLE:C533($1; $_l_OpenClosed; $_l_Offset)
							If (BLOB size:C605($1)>=$_l_Offset)
								BLOB TO VARIABLE:C533($1; $_l_ResultsCount; $_l_Offset)
								For ($_l_Index; 1; $_l_ResultsCount)
									If (BLOB size:C605($1)>=$_l_Offset)
										$_t_ResultCode:=""
										BLOB TO VARIABLE:C533($1; $_t_ResultCode; $_l_Offset)
										If ($_t_ResultCode#"")
											APPEND TO ARRAY:C911($_at_ResultCodes; $_t_ResultCode)
										End if 
									End if 
								End for 
								If (BLOB size:C605($1)>=$_l_Offset)
									BLOB TO VARIABLE:C533($1; $_l_StatusCount; $_l_Offset)
									For ($_l_Index; 1; $_l_StatusCount)
										If (BLOB size:C605($1)>=$_l_Offset)
											$_t_StatusCode:=""
											BLOB TO VARIABLE:C533($1; $_t_StatusCode; $_l_Offset)
											If ($_t_StatusCode#"")
												APPEND TO ARRAY:C911($_at_StatusCodes; $_t_StatusCode)
											End if 
										End if 
									End for 
								End if 
								
							End if 
						End if 
					End if 
					
				End if 
			End if 
		End if 
	End if 
End if 
If (Count parameters:C259>=3)
	$3->:=$_d_StartDate
End if 
If (Count parameters:C259>=4)
	$4->:=$_d_EndDate
End if 

QUERY WITH ARRAY:C644([DIARY_ITEMOWNERS:106]PERSONNEL_ID:2; $_al_DiaryPersonIDS)
SELECTION TO ARRAY:C260([DIARY_ITEMOWNERS:106]DIARY_CODE:1; $_at_DiaryCodesForPersons)
QUERY WITH ARRAY:C644([DIARY:12]Diary_Code:3; $_at_DiaryCodesForPersons)

If (Size of array:C274($_at_DiaryActions)>0)
	QUERY SELECTION WITH ARRAY:C1050([DIARY:12]Action_Code:9; $_at_DiaryActions)
End if 
If (Size of array:C274($_at_StatusCodes)>0)
	QUERY SELECTION WITH ARRAY:C1050([DIARY:12]Status:30; $_at_StatusCodes)
End if 
If (Size of array:C274($_at_ResultCodes)>0)
	QUERY SELECTION WITH ARRAY:C1050([DIARY:12]Result_Code:11; $_at_ResultCodes)
End if 
If ($_l_OpenClosed=2)  //only show open
	QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Done:14=False:C215)
End if 
CREATE SET:C116([DIARY:12]; "RecordsForPerson")
QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Display_Date_From:51=$_d_StartDate; *)
QUERY SELECTION:C341([DIARY:12];  & ; [DIARY:12]Display_Time_From:53>=$_ti_StartTime)
CREATE SET:C116([DIARY:12]; "StartDay")
If ($_d_EndDate>$_d_StartDate)
	USE SET:C118("RecordsForPerson")
	If ($_ti_EndTime>$_ti_StartTime)
		QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Display_Date_From:51<$_d_EndDate)
		CREATE SET:C116([DIARY:12]; "BetweenDays")
		USE SET:C118("RecordsForPerson")
		QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Display_Date_From:51=$_d_EndDate; *)
		QUERY SELECTION:C341([DIARY:12];  & ; [DIARY:12]Display_Time_From:53<=$_ti_EndTime)
		CREATE SET:C116([DIARY:12]; "EndDay")
		UNION:C120("EndDay"; "BetweenDays"; "BetweenDays")
	Else 
		QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Display_Date_From:51<=$_d_EndDate)
		CREATE SET:C116([DIARY:12]; "BetweenDays")
	End if 
	UNION:C120("BetweenDays"; "StartDay"; "StartDay")
	
Else 
	If ($_ti_EndTime>$_ti_StartTime)
		USE SET:C118("StartDay")
		QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Display_Time_From:53<=$_ti_EndTime)
		CREATE SET:C116([DIARY:12]; "StartDay")
	End if 
End if 
INTERSECTION:C121("RecordsForPerson"; "StartDay"; "DateTimeMatch")
USE SET:C118("DateTimeMatch")

//Here we will add a section to add in any re-occuring items
//Also the above really is only set up for the schedule
SD2_l_DiaryVIewID:=0
$_l_DiaryViewID:=AA_GetNextID(->SD2_l_DiaryVIewID)
While (Semaphore:C143("UpdatingSDdiary"))  //Another process could update records in this table
	DelayTicks(2)
End while 
SELECTION TO ARRAY:C260([DIARY:12]Diary_Code:3; $_at_DiaryCodes; [DIARY:12]Display_Date_From:51; $_ad_DiaryDatesFrom; [DIARY:12]Display_Time_From:53; $_ati_DiaryTimesFrom; [DIARY:12]Display_Date_To:52; $_ad_DiaryDatesTo; [DIARY:12]Display_Time_To:54; $_ati_DiaryTimesTo; [DIARY:12]x_ID:50; $_al_DiaryIDS)
READ WRITE:C146([SF_DiaryView:184])
If (Not:C34(<>SD2_bo_DiaryViewsInited))  //this is run on server/single User_Start first call to diary
	ALL RECORDS:C47([SF_DiaryView:184])
	APPLY TO SELECTION:C70([SF_DiaryView:184]; [SF_DiaryView:184]DiaryView_ContextUUID:2:="")
	<>SD2_bo_DiaryViewsInited:=True:C214
End if 
QUERY:C277([SF_DiaryView:184]; [SF_DiaryView:184]DiaryView_ContextUUID:2="")
SELECTION TO ARRAY:C260([SF_DiaryView:184]DiaryView_UUID:1; $_at_UUIDS)
$_l_UUIDElement:=0

//We dont delete records in this table we just release them by setting the contect UUID to 0
For ($_l_Index; 1; Size of array:C274($_at_UUIDS))
	If ($_l_UUIDElement<Size of array:C274($_at_UUIDS))
		$_l_UUIDElement:=$_l_UUIDElement+1
		QUERY:C277([SF_DiaryView:184]; [SF_DiaryView:184]DiaryView_UUID:1=$_at_UUIDS{$_l_UUIDElement})
		[SF_DiaryView:184]DiaryView_DiaryID:3:=$_at_DiaryCodes{$_l_Index}
		[SF_DiaryView:184]DiaryView_ContextUUID:2:=String:C10($_l_DiaryViewID)
		[SF_DiaryView:184]Diary_DisplayTimeStart:6:=$_ati_DiaryTimesFrom{$_l_Index}
		[SF_DiaryView:184]Diary_DisplayDateStart:4:=$_ad_DiaryDatesFrom{$_l_Index}
		[SF_DiaryView:184]Diary_DisplayTimeEnd:7:=$_ati_DiaryTimesTo{$_l_Index}
		[SF_DiaryView:184]Diary_DIsplayDateEnd:5:=$_ad_DiaryDatesTo{$_l_Index}
		DB_SaveRecord(->[SF_DiaryView:184])
		
	Else 
		//have to create a new record
		CREATE RECORD:C68([SF_DiaryView:184])
		[SF_DiaryView:184]DiaryView_UUID:1:=String:C10(AA_GetNextID(->[SF_DiaryView:184]DiaryView_UUID:1))
		[SF_DiaryView:184]DiaryView_DiaryID:3:=$_at_DiaryCodes{$_l_Index}
		[SF_DiaryView:184]DiaryView_ContextUUID:2:=String:C10($_l_DiaryViewID)
		[SF_DiaryView:184]Diary_DisplayTimeStart:6:=$_ati_DiaryTimesFrom{$_l_Index}
		[SF_DiaryView:184]Diary_DisplayDateStart:4:=$_ad_DiaryDatesFrom{$_l_Index}
		[SF_DiaryView:184]Diary_DisplayTimeEnd:7:=$_ati_DiaryTimesTo{$_l_Index}
		[SF_DiaryView:184]Diary_DIsplayDateEnd:5:=$_ad_DiaryDatesTo{$_l_Index}
		DB_SaveRecord(->[SF_DiaryView:184])
		
	End if 
	
	
End for 
$0:=String:C10($_l_DiaryViewID)
//Note that these are 'minimal' records so they only have to be updated
UNLOAD RECORD:C212([SF_DiaryView:184])
CLEAR SEMAPHORE:C144("UpdatingSDdiary")
ERR_MethodTrackerReturn("SD2_ServerSideCreateQuery"; $_t_oldMethodName)
