//%attributes = {}

If (False:C215)
	//Project Method Name:      SD3_MatchDiaryProperties
	//------------------ Method Notes ------------------
	//The trheoritical beauty of this is that we do not go to the diary records themselves.
	//This should make the process much faster-we are just comparing the data stored in the objects-the diary object can in theory be a 'virtual' object-the data is allowed to not match the record(for example-when a diary is in multiple peoples diaries)
	
	//------------------ Revision Control ----------------
	//Date Created:  30/12/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
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
	ARRAY TEXT:C222($_at_OwnedDiaryRecords; 0)
	ARRAY TEXT:C222($_at_Priorities; 0)
	ARRAY TEXT:C222($_at_PropertyNames; 0)
	ARRAY TEXT:C222($_at_RelatedCodes; 0)
	ARRAY TEXT:C222($_at_ResultCodes; 0)
	//ARRAY TEXT(IP_at_DiaryRecords;0)
	C_BOOLEAN:C305($_bo_Actioned; $_bo_DiaryDoAllDay; $_bo_DiaryDone; $_bo_DiaryDoneAllDay; $_bo_DiaryPublic; $_bo_DiaryTimeChecked; $_bo_DoAllDay; $_bo_Done; $_bo_DoneAllDay; $_bo_Included; $_bo_IncludeDeleted)
	C_BOOLEAN:C305($_bo_IncludeStarted; $_bo_Public; $_bo_TimeChecked; $_bo_WhoseDiarySet; $0)
	C_DATE:C307($_d_DiaryFromDate; $_d_DiaryToDate; $_d_FromDate; $_d_ToDate)
	C_LONGINT:C283($_l_BuildCodes; $_l_DiaryCodePosition; $_l_DiaryDateTimeStamp; $_l_DiaryDeleted; $_l_DiaryPersonPosition; $_l_DiaryThreadID; $_l_DiaryTimeStamp; $_l_GetWhoseDiary; $_l_Ref; $_l_Ref2; $_l_TableNumber)
	C_LONGINT:C283($_l_ThreadID; $_l_TimeStamp; $_l_Update)
	C_POINTER:C301($_ptr_Attributes; $_Ptr_Diary; $_Ptr_DiaryRecordObject; $1; $3)
	C_REAL:C285($_r_ChargeRate; $_r_CostRate; $_r_CostValue; $_r_DiaryBudgetUnits; $_r_DiaryUnits; $_r_DiaryValue; $_r_Rate; $_r_Unit; $_r_Value)
	C_TEXT:C284($_t_aCode; $_t_actionCode; $_t_actionDetails; $_t_CampaignCode; $_t_Code; $_t_D; $_t_DiaryAction; $_t_DiaryActionDetails; $_t_DiaryBookingCode; $_t_DiaryCallCode; $_t_DiaryCampaignUUID)
	C_TEXT:C284($_t_DiaryCode; $_t_DiaryCompanyCode; $_t_DiaryContactCode; $_t_DiaryDocumentCode; $_t_DiaryEmailFrom; $_t_DiaryEmailText; $_t_DiaryEventCode; $_t_DiaryHeading; $_t_DiaryJobCode; $_t_DiaryOrderCode; $_t_DiaryPerson)
	C_TEXT:C284($_t_DiaryPersPriority; $_t_DiaryPriority; $_t_DiaryProductCode; $_t_DiaryRecordCode; $_t_DiaryResultCode; $_t_DiaryResultDetails; $_t_DiaryStageCode; $_t_DiaryStatus; $_t_DiarySubject; $_t_DocCode; $_t_EmailContent)
	C_TEXT:C284($_t_EmailFrom; $_t_EmailHeading; $_t_EmailSubject; $_t_oldMethodName; $_t_Priority; $_t_RelatedCode; $_t_ResultCode; $_t_ResultDetails; $_t_Status; $2)
	C_TIME:C306($_ti_DiaryFromTime; $_ti_DiaryToTime; $_ti_FromTime; $_ti_toTime)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("SD3_MatchDiaryProperties")
$0:=False:C215
$_ptr_Attributes:=$1
$_t_DiaryCode:=$2
If (Count parameters:C259>=3)
	$_Ptr_DiaryRecordObject:=$3
End if 

$_bo_Included:=False:C215
$_bo_IncludeStarted:=False:C215
OB GET PROPERTY NAMES:C1232($_ptr_Attributes->; $_at_PropertyNames; $_al_PropertyTypes)
If ([DIARY:12]Diary_Code:3#$_t_DiaryCode)
	QUERY:C277([DIARY:12]; [DIARY:12]Diary_Code:3=$_t_DiaryCode)
End if 
$_l_Ref:=Find in array:C230($_at_PropertyNames; "WhoseDiary")
If ($_l_Ref>0)
	
	$_bo_WhoseDiarySet:=True:C214
	OB GET ARRAY:C1229($_ptr_Attributes->; "WhoseDiary"; $_at_DiaryItemOwners)
	$_t_DiaryPerson:=OB Get:C1224($_Ptr_DiaryRecordObject->; "Person")
	For ($_l_GetWhoseDiary; 1; Size of array:C274($_at_DiaryItemOwners))
		QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Person_Identity:13=$_at_DiaryItemOwners{$_l_GetWhoseDiary})
		QUERY:C277([DIARY_ITEMOWNERS:106]; [DIARY_ITEMOWNERS:106]PERSONNEL_ID:2=[PERSONNEL:11]Personnel_ID:48; *)
		QUERY:C277([DIARY_ITEMOWNERS:106];  & ; [DIARY_ITEMOWNERS:106]RELATIONSHIP_CLASSID:3=1)
		If (Records in selection:C76([DIARY_ITEMOWNERS:106])>0)
			SELECTION TO ARRAY:C260([DIARY_ITEMOWNERS:106]DIARY_CODE:1; $_at_OwnedDiaryRecords)
			$_l_DiaryPersonPosition:=Find in array:C230($_at_OwnedDiaryRecords; $_t_DiaryPerson)
			If ($_bo_IncludeStarted)
				$_bo_Included:=($_l_DiaryPersonPosition>0) & ($_bo_Included)
			Else 
				$_bo_IncludeStarted:=True:C214
				$_bo_Included:=($_l_DiaryPersonPosition>0)
			End if 
		Else 
			If ($_t_DiaryPerson=$_at_DiaryItemOwners{$_l_GetWhoseDiary})
				
				If ($_bo_IncludeStarted)
					$_bo_Included:=True:C214 & ($_bo_Included)
				Else 
					$_bo_IncludeStarted:=True:C214
					$_bo_Included:=True:C214
				End if 
			End if 
		End if 
	End for 
End if 
$_l_Ref:=Find in array:C230($_at_PropertyNames; "FromDate")
$_d_DiaryFromDate:=OB Get:C1224($_Ptr_DiaryRecordObject->; "DateDisplayFrom")
$_l_DiaryDateTimeStamp:=OB Get:C1224($_Ptr_DiaryRecordObject->; "TimeDateStamp")
$_ti_DiaryFromTime:=OB Get:C1224($_Ptr_DiaryRecordObject->; "TimeDisplayFrom")

If ($_l_Ref>0)
	$_d_FromDate:=OB Get:C1224($_ptr_Attributes->; "FromDate")
	$_l_Ref2:=Find in array:C230($_at_PropertyNames; "FromTime")
	If ($_l_Ref2>0)
		//note here we dont search date and time fields else we get everything after the time on days subsequent but not at earlier times on days subsequent which of course is wrong- 
		///its everything after time x on date y..so we get the time stamp of time and date y x and its everything that has a timestamp after that
		$_ti_FromTime:=OB Get:C1224($_ptr_Attributes->; "FromTime")
		$_l_TimeStamp:=GEN_TimeDateStamp($_d_FromDate; $_ti_FromTime)
		If ($_l_DiaryDateTimeStamp>=$_l_TimeStamp)
			If ($_bo_IncludeStarted)
				$_bo_Included:=True:C214 & ($_bo_Included)
			Else 
				$_bo_IncludeStarted:=True:C214
				$_bo_Included:=True:C214
			End if 
		Else 
			If ($_bo_IncludeStarted)
				$_bo_Included:=False:C215 & ($_bo_Included)
			Else 
				$_bo_IncludeStarted:=True:C214
				$_bo_Included:=False:C215
			End if 
		End if 
		
	Else 
		//note here that we use the display date-so that is either the done date or the do date depending on whether it is a done item or not
		
		If ($_d_DiaryFromDate>=$_d_FromDate)
			If ($_bo_IncludeStarted)
				$_bo_Included:=True:C214 & ($_bo_Included)
			Else 
				$_bo_IncludeStarted:=True:C214
				$_bo_Included:=True:C214
			End if 
		Else 
			If ($_bo_IncludeStarted)
				$_bo_Included:=False:C215 & ($_bo_Included)
			Else 
				$_bo_IncludeStarted:=True:C214
				$_bo_Included:=False:C215
			End if 
		End if 
		
		
	End if 
Else 
	$_l_Ref2:=Find in array:C230($_at_PropertyNames; "FromTime")
	
	
	//this would be odd but its still possible(everything after time x on all days?)
	If ($_l_Ref2>0)
		$_ti_FromTime:=OB Get:C1224($_ptr_Attributes->; "FromTime")
		If ($_ti_DiaryFromTime>=$_ti_FromTime)
			If ($_bo_IncludeStarted)
				$_bo_Included:=True:C214 & ($_bo_Included)
			Else 
				$_bo_IncludeStarted:=True:C214
				$_bo_Included:=True:C214
			End if 
		Else 
			If ($_bo_IncludeStarted)
				$_bo_Included:=False:C215 & ($_bo_Included)
			Else 
				$_bo_IncludeStarted:=True:C214
				$_bo_Included:=False:C215
			End if 
		End if 
		
		
		
	End if 
End if 
/////
$_l_Ref:=Find in array:C230($_at_PropertyNames; "ToDate")
$_d_DiaryToDate:=OB Get:C1224($_Ptr_DiaryRecordObject->; "DateDisplayTo")
$_ti_DiaryToTime:=OB Get:C1224($_Ptr_DiaryRecordObject->; "TimeDisplayTo")
$_l_DiaryTimeStamp:=OB Get:C1224($_Ptr_DiaryRecordObject->; "TimeDateStamp")

If ($_l_Ref>0)
	$_d_ToDate:=OB Get:C1224($_ptr_Attributes->; "ToDate")
	
	$_l_Ref2:=Find in array:C230($_at_PropertyNames; "ToTime")
	If ($_l_Ref2>0)
		//note here we dont search date and time fields else we get everything BEFORE the time on days subsequent but not at earlier times on days previous which of course is wrong- 
		///its everything before time x on date y..so we get the time stamp of time and date y x and its everything that has a timestamp before that
		$_ti_FromTime:=OB Get:C1224($_ptr_Attributes->; "ToTime")
		$_l_TimeStamp:=GEN_TimeDateStamp($_d_FromDate; $_ti_FromTime)
		
		If ($_l_DiaryTimeStamp<=$_l_TimeStamp)
			If ($_bo_IncludeStarted)
				$_bo_Included:=True:C214 & ($_bo_Included)
			Else 
				$_bo_IncludeStarted:=True:C214
				$_bo_Included:=True:C214
			End if 
		Else 
			If ($_bo_IncludeStarted)
				$_bo_Included:=False:C215 & ($_bo_Included)
			Else 
				$_bo_IncludeStarted:=True:C214
				$_bo_Included:=False:C215
			End if 
		End if 
		
	Else 
		//note here that we use the display date-so that is either the done date or the do date depending on whether it is a done item or not
		
		If ($_d_DiaryToDate<=$_d_ToDate)
			If ($_bo_IncludeStarted)
				$_bo_Included:=True:C214 & ($_bo_Included)
			Else 
				$_bo_IncludeStarted:=True:C214
				$_bo_Included:=True:C214
			End if 
		Else 
			If ($_bo_IncludeStarted)
				$_bo_Included:=False:C215 & ($_bo_Included)
			Else 
				$_bo_IncludeStarted:=True:C214
				$_bo_Included:=False:C215
			End if 
		End if 
		
	End if 
