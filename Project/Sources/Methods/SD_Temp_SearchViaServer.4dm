//%attributes = {}

If (False:C215)
	//Database Method Name:      SD_Temp_SearchViaServer
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 23/10/2012 07:10
	//Method Name: SD_Temp_SearchViaServer
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	//End Project method Amendments
	
	//------------------ Revision Control ----------------
	//Date Created:  28/09/2019
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD_abo_DoneStatus;0)
	//ARRAY DATE(SD_ad_DateStampValues;0)
	//ARRAY DATE(SD_ad_DateStampValues2;0)
	//ARRAY DATE(SD_ad_SortDate;0)
	//ARRAY LONGINT(<>SD_al_CombineGroupDiaries;0)
	//ARRAY LONGINT(<>SD_al_CombinePersonDiaries;0)
	//ARRAY LONGINT(<>SD_al_CombineResourceDiaries;0)
	ARRAY LONGINT:C221($_al_CombineGroupDiaries; 0)
	ARRAY LONGINT:C221($_al_CombinePersonDiaries; 0)
	ARRAY LONGINT:C221($_al_CombineResourceDiaries; 0)
	ARRAY LONGINT:C221($_al_DiaryPersonIDS; 0)
	ARRAY LONGINT:C221($_al_FieldNumbers; 0)
	ARRAY LONGINT:C221($_al_TableNumbers; 0)
	ARRAY LONGINT:C221($_al_UsedIDS; 0)
	//ARRAY LONGINT(SD_al_DateStamp;0)
	//ARRAY LONGINT(SD_al_ItemTimeValues;0)
	//ARRAY LONGINT(SD_al_ItemTimeValues2;0)
	//ARRAY LONGINT(SD_al_MyDiaryGroupIDS;0)
	//ARRAY LONGINT(SD_al_RecordNumbers;0)
	//ARRAY LONGINT(SD_al_Time;0)
	//ARRAY LONGINT(SD_al_Time2;0)
	//ARRAY LONGINT(SD_l_aMyDiaryGroupIDS;0)
	ARRAY TEXT:C222($_at_ActionCodes; 0)
	ARRAY TEXT:C222($_at_Conjuctions; 0)
	ARRAY TEXT:C222($_at_FIeldValues; 0)
	ARRAY TEXT:C222($_at_ResultCodes; 0)
	ARRAY TEXT:C222($_at_StatusCodes; 0)
	//ARRAY TEXT(SD_at_ActionDetails;0)
	//ARRAY TEXT(SD_at_ActionDetails2;0)
	//ARRAY TEXT(SD_at_CompanyCodes;0)
	//ARRAY TEXT(SD_at_ContactCodes;0)
	//ARRAY TEXT(SD_at_ItemActionCode;0)
	//ARRAY TEXT(SD_at_ItemActionDescription;0)
	//ARRAY TEXT(SD_at_ItemCodeValues;0)
	//ARRAY TEXT(SD_at_ItemPerson;0)
	//ARRAY TEXT(SD_at_MyDiaryGroups;0)
	//ARRAY TEXT(WS_at_DiaryVIewTab;0)
	C_BOOLEAN:C305($_bo_ExcludeCompleted; $_bo_Extra; $_bo_FromQuery; $_bo_NoExtra; $_bo_NoQuery; SD3_bo_FloatingDiarydisplayed)
	C_DATE:C307($_d_EndDate; $_d_StartDate; $2; $3)
	C_LONGINT:C283($_l_ActionRow; $_l_FixIndex; $_l_IncludeDocs; $_l_Index; $_l_OpenClosed; $_l_PersonID; $4; SD_l_IncludeCompleted)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_ApplicationVersion; $_t_oldMethodName; $1; $5; SD_t_ProcRelationActionID)
	C_TIME:C306($_ti_EndTime; $_ti_StartTime; SD_ti_GetTime)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_Temp_SearchViaServer")

