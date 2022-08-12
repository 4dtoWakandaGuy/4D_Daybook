//%attributes = {}

If (False:C215)
	//Project Method Name:      SD3_FindDiaryRecordsByAttribute
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  02/01/2020
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_DiaryGroupIDS; 0)
	ARRAY LONGINT:C221($_al_GroupPropertyTypes; 0)
	ARRAY LONGINT:C221($_al_PropertyTypes; 0)
	ARRAY LONGINT:C221($_al_Tables; 0)
	ARRAY LONGINT:C221($_al_ThreadIDS; 0)
	ARRAY REAL:C219($_ar_Range; 0)
	ARRAY REAL:C219($_ar_Rates; 0)
	ARRAY REAL:C219($_ar_Units; 0)
	ARRAY REAL:C219($_ar_Values; 0)
	ARRAY TEXT:C222($_at_ActionCodes; 0)
	ARRAY TEXT:C222($_at_CampaignUUIDS; 0)
	ARRAY TEXT:C222($_at_Codes; 0)
	ARRAY TEXT:C222($_at_DiaryCodes; 0)
	ARRAY TEXT:C222($_at_DiaryItemOwners; 0)
	ARRAY TEXT:C222($_at_DocumentCodes; 0)
	ARRAY TEXT:C222($_at_EmailAddresses; 0)
	ARRAY TEXT:C222($_at_EmailHeadings; 0)
	ARRAY TEXT:C222($_at_EmailSContents; 0)
	ARRAY TEXT:C222($_at_EmailStates; 0)
	ARRAY TEXT:C222($_at_EmailSubjects; 0)
	ARRAY TEXT:C222($_at_GroupProperties; 0)
	ARRAY TEXT:C222($_at_OwnedDiaryRecords; 0)
	ARRAY TEXT:C222($_at_Priorities; 0)
	ARRAY TEXT:C222($_at_PropertyNames; 0)
	ARRAY TEXT:C222($_at_RelatedCodes; 0)
	ARRAY TEXT:C222($_at_ResultCodes; 0)
	C_BOOLEAN:C305($_bo_Actioned; $_bo_DoAllDay; $_bo_Done; $_bo_DoneAllDay; $_bo_IncludeDeleted; $_bo_Public; $_bo_TimeChecked; $_bo_WhoseDiarySet)
	C_DATE:C307($_d_FromDate)
	C_LONGINT:C283($_l_BuildCodes; $_l_GetWhoseDiary; $_l_Negate; $_l_Ref; $_l_Ref2; $_l_TableNumber; $_l_ThreadID; $_l_TimeStamp)
	C_OBJECT:C1216($_obj_Attributes; $_obj_DiaryGroups)
	C_POINTER:C301($1)
	C_REAL:C285($_r_Rate; $_r_Unit; $_r_Value)
	C_TEXT:C284($_t_actionCode; $_t_actionDetails; $_t_CampaignCode; $_t_Code; $_t_DiaryCode; $_t_DocCode; $_t_EmailContent; $_t_EmailFrom; $_t_EmailHeading; $_t_EmailSubject; $_t_Priority)
	C_TEXT:C284($_t_RelatedCode; $_t_ResultCode; $_t_ResultDetails; $_t_Status)
	C_TIME:C306($_ti_FromTime)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("SD3_FindDiaryRecordsByAttribute")
$_obj_Attributes:=$1->

OB GET PROPERTY NAMES:C1232($_obj_Attributes; $_at_PropertyNames; $_al_PropertyTypes)
CREATE EMPTY SET:C140([DIARY:12]; "$ResultingSelection")
$_l_Ref:=Find in array:C230($_at_PropertyNames; "WhoseDiary")
$_l_Ref2:=Find in array:C230($_at_PropertyNames; "DiaryGroups")

If ($_l_Ref>0)
	CREATE EMPTY SET:C140([DIARY:12]; "$WhoseDiary")
	$_bo_WhoseDiarySet:=True:C214
	OB GET ARRAY:C1229($_obj_Attributes; "WhoseDiary"; $_at_DiaryItemOwners)
	For ($_l_GetWhoseDiary; 1; Size of array:C274($_at_DiaryItemOwners))
		QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=$_at_DiaryItemOwners{$_l_GetWhoseDiary})
		If (Records in selection:C76([PERSONNEL:11])>0)
			QUERY:C277([DIARY_ITEMOWNERS:106]; [DIARY_ITEMOWNERS:106]PERSONNEL_ID:2=[PERSONNEL:11]Personnel_ID:48)
			//QUERY([DIARY_ITEMOWNERS]; & ;[DIARY_ITEMOWNERS]RELATIONSHIP_CLASSID=1)
		Else 
			QUERY:C277([PERSONNEL_GROUPS:92]; [PERSONNEL_GROUPS:92]Group_Code:1=$_at_DiaryItemOwners{$_l_GetWhoseDiary})
			QUERY:C277([DIARY_ITEMOWNERS:106]; [DIARY_ITEMOWNERS:106]PERSONNEL_ID:2=-([PERSONNEL_GROUPS:92]x_ID:12))
			//QUERY([DIARY_ITEMOWNERS]; & ;[DIARY_ITEMOWNERS]RELATIONSHIP_CLASSID=1)
		End if 
		
		If (Records in selection:C76([DIARY_ITEMOWNERS:106])>0)
			SELECTION TO ARRAY:C260([DIARY_ITEMOWNERS:106]DIARY_CODE:1; $_at_OwnedDiaryRecords)
			QUERY WITH ARRAY:C644([DIARY:12]Person:8; $_at_OwnedDiaryRecords)
			CREATE SET:C116([DIARY:12]; "$Set1")
			QUERY:C277([DIARY:12]; [DIARY:12]Person:8=$_at_DiaryItemOwners{$_l_GetWhoseDiary})
			CREATE SET:C116([DIARY:12]; "$set2")
			UNION:C120("$Set1"; "$Set2"; "$Set1")
			USE SET:C118("$set1")
		Else 
			QUERY:C277([DIARY:12]; [DIARY:12]Person:8=$_at_DiaryItemOwners{$_l_GetWhoseDiary})
			CREATE SET:C116([DIARY:12]; "$Set1")
		End if 
		UNION:C120("$Set1"; "$WhoseDiary"; "$WhoseDiary")
	End for 
	If ($_l_Ref2>0)
		$_obj_DiaryGroups:=OB Get:C1224($_obj_Attributes; "DiaryGroups")
		OB GET PROPERTY NAMES:C1232($_obj_DiaryGroups; $_at_GroupProperties; $_al_GroupPropertyTypes)
		$_l_ref:=Find in array:C230($_at_GroupProperties; "DiaryGroupIDS")
		If ($_l_ref>0)
			OB GET ARRAY:C1229($_obj_DiaryGroups; "DiaryGroupIDS"; $_al_DiaryGroupIDS)
			If (Size of array:C274($_al_DiaryGroupIDS)>0)
				For ($_l_Negate; 1; Size of array:C274($_al_DiaryGroupIDS))
					$_al_DiaryGroupIDS{$_l_Negate}:=-$_al_DiaryGroupIDS{$_l_Negate}
				End for 
				QUERY WITH ARRAY:C644([DIARY_ITEMOWNERS:106]PERSONNEL_ID:2; $_al_DiaryGroupIDS)
				SELECTION TO ARRAY:C260([DIARY_ITEMOWNERS:106]DIARY_CODE:1; $_at_OwnedDiaryRecords)
				QUERY WITH ARRAY:C644([DIARY:12]Diary_Code:3; $_at_OwnedDiaryRecords)
				CREATE SET:C116([DIARY:12]; "$Set1")
				UNION:C120("$Set1"; "$WhoseDiary"; "$WhoseDiary")
				USE SET:C118("$WhoseDiary")
			End if 
			
		End if 
	End if 
	
	If (Records in set:C195("$ResultingSelection")=0)  //at the moment this is the first search so it should always be 0 but i am putting this so if something is put before this bit it will still work
		UNION:C120("$ResultingSelection"; "$WhoseDiary"; "$ResultingSelection")
	Else 
		INTERSECTION:C121("$ResultingSelection"; "$WhoseDiary"; "$ResultingSelection")
		
	End if 
	
End if 

