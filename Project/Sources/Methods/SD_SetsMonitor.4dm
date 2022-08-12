//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_SetsMonitor
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/04/2010 13:29
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(FieldPtr)
	//ARRAY BOOLEAN(<>SD_abo_setInitialized;0)
	//ARRAY BOOLEAN(<>SD_abo_SetInvalid;0)
	//ARRAY DATE(<>SD_ad_LastRequest;0)
	//ARRAY DATE(SD_ad_LastRequest;0)
	//ARRAY DATE(SD_ad_SetDateFrom;0)
	//ARRAY DATE(SD_ad_SetDateTo;0)
	//ARRAY LONGINT(<>SD_al_aDiaryQueue;0)
	//ARRAY LONGINT(<>SD_al_DiarySets;0;0)
	//ARRAY LONGINT(<>SD_al_LastRequestTime;0)
	//ARRAY LONGINT(<>SD_al_SearchrelatedTables;0)
	//ARRAY LONGINT(<>SD_al_SetIDs;0)
	ARRAY LONGINT:C221($_al_aDiaryQueues; 0)
	ARRAY LONGINT:C221($_al_Age; 0)
	ARRAY LONGINT:C221($_al_DiaryIDs; 0)
	ARRAY LONGINT:C221($_al_DiaryOwnerClasses; 0)
	ARRAY LONGINT:C221($_al_DiaryOwnerIDs; 0)
	ARRAY LONGINT:C221($_al_RecordIdents; 0)
	ARRAY LONGINT:C221($_al_TempArray; 0)
	//ARRAY LONGINT(SD_al_IncludeDocs;0)
	//ARRAY LONGINT(SD_al_LastRequestTime;0)
	//ARRAY LONGINT(SD_al_OtherSearchFields;0;0)
	//ARRAY LONGINT(SD_al_PersonOptions;0)
	//ARRAY LONGINT(SD_al_SearchrelatedTables;0;0)
	//ARRAY LONGINT(SD_al_SetDoneStamp;0)
	//ARRAY LONGINT(SD_al_SetIDs;0)
	//ARRAY LONGINT(SD_al_SetPersonIDs;0;0)
	//ARRAY LONGINT(SD_al_SetPriorityValue;0)
	//ARRAY LONGINT(SD_al_TimeFrom;0)
	//ARRAY LONGINT(SD_al_TimeTo;0)
	//ARRAY OBJECT(SD_aObj_SearchPlan;0;0)
	//ARRAY TEXT(<>SD_At_DiaryModFields;0)
	//ARRAY TEXT(<>SD_at_otherSearchValues;0)
	ARRAY TEXT:C222($_at_DiaryCodes; 0)
	ARRAY TEXT:C222($_at_ModifiedFields; 0)
	//ARRAY TEXT(SD_at_othersearchConj;0;0)
	//ARRAY TEXT(SD_at_otherSearchValues;0;0)
	//ARRAY TEXT(SD_at_PreferenceactionCodes;0;0)
	//ARRAY TEXT(SD_at_PreferenceResultCodes;0;0)
	//ARRAY TEXT(SD_at_PreferenceStatusCodes;0;0)
	C_BOOLEAN:C305(<>SYS_bo_QuitCalled; $_bo_FirstRun; $_bo_IncludeResult; $_bo_IsInSet; $_bo_isMod; $_bo_Match; $_bo_Match1; $_bo_Match2; <>SD_bo_ServerSettingsInitialized; <>SYS_bo_QuitCalled; $_bo_FirstRun)
	C_BOOLEAN:C305($_bo_IncludeResult; $_bo_IsInSet; $_bo_isMod; $_bo_Match; $_bo_Match1; $_bo_Match2)
	C_DATE:C307($SD_d_CurrentDate)
	C_LONGINT:C283(<>SD_l_NextSetID; $_l_BlobPosition; $_l_BlobSize; $_l_characterPosition; $_l_CurrentSize; $_l_DataType; $_l_DeleteSize; $_l_Difference; $_l_FieldNumber; $_l_Index; $_l_indexDates)
	C_LONGINT:C283($_l_IndexDiaryOwners; $_l_IndexDiaryQueue; $_l_IndexSets; $_l_ItemID; $_l_MaxSize; $_l_NumberofDays; $_l_PostionChar; $_l_RecordPosition; $_l_TickCount; $_l_TickMax; $_l_TimeAmount)
	C_LONGINT:C283(<>SD_l_MonitorProcess; <>SD_l_NextSetID; $_l_BlobPosition; $_l_BlobSize; $_l_characterPosition; $_l_CurrentSize; $_l_DataType; $_l_DeleteSize; $_l_Difference; $_l_FieldNumber; $_l_Index)
	C_LONGINT:C283($_l_Index2; $_l_indexDates; $_l_IndexDiaryOwners; $_l_IndexDiaryQueue; $_l_IndexSets; $_l_ItemID; $_l_MaxSize; $_l_NumberofDays; $_l_PostionChar; $_l_RecordPosition; $_l_TickCount)
	C_LONGINT:C283($_l_TickCountNow; $_l_TickMax; $_l_TimeAmount)
	C_POINTER:C301($_ptr_Table; FieldPtr; $_ptr_Field; $_ptr_Table)
	C_TEXT:C284($_t_FieldReference; $_t_FieldValue; $_t_oldMethodName; $_t_FieldName; $_t_FieldReference; $_t_FieldValue; $_t_oldMethodName)
	C_TIME:C306($_ti_Time2; $_ti_Time; $_ti_Time2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_SetsMonitor")

//This method will run on the server.
//This will add and subtract diary records from the sets
//First we must initialize the query
//This method will run on the server
//Diary filter-this is the parameters that a given diary can use to find records
// so that this can work with any fields of the diary the arrays work like this
//◊SD_al_ArrayFieldNos'- a two dimensional array for each set of the field numbers to search
//◊SD_al_arrayFeildOpt-a two dimensional array for each set of the search option for the field
//0=Equal to
//1=not equal to
//-2=Greater than
//3=Greater than or equal to
//4 =Less than
//5=less than or equal to
//6=contains
//7=does not contain
//◊SD_aS255_ArrayStringValues-a two dimensional array for each set of the string value-if the field is string
//◊SD_at_ArrayTextValues-a two dimensional array for each set of the text value-if the field is Text
//◊SD_al_ArrayLongValues-a two dimensional array for each set of the longint value-if the field is Longint or integer or Time or boolean
//◊SD_ar_ArrayRealValues-a two dimensional array for each set of the Real value-if the field is Real
//◊SD_ad_ArrayDateValues-a two dimensional array for each set of the Date value-if the field is Date
//The length of time to 'kill a set after the last search
$_l_TickMax:=60*60
<>SD_l_MonitorProcess:=Current process:C322
<>SD_l_NextSetID:=1
READ ONLY:C145([DIARY:12])
$SD_d_CurrentDate:=Current date:C33(*)
ARRAY LONGINT:C221(<>SD_al_aDiaryQueue; 0)
ARRAY TEXT:C222(<>SD_At_DiaryModFields; 0)

While (Semaphore:C143("SD_CheckSets"))
	DelayTicks(2)
End while 
ARRAY BOOLEAN:C223(<>SD_abo_setInitialized; 0)
ARRAY BOOLEAN:C223(<>SD_abo_SetInvalid; 0)
ARRAY DATE:C224(SD_ad_LastRequest; 0)
ARRAY LONGINT:C221(SD_al_LastRequestTime; 0)


ARRAY LONGINT:C221(<>SD_al_DiarySets; 0; 0)
$_l_ItemID:=PREF_GetPreferenceID("Diary Search Characteristics")

ARRAY LONGINT:C221(<>SD_al_SetIDs; 0)
ARRAY LONGINT:C221(SD_al_IncludeDocs; 0)
ARRAY LONGINT:C221(SD_al_SetPersonIDs; 0; 0)
ARRAY LONGINT:C221(SD_al_PersonOptions; 0)
ARRAY DATE:C224(SD_ad_SetDateFrom; 0)
ARRAY DATE:C224(SD_ad_SetDateTo; 0)
ARRAY LONGINT:C221(SD_al_SetDoneStamp; 0)
ARRAY LONGINT:C221(SD_al_SetPriorityValue; 0)
ARRAY LONGINT:C221(SD_al_TimeFrom; 0)
ARRAY LONGINT:C221(SD_al_TimeTo; 0)
ARRAY TEXT:C222(SD_at_PreferenceactionCodes; 0; 0)
ARRAY TEXT:C222(SD_at_PreferenceResultCodes; 0; 0)  //Note searching by result is pointless unless we are including done items!
ARRAY TEXT:C222(SD_at_PreferenceStatusCodes; 0; 0)
ARRAY LONGINT:C221(SD_al_SearchrelatedTables; 0; 0)  //Search xdiary relations or actions
ARRAY LONGINT:C221(SD_al_OtherSearchFields; 0; 0)  // field number to search-Note with actions this can be used to find actions with a property
ARRAY TEXT:C222(SD_at_otherSearchValues; 0; 0)
ARRAY OBJECT:C1221(SD_aObj_SearchPlan; 0; 0)
//NG November 2019 this needs to be modified to puch using a worker the updated data.

ARRAY TEXT:C222(SD_at_othersearchConj; 0; 0)

//Things to note with the above...the same field may appear twice
//so we could search for diary records for multiple companies or multiple jobs or multiple owners etc

<>SD_bo_ServerSettingsInitialized:=True:C214  //set so in single user client side does not reset them
READ WRITE:C146([PREFERENCES:116])
QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
If (Records in selection:C76([PREFERENCES:116])=0)
	CREATE RECORD:C68([PREFERENCES:116])
	[PREFERENCES:116]IDNumber:1:=$_l_ItemID
	SAVE RECORD:C53([PREFERENCES:116])
	UNLOAD RECORD:C212([PREFERENCES:116])
	QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
End if 
SAVE RECORD:C53([PREFERENCES:116])
UNLOAD RECORD:C212([PREFERENCES:116])
READ ONLY:C145([PREFERENCES:116])
//CLEAR SEMAPHORE("SD_CheckSets")
QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
$_bo_FirstRun:=True:C214
$_l_TickCount:=Tickcount:C458
$_l_MaxSize:=99999999
Repeat 
	//Ok because we are only reading here never writing to the record we don't need to have the semaphore set
	If (Not:C34($_bo_FirstRun))
		While (Semaphore:C143("SD_CheckSets"))
			DelayTicks(2)
		End while 
		
	End if 
	$_bo_FirstRun:=False:C215
	READ ONLY:C145([PREFERENCES:116])
	QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
	$_l_BlobSize:=BLOB size:C605([PREFERENCES:116]DataBlob:2)
	If ($_l_BlobSize>0)
		
		
		$_l_BlobPosition:=0
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; <>SD_al_SetIDs; $_l_BlobPosition)
		If (Size of array:C274(<>SD_al_SetIDs)>0)  //
			ARRAY LONGINT:C221(SD_al_SetPersonIDs; Size of array:C274(<>SD_al_SetIDs); 0)
			For ($_l_Index; 1; Size of array:C274(<>SD_al_SetIDs))
				If ($_l_BlobSize>$_l_BlobPosition)
					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD_al_SetPersonIDs{$_l_Index}; $_l_BlobPosition)
				End if 
			End for 
			If ($_l_BlobSize>$_l_BlobPosition)
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD_al_PersonOptions; $_l_BlobPosition)
				
				If ($_l_BlobSize>$_l_BlobPosition)
					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD_al_IncludeDocs; $_l_BlobPosition)
					
					If ($_l_BlobSize>$_l_BlobPosition)
						BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD_ad_SetDateFrom; $_l_BlobPosition)
						
						If ($_l_BlobSize>$_l_BlobPosition)
							BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD_ad_SetDateTo; $_l_BlobPosition)
							If ($_l_BlobSize>$_l_BlobPosition)
								BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD_al_SetDoneStamp; $_l_BlobPosition)
								If ($_l_BlobSize>$_l_BlobPosition)
									
									BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD_al_SetPriorityValue; $_l_BlobPosition)
									If ($_l_BlobSize>$_l_BlobPosition)
										BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD_al_TimeFrom; $_l_BlobPosition)
										If ($_l_BlobSize>$_l_BlobPosition)
											BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD_al_TimeTo; $_l_BlobPosition)
											If ($_l_BlobSize>$_l_BlobPosition)
												
												
												If ($_l_BlobSize>$_l_BlobPosition)
													ARRAY TEXT:C222(SD_at_PreferenceactionCodes; Size of array:C274(<>SD_al_SetIDs); 0)
													For ($_l_Index; 1; Size of array:C274(<>SD_al_SetIDs))
														If ($_l_BlobSize>$_l_BlobPosition)
															BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD_at_PreferenceactionCodes{$_l_Index}; $_l_BlobPosition)
														End if 
													End for 
													
													If ($_l_BlobSize>$_l_BlobPosition)
														ARRAY TEXT:C222(SD_at_PreferenceResultCodes; Size of array:C274(<>SD_al_SetIDs); 0)
														For ($_l_Index; 1; Size of array:C274(<>SD_al_SetIDs))
															If ($_l_BlobSize>$_l_BlobPosition)
																BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD_at_PreferenceResultCodes{$_l_Index}; $_l_BlobPosition)
															End if 
														End for 
														If ($_l_BlobSize>$_l_BlobPosition)
															ARRAY TEXT:C222(SD_at_PreferenceStatusCodes; Size of array:C274(<>SD_al_SetIDs); 0)
															For ($_l_Index; 1; Size of array:C274(<>SD_al_SetIDs))
																If ($_l_BlobSize>$_l_BlobPosition)
																	BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD_at_PreferenceStatusCodes{$_l_Index}; $_l_BlobPosition)
																End if 
															End for 
															If ($_l_BlobSize>$_l_BlobPosition)
																ARRAY LONGINT:C221(SD_al_SearchrelatedTables; Size of array:C274(<>SD_al_SetIDs); 0)
																For ($_l_Index; 1; Size of array:C274(<>SD_al_SetIDs))
																	If ($_l_BlobSize>$_l_BlobPosition)
																		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD_al_SearchrelatedTables{$_l_Index}; $_l_BlobPosition)
																	End if 
																End for 
																
																If ($_l_BlobSize>$_l_BlobPosition)
																	ARRAY LONGINT:C221(SD_al_OtherSearchFields; Size of array:C274(<>SD_al_SetIDs); 0)
																	For ($_l_Index; 1; Size of array:C274(<>SD_al_SetIDs))
																		If ($_l_BlobSize>$_l_BlobPosition)
																			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD_al_OtherSearchFields{$_l_Index}; $_l_BlobPosition)
																		End if 
																	End for 
																	If ($_l_BlobSize>$_l_BlobPosition)
																		ARRAY TEXT:C222(SD_at_otherSearchValues; Size of array:C274(<>SD_al_SetIDs); 0)
																		For ($_l_Index; 1; Size of array:C274(<>SD_al_SetIDs))
																			If ($_l_BlobSize>$_l_BlobPosition)
																				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD_at_otherSearchValues{$_l_Index}; $_l_BlobPosition)
																			End if 
																		End for 
																		If ($_l_BlobSize>$_l_BlobPosition)
																			ARRAY TEXT:C222(SD_at_othersearchConj; Size of array:C274(<>SD_al_SetIDs); 0)
																			For ($_l_Index; 1; Size of array:C274(<>SD_al_SetIDs))
																				If ($_l_BlobSize>$_l_BlobPosition)
																					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD_at_othersearchConj{$_l_Index}; $_l_BlobPosition)
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
									End if 
								End if 
								
							End if 
							
						End if 
					End if 
				End if 
			End if 
		End if 
		//The characteristics of each set curenltly managed  are now retreived
	End if 
	CLEAR SEMAPHORE:C144("SD_CheckSets")
	
	//The characteristics of each set are now retreived
	ARRAY BOOLEAN:C223(<>SD_abo_setInitialized; Size of array:C274(<>SD_al_SetIDs))
	
	ARRAY DATE:C224(<>SD_ad_LastRequest; Size of array:C274(<>SD_al_SetIDs))
	ARRAY LONGINT:C221(<>SD_al_LastRequestTime; Size of array:C274(<>SD_al_SetIDs))
	For ($_l_IndexSets; 1; Size of array:C274(<>SD_al_SetIDs))
		While (Semaphore:C143("UpdateSet_"+String:C10(<>SD_al_SetIDs{$_l_IndexSets})))
			DelayTicks
		End while 
		
		If (<>SD_abo_setInitialized{$_l_IndexSets}=False:C215)
			If (Size of array:C274(SD_al_SetPersonIDs{$_l_IndexSets})>0)
				CREATE EMPTY SET:C140([DIARY_ITEMOWNERS:106]; "$temp")
				For ($_l_Index2; 1; Size of array:C274(SD_al_SetPersonIDs{$_l_IndexSets}))
					QUERY:C277([DIARY_ITEMOWNERS:106]; [DIARY_ITEMOWNERS:106]PERSONNEL_ID:2=SD_al_SetPersonIDs{$_l_IndexSets}{$_l_Index2})
					If (SD_al_PersonOptions{$_l_IndexSets}>0)
						//This filters to a single relationship type
						QUERY SELECTION:C341([DIARY_ITEMOWNERS:106]; [DIARY_ITEMOWNERS:106]RELATIONSHIP_CLASSID:3=SD_al_PersonOptions{$_l_IndexSets})
					End if 
					CREATE SET:C116([DIARY_ITEMOWNERS:106]; "$ThisPerson")
					UNION:C120("$ThisPerson"; "$temp"; "$temp")
					CLEAR SET:C117("$ThisPerson")
				End for 
				USE SET:C118("$temp")
				CLEAR SET:C117("$temp")
				SELECTION TO ARRAY:C260([DIARY_ITEMOWNERS:106]DIARY_CODE:1; $_at_DiaryCodes)
				QUERY WITH ARRAY:C644([DIARY:12]Diary_Code:3; $_at_DiaryCodes)
				CREATE SET:C116([DIARY:12]; "MatchPerson")
			Else 
				ALL RECORDS:C47([DIARY:12])
				CREATE SET:C116([DIARY:12]; "MatchPerson")
			End if 
			If (Size of array:C274(SD_at_PreferenceactionCodes{$_l_IndexSets})>0)
				CREATE EMPTY SET:C140([DIARY:12]; "$Temp")
				For ($_l_Index2; 1; Size of array:C274(SD_at_PreferenceactionCodes{$_l_IndexSets}))
					QUERY:C277([DIARY:12]; [DIARY:12]Action_Code:9=SD_at_PreferenceactionCodes{$_l_IndexSets}{$_l_Index2})
					If (SD_al_IncludeDocs{$_l_IndexSets}=0)  //filter out diary items with a document attached
						QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Document_Code:15="")
					End if 
					CREATE SET:C116([DIARY:12]; "$ThisAction")
					UNION:C120("$ThisAction"; "$Temp"; "$Temp")
					CLEAR SET:C117("$ThisAction")
					
				End for 
				USE SET:C118("$Temp")
				CLEAR SET:C117("$Temp")
				CREATE SET:C116([DIARY:12]; "MatchAction")
			Else 
				ALL RECORDS:C47([DIARY:12])
				CREATE SET:C116([DIARY:12]; "MatchAction")
			End if 
			If (SD_ad_SetDateFrom{$_l_IndexSets}>!00-00-00!)  //In a workflow call this is not set
				If ((SD_al_SetDoneStamp{$_l_IndexSets}=1) | (SD_al_SetDoneStamp{$_l_IndexSets}=2) | (SD_al_SetDoneStamp{$_l_IndexSets}=0))  //include open
					If (SD_ad_SetDateto{$_l_IndexSets}=SD_ad_SetDateFrom{$_l_IndexSets})  // single date
						QUERY:C277([DIARY:12]; [DIARY:12]Date_Do_From:4=SD_ad_SetDateFrom{$_l_IndexSets}; *)
						QUERY:C277([DIARY:12];  & ; [DIARY:12]X_REOCCOURANCE:67="")
						CREATE SET:C116([DIARY:12]; "$DateMatch1")
						QUERY:C277([DIARY:12]; [DIARY:12]Date_Do_From:4<SD_ad_SetDateFrom{$_l_IndexSets}; *)
						QUERY:C277([DIARY:12];  & ; [DIARY:12]Date_Do_To:33>=SD_ad_SetDateFrom{$_l_IndexSets}; *)
						QUERY:C277([DIARY:12];  & ; [DIARY:12]X_REOCCOURANCE:67="")  //ONLY FIND NON RE-OCCOURING
						CREATE SET:C116([DIARY:12]; "$DateMatch2")
						UNION:C120("$DateMatch1"; "$DateMatch2"; "$DateMatch1")
						USE SET:C118("$DateMatch1")
						CLEAR SET:C117("$DateMatch1")
						CLEAR SET:C117("$DateMatch2")
						CREATE SET:C116([DIARY:12]; "DateMatch")
					Else 
						//if the date to is set this is the RANGE we are searching(not the to do date of the diary records to look for
						QUERY:C277([DIARY:12]; [DIARY:12]Date_Do_From:4>=SD_ad_SetDateFrom{$_l_IndexSets}; *)
						QUERY:C277([DIARY:12];  & ; [DIARY:12]Date_Do_From:4<=SD_ad_SetDateto{$_l_IndexSets}; *)
						QUERY:C277([DIARY:12];  & ; [DIARY:12]X_REOCCOURANCE:67="")
						CREATE SET:C116([DIARY:12]; "$DateMatch1")
						QUERY:C277([DIARY:12]; [DIARY:12]Date_Do_From:4<SD_ad_SetDateFrom{$_l_IndexSets}; *)
						QUERY:C277([DIARY:12];  & ; [DIARY:12]Date_Do_To:33>=SD_ad_SetDateFrom{$_l_IndexSets}; *)
						QUERY:C277([DIARY:12];  & ; [DIARY:12]X_REOCCOURANCE:67="")  //ONLY FIND NON RE-OCCOURING
						CREATE SET:C116([DIARY:12]; "$DateMatch2")
						UNION:C120("$DateMatch1"; "$DateMatch2"; "$DateMatch1")
						USE SET:C118("$DateMatch1")
						CLEAR SET:C117("$DateMatch1")
						CLEAR SET:C117("$DateMatch2")
						CREATE SET:C116([DIARY:12]; "DateMatch")
						
						
					End if 
				Else 
					CREATE EMPTY SET:C140([DIARY:12]; "DateMatch")
				End if 
				If ((SD_al_SetDoneStamp{$_l_IndexSets}=2) | (SD_al_SetDoneStamp{$_l_IndexSets}=3))  //include closed
					USE SET:C118("DateMatch")
					CREATE SET:C116([DIARY:12]; "$DateMatch3")
					If (SD_ad_SetDateto{$_l_IndexSets}=SD_ad_SetDateFrom{$_l_IndexSets})  // single date
						QUERY:C277([DIARY:12]; [DIARY:12]Date_Done_From:5=SD_ad_SetDateFrom{$_l_IndexSets}; *)
						QUERY:C277([DIARY:12];  & ; [DIARY:12]X_REOCCOURANCE:67="")
						CREATE SET:C116([DIARY:12]; "$DateMatch1")
						QUERY:C277([DIARY:12]; [DIARY:12]Date_Done_From:5<SD_ad_SetDateFrom{$_l_IndexSets}; *)
						QUERY:C277([DIARY:12];  & ; [DIARY:12]Date_Done_To:34>=SD_ad_SetDateFrom{$_l_IndexSets}; *)
						QUERY:C277([DIARY:12];  & ; [DIARY:12]X_REOCCOURANCE:67="")  //ONLY FIND NON RE-OCCOURING
						CREATE SET:C116([DIARY:12]; "$DateMatch2")
						UNION:C120("$DateMatch1"; "$DateMatch2"; "$DateMatch1")
						UNION:C120("$DateMatch1"; "$DateMatch3"; "$DateMatch1")
						CLEAR SET:C117("$DateMatch3")
						USE SET:C118("$DateMatch1")
						CLEAR SET:C117("$DateMatch1")
						CLEAR SET:C117("$DateMatch2")
						CREATE SET:C116([DIARY:12]; "DateMatch")
					Else 
						//if the date to is set this is the RANGE we are searching(not the to do date of the diary records to look for
						QUERY:C277([DIARY:12]; [DIARY:12]Date_Done_From:5>=SD_ad_SetDateFrom{$_l_IndexSets}; *)
						QUERY:C277([DIARY:12];  & ; [DIARY:12]Date_Done_From:5<=SD_ad_SetDateto{$_l_IndexSets}; *)
						QUERY:C277([DIARY:12];  & ; [DIARY:12]X_REOCCOURANCE:67="")
						CREATE SET:C116([DIARY:12]; "$DateMatch1")
						QUERY:C277([DIARY:12]; [DIARY:12]Date_Done_From:5<SD_ad_SetDateFrom{$_l_IndexSets}; *)
						QUERY:C277([DIARY:12];  & ; [DIARY:12]Date_Done_To:34>=SD_ad_SetDateFrom{$_l_IndexSets}; *)
						QUERY:C277([DIARY:12];  & ; [DIARY:12]X_REOCCOURANCE:67="")  //ONLY FIND NON RE-OCCOURING
						CREATE SET:C116([DIARY:12]; "$DateMatch2")
						UNION:C120("$DateMatch1"; "$DateMatch2"; "$DateMatch1")
						UNION:C120("$DateMatch1"; "$DateMatch3"; "$DateMatch1")
						CLEAR SET:C117("$DateMatch3")
						USE SET:C118("$DateMatch1")
						CLEAR SET:C117("$DateMatch1")
						CLEAR SET:C117("$DateMatch2")
						CREATE SET:C116([DIARY:12]; "DateMatch")
						
						
					End if 
					
				End if 
				
				//I just worked out how to do re-occouring items. The date do from and date to hold the span of the item-so it will easily be found be this search
				//a seperate field needs to be added for the re-occourance frequency and frequency type. this can be a string field
				//a function here now sees if it re-occoures on ◊SD_ad_SetDateFrom{$_l_IndexSets} and set
				//SD2_GetReoccouring activate this when re-occouring is set up
			Else 
				ALL RECORDS:C47([DIARY:12])
				CREATE SET:C116([DIARY:12]; "DateMatch")
				
			End if 
			If (SD_ad_SetDateto{$_l_IndexSets}>!00-00-00!)
				If ((SD_al_SetDoneStamp{$_l_IndexSets}=1) | (SD_al_SetDoneStamp{$_l_IndexSets}=2) | (SD_al_SetDoneStamp{$_l_IndexSets}=0))
					If (SD_ad_SetDateto{$_l_IndexSets}=SD_ad_SetDateFrom{$_l_IndexSets})
						QUERY:C277([DIARY:12]; [DIARY:12]Date_Do_To:33=SD_ad_SetDateto{$_l_IndexSets}; *)
						QUERY:C277([DIARY:12];  & ; [DIARY:12]X_REOCCOURANCE:67="")
						CREATE SET:C116([DIARY:12]; "$DateMatch1")
						QUERY:C277([DIARY:12]; [DIARY:12]Date_Do_To:33>SD_ad_SetDateto{$_l_IndexSets}; *)
						QUERY:C277([DIARY:12];  & ; [DIARY:12]Date_Do_From:4<=SD_ad_SetDateto{$_l_IndexSets}; *)
						QUERY:C277([DIARY:12];  & ; [DIARY:12]X_REOCCOURANCE:67="")  //ONLY FIND NON RE-OCCOURING
						CREATE SET:C116([DIARY:12]; "$DateMatch2")
						UNION:C120("$DateMatch1"; "$DateMatch2"; "$DateMatch1")
						USE SET:C118("$DateMatch1")
						CLEAR SET:C117("$DateMatch1")
						CLEAR SET:C117("$DateMatch2")
						CREATE SET:C116([DIARY:12]; "DateMatch2")
					Else 
						// range of dates being displayed
						QUERY:C277([DIARY:12]; [DIARY:12]Date_Do_To:33>=SD_ad_SetDateFrom{$_l_IndexSets}; *)
						QUERY:C277([DIARY:12];  & ; [DIARY:12]Date_Do_To:33<=SD_ad_SetDateto{$_l_IndexSets}; *)
						QUERY:C277([DIARY:12];  & ; [DIARY:12]X_REOCCOURANCE:67="")
						CREATE SET:C116([DIARY:12]; "$DateMatch1")
						QUERY:C277([DIARY:12]; [DIARY:12]Date_Do_To:33>SD_ad_SetDateto{$_l_IndexSets}; *)
						QUERY:C277([DIARY:12];  & ; [DIARY:12]Date_Do_From:4<=SD_ad_SetDateto{$_l_IndexSets}; *)
						QUERY:C277([DIARY:12];  & ; [DIARY:12]X_REOCCOURANCE:67="")  //ONLY FIND NON RE-OCCOURING
						CREATE SET:C116([DIARY:12]; "$DateMatch2")
						UNION:C120("$DateMatch1"; "$DateMatch2"; "$DateMatch1")
						USE SET:C118("$DateMatch1")
						CLEAR SET:C117("$DateMatch1")
						CLEAR SET:C117("$DateMatch2")
						CREATE SET:C116([DIARY:12]; "DateMatch2")
						
						
					End if 
				Else 
					CREATE EMPTY SET:C140([DIARY:12]; "DateMatch2")
				End if 
				If ((SD_al_SetDoneStamp{$_l_IndexSets}=2) | (SD_al_SetDoneStamp{$_l_IndexSets}=3))  //include closed
					USE SET:C118("DateMatch")
					CREATE SET:C116([DIARY:12]; "$DateMatch3")
					If (SD_ad_SetDateto{$_l_IndexSets}=SD_ad_SetDateFrom{$_l_IndexSets})
						QUERY:C277([DIARY:12]; [DIARY:12]Date_Done_To:34=SD_ad_SetDateto{$_l_IndexSets}; *)
						QUERY:C277([DIARY:12];  & ; [DIARY:12]X_REOCCOURANCE:67="")
						CREATE SET:C116([DIARY:12]; "$DateMatch1")
						QUERY:C277([DIARY:12]; [DIARY:12]Date_Done_To:34>SD_ad_SetDateto{$_l_IndexSets}; *)
						QUERY:C277([DIARY:12];  & ; [DIARY:12]Date_Done_From:5<=SD_ad_SetDateto{$_l_IndexSets}; *)
						QUERY:C277([DIARY:12];  & ; [DIARY:12]X_REOCCOURANCE:67="")  //ONLY FIND NON RE-OCCOURING
						CREATE SET:C116([DIARY:12]; "$DateMatch2")
						UNION:C120("$DateMatch1"; "$DateMatch2"; "$DateMatch1")
						UNION:C120("$DateMatch1"; "$DateMatch3"; "$DateMatch1")
						CLEAR SET:C117("$DateMatch3")
						USE SET:C118("$DateMatch1")
						CLEAR SET:C117("$DateMatch1")
						CLEAR SET:C117("$DateMatch2")
						CREATE SET:C116([DIARY:12]; "DateMatch2")
					Else 
						// range of dates being displayed
						QUERY:C277([DIARY:12]; [DIARY:12]Date_Done_To:34>=SD_ad_SetDateFrom{$_l_IndexSets}; *)
						QUERY:C277([DIARY:12];  & ; [DIARY:12]Date_Done_To:34<=SD_ad_SetDateto{$_l_IndexSets}; *)
						QUERY:C277([DIARY:12];  & ; [DIARY:12]X_REOCCOURANCE:67="")
						CREATE SET:C116([DIARY:12]; "$DateMatch1")
						QUERY:C277([DIARY:12]; [DIARY:12]Date_Done_To:34>SD_ad_SetDateto{$_l_IndexSets}; *)
						QUERY:C277([DIARY:12];  & ; [DIARY:12]Date_Done_From:5<=SD_ad_SetDateto{$_l_IndexSets}; *)
						QUERY:C277([DIARY:12];  & ; [DIARY:12]X_REOCCOURANCE:67="")  //ONLY FIND NON RE-OCCOURING
						CREATE SET:C116([DIARY:12]; "$DateMatch2")
						UNION:C120("$DateMatch1"; "$DateMatch2"; "$DateMatch1")
						UNION:C120("$DateMatch1"; "$DateMatch3"; "$DateMatch1")
						CLEAR SET:C117("$DateMatch3")
						USE SET:C118("$DateMatch1")
						CLEAR SET:C117("$DateMatch1")
						CLEAR SET:C117("$DateMatch2")
						CREATE SET:C116([DIARY:12]; "DateMatch2")
						
						
					End if 
					
				End if 
			Else 
				ALL RECORDS:C47([DIARY:12])
				CREATE SET:C116([DIARY:12]; "DateMatch2")
			End if 
			$_bo_IncludeResult:=False:C215
			Case of 
				: (SD_al_SetDoneStamp{$_l_IndexSets}=0) | (SD_al_SetDoneStamp{$_l_IndexSets}=1)
					QUERY:C277([DIARY:12]; [DIARY:12]Done:14=False:C215)
				: (SD_al_SetDoneStamp{$_l_IndexSets}=2)
					ALL RECORDS:C47([DIARY:12])  //Open and closed
					$_bo_IncludeResult:=True:C214
				: (SD_al_SetDoneStamp{$_l_IndexSets}=3)
					QUERY:C277([DIARY:12]; [DIARY:12]Done:14=True:C214)
					$_bo_IncludeResult:=True:C214
			End case 
			CREATE SET:C116([DIARY:12]; "OpenCLosedMatch")
			If ($_bo_IncludeResult)  //this is set to true if we are including done items
				If (Size of array:C274(SD_at_PreferenceResultCodes{$_l_IndexSets})>0)
					CREATE EMPTY SET:C140([DIARY:12]; "$AllResultMatch")
					For ($_l_Index2; 1; Size of array:C274(SD_at_PreferenceResultCodes{$_l_IndexSets}))
						QUERY:C277([DIARY:12]; [DIARY:12]Result_Code:11=SD_at_PreferenceResultCodes{$_l_IndexSets}{$_l_Index2})
						CREATE SET:C116([DIARY:12]; "$Thisresult")
						UNION:C120("$ThisResult"; "$AllResultMatch"; "$AllResultMatch")
						CLEAR SET:C117("$ThisResult")
					End for 
					USE SET:C118("$AllResultMatch")
					CLEAR SET:C117("$AllResultMatch")
					CREATE SET:C116([DIARY:12]; "ResultMatch")
				Else 
					ALL RECORDS:C47([DIARY:12])
					CREATE SET:C116([DIARY:12]; "ResultMatch")
					
				End if 
				
			Else 
				ALL RECORDS:C47([DIARY:12])
				CREATE SET:C116([DIARY:12]; "ResultMatch")
				
			End if 
			If (SD_al_SetPriorityValue{$_l_IndexSets}>0)
				QUERY:C277([DIARY:12]; [DIARY:12]Priority:17=String:C10(SD_al_SetPriorityValue{$_l_IndexSets}))
				CREATE SET:C116([DIARY:12]; "Priority")
			Else 
				ALL RECORDS:C47([DIARY:12])
				CREATE SET:C116([DIARY:12]; "Priority")
			End if 
			If (SD_al_TimeFrom{$_l_IndexSets}>0)
				$_ti_Time:=Time:C179(Time string:C180(SD_al_TimeFrom{$_l_IndexSets}))
				QUERY:C277([DIARY:12]; [DIARY:12]Display_Time_From:53=$_ti_Time)
				CREATE SET:C116([DIARY:12]; "TimeMatch1")
				If (SD_al_TimeTo{$_l_IndexSets}>0)
					$_ti_Time2:=Time:C179(Time string:C180(SD_al_TimeTo{$_l_IndexSets}))
					QUERY:C277([DIARY:12]; [DIARY:12]Display_Time_From:53<=$_ti_Time; *)
					QUERY:C277([DIARY:12];  & ; [DIARY:12]Display_Time_From:53<=$_ti_Time2)
					CREATE SET:C116([DIARY:12]; "TimeMatch2")
					UNION:C120("TimeMatch1"; "TimeMatch2"; "TimeMatch1")
					CLEAR SET:C117("TimeMatch2")
				End if 
			Else 
				ALL RECORDS:C47([DIARY:12])
				CREATE SET:C116([DIARY:12]; "TimeMatch1")
			End if 
			//``
			If (SD_al_Timeto{$_l_IndexSets}>0)
				$_ti_Time:=Time:C179(Time string:C180(SD_al_Timeto{$_l_IndexSets}))
				QUERY:C277([DIARY:12]; [DIARY:12]Display_Time_To:54=$_ti_Time)
				CREATE SET:C116([DIARY:12]; "TimeMatch2")
				If (SD_al_TimeTo{$_l_IndexSets}>0)
					$_ti_Time2:=Time:C179(Time string:C180(SD_al_TimeFrom{$_l_IndexSets}))
					QUERY:C277([DIARY:12]; [DIARY:12]Display_Time_To:54>=$_ti_Time2; *)
					QUERY:C277([DIARY:12];  & ; [DIARY:12]Display_Time_From:53<=$_ti_Time)
					CREATE SET:C116([DIARY:12]; "TimeMatch3")
					UNION:C120("TimeMatch3"; "TimeMatch2"; "TimeMatch2")
					CLEAR SET:C117("TimeMatch3")
				End if 
			Else 
				ALL RECORDS:C47([DIARY:12])
				CREATE SET:C116([DIARY:12]; "TimeMatch2")
			End if 
			If (Size of array:C274(SD_at_PreferenceStatusCodes{$_l_IndexSets})>0)
				CREATE EMPTY SET:C140([DIARY:12]; "$StatusMatch")
				For ($_l_Index2; 1; Size of array:C274(SD_at_PreferenceStatusCodes{$_l_IndexSets}))
					QUERY:C277([DIARY:12]; [DIARY:12]Status:30=SD_at_PreferenceStatusCodes{$_l_IndexSets}{$_l_Index2})
					CREATE SET:C116([DIARY:12]; "$thisstatus")
					UNION:C120("$ThisStatus"; "$statusMatch"; "$statusMatch")
					CLEAR SET:C117("$ThisStatus")
				End for 
				USE SET:C118("$statusMatch")
				CREATE SET:C116([DIARY:12]; "StatusMatch")
				
			Else 
				ALL RECORDS:C47([DIARY:12])
				
				CREATE SET:C116([DIARY:12]; "StatusMatch")
			End if 
			//Ok the next bit is possibly more complex!!
			If (Size of array:C274(SD_al_SearchrelatedTables{$_l_IndexSets})>0)
				CREATE EMPTY SET:C140("RelationsMatch")
				For ($_l_Index2; 1; Size of array:C274(SD_al_SearchrelatedTables{$_l_IndexSets}))
					
					Case of 
						: (SD_al_SearchrelatedTables{$_l_IndexSets}{$_l_Index2}=Table:C252(->[DIARY:12]))
							//searching a field on the diary
							$_ptr_Field:=Field:C253(SD_al_SearchrelatedTables{$_l_IndexSets}{$_l_Index2}; SD_al_OtherSearchFields{$_l_IndexSets}{$_l_Index2})
							$_l_DataType:=Type:C295($_ptr_Field->)
							Case of 
								: ($_l_DataType=Is alpha field:K8:1) | ($_l_DataType=Is text:K8:3)
									QUERY:C277([DIARY:12]; $_ptr_Field->=SD_at_otherSearchValues{$_l_IndexSets}{$_l_Index2})
								: ($_l_DataType=Is longint:K8:6) | ($_l_DataType=Is integer:K8:5) | ($_l_DataType=Is real:K8:4)
									QUERY:C277([DIARY:12]; $_ptr_Field->=Num:C11(SD_at_otherSearchValues{$_l_IndexSets}{$_l_Index2}))
								: ($_l_DataType=Is boolean:K8:9)
									QUERY:C277([DIARY:12]; $_ptr_Field->=(SD_at_otherSearchValues{$_l_IndexSets}{$_l_Index2}="TRUE"))
								: ($_l_DataType=Is time:K8:8)
									QUERY:C277([DIARY:12]; $_ptr_Field->=Time:C179(Time string:C180(Num:C11(SD_at_otherSearchValues{$_l_IndexSets}{$_l_Index2}))))  // Make sure that where this was saved it was turned into a number!
								: ($_l_DataType=Is date:K8:7)
									QUERY:C277([DIARY:12]; $_ptr_Field->=Date:C102(SD_at_otherSearchValues{$_l_IndexSets}{$_l_Index2}))  // Make sure that where this was saved it was turned into a number!
							End case 
							
						: ((SD_al_SearchrelatedTables{$_l_IndexSets}{$_l_Index2}=Table:C252(->[COMPANIES:2])) & (SD_al_OtherSearchFields{$_l_IndexSets}{$_l_Index2}=Field:C253(->[COMPANIES:2]Company_Code:1))) | ((SD_al_SearchrelatedTables{$_l_IndexSets}{$_l_Index2}=Table:C252(->[CONTACTS:1])) & (SD_al_OtherSearchFields{$_l_IndexSets}{$_l_Index2}=Field:C253(->[CONTACTS:1]Contact_Code:2))) | ((SD_al_SearchrelatedTables{$_l_IndexSets}{$_l_Index2}=Table:C252(->[SERVICE_CALLS:20])) & (SD_al_OtherSearchFields{$_l_IndexSets}{$_l_Index2}=Field:C253(->[SERVICE_CALLS:20]Call_Code:4))) | ((SD_al_SearchrelatedTables{$_l_IndexSets}{$_l_Index2}=Table:C252(->[DOCUMENTS:7])) & (SD_al_OtherSearchFields{$_l_IndexSets}{$_l_Index2}=Field:C253(->[DOCUMENTS:7]Document_Code:1))) | ((SD_al_SearchrelatedTables{$_l_IndexSets}{$_l_Index2}=Table:C252(->[JOBS:26])) & (SD_al_OtherSearchFields{$_l_IndexSets}{$_l_Index2}=Field:C253(->[JOBS:26]Job_Code:1))) | ((<>SD_al_SearchrelatedTables{$_l_IndexSets}{$_l_Index2}=Table:C252(->[ORDERS:24])) & (SD_al_OtherSearchFields{$_l_IndexSets}{$_l_Index2}=Field:C253(->[ORDERS:24]Order_Code:3))) | ((SD_al_SearchrelatedTables{$_l_IndexSets}{$_l_Index2}=Table:C252(->[PRODUCTS:9])) & (SD_al_OtherSearchFields{$_l_IndexSets}{$_l_Index2}=Field:C253(->[PRODUCTS:9]Product_Code:1))) | ((SD_al_SearchrelatedTables{$_l_IndexSets}{$_l_Index2}=Table:C252(->[JOB_STAGES:47])) & (SD_al_OtherSearchFields{$_l_IndexSets}{$_l_Index2}=Field:C253(->[JOB_STAGES:47]Stage_Code:2)))
							
							
							//Here we can coerse that search
							QUERY:C277([DIARY:12]; [DIARY:12]Company_Code:1=SD_at_otherSearchValues{$_l_IndexSets}{$_l_Index2})
							CREATE SET:C116([DIARY:12]; "$t1")
							QUERY:C277([xDiaryRelations:137]; [xDiaryRelations:137]xTableNUM:3=SD_al_SearchrelatedTables{$_l_IndexSets}{$_l_Index2}; *)
							QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]XRecord_Code:5=SD_at_otherSearchValues{$_l_IndexSets}{$_l_Index2})
							SELECTION TO ARRAY:C260([xDiaryRelations:137]xDiaryID:1; $_al_DiaryIDs)
							QUERY WITH ARRAY:C644([DIARY:12]x_ID:50; $_al_DiaryIDs)
							CREATE SET:C116([DIARY:12]; "$T2")
							UNION:C120("$T1"; "$T2"; "$T1")
							USE SET:C118("$T1")
							CLEAR SET:C117("$T1")
							CLEAR SET:C117("$T2")
							
						: (SD_al_SearchrelatedTables{$_l_IndexSets}{$_l_Index2}=Table:C252(->[xDiaryRelations:137]))
							//Search the diary relations table
							$_ptr_Field:=Field:C253(SD_al_SearchrelatedTables{$_l_IndexSets}{$_l_Index2}; SD_al_OtherSearchFields{$_l_IndexSets}{$_l_Index2})
							$_l_DataType:=Type:C295($_ptr_Field->)
							Case of 
								: ($_l_DataType=Is alpha field:K8:1) | ($_l_DataType=Is text:K8:3)
									QUERY:C277([xDiaryRelations:137]; $_ptr_Field->=SD_at_otherSearchValues{$_l_IndexSets}{$_l_Index2})
								: ($_l_DataType=Is longint:K8:6) | ($_l_DataType=Is integer:K8:5) | ($_l_DataType=Is real:K8:4)
									QUERY:C277([xDiaryRelations:137]; $_ptr_Field->=Num:C11(SD_at_otherSearchValues{$_l_IndexSets}{$_l_Index2}))
								: ($_l_DataType=Is boolean:K8:9)
									QUERY:C277([xDiaryRelations:137]; $_ptr_Field->=(SD_at_otherSearchValues{$_l_IndexSets}{$_l_Index2}="TRUE"))
								: ($_l_DataType=Is time:K8:8)
									QUERY:C277([xDiaryRelations:137]; $_ptr_Field->=Time:C179(Time string:C180(Num:C11(SD_at_otherSearchValues{$_l_IndexSets}{$_l_Index2}))))  // Make sure that where this was saved it was turned into a number!
								: ($_l_DataType=Is date:K8:7)
									QUERY:C277([xDiaryRelations:137]; $_ptr_Field->=Date:C102(SD_at_otherSearchValues{$_l_IndexSets}{$_l_Index2}))  // Make sure that where this was saved it was turned into a number!
							End case 
							SELECTION TO ARRAY:C260([xDiaryRelations:137]xDiaryID:1; $_al_DiaryIDs)
							QUERY WITH ARRAY:C644([DIARY:12]x_ID:50; $_al_DiaryIDs)
							
							
						Else 
							$_ptr_Table:=Table:C252(SD_al_SearchrelatedTables{$_l_IndexSets}{$_l_Index2})
							$_ptr_Field:=Field:C253(SD_al_SearchrelatedTables{$_l_IndexSets}{$_l_Index2}; SD_al_OtherSearchFields{$_l_IndexSets}{$_l_Index2})
							$_l_DataType:=Type:C295($_ptr_Field->)
							Case of 
								: ($_l_DataType=Is alpha field:K8:1) | ($_l_DataType=Is text:K8:3)
									QUERY:C277($_ptr_Table->; $_ptr_Field->=SD_at_otherSearchValues{$_l_IndexSets}{$_l_Index2})
								: ($_l_DataType=Is longint:K8:6) | ($_l_DataType=Is integer:K8:5) | ($_l_DataType=Is real:K8:4)
									QUERY:C277($_ptr_Table->; $_ptr_Field->=Num:C11(SD_at_otherSearchValues{$_l_IndexSets}{$_l_Index2}))
								: ($_l_DataType=Is boolean:K8:9)
									QUERY:C277($_ptr_Table->; $_ptr_Field->=(SD_at_otherSearchValues{$_l_IndexSets}{$_l_Index2}="TRUE"))
								: ($_l_DataType=Is time:K8:8)
									QUERY:C277($_ptr_Table->; $_ptr_Field->=Time:C179(Time string:C180(Num:C11(SD_at_otherSearchValues{$_l_IndexSets}{$_l_Index2}))))  // Make sure that where this was saved it was turned into a number!
								: ($_l_DataType=Is date:K8:7)
									QUERY:C277($_ptr_Table->; $_ptr_Field->=Date:C102(SD_at_otherSearchValues{$_l_IndexSets}{$_l_Index2}))  // Make sure that where this was saved it was turned into a number!
								: ($_l_DataType=Is subtable:K8:11)
									//The text will need to contain the field name to search+the value
									$_l_PostionChar:=Position:C15(";"; <>SD_at_otherSearchValues{$_l_IndexSets}{$_l_Index2})
									If ($_l_PostionChar>0)
										$_t_FieldName:=Substring:C12(SD_at_otherSearchValues{$_l_IndexSets}{$_l_Index2}; 1; $_l_PostionChar-1)
										$_t_FieldValue:=Substring:C12(SD_at_otherSearchValues{$_l_IndexSets}{$_l_Index2}; $_l_PostionChar+1; Length:C16(SD_at_otherSearchValues{$_l_IndexSets}{$_l_Index2}))
										SD2_QuerySubtable(SD_al_SearchrelatedTables{$_l_IndexSets}{$_l_Index2}; SD_al_OtherSearchFields{$_l_IndexSets}{$_l_Index2}; $_t_FieldName; $_t_FieldValue)
									End if 
							End case 
							//This gives a selection of records in the 'source' table
							$_l_FieldNumber:=SD2_GetIDFieldNum(SD_al_SearchrelatedTables{$_l_IndexSets}{$_l_Index2})
							If ($_l_FieldNumber>0)  //it should be or the item cannot be related to the diary
								//This gives us the id field number
								$_ptr_Field:=Field:C253(SD_al_SearchrelatedTables{$_l_IndexSets}{$_l_Index2}; $_l_FieldNumber)
								ARRAY LONGINT:C221($_al_RecordIdents; 0)
								
								SELECTION TO ARRAY:C260($_ptr_Field->; $_al_RecordIdents)
								
								For ($_l_Index; 1; Size of array:C274($_al_RecordIdents))
									//now build a list of 'ids for the
									$_al_RecordIdents{$_l_IndexSets}:=Num:C11("1"+(String:C10(SD_al_SearchrelatedTables{$_l_IndexSets}{$_l_Index2}; "0000"))+(String:C10($_al_RecordIdents{$_l_Index}; "000000000")))
								End for 
								QUERY WITH ARRAY:C644([xDiaryRelations:137]XRelationNUM:2; $_al_RecordIdents)
								SELECTION TO ARRAY:C260([xDiaryRelations:137]xDiaryID:1; $_al_DiaryIDs)
								QUERY WITH ARRAY:C644([DIARY:12]x_ID:50; $_al_DiaryIDs)
								//This gives us the diary  records related.
							Else 
								REDUCE SELECTION:C351([DIARY:12]; 0)
							End if 
							QUERY:C277([xDiaryRelations:137]; [xDiaryRelations:137]xTableNUM:3=SD_al_SearchrelatedTables{$_l_IndexSets}{$_l_Index2})
							
					End case 
					//We now have a selection of diary items
					Case of 
						: (SD_at_othersearchConj{$_l_IndexSets}{$_l_Index2}="") | ($_l_Index2=1)
							CREATE SET:C116([DIARY:12]; "RelationsMatch")
						: (SD_at_othersearchConj{$_l_IndexSets}{$_l_Index2}="&") | (SD_at_othersearchConj{$_l_IndexSets}{$_l_Index2}="and")
							CREATE SET:C116([DIARY:12]; "RelationsMatchThisone")
							INTERSECTION:C121("RelationsMatchThisone"; "RelationsMatch"; "RelationsMatch")
							CLEAR SET:C117("RelationsMatchThisone")
						: (SD_at_othersearchConj{$_l_IndexSets}{$_l_Index2}="|") | (SD_at_othersearchConj{$_l_IndexSets}{$_l_Index2}="or")
							CREATE SET:C116([DIARY:12]; "RelationsMatchThisone")
							UNION:C120("RelationsMatchThisone"; "RelationsMatch"; "RelationsMatch")
							CLEAR SET:C117("RelationsMatchThisone")
						: (SD_at_othersearchConj{$_l_IndexSets}{$_l_Index2}="#") | (SD_at_othersearchConj{$_l_IndexSets}{$_l_Index2}="not")
							CREATE SET:C116([DIARY:12]; "RelationsMatchThisone")
							DIFFERENCE:C122("RelationsMatch"; "RelationsMatchThisone"; "RelationsMatch")
							CLEAR SET:C117("RelationsMatchThisone")
					End case 
				End for 
				
			Else 
				ALL RECORDS:C47([DIARY:12])
				CREATE SET:C116([DIARY:12]; "RelationsMatch")
			End if 
			//So now whatever wehave a set of diary records for each possible parameter
			CREATE SET:C116([DIARY:12]; "ReturnSet")
			INTERSECTION:C121("MatchPerson"; "MatchAction"; "ReturnSet")
			CLEAR SET:C117("MatchPerson")
			CLEAR SET:C117("MatchAction")
			INTERSECTION:C121("ReturnSet"; "DateMatch"; "ReturnSet")
			CLEAR SET:C117("DateMatch")
			INTERSECTION:C121("ReturnSet"; "DateMatch2"; "ReturnSet")
			CLEAR SET:C117("DateMatch2")
			INTERSECTION:C121("ReturnSet"; "OpenCLosedMatch"; "ReturnSet")
			CLEAR SET:C117("OpenClosedMatch")
			INTERSECTION:C121("ReturnSet"; "ResultMatch"; "ReturnSet")
			CLEAR SET:C117("ResultMatch")
			INTERSECTION:C121("ReturnSet"; "Priority"; "ReturnSet")
			CLEAR SET:C117("Priority")
			INTERSECTION:C121("ReturnSet"; "TimeMatch2"; "ReturnSet")
			CLEAR SET:C117("TimeMatch2")
			INTERSECTION:C121("ReturnSet"; "TimeMatch1"; "ReturnSet")
			CLEAR SET:C117("TimeMatch1")
			INTERSECTION:C121("ReturnSet"; "StatusMatch"; "ReturnSet")
			CLEAR SET:C117("StatusMatch")
			INTERSECTION:C121("ReturnSet"; "RelationsMatch"; "ReturnSet")
			CLEAR SET:C117("RelationsMatch")
			USE SET:C118("ReturnSet")
			CLEAR SET:C117("ReturnSet")
			
			
			
			If (Size of array:C274(<>SD_al_DiarySets)<$_l_IndexSets)
				$_l_Difference:=$_l_IndexSets-Size of array:C274(<>SD_al_DiarySets)
				INSERT IN ARRAY:C227(<>SD_al_DiarySets; Size of array:C274(<>SD_al_DiarySets)+1; $_l_Difference)
			End if 
			//Now put the set into the array
			ARRAY LONGINT:C221($_al_TempArray; 0)
			
			LONGINT ARRAY FROM SELECTION:C647([DIARY:12]; $_al_TempArray)
			COPY ARRAY:C226($_al_TempArray; <>SD_al_DiarySets{$_l_IndexSets})
			<>SD_abo_setInitialized{$_l_IndexSets}:=True:C214
			
			DelayTicks(60)  //to give anything else a chance to kick in
		End if 
		CLEAR SEMAPHORE:C144("UpdateSet_"+String:C10(<>SD_al_SetIDs{$_l_IndexSets}))
	End for 
	
	//Now we parse any diary items updated
	While (Semaphore:C143("SD_CheckSets"))
		DelayTicks(2)
	End while 
	ARRAY LONGINT:C221($_al_aDiaryQueues; 0)
	ARRAY TEXT:C222($_at_ModifiedFields; 0)  // Contains a comma seperated list of the modified fields i am using this in preference to a 2D array as it is quicker to copy
	COPY ARRAY:C226(<>SD_al_aDiaryQueue; $_al_aDiaryQueues)  //COPY THE ARRAY SO NOTHING ELSE NEEDS TO WAIT
	COPY ARRAY:C226(<>SD_At_DiaryModFields; $_at_ModifiedFields)
	CLEAR SEMAPHORE:C144("SD_CheckSets")
	If (Size of array:C274($_al_aDiaryQueues)>0)
		For ($_l_IndexDiaryQueue; 1; Size of array:C274($_al_aDiaryQueues))
			If ($_al_aDiaryQueues{$_l_IndexDiaryQueue}>=0)  // 1
				GOTO RECORD:C242([DIARY:12]; $_al_aDiaryQueues{$_l_IndexDiaryQueue})
				$_bo_IsInSet:=(Find in array:C230(<>SD_al_DiarySets{$_l_IndexDiaryQueue}; $_al_aDiaryQueues{$_l_IndexDiaryQueue})>0)
				
				
				For ($_l_Index; 1; Size of array:C274(<>SD_al_SetIDs))  //HERE WE TEST IF THE RECORD BELONGS IN THE SET
					While (Semaphore:C143("UpdateSet_"+String:C10(<>SD_al_SetIDs{$_l_Index})))
						DelayTicks
					End while 
					$_t_FieldReference:=String:C10(Field:C253(->[DIARY:12]Person:8))
					$_bo_isMod:=(Position:C15(","+$_t_FieldReference+","; $_at_ModifiedFields{$_l_IndexDiaryQueue})>0) | (Position:C15($_t_FieldReference+","; $_at_ModifiedFields{$_l_IndexDiaryQueue})=1) | (Position:C15(","+$_t_FieldReference; $_at_ModifiedFields{$_l_IndexDiaryQueue})=(Length:C16($_at_ModifiedFields{$_l_IndexDiaryQueue})-Length:C16(","+$_t_FieldReference))) | ($_at_ModifiedFields{$_l_IndexDiaryQueue}="")
					//NOTE THAT WE RECORD THAT FIELD EVEN IF IT IS A [DIARY ITEM OWNER] THAT IS MODIFIED
					If ($_bo_isMod)
						If (Size of array:C274(SD_al_SetPersonIDs{$_l_Index})>0)
							QUERY:C277([DIARY_ITEMOWNERS:106]; [DIARY_ITEMOWNERS:106]DIARY_CODE:1=[DIARY:12]Diary_Code:3)
							SELECTION TO ARRAY:C260([DIARY_ITEMOWNERS:106]PERSONNEL_ID:2; $_al_DiaryOwnerIDs; [DIARY_ITEMOWNERS:106]RELATIONSHIP_CLASSID:3; $_al_DiaryOwnerClasses)
							$_bo_Match:=False:C215
							For ($_l_IndexDiaryOwners; 1; Size of array:C274($_al_DiaryOwnerIDs))
								$_l_RecordPosition:=(Find in array:C230(SD_al_SetPersonIDs{$_l_Index}; $_al_DiaryOwnerIDs{$_l_IndexDiaryOwners}))
								If ($_l_RecordPosition>0)
									If (SD_al_PersonOptions{$_l_Index}>0)  //relationship type matters
										If ($_al_DiaryOwnerClasses{$_l_IndexDiaryOwners}=SD_al_PersonOptions{$_l_RecordPosition})
											$_bo_Match:=True:C214
											$_l_IndexDiaryOwners:=9999999
										End if 
									Else 
										$_bo_Match:=True:C214
										$_l_IndexDiaryOwners:=99999
									End if 
								End if 
							End for 
						Else 
							//All Persons so its in anyway
							$_bo_Match:=True:C214
						End if 
					Else 
						$_bo_Match:=$_bo_IsInSet
					End if 
					If ($_bo_Match)  // Person matches
						$_t_FieldReference:=String:C10(Field:C253(->[DIARY:12]Action_Code:9))
						$_bo_isMod:=(Position:C15(","+$_t_FieldReference+","; $_at_ModifiedFields{$_l_IndexDiaryQueue})>0) | (Position:C15($_t_FieldReference+","; $_at_ModifiedFields{$_l_IndexDiaryQueue})=1) | (Position:C15(","+$_t_FieldReference; $_at_ModifiedFields{$_l_IndexDiaryQueue})=(Length:C16($_at_ModifiedFields{$_l_IndexDiaryQueue})-Length:C16(","+$_t_FieldReference))) | ($_at_ModifiedFields{$_l_IndexDiaryQueue}="")
						
						If ($_bo_isMod)
							$_bo_Match:=False:C215
							If (Size of array:C274(SD_at_PreferenceactionCodes{$_l_Index})>0)
								$_l_RecordPosition:=Find in array:C230(SD_at_PreferenceactionCodes{$_l_Index}; [DIARY:12]Action_Code:9)
								If ($_l_RecordPosition>0)
									$_bo_Match:=True:C214
								End if 
							Else 
								$_bo_Match:=True:C214
							End if 
						Else 
							$_bo_Match:=$_bo_IsInSet
						End if 
						If ($_bo_Match)  //person and Action match
							$_t_FieldReference:=String:C10(Field:C253(->[DIARY:12]Display_Date_From:51))
							$_bo_isMod:=(Position:C15(","+$_t_FieldReference+","; $_at_ModifiedFields{$_l_IndexDiaryQueue})>0) | (Position:C15($_t_FieldReference+","; $_at_ModifiedFields{$_l_IndexDiaryQueue})=1) | (Position:C15(","+$_t_FieldReference; $_at_ModifiedFields{$_l_IndexDiaryQueue})=(Length:C16($_at_ModifiedFields{$_l_IndexDiaryQueue})-Length:C16(","+$_t_FieldReference))) | ($_at_ModifiedFields{$_l_IndexDiaryQueue}="")
							
							If ($_bo_isMod)
								$_bo_Match:=False:C215
								If ([DIARY:12]X_REOCCOURANCE:67="")  //remember  re-occourance only applies to the schedule window
									If (SD_ad_SetDateFrom{$_l_Index}#!00-00-00!)
										If ([DIARY:12]Display_Date_From:51=SD_ad_SetDateFrom{$_l_Index})
											$_bo_Match:=True:C214
										Else 
											If (SD_ad_SetDateto{$_l_Index}#!00-00-00!)
												If ([DIARY:12]Display_Date_From:51<SD_ad_SetDateFrom{$_l_Index}) & ([DIARY:12]Display_Date_To:52>=SD_ad_SetDateto{$_l_Index})
													$_bo_Match:=True:C214
												End if 
											Else 
											End if 
										End if 
									Else 
										$_bo_Match:=True:C214  //all dates
									End if 
								Else 
									//Use re-occourance to see if this should be in the set
									
								End if 
							Else 
								$_bo_Match:=$_bo_IsInSet
							End if 
							If ($_bo_Match)  //Person and action and date from match
								$_t_FieldReference:=String:C10(Field:C253(->[DIARY:12]Display_Date_To:52))
								$_bo_isMod:=(Position:C15(","+$_t_FieldReference+","; $_at_ModifiedFields{$_l_IndexDiaryQueue})>0) | (Position:C15($_t_FieldReference+","; $_at_ModifiedFields{$_l_IndexDiaryQueue})=1) | (Position:C15(","+$_t_FieldReference; $_at_ModifiedFields{$_l_IndexDiaryQueue})=(Length:C16($_at_ModifiedFields{$_l_IndexDiaryQueue})-Length:C16(","+$_t_FieldReference))) | ($_at_ModifiedFields{$_l_IndexDiaryQueue}="")
								
								
								If ($_bo_isMod)
									$_bo_Match:=False:C215
									If ([DIARY:12]X_REOCCOURANCE:67="")  //remember  re-occourance only applies to the schedule window
										If (SD_ad_SetDateto{$_l_Index}#!00-00-00!)
											If ([DIARY:12]Display_Date_To:52=SD_ad_SetDateto{$_l_Index})
												$_bo_Match:=True:C214
											Else 
												If (SD_ad_SetDatefrom{$_l_Index}#!00-00-00!)
													If ([DIARY:12]Display_Date_From:51<=SD_ad_SetDateFrom{$_l_Index}) & ([DIARY:12]Display_Date_To:52>SD_ad_SetDateto{$_l_Index})
														$_bo_Match:=True:C214
													End if 
												Else 
												End if 
											End if 
										Else 
											$_bo_Match:=True:C214  //all dates
										End if 
									Else 
										//Use re-occourance to see if this should be in the set
										
									End if 
								Else 
									$_bo_Match:=$_bo_IsInSet
								End if 
								If ($_bo_Match)  //person action date from and date to match
									$_t_FieldReference:=String:C10(Field:C253(->[DIARY:12]Display_Time_From:53))
									$_bo_isMod:=(Position:C15(","+$_t_FieldReference+","; $_at_ModifiedFields{$_l_IndexDiaryQueue})>0) | (Position:C15($_t_FieldReference+","; $_at_ModifiedFields{$_l_IndexDiaryQueue})=1) | (Position:C15(","+$_t_FieldReference; $_at_ModifiedFields{$_l_IndexDiaryQueue})=(Length:C16($_at_ModifiedFields{$_l_IndexDiaryQueue})-Length:C16(","+$_t_FieldReference))) | ($_at_ModifiedFields{$_l_IndexDiaryQueue}="")
									
									If ($_bo_isMod)
										$_bo_Match:=False:C215
										If (SD_al_TimeFrom{$_l_Index}#0)
											If (SD_al_TimeFrom{$_l_Index}=([DIARY:12]Display_Time_From:53*1))
												$_bo_Match:=True:C214
											Else 
												If (SD_al_Timeto{$_l_Index}#0)
													If (SD_al_TimeFrom{$_l_Index}>=([DIARY:12]Display_Time_From:53*1)) & (SD_al_Timeto{$_l_Index}<=([DIARY:12]Display_Time_From:53*1))
														$_bo_Match:=True:C214
													End if 
												Else 
													//all times
													$_bo_Match:=True:C214
												End if 
												
											End if 
										End if 
									Else 
										$_bo_Match:=$_bo_IsInSet
									End if 
									If ($_bo_Match)  //person action date from and date to and time from  match
										$_t_FieldReference:=String:C10(Field:C253(->[DIARY:12]Display_Time_From:53))
										$_bo_isMod:=(Position:C15(","+$_t_FieldReference+","; $_at_ModifiedFields{$_l_IndexDiaryQueue})>0) | (Position:C15($_t_FieldReference+","; $_at_ModifiedFields{$_l_IndexDiaryQueue})=1) | (Position:C15(","+$_t_FieldReference; $_at_ModifiedFields{$_l_IndexDiaryQueue})=(Length:C16($_at_ModifiedFields{$_l_IndexDiaryQueue})-Length:C16(","+$_t_FieldReference))) | ($_at_ModifiedFields{$_l_IndexDiaryQueue}="")
										
										If ($_bo_isMod)
											$_bo_Match:=False:C215
											If (SD_al_Timeto{$_l_Index}#0)
												If (SD_al_Timeto{$_l_Index}=([DIARY:12]Display_Time_To:54*1))
													$_bo_Match:=True:C214
												Else 
													If (SD_al_Timefrom{$_l_Index}#0)
														If (SD_al_TimeFrom{$_l_Index}>=([DIARY:12]Display_Time_From:53*1)) & (SD_al_Timeto{$_l_Index}<=([DIARY:12]Display_Time_To:54*1))
															$_bo_Match:=True:C214
														End if 
													Else 
														//all times
														$_bo_Match:=True:C214
													End if 
													
												End if 
											End if 
										Else 
											$_bo_Match:=$_bo_IsInSet
										End if 
										If ($_bo_Match)  //person action date from and date to and time from and time to  match
											$_t_FieldReference:=String:C10(Field:C253(->[DIARY:12]Done:14))
											$_bo_isMod:=(Position:C15(","+$_t_FieldReference+","; $_at_ModifiedFields{$_l_IndexDiaryQueue})>0) | (Position:C15($_t_FieldReference+","; $_at_ModifiedFields{$_l_IndexDiaryQueue})=1) | (Position:C15(","+$_t_FieldReference; $_at_ModifiedFields{$_l_IndexDiaryQueue})=(Length:C16($_at_ModifiedFields{$_l_IndexDiaryQueue})-Length:C16(","+$_t_FieldReference))) | ($_at_ModifiedFields{$_l_IndexDiaryQueue}="")
											
											
											//Done stamp
											//1=Open only
											//2=Open and closed
											//3=closed only
											If ($_bo_isMod)
												
												$_bo_Match:=False:C215
												If (SD_al_SetDoneStamp{$_l_Index}>0)
													If ([DIARY:12]Done:14)
														If (SD_al_SetDoneStamp{$_l_Index}>1)
															$_bo_Match:=True:C214
														End if 
													Else 
														If (SD_al_SetDoneStamp{$_l_Index}<3)
															$_bo_Match:=True:C214
														End if 
													End if 
												Else 
													$_bo_Match:=True:C214
												End if 
											Else 
												$_bo_Match:=$_bo_IsInSet
											End if 
											If ($_bo_Match)  //person action date from and date to and time from and time to  match and done flag match
												$_t_FieldReference:=String:C10(Field:C253(->[DIARY:12]Priority:17))
												$_bo_isMod:=(Position:C15(","+$_t_FieldReference+","; $_at_ModifiedFields{$_l_IndexDiaryQueue})>0) | (Position:C15($_t_FieldReference+","; $_at_ModifiedFields{$_l_IndexDiaryQueue})=1) | (Position:C15(","+$_t_FieldReference; $_at_ModifiedFields{$_l_IndexDiaryQueue})=(Length:C16($_at_ModifiedFields{$_l_IndexDiaryQueue})-Length:C16(","+$_t_FieldReference))) | ($_at_ModifiedFields{$_l_IndexDiaryQueue}="")
												
												If ($_bo_isMod)
													$_bo_Match:=False:C215
													If (SD_al_SetPriorityValue{$_l_Index}>0)
														If (Num:C11([DIARY:12]Priority:17)=SD_al_SetPriorityValue{$_l_Index})
															
														End if 
													End if 
												Else 
													$_bo_Match:=$_bo_IsInSet
												End if 
												If ($_bo_Match)  //person action date from and date to and time from and time to  match and done flag  and priority match
													$_t_FieldReference:=String:C10(Field:C253(->[DIARY:12]Document_Code:15))
													$_bo_isMod:=(Position:C15(","+$_t_FieldReference+","; $_at_ModifiedFields{$_l_IndexDiaryQueue})>0) | (Position:C15($_t_FieldReference+","; $_at_ModifiedFields{$_l_IndexDiaryQueue})=1) | (Position:C15(","+$_t_FieldReference; $_at_ModifiedFields{$_l_IndexDiaryQueue})=(Length:C16($_at_ModifiedFields{$_l_IndexDiaryQueue})-Length:C16(","+$_t_FieldReference))) | ($_at_ModifiedFields{$_l_IndexDiaryQueue}="")
													
													If ($_bo_isMod)
														$_bo_Match:=False:C215
														If (SD_al_IncludeDocs{$_l_Index}=0)  // Exclude any with docs
															If ([DIARY:12]Document_Code:15="")
																$_bo_Match:=True:C214
															End if 
														Else 
															//include with docs
															$_bo_Match:=True:C214
														End if 
														
													Else 
														$_bo_Match:=$_bo_IsInSet
													End if 
													If ($_bo_Match)  //person action date from and date to and time from and time to  match,done flag,   priority and doc include match
														$_t_FieldReference:=String:C10(Field:C253(->[DIARY:12]Result_Code:11))
														$_bo_isMod:=(Position:C15(","+$_t_FieldReference+","; $_at_ModifiedFields{$_l_IndexDiaryQueue})>0) | (Position:C15($_t_FieldReference+","; $_at_ModifiedFields{$_l_IndexDiaryQueue})=1) | (Position:C15(","+$_t_FieldReference; $_at_ModifiedFields{$_l_IndexDiaryQueue})=(Length:C16($_at_ModifiedFields{$_l_IndexDiaryQueue})-Length:C16(","+$_t_FieldReference))) | ($_at_ModifiedFields{$_l_IndexDiaryQueue}="")
														
														If ($_bo_isMod)
															$_bo_Match:=False:C215
															If (Size of array:C274(SD_at_PreferenceResultCodes{$_l_Index})>0)
																If (Find in array:C230(SD_at_PreferenceResultCodes{$_l_Index}; [DIARY:12]Result_Code:11)>0)
																	$_bo_Match:=True:C214
																End if 
															Else 
																//all results
																$_bo_Match:=False:C215
															End if 
														Else 
															$_bo_Match:=$_bo_IsInSet
														End if 
														If ($_bo_Match)  //person action date from and date to and time from and time to  match,done flag,   priority,  doc include , and result match
															$_t_FieldReference:=String:C10(Field:C253(->[DIARY:12]Status:30))
															$_bo_isMod:=(Position:C15(","+$_t_FieldReference+","; $_at_ModifiedFields{$_l_IndexDiaryQueue})>0) | (Position:C15($_t_FieldReference+","; $_at_ModifiedFields{$_l_IndexDiaryQueue})=1) | (Position:C15(","+$_t_FieldReference; $_at_ModifiedFields{$_l_IndexDiaryQueue})=(Length:C16($_at_ModifiedFields{$_l_IndexDiaryQueue})-Length:C16(","+$_t_FieldReference))) | ($_at_ModifiedFields{$_l_IndexDiaryQueue}="")
															
															If ($_bo_isMod)
																$_bo_Match:=False:C215
																If (Size of array:C274(SD_at_PreferenceStatusCodes{$_l_Index})>0)
																	If (Find in array:C230(SD_at_PreferenceStatusCodes{$_l_Index}; [DIARY:12]Status:30)>0)
																		$_bo_Match:=True:C214
																	End if 
																Else 
																	$_bo_Match:=True:C214
																End if 
															Else 
																$_bo_Match:=$_bo_IsInSet
															End if 
															
															If ($_bo_Match)
																If (Size of array:C274(SD_al_SearchrelatedTables{$_l_Index})>0)
																	For ($_l_Index2; 1; Size of array:C274(SD_al_SearchrelatedTables{$_l_Index}))
																		//``````
																		Case of 
																			: (SD_al_SearchrelatedTables{$_l_Index}{$_l_Index2}=Table:C252(->[DIARY:12]))
																				//searching a field on the diary
																				$_ptr_Field:=Field:C253(SD_al_SearchrelatedTables{$_l_Index}{$_l_Index2}; SD_al_OtherSearchFields{$_l_Index}{$_l_Index2})
																				$_t_FieldReference:=String:C10(SD_al_OtherSearchFields{$_l_Index}{$_l_Index2})
																				$_bo_isMod:=(Position:C15(","+$_t_FieldReference+","; $_at_ModifiedFields{$_l_IndexDiaryQueue})>0) | (Position:C15($_t_FieldReference+","; $_at_ModifiedFields{$_l_IndexDiaryQueue})=1) | (Position:C15(","+$_t_FieldReference; $_at_ModifiedFields{$_l_IndexDiaryQueue})=(Length:C16($_at_ModifiedFields{$_l_IndexDiaryQueue})-Length:C16(","+$_t_FieldReference))) | ($_at_ModifiedFields{$_l_IndexDiaryQueue}="")
																				
																				$_l_DataType:=Type:C295($_ptr_Field->)
																				If ($_bo_isMod)  //the field is modified
																					Case of 
																						: ($_l_DataType=Is alpha field:K8:1) | ($_l_DataType=Is text:K8:3)
																							If ($_ptr_Field->#SD_at_otherSearchValues{$_l_Index}{$_l_Index2})
																								$_bo_Match:=False:C215
																							End if 
																						: ($_l_DataType=Is longint:K8:6) | ($_l_DataType=Is integer:K8:5) | ($_l_DataType=Is real:K8:4)
																							If ($_ptr_Field->#Num:C11(SD_at_otherSearchValues{$_l_Index}{$_l_Index2}))
																								$_bo_Match:=False:C215
																							End if 
																						: ($_l_DataType=Is boolean:K8:9)
																							If (FieldPtr->#(SD_at_otherSearchValues{$_l_Index}{$_l_Index2}="TRUE"))
																								$_bo_Match:=False:C215
																							End if 
																						: ($_l_DataType=Is time:K8:8)
																							If ($_ptr_Field->#Time:C179(Time string:C180(Num:C11(SD_at_otherSearchValues{$_l_Index}{$_l_Index2}))))  // Make sure that where this was saved it was turned into a number!
																								$_bo_Match:=False:C215
																							End if 
																						: ($_l_DataType=Is date:K8:7)
																							If ($_ptr_Field->=Date:C102(SD_at_otherSearchValues{$_l_Index}{$_l_Index2}))  // Make sure that where this was saved it was turned into a number!
																								$_bo_Match:=False:C215
																							End if 
																					End case 
																				Else 
																					$_bo_Match:=$_bo_IsInSet
																				End if 
																			: ((SD_al_SearchrelatedTables{$_l_Index}{$_l_Index2}=Table:C252(->[COMPANIES:2])) & (SD_al_OtherSearchFields{$_l_Index}{$_l_Index2}=Field:C253(->[COMPANIES:2]Company_Code:1)))
																				//Here we can coerse that search
																				$_t_FieldReference:=String:C10(Field:C253(->[DIARY:12]Company_Code:1))
																				$_bo_isMod:=(Position:C15(","+$_t_FieldReference+","; $_at_ModifiedFields{$_l_IndexDiaryQueue})>0) | (Position:C15($_t_FieldReference+","; $_at_ModifiedFields{$_l_IndexDiaryQueue})=1) | (Position:C15(","+$_t_FieldReference; $_at_ModifiedFields{$_l_IndexDiaryQueue})=(Length:C16($_at_ModifiedFields{$_l_IndexDiaryQueue})-Length:C16(","+$_t_FieldReference))) | ($_at_ModifiedFields{$_l_IndexDiaryQueue}="")
																				If ($_bo_isMod)
																					$_bo_Match1:=False:C215
																					If ([DIARY:12]Company_Code:1#SD_at_otherSearchValues{$_l_Index}{$_l_Index2})
																						$_bo_Match1:=True:C214
																					End if 
																					If ($_bo_Match1=False:C215)
																						QUERY:C277([xDiaryRelations:137]; [xDiaryRelations:137]xDiaryID:1=[DIARY:12]x_ID:50; *)
																						QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]XRecord_Code:5=SD_at_otherSearchValues{$_l_Index}{$_l_Index2}; *)
																						QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]xTableNUM:3=SD_al_SearchrelatedTables{$_l_Index}{$_l_Index2})
																						$_bo_Match2:=(Records in selection:C76([xDiaryRelations:137])>0)
																						If ($_bo_Match2=False:C215)
																							$_bo_Match:=False:C215
																						End if 
																					Else 
																						$_bo_Match:=$_bo_Match1
																					End if 
																				Else 
																					$_bo_Match:=$_bo_IsInSet
																				End if 
																			: (SD_al_SearchrelatedTables{$_l_Index}{$_l_Index2}=Table:C252(->[CONTACTS:1])) & (SD_al_OtherSearchFields{$_l_Index}{$_l_Index2}=Field:C253(->[CONTACTS:1]Contact_Code:2))
																				$_t_FieldReference:=String:C10(Field:C253(->[DIARY:12]Contact_Code:2))
																				$_bo_isMod:=(Position:C15(","+$_t_FieldReference+","; $_at_ModifiedFields{$_l_IndexDiaryQueue})>0) | (Position:C15($_t_FieldReference+","; $_at_ModifiedFields{$_l_IndexDiaryQueue})=1) | (Position:C15(","+$_t_FieldReference; $_at_ModifiedFields{$_l_IndexDiaryQueue})=(Length:C16($_at_ModifiedFields{$_l_IndexDiaryQueue})-Length:C16(","+$_t_FieldReference))) | ($_at_ModifiedFields{$_l_IndexDiaryQueue}="")
																				If ($_bo_isMod)
																					$_bo_Match1:=False:C215
																					If ([DIARY:12]Contact_Code:2=SD_at_otherSearchValues{$_l_Index}{$_l_Index2})
																						$_bo_Match1:=True:C214
																					End if 
																					If ($_bo_Match1=False:C215)
																						QUERY:C277([xDiaryRelations:137]; [xDiaryRelations:137]xDiaryID:1=[DIARY:12]x_ID:50; *)
																						QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]XRecord_Code:5=SD_at_otherSearchValues{$_l_Index}{$_l_Index2}; *)
																						QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]xTableNUM:3=SD_al_SearchrelatedTables{$_l_Index}{$_l_Index2})
																						$_bo_Match2:=(Records in selection:C76([xDiaryRelations:137])>0)
																						If ($_bo_Match2=False:C215)
																							$_bo_Match:=False:C215
																						End if 
																					Else 
																						$_bo_Match:=$_bo_Match1
																					End if 
																				Else 
																					$_bo_Match:=$_bo_IsInSet
																				End if 
																				
																			: (SD_al_SearchrelatedTables{$_l_Index}{$_l_Index2}=Table:C252(->[SERVICE_CALLS:20])) & (SD_al_OtherSearchFields{$_l_Index}{$_l_Index2}=Field:C253(->[SERVICE_CALLS:20]Call_Code:4))
																				$_t_FieldReference:=String:C10(Field:C253(->[DIARY:12]Call_Code:25))
																				$_bo_isMod:=(Position:C15(","+$_t_FieldReference+","; $_at_ModifiedFields{$_l_IndexDiaryQueue})>0) | (Position:C15($_t_FieldReference+","; $_at_ModifiedFields{$_l_IndexDiaryQueue})=1) | (Position:C15(","+$_t_FieldReference; $_at_ModifiedFields{$_l_IndexDiaryQueue})=(Length:C16($_at_ModifiedFields{$_l_IndexDiaryQueue})-Length:C16(","+$_t_FieldReference))) | ($_at_ModifiedFields{$_l_IndexDiaryQueue}="")
																				If ($_bo_isMod)
																					$_bo_Match1:=False:C215
																					If ([DIARY:12]Call_Code:25=SD_at_otherSearchValues{$_l_Index}{$_l_Index2})
																						$_bo_Match1:=True:C214
																					End if 
																					If ($_bo_Match1=False:C215)
																						QUERY:C277([xDiaryRelations:137]; [xDiaryRelations:137]xDiaryID:1=[DIARY:12]x_ID:50; *)
																						QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]XRecord_Code:5=SD_at_otherSearchValues{$_l_Index}{$_l_Index2}; *)
																						QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]xTableNUM:3=SD_al_SearchrelatedTables{$_l_Index}{$_l_Index2})
																						$_bo_Match2:=(Records in selection:C76([xDiaryRelations:137])>0)
																						If ($_bo_Match2=False:C215)
																							$_bo_Match:=False:C215
																						End if 
																					Else 
																						$_bo_Match:=$_bo_Match1
																					End if 
																				Else 
																					$_bo_Match:=$_bo_IsInSet
																				End if 
																			: (SD_al_SearchrelatedTables{$_l_Index}{$_l_Index2}=Table:C252(->[DOCUMENTS:7])) & (SD_al_OtherSearchFields{$_l_Index}{$_l_Index2}=Field:C253(->[DOCUMENTS:7]Document_Code:1))
																				$_t_FieldReference:=String:C10(Field:C253(->[DIARY:12]Document_Code:15))
																				$_bo_isMod:=(Position:C15(","+$_t_FieldReference+","; $_at_ModifiedFields{$_l_IndexDiaryQueue})>0) | (Position:C15($_t_FieldReference+","; $_at_ModifiedFields{$_l_IndexDiaryQueue})=1) | (Position:C15(","+$_t_FieldReference; $_at_ModifiedFields{$_l_IndexDiaryQueue})=(Length:C16($_at_ModifiedFields{$_l_IndexDiaryQueue})-Length:C16(","+$_t_FieldReference))) | ($_at_ModifiedFields{$_l_IndexDiaryQueue}="")
																				If ($_bo_isMod)
																					$_bo_Match1:=False:C215
																					If ([DIARY:12]Document_Code:15=SD_at_otherSearchValues{$_l_Index}{$_l_Index2})
																						$_bo_Match1:=True:C214
																					End if 
																					If ($_bo_Match1=False:C215)
																						QUERY:C277([xDiaryRelations:137]; [xDiaryRelations:137]xDiaryID:1=[DIARY:12]x_ID:50; *)
																						QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]XRecord_Code:5=SD_at_otherSearchValues{$_l_Index}{$_l_Index2}; *)
																						QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]xTableNUM:3=SD_al_SearchrelatedTables{$_l_Index}{$_l_Index2})
																						$_bo_Match2:=(Records in selection:C76([xDiaryRelations:137])>0)
																						If ($_bo_Match2=False:C215)
																							$_bo_Match:=False:C215
																						End if 
																					Else 
																						$_bo_Match:=$_bo_Match1
																					End if 
																				Else 
																					$_bo_Match:=$_bo_IsInSet
																				End if 
																				
																				
																				
																			: (SD_al_SearchrelatedTables{$_l_Index}{$_l_Index2}=Table:C252(->[JOBS:26])) & (SD_al_OtherSearchFields{$_l_Index}{$_l_Index2}=Field:C253(->[JOBS:26]Job_Code:1))
																				$_t_FieldReference:=String:C10(Field:C253(->[DIARY:12]Job_Code:19))
																				$_bo_isMod:=(Position:C15(","+$_t_FieldReference+","; $_at_ModifiedFields{$_l_IndexDiaryQueue})>0) | (Position:C15($_t_FieldReference+","; $_at_ModifiedFields{$_l_IndexDiaryQueue})=1) | (Position:C15(","+$_t_FieldReference; $_at_ModifiedFields{$_l_IndexDiaryQueue})=(Length:C16($_at_ModifiedFields{$_l_IndexDiaryQueue})-Length:C16(","+$_t_FieldReference))) | ($_at_ModifiedFields{$_l_IndexDiaryQueue}="")
																				If ($_bo_isMod)
																					$_bo_Match1:=False:C215
																					If ([DIARY:12]Job_Code:19=SD_at_otherSearchValues{$_l_Index}{$_l_Index2})
																						$_bo_Match1:=True:C214
																					End if 
																					If ($_bo_Match1=False:C215)
																						QUERY:C277([xDiaryRelations:137]; [xDiaryRelations:137]xDiaryID:1=[DIARY:12]x_ID:50; *)
																						QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]XRecord_Code:5=SD_at_otherSearchValues{$_l_Index}{$_l_Index2}; *)
																						QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]xTableNUM:3=SD_al_SearchrelatedTables{$_l_Index}{$_l_Index2})
																						$_bo_Match2:=(Records in selection:C76([xDiaryRelations:137])>0)
																						
																						If ($_bo_Match2=False:C215)
																							$_bo_Match:=False:C215
																						End if 
																					Else 
																						$_bo_Match:=$_bo_Match1
																					End if 
																					
																				Else 
																					$_bo_Match:=$_bo_IsInSet
																				End if 
																			: (SD_al_SearchrelatedTables{$_l_Index}{$_l_Index2}=Table:C252(->[ORDERS:24])) & (SD_al_OtherSearchFields{$_l_Index}{$_l_Index2}=Field:C253(->[ORDERS:24]Order_Code:3))
																				$_t_FieldReference:=String:C10(Field:C253(->[DIARY:12]Order_Code:26))
																				$_bo_isMod:=(Position:C15(","+$_t_FieldReference+","; $_at_ModifiedFields{$_l_IndexDiaryQueue})>0) | (Position:C15($_t_FieldReference+","; $_at_ModifiedFields{$_l_IndexDiaryQueue})=1) | (Position:C15(","+$_t_FieldReference; $_at_ModifiedFields{$_l_IndexDiaryQueue})=(Length:C16($_at_ModifiedFields{$_l_IndexDiaryQueue})-Length:C16(","+$_t_FieldReference))) | ($_at_ModifiedFields{$_l_IndexDiaryQueue}="")
																				If ($_bo_isMod)
																					$_bo_Match1:=False:C215
																					If ([DIARY:12]Order_Code:26=SD_at_otherSearchValues{$_l_Index}{$_l_Index2})
																						$_bo_Match1:=True:C214
																					End if 
																					If ($_bo_Match1=False:C215)
																						QUERY:C277([xDiaryRelations:137]; [xDiaryRelations:137]xDiaryID:1=[DIARY:12]x_ID:50; *)
																						QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]XRecord_Code:5=SD_at_otherSearchValues{$_l_Index}{$_l_Index2}; *)
																						QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]xTableNUM:3=SD_al_SearchrelatedTables{$_l_Index}{$_l_Index2})
																						$_bo_Match2:=(Records in selection:C76([xDiaryRelations:137])>0)
																						If ($_bo_Match2=False:C215)
																							$_bo_Match:=False:C215
																						End if 
																					Else 
																						$_bo_Match:=$_bo_Match1
																					End if 
																					
																				Else 
																					$_bo_Match:=$_bo_IsInSet
																				End if 
																			: (SD_al_SearchrelatedTables{$_l_Index}{$_l_Index2}=Table:C252(->[PRODUCTS:9])) & (SD_al_OtherSearchFields{$_l_Index}{$_l_Index2}=Field:C253(->[PRODUCTS:9]Product_Code:1))
																				$_t_FieldReference:=String:C10(Field:C253(->[DIARY:12]Product_Code:13))
																				$_bo_isMod:=(Position:C15(","+$_t_FieldReference+","; $_at_ModifiedFields{$_l_IndexDiaryQueue})>0) | (Position:C15($_t_FieldReference+","; $_at_ModifiedFields{$_l_IndexDiaryQueue})=1) | (Position:C15(","+$_t_FieldReference; $_at_ModifiedFields{$_l_IndexDiaryQueue})=(Length:C16($_at_ModifiedFields{$_l_IndexDiaryQueue})-Length:C16(","+$_t_FieldReference))) | ($_at_ModifiedFields{$_l_IndexDiaryQueue}="")
																				If ($_bo_isMod)
																					$_bo_Match1:=False:C215
																					If ([DIARY:12]Product_Code:13=SD_at_otherSearchValues{$_l_Index}{$_l_Index2})
																						$_bo_Match1:=True:C214
																					End if 
																					If ($_bo_Match1=False:C215)
																						QUERY:C277([xDiaryRelations:137]; [xDiaryRelations:137]xDiaryID:1=[DIARY:12]x_ID:50; *)
																						QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]XRecord_Code:5=SD_at_otherSearchValues{$_l_Index}{$_l_Index2}; *)
																						QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]xTableNUM:3=SD_al_SearchrelatedTables{$_l_Index}{$_l_Index2})
																						$_bo_Match2:=(Records in selection:C76([xDiaryRelations:137])>0)
																						
																						If ($_bo_Match2=False:C215)
																							$_bo_Match:=False:C215
																						End if 
																					Else 
																						$_bo_Match:=$_bo_Match1
																					End if 
																					
																				Else 
																					$_bo_Match:=$_bo_IsInSet
																				End if 
																			: (SD_al_SearchrelatedTables{$_l_Index}{$_l_Index2}=Table:C252(->[JOB_STAGES:47])) & (SD_al_OtherSearchFields{$_l_Index}{$_l_Index2}=Field:C253(->[JOB_STAGES:47]Stage_Code:2))
																				//this is a bad field...because in isolation it will find all the Job stages of a stage type... the stage records did not have a unique ident!..normally this would be used in combo with the job code field
																				$_t_FieldReference:=String:C10(Field:C253(->[DIARY:12]Stage_Code:21))
																				$_bo_isMod:=(Position:C15(","+$_t_FieldReference+","; $_at_ModifiedFields{$_l_IndexDiaryQueue})>0) | (Position:C15($_t_FieldReference+","; $_at_ModifiedFields{$_l_IndexDiaryQueue})=1) | (Position:C15(","+$_t_FieldReference; $_at_ModifiedFields{$_l_IndexDiaryQueue})=(Length:C16($_at_ModifiedFields{$_l_IndexDiaryQueue})-Length:C16(","+$_t_FieldReference))) | ($_at_ModifiedFields{$_l_IndexDiaryQueue}="")
																				If ($_bo_isMod)
																					$_bo_Match1:=False:C215
																					If ([DIARY:12]Stage_Code:21=SD_at_otherSearchValues{$_l_Index}{$_l_Index2})
																						$_bo_Match1:=True:C214
																					End if 
																					If ($_bo_Match1=False:C215)
																						QUERY:C277([xDiaryRelations:137]; [xDiaryRelations:137]xDiaryID:1=[DIARY:12]x_ID:50; *)
																						QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]XRecord_Code:5=SD_at_otherSearchValues{$_l_Index}{$_l_Index2}; *)
																						QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]xTableNUM:3=SD_al_SearchrelatedTables{$_l_Index}{$_l_Index2})
																						$_bo_Match2:=(Records in selection:C76([xDiaryRelations:137])>0)
																						If ($_bo_Match2=False:C215)
																							$_bo_Match:=False:C215
																						End if 
																					Else 
																						$_bo_Match:=$_bo_Match1
																					End if 
																					
																				Else 
																					$_bo_Match:=$_bo_IsInSet
																				End if 
																			: (SD_al_SearchrelatedTables{$_l_Index}{$_l_Index2}=Table:C252(->[xDiaryRelations:137]))
																				//Search the diary relations table
																				$_ptr_Field:=Field:C253(SD_al_SearchrelatedTables{$_l_Index}{$_l_Index2}; SD_al_OtherSearchFields{$_l_Index}{$_l_Index2})
																				$_t_FieldReference:="-"+String:C10(Field:C253($_ptr_Field))
																				//Note that when these field values are modified the stored field number is a - number
																				$_bo_isMod:=(Position:C15(","+$_t_FieldReference+","; $_at_ModifiedFields{$_l_IndexDiaryQueue})>0) | (Position:C15($_t_FieldReference+","; $_at_ModifiedFields{$_l_IndexDiaryQueue})=1) | (Position:C15(","+$_t_FieldReference; $_at_ModifiedFields{$_l_IndexDiaryQueue})=(Length:C16($_at_ModifiedFields{$_l_IndexDiaryQueue})-Length:C16(","+$_t_FieldReference))) | ($_at_ModifiedFields{$_l_IndexDiaryQueue}="")
																				
																				If ($_bo_isMod)
																					$_ptr_Field:=Field:C253(SD_al_SearchrelatedTables{$_l_Index}{$_l_Index2}; SD_al_OtherSearchFields{$_l_Index}{$_l_Index2})
																					$_l_DataType:=Type:C295($_ptr_Field->)
																					QUERY:C277([xDiaryRelations:137]; [xDiaryRelations:137]xDiaryID:1=[DIARY:12]x_ID:50)
																					Case of 
																						: ($_l_DataType=Is alpha field:K8:1) | ($_l_DataType=Is text:K8:3)
																							QUERY SELECTION:C341([xDiaryRelations:137]; $_ptr_Field->=SD_at_otherSearchValues{$_l_Index}{$_l_Index2})
																						: ($_l_DataType=Is longint:K8:6) | ($_l_DataType=Is integer:K8:5) | ($_l_DataType=Is real:K8:4)
																							QUERY SELECTION:C341([xDiaryRelations:137]; $_ptr_Field->=Num:C11(SD_at_otherSearchValues{$_l_Index}{$_l_Index2}))
																						: ($_l_DataType=Is boolean:K8:9)
																							QUERY SELECTION:C341([xDiaryRelations:137]; $_ptr_Field->=(SD_at_otherSearchValues{$_l_Index}{$_l_Index2}="TRUE"))
																						: ($_l_DataType=Is time:K8:8)
																							QUERY SELECTION:C341([xDiaryRelations:137]; $_ptr_Field->=Time:C179(Time string:C180(Num:C11(<>SD_at_otherSearchValues{$_l_Index}{$_l_Index2}))))  // Make sure that where this was saved it was turned into a number!
																						: ($_l_DataType=Is date:K8:7)
																							QUERY SELECTION:C341([xDiaryRelations:137]; $_ptr_Field->=Date:C102(SD_at_otherSearchValues{$_l_Index}{$_l_Index2}))  // Make sure that where this was saved it was turned into a number!
																					End case 
																					If (Records in selection:C76([xDiaryRelations:137])=0)
																						$_bo_Match:=False:C215
																					End if 
																				Else 
																					$_bo_Match:=$_bo_IsInSet
																				End if 
																				
																			Else 
																				$_ptr_Table:=Table:C252(SD_al_SearchrelatedTables{$_l_Index}{$_l_Index2})
																				$_ptr_Field:=Field:C253(SD_al_SearchrelatedTables{$_l_Index}{$_l_Index2}; SD_al_OtherSearchFields{$_l_Index}{$_l_Index2})
																				$_l_DataType:=Type:C295($_ptr_Field->)
																				Case of 
																					: ($_l_DataType=Is alpha field:K8:1) | ($_l_DataType=Is text:K8:3)
																						QUERY:C277($_ptr_Table->; $_ptr_Field->=SD_at_otherSearchValues{$_l_Index}{$_l_Index2})
																					: ($_l_DataType=Is longint:K8:6) | ($_l_DataType=Is integer:K8:5) | ($_l_DataType=Is real:K8:4)
																						QUERY:C277($_ptr_Table->; $_ptr_Field->=Num:C11(SD_at_otherSearchValues{$_l_Index}{$_l_Index2}))
																					: ($_l_DataType=Is boolean:K8:9)
																						QUERY:C277($_ptr_Table->; $_ptr_Field->=(SD_at_otherSearchValues{$_l_Index}{$_l_Index2}="TRUE"))
																					: ($_l_DataType=Is time:K8:8)
																						QUERY:C277($_ptr_Table->; $_ptr_Field->=Time:C179(Time string:C180(Num:C11(SD_at_otherSearchValues{$_l_Index}{$_l_Index2}))))  // Make sure that where this was saved it was turned into a number!
																					: ($_l_DataType=Is date:K8:7)
																						QUERY:C277($_ptr_Table->; $_ptr_Field->=Date:C102(SD_at_otherSearchValues{$_l_Index}{$_l_Index2}))  // Make sure that where this was saved it was turned into a number!
																					: ($_l_DataType=Is subtable:K8:11)
																						//The text will need to contain the field name to search+the value
																						$_l_characterPosition:=Position:C15(";"; SD_at_otherSearchValues{$_l_Index}{$_l_Index2})
																						If ($_l_characterPosition>0)
																							$_t_FieldName:=Substring:C12(SD_at_otherSearchValues{$_l_Index}{$_l_Index2}; 1; $_l_characterPosition-1)
																							$_t_FieldValue:=Substring:C12(SD_at_otherSearchValues{$_l_Index}{$_l_Index2}; $_l_characterPosition+1; Length:C16(SD_at_otherSearchValues{$_l_Index}{$_l_Index2}))
																							SD2_QuerySubtable(SD_al_SearchrelatedTables{$_l_Index}{$_l_Index2}; SD_al_OtherSearchFields{$_l_Index}{$_l_Index2}; $_t_FieldName; $_t_FieldValue)
																						End if 
																				End case 
																				//This gives a selection of records in the 'source' table
																				$_l_FieldNumber:=SD2_GetIDFieldNum(SD_al_SearchrelatedTables{$_l_Index}{$_l_Index2})
																				If ($_l_FieldNumber>0)  //it should be or the item cannot be related to the diary
																					//This gives us the id field number
																					$_ptr_Field:=Field:C253(SD_al_SearchrelatedTables{$_l_Index}{$_l_Index2}; $_l_FieldNumber)
																					ARRAY LONGINT:C221($_al_RecordIdents; 0)
																					
																					SELECTION TO ARRAY:C260($_ptr_Field->; $_al_RecordIdents)
																					
																					For ($_l_Index; 1; Size of array:C274($_al_RecordIdents))
																						//now build a list of 'ids for the
																						$_al_RecordIdents{$_l_IndexDiaryQueue}:=Num:C11("1"+(String:C10(<>SD_al_SearchrelatedTables{$_l_Index}{$_l_Index2}; "0000"))+(String:C10($_al_RecordIdents{$_l_Index}; "000000000")))
																					End for 
																					QUERY WITH ARRAY:C644([xDiaryRelations:137]XRelationNUM:2; $_al_RecordIdents)
																					QUERY SELECTION:C341([xDiaryRelations:137]; [xDiaryRelations:137]xDiaryID:1=[DIARY:12]x_ID:50)
																					If (Records in selection:C76([xDiaryRelations:137])=0)
																						$_bo_Match:=False:C215
																					End if 
																					//This gives us the diary  records related.
																				Else 
																					
																				End if 
																				
																				
																		End case 
																		//````
																		If ($_bo_Match=False:C215)  //Break out no point in testing further
																			$_l_Index2:=999999
																		End if 
																	End for 
																Else 
																	$_bo_Match:=True:C214  // relationships not included
																End if 
															End if 
															
														End if 
													End if 
												End if 
											End if 
										End if 
									End if 
								End if 
							End if 
						End if 
						
						
						If ($_bo_Match)
							If (Not:C34($_bo_IsInSet))
								//add it into the array
								While (Semaphore:C143("SD_CheckSets"))
									DelayTicks(2)
								End while 
								
								APPEND TO ARRAY:C911(<>SD_al_DiarySets{$_l_IndexDiaryQueue}; Record number:C243([DIARY:12]))
								CLEAR SEMAPHORE:C144("SD_CheckSets")
							End if 
						Else 
							//it does not match
							If ($_bo_IsInSet)
								While (Semaphore:C143("SD_CheckSets"))
									DelayTicks(2)
								End while 
								$_l_RecordPosition:=Find in array:C230(<>SD_al_DiarySets{$_l_IndexDiaryQueue}; Record number:C243([DIARY:12]))
								If ($_l_RecordPosition>0)  //it should be
									DELETE FROM ARRAY:C228(<>SD_al_DiarySets{$_l_IndexDiaryQueue}; $_l_RecordPosition)
								End if 
								CLEAR SEMAPHORE:C144("SD_CheckSets")
								//Take it out of the array
							End if 
						End if 
						
						
						//Now delete this item from the ◊SD_al_aDiaryQueue
						While (Semaphore:C143("SD_CheckSets"))
							DelayTicks(2)
						End while 
						$_l_RecordPosition:=Find in array:C230(<>SD_al_aDiaryQueue; $_al_aDiaryQueues{$_l_IndexDiaryQueue})
						If ($_l_RecordPosition>0)
							<>SD_al_aDiaryQueue{$_l_RecordPosition}:=-1
						End if 
						CLEAR SEMAPHORE:C144("SD_CheckSets")
					End if 
					CLEAR SEMAPHORE:C144("UpdateSet_"+String:C10(<>SD_al_SetIDs{$_l_Index}))
				End for 
				
			End if 
		End for 
		
	End if 
	
	//Here clear any deletions from the sets
	//And then clear any that have not been requested for over x hours the amount of time to keep a set in memory is to be determined by the amount of RAm on the server
	// and by calculating how long it is taking to monitor the sets.
	
	$_l_TickCountNow:=Tickcount:C458
	$_l_TickMax:=$_l_TickCountNow-$_l_TickCount
	If (($_l_TickCountNow-$_l_TickCount)>$_l_TickMax)
		//Taking too long
		$_l_MaxSize:=(Size of array:C274(<>SD_al_SetIDs))-1
	End if 
	If ($_l_MaxSize<Size of array:C274(<>SD_al_SetIds))
		While (Semaphore:C143("SD_CheckSets"))
			DelayTicks(2)
		End while 
		ARRAY LONGINT:C221($_al_Age; Size of array:C274(<>SD_ad_LastRequest))
		For ($_l_indexDates; 1; Size of array:C274(<>SD_ad_LastRequest))
			$_l_NumberofDays:=Current date:C33(*)-<>SD_ad_LastRequest{$_l_indexDates}
			If ($_l_NumberofDays=0)
				$_l_TimeAmount:=(Current time:C178(*)*1)-<>SD_al_LastRequestTime{$_l_indexDates}
			Else 
				$_l_TimeAmount:=((?24:00:00?*1)-<>SD_al_LastRequestTime{$_l_indexDates})+((?24:00:00?*1)*$_l_NumberofDays)
			End if 
			$_al_Age{$_l_indexDates}:=$_l_TimeAmount
		End for 
		SORT ARRAY:C229($_al_Age; <>SD_al_LastRequestTime; <>SD_ad_LastRequest; <>SD_abo_setInitialized; SD_at_othersearchConj; SD_at_otherSearchValues; SD_al_OtherSearchFields; SD_at_PreferenceStatusCodes; SD_at_PreferenceResultCodes; SD_at_PreferenceactionCodes; <>SD_al_SetIDs; SD_al_IncludeDocs; SD_al_SetPersonIDs; SD_al_PersonOptions; SD_ad_SetDateFrom; SD_ad_SetDateTo; SD_al_SetDoneStamp; SD_al_SetPriorityValue; SD_al_TimeFrom; SD_al_TimeTo; <)
		//That puts the oldest at the bottom
		//The one D can just be resized
		
		ARRAY LONGINT:C221(<>SD_al_SetIDs; $_l_MaxSize)
		ARRAY LONGINT:C221(SD_al_IncludeDocs; $_l_MaxSize)
		$_l_DeleteSize:=Size of array:C274(SD_al_SetPersonIDs)-$_l_MaxSize
		$_l_CurrentSize:=Size of array:C274(SD_al_SetPersonIDs)
		DELETE FROM ARRAY:C228(SD_al_SetPersonIDs; $_l_CurrentSize; $_l_DeleteSize)
		DELETE FROM ARRAY:C228(SD_al_SetPersonIDs; $_l_CurrentSize; $_l_DeleteSize)
		ARRAY LONGINT:C221(SD_al_PersonOptions; $_l_MaxSize)
		ARRAY DATE:C224(SD_ad_SetDateFrom; $_l_MaxSize)
		ARRAY DATE:C224(SD_ad_SetDateTo; $_l_MaxSize)
		ARRAY LONGINT:C221(SD_al_SetDoneStamp; $_l_MaxSize)
		ARRAY LONGINT:C221(SD_al_SetPriorityValue; $_l_MaxSize)
		ARRAY LONGINT:C221(SD_al_TimeFrom; $_l_MaxSize)
		ARRAY LONGINT:C221(SD_al_TimeTo; $_l_MaxSize)
		DELETE FROM ARRAY:C228(SD_at_PreferenceactionCodes; $_l_CurrentSize; $_l_DeleteSize)
		DELETE FROM ARRAY:C228(SD_at_PreferenceResultCodes; $_l_CurrentSize; $_l_DeleteSize)  //Note searching by result is pointless unless we are including done items!
		DELETE FROM ARRAY:C228(SD_at_PreferenceStatusCodes; $_l_CurrentSize; $_l_DeleteSize)
		DELETE FROM ARRAY:C228(SD_al_SearchrelatedTables; $_l_CurrentSize; $_l_DeleteSize)  //Search xdiary relations or actions
		DELETE FROM ARRAY:C228(SD_al_OtherSearchFields; $_l_CurrentSize; $_l_DeleteSize)  // field number to search-Note with actions this can be used to find actions with a property
		DELETE FROM ARRAY:C228(SD_at_otherSearchValues; $_l_CurrentSize; $_l_DeleteSize)
		DELETE FROM ARRAY:C228(SD_at_othersearchConj; $_l_CurrentSize; $_l_DeleteSize)
		ARRAY BOOLEAN:C223(<>SD_abo_setInitialized; $_l_MaxSize)
		ARRAY DATE:C224(<>SD_ad_LastRequest; $_l_MaxSize)
		ARRAY LONGINT:C221(<>SD_al_LastRequestTime; $_l_MaxSize)
		// now update the record
		UNLOAD RECORD:C212([PREFERENCES:116])
		
		READ WRITE:C146([PREFERENCES:116])
		QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
		SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
		VARIABLE TO BLOB:C532(SD_al_SetIDs; [PREFERENCES:116]DataBlob:2; *)
		For ($_l_Index; 1; Size of array:C274(SD_al_SetIDs))
			VARIABLE TO BLOB:C532(SD_al_SetPersonIDs{$_l_Index}; [PREFERENCES:116]DataBlob:2; *)
		End for 
		VARIABLE TO BLOB:C532(SD_al_PersonOptions; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(SD_al_IncludeDocs; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(SD_ad_SetDateFrom; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(SD_ad_SetDateTo; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(SD_al_SetDoneStamp; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(SD_al_SetPriorityValue; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(SD_al_TimeFrom; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(SD_al_TimeTo; [PREFERENCES:116]DataBlob:2; *)
		For ($_l_Index; 1; Size of array:C274(SD_al_SetIDs))
			VARIABLE TO BLOB:C532(SD_at_PreferenceactionCodes{$_l_Index}; [PREFERENCES:116]DataBlob:2; *)
		End for 
		For ($_l_Index; 1; Size of array:C274(SD_al_SetIDs))
			VARIABLE TO BLOB:C532(SD_at_PreferenceResultCodes{$_l_Index}; [PREFERENCES:116]DataBlob:2; *)
		End for 
		For ($_l_Index; 1; Size of array:C274(SD_al_SetIDs))
			VARIABLE TO BLOB:C532(SD_at_PreferenceStatusCodes{$_l_Index}; [PREFERENCES:116]DataBlob:2; *)
		End for 
		For ($_l_Index; 1; Size of array:C274(SD_al_SetIDs))
			VARIABLE TO BLOB:C532(SD_al_SearchrelatedTables{$_l_Index}; [PREFERENCES:116]DataBlob:2; *)
		End for 
		For ($_l_Index; 1; Size of array:C274(SD_al_SetIDs))
			VARIABLE TO BLOB:C532(SD_al_OtherSearchFields{$_l_Index}; [PREFERENCES:116]DataBlob:2; *)
		End for 
		For ($_l_Index; 1; Size of array:C274(SD_al_SetIDs))
			VARIABLE TO BLOB:C532(SD_at_otherSearchValues{$_l_Index}; [PREFERENCES:116]DataBlob:2; *)
		End for 
		For ($_l_Index; 1; Size of array:C274(SD_al_SetIDs))
			VARIABLE TO BLOB:C532(SD_at_othersearchConj{$_l_Index}; [PREFERENCES:116]DataBlob:2; *)
		End for 
		//NOTE this array is ignored on the server side
		DB_SaveRecord(->[PREFERENCES:116])
		UNLOAD RECORD:C212([PREFERENCES:116])
		READ ONLY:C145([PREFERENCES:116])
		CLEAR SEMAPHORE:C144("SD_CheckSets")
	End if 
	//CLEAR SEMAPHORE("SD_CheckSets")
	If (Not:C34(<>SYS_bo_QuitCalled))
		PAUSE PROCESS:C319(Current process:C322)
	End if 
	$_l_TickCount:=Tickcount:C458
	//This process is resumed either be a c lient  requesting a set or by a diary record being updated.
	If (Current date:C33(*)>$SD_d_CurrentDate)
		//PROGRESS 'TODAY' DIARY SETS to keept them current
	End if 
	
	
Until (<>SYS_bo_QuitCalled)
ERR_MethodTrackerReturn("SD_SetsMonitor"; $_t_oldMethodName)