If (Count parameters:C259>=1)
	QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=$1)
	$_l_PersonID:=[PERSONNEL:11]Personnel_ID:48
	ARRAY LONGINT:C221($_al_DiaryPersonIDS; 0)
	ARRAY LONGINT:C221($_al_UsedIDS; 0)
	If ((Size of array:C274(<>SD_al_CombineGroupDiaries)>0) | (Size of array:C274(<>SD_al_CombinePersonDiaries)>0) | (Size of array:C274(<>SD_al_CombineResourceDiaries)>0)) | (SD3_bo_FloatingDiarydisplayed)
		ARRAY LONGINT:C221($_al_CombinePersonDiaries; 0)
		ARRAY LONGINT:C221($_al_CombineResourceDiaries; 0)
		ARRAY LONGINT:C221($_al_CombineGroupDiaries; 0)
		ARRAY LONGINT:C221($_al_CombinePersonDiaries; 0)
		COPY ARRAY:C226(<>SD_al_CombinePersonDiaries; $_al_CombinePersonDiaries)
		COPY ARRAY:C226(<>SD_al_CombineResourceDiaries; $_al_CombineResourceDiaries)
		COPY ARRAY:C226(<>SD_al_CombineGroupDiaries; $_al_CombineGroupDiaries)
		COPY ARRAY:C226(<>SD_al_CombinePersonDiaries; $_al_CombinePersonDiaries)
		For ($_l_Index; 1; Size of array:C274(SD_at_MyDiaryGroups))
			If (Find in array:C230($_al_DiaryPersonIDS; SD_al_MyDiaryGroupIDS{$_l_Index})<0)
				APPEND TO ARRAY:C911($_al_DiaryPersonIDS; SD_al_MyDiaryGroupIDS{$_l_Index})
			End if 
		End for 
		For ($_l_Index; 1; Size of array:C274($_al_CombinePersonDiaries))
			$_l_ActionRow:=Find in array:C230($_al_DiaryPersonIDS; $_al_CombinePersonDiaries{$_l_Index})
			If ($_l_ActionRow<0)
				APPEND TO ARRAY:C911($_al_DiaryPersonIDS; $_al_CombinePersonDiaries{$_l_Index})
			End if 
		End for 
		For ($_l_Index; 1; Size of array:C274($_al_CombineResourceDiaries))
			$_l_ActionRow:=Find in array:C230($_al_DiaryPersonIDS; $_al_CombineResourceDiaries{$_l_Index})
			If ($_l_ActionRow<0)
				APPEND TO ARRAY:C911($_al_DiaryPersonIDS; $_al_CombineResourceDiaries{$_l_Index})
			End if 
			
		End for 
		For ($_l_Index; 1; Size of array:C274($_al_CombineGroupDiaries))
			$_l_ActionRow:=Find in array:C230($_al_DiaryPersonIDS; $_al_CombinePersonDiaries{$_l_Index})
			If ($_l_ActionRow<0)
				APPEND TO ARRAY:C911($_al_DiaryPersonIDS; $_al_CombineResourceDiaries{$_l_Index})
			End if 
		End for 
	Else 
		APPEND TO ARRAY:C911($_al_DiaryPersonIDS; $_l_PersonID)
		
	End if 
	If (Count parameters:C259>=2)
		
		$_d_StartDate:=$2
	Else 
		$_d_StartDate:=!00-00-00!
	End if 
	If (Count parameters:C259>=3)
		$_d_EndDate:=$3
	Else 
		$_d_EndDate:=!00-00-00!
	End if 
	ARRAY LONGINT:C221($_al_TableNumbers; 0)
	ARRAY LONGINT:C221($_al_FieldNumbers; 0)
	ARRAY TEXT:C222($_at_FIeldValues; 0)
	ARRAY TEXT:C222($_at_Conjuctions; 0)
	$_bo_NoExtra:=False:C215
	If (Count parameters:C259>=4)
		$_bo_FromQuery:=($4=-1)
	Else 
		$_bo_FromQuery:=False:C215
	End if 
	$_bo_NoQuery:=False:C215
	If (Count parameters:C259>=4)
		$_bo_NoExtra:=True:C214
		Case of 
			: ($4=-1)  //selection made(from diary manager!)
				//NO QUERY
				$_bo_NoQuery:=True:C214
			: ($4=2)  //companies(table num)
				APPEND TO ARRAY:C911($_al_TableNumbers; Table:C252(->[COMPANIES:2]))
				APPEND TO ARRAY:C911($_al_FieldNumbers; Field:C253(->[COMPANIES:2]Company_Code:1))
				APPEND TO ARRAY:C911($_at_FIeldValues; $5)
				APPEND TO ARRAY:C911($_at_Conjuctions; "&")
				//QUERY([DIARY];[DIARY]Company Code=$5)
				
				
			: ($4=Table:C252(->[CONTACTS:1]))  //
				APPEND TO ARRAY:C911($_al_TableNumbers; Table:C252(->[CONTACTS:1]))
				APPEND TO ARRAY:C911($_al_FieldNumbers; Field:C253(->[CONTACTS:1]Contact_Code:2))
				APPEND TO ARRAY:C911($_at_FIeldValues; $5)
				APPEND TO ARRAY:C911($_at_Conjuctions; "&")
				
				
			: ($4=Table:C252(->[PRODUCTS:9]))  //product code
				APPEND TO ARRAY:C911($_al_TableNumbers; Table:C252(->[PRODUCTS:9]))
				APPEND TO ARRAY:C911($_al_FieldNumbers; Field:C253(->[PRODUCTS:9]Product_Code:1))
				APPEND TO ARRAY:C911($_at_FIeldValues; $5)
				APPEND TO ARRAY:C911($_at_Conjuctions; "&")
			: ($4=Table:C252(->[DOCUMENTS:7]))  //document code
				APPEND TO ARRAY:C911($_al_TableNumbers; Table:C252(->[DOCUMENTS:7]))
				APPEND TO ARRAY:C911($_al_FieldNumbers; Field:C253(->[DOCUMENTS:7]Document_Code:1))
				APPEND TO ARRAY:C911($_at_FIeldValues; $5)
				APPEND TO ARRAY:C911($_at_Conjuctions; "&")
				
				
			: ($4=Table:C252(->[JOBS:26]))  //Jobs_Code
				APPEND TO ARRAY:C911($_al_TableNumbers; Table:C252(->[JOBS:26]))
				APPEND TO ARRAY:C911($_al_FieldNumbers; Field:C253(->[JOBS:26]Job_Code:1))
				APPEND TO ARRAY:C911($_at_FIeldValues; $5)
				APPEND TO ARRAY:C911($_at_Conjuctions; "&")
				
			: ($4=Table:C252(->[ORDERS:24]))  //Orders_Code
				APPEND TO ARRAY:C911($_al_TableNumbers; Table:C252(->[ORDERS:24]))
				APPEND TO ARRAY:C911($_al_FieldNumbers; Field:C253(->[ORDERS:24]Order_Code:3))
				APPEND TO ARRAY:C911($_at_FIeldValues; $5)
				APPEND TO ARRAY:C911($_at_Conjuctions; "&")
				
			: ($4=Table:C252(->[SERVICE_CALLS:20]))  //service calls
				APPEND TO ARRAY:C911($_al_TableNumbers; Table:C252(->[SERVICE_CALLS:20]))
				APPEND TO ARRAY:C911($_al_FieldNumbers; Field:C253(->[SERVICE_CALLS:20]Call_Code:4))
				APPEND TO ARRAY:C911($_at_FIeldValues; $5)
				APPEND TO ARRAY:C911($_at_Conjuctions; "&")
				
			: ($4=Table:C252(->[DIARY:12]))  //service calls
				APPEND TO ARRAY:C911($_al_TableNumbers; Table:C252(->[DIARY:12]))
				APPEND TO ARRAY:C911($_al_FieldNumbers; Field:C253(->[DIARY:12]Diary_Code:3))
				APPEND TO ARRAY:C911($_at_FIeldValues; $5)
				APPEND TO ARRAY:C911($_at_Conjuctions; "&")
				
		End case 
		
	End if 
	//SD_t_ProcRelationActionID  `Action code
	ARRAY TEXT:C222($_at_ActionCodes; 0)
	If (SD_t_ProcRelationActionID#"")
		APPEND TO ARRAY:C911($_at_ActionCodes; SD_t_ProcRelationActionID)
	End if 
	SD_t_ProcRelationActionID:=""
	
	$_bo_ExcludeCompleted:=(SD_l_IncludeCompleted=0)
	If ($_bo_ExcludeCompleted)
		$_l_OpenClosed:=1
	Else 
		$_l_OpenClosed:=2
	End if 
	$_l_IncludeDocs:=0
	$_ti_StartTime:=?00:00:00?
	$_ti_EndTime:=$_ti_StartTime
	ARRAY TEXT:C222($_at_ResultCodes; 0)
	ARRAY TEXT:C222($_at_StatusCodes; 0)
	If (Not:C34($_bo_NoQuery))
		SD2_GetSetFromServer(->$_al_DiaryPersonIDS; ->$_at_ActionCodes; $_l_IncludeDocs; $_d_StartDate; $_d_EndDate; $_ti_StartTime; $_ti_EndTime; $_l_OpenClosed; ->$_at_ResultCodes; ->$_at_StatusCodes; ->$_al_TableNumbers; ->$_al_FieldNumbers; ->$_at_FIeldValues; ->$_at_Conjuctions)
	End if   //That is stuff in the current date range.
	//Now find the workflow items--overdue items
	$_bo_Extra:=False:C215
	If ($1=<>PER_t_CurrentUserInitials) & ($_bo_NoExtra=False:C215)
		Case of 
			: (Year of:C25(Current date:C33(*))=Year of:C25($2)) & (Month of:C24(Current date:C33(*))=Month of:C24($2))
				Case of 
					: (Day of:C23($2)=1)  //monthly view( or view first day of month)
						
						$_bo_Extra:=True:C214
					: ($2=Current date:C33(*)) & ($2=$3)  //view today
						$_bo_Extra:=True:C214
					: (WS_at_DiaryVIewTab=2) & ((Current date:C33(*)-7)<$2)
						$_bo_Extra:=True:C214
						
						
				End case 
		End case 
		
	End if 
	If ($_bo_Extra) & (Not:C34($_bo_NoQuery))
		ALL RECORDS:C47([ACTIONS:13])
		SELECTION TO ARRAY:C260([ACTIONS:13]Action_Code:1; $_at_ActionCodes)
		
		$_l_ActionRow:=Find in array:C230($_at_ActionCodes; "EVENT")
		If ($_l_ActionRow>0)
			DELETE FROM ARRAY:C228($_at_ActionCodes; $_l_ActionRow)
		End if 
		CREATE SET:C116([DIARY:12]; "$TEMP")
		SD2_GetSetFromServer(->$_al_DiaryPersonIDS; ->$_at_ActionCodes; $_l_IncludeDocs; !1900-01-01!; Current date:C33(*)-1; $_ti_StartTime; $_ti_EndTime; 1)
		CREATE SET:C116([DIARY:12]; "$TEMP2")
		UNION:C120("$TEMP2"; "$TEMP"; "$TEMP")
		USE SET:C118("$TEMP")
		CLEAR SET:C117("$TEMP")
		CLEAR SET:C117("$TEMP2")
		//Ok so we don't win much here because the beast still uses this screen
	End if 
	If (Records in selection:C76([DIARY:12])>0)
		If (Not:C34($_bo_FromQuery))
			ARRAY LONGINT:C221(SD_al_DateStamp; 0)
			ARRAY BOOLEAN:C223(SD_abo_DoneStatus; 0)
			ARRAY LONGINT:C221(SD_al_Time; 0)
			ARRAY LONGINT:C221(SD_al_Time2; 0)
			ARRAY LONGINT:C221(SD_al_RecordNumbers; 0)
			ARRAY TEXT:C222(SD_at_ItemCodeValues; 0)
			ARRAY TEXT:C222(SD_at_ActionDetails; 0)
			ARRAY LONGINT:C221(SD_al_ItemTimeValues; 0)
			ARRAY LONGINT:C221(SD_al_ItemTimeValues2; 0)
			ARRAY DATE:C224(SD_ad_DateStampValues; 0)
			ARRAY TEXT:C222(SD_at_ItemActionCode; 0)
			// End if
			ARRAY TEXT:C222(SD_at_CompanyCodes; 0)
			ARRAY TEXT:C222(SD_at_ContactCodes; 0)
			ARRAY DATE:C224(SD_ad_DateStampValues2; 0)
			SELECTION TO ARRAY:C260([DIARY:12]Company_Code:1; SD_at_CompanyCodes; [DIARY:12]Contact_Code:2; SD_at_ContactCodes; [DIARY:12]Date_Do_To:33; SD_ad_DateStampValues2)
			SELECTION TO ARRAY:C260([DIARY:12]; SD_al_RecordNumbers; [DIARY:12]Diary_Code:3; SD_at_ItemCodeValues; [DIARY:12]Date_Do_From:4; SD_ad_DateStampValues; [DIARY:12]Action_Details:10; SD_at_ActionDetails; [DIARY:12]Result_Description:12; SD_at_ActionDetails2; [DIARY:12]Date_Time_Stamp:45; SD_al_ItemTimeValues; [DIARY:12]Action_Code:9; SD_at_ItemActionCode; [DIARY:12]Person:8; SD_at_ItemPerson; [DIARY:12]Date_Stamp:46; SD_al_DateStamp; [DIARY:12]Done:14; SD_abo_DoneStatus; [DIARY:12]Time_Do_From:6; SD_al_Time; [DIARY:12]Time_Do_To:35; SD_al_Time2)
			$_l_ActionRow:=Find in array:C230(SD_ad_DateStampValues; !00-00-00!)
			If ($_l_ActionRow>0)
				For ($_l_FixIndex; $_l_ActionRow; Size of array:C274(SD_ad_DateStampValues))
					If (SD_ad_DateStampValues{$_l_FixIndex}=!00-00-00!)
						SD_ad_DateStampValues{$_l_FixIndex}:=Current date:C33(*)
					End if 
					
				End for 
				
			End if 
			ARRAY TEXT:C222(SD_at_ItemActionDescription; 0)
			ARRAY DATE:C224(SD_ad_SortDate; 0)
			ARRAY TEXT:C222(SD_at_ItemActionDescription; Size of array:C274(SD_at_ItemCodeValues))
			ARRAY DATE:C224(SD_ad_SortDate; Size of array:C274(SD_al_DateStamp))
			SD_ti_GetTime:=?00:00:00?
			UNLOAD RECORD:C212([DIARY:12])
			$_t_ApplicationVersion:=Application version:C493
			If (False:C215)
				If (Num:C11($_t_ApplicationVersion)<670)
					For ($_l_Index; 1; Size of array:C274(SD_at_ActionDetails))
						If ((SD_abo_DoneStatus{$_l_Index}) & (SD_at_ActionDetails2{$_l_Index}#"")) | (SD_at_ActionDetails{$_l_Index}="")
							SD_at_ItemActionDescription{$_l_Index}:=Replace string:C233(Substring:C12(SD_at_ActionDetails2{$_l_Index}; 1; 25); Char:C90(13); " ")
							SD_at_ItemActionDescription{$_l_Index}:=Replace string:C233(SD_at_ItemActionDescription{$_l_Index}; Char:C90(10); " ")
						Else 
							SD_at_ItemActionDescription{$_l_Index}:=Replace string:C233(Substring:C12(SD_at_ActionDetails{$_l_Index}; 1; 25); Char:C90(13); " ")
							SD_at_ItemActionDescription{$_l_Index}:=Replace string:C233(SD_at_ItemActionDescription{$_l_Index}; Char:C90(10); " ")
						End if 
						Gen_TimeStamp2Date(SD_al_ItemTimeValues{$_l_Index}; ->SD_ad_SortDate{$_l_Index}; ->SD_ti_GetTime)
					End for 
				Else 
					For ($_l_Index; 1; Size of array:C274(SD_at_ActionDetails))
						If ((SD_abo_DoneStatus{$_l_Index}) & (SD_at_ActionDetails2{$_l_Index}#"")) | (SD_at_ActionDetails{$_l_Index}="")
							SD_at_ItemActionDescription{$_l_Index}:=Replace string:C233(Substring:C12(SD_at_ActionDetails2{$_l_Index}; 1; 255); Char:C90(13); " ")
							SD_at_ItemActionDescription{$_l_Index}:=Replace string:C233(SD_at_ItemActionDescription{$_l_Index}; Char:C90(10); " ")
						Else 
							
							SD_at_ItemActionDescription{$_l_Index}:=Replace string:C233(Substring:C12(SD_at_ActionDetails{$_l_Index}; 1; 255); Char:C90(13); " ")
							SD_at_ItemActionDescription{$_l_Index}:=Replace string:C233(SD_at_ItemActionDescription{$_l_Index}; Char:C90(10); " ")
						End if 
						Gen_TimeStamp2Date(SD_al_ItemTimeValues{$_l_Index}; ->SD_ad_SortDate{$_l_Index}; ->SD_ti_GetTime)
					End for 
				End if 
				
				
			Else 
				
			End if 
			If ($_bo_NoExtra=False:C215)
				SORT ARRAY:C229(SD_al_ItemTimeValues; SD_al_RecordNumbers; SD_at_ItemCodeValues; SD_ad_DateStampValues; SD_at_ItemActionCode; SD_at_ItemPerson; SD_at_ItemActionDescription; SD_al_DateStamp; SD_abo_DoneStatus; SD_al_Time; SD_al_Time2; SD_at_ActionDetails2; SD_at_ActionDetails; SD_ad_SortDate; SD_at_CompanyCodes; SD_at_ContactCodes)
			Else 
				SORT ARRAY:C229(SD_al_ItemTimeValues; SD_al_RecordNumbers; SD_at_ItemCodeValues; SD_ad_DateStampValues; SD_at_ItemActionCode; SD_at_ItemPerson; SD_at_ItemActionDescription; SD_al_DateStamp; SD_abo_DoneStatus; SD_al_Time; SD_al_Time2; SD_at_ActionDetails2; SD_at_ActionDetails; SD_ad_SortDate; SD_at_CompanyCodes; SD_at_ContactCodes; <)
			End if 
		End if 
	Else 
		If (Not:C34($_bo_FromQuery))
			ARRAY TEXT:C222(SD_at_CompanyCodes; 0)
			ARRAY TEXT:C222(SD_at_ContactCodes; 0)
			ARRAY LONGINT:C221(SD_al_DateStamp; 0)
			ARRAY BOOLEAN:C223(SD_abo_DoneStatus; 0)
			ARRAY LONGINT:C221(SD_al_Time; 0)
			ARRAY LONGINT:C221(SD_al_Time2; 0)
			ARRAY LONGINT:C221(SD_al_RecordNumbers; 0)
			ARRAY TEXT:C222(SD_at_ItemCodeValues; 0)
			ARRAY TEXT:C222(SD_at_ActionDetails; 0)
			ARRAY LONGINT:C221(SD_al_ItemTimeValues; 0)
			ARRAY LONGINT:C221(SD_al_ItemTimeValues2; 0)
			ARRAY DATE:C224(SD_ad_DateStampValues; 0)
			ARRAY TEXT:C222(SD_at_ItemActionCode; 0)
			CREATE EMPTY SET:C140([DIARY:12]; "DMaster")
		End if 
		
	End if 
	
End if 
ERR_MethodTrackerReturn("SD_Temp_SearchViaServer"; $_t_oldMethodName)