$_l_Ref:=Find in array:C230($_at_PropertyNames; "FromDate")
If ($_l_Ref>0)
	$_d_FromDate:=SD3_ObjectStringtoDate(OB Get:C1224($_obj_Attributes; "FromDate"))
	
	$_l_Ref2:=Find in array:C230($_at_PropertyNames; "FromTime")
	If ($_l_Ref2>0)
		//note here we dont search date and time fields else we get everything after the time on days subsequent but not at earlier times on days subsequent which of course is wrong- 
		///its everything after time x on date y..so we get the time stamp of time and date y x and its everything that has a timestamp after that
		$_ti_FromTime:=SD3_ObjectRealtoTime(OB Get:C1224($_obj_Attributes; "FromTime"))
		$_l_TimeStamp:=GEN_TimeDateStamp($_d_FromDate; $_ti_FromTime)
		QUERY:C277([DIARY:12]; [DIARY:12]Date_Time_Stamp:45>=$_l_TimeStamp)
		CREATE SET:C116([DIARY:12]; "$FoundRecords")
		If (Records in set:C195("$ResultingSelection")=0)
			UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
		Else 
			INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
			
		End if 
	Else 
		//note here that we use the display date-so that is either the done date or the do date depending on whether it is a done item or not
		QUERY:C277([DIARY:12]; [DIARY:12]Display_Date_From:51>=$_d_FromDate)
		CREATE SET:C116([DIARY:12]; "$FoundRecords")
		If (Records in set:C195("$ResultingSelection")=0)
			UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
		Else 
			INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
			
		End if 
	End if 
Else 
	$_l_Ref2:=Find in array:C230($_at_PropertyNames; "FromTime")
	
	//this would be odd but its still possible(everything after time x on all days?)
	If ($_l_Ref2>0)
		$_ti_FromTime:=SD3_ObjectRealtoTime(OB Get:C1224($_obj_Attributes; "FromTime"))
		
		QUERY:C277([DIARY:12]; [DIARY:12]Display_Time_From:53>=$_ti_FromTime)
		CREATE SET:C116([DIARY:12]; "$FoundRecords")
		If (Records in set:C195("$ResultingSelection")=0)
			UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
		Else 
			INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
			
		End if 
		
	End if 
End if 
/////
$_l_Ref:=Find in array:C230($_at_PropertyNames; "ToDate")
If ($_l_Ref>0)
	$_d_FromDate:=SD3_ObjectStringtoDate(OB Get:C1224($_obj_Attributes; "ToDate"))
	
	$_l_Ref2:=Find in array:C230($_at_PropertyNames; "ToTime")
	If ($_l_Ref2>0)
		//note here we dont search date and time fields else we get everything BEFORE the time on days subsequent but not at earlier times on days previous which of course is wrong- 
		///its everything before time x on date y..so we get the time stamp of time and date y x and its everything that has a timestamp before that
		$_ti_FromTime:=SD3_ObjectRealtoTime(OB Get:C1224($_obj_Attributes; "ToTime"))
		$_l_TimeStamp:=GEN_TimeDateStamp($_d_FromDate; $_ti_FromTime)
		QUERY:C277([DIARY:12]; [DIARY:12]Date_Time_Stamp:45<=$_l_TimeStamp)
		CREATE SET:C116([DIARY:12]; "$FoundRecords")
		If (Records in set:C195("$ResultingSelection")=0)
			UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
		Else 
			INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
			
		End if 
	Else 
		//note here that we use the display date-so that is either the done date or the do date depending on whether it is a done item or not
		QUERY:C277([DIARY:12]; [DIARY:12]Display_Date_From:51<=$_d_FromDate)
		CREATE SET:C116([DIARY:12]; "$FoundRecords")
		If (Records in set:C195("$ResultingSelection")=0)
			UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
		Else 
			INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
			
		End if 
	End if 
Else 
	$_l_Ref2:=Find in array:C230($_at_PropertyNames; "ToTime")
	
	//this would be odd but its still possible(everything before time x on all days?)
	If ($_l_Ref2>0)
		$_ti_FromTime:=SD3_ObjectRealtoTime(OB Get:C1224($_obj_Attributes; "ToTime"))
		
		QUERY:C277([DIARY:12]; [DIARY:12]Display_Time_From:53<=$_ti_FromTime)
		CREATE SET:C116([DIARY:12]; "$FoundRecords")
		If (Records in set:C195("$ResultingSelection")=0)
			UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
		Else 
			INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
			
		End if 
		
	End if 
End if 
$_l_Ref:=Find in array:C230($_at_PropertyNames; "ActionCodes")
If ($_l_Ref>0)
	OB GET ARRAY:C1229($_obj_Attributes; "ActionCodes"; $_at_ActionCodes)
	QUERY WITH ARRAY:C644([DIARY:12]Action_Code:9; $_at_ActionCodes)
	CREATE SET:C116([DIARY:12]; "$FoundRecords")
	If (Records in set:C195("$ResultingSelection")=0)
		UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
	Else 
		INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
	End if 