Else 
	$_l_Ref2:=Find in array:C230($_at_PropertyNames; "ToTime")
	
	//this would be odd but its still possible(everything before time x on all days?)
	If ($_l_Ref2>0)
		$_ti_toTime:=OB Get:C1224($_ptr_Attributes->; "ToTime")
		
		
		If ($_ti_DiaryToTime<=$_ti_toTime)
			If ($_bo_IncludeStarted)
				$_bo_Included:=True:C214 & ($_bo_Included)
			Else 
				$_bo_IncludeStarted:=True:C214
				$_bo_Included:=True:C214
			End if 
		Else 
			If ($_bo_IncludeStarted)
				$_bo_Included:=False:C215 & ($_bo_Included)
			Else 
				$_bo_IncludeStarted:=True:C214
				$_bo_Included:=False:C215
			End if 
		End if 
		
		
		
	End if 
End if 
$_l_Ref:=Find in array:C230($_at_PropertyNames; "ActionCodes")
$_t_DiaryAction:=OB Get:C1224($_Ptr_DiaryRecordObject->; "ActionCode")

If ($_l_Ref>0)
	OB GET ARRAY:C1229($_ptr_Attributes->; "ActionCodes"; $_at_ActionCodes)
	If (Find in array:C230($_at_ActionCodes; $_t_DiaryAction)>0)
		//If ([DIARY]Display_Time_From<=$_ti_FromTime)
		If ($_bo_IncludeStarted)
			$_bo_Included:=True:C214 & ($_bo_Included)
		Else 
			$_bo_IncludeStarted:=True:C214
			$_bo_Included:=True:C214
		End if 
	Else 
		If ($_bo_IncludeStarted)
			$_bo_Included:=False:C215 & ($_bo_Included)
		Else 
			$_bo_IncludeStarted:=True:C214
			$_bo_Included:=False:C215
		End if 
	End if 
	
Else 
	$_l_Ref:=Find in array:C230($_at_PropertyNames; "ActionCode")
	If ($_l_Ref>0)
		$_t_actionCode:=OB Get:C1224($_ptr_Attributes->; "ActionCode")
		If ($_t_actionCode#"")
			
			If ($_t_DiaryAction=$_t_actionCode)
				If ($_bo_IncludeStarted)
					$_bo_Included:=True:C214 & ($_bo_Included)
				Else 
					$_bo_IncludeStarted:=True:C214
					$_bo_Included:=True:C214
				End if 
			Else 
				If ($_bo_IncludeStarted)
					$_bo_Included:=False:C215 & ($_bo_Included)
				Else 
					$_bo_IncludeStarted:=True:C214
					$_bo_Included:=False:C215
				End if 
			End if 
			
			
		End if 
	End if 
	
	
End if 
$_l_Ref:=Find in array:C230($_at_PropertyNames; "ActionDetails")
$_t_DiaryActionDetails:=OB Get:C1224($_Ptr_DiaryRecordObject->; "ActionDetails")

//this would be slightly odd-but note is we do want to search by action details and wildcard should be embedded in the search string already
If ($_l_Ref>0)
	$_t_actionDetails:=OB Get:C1224($_ptr_Attributes->; "ActionDetails")
	
	If ($_t_actionDetails#"")
		
		If ($_t_DiaryActionDetails=$_t_actionDetails)
			If ($_bo_IncludeStarted)
				$_bo_Included:=True:C214 & ($_bo_Included)
			Else 
				$_bo_IncludeStarted:=True:C214
				$_bo_Included:=True:C214
			End if 
		Else 
			If ($_bo_IncludeStarted)
				$_bo_Included:=False:C215 & ($_bo_Included)
			Else 
				$_bo_IncludeStarted:=True:C214
				$_bo_Included:=False:C215
			End if 
		End if 
		
		
		
	End if 
End if 

$_l_Ref:=Find in array:C230($_at_PropertyNames; "ResultCodes")
$_t_DiaryResultCode:=OB Get:C1224($_Ptr_DiaryRecordObject->; "ResultCode")

If ($_l_Ref>0)
	
	OB GET ARRAY:C1229($_ptr_Attributes->; "ResultCodes"; $_at_ResultCodes)
	If (Find in array:C230($_at_ResultCodes; $_t_DiaryResultCode)>0)
		//If ([DIARY]Action_Details=$_t_actionDetails)
		If ($_bo_IncludeStarted)
			$_bo_Included:=True:C214 & ($_bo_Included)
		Else 
			$_bo_IncludeStarted:=True:C214
			$_bo_Included:=True:C214
		End if 
	Else 
		If ($_bo_IncludeStarted)
			$_bo_Included:=False:C215 & ($_bo_Included)
		Else 
			$_bo_IncludeStarted:=True:C214
			$_bo_Included:=False:C215
		End if 
	End if 
	
	
Else 
	$_l_Ref:=Find in array:C230($_at_PropertyNames; "ResultCode")
	If ($_l_Ref>0)
		$_t_ResultCode:=OB Get:C1224($_ptr_Attributes->; "ResultCode")
		If ($_t_ResultCode#"")
			
			If ($_t_DiaryResultCode=$_t_ResultCode)
				
				If ($_bo_IncludeStarted)
					$_bo_Included:=True:C214 & ($_bo_Included)
				Else 
					$_bo_IncludeStarted:=True:C214
					$_bo_Included:=True:C214
				End if 
			Else 
				If ($_bo_IncludeStarted)
					$_bo_Included:=False:C215 & ($_bo_Included)
				Else 
					$_bo_IncludeStarted:=True:C214
					$_bo_Included:=False:C215
				End if 
			End if 
			
			
		End if 
	End if 
	
	
End if 
$_l_Ref:=Find in array:C230($_at_PropertyNames; "ResultDetails")
$_t_DiaryResultDetails:=OB Get:C1224($_Ptr_DiaryRecordObject->; "ResultDetails")

//this would be slightly odd-but note is we do want to search by action details and wildcard should be embedded in the search string already
If ($_l_Ref>0)
	$_t_ResultDetails:=OB Get:C1224($_ptr_Attributes->; "ResultDetails")
	If ($_t_ResultDetails#"")
		
		If ($_t_DiaryResultDetails=$_t_ResultDetails)
			
			If ($_bo_IncludeStarted)
				$_bo_Included:=True:C214 & ($_bo_Included)
			Else 
				$_bo_IncludeStarted:=True:C214
				$_bo_Included:=True:C214
			End if 
		Else 
			If ($_bo_IncludeStarted)
				$_bo_Included:=False:C215 & ($_bo_Included)
			Else 
				$_bo_IncludeStarted:=True:C214
				$_bo_Included:=False:C215
			End if 
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
$_t_DiaryBookingCode:=OB Get:C1224($_Ptr_DiaryRecordObject->; "BookingCode")

If ($_l_Ref>0)
	OB GET ARRAY:C1229($_ptr_Attributes->; "BookingCodes"; $_at_Codes)
	
	If (Find in array:C230($_at_Codes; $_t_DiaryBookingCode)>0)
		
		If ($_bo_IncludeStarted)
			$_bo_Included:=True:C214 & ($_bo_Included)
		Else 
			$_bo_IncludeStarted:=True:C214
			$_bo_Included:=True:C214
		End if 
	Else 
		If ($_bo_IncludeStarted)
			$_bo_Included:=False:C215 & ($_bo_Included)
		Else 
			$_bo_IncludeStarted:=True:C214
			$_bo_Included:=False:C215
		End if 
	End if 
	
	
Else 
	$_l_Ref:=Find in array:C230($_at_PropertyNames; "BookingCode")
	If ($_l_Ref>0)
		$_t_RelatedCode:=OB Get:C1224($_ptr_Attributes->; "BookingCode")
		If ($_t_RelatedCode#"")
			If ($_t_DiaryBookingCode=$_t_RelatedCode)
				
				If ($_bo_IncludeStarted)
					$_bo_Included:=True:C214 & ($_bo_Included)
				Else 
					$_bo_IncludeStarted:=True:C214
					$_bo_Included:=True:C214
				End if 
			Else 
				If ($_bo_IncludeStarted)
					$_bo_Included:=False:C215 & ($_bo_Included)
				Else 
					$_bo_IncludeStarted:=True:C214
					$_bo_Included:=False:C215
				End if 
			End if 
			
			
		End if 
	Else 
		
	End if 
	
	
End if 
$_l_Ref:=Find in array:C230($_at_PropertyNames; "CallCodes")
$_t_DiaryCallCode:=OB Get:C1224($_Ptr_DiaryRecordObject->; "CallCode")

If ($_l_Ref>0)
	OB GET ARRAY:C1229($_ptr_Attributes->; "CallCodes"; $_at_Codes)
	If (Size of array:C274($_at_Codes)>0)
		
		If (Find in array:C230($_at_Codes; $_t_DiaryCallCode)>0)
			
			If ($_bo_IncludeStarted)
				$_bo_Included:=True:C214 & ($_bo_Included)
			Else 
				$_bo_IncludeStarted:=True:C214
				$_bo_Included:=True:C214
			End if 
		Else 
			If ($_bo_IncludeStarted)
				$_bo_Included:=False:C215 & ($_bo_Included)
			Else 
				$_bo_IncludeStarted:=True:C214
				$_bo_Included:=False:C215
			End if 
		End if 
		
		
	End if 
Else 
	$_l_Ref:=Find in array:C230($_at_PropertyNames; "CallCode")
	If ($_l_Ref>0)
		$_t_RelatedCode:=OB Get:C1224($_ptr_Attributes->; "CallCode")
		If ($_t_RelatedCode#"")
			
			If ($_t_DiaryCallCode=$_t_RelatedCode)
				
				If ($_bo_IncludeStarted)
					$_bo_Included:=True:C214 & ($_bo_Included)
				Else 
					$_bo_IncludeStarted:=True:C214
					$_bo_Included:=True:C214
				End if 
			Else 
				If ($_bo_IncludeStarted)
					$_bo_Included:=False:C215 & ($_bo_Included)
				Else 
					$_bo_IncludeStarted:=True:C214
					$_bo_Included:=False:C215
				End if 
			End if 
			
			
		End if 
	Else 
		$_l_Ref:=Find in array:C230($_at_PropertyNames; "RelatedTables")
		If ($_l_Ref>0)
			OB GET ARRAY:C1229($_ptr_Attributes->; "RelatedTables"; $_al_Tables)
			OB GET ARRAY:C1229($_ptr_Attributes->; "RelatedCodes"; $_at_RelatedCodes)
			ARRAY TEXT:C222($_at_Codes; 0)
			For ($_l_BuildCodes; 1; Size of array:C274($_al_Tables))
				If ($_al_Tables{$_l_BuildCodes}=Table:C252(->[SERVICE_CALLS:20]))
					APPEND TO ARRAY:C911($_at_Codes; $_at_RelatedCodes{$_l_BuildCodes})
				End if 
			End for 
			If (Size of array:C274($_at_Codes)>0)
				
				If (Find in array:C230($_at_Codes; [DIARY:12]Call_Code:25)>0)
					
					If ($_bo_IncludeStarted)
						$_bo_Included:=True:C214 & ($_bo_Included)
					Else 
						$_bo_IncludeStarted:=True:C214
						$_bo_Included:=True:C214
					End if 
				Else 
					If ($_bo_IncludeStarted)
						$_bo_Included:=False:C215 & ($_bo_Included)
					Else 
						$_bo_IncludeStarted:=True:C214
						$_bo_Included:=False:C215
					End if 
				End if 
				
				
				
			End if 
			
		Else 
			$_l_Ref:=Find in array:C230($_at_PropertyNames; "RelatedTable")
			If ($_l_Ref>0)
				$_l_TableNumber:=OB Get:C1224($_ptr_Attributes->; "RelatedTable")
				$_t_RelatedCode:=OB Get:C1224($_ptr_Attributes->; "RelatedCode")
				If ($_l_TableNumber=Table:C252(->[SERVICE_CALLS:20]))
					If ($_t_RelatedCode#"")
						
						If ([DIARY:12]Call_Code:25=$_t_RelatedCode)
							
							If ($_bo_IncludeStarted)
								$_bo_Included:=True:C214 & ($_bo_Included)
							Else 
								$_bo_IncludeStarted:=True:C214
								$_bo_Included:=True:C214
							End if 
						Else 
							If ($_bo_IncludeStarted)
								$_bo_Included:=False:C215 & ($_bo_Included)
							Else 
								$_bo_IncludeStarted:=True:C214
								$_bo_Included:=False:C215
							End if 
						End if 
						
						
						
					End if 
				End if 
			End if 
		End if 
		
	End if 
	
	
End if 
$_l_Ref:=Find in array:C230($_at_PropertyNames; "CompanyCodes")
$_t_DiaryCompanyCode:=OB Get:C1224($_Ptr_DiaryRecordObject->; "CompanyCode")

If ($_l_Ref>0)
	OB GET ARRAY:C1229($_ptr_Attributes->; "CompanyCodes"; $_at_Codes)
	
	If (Find in array:C230($_at_Codes; $_t_DiaryCompanyCode)>0)
		
		If ($_bo_IncludeStarted)
			$_bo_Included:=True:C214 & ($_bo_Included)
		Else 
			$_bo_IncludeStarted:=True:C214
			$_bo_Included:=True:C214
		End if 
	Else 
		If ($_bo_IncludeStarted)
			$_bo_Included:=False:C215 & ($_bo_Included)
		Else 
			$_bo_IncludeStarted:=True:C214
			$_bo_Included:=False:C215
		End if 
	End if 
	
	
Else 
	$_l_Ref:=Find in array:C230($_at_PropertyNames; "CompanyCode")
	If ($_l_Ref>0)
		$_t_RelatedCode:=OB Get:C1224($_ptr_Attributes->; "CompanyCode")
		If ($_t_RelatedCode#"")
			
			If ($_t_DiaryCompanyCode=$_t_RelatedCode)
				
				If ($_bo_IncludeStarted)
					$_bo_Included:=True:C214 & ($_bo_Included)
				Else 
					$_bo_IncludeStarted:=True:C214
					$_bo_Included:=True:C214
				End if 
			Else 
				If ($_bo_IncludeStarted)
					$_bo_Included:=False:C215 & ($_bo_Included)
				Else 
					$_bo_IncludeStarted:=True:C214
					$_bo_Included:=False:C215
				End if 
			End if 
			
			
			
		End if 
	Else 
		$_l_Ref:=Find in array:C230($_at_PropertyNames; "RelatedTables")
		If ($_l_Ref>0)
			OB GET ARRAY:C1229($_ptr_Attributes->; "RelatedTables"; $_al_Tables)
			OB GET ARRAY:C1229($_ptr_Attributes->; "RelatedCodes"; $_at_RelatedCodes)
			ARRAY TEXT:C222($_at_Codes; 0)
			For ($_l_BuildCodes; 1; Size of array:C274($_al_Tables))
				If ($_al_Tables{$_l_BuildCodes}=Table:C252(->[COMPANIES:2]))
					APPEND TO ARRAY:C911($_at_Codes; $_at_RelatedCodes{$_l_BuildCodes})
				End if 
			End for 
			If (Size of array:C274($_at_Codes)>0)
				If (Find in array:C230($_at_Codes; $_t_DiaryCompanyCode)>0)
					
					If ($_bo_IncludeStarted)
						$_bo_Included:=True:C214 & ($_bo_Included)
					Else 
						$_bo_IncludeStarted:=True:C214
						$_bo_Included:=True:C214
					End if 
				Else 
					If ($_bo_IncludeStarted)
						$_bo_Included:=False:C215 & ($_bo_Included)
					Else 
						$_bo_IncludeStarted:=True:C214
						$_bo_Included:=False:C215
					End if 
				End if 
				
				
				
			End if 
			
		Else 
			$_l_Ref:=Find in array:C230($_at_PropertyNames; "RelatedTable")
			If ($_l_Ref>0)
				$_l_TableNumber:=OB Get:C1224($_ptr_Attributes->; "RelatedTable")
				$_t_RelatedCode:=OB Get:C1224($_ptr_Attributes->; "RelatedCode")
				If ($_l_TableNumber=Table:C252(->[COMPANIES:2]))
					If ($_t_RelatedCode#"")
						
						If ($_t_DiaryCompanyCode=$_t_RelatedCode)
							
							If ($_bo_IncludeStarted)
								$_bo_Included:=True:C214 & ($_bo_Included)
							Else 
								$_bo_IncludeStarted:=True:C214
								$_bo_Included:=True:C214
							End if 
						Else 
							If ($_bo_IncludeStarted)
								$_bo_Included:=False:C215 & ($_bo_Included)
							Else 
								$_bo_IncludeStarted:=True:C214
								$_bo_Included:=False:C215
							End if 
						End if 
						
					End if 
				End if 
			End if 
		End if 
	End if 
	
	
End if 
$_l_Ref:=Find in array:C230($_at_PropertyNames; "ContactCodes")
$_t_DiaryContactCode:=OB Get:C1224($_Ptr_DiaryRecordObject->; "ContactCode")

If ($_l_Ref>0)
	OB GET ARRAY:C1229($_ptr_Attributes->; "ContactCodes"; $_at_Codes)
	
	If (Find in array:C230($_at_Codes; $_t_DiaryContactCode)>0)
		
		If ($_bo_IncludeStarted)
			$_bo_Included:=True:C214 & ($_bo_Included)
		Else 
			$_bo_IncludeStarted:=True:C214
			$_bo_Included:=True:C214
		End if 
	Else 
		If ($_bo_IncludeStarted)
			$_bo_Included:=False:C215 & ($_bo_Included)
		Else 
			$_bo_IncludeStarted:=True:C214
			$_bo_Included:=False:C215
		End if 
	End if 
	
	
Else 
	$_l_Ref:=Find in array:C230($_at_PropertyNames; "ContactCode")
	If ($_l_Ref>0)
		$_t_RelatedCode:=OB Get:C1224($_ptr_Attributes->; "ContactCode")
		If ($_t_RelatedCode#"")
			
			If ($_t_DiaryContactCode=$_t_RelatedCode)
				
				If ($_bo_IncludeStarted)
					$_bo_Included:=True:C214 & ($_bo_Included)
				Else 
					$_bo_IncludeStarted:=True:C214
					$_bo_Included:=True:C214
				End if 
			Else 
				If ($_bo_IncludeStarted)
					$_bo_Included:=False:C215 & ($_bo_Included)
				Else 
					$_bo_IncludeStarted:=True:C214
					$_bo_Included:=False:C215
				End if 
			End if 
			
			
			
			
			
			
		End if 
	Else 
		$_l_Ref:=Find in array:C230($_at_PropertyNames; "RelatedTables")
		If ($_l_Ref>0)
			OB GET ARRAY:C1229($_ptr_Attributes->; "RelatedTables"; $_al_Tables)
			OB GET ARRAY:C1229($_ptr_Attributes->; "RelatedCodes"; $_at_RelatedCodes)
			ARRAY TEXT:C222($_at_Codes; 0)
			For ($_l_BuildCodes; 1; Size of array:C274($_al_Tables))
				If ($_al_Tables{$_l_BuildCodes}=Table:C252(->[CONTACTS:1]))
					APPEND TO ARRAY:C911($_at_Codes; $_at_RelatedCodes{$_l_BuildCodes})
				End if 
			End for 
			If (Size of array:C274($_at_Codes)>0)
				
				If (Find in array:C230($_at_Codes; $_t_DiaryContactCode)>0)
					
					If ($_bo_IncludeStarted)
						$_bo_Included:=True:C214 & ($_bo_Included)
					Else 
						$_bo_IncludeStarted:=True:C214
						$_bo_Included:=True:C214
					End if 
				Else 
					If ($_bo_IncludeStarted)
						$_bo_Included:=False:C215 & ($_bo_Included)
					Else 
						$_bo_IncludeStarted:=True:C214
						$_bo_Included:=False:C215
					End if 
				End if 
				
				
			End if 
			
		Else 
			$_l_Ref:=Find in array:C230($_at_PropertyNames; "RelatedTable")
			If ($_l_Ref>0)
				$_l_TableNumber:=OB Get:C1224($_ptr_Attributes->; "RelatedTable")
				$_t_RelatedCode:=OB Get:C1224($_ptr_Attributes->; "RelatedCode")
				If ($_l_TableNumber=Table:C252(->[CONTACTS:1]))
					If ($_t_RelatedCode#"")
						
						If ($_t_DiaryContactCode=$_t_RelatedCode)
							
							If ($_bo_IncludeStarted)
								$_bo_Included:=True:C214 & ($_bo_Included)
							Else 
								$_bo_IncludeStarted:=True:C214
								$_bo_Included:=True:C214
							End if 
						Else 
							If ($_bo_IncludeStarted)
								$_bo_Included:=False:C215 & ($_bo_Included)
							Else 
								$_bo_IncludeStarted:=True:C214
								$_bo_Included:=False:C215
							End if 
						End if 
						
						
					End if 
				End if 
			End if 
		End if 
		
	End if 
	
	
End if 

$_l_Ref:=Find in array:C230($_at_PropertyNames; "EventCodes")
$_t_DiaryEventCode:=OB Get:C1224($_Ptr_DiaryRecordObject->; "EventCode")

If ($_l_Ref>0)
	OB GET ARRAY:C1229($_ptr_Attributes->; "EventCodes"; $_at_Codes)
	
	If (Find in array:C230($_at_Codes; $_t_DiaryEventCode)>0)
		
		If ($_bo_IncludeStarted)
			$_bo_Included:=True:C214 & ($_bo_Included)
		Else 
			$_bo_IncludeStarted:=True:C214
			$_bo_Included:=True:C214
		End if 
	Else 
		If ($_bo_IncludeStarted)
			$_bo_Included:=False:C215 & ($_bo_Included)
		Else 
			$_bo_IncludeStarted:=True:C214
			$_bo_Included:=False:C215
		End if 
	End if 
	
Else 
	$_l_Ref:=Find in array:C230($_at_PropertyNames; "EventCode")
	If ($_l_Ref>0)
		$_t_RelatedCode:=OB Get:C1224($_ptr_Attributes->; "EventCode")
		If ($_t_RelatedCode#"")
			
			If ($_t_DiaryEventCode=$_t_RelatedCode)
				
				If ($_bo_IncludeStarted)
					$_bo_Included:=True:C214 & ($_bo_Included)
				Else 
					$_bo_IncludeStarted:=True:C214
					$_bo_Included:=True:C214
				End if 
			Else 
				If ($_bo_IncludeStarted)
					$_bo_Included:=False:C215 & ($_bo_Included)
				Else 
					$_bo_IncludeStarted:=True:C214
					$_bo_Included:=False:C215
				End if 
			End if 
			
			
		End if 
	End if 
	
	
End if 
$_l_Ref:=Find in array:C230($_at_PropertyNames; "JobCodes")
$_t_DiaryJobCode:=OB Get:C1224($_Ptr_DiaryRecordObject->; "JobCode")

If ($_l_Ref>0)
	OB GET ARRAY:C1229($_ptr_Attributes->; "JobCodes"; $_at_Codes)
	
	If (Find in array:C230($_at_Codes; $_t_DiaryJobCode)>0)
		
		If ($_bo_IncludeStarted)
			$_bo_Included:=True:C214 & ($_bo_Included)
		Else 
			$_bo_IncludeStarted:=True:C214
			$_bo_Included:=True:C214
		End if 
	Else 
		If ($_bo_IncludeStarted)
			$_bo_Included:=False:C215 & ($_bo_Included)
		Else 
			$_bo_IncludeStarted:=True:C214
			$_bo_Included:=False:C215
		End if 
	End if 
Else 
	$_l_Ref:=Find in array:C230($_at_PropertyNames; "JobCode")
	If ($_l_Ref>0)
		$_t_RelatedCode:=OB Get:C1224($_ptr_Attributes->; "JobCode")
		If ($_t_RelatedCode#"")
			
			If ($_t_DiaryJobCode=$_t_RelatedCode)
				
				If ($_bo_IncludeStarted)
					$_bo_Included:=True:C214 & ($_bo_Included)
				Else 
					$_bo_IncludeStarted:=True:C214
					$_bo_Included:=True:C214
				End if 
			Else 
				If ($_bo_IncludeStarted)
					$_bo_Included:=False:C215 & ($_bo_Included)
				Else 
					$_bo_IncludeStarted:=True:C214
					$_bo_Included:=False:C215
				End if 
			End if 
			
		Else 
			$_l_Ref:=Find in array:C230($_at_PropertyNames; "RelatedTables")
			If ($_l_Ref>0)
				OB GET ARRAY:C1229($_ptr_Attributes->; "RelatedTables"; $_al_Tables)
				OB GET ARRAY:C1229($_ptr_Attributes->; "RelatedCodes"; $_at_RelatedCodes)
				ARRAY TEXT:C222($_at_Codes; 0)
				For ($_l_BuildCodes; 1; Size of array:C274($_al_Tables))
					If ($_al_Tables{$_l_BuildCodes}=Table:C252(->[JOBS:26]))
						APPEND TO ARRAY:C911($_at_Codes; $_at_RelatedCodes{$_l_BuildCodes})
					End if 
				End for 
				If (Size of array:C274($_at_Codes)>0)
					
					If (Find in array:C230($_at_Codes; $_t_DiaryJobCode)>0)
						
						If ($_bo_IncludeStarted)
							$_bo_Included:=True:C214 & ($_bo_Included)
						Else 
							$_bo_IncludeStarted:=True:C214
							$_bo_Included:=True:C214
						End if 
					Else 
						If ($_bo_IncludeStarted)
							$_bo_Included:=False:C215 & ($_bo_Included)
						Else 
							$_bo_IncludeStarted:=True:C214
							$_bo_Included:=False:C215
						End if 
					End if 
					
					
					
				End if 
				
			Else 
				$_l_Ref:=Find in array:C230($_at_PropertyNames; "RelatedTable")
				If ($_l_Ref>0)
					$_l_TableNumber:=OB Get:C1224($_ptr_Attributes->; "RelatedTable")
					$_t_RelatedCode:=OB Get:C1224($_ptr_Attributes->; "RelatedCode")
					If ($_l_TableNumber=Table:C252(->[JOBS:26]))
						If ($_t_RelatedCode#"")
							If ($_t_DiaryJobCode=$_t_RelatedCode)
								
								If ($_bo_IncludeStarted)
									$_bo_Included:=True:C214 & ($_bo_Included)
								Else 
									$_bo_IncludeStarted:=True:C214
									$_bo_Included:=True:C214
								End if 
							Else 
								If ($_bo_IncludeStarted)
									$_bo_Included:=False:C215 & ($_bo_Included)
								Else 
									$_bo_IncludeStarted:=True:C214
									$_bo_Included:=False:C215
								End if 
							End if 
							
						End if 
					End if 
				End if 
			End if 
			
			
		End if 
	End if 
	
	
End if 

$_l_Ref:=Find in array:C230($_at_PropertyNames; "OrderCodes")
$_t_DiaryOrderCode:=OB Get:C1224($_Ptr_DiaryRecordObject->; "OrderCode")

If ($_l_Ref>0)
	OB GET ARRAY:C1229($_ptr_Attributes->; "OrderCodes"; $_at_Codes)
	
	If (Find in array:C230($_at_Codes; $_t_DiaryOrderCode)>0)
		
		If ($_bo_IncludeStarted)
			$_bo_Included:=True:C214 & ($_bo_Included)
		Else 
			$_bo_IncludeStarted:=True:C214
			$_bo_Included:=True:C214
		End if 
	Else 
		If ($_bo_IncludeStarted)
			$_bo_Included:=False:C215 & ($_bo_Included)
		Else 
			$_bo_IncludeStarted:=True:C214
			$_bo_Included:=False:C215
		End if 
	End if 
	
	
Else 
	$_l_Ref:=Find in array:C230($_at_PropertyNames; "OrderCode")
	If ($_l_Ref>0)
		$_t_RelatedCode:=OB Get:C1224($_ptr_Attributes->; "OrderCode")
		If ($_t_RelatedCode#"")
			If ($_t_DiaryOrderCode=$_t_RelatedCode)
				
				If ($_bo_IncludeStarted)
					$_bo_Included:=True:C214 & ($_bo_Included)
				Else 
					$_bo_IncludeStarted:=True:C214
					$_bo_Included:=True:C214
				End if 
			Else 
				If ($_bo_IncludeStarted)
					$_bo_Included:=False:C215 & ($_bo_Included)
				Else 
					$_bo_IncludeStarted:=True:C214
					$_bo_Included:=False:C215
				End if 
			End if 
			
			
		End if 
	Else 
		$_l_Ref:=Find in array:C230($_at_PropertyNames; "RelatedTables")
		If ($_l_Ref>0)
			OB GET ARRAY:C1229($_ptr_Attributes->; "RelatedTables"; $_al_Tables)
			OB GET ARRAY:C1229($_ptr_Attributes->; "RelatedCodes"; $_at_RelatedCodes)
			ARRAY TEXT:C222($_at_Codes; 0)
			For ($_l_BuildCodes; 1; Size of array:C274($_al_Tables))
				If ($_al_Tables{$_l_BuildCodes}=Table:C252(->[ORDERS:24]))
					APPEND TO ARRAY:C911($_at_Codes; $_at_RelatedCodes{$_l_BuildCodes})
				End if 
			End for 
			If (Size of array:C274($_at_Codes)>0)
				
				If (Find in array:C230($_at_Codes; $_t_DiaryOrderCode)>0)
					
					If ($_bo_IncludeStarted)
						$_bo_Included:=True:C214 & ($_bo_Included)
					Else 
						$_bo_IncludeStarted:=True:C214
						$_bo_Included:=True:C214
					End if 
				Else 
					If ($_bo_IncludeStarted)
						$_bo_Included:=False:C215 & ($_bo_Included)
					Else 
						$_bo_IncludeStarted:=True:C214
						$_bo_Included:=False:C215
					End if 
				End if 
				
				
				
			End if 
			
		Else 
			$_l_Ref:=Find in array:C230($_at_PropertyNames; "RelatedTable")
			If ($_l_Ref>0)
				$_l_TableNumber:=OB Get:C1224($_ptr_Attributes->; "RelatedTable")
				$_t_RelatedCode:=OB Get:C1224($_ptr_Attributes->; "RelatedCode")
				If ($_l_TableNumber=Table:C252(->[ORDERS:24]))
					If ($_t_RelatedCode#"")
						If ($_t_DiaryOrderCode=$_t_RelatedCode)
							
							If ($_bo_IncludeStarted)
								$_bo_Included:=True:C214 & ($_bo_Included)
							Else 
								$_bo_IncludeStarted:=True:C214
								$_bo_Included:=True:C214
							End if 
						Else 
							If ($_bo_IncludeStarted)
								$_bo_Included:=False:C215 & ($_bo_Included)
							Else 
								$_bo_IncludeStarted:=True:C214
								$_bo_Included:=False:C215
							End if 
						End if 
						
					End if 
				End if 
			End if 
		End if 
		
		
		
	End if 
	
	
End if 
$_l_Ref:=Find in array:C230($_at_PropertyNames; "ProductCodes")
$_t_DiaryProductCode:=OB Get:C1224($_Ptr_DiaryRecordObject->; "ProductCode")

If ($_l_Ref>0)
	OB GET ARRAY:C1229($_ptr_Attributes->; "ProductCodes"; $_at_Codes)
	
	If (Find in array:C230($_at_Codes; $_t_DiaryProductCode)>0)
		
		If ($_bo_IncludeStarted)
			$_bo_Included:=True:C214 & ($_bo_Included)
		Else 
			$_bo_IncludeStarted:=True:C214
			$_bo_Included:=True:C214
		End if 
	Else 
		If ($_bo_IncludeStarted)
			$_bo_Included:=False:C215 & ($_bo_Included)
		Else 
			$_bo_IncludeStarted:=True:C214
			$_bo_Included:=False:C215
		End if 
	End if 
	
	
	
Else 
	$_l_Ref:=Find in array:C230($_at_PropertyNames; "ProductCode")
	If ($_l_Ref>0)
		$_t_RelatedCode:=OB Get:C1224($_ptr_Attributes->; "ProductCode")
		If ($_t_RelatedCode#"")
			If ($_t_DiaryProductCode=$_t_RelatedCode)
				
				If ($_bo_IncludeStarted)
					$_bo_Included:=True:C214 & ($_bo_Included)
				Else 
					$_bo_IncludeStarted:=True:C214
					$_bo_Included:=True:C214
				End if 
			Else 
				If ($_bo_IncludeStarted)
					$_bo_Included:=False:C215 & ($_bo_Included)
				Else 
					$_bo_IncludeStarted:=True:C214
					$_bo_Included:=False:C215
				End if 
			End if 
			
		End if 
	Else 
		$_l_Ref:=Find in array:C230($_at_PropertyNames; "RelatedTables")
		If ($_l_Ref>0)
			OB GET ARRAY:C1229($_ptr_Attributes->; "RelatedTables"; $_al_Tables)
			OB GET ARRAY:C1229($_ptr_Attributes->; "RelatedCodes"; $_at_RelatedCodes)
			ARRAY TEXT:C222($_at_Codes; 0)
			For ($_l_BuildCodes; 1; Size of array:C274($_al_Tables))
				If ($_al_Tables{$_l_BuildCodes}=Table:C252(->[PRODUCTS:9]))
					APPEND TO ARRAY:C911($_at_Codes; $_at_RelatedCodes{$_l_BuildCodes})
				End if 
			End for 
			If (Size of array:C274($_at_Codes)>0)
				If (Find in array:C230($_at_Codes; $_t_DiaryProductCode)>0)
					
					If ($_bo_IncludeStarted)
						$_bo_Included:=True:C214 & ($_bo_Included)
					Else 
						$_bo_IncludeStarted:=True:C214
						$_bo_Included:=True:C214
					End if 
				Else 
					If ($_bo_IncludeStarted)
						$_bo_Included:=False:C215 & ($_bo_Included)
					Else 
						$_bo_IncludeStarted:=True:C214
						$_bo_Included:=False:C215
					End if 
				End if 
				
				
			End if 
			
		Else 
			$_l_Ref:=Find in array:C230($_at_PropertyNames; "RelatedTable")
			If ($_l_Ref>0)
				$_l_TableNumber:=OB Get:C1224($_ptr_Attributes->; "RelatedTable")
				$_t_RelatedCode:=OB Get:C1224($_ptr_Attributes->; "RelatedCode")
				If ($_l_TableNumber=Table:C252(->[PRODUCTS:9]))
					If ($_t_RelatedCode#"")
						If ($_t_DiaryProductCode=$_t_RelatedCode)
							
							If ($_bo_IncludeStarted)
								$_bo_Included:=True:C214 & ($_bo_Included)
							Else 
								$_bo_IncludeStarted:=True:C214
								$_bo_Included:=True:C214
							End if 
						Else 
							If ($_bo_IncludeStarted)
								$_bo_Included:=False:C215 & ($_bo_Included)
							Else 
								$_bo_IncludeStarted:=True:C214
								$_bo_Included:=False:C215
							End if 
						End if 
						
						
						
						
					End if 
				End if 
			End if 
		End if 
		
		
		
		
	End if 
	
	
End if 
$_l_Ref:=Find in array:C230($_at_PropertyNames; "StageCodes")
$_t_DiaryStageCode:=OB Get:C1224($_Ptr_DiaryRecordObject->; "StageCode")

If ($_l_Ref>0)
	OB GET ARRAY:C1229($_ptr_Attributes->; "StageCodes"; $_at_Codes)
	
	If (Find in array:C230($_at_Codes; $_t_DiaryStageCode)>0)
		
		If ($_bo_IncludeStarted)
			$_bo_Included:=True:C214 & ($_bo_Included)
		Else 
			$_bo_IncludeStarted:=True:C214
			$_bo_Included:=True:C214
		End if 
	Else 
		If ($_bo_IncludeStarted)
			$_bo_Included:=False:C215 & ($_bo_Included)
		Else 
			$_bo_IncludeStarted:=True:C214
			$_bo_Included:=False:C215
		End if 
	End if 
	
Else 
	$_l_Ref:=Find in array:C230($_at_PropertyNames; "StageCode")
	If ($_l_Ref>0)
		$_t_RelatedCode:=OB Get:C1224($_ptr_Attributes->; "StageCode")
		If ($_t_RelatedCode#"")
			
			If ($_t_DiaryStageCode=$_t_RelatedCode)
				
				If ($_bo_IncludeStarted)
					$_bo_Included:=True:C214 & ($_bo_Included)
				Else 
					$_bo_IncludeStarted:=True:C214
					$_bo_Included:=True:C214
				End if 
			Else 
				If ($_bo_IncludeStarted)
					$_bo_Included:=False:C215 & ($_bo_Included)
				Else 
					$_bo_IncludeStarted:=True:C214
					$_bo_Included:=False:C215
				End if 
			End if 
			
			
		End if 
	Else 
		$_l_Ref:=Find in array:C230($_at_PropertyNames; "RelatedTables")
		If ($_l_Ref>0)
			OB GET ARRAY:C1229($_ptr_Attributes->; "RelatedTables"; $_al_Tables)
			OB GET ARRAY:C1229($_ptr_Attributes->; "RelatedCodes"; $_at_RelatedCodes)
			ARRAY TEXT:C222($_at_Codes; 0)
			For ($_l_BuildCodes; 1; Size of array:C274($_al_Tables))
				If ($_al_Tables{$_l_BuildCodes}=Table:C252(->[JOB_STAGES:47]))
					APPEND TO ARRAY:C911($_at_Codes; $_at_RelatedCodes{$_l_BuildCodes})
				End if 
			End for 
			If (Size of array:C274($_at_Codes)>0)
				
				If (Find in array:C230($_at_Codes; $_t_DiaryStageCode)>0)
					
					If ($_bo_IncludeStarted)
						$_bo_Included:=True:C214 & ($_bo_Included)
					Else 
						$_bo_IncludeStarted:=True:C214
						$_bo_Included:=True:C214
					End if 
				Else 
					If ($_bo_IncludeStarted)
						$_bo_Included:=False:C215 & ($_bo_Included)
					Else 
						$_bo_IncludeStarted:=True:C214
						$_bo_Included:=False:C215
					End if 
				End if 
				
			End if 
			
		Else 
			$_l_Ref:=Find in array:C230($_at_PropertyNames; "RelatedTable")
			If ($_l_Ref>0)
				$_l_TableNumber:=OB Get:C1224($_ptr_Attributes->; "RelatedTable")
				$_t_RelatedCode:=OB Get:C1224($_ptr_Attributes->; "RelatedCode")
				If ($_l_TableNumber=Table:C252(->[JOB_STAGES:47]))
					If ($_t_RelatedCode#"")
						
						If ($_t_DiaryStageCode=$_t_RelatedCode)
							
							If ($_bo_IncludeStarted)
								$_bo_Included:=True:C214 & ($_bo_Included)
							Else 
								$_bo_IncludeStarted:=True:C214
								$_bo_Included:=True:C214
							End if 
						Else 
							If ($_bo_IncludeStarted)
								$_bo_Included:=False:C215 & ($_bo_Included)
							Else 
								$_bo_IncludeStarted:=True:C214
								$_bo_Included:=False:C215
							End if 
						End if 
						
						
					End if 
				End if 
			End if 
		End if 
		
	End if 
	
	
End if 
///
$_l_Ref:=Find in array:C230($_at_PropertyNames; "BudgetUnitsRange")
$_r_DiaryBudgetUnits:=OB Get:C1224($_Ptr_DiaryRecordObject->; "BudgetUnits")

If ($_l_Ref>0)
	//so if there are multiple units what does this mean 2 units
	OB GET ARRAY:C1229($_ptr_Attributes->; "BudgetUnitsRange"; $_ar_Units)  //this will be 2 values upper and lower
	If (Size of array:C274($_ar_Units)=2)
		
		If ($_r_DiaryBudgetUnits>=$_ar_Units{1}) & ($_r_DiaryBudgetUnits<=$_ar_Units{2})
			
			If ($_bo_IncludeStarted)
				$_bo_Included:=True:C214 & ($_bo_Included)
			Else 
				$_bo_IncludeStarted:=True:C214
				$_bo_Included:=True:C214
			End if 
		Else 
			If ($_bo_IncludeStarted)
				$_bo_Included:=False:C215 & ($_bo_Included)
			Else 
				$_bo_IncludeStarted:=True:C214
				$_bo_Included:=False:C215
			End if 
		End if 
		
		
		
		
	End if 
Else 
	$_l_Ref:=Find in array:C230($_at_PropertyNames; "BudgetUnits")
	If ($_l_Ref>0)
		OB GET ARRAY:C1229($_ptr_Attributes->; "BudgetUnits"; $_ar_Units)  //this will be 2 values upper and lower
		//this would be specific values 
		
		If (Find in array:C230($_ar_Units; $_r_DiaryBudgetUnits)>0)
			//If ([DIARY]Budget_Units>=$_ar_Units{1}) & ([DIARY]Budget_Units<=$_ar_Units{2})
			
			If ($_bo_IncludeStarted)
				$_bo_Included:=True:C214 & ($_bo_Included)
			Else 
				$_bo_IncludeStarted:=True:C214
				$_bo_Included:=True:C214
			End if 
		Else 
			If ($_bo_IncludeStarted)
				$_bo_Included:=False:C215 & ($_bo_Included)
			Else 
				$_bo_IncludeStarted:=True:C214
				$_bo_Included:=False:C215
			End if 
		End if 
		
		
		
	Else 
		$_l_Ref:=Find in array:C230($_at_PropertyNames; "BudgetUnit")
		If ($_l_Ref>0)
			$_r_Unit:=OB Get:C1224($_ptr_Attributes->; "BudgetUnit")  //this will be 2 values upper and lower
			//this would be specific values 
			
			If ($_r_Unit=$_r_DiaryBudgetUnits)
				
				If ($_bo_IncludeStarted)
					$_bo_Included:=True:C214 & ($_bo_Included)
				Else 
					$_bo_IncludeStarted:=True:C214
					$_bo_Included:=True:C214
				End if 
			Else 
				If ($_bo_IncludeStarted)
					$_bo_Included:=False:C215 & ($_bo_Included)
				Else 
					$_bo_IncludeStarted:=True:C214
					$_bo_Included:=False:C215
				End if 
			End if 
			
			
			
		End if 
	End if 
End if 

$_l_Ref:=Find in array:C230($_at_PropertyNames; "ChargeRatesRange")
$_r_ChargeRate:=OB Get:C1224($_Ptr_DiaryRecordObject->; "ChargeRate")

If ($_l_Ref>0)
	//so if there are multiple units what does this mean 2 units
	OB GET ARRAY:C1229($_ptr_Attributes->; "ChargeRatesRange"; $_ar_Rates)  //this will be 2 values upper and lower
	If (Size of array:C274($_ar_Rates)=2)
		
		If ($_r_ChargeRate>=$_ar_Units{1}) & ($_r_ChargeRate<=$_ar_Units{2})
			
			If ($_bo_IncludeStarted)
				$_bo_Included:=True:C214 & ($_bo_Included)
			Else 
				$_bo_IncludeStarted:=True:C214
				$_bo_Included:=True:C214
			End if 
		Else 
			If ($_bo_IncludeStarted)
				$_bo_Included:=False:C215 & ($_bo_Included)
			Else 
				$_bo_IncludeStarted:=True:C214
				$_bo_Included:=False:C215
			End if 
		End if 
		
		
		
	End if 
Else 
	$_l_Ref:=Find in array:C230($_at_PropertyNames; "ChargeRates")
	If ($_l_Ref>0)
		OB GET ARRAY:C1229($_ptr_Attributes->; "ChargeRates"; $_ar_Rates)  //this will be 2 values upper and lower
		//this would be specific values 
		
		If (Find in array:C230($_ar_Rates; $_r_ChargeRate)>0)
			//If ([DIARY]Budget_Units>=$_ar_Units{1}) & ([DIARY]Budget_Units<=$_ar_Units{2})
			
			If ($_bo_IncludeStarted)
				$_bo_Included:=True:C214 & ($_bo_Included)
			Else 
				$_bo_IncludeStarted:=True:C214
				$_bo_Included:=True:C214
			End if 
		Else 
			If ($_bo_IncludeStarted)
				$_bo_Included:=False:C215 & ($_bo_Included)
			Else 
				$_bo_IncludeStarted:=True:C214
				$_bo_Included:=False:C215
			End if 
		End if 
		
		
		
	Else 
		$_l_Ref:=Find in array:C230($_at_PropertyNames; "ChargeRate")
		If ($_l_Ref>0)
			$_r_Rate:=OB Get:C1224($_ptr_Attributes->; "ChargeRate")  //this will be 2 values upper and lower
			//this would be specific values 
			
			
			If ($_r_Rate=$_r_ChargeRate)
				
				If ($_bo_IncludeStarted)
					$_bo_Included:=True:C214 & ($_bo_Included)
				Else 
					$_bo_IncludeStarted:=True:C214
					$_bo_Included:=True:C214
				End if 
			Else 
				If ($_bo_IncludeStarted)
					$_bo_Included:=False:C215 & ($_bo_Included)
				Else 
					$_bo_IncludeStarted:=True:C214
					$_bo_Included:=False:C215
				End if 
			End if 
			
			
		End if 
	End if 
End if 


$_l_Ref:=Find in array:C230($_at_PropertyNames; "CostRatesRange")
$_r_CostRate:=OB Get:C1224($_Ptr_DiaryRecordObject->; "CostRate")

If ($_l_Ref>0)
	//so if there are multiple units what does this mean 2 units
	OB GET ARRAY:C1229($_ptr_Attributes->; "CostRatesRange"; $_ar_Rates)  //this will be 2 values upper and lower
	If (Size of array:C274($_ar_Rates)=2)
		
		If ($_r_CostRate>=$_ar_Units{1}) & ($_r_CostRate<=$_ar_Units{2})
			
			If ($_bo_IncludeStarted)
				$_bo_Included:=True:C214 & ($_bo_Included)
			Else 
				$_bo_IncludeStarted:=True:C214
				$_bo_Included:=True:C214
			End if 
		Else 
			If ($_bo_IncludeStarted)
				$_bo_Included:=False:C215 & ($_bo_Included)
			Else 
				$_bo_IncludeStarted:=True:C214
				$_bo_Included:=False:C215
			End if 
		End if 
		
		
	End if 
Else 
	$_l_Ref:=Find in array:C230($_at_PropertyNames; "CostRates")
	If ($_l_Ref>0)
		OB GET ARRAY:C1229($_ptr_Attributes->; "CostRates"; $_ar_Rates)  //this will be 2 values upper and lower
		//this would be specific values 
		
		If (Find in array:C230($_ar_Rates; $_r_CostRate)>0)
			//If ([DIARY]Budget_Units>=$_ar_Units{1}) & ([DIARY]Budget_Units<=$_ar_Units{2})
			
			If ($_bo_IncludeStarted)
				$_bo_Included:=True:C214 & ($_bo_Included)
			Else 
				$_bo_IncludeStarted:=True:C214
				$_bo_Included:=True:C214
			End if 
		Else 
			If ($_bo_IncludeStarted)
				$_bo_Included:=False:C215 & ($_bo_Included)
			Else 
				$_bo_IncludeStarted:=True:C214
				$_bo_Included:=False:C215
			End if 
		End if 
		
		
		
		
	Else 
		$_l_Ref:=Find in array:C230($_at_PropertyNames; "CostRate")
		If ($_l_Ref>0)
			$_r_Rate:=OB Get:C1224($_ptr_Attributes->; "CostRate")  //this will be 2 values upper and lower
			//this would be specific values 
			
			
			If ($_r_Rate=$_r_CostRate)
				
				If ($_bo_IncludeStarted)
					$_bo_Included:=True:C214 & ($_bo_Included)
				Else 
					$_bo_IncludeStarted:=True:C214
					$_bo_Included:=True:C214
				End if 
			Else 
				If ($_bo_IncludeStarted)
					$_bo_Included:=False:C215 & ($_bo_Included)
				Else 
					$_bo_IncludeStarted:=True:C214
					$_bo_Included:=False:C215
				End if 
			End if 
			
			
			
		End if 
	End if 
End if 

///
$_l_Ref:=Find in array:C230($_at_PropertyNames; "CostValuesRange")
$_r_CostValue:=OB Get:C1224($_Ptr_DiaryRecordObject->; "CostValue")

If ($_l_Ref>0)
	//so if there are multiple units what does this mean 2 units
	OB GET ARRAY:C1229($_ptr_Attributes->; "CostValuesRange"; $_ar_Values)  //this will be 2 values upper and lower
	If (Size of array:C274($_ar_Values)=2)
		
		If ($_r_CostValue>=$_ar_Values{1}) & ($_r_CostValue<=$_ar_Values{2})
			
			If ($_bo_IncludeStarted)
				$_bo_Included:=True:C214 & ($_bo_Included)
			Else 
				$_bo_IncludeStarted:=True:C214
				$_bo_Included:=True:C214
			End if 
		Else 
			If ($_bo_IncludeStarted)
				$_bo_Included:=False:C215 & ($_bo_Included)
			Else 
				$_bo_IncludeStarted:=True:C214
				$_bo_Included:=False:C215
			End if 
		End if 
		
		
		
	End if 
Else 
	$_l_Ref:=Find in array:C230($_at_PropertyNames; "CostValues")
	If ($_l_Ref>0)
		OB GET ARRAY:C1229($_ptr_Attributes->; "CostValues"; $_ar_Values)  //this will be 2 values upper and lower
		//this would be specific values 
		
		If (Find in array:C230($_ar_Values; $_r_CostValue)>0)
			//If ([DIARY]Budget_Units>=$_ar_Units{1}) & ([DIARY]Budget_Units<=$_ar_Units{2})
			
			If ($_bo_IncludeStarted)
				$_bo_Included:=True:C214 & ($_bo_Included)
			Else 
				$_bo_IncludeStarted:=True:C214
				$_bo_Included:=True:C214
			End if 
		Else 
			If ($_bo_IncludeStarted)
				$_bo_Included:=False:C215 & ($_bo_Included)
			Else 
				$_bo_IncludeStarted:=True:C214
				$_bo_Included:=False:C215
			End if 
		End if 
		
		
		
	Else 
		$_l_Ref:=Find in array:C230($_at_PropertyNames; "CostValue")
		If ($_l_Ref>0)
			$_r_Value:=OB Get:C1224($_ptr_Attributes->; "CostValue")  //this will be 2 values upper and lower
			//this would be specific values 
			
			
			If ($_r_Value=$_r_CostValue)
				
				If ($_bo_IncludeStarted)
					$_bo_Included:=True:C214 & ($_bo_Included)
				Else 
					$_bo_IncludeStarted:=True:C214
					$_bo_Included:=True:C214
				End if 
			Else 
				If ($_bo_IncludeStarted)
					$_bo_Included:=False:C215 & ($_bo_Included)
				Else 
					$_bo_IncludeStarted:=True:C214
					$_bo_Included:=False:C215
				End if 
			End if 
			
		End if 
	End if 
End if 
///
$_l_Ref:=Find in array:C230($_at_PropertyNames; "ValuesRange")
$_r_DiaryValue:=OB Get:C1224($_Ptr_DiaryRecordObject->; "Value")

If ($_l_Ref>0)
	//so if there are multiple units what does this mean 2 units
	OB GET ARRAY:C1229($_ptr_Attributes->; "ValuesRange"; $_ar_Values)  //this will be 2 values upper and lower
	If (Size of array:C274($_ar_Values)=2)
		
		If ($_r_DiaryValue>=$_ar_Values{1}) & ($_r_DiaryValue<=$_ar_Values{2})
			
			If ($_bo_IncludeStarted)
				$_bo_Included:=True:C214 & ($_bo_Included)
			Else 
				$_bo_IncludeStarted:=True:C214
				$_bo_Included:=True:C214
			End if 
		Else 
			If ($_bo_IncludeStarted)
				$_bo_Included:=False:C215 & ($_bo_Included)
			Else 
				$_bo_IncludeStarted:=True:C214
				$_bo_Included:=False:C215
			End if 
		End if 
		
		
		
	End if 
Else 
	$_l_Ref:=Find in array:C230($_at_PropertyNames; "Values")
	If ($_l_Ref>0)
		OB GET ARRAY:C1229($_ptr_Attributes->; "Values"; $_ar_Values)  //this will be 2 values upper and lower
		//this would be specific values 
		
		If (Find in array:C230($_ar_Values; $_r_DiaryValue)>0)
			//If ([DIARY]Budget_Units>=$_ar_Units{1}) & ([DIARY]Budget_Units<=$_ar_Units{2})
			
			If ($_bo_IncludeStarted)
				$_bo_Included:=True:C214 & ($_bo_Included)
			Else 
				$_bo_IncludeStarted:=True:C214
				$_bo_Included:=True:C214
			End if 
		Else 
			If ($_bo_IncludeStarted)
				$_bo_Included:=False:C215 & ($_bo_Included)
			Else 
				$_bo_IncludeStarted:=True:C214
				$_bo_Included:=False:C215
			End if 
		End if 
		
		
	Else 
		$_l_Ref:=Find in array:C230($_at_PropertyNames; "Value")
		If ($_l_Ref>0)
			$_r_Value:=OB Get:C1224($_ptr_Attributes->; "Value")  //this will be 2 values upper and lower
			//this would be specific values 
			
			
			If ($_r_Value=$_r_DiaryValue)
				
				If ($_bo_IncludeStarted)
					$_bo_Included:=True:C214 & ($_bo_Included)
				Else 
					$_bo_IncludeStarted:=True:C214
					$_bo_Included:=True:C214
				End if 
			Else 
				If ($_bo_IncludeStarted)
					$_bo_Included:=False:C215 & ($_bo_Included)
				Else 
					$_bo_IncludeStarted:=True:C214
					$_bo_Included:=False:C215
				End if 
			End if 
			
		End if 
	End if 
End if 

$_l_Ref:=Find in array:C230($_at_PropertyNames; "TimeChecked")
$_bo_DiaryTimeChecked:=OB Get:C1224($_Ptr_DiaryRecordObject->; "TimeChecked")

If ($_l_Ref>0)
	$_bo_TimeChecked:=OB Get:C1224($_ptr_Attributes->; "TimeChecked")
	
	If ($_bo_DiaryTimeChecked=$_bo_TimeChecked)
		
		If ($_bo_IncludeStarted)
			$_bo_Included:=True:C214 & ($_bo_Included)
		Else 
			$_bo_IncludeStarted:=True:C214
			$_bo_Included:=True:C214
		End if 
	Else 
		If ($_bo_IncludeStarted)
			$_bo_Included:=False:C215 & ($_bo_Included)
		Else 
			$_bo_IncludeStarted:=True:C214
			$_bo_Included:=False:C215
		End if 
	End if 
End if 


$_l_Ref:=Find in array:C230($_at_PropertyNames; "UnitsRange")
$_r_DiaryUnits:=OB Get:C1224($_Ptr_DiaryRecordObject->; "Units")

If ($_l_Ref>0)
	//so if there are multiple units what does this mean 2 units
	OB GET ARRAY:C1229($_ptr_Attributes->; "UnitsRange"; $_ar_Range)  //this will be 2 values upper and lower
	If (Size of array:C274($_ar_Range)=2)
		
		If ($_r_DiaryUnits>=$_ar_Range{1}) & ($_r_DiaryUnits<=$_ar_Range{2})
			
			If ($_bo_IncludeStarted)
				$_bo_Included:=True:C214 & ($_bo_Included)
			Else 
				$_bo_IncludeStarted:=True:C214
				$_bo_Included:=True:C214
			End if 
		Else 
			If ($_bo_IncludeStarted)
				$_bo_Included:=False:C215 & ($_bo_Included)
			Else 
				$_bo_IncludeStarted:=True:C214
				$_bo_Included:=False:C215
			End if 
		End if 
		
		
	End if 
Else 
	$_l_Ref:=Find in array:C230($_at_PropertyNames; "UnitValues")
	If ($_l_Ref>0)
		OB GET ARRAY:C1229($_ptr_Attributes->; "UnitValues"; $_ar_Values)  //this will be 2 values upper and lower
		//this would be specific values 
		
		If (Find in array:C230($_ar_Values; $_r_DiaryUnits)>0)
			//If ([DIARY]Budget_Units>=$_ar_Units{1}) & ([DIARY]Budget_Units<=$_ar_Units{2})
			
			If ($_bo_IncludeStarted)
				$_bo_Included:=True:C214 & ($_bo_Included)
			Else 
				$_bo_IncludeStarted:=True:C214
				$_bo_Included:=True:C214
			End if 
		Else 
			If ($_bo_IncludeStarted)
				$_bo_Included:=False:C215 & ($_bo_Included)
			Else 
				$_bo_IncludeStarted:=True:C214
				$_bo_Included:=False:C215
			End if 
		End if 
		
		
	Else 
		$_l_Ref:=Find in array:C230($_at_PropertyNames; "UnitValue")
		If ($_l_Ref>0)
			$_r_Value:=OB Get:C1224($_ptr_Attributes->; "UnitValue")  //this will be 2 values upper and lower
			//this would be specific values 
			
			
			If ($_r_Value=$_r_DiaryUnits)
				
				If ($_bo_IncludeStarted)
					$_bo_Included:=True:C214 & ($_bo_Included)
				Else 
					$_bo_IncludeStarted:=True:C214
					$_bo_Included:=True:C214
				End if 
			Else 
				If ($_bo_IncludeStarted)
					$_bo_Included:=False:C215 & ($_bo_Included)
				Else 
					$_bo_IncludeStarted:=True:C214
					$_bo_Included:=False:C215
				End if 
			End if 
			
		End if 
	End if 
End if 






$_l_Ref:=Find in array:C230($_at_PropertyNames; "DiaryCodes")
$_t_DiaryRecordCode:=OB Get:C1224($_Ptr_DiaryRecordObject->; "RecordCode")

If ($_l_Ref>0)
	OB GET ARRAY:C1229($_ptr_Attributes->; "DiaryCodes"; $_at_DiaryCodes)
	
	If (Find in array:C230($_at_DiaryCodes; $_t_DiaryRecordCode)>0)
		
		
		If ($_bo_IncludeStarted)
			$_bo_Included:=True:C214 & ($_bo_Included)
		Else 
			$_bo_IncludeStarted:=True:C214
			$_bo_Included:=True:C214
		End if 
	Else 
		If ($_bo_IncludeStarted)
			$_bo_Included:=False:C215 & ($_bo_Included)
		Else 
			$_bo_IncludeStarted:=True:C214
			$_bo_Included:=False:C215
		End if 
	End if 
	
	
Else 
	$_l_Ref:=Find in array:C230($_at_PropertyNames; "DiaryCode")
	If ($_l_Ref>0)
		$_t_DiaryCode:=OB Get:C1224($_ptr_Attributes->; "DiaryCode")
		If ($_t_DiaryCode#"")
			
			If ($_t_DiaryRecordCode=$_t_DiaryCode)
				
				
				If ($_bo_IncludeStarted)
					$_bo_Included:=True:C214 & ($_bo_Included)
				Else 
					$_bo_IncludeStarted:=True:C214
					$_bo_Included:=True:C214
				End if 
			Else 
				If ($_bo_IncludeStarted)
					$_bo_Included:=False:C215 & ($_bo_Included)
				Else 
					$_bo_IncludeStarted:=True:C214
					$_bo_Included:=False:C215
				End if 
			End if 
			
		End if 
	End if 
	
	
End if 
///
$_l_Ref:=Find in array:C230($_at_PropertyNames; "DocumentCodes")
$_t_DiaryDocumentCode:=OB Get:C1224($_Ptr_DiaryRecordObject->; "DocumentCode")

If ($_l_Ref>0)
	OB GET ARRAY:C1229($_ptr_Attributes->; "DocumentCodes"; $_at_DocumentCodes)
	
	If (Find in array:C230($_at_DocumentCodes; $_t_DiaryDocumentCode)>0)
		// ([DIARY]Diary_Code=$_t_DiaryCode)
		
		
		If ($_bo_IncludeStarted)
			$_bo_Included:=True:C214 & ($_bo_Included)
		Else 
			$_bo_IncludeStarted:=True:C214
			$_bo_Included:=True:C214
		End if 
	Else 
		If ($_bo_IncludeStarted)
			$_bo_Included:=False:C215 & ($_bo_Included)
		Else 
			$_bo_IncludeStarted:=True:C214
			$_bo_Included:=False:C215
		End if 
	End if 
	
	
Else 
	$_l_Ref:=Find in array:C230($_at_PropertyNames; "DocumentCode")
	If ($_l_Ref>0)
		$_t_DocCode:=OB Get:C1224($_ptr_Attributes->; "DocumentCode")
		If ($_t_DiaryCode#"")
			
			//If(Find in array($_at_DocumentCodes;[DIARY]Document_Code)>0)
			If ($_t_DiaryDocumentCode=$_t_DocCode)
				
				
				If ($_bo_IncludeStarted)
					$_bo_Included:=True:C214 & ($_bo_Included)
				Else 
					$_bo_IncludeStarted:=True:C214
					$_bo_Included:=True:C214
				End if 
			Else 
				If ($_bo_IncludeStarted)
					$_bo_Included:=False:C215 & ($_bo_Included)
				Else 
					$_bo_IncludeStarted:=True:C214
					$_bo_Included:=False:C215
				End if 
			End if 
			
		End if 
	End if 
	
	
End if 

$_l_Ref:=Find in array:C230($_at_PropertyNames; "CampaignUUIDs")
$_t_DiaryCampaignUUID:=OB Get:C1224($_Ptr_DiaryRecordObject->; "CampaignUUID")

If ($_l_Ref>0)
	OB GET ARRAY:C1229($_ptr_Attributes->; "CampaignUUIDs"; $_at_CampaignUUIDS)
	
	
	If (Find in array:C230($_at_CampaignUUIDS; $_t_DiaryCampaignUUID)>0)
		//If ([DIARY]Document_Code=$_t_DocCode)
		
		
		If ($_bo_IncludeStarted)
			$_bo_Included:=True:C214 & ($_bo_Included)
		Else 
			$_bo_IncludeStarted:=True:C214
			$_bo_Included:=True:C214
		End if 
	Else 
		If ($_bo_IncludeStarted)
			$_bo_Included:=False:C215 & ($_bo_Included)
		Else 
			$_bo_IncludeStarted:=True:C214
			$_bo_Included:=False:C215
		End if 
	End if 
	
	
Else 
	$_l_Ref:=Find in array:C230($_at_PropertyNames; "CampaignUUID")
	If ($_l_Ref>0)
		$_t_CampaignCode:=OB Get:C1224($_ptr_Attributes->; "CampaignUUID")
		If ($_t_DiaryCode#"")
			
			///If (Find in array($_at_CampaignUUIDS;[DIARY]CampaignUUID)>0)
			If ($_t_DiaryCampaignUUID=$_t_CampaignCode)
				
				
				If ($_bo_IncludeStarted)
					$_bo_Included:=True:C214 & ($_bo_Included)
				Else 
					$_bo_IncludeStarted:=True:C214
					$_bo_Included:=True:C214
				End if 
			Else 
				If ($_bo_IncludeStarted)
					$_bo_Included:=False:C215 & ($_bo_Included)
				Else 
					$_bo_IncludeStarted:=True:C214
					$_bo_Included:=False:C215
				End if 
			End if 
			
			
			
		End if 
	End if 
	
	
End if 
$_l_Ref:=Find in array:C230($_at_PropertyNames; "DoAllDay")
$_bo_DiaryDoAllDay:=OB Get:C1224($_Ptr_DiaryRecordObject->; "AllDayEvent")

If ($_l_Ref>0)
	$_bo_DoAllDay:=OB Get:C1224($_ptr_Attributes->; "DoAllDay")
	
	///If (Find in array($_at_CampaignUUIDS;[DIARY]CampaignUUID)>0)
	If ($_bo_DiaryDoAllDay=$_bo_DoAllDay)
		
		
		If ($_bo_IncludeStarted)
			$_bo_Included:=True:C214 & ($_bo_Included)
		Else 
			$_bo_IncludeStarted:=True:C214
			$_bo_Included:=True:C214
		End if 
	Else 
		If ($_bo_IncludeStarted)
			$_bo_Included:=False:C215 & ($_bo_Included)
		Else 
			$_bo_IncludeStarted:=True:C214
			$_bo_Included:=False:C215
		End if 
	End if 
	
End if 
$_l_Ref:=Find in array:C230($_at_PropertyNames; "DoneAllDay")
$_bo_DiaryDoneAllDay:=OB Get:C1224($_Ptr_DiaryRecordObject->; "DoneAllDay")

If ($_l_Ref>0)
	$_bo_DoneAllDay:=OB Get:C1224($_ptr_Attributes->; "DoneAllDay")
	
	///If (Find in array($_at_CampaignUUIDS;[DIARY]CampaignUUID)>0)
	If ($_bo_DiaryDoneAllDay=$_bo_DoneAllDay)
		
		
		If ($_bo_IncludeStarted)
			$_bo_Included:=True:C214 & ($_bo_Included)
		Else 
			$_bo_IncludeStarted:=True:C214
			$_bo_Included:=True:C214
		End if 
	Else 
		If ($_bo_IncludeStarted)
			$_bo_Included:=False:C215 & ($_bo_Included)
		Else 
			$_bo_IncludeStarted:=True:C214
			$_bo_Included:=False:C215
		End if 
	End if 
	
	
End if 
$_l_Ref:=Find in array:C230($_at_PropertyNames; "Done")
$_bo_DiaryDone:=OB Get:C1224($_Ptr_DiaryRecordObject->; "Done")

If ($_l_Ref>0)
	$_bo_Done:=OB Get:C1224($_ptr_Attributes->; "Done")
	
	///If (Find in array($_at_CampaignUUIDS;[DIARY]CampaignUUID)>0)
	If ($_bo_DiaryDone=$_bo_Done)
		
		
		If ($_bo_IncludeStarted)
			$_bo_Included:=True:C214 & ($_bo_Included)
		Else 
			$_bo_IncludeStarted:=True:C214
			$_bo_Included:=True:C214
		End if 
	Else 
		If ($_bo_IncludeStarted)
			$_bo_Included:=False:C215 & ($_bo_Included)
		Else 
			$_bo_IncludeStarted:=True:C214
			$_bo_Included:=False:C215
		End if 
	End if 
	
End if 
If (False:C215)
	$_l_Ref:=Find in array:C230($_at_PropertyNames; "SequenceActioned")
	$_bo_DiaryDone:=OB Get:C1224($_Ptr_DiaryRecordObject->; "Done")
	
	If ($_l_Ref>0)
		$_bo_Actioned:=OB Get:C1224($_ptr_Attributes->; "SequenceActioned")
		
		///If (Find in array($_at_CampaignUUIDS;[DIARY]CampaignUUID)>0)
		If ([DIARY:12]Sequence_Actioned:77=$_bo_Actioned)
			
			
			If ($_bo_IncludeStarted)
				$_bo_Included:=True:C214 & ($_bo_Included)
			Else 
				$_bo_IncludeStarted:=True:C214
				$_bo_Included:=True:C214
			End if 
		Else 
			If ($_bo_IncludeStarted)
				$_bo_Included:=False:C215 & ($_bo_Included)
			Else 
				$_bo_IncludeStarted:=True:C214
				$_bo_Included:=False:C215
			End if 
		End if 
		
	End if 
End if 

$_l_Ref:=Find in array:C230($_at_PropertyNames; "Public")
$_bo_DiaryPublic:=OB Get:C1224($_Ptr_DiaryRecordObject->; "Public")

If ($_l_Ref>0)
	$_bo_Public:=OB Get:C1224($_ptr_Attributes->; "Public")
	
	///If (Find in array($_at_CampaignUUIDS;[DIARY]CampaignUUID)>0)
	If ($_bo_DiaryPublic=$_bo_Public)
		
		
		If ($_bo_IncludeStarted)
			$_bo_Included:=True:C214 & ($_bo_Included)
		Else 
			$_bo_IncludeStarted:=True:C214
			$_bo_Included:=True:C214
		End if 
	Else 
		If ($_bo_IncludeStarted)
			$_bo_Included:=False:C215 & ($_bo_Included)
		Else 
			$_bo_IncludeStarted:=True:C214
			$_bo_Included:=False:C215
		End if 
	End if 
	
End if 


$_l_Ref:=Find in array:C230($_at_PropertyNames; "Priorities")
$_t_DiaryPriority:=OB Get:C1224($_Ptr_DiaryRecordObject->; "Priority")

If ($_l_Ref>0)
	OB GET ARRAY:C1229($_ptr_Attributes->; "Priorities"; $_at_Priorities)
	
	
	If (Find in array:C230($_at_Priorities; $_t_DiaryPriority)>0)
		//If ([DIARY]Public=$_bo_Public)
		
		
		If ($_bo_IncludeStarted)
			$_bo_Included:=True:C214 & ($_bo_Included)
		Else 
			$_bo_IncludeStarted:=True:C214
			$_bo_Included:=True:C214
		End if 
	Else 
		If ($_bo_IncludeStarted)
			$_bo_Included:=False:C215 & ($_bo_Included)
		Else 
			$_bo_IncludeStarted:=True:C214
			$_bo_Included:=False:C215
		End if 
	End if 
	
Else 
	$_l_Ref:=Find in array:C230($_at_PropertyNames; "Priority")
	If ($_l_Ref>0)
		$_t_Priority:=OB Get:C1224($_ptr_Attributes->; "Priority")
		If ($_t_Priority#"")
			
			//If (Find in array($_at_Priorities;[DIARY]Priority)>0)
			If ($_t_DiaryPriority=$_t_Priority)
				
				
				If ($_bo_IncludeStarted)
					$_bo_Included:=True:C214 & ($_bo_Included)
				Else 
					$_bo_IncludeStarted:=True:C214
					$_bo_Included:=True:C214
				End if 
			Else 
				If ($_bo_IncludeStarted)
					$_bo_Included:=False:C215 & ($_bo_Included)
				Else 
					$_bo_IncludeStarted:=True:C214
					$_bo_Included:=False:C215
				End if 
			End if 
			
		End if 
	End if 
End if 
$_l_Ref:=Find in array:C230($_at_PropertyNames; "PersonalPriorities")
$_t_DiaryPersPriority:=OB Get:C1224($_Ptr_DiaryRecordObject->; "PriorityPersonal")

If ($_l_Ref>0)
	OB GET ARRAY:C1229($_ptr_Attributes->; "PersonalPriorities"; $_at_Priorities)
	
	If (Find in array:C230($_at_Priorities; $_t_DiaryPersPriority)>0)
		//If ([DIARY]Priority=$_t_Priority)
		
		
		If ($_bo_IncludeStarted)
			$_bo_Included:=True:C214 & ($_bo_Included)
		Else 
			$_bo_IncludeStarted:=True:C214
			$_bo_Included:=True:C214
		End if 
	Else 
		If ($_bo_IncludeStarted)
			$_bo_Included:=False:C215 & ($_bo_Included)
		Else 
			$_bo_IncludeStarted:=True:C214
			$_bo_Included:=False:C215
		End if 
	End if 
	
Else 
	$_l_Ref:=Find in array:C230($_at_PropertyNames; "PersonalPriority")
	If ($_l_Ref>0)
		$_t_Priority:=OB Get:C1224($_ptr_Attributes->; "PersonalPriority")
		If ($_t_Priority#"")
			
			//If (Find in array($_at_Priorities;[DIARY]Personal_Priority)>0)
			If ($_t_DiaryPersPriority=$_t_Priority)
				
				
				If ($_bo_IncludeStarted)
					$_bo_Included:=True:C214 & ($_bo_Included)
				Else 
					$_bo_IncludeStarted:=True:C214
					$_bo_Included:=True:C214
				End if 
			Else 
				If ($_bo_IncludeStarted)
					$_bo_Included:=False:C215 & ($_bo_Included)
				Else 
					$_bo_IncludeStarted:=True:C214
					$_bo_Included:=False:C215
				End if 
			End if 
			
		End if 
	End if 
End if 

$_l_Ref:=Find in array:C230($_at_PropertyNames; "EmailsFrom")
$_t_DiaryEmailFrom:=OB Get:C1224($_Ptr_DiaryRecordObject->; "EmailFrom")

If ($_l_Ref>0)
	OB GET ARRAY:C1229($_ptr_Attributes->; "EmailsFrom"; $_at_EmailAddresses)
	
	If (Find in array:C230($_at_EmailAddresses; $_t_DiaryEmailFrom)>0)
		//If ([DIARY]Personal_Priority=$_t_Priority)
		
		
		If ($_bo_IncludeStarted)
			$_bo_Included:=True:C214 & ($_bo_Included)
		Else 
			$_bo_IncludeStarted:=True:C214
			$_bo_Included:=True:C214
		End if 
	Else 
		If ($_bo_IncludeStarted)
			$_bo_Included:=False:C215 & ($_bo_Included)
		Else 
			$_bo_IncludeStarted:=True:C214
			$_bo_Included:=False:C215
		End if 
	End if 
	
	
Else 
	$_l_Ref:=Find in array:C230($_at_PropertyNames; "EmailFrom")
	If ($_l_Ref>0)
		$_t_EmailFrom:=OB Get:C1224($_ptr_Attributes->; "EmailFrom")
		If ($_t_EmailFrom#"")
			
			//If (Find in array($_at_EmailAddresses;[DIARY]Email_From)>0)
			If ($_t_DiaryEmailFrom=$_t_EmailFrom)
				
				
				If ($_bo_IncludeStarted)
					$_bo_Included:=True:C214 & ($_bo_Included)
				Else 
					$_bo_IncludeStarted:=True:C214
					$_bo_Included:=True:C214
				End if 
			Else 
				If ($_bo_IncludeStarted)
					$_bo_Included:=False:C215 & ($_bo_Included)
				Else 
					$_bo_IncludeStarted:=True:C214
					$_bo_Included:=False:C215
				End if 
			End if 
			
			
		End if 
		
	End if 
	
End if 
///[DIARY]Document_Heading
$_l_Ref:=Find in array:C230($_at_PropertyNames; "EmailHeadings")
$_t_DiaryHeading:=OB Get:C1224($_Ptr_DiaryRecordObject->; "DocumentHeading")

If ($_l_Ref>0)
	OB GET ARRAY:C1229($_ptr_Attributes->; "EmailHeadings"; $_at_EmailHeadings)
	
	If (Find in array:C230($_at_EmailHeadings; $_t_DiaryHeading)>0)
		//If ([DIARY]Email_From=$_t_EmailFrom)
		
		
		If ($_bo_IncludeStarted)
			$_bo_Included:=True:C214 & ($_bo_Included)
		Else 
			$_bo_IncludeStarted:=True:C214
			$_bo_Included:=True:C214
		End if 
	Else 
		If ($_bo_IncludeStarted)
			$_bo_Included:=False:C215 & ($_bo_Included)
		Else 
			$_bo_IncludeStarted:=True:C214
			$_bo_Included:=False:C215
		End if 
	End if 
	
	
Else 
	$_l_Ref:=Find in array:C230($_at_PropertyNames; "EmailHeading")
	If ($_l_Ref>0)
		$_t_EmailHeading:=OB Get:C1224($_ptr_Attributes->; "EmailHeading")
		If ($_t_EmailHeading#"")
			//If (Find in array($_at_EmailHeadings;[DIARY]Document_Heading)>0)
			If ($_t_DiaryHeading=$_t_EmailHeading)
				
				
				If ($_bo_IncludeStarted)
					$_bo_Included:=True:C214 & ($_bo_Included)
				Else 
					$_bo_IncludeStarted:=True:C214
					$_bo_Included:=True:C214
				End if 
			Else 
				If ($_bo_IncludeStarted)
					$_bo_Included:=False:C215 & ($_bo_Included)
				Else 
					$_bo_IncludeStarted:=True:C214
					$_bo_Included:=False:C215
				End if 
			End if 
			
			
		End if 
		
	End if 
	
End if 


$_l_Ref:=Find in array:C230($_at_PropertyNames; "EmailSubjects")
$_t_DiarySubject:=OB Get:C1224($_Ptr_DiaryRecordObject->; "EmailSubject")

If ($_l_Ref>0)
	OB GET ARRAY:C1229($_ptr_Attributes->; "EmailSubjects"; $_at_EmailSubjects)
	
	If (Find in array:C230($_at_EmailSubjects; $_t_DiarySubject)>0)
		//If ([DIARY]Document_Heading=$_t_EmailHeading)
		
		
		If ($_bo_IncludeStarted)
			$_bo_Included:=True:C214 & ($_bo_Included)
		Else 
			$_bo_IncludeStarted:=True:C214
			$_bo_Included:=True:C214
		End if 
	Else 
		If ($_bo_IncludeStarted)
			$_bo_Included:=False:C215 & ($_bo_Included)
		Else 
			$_bo_IncludeStarted:=True:C214
			$_bo_Included:=False:C215
		End if 
	End if 
	
	
Else 
	$_l_Ref:=Find in array:C230($_at_PropertyNames; "EmailSubject")
	If ($_l_Ref>0)
		$_t_EmailSubject:=OB Get:C1224($_ptr_Attributes->; "EmailSubject")
		If ($_t_EmailSubject#"")
			
			//If (Find in array($_at_EmailSubjects;[DIARY]Email_Subject)>0)
			If ($_t_DiarySubject=$_t_EmailSubject)
				
				
				If ($_bo_IncludeStarted)
					$_bo_Included:=True:C214 & ($_bo_Included)
				Else 
					$_bo_IncludeStarted:=True:C214
					$_bo_Included:=True:C214
				End if 
			Else 
				If ($_bo_IncludeStarted)
					$_bo_Included:=False:C215 & ($_bo_Included)
				Else 
					$_bo_IncludeStarted:=True:C214
					$_bo_Included:=False:C215
				End if 
			End if 
			
			
		End if 
		
	End if 
	
End if 

$_l_Ref:=Find in array:C230($_at_PropertyNames; "EmailContents")
$_t_DiaryEmailText:=OB Get:C1224($_Ptr_DiaryRecordObject->; "EmailText")

//note that any wildcards here should be explicit-ie in the search
If ($_l_Ref>0)
	OB GET ARRAY:C1229($_ptr_Attributes->; "EmailContents"; $_at_EmailSContents)
	
	If (Find in array:C230($_at_EmailSContents; $_t_DiaryEmailText)>0)
		//If ([DIARY]Email_Subject=$_t_EmailSubject)
		
		
		If ($_bo_IncludeStarted)
			$_bo_Included:=True:C214 & ($_bo_Included)
		Else 
			$_bo_IncludeStarted:=True:C214
			$_bo_Included:=True:C214
		End if 
	Else 
		If ($_bo_IncludeStarted)
			$_bo_Included:=False:C215 & ($_bo_Included)
		Else 
			$_bo_IncludeStarted:=True:C214
			$_bo_Included:=False:C215
		End if 
	End if 
	
	
	
Else 
	$_l_Ref:=Find in array:C230($_at_PropertyNames; "EmailContent")
	If ($_l_Ref>0)
		$_t_EmailContent:=OB Get:C1224($_ptr_Attributes->; "EmailContent")
		If ($_t_EmailContent#"")
			
			//If (Find in array($_at_EmailSContents;[DIARY]Email_Text)>0)
			If ($_t_DiaryEmailText=$_t_EmailContent)
				
				
				If ($_bo_IncludeStarted)
					$_bo_Included:=True:C214 & ($_bo_Included)
				Else 
					$_bo_IncludeStarted:=True:C214
					$_bo_Included:=True:C214
				End if 
			Else 
				If ($_bo_IncludeStarted)
					$_bo_Included:=False:C215 & ($_bo_Included)
				Else 
					$_bo_IncludeStarted:=True:C214
					$_bo_Included:=False:C215
				End if 
			End if 
			
		End if 
		
	End if 
	
End if 
//by default we always exclude deleted diary items. it would be odd to want them but its an option
$_l_Ref:=Find in array:C230($_at_PropertyNames; "IncludeDeleted")
$_l_DiaryDeleted:=OB Get:C1224($_Ptr_DiaryRecordObject->; "Deleted")

If ($_l_Ref>0)
	$_bo_IncludeDeleted:=OB Get:C1224($_ptr_Attributes->; "IncludeDeleted")
	If (Not:C34($_bo_IncludeDeleted))  //if this is true(ie include deleted we dont need to do anything here)
		
		//If (Find in array($_at_EmailSContents;[DIARY]Email_Text)>0)
		If ($_l_DiaryDeleted=0)
			
			
			If ($_bo_IncludeStarted)
				$_bo_Included:=True:C214 & ($_bo_Included)
			Else 
				$_bo_IncludeStarted:=True:C214
				$_bo_Included:=True:C214
			End if 
		Else 
			If ($_bo_IncludeStarted)
				$_bo_Included:=False:C215 & ($_bo_Included)
			Else 
				$_bo_IncludeStarted:=True:C214
				$_bo_Included:=False:C215
			End if 
		End if 
		
	End if 
Else 
	If ($_l_DiaryDeleted=0)
		If ($_bo_IncludeStarted)
			$_bo_Included:=True:C214 & ($_bo_Included)
		Else 
			$_bo_IncludeStarted:=True:C214
			$_bo_Included:=True:C214
		End if 
	Else 
		If ($_bo_IncludeStarted)
			$_bo_Included:=False:C215 & ($_bo_Included)
		Else 
			$_bo_IncludeStarted:=True:C214
			$_bo_Included:=False:C215
		End if 
	End if 
	
	
End if 

$_l_Ref:=Find in array:C230($_at_PropertyNames; "DiaryStati")
$_t_DiaryStatus:=OB Get:C1224($_Ptr_DiaryRecordObject->; "Status")

//note that any wildcards here should be explicit-ie in the search
If ($_l_Ref>0)
	OB GET ARRAY:C1229($_ptr_Attributes->; "DiaryStati"; $_at_EmailStates)
	
	If (Find in array:C230($_at_EmailStates; $_t_DiaryStatus)>0)
		
		//If ([DIARY]Deleted=False)
		
		
		If ($_bo_IncludeStarted)
			$_bo_Included:=True:C214 & ($_bo_Included)
		Else 
			$_bo_IncludeStarted:=True:C214
			$_bo_Included:=True:C214
		End if 
	Else 
		If ($_bo_IncludeStarted)
			$_bo_Included:=False:C215 & ($_bo_Included)
		Else 
			$_bo_IncludeStarted:=True:C214
			$_bo_Included:=False:C215
		End if 
	End if 
	
	
	
	
Else 
	$_l_Ref:=Find in array:C230($_at_PropertyNames; "DiaryStatus")
	If ($_l_Ref>0)
		$_t_Status:=OB Get:C1224($_ptr_Attributes->; "DiaryStatus")
		If ($_t_Status#"")
			
			
			//If (Find in array($_at_EmailStates;[DIARY]Status)>0)
			If ($_t_DiaryStatus=$_t_Status)
				If ($_bo_IncludeStarted)
					$_bo_Included:=True:C214 & ($_bo_Included)
				Else 
					$_bo_IncludeStarted:=True:C214
					$_bo_Included:=True:C214
				End if 
			Else 
				If ($_bo_IncludeStarted)
					$_bo_Included:=False:C215 & ($_bo_Included)
				Else 
					$_bo_IncludeStarted:=True:C214
					$_bo_Included:=False:C215
				End if 
			End if 
		End if 
		
	End if 
	
End if 


$_l_Ref:=Find in array:C230($_at_PropertyNames; "ThreadIDS")
$_l_DiaryThreadID:=OB Get:C1224($_Ptr_DiaryRecordObject->; "ThreadID")

//note that any wildcards here should be explicit-ie in the search
If ($_l_Ref>0)
	OB GET ARRAY:C1229($_ptr_Attributes->; "ThreadIDS"; $_al_ThreadIDS)
	
	If (Find in array:C230($_al_ThreadIDS; $_l_DiaryThreadID)>0)
		//If ([DIARY]Status=$_t_Status)
		If ($_bo_IncludeStarted)
			$_bo_Included:=True:C214 & ($_bo_Included)
		Else 
			$_bo_IncludeStarted:=True:C214
			$_bo_Included:=True:C214
		End if 
	Else 
		If ($_bo_IncludeStarted)
			$_bo_Included:=False:C215 & ($_bo_Included)
		Else 
			$_bo_IncludeStarted:=True:C214
			$_bo_Included:=False:C215
		End if 
	End if 
	
	
	
	
Else 
	$_l_Ref:=Find in array:C230($_at_PropertyNames; "ThreadID")
	If ($_l_Ref>0)
		$_l_ThreadID:=OB Get:C1224($_ptr_Attributes->; "ThreadID")
		If ($_t_Status#"")
			
			//If (Find in array($_al_ThreadIDS;[DIARY]ThreadID)>0)
			If ($_l_DiaryThreadID=$_l_ThreadID)
				If ($_bo_IncludeStarted)
					$_bo_Included:=True:C214 & ($_bo_Included)
				Else 
					$_bo_IncludeStarted:=True:C214
					$_bo_Included:=True:C214
				End if 
			Else 
				If ($_bo_IncludeStarted)
					$_bo_Included:=False:C215 & ($_bo_Included)
				Else 
					$_bo_IncludeStarted:=True:C214
					$_bo_Included:=False:C215
				End if 
			End if 
			
		End if 
		
	End if 
	
End if 
$0:=$_bo_Included
ERR_MethodTrackerReturn("SD3_MatchDiaryProperties"; $_t_oldMethodName)