Else 
	$_l_Ref:=Find in array:C230($_at_PropertyNames; "ActionCode")
	If ($_l_Ref>0)
		$_t_actionCode:=OB Get:C1224($_obj_Attributes; "ActionCode")
		If ($_t_actionCode#"")
			QUERY:C277([DIARY:12]; [DIARY:12]Action_Code:9=$_t_actionCode)
			CREATE SET:C116([DIARY:12]; "$FoundRecords")
			If (Records in set:C195("$ResultingSelection")=0)
				UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
			Else 
				INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
			End if 
		End if 
	End if 
	
	
End if 
$_l_Ref:=Find in array:C230($_at_PropertyNames; "ActionDetails")
//this would be slightly odd-but note is we do want to search by action details and wildcard should be embedded in the search string already
If ($_l_Ref>0)
	$_t_actionDetails:=OB Get:C1224($_obj_Attributes; "ActionDetails")
	If ($_t_actionDetails#"")
		QUERY:C277([DIARY:12]; [DIARY:12]Action_Details:10=$_t_actionDetails)
		CREATE SET:C116([DIARY:12]; "$FoundRecords")
		If (Records in set:C195("$ResultingSelection")=0)
			UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
		Else 
			INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
		End if 
	End if 
End if 

$_l_Ref:=Find in array:C230($_at_PropertyNames; "ResultCodes")
If ($_l_Ref>0)
	OB GET ARRAY:C1229($_obj_Attributes; "ResultCodes"; $_at_ResultCodes)
	QUERY WITH ARRAY:C644([DIARY:12]Result_Code:11; $_at_ResultCodes)
	CREATE SET:C116([DIARY:12]; "$FoundRecords")
	If (Records in set:C195("$ResultingSelection")=0)
		UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
	Else 
		INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
	End if 
Else 
	$_l_Ref:=Find in array:C230($_at_PropertyNames; "ResultCode")
	If ($_l_Ref>0)
		$_t_ResultCode:=OB Get:C1224($_obj_Attributes; "ResultCode")
		If ($_t_ResultCode#"")
			QUERY:C277([DIARY:12]; [DIARY:12]Result_Code:11=$_t_ResultCode)
			CREATE SET:C116([DIARY:12]; "$FoundRecords")
			If (Records in set:C195("$ResultingSelection")=0)
				UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
			Else 
				INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
			End if 
		End if 
	End if 
	
	
End if 
$_l_Ref:=Find in array:C230($_at_PropertyNames; "ResultDetails")
//this would be slightly odd-but note is we do want to search by action details and wildcard should be embedded in the search string already
If ($_l_Ref>0)
	$_t_ResultDetails:=OB Get:C1224($_obj_Attributes; "ResultDetails")
	If ($_t_ResultDetails#"")
		QUERY:C277([DIARY:12]; [DIARY:12]Result_Description:12=$_t_ResultDetails)
		CREATE SET:C116([DIARY:12]; "$FoundRecords")
		If (Records in set:C195("$ResultingSelection")=0)
			UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
		Else 
			INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
		End if 
	End if 
End if 
//RELATIONSHIPS..(RELATED RECORDS) SO THERE are several possibilities here. Generally we might be picking up records related to a given single record.
//to keep things simple and complicated at the same time i am going to support packing context specific or wider relations.
//BookingCodes BookingCode
//CallCodes CallCode
//CompanyCodes CompanyCode
//ContactCodes ContactCode
//EventCodes EventCode
//JobCodes JobCode
//OrderCodes OrderCode
//ProductCodes ProductCode
//StageCodes StageCode
//Or
//RelatedTables RelatedTable with RelatedRecords or RelatedRecord(more ideal if you want say order and product for example
$_l_Ref:=Find in array:C230($_at_PropertyNames; "BookingCodes")
If ($_l_Ref>0)
	OB GET ARRAY:C1229($_obj_Attributes; "BookingCodes"; $_at_Codes)
	QUERY WITH ARRAY:C644([DIARY:12]Booking_Code:27; $_at_Codes)
	CREATE SET:C116([DIARY:12]; "$FoundRecords")
	If (Records in set:C195("$ResultingSelection")=0)
		UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
	Else 
		INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
	End if 
Else 
	$_l_Ref:=Find in array:C230($_at_PropertyNames; "BookingCode")
	If ($_l_Ref>0)
		$_t_Code:=OB Get:C1224($_obj_Attributes; "BookingCode")
		If ($_t_Code#"")
			QUERY:C277([DIARY:12]; [DIARY:12]Booking_Code:27=$_t_Code)
			CREATE SET:C116([DIARY:12]; "$FoundRecords")
			If (Records in set:C195("$ResultingSelection")=0)
				UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
			Else 
				INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
			End if 
		End if 
	Else 
		
	End if 
	
	
End if 
$_l_Ref:=Find in array:C230($_at_PropertyNames; "CallCodes")
If ($_l_Ref>0)
	OB GET ARRAY:C1229($_obj_Attributes; "CallCodes"; $_at_Codes)
	If (Size of array:C274($_at_Codes)>0)
		QUERY WITH ARRAY:C644([DIARY:12]Call_Code:25; $_at_Codes)
		
		CREATE SET:C116([DIARY:12]; "$FoundRecords")
		If (Records in set:C195("$ResultingSelection")=0)
			UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
		Else 
			INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
		End if 
	End if 
Else 
	$_l_Ref:=Find in array:C230($_at_PropertyNames; "CallCode")
	If ($_l_Ref>0)
		$_t_Code:=OB Get:C1224($_obj_Attributes; "CallCode")
		If ($_t_Code#"")
			QUERY:C277([DIARY:12]; [DIARY:12]Call_Code:25=$_t_Code)
			CREATE SET:C116([DIARY:12]; "$FoundRecords")
			If (Records in set:C195("$ResultingSelection")=0)
				UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
			Else 
				INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
			End if 
		End if 
	Else 
		$_l_Ref:=Find in array:C230($_at_PropertyNames; "RelatedTables")
		If ($_l_Ref>0)
			OB GET ARRAY:C1229($_obj_Attributes; "RelatedTables"; $_al_Tables)
			OB GET ARRAY:C1229($_obj_Attributes; "RelatedCodes"; $_at_RelatedCodes)
			ARRAY TEXT:C222($_at_Codes; 0)
			For ($_l_BuildCodes; 1; Size of array:C274($_al_Tables))
				If ($_al_Tables{$_l_BuildCodes}=Table:C252(->[SERVICE_CALLS:20]))
					APPEND TO ARRAY:C911($_at_Codes; $_at_RelatedCodes{$_l_BuildCodes})
				End if 
			End for 
			If (Size of array:C274($_at_Codes)>0)
				QUERY WITH ARRAY:C644([DIARY:12]Call_Code:25; $_at_Codes)
				CREATE SET:C116([DIARY:12]; "$FoundRecords")
				If (Records in set:C195("$ResultingSelection")=0)
					UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
				Else 
					INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
				End if 
				
			End if 
			
		Else 
			$_l_Ref:=Find in array:C230($_at_PropertyNames; "RelatedTable")
			If ($_l_Ref>0)
				$_l_TableNumber:=OB Get:C1224($_obj_Attributes; "RelatedTable")
				$_t_RelatedCode:=OB Get:C1224($_obj_Attributes; "RelatedCode")
				If ($_l_TableNumber=Table:C252(->[SERVICE_CALLS:20]))
					If ($_t_RelatedCode#"")
						QUERY:C277([DIARY:12]; [DIARY:12]Call_Code:25=$_t_RelatedCode)
						CREATE SET:C116([DIARY:12]; "$FoundRecords")
						If (Records in set:C195("$ResultingSelection")=0)
							UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
						Else 
							INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
						End if 
						
					End if 
				End if 
			End if 
		End if 
		
	End if 
	
	
End if 
$_l_Ref:=Find in array:C230($_at_PropertyNames; "CompanyCodes")
If ($_l_Ref>0)
	OB GET ARRAY:C1229($_obj_Attributes; "CompanyCodes"; $_at_Codes)
	QUERY WITH ARRAY:C644([DIARY:12]Company_Code:1; $_at_Codes)
	CREATE SET:C116([DIARY:12]; "$FoundRecords")
	If (Records in set:C195("$ResultingSelection")=0)
		UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
	Else 
		INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
	End if 
Else 
	$_l_Ref:=Find in array:C230($_at_PropertyNames; "CompanyCode")
	If ($_l_Ref>0)
		$_t_Code:=OB Get:C1224($_obj_Attributes; "CompanyCode")
		If ($_t_Code#"")
			QUERY:C277([DIARY:12]; [DIARY:12]Company_Code:1=$_t_Code)
			CREATE SET:C116([DIARY:12]; "$FoundRecords")
			If (Records in set:C195("$ResultingSelection")=0)
				UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
			Else 
				INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
			End if 
		End if 
	Else 
		$_l_Ref:=Find in array:C230($_at_PropertyNames; "RelatedTables")
		If ($_l_Ref>0)
			OB GET ARRAY:C1229($_obj_Attributes; "RelatedTables"; $_al_Tables)
			OB GET ARRAY:C1229($_obj_Attributes; "RelatedCodes"; $_at_RelatedCodes)
			ARRAY TEXT:C222($_at_Codes; 0)
			For ($_l_BuildCodes; 1; Size of array:C274($_al_Tables))
				If ($_al_Tables{$_l_BuildCodes}=Table:C252(->[COMPANIES:2]))
					APPEND TO ARRAY:C911($_at_Codes; $_at_RelatedCodes{$_l_BuildCodes})
				End if 
			End for 
			If (Size of array:C274($_at_Codes)>0)
				QUERY WITH ARRAY:C644([DIARY:12]Company_Code:1; $_at_Codes)
				CREATE SET:C116([DIARY:12]; "$FoundRecords")
				If (Records in set:C195("$ResultingSelection")=0)
					UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
				Else 
					INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
				End if 
				
			End if 
			
		Else 
			$_l_Ref:=Find in array:C230($_at_PropertyNames; "RelatedTable")
			If ($_l_Ref>0)
				$_l_TableNumber:=OB Get:C1224($_obj_Attributes; "RelatedTable")
				$_t_RelatedCode:=OB Get:C1224($_obj_Attributes; "RelatedCode")
				If ($_l_TableNumber=Table:C252(->[COMPANIES:2]))
					If ($_t_RelatedCode#"")
						QUERY:C277([DIARY:12]; [DIARY:12]Company_Code:1=$_t_RelatedCode)
						CREATE SET:C116([DIARY:12]; "$FoundRecords")
						If (Records in set:C195("$ResultingSelection")=0)
							UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
						Else 
							INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
						End if 
					End if 
				End if 
			End if 
		End if 
	End if 
	
	
End if 
$_l_Ref:=Find in array:C230($_at_PropertyNames; "ContactCodes")
If ($_l_Ref>0)
	OB GET ARRAY:C1229($_obj_Attributes; "ContactCodes"; $_at_Codes)
	QUERY WITH ARRAY:C644([DIARY:12]Contact_Code:2; $_at_Codes)
	CREATE SET:C116([DIARY:12]; "$FoundRecords")
	If (Records in set:C195("$ResultingSelection")=0)
		UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
	Else 
		INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
	End if 
Else 
	$_l_Ref:=Find in array:C230($_at_PropertyNames; "ContactCode")
	If ($_l_Ref>0)
		$_t_Code:=OB Get:C1224($_obj_Attributes; "ContactCode")
		If ($_t_Code#"")
			QUERY:C277([DIARY:12]; [DIARY:12]Contact_Code:2=$_t_Code)
			CREATE SET:C116([DIARY:12]; "$FoundRecords")
			If (Records in set:C195("$ResultingSelection")=0)
				UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
			Else 
				INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
			End if 
		End if 
	Else 
		$_l_Ref:=Find in array:C230($_at_PropertyNames; "RelatedTables")
		If ($_l_Ref>0)
			OB GET ARRAY:C1229($_obj_Attributes; "RelatedTables"; $_al_Tables)
			OB GET ARRAY:C1229($_obj_Attributes; "RelatedCodes"; $_at_RelatedCodes)
			ARRAY TEXT:C222($_at_Codes; 0)
			For ($_l_BuildCodes; 1; Size of array:C274($_al_Tables))
				If ($_al_Tables{$_l_BuildCodes}=Table:C252(->[CONTACTS:1]))
					APPEND TO ARRAY:C911($_at_Codes; $_at_RelatedCodes{$_l_BuildCodes})
				End if 
			End for 
			If (Size of array:C274($_at_Codes)>0)
				QUERY WITH ARRAY:C644([DIARY:12]Contact_Code:2; $_at_Codes)
				CREATE SET:C116([DIARY:12]; "$FoundRecords")
				If (Records in set:C195("$ResultingSelection")=0)
					UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
				Else 
					INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
				End if 
				
			End if 
			
		Else 
			$_l_Ref:=Find in array:C230($_at_PropertyNames; "RelatedTable")
			If ($_l_Ref>0)
				$_l_TableNumber:=OB Get:C1224($_obj_Attributes; "RelatedTable")
				$_t_RelatedCode:=OB Get:C1224($_obj_Attributes; "RelatedCode")
				If ($_l_TableNumber=Table:C252(->[CONTACTS:1]))
					If ($_t_RelatedCode#"")
						QUERY:C277([DIARY:12]; [DIARY:12]Contact_Code:2=$_t_RelatedCode)
						CREATE SET:C116([DIARY:12]; "$FoundRecords")
						If (Records in set:C195("$ResultingSelection")=0)
							UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
						Else 
							INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
						End if 
						
					End if 
				End if 
			End if 
		End if 
		
	End if 
	
	
End if 

$_l_Ref:=Find in array:C230($_at_PropertyNames; "EventCodes")
If ($_l_Ref>0)
	OB GET ARRAY:C1229($_obj_Attributes; "EventCodes"; $_at_Codes)
	QUERY WITH ARRAY:C644([DIARY:12]Event_Code:18; $_at_Codes)
	CREATE SET:C116([DIARY:12]; "$FoundRecords")
	If (Records in set:C195("$ResultingSelection")=0)
		UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
	Else 
		INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
	End if 
Else 
	$_l_Ref:=Find in array:C230($_at_PropertyNames; "EventCode")
	If ($_l_Ref>0)
		$_t_Code:=OB Get:C1224($_obj_Attributes; "EventCode")
		If ($_t_Code#"")
			QUERY:C277([DIARY:12]; [DIARY:12]Event_Code:18=$_t_Code)
			CREATE SET:C116([DIARY:12]; "$FoundRecords")
			If (Records in set:C195("$ResultingSelection")=0)
				UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
			Else 
				INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
			End if 
		End if 
	End if 
	
	
End if 
$_l_Ref:=Find in array:C230($_at_PropertyNames; "JobCodes")
If ($_l_Ref>0)
	OB GET ARRAY:C1229($_obj_Attributes; "JobCodes"; $_at_Codes)
	QUERY WITH ARRAY:C644([DIARY:12]Job_Code:19; $_at_Codes)
	CREATE SET:C116([DIARY:12]; "$FoundRecords")
	If (Records in set:C195("$ResultingSelection")=0)
		UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
	Else 
		INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
	End if 
Else 
	$_l_Ref:=Find in array:C230($_at_PropertyNames; "JobCode")
	If ($_l_Ref>0)
		$_t_Code:=OB Get:C1224($_obj_Attributes; "JobCode")
		If ($_t_Code#"")
			QUERY:C277([DIARY:12]; [DIARY:12]Job_Code:19=$_t_Code)
			CREATE SET:C116([DIARY:12]; "$FoundRecords")
			If (Records in set:C195("$ResultingSelection")=0)
				UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
			Else 
				INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
			End if 
		Else 
			$_l_Ref:=Find in array:C230($_at_PropertyNames; "RelatedTables")
			If ($_l_Ref>0)
				OB GET ARRAY:C1229($_obj_Attributes; "RelatedTables"; $_al_Tables)
				OB GET ARRAY:C1229($_obj_Attributes; "RelatedCodes"; $_at_RelatedCodes)
				ARRAY TEXT:C222($_at_Codes; 0)
				For ($_l_BuildCodes; 1; Size of array:C274($_al_Tables))
					If ($_al_Tables{$_l_BuildCodes}=Table:C252(->[JOBS:26]))
						APPEND TO ARRAY:C911($_at_Codes; $_at_RelatedCodes{$_l_BuildCodes})
					End if 
				End for 
				If (Size of array:C274($_at_Codes)>0)
					QUERY WITH ARRAY:C644([DIARY:12]Job_Code:19; $_at_Codes)
					CREATE SET:C116([DIARY:12]; "$FoundRecords")
					If (Records in set:C195("$ResultingSelection")=0)
						UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
					Else 
						INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
					End if 
					
				End if 
				
			Else 
				$_l_Ref:=Find in array:C230($_at_PropertyNames; "RelatedTable")
				If ($_l_Ref>0)
					$_l_TableNumber:=OB Get:C1224($_obj_Attributes; "RelatedTable")
					$_t_RelatedCode:=OB Get:C1224($_obj_Attributes; "RelatedCode")
					If ($_l_TableNumber=Table:C252(->[JOBS:26]))
						If ($_t_RelatedCode#"")
							QUERY:C277([DIARY:12]; [DIARY:12]Job_Code:19=$_t_RelatedCode)
							CREATE SET:C116([DIARY:12]; "$FoundRecords")
							If (Records in set:C195("$ResultingSelection")=0)
								UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
							Else 
								INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
							End if 
							
						End if 
					End if 
				End if 
			End if 
			
			
		End if 
	End if 
	
	
End if 

$_l_Ref:=Find in array:C230($_at_PropertyNames; "OrderCodes")
If ($_l_Ref>0)
	OB GET ARRAY:C1229($_obj_Attributes; "OrderCodes"; $_at_Codes)
	QUERY WITH ARRAY:C644([DIARY:12]Order_Code:26; $_at_Codes)
	CREATE SET:C116([DIARY:12]; "$FoundRecords")
	If (Records in set:C195("$ResultingSelection")=0)
		UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
	Else 
		INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
	End if 
Else 
	$_l_Ref:=Find in array:C230($_at_PropertyNames; "OrderCode")
	If ($_l_Ref>0)
		$_t_Code:=OB Get:C1224($_obj_Attributes; "OrderCode")
		If ($_t_Code#"")
			QUERY:C277([DIARY:12]; [DIARY:12]Order_Code:26=$_t_Code)
			CREATE SET:C116([DIARY:12]; "$FoundRecords")
			If (Records in set:C195("$ResultingSelection")=0)
				UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
			Else 
				INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
			End if 
		End if 
	Else 
		$_l_Ref:=Find in array:C230($_at_PropertyNames; "RelatedTables")
		If ($_l_Ref>0)
			OB GET ARRAY:C1229($_obj_Attributes; "RelatedTables"; $_al_Tables)
			OB GET ARRAY:C1229($_obj_Attributes; "RelatedCodes"; $_at_RelatedCodes)
			ARRAY TEXT:C222($_at_Codes; 0)
			For ($_l_BuildCodes; 1; Size of array:C274($_al_Tables))
				If ($_al_Tables{$_l_BuildCodes}=Table:C252(->[ORDERS:24]))
					APPEND TO ARRAY:C911($_at_Codes; $_at_RelatedCodes{$_l_BuildCodes})
				End if 
			End for 
			If (Size of array:C274($_at_Codes)>0)
				QUERY WITH ARRAY:C644([DIARY:12]Order_Code:26; $_at_Codes)
				CREATE SET:C116([DIARY:12]; "$FoundRecords")
				If (Records in set:C195("$ResultingSelection")=0)
					UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
				Else 
					INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
				End if 
				
			End if 
			
		Else 
			$_l_Ref:=Find in array:C230($_at_PropertyNames; "RelatedTable")
			If ($_l_Ref>0)
				$_l_TableNumber:=OB Get:C1224($_obj_Attributes; "RelatedTable")
				$_t_RelatedCode:=OB Get:C1224($_obj_Attributes; "RelatedCode")
				If ($_l_TableNumber=Table:C252(->[ORDERS:24]))
					If ($_t_RelatedCode#"")
						QUERY:C277([DIARY:12]; [DIARY:12]Order_Code:26=$_t_RelatedCode)
						CREATE SET:C116([DIARY:12]; "$FoundRecords")
						If (Records in set:C195("$ResultingSelection")=0)
							UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
						Else 
							INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
						End if 
						
					End if 
				End if 
			End if 
		End if 
		
		
		
	End if 
	
	
End if 
$_l_Ref:=Find in array:C230($_at_PropertyNames; "ProductCodes")
If ($_l_Ref>0)
	OB GET ARRAY:C1229($_obj_Attributes; "ProductCodes"; $_at_Codes)
	QUERY WITH ARRAY:C644([DIARY:12]Product_Code:13; $_at_Codes)
	CREATE SET:C116([DIARY:12]; "$FoundRecords")
	If (Records in set:C195("$ResultingSelection")=0)
		UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
	Else 
		INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
	End if 
Else 
	$_l_Ref:=Find in array:C230($_at_PropertyNames; "ProductCode")
	If ($_l_Ref>0)
		$_t_Code:=OB Get:C1224($_obj_Attributes; "ProductCode")
		If ($_t_Code#"")
			QUERY:C277([DIARY:12]; [DIARY:12]Product_Code:13=$_t_Code)
			CREATE SET:C116([DIARY:12]; "$FoundRecords")
			If (Records in set:C195("$ResultingSelection")=0)
				UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
			Else 
				INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
			End if 
		End if 
	Else 
		$_l_Ref:=Find in array:C230($_at_PropertyNames; "RelatedTables")
		If ($_l_Ref>0)
			OB GET ARRAY:C1229($_obj_Attributes; "RelatedTables"; $_al_Tables)
			OB GET ARRAY:C1229($_obj_Attributes; "RelatedCodes"; $_at_RelatedCodes)
			ARRAY TEXT:C222($_at_Codes; 0)
			For ($_l_BuildCodes; 1; Size of array:C274($_al_Tables))
				If ($_al_Tables{$_l_BuildCodes}=Table:C252(->[PRODUCTS:9]))
					APPEND TO ARRAY:C911($_at_Codes; $_at_RelatedCodes{$_l_BuildCodes})
				End if 
			End for 
			If (Size of array:C274($_at_Codes)>0)
				QUERY WITH ARRAY:C644([DIARY:12]Product_Code:13; $_at_Codes)
				CREATE SET:C116([DIARY:12]; "$FoundRecords")
				If (Records in set:C195("$ResultingSelection")=0)
					UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
				Else 
					INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
				End if 
				
			End if 
			
		Else 
			$_l_Ref:=Find in array:C230($_at_PropertyNames; "RelatedTable")
			If ($_l_Ref>0)
				$_l_TableNumber:=OB Get:C1224($_obj_Attributes; "RelatedTable")
				$_t_RelatedCode:=OB Get:C1224($_obj_Attributes; "RelatedCode")
				If ($_l_TableNumber=Table:C252(->[PRODUCTS:9]))
					If ($_t_RelatedCode#"")
						QUERY:C277([DIARY:12]; [DIARY:12]Product_Code:13=$_t_RelatedCode)
						CREATE SET:C116([DIARY:12]; "$FoundRecords")
						If (Records in set:C195("$ResultingSelection")=0)
							UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
						Else 
							INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
						End if 
						
					End if 
				End if 
			End if 
		End if 
		
		
		
		
	End if 
	
	
End if 
$_l_Ref:=Find in array:C230($_at_PropertyNames; "StageCodes")
If ($_l_Ref>0)
	OB GET ARRAY:C1229($_obj_Attributes; "StageCodes"; $_at_Codes)
	QUERY WITH ARRAY:C644([DIARY:12]Stage_Code:21; $_at_Codes)
	CREATE SET:C116([DIARY:12]; "$FoundRecords")
	If (Records in set:C195("$ResultingSelection")=0)
		UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
	Else 
		INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
	End if 
Else 
	$_l_Ref:=Find in array:C230($_at_PropertyNames; "StageCode")
	If ($_l_Ref>0)
		$_t_Code:=OB Get:C1224($_obj_Attributes; "StageCode")
		If ($_t_Code#"")
			QUERY:C277([DIARY:12]; [DIARY:12]Stage_Code:21=$_t_Code)
			CREATE SET:C116([DIARY:12]; "$FoundRecords")
			If (Records in set:C195("$ResultingSelection")=0)
				UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
			Else 
				INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
			End if 
		End if 
	Else 
		$_l_Ref:=Find in array:C230($_at_PropertyNames; "RelatedTables")
		If ($_l_Ref>0)
			OB GET ARRAY:C1229($_obj_Attributes; "RelatedTables"; $_al_Tables)
			OB GET ARRAY:C1229($_obj_Attributes; "RelatedCodes"; $_at_RelatedCodes)
			ARRAY TEXT:C222($_at_Codes; 0)
			For ($_l_BuildCodes; 1; Size of array:C274($_al_Tables))
				If ($_al_Tables{$_l_BuildCodes}=Table:C252(->[JOB_STAGES:47]))
					APPEND TO ARRAY:C911($_at_Codes; $_at_RelatedCodes{$_l_BuildCodes})
				End if 
			End for 
			If (Size of array:C274($_at_Codes)>0)
				QUERY WITH ARRAY:C644([DIARY:12]Stage_Code:21; $_at_Codes)
				CREATE SET:C116([DIARY:12]; "$FoundRecords")
				If (Records in set:C195("$ResultingSelection")=0)
					UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
				Else 
					INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
				End if 
				
			End if 
			
		Else 
			$_l_Ref:=Find in array:C230($_at_PropertyNames; "RelatedTable")
			If ($_l_Ref>0)
				$_l_TableNumber:=OB Get:C1224($_obj_Attributes; "RelatedTable")
				$_t_RelatedCode:=OB Get:C1224($_obj_Attributes; "RelatedCode")
				If ($_l_TableNumber=Table:C252(->[JOB_STAGES:47]))
					If ($_t_RelatedCode#"")
						QUERY:C277([DIARY:12]; [DIARY:12]Stage_Code:21=$_t_RelatedCode)
						CREATE SET:C116([DIARY:12]; "$FoundRecords")
						If (Records in set:C195("$ResultingSelection")=0)
							UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
						Else 
							INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
						End if 
						
					End if 
				End if 
			End if 
		End if 
		
	End if 
	
	
End if 
///
$_l_Ref:=Find in array:C230($_at_PropertyNames; "BudgetUnitsRange")
If ($_l_Ref>0)
	//so if there are multiple units what does this mean 2 units
	OB GET ARRAY:C1229($_obj_Attributes; "BudgetUnitsRange"; $_ar_Units)  //this will be 2 values upper and lower
	If (Size of array:C274($_ar_Units)=2)
		QUERY:C277([DIARY:12]; [DIARY:12]Budget_Units:70>=$_ar_Units{1}; *)
		QUERY:C277([DIARY:12];  & ; [DIARY:12]Budget_Units:70<=$_ar_Units{2})
		CREATE SET:C116([DIARY:12]; "$FoundRecords")
		If (Records in set:C195("$ResultingSelection")=0)
			UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
		Else 
			INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
		End if 
		
	End if 
Else 
	$_l_Ref:=Find in array:C230($_at_PropertyNames; "BudgetUnits")
	If ($_l_Ref>0)
		OB GET ARRAY:C1229($_obj_Attributes; "BudgetUnits"; $_ar_Units)  //this will be 2 values upper and lower
		//this would be specific values 
		QUERY WITH ARRAY:C644([DIARY:12]Budget_Units:70; $_ar_Units)
		CREATE SET:C116([DIARY:12]; "$FoundRecords")
		If (Records in set:C195("$ResultingSelection")=0)
			UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
		Else 
			INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
		End if 
		
	Else 
		$_l_Ref:=Find in array:C230($_at_PropertyNames; "BudgetUnit")
		If ($_l_Ref>0)
			$_r_Unit:=OB Get:C1224($_obj_Attributes; "BudgetUnit")  //this will be 2 values upper and lower
			//this would be specific values 
			QUERY:C277([DIARY:12]; [DIARY:12]Budget_Units:70=$_r_Unit)
			CREATE SET:C116([DIARY:12]; "$FoundRecords")
			If (Records in set:C195("$ResultingSelection")=0)
				UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
			Else 
				INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
			End if 
		End if 
	End if 
End if 

$_l_Ref:=Find in array:C230($_at_PropertyNames; "ChargeRatesRange")
If ($_l_Ref>0)
	//so if there are multiple units what does this mean 2 units
	OB GET ARRAY:C1229($_obj_Attributes; "ChargeRatesRange"; $_ar_Rates)  //this will be 2 values upper and lower
	If (Size of array:C274($_ar_Rates)=2)
		QUERY:C277([DIARY:12]; [DIARY:12]Charge_Rate:22>=$_ar_Rates{1}; *)
		QUERY:C277([DIARY:12];  & ; [DIARY:12]Charge_Rate:22<=$_ar_Rates{2})
		CREATE SET:C116([DIARY:12]; "$FoundRecords")
		If (Records in set:C195("$ResultingSelection")=0)
			UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
		Else 
			INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
		End if 
		
	End if 
Else 
	$_l_Ref:=Find in array:C230($_at_PropertyNames; "ChargeRates")
	If ($_l_Ref>0)
		OB GET ARRAY:C1229($_obj_Attributes; "ChargeRates"; $_ar_Rates)  //this will be 2 values upper and lower
		//this would be specific values 
		QUERY WITH ARRAY:C644([DIARY:12]Charge_Rate:22; $_ar_Rates)
		CREATE SET:C116([DIARY:12]; "$FoundRecords")
		If (Records in set:C195("$ResultingSelection")=0)
			UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
		Else 
			INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
		End if 
		
	Else 
		$_l_Ref:=Find in array:C230($_at_PropertyNames; "ChargeRate")
		If ($_l_Ref>0)
			$_r_Rate:=OB Get:C1224($_obj_Attributes; "ChargeRate")  //this will be 2 values upper and lower
			//this would be specific values 
			
			QUERY:C277([DIARY:12]; [DIARY:12]Charge_Rate:22=$_r_Rate)
			CREATE SET:C116([DIARY:12]; "$FoundRecords")
			If (Records in set:C195("$ResultingSelection")=0)
				UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
			Else 
				INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
			End if 
		End if 
	End if 
End if 

$_l_Ref:=Find in array:C230($_at_PropertyNames; "CostRatesRange")
If ($_l_Ref>0)
	//so if there are multiple units what does this mean 2 units
	OB GET ARRAY:C1229($_obj_Attributes; "CostRatesRange"; $_ar_Rates)  //this will be 2 values upper and lower
	If (Size of array:C274($_ar_Rates)=2)
		QUERY:C277([DIARY:12]; [DIARY:12]Cost_Rate:74>=$_ar_Rates{1}; *)
		QUERY:C277([DIARY:12];  & ; [DIARY:12]Cost_Rate:74<=$_ar_Rates{2})
		CREATE SET:C116([DIARY:12]; "$FoundRecords")
		If (Records in set:C195("$ResultingSelection")=0)
			UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
		Else 
			INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
		End if 
		
	End if 
Else 
	$_l_Ref:=Find in array:C230($_at_PropertyNames; "CostRates")
	If ($_l_Ref>0)
		OB GET ARRAY:C1229($_obj_Attributes; "CostRates"; $_ar_Rates)  //this will be 2 values upper and lower
		//this would be specific values 
		QUERY WITH ARRAY:C644([DIARY:12]Cost_Rate:74; $_ar_Rates)
		CREATE SET:C116([DIARY:12]; "$FoundRecords")
		If (Records in set:C195("$ResultingSelection")=0)
			UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
		Else 
			INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
		End if 
		
	Else 
		$_l_Ref:=Find in array:C230($_at_PropertyNames; "CostRate")
		If ($_l_Ref>0)
			$_r_Rate:=OB Get:C1224($_obj_Attributes; "CostRate")  //this will be 2 values upper and lower
			//this would be specific values 
			
			QUERY:C277([DIARY:12]; [DIARY:12]Cost_Rate:74=$_r_Rate)
			CREATE SET:C116([DIARY:12]; "$FoundRecords")
			If (Records in set:C195("$ResultingSelection")=0)
				UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
			Else 
				INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
			End if 
		End if 
	End if 
End if 

///
$_l_Ref:=Find in array:C230($_at_PropertyNames; "CostValuesRange")
If ($_l_Ref>0)
	//so if there are multiple units what does this mean 2 units
	OB GET ARRAY:C1229($_obj_Attributes; "CostValuesRange"; $_ar_Values)  //this will be 2 values upper and lower
	If (Size of array:C274($_ar_Values)=2)
		QUERY:C277([DIARY:12]; [DIARY:12]Cost_Value:75>=$_ar_Values{1}; *)
		QUERY:C277([DIARY:12];  & ; [DIARY:12]Cost_Value:75<=$_ar_Values{2})
		CREATE SET:C116([DIARY:12]; "$FoundRecords")
		If (Records in set:C195("$ResultingSelection")=0)
			UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
		Else 
			INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
		End if 
		
	End if 
Else 
	$_l_Ref:=Find in array:C230($_at_PropertyNames; "CostValues")
	If ($_l_Ref>0)
		OB GET ARRAY:C1229($_obj_Attributes; "CostValues"; $_ar_Values)  //this will be 2 values upper and lower
		//this would be specific values 
		QUERY WITH ARRAY:C644([DIARY:12]Cost_Value:75; $_ar_Values)
		CREATE SET:C116([DIARY:12]; "$FoundRecords")
		If (Records in set:C195("$ResultingSelection")=0)
			UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
		Else 
			INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
		End if 
		
	Else 
		$_l_Ref:=Find in array:C230($_at_PropertyNames; "CostValue")
		If ($_l_Ref>0)
			$_r_Value:=OB Get:C1224($_obj_Attributes; "CostValue")  //this will be 2 values upper and lower
			//this would be specific values 
			
			QUERY:C277([DIARY:12]; [DIARY:12]Cost_Value:75=$_r_Value)
			CREATE SET:C116([DIARY:12]; "$FoundRecords")
			If (Records in set:C195("$ResultingSelection")=0)
				UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
			Else 
				INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
			End if 
		End if 
	End if 
End if 
///
$_l_Ref:=Find in array:C230($_at_PropertyNames; "ValuesRange")
If ($_l_Ref>0)
	//so if there are multiple units what does this mean 2 units
	OB GET ARRAY:C1229($_obj_Attributes; "ValuesRange"; $_ar_Values)  //this will be 2 values upper and lower
	If (Size of array:C274($_ar_Values)=2)
		QUERY:C277([DIARY:12]; [DIARY:12]Value:16>=$_ar_Values{1}; *)
		QUERY:C277([DIARY:12];  & ; [DIARY:12]Value:16<=$_ar_Values{2})
		CREATE SET:C116([DIARY:12]; "$FoundRecords")
		If (Records in set:C195("$ResultingSelection")=0)
			UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
		Else 
			INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
		End if 
		
	End if 
Else 
	$_l_Ref:=Find in array:C230($_at_PropertyNames; "Values")
	If ($_l_Ref>0)
		OB GET ARRAY:C1229($_obj_Attributes; "Values"; $_ar_Values)  //this will be 2 values upper and lower
		//this would be specific values 
		QUERY WITH ARRAY:C644([DIARY:12]Value:16; $_ar_Values)
		CREATE SET:C116([DIARY:12]; "$FoundRecords")
		If (Records in set:C195("$ResultingSelection")=0)
			UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
		Else 
			INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
		End if 
		
	Else 
		$_l_Ref:=Find in array:C230($_at_PropertyNames; "Value")
		If ($_l_Ref>0)
			$_r_Value:=OB Get:C1224($_obj_Attributes; "Value")  //this will be 2 values upper and lower
			//this would be specific values 
			
			QUERY:C277([DIARY:12]; [DIARY:12]Value:16=$_r_Value)
			CREATE SET:C116([DIARY:12]; "$FoundRecords")
			If (Records in set:C195("$ResultingSelection")=0)
				UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
			Else 
				INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
			End if 
		End if 
	End if 
End if 

$_l_Ref:=Find in array:C230($_at_PropertyNames; "TimeChecked")
If ($_l_Ref>0)
	$_bo_TimeChecked:=OB Get:C1224($_obj_Attributes; "TimeChecked")
	QUERY:C277([DIARY:12]; [DIARY:12]Time_Checked:28=$_bo_TimeChecked)
	CREATE SET:C116([DIARY:12]; "$FoundRecords")
	If (Records in set:C195("$ResultingSelection")=0)
		UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
	Else 
		INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
	End if 
End if 


$_l_Ref:=Find in array:C230($_at_PropertyNames; "UnitsRange")
If ($_l_Ref>0)
	//so if there are multiple units what does this mean 2 units
	OB GET ARRAY:C1229($_obj_Attributes; "UnitsRange"; $_ar_Range)  //this will be 2 values upper and lower
	If (Size of array:C274($_ar_Range)=2)
		QUERY:C277([DIARY:12]; [DIARY:12]Units:20>=$_ar_Values{1}; *)
		QUERY:C277([DIARY:12];  & ; [DIARY:12]Units:20<=$_ar_Values{2})
		CREATE SET:C116([DIARY:12]; "$FoundRecords")
		If (Records in set:C195("$ResultingSelection")=0)
			UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
		Else 
			INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
		End if 
		
	End if 
Else 
	$_l_Ref:=Find in array:C230($_at_PropertyNames; "UnitValues")
	If ($_l_Ref>0)
		OB GET ARRAY:C1229($_obj_Attributes; "UnitValues"; $_ar_Values)  //this will be 2 values upper and lower
		//this would be specific values 
		QUERY WITH ARRAY:C644([DIARY:12]Units:20; $_ar_Values)
		CREATE SET:C116([DIARY:12]; "$FoundRecords")
		If (Records in set:C195("$ResultingSelection")=0)
			UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
		Else 
			INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
		End if 
		
	Else 
		$_l_Ref:=Find in array:C230($_at_PropertyNames; "UnitValue")
		If ($_l_Ref>0)
			$_r_Value:=OB Get:C1224($_obj_Attributes; "UnitValue")  //this will be 2 values upper and lower
			//this would be specific values 
			
			QUERY:C277([DIARY:12]; [DIARY:12]Units:20=$_r_Value)
			CREATE SET:C116([DIARY:12]; "$FoundRecords")
			If (Records in set:C195("$ResultingSelection")=0)
				UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
			Else 
				INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
			End if 
		End if 
	End if 
End if 






$_l_Ref:=Find in array:C230($_at_PropertyNames; "DiaryCodes")
If ($_l_Ref>0)
	OB GET ARRAY:C1229($_obj_Attributes; "DiaryCodes"; $_at_DiaryCodes)
	QUERY WITH ARRAY:C644([DIARY:12]Diary_Code:3; $_at_DiaryCodes)
	CREATE SET:C116([DIARY:12]; "$FoundRecords")
	If (Records in set:C195("$ResultingSelection")=0)
		UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
	Else 
		INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
	End if 
Else 
	$_l_Ref:=Find in array:C230($_at_PropertyNames; "DiaryCode")
	If ($_l_Ref>0)
		$_t_DiaryCode:=OB Get:C1224($_obj_Attributes; "DiaryCode")
		If ($_t_DiaryCode#"")
			QUERY:C277([DIARY:12]; [DIARY:12]Diary_Code:3=$_t_DiaryCode)
			CREATE SET:C116([DIARY:12]; "$FoundRecords")
			If (Records in set:C195("$ResultingSelection")=0)
				UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
			Else 
				INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
			End if 
		End if 
	End if 
	
	
End if 
///
$_l_Ref:=Find in array:C230($_at_PropertyNames; "DocumentCodes")
If ($_l_Ref>0)
	OB GET ARRAY:C1229($_obj_Attributes; "DocumentCodes"; $_at_DocumentCodes)
	QUERY WITH ARRAY:C644([DIARY:12]Document_Code:15; $_at_DocumentCodes)
	CREATE SET:C116([DIARY:12]; "$FoundRecords")
	If (Records in set:C195("$ResultingSelection")=0)
		UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
	Else 
		INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
	End if 
Else 
	$_l_Ref:=Find in array:C230($_at_PropertyNames; "DocumentCode")
	If ($_l_Ref>0)
		$_t_DocCode:=OB Get:C1224($_obj_Attributes; "DocumentCode")
		If ($_t_DiaryCode#"")
			QUERY:C277([DIARY:12]; [DIARY:12]Document_Code:15=$_t_DocCode)
			CREATE SET:C116([DIARY:12]; "$FoundRecords")
			If (Records in set:C195("$ResultingSelection")=0)
				UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
			Else 
				INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
			End if 
		End if 
	End if 
	
	
End if 

$_l_Ref:=Find in array:C230($_at_PropertyNames; "CampaignUUIDs")
If ($_l_Ref>0)
	OB GET ARRAY:C1229($_obj_Attributes; "CampaignUUIDs"; $_at_CampaignUUIDS)
	QUERY WITH ARRAY:C644([DIARY:12]CampaignUUID:80; $_at_CampaignUUIDS)
	CREATE SET:C116([DIARY:12]; "$FoundRecords")
	If (Records in set:C195("$ResultingSelection")=0)
		UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
	Else 
		INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
	End if 
Else 
	$_l_Ref:=Find in array:C230($_at_PropertyNames; "CampaignUUID")
	If ($_l_Ref>0)
		$_t_CampaignCode:=OB Get:C1224($_obj_Attributes; "CampaignUUID")
		If ($_t_DiaryCode#"")
			QUERY:C277([DIARY:12]; [DIARY:12]CampaignUUID:80=$_t_CampaignCode)
			CREATE SET:C116([DIARY:12]; "$FoundRecords")
			If (Records in set:C195("$ResultingSelection")=0)
				UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
			Else 
				INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
			End if 
		End if 
	End if 
	
	
End if 
$_l_Ref:=Find in array:C230($_at_PropertyNames; "DoAllDay")
If ($_l_Ref>0)
	$_bo_DoAllDay:=OB Get:C1224($_obj_Attributes; "DoAllDay")
	QUERY:C277([DIARY:12]; [DIARY:12]DoAllDay:83=$_bo_DoAllDay)
	CREATE SET:C116([DIARY:12]; "$FoundRecords")
	If (Records in set:C195("$ResultingSelection")=0)
		UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
	Else 
		INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
	End if 
End if 
$_l_Ref:=Find in array:C230($_at_PropertyNames; "DoneAllDay")
If ($_l_Ref>0)
	$_bo_DoneAllDay:=OB Get:C1224($_obj_Attributes; "DoneAllDay")
	QUERY:C277([DIARY:12]; [DIARY:12]DoneAllDay:84=$_bo_DoneAllDay)
	CREATE SET:C116([DIARY:12]; "$FoundRecords")
	If (Records in set:C195("$ResultingSelection")=0)
		UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
	Else 
		INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
	End if 
End if 
$_l_Ref:=Find in array:C230($_at_PropertyNames; "Done")
If ($_l_Ref>0)
	$_bo_Done:=OB Get:C1224($_obj_Attributes; "Done")
	QUERY:C277([DIARY:12]; [DIARY:12]Done:14=$_bo_Done)
	CREATE SET:C116([DIARY:12]; "$FoundRecords")
	If (Records in set:C195("$ResultingSelection")=0)
		UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
	Else 
		INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
	End if 
End if 
$_l_Ref:=Find in array:C230($_at_PropertyNames; "SequenceActioned")
If ($_l_Ref>0)
	$_bo_Actioned:=OB Get:C1224($_obj_Attributes; "SequenceActioned")
	QUERY:C277([DIARY:12]; [DIARY:12]Sequence_Actioned:77=$_bo_Actioned)
	CREATE SET:C116([DIARY:12]; "$FoundRecords")
	If (Records in set:C195("$ResultingSelection")=0)
		UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
	Else 
		INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
	End if 
End if 

$_l_Ref:=Find in array:C230($_at_PropertyNames; "Public")
If ($_l_Ref>0)
	$_bo_Public:=OB Get:C1224($_obj_Attributes; "Public")
	QUERY:C277([DIARY:12]; [DIARY:12]Public:44=$_bo_Public)
	CREATE SET:C116([DIARY:12]; "$FoundRecords")
	If (Records in set:C195("$ResultingSelection")=0)
		UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
	Else 
		INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
	End if 
End if 


$_l_Ref:=Find in array:C230($_at_PropertyNames; "Priorities")
If ($_l_Ref>0)
	OB GET ARRAY:C1229($_obj_Attributes; "Priorities"; $_at_Priorities)
	QUERY WITH ARRAY:C644([DIARY:12]Priority:17; $_at_Priorities)
	CREATE SET:C116([DIARY:12]; "$FoundRecords")
	If (Records in set:C195("$ResultingSelection")=0)
		UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
	Else 
		INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
	End if 
Else 
	$_l_Ref:=Find in array:C230($_at_PropertyNames; "Priority")
	If ($_l_Ref>0)
		$_t_Priority:=OB Get:C1224($_obj_Attributes; "Priority")
		If ($_t_Priority#"")
			QUERY:C277([DIARY:12]; [DIARY:12]Priority:17=$_t_Priority)
			CREATE SET:C116([DIARY:12]; "$FoundRecords")
			If (Records in set:C195("$ResultingSelection")=0)
				UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
			Else 
				INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
			End if 
			
		End if 
	End if 
End if 
$_l_Ref:=Find in array:C230($_at_PropertyNames; "PersonalPriorities")
If ($_l_Ref>0)
	OB GET ARRAY:C1229($_obj_Attributes; "PersonalPriorities"; $_at_Priorities)
	QUERY WITH ARRAY:C644([DIARY:12]Personal_Priority:31; $_at_Priorities)
	CREATE SET:C116([DIARY:12]; "$FoundRecords")
	If (Records in set:C195("$ResultingSelection")=0)
		UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
	Else 
		INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
	End if 
Else 
	$_l_Ref:=Find in array:C230($_at_PropertyNames; "PersonalPriority")
	If ($_l_Ref>0)
		$_t_Priority:=OB Get:C1224($_obj_Attributes; "PersonalPriority")
		If ($_t_Priority#"")
			QUERY:C277([DIARY:12]; [DIARY:12]Personal_Priority:31=$_t_Priority)
			CREATE SET:C116([DIARY:12]; "$FoundRecords")
			If (Records in set:C195("$ResultingSelection")=0)
				UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
			Else 
				INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
			End if 
			
		End if 
	End if 
End if 

$_l_Ref:=Find in array:C230($_at_PropertyNames; "EmailsFrom")
If ($_l_Ref>0)
	OB GET ARRAY:C1229($_obj_Attributes; "EmailsFrom"; $_at_EmailAddresses)
	QUERY WITH ARRAY:C644([DIARY:12]Email_From:38; $_at_EmailAddresses)
	CREATE SET:C116([DIARY:12]; "$FoundRecords")
	If (Records in set:C195("$ResultingSelection")=0)
		UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
	Else 
		INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
	End if 
	
	
Else 
	$_l_Ref:=Find in array:C230($_at_PropertyNames; "EmailFrom")
	If ($_l_Ref>0)
		$_t_EmailFrom:=OB Get:C1224($_obj_Attributes; "EmailFrom")
		If ($_t_EmailFrom#"")
			QUERY:C277([DIARY:12]; [DIARY:12]Email_From:38=$_t_EmailFrom)
			CREATE SET:C116([DIARY:12]; "$FoundRecords")
			If (Records in set:C195("$ResultingSelection")=0)
				UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
			Else 
				INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
			End if 
			
		End if 
		
	End if 
	
End if 
///[DIARY]Document_Heading
$_l_Ref:=Find in array:C230($_at_PropertyNames; "EmailHeadings")
If ($_l_Ref>0)
	OB GET ARRAY:C1229($_obj_Attributes; "EmailHeadings"; $_at_EmailHeadings)
	QUERY WITH ARRAY:C644([DIARY:12]Document_Heading:32; $_at_EmailHeadings)
	CREATE SET:C116([DIARY:12]; "$FoundRecords")
	If (Records in set:C195("$ResultingSelection")=0)
		UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
	Else 
		INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
	End if 
	
	
Else 
	$_l_Ref:=Find in array:C230($_at_PropertyNames; "EmailHeading")
	If ($_l_Ref>0)
		$_t_EmailHeading:=OB Get:C1224($_obj_Attributes; "EmailHeading")
		If ($_t_EmailHeading#"")
			QUERY:C277([DIARY:12]; [DIARY:12]Document_Heading:32=$_t_EmailHeading)
			CREATE SET:C116([DIARY:12]; "$FoundRecords")
			If (Records in set:C195("$ResultingSelection")=0)
				UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
			Else 
				INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
			End if 
			
		End if 
		
	End if 
	
End if 


$_l_Ref:=Find in array:C230($_at_PropertyNames; "EmailSubjects")
If ($_l_Ref>0)
	OB GET ARRAY:C1229($_obj_Attributes; "EmailSubjects"; $_at_EmailSubjects)
	QUERY WITH ARRAY:C644([DIARY:12]Email_Subject:40; $_at_EmailSubjects)
	CREATE SET:C116([DIARY:12]; "$FoundRecords")
	If (Records in set:C195("$ResultingSelection")=0)
		UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
	Else 
		INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
	End if 
	
	
Else 
	$_l_Ref:=Find in array:C230($_at_PropertyNames; "EmailSubject")
	If ($_l_Ref>0)
		$_t_EmailSubject:=OB Get:C1224($_obj_Attributes; "EmailSubject")
		If ($_t_EmailSubject#"")
			QUERY:C277([DIARY:12]; [DIARY:12]Email_Subject:40=$_t_EmailSubject)
			CREATE SET:C116([DIARY:12]; "$FoundRecords")
			If (Records in set:C195("$ResultingSelection")=0)
				UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
			Else 
				INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
			End if 
			
		End if 
		
	End if 
	
End if 

$_l_Ref:=Find in array:C230($_at_PropertyNames; "EmailContents")
//note that any wildcards here should be explicit-ie in the search
If ($_l_Ref>0)
	OB GET ARRAY:C1229($_obj_Attributes; "EmailContents"; $_at_EmailSContents)
	QUERY WITH ARRAY:C644([DIARY:12]Email_Text:42; $_at_EmailSContents)
	CREATE SET:C116([DIARY:12]; "$FoundRecords")
	If (Records in set:C195("$ResultingSelection")=0)
		UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
	Else 
		INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
	End if 
	
	
Else 
	$_l_Ref:=Find in array:C230($_at_PropertyNames; "EmailContent")
	If ($_l_Ref>0)
		$_t_EmailContent:=OB Get:C1224($_obj_Attributes; "EmailContent")
		If ($_t_EmailContent#"")
			QUERY:C277([DIARY:12]; [DIARY:12]Email_Text:42=$_t_EmailContent)
			CREATE SET:C116([DIARY:12]; "$FoundRecords")
			If (Records in set:C195("$ResultingSelection")=0)
				UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
			Else 
				INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
			End if 
			
		End if 
		
	End if 
	
End if 
//by default we always exclude deleted diary items. it would be odd to want them but its an option
$_l_Ref:=Find in array:C230($_at_PropertyNames; "IncludeDeleted")
If ($_l_Ref>0)
	$_bo_IncludeDeleted:=OB Get:C1224($_obj_Attributes; "IncludeDeleted")
	If (Not:C34($_bo_IncludeDeleted))  //if this is true(ie include deleted we dont need to do anything here)
		QUERY:C277([DIARY:12]; [DIARY:12]Deleted:43=0)
		CREATE SET:C116([DIARY:12]; "$FoundRecords")
		If (Records in set:C195("$ResultingSelection")=0)
			UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
		Else 
			INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
		End if 
	End if 
Else 
	QUERY:C277([DIARY:12]; [DIARY:12]Deleted:43=0)
	CREATE SET:C116([DIARY:12]; "$FoundRecords")
	If (Records in set:C195("$ResultingSelection")=0)
		UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
	Else 
		INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
	End if 
End if 

$_l_Ref:=Find in array:C230($_at_PropertyNames; "DiaryStati")
//note that any wildcards here should be explicit-ie in the search
If ($_l_Ref>0)
	OB GET ARRAY:C1229($_obj_Attributes; "DiaryStati"; $_at_EmailStates)
	QUERY WITH ARRAY:C644([DIARY:12]Status:30; $_at_EmailStates)
	CREATE SET:C116([DIARY:12]; "$FoundRecords")
	If (Records in set:C195("$ResultingSelection")=0)
		UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
	Else 
		INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
	End if 
	
	
Else 
	$_l_Ref:=Find in array:C230($_at_PropertyNames; "DiaryStatus")
	If ($_l_Ref>0)
		$_t_Status:=OB Get:C1224($_obj_Attributes; "DiaryStatus")
		If ($_t_Status#"")
			QUERY:C277([DIARY:12]; [DIARY:12]Status:30=$_t_Status)
			CREATE SET:C116([DIARY:12]; "$FoundRecords")
			If (Records in set:C195("$ResultingSelection")=0)
				UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
			Else 
				INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
			End if 
			
		End if 
		
	End if 
	
End if 


$_l_Ref:=Find in array:C230($_at_PropertyNames; "ThreadIDS")
//note that any wildcards here should be explicit-ie in the search
If ($_l_Ref>0)
	OB GET ARRAY:C1229($_obj_Attributes; "ThreadIDS"; $_al_ThreadIDS)
	QUERY WITH ARRAY:C644([DIARY:12]ThreadID:64; $_al_ThreadIDS)
	CREATE SET:C116([DIARY:12]; "$FoundRecords")
	If (Records in set:C195("$ResultingSelection")=0)
		UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
	Else 
		INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
	End if 
	
	
Else 
	$_l_Ref:=Find in array:C230($_at_PropertyNames; "ThreadID")
	If ($_l_Ref>0)
		$_l_ThreadID:=OB Get:C1224($_obj_Attributes; "ThreadID")
		If ($_t_Status#"")
			QUERY:C277([DIARY:12]; [DIARY:12]ThreadID:64=$_l_ThreadID)
			CREATE SET:C116([DIARY:12]; "$FoundRecords")
			If (Records in set:C195("$ResultingSelection")=0)
				UNION:C120("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
			Else 
				INTERSECTION:C121("$ResultingSelection"; "$FoundRecords"; "$ResultingSelection")
			End if 
			
		End if 
		
	End if 
	
End if 
USE SET:C118("$ResultingSelection")
ERR_MethodTrackerReturn("SD3_FindDiaryRecordsByAttribute"; $_t_oldMethodName)