//%attributes = {}
If (False:C215)
	//Project Method Name:      SDiary_HL_QueryDiary
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/04/2010 13:35
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
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
	//ARRAY LONGINT(SD_al_DateStamp;0)
	//ARRAY LONGINT(SD_al_ItemTimeValues;0)
	//ARRAY LONGINT(SD_al_ItemTimeValues2;0)
	//ARRAY LONGINT(SD_al_PersonClass;0)
	//ARRAY LONGINT(SD_al_RecordNumbers;0)
	//ARRAY LONGINT(SD_al_Time;0)
	//ARRAY LONGINT(SD_al_Time2;0)
	//ARRAY TEXT(SD_at_ActionDetails;0)
	//ARRAY TEXT(SD_at_ActionDetails2;0)
	//ARRAY TEXT(SD_at_CompanyCodes;0)
	//ARRAY TEXT(SD_at_ContactCodes;0)
	//ARRAY TEXT(SD_at_ItemActionCode;0)
	//ARRAY TEXT(SD_at_ItemActionDescription;0)
	//ARRAY TEXT(SD_at_ItemCodeValues;0)
	//ARRAY TEXT(SD_at_ItemPerson;0)
	//ARRAY TEXT(SD_at_PersonInitials;0)
	//ARRAY TEXT(WS_at_DiaryVIewTab;0)
	C_BOOLEAN:C305($_bo_ExcludeCompleted; $_bo_Extra; $_bo_FromQuery; $_bo_noExtra; SD_bo_AgendaEnabled; SD3_bo_FloatingDiarydisplayed)
	C_DATE:C307($2; $3; SD_d_EndDate; SD_d_GetDate; SD_d_MonthBeginDate; SD_d_MonthEndDate; SD_d_StartDate; vDateGet2; WS_d_DiaryDate1; WS_d_DiaryDate2; WS_d_DiaryDate3)
	C_DATE:C307(WS_d_DiaryDate4; WS_d_DiaryDate5; WS_d_DiaryDate6; WS_d_DiaryDate7)
	C_LONGINT:C283($_l_EmptyDateValueRow; $_l_EndValue; $_l_FillIndex; $_l_Index; $_l_MaxRecords; $_l_PersonClass; $_l_PersonID; $_l_PersonRow; $_l_StartValue; $QueryTime; SD_l_IncludeCompleted)
	C_LONGINT:C283(SD_l_priorityQuery; SD_l_StartOfPeriod; TESTAMOUNT)
	C_REAL:C285($4)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_ApplicationVersion; $_t_oldMethodName; $1; $5; SD_t_DiaryDefaultUser; SD_t_ProcRelationActionID)
	C_TIME:C306(SD_ti_GetTime)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SDiary_HL_QueryDiary")
//SDIARY_HL_QueryDiary: the query routine for the hl lists
//presents the required days to the SDIARY_HL_DisplayDiary routines
//$1= ◊Diary_viewUser: current user
//$2= Start Date
//$3= End Date

//$t1:=Milliseconds

MESSAGES OFF:C175
READ ONLY:C145([PERSONNEL:11])

QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=$1)
$_l_PersonID:=[PERSONNEL:11]Personnel_ID:48


If (Count parameters:C259>=4)
	$_bo_FromQuery:=($4=-1)
Else 
	$_bo_FromQuery:=False:C215
End if 
If ($2#!00-00-00!)
	$_l_StartValue:=Gen_DateStamp($2)
Else 
	$_l_StartValue:=0
End if 
SD_l_StartOfPeriod:=$_l_StartValue
If ($3#!00-00-00!)
	$_l_EndValue:=Gen_DateStamp($3)
Else 
	$_l_EndValue:=0
End if 
$_bo_noExtra:=False:C215
$_bo_ExcludeCompleted:=(SD_l_IncludeCompleted=0)
If (True:C214)  // so we can turn this on and off!
	Case of 
		: ($1#"") & ($2>!00-00-00!) & ($3>!00-00-00!)
			QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=$1)
			$_l_PersonID:=[PERSONNEL:11]Personnel_ID:48
			If ((Size of array:C274(<>SD_al_CombineGroupDiaries)>0) | (Size of array:C274(<>SD_al_CombinePersonDiaries)>0) | (Size of array:C274(<>SD_al_CombineResourceDiaries)>0)) | (SD3_bo_FloatingDiarydisplayed)
				CREATE EMPTY SET:C140([DIARY:12]; "TEMP")
				SD_GetOtherDiaries(0)
				CREATE SET:C116([DIARY:12]; "TEMP2")
				UNION:C120("TEMP"; "TEMP2"; "TEMP")
			Else 
				QUERY:C277([DIARY_ITEMOWNERS:106]; [DIARY_ITEMOWNERS:106]PERSONNEL_ID:2=$_l_PersonID)
				RELATE ONE SELECTION:C349([DIARY_ITEMOWNERS:106]; [DIARY:12])
				CREATE SET:C116([DIARY:12]; "TEMP")
				QUERY:C277([DIARY:12]; [DIARY:12]Person:8=$1)
				CREATE SET:C116([DIARY:12]; "TEMP2")
				UNION:C120("TEMP"; "TEMP2"; "TEMP")
				
			End if 
			
			
			QUERY:C277([DIARY:12]; [DIARY:12]Date_Stamp:46>=$_l_StartValue; *)
			QUERY:C277([DIARY:12];  & ; [DIARY:12]Date_Stamp:46<=$_l_EndValue)
			CREATE SET:C116([DIARY:12]; "TEMP2")
			INTERSECTION:C121("TEMP"; "TEMP2"; "TEMP")
			USE SET:C118("TEMP")
			CLEAR SET:C117("TEMP")
			CLEAR SET:C117("TEMP2")
		: ($1#"") & ($2>!00-00-00!) & ($3=!00-00-00!)
			QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=$1)
			$_l_PersonID:=[PERSONNEL:11]Personnel_ID:48
			If ((Size of array:C274(<>SD_al_CombineGroupDiaries)>0) | (Size of array:C274(<>SD_al_CombinePersonDiaries)>0) | (Size of array:C274(<>SD_al_CombineResourceDiaries)>0)) | (SD3_bo_FloatingDiarydisplayed)
				CREATE EMPTY SET:C140([DIARY:12]; "TEMP")
				SD_GetOtherDiaries(0)
				CREATE SET:C116([DIARY:12]; "TEMP2")
				UNION:C120("TEMP"; "TEMP2"; "TEMP")
			Else 
				QUERY:C277([DIARY_ITEMOWNERS:106]; [DIARY_ITEMOWNERS:106]PERSONNEL_ID:2=$_l_PersonID)
				RELATE ONE SELECTION:C349([DIARY_ITEMOWNERS:106]; [DIARY:12])
				CREATE SET:C116([DIARY:12]; "TEMP")
				QUERY:C277([DIARY:12]; [DIARY:12]Person:8=$1)
				CREATE SET:C116([DIARY:12]; "TEMP2")
				UNION:C120("TEMP"; "TEMP2"; "TEMP")
				
			End if 
			
			QUERY:C277([DIARY:12]; [DIARY:12]Date_Stamp:46>=$_l_StartValue)
			CREATE SET:C116([DIARY:12]; "TEMP2")
			INTERSECTION:C121("TEMP"; "TEMP2"; "TEMP")
			USE SET:C118("TEMP")
			CLEAR SET:C117("TEMP")
			CLEAR SET:C117("TEMP2")
		: ($1#"") & ($2=!00-00-00!) & ($3>!00-00-00!)
			QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=$1)
			$_l_PersonID:=[PERSONNEL:11]Personnel_ID:48
			If ((Size of array:C274(<>SD_al_CombineGroupDiaries)>0) | (Size of array:C274(<>SD_al_CombinePersonDiaries)>0) | (Size of array:C274(<>SD_al_CombineResourceDiaries)>0)) | (SD3_bo_FloatingDiarydisplayed)
				CREATE EMPTY SET:C140([DIARY:12]; "TEMP")
				SD_GetOtherDiaries(0)
				CREATE SET:C116([DIARY:12]; "TEMP2")
				UNION:C120("TEMP"; "TEMP2"; "TEMP")
			Else 
				QUERY:C277([DIARY_ITEMOWNERS:106]; [DIARY_ITEMOWNERS:106]PERSONNEL_ID:2=$_l_PersonID)
				RELATE ONE SELECTION:C349([DIARY_ITEMOWNERS:106]; [DIARY:12])
				CREATE SET:C116([DIARY:12]; "TEMP")
				QUERY:C277([DIARY:12]; [DIARY:12]Person:8=$1)
				CREATE SET:C116([DIARY:12]; "TEMP2")
				UNION:C120("TEMP"; "TEMP2"; "TEMP")
				
			End if 
			
			QUERY:C277([DIARY:12];  & ; [DIARY:12]Date_Stamp:46<=$_l_EndValue)
			CREATE SET:C116([DIARY:12]; "TEMP2")
			INTERSECTION:C121("TEMP"; "TEMP2"; "TEMP")
			USE SET:C118("TEMP")
			CLEAR SET:C117("TEMP")
			CLEAR SET:C117("TEMP2")
		: ($1="") & ($2>!00-00-00!) & ($3>!00-00-00!)
			QUERY:C277([DIARY:12]; [DIARY:12]Date_Stamp:46>=$_l_StartValue; *)
			QUERY:C277([DIARY:12];  & ; [DIARY:12]Date_Stamp:46<=$_l_EndValue)
		: ($1="") & ($2>!00-00-00!) & ($3=!00-00-00!)
			QUERY:C277([DIARY:12]; [DIARY:12]Date_Stamp:46>=$_l_StartValue)
		: ($1="") & ($2=!00-00-00!) & ($3>!00-00-00!)
			QUERY:C277([DIARY:12]; [DIARY:12]Date_Stamp:46<=$_l_EndValue)
		: ($1="") & ($2=!00-00-00!) & ($3=!00-00-00!)
			$_bo_ExcludeCompleted:=False:C215
			$_bo_noExtra:=True:C214
			If (Count parameters:C259>3)
				Case of 
					: ($4=-1)  //selection made(from diary manager!)
						//NO QUERY
					: ($4=2)  //companies(table num)
						QUERY:C277([DIARY:12]; [DIARY:12]Company_Code:1=$5)
						//put the other related stuff here
					: ($4=Table:C252(->[CONTACTS:1]))  //
						QUERY:C277([DIARY:12]; [DIARY:12]Contact_Code:2=$5)
					: ($4=Table:C252(->[PRODUCTS:9]))  //product code
						QUERY:C277([DIARY:12]; [DIARY:12]Product_Code:13=$5)
					: ($4=Table:C252(->[DOCUMENTS:7]))  //document code
						QUERY:C277([DIARY:12]; [DIARY:12]Document_Code:15=$5)
						
					: ($4=Table:C252(->[JOBS:26]))  //Jobs_Code
						QUERY:C277([DIARY:12]; [DIARY:12]Job_Code:19=$5)
					: ($4=Table:C252(->[ORDERS:24]))  //Orders_Code
						QUERY:C277([DIARY:12]; [DIARY:12]Order_Code:26=$5)
					: ($4=Table:C252(->[SERVICE_CALLS:20]))  //service calls
						QUERY:C277([DIARY:12]; [DIARY:12]Call_Code:25=$5)
					: ($4=Table:C252(->[DIARY:12]))  //service calls
						QUERY:C277([DIARY:12]; [DIARY:12]Diary_Code:3=$5)
				End case 
			End if 
	End case 
	CREATE SET:C116([DIARY:12]; "DiarySet")
	$_bo_Extra:=False:C215
	If ($2=!00-00-00!)
		ORDER BY:C49([DIARY:12]; [DIARY:12]Date_Time_Stamp:45; >)
		FIRST RECORD:C50([DIARY:12])
		SD_d_StartDate:=[DIARY:12]Date_Do_From:4
		$_l_StartValue:=Gen_DateStamp(SD_d_StartDate)
		SD_l_StartOfPeriod:=$_l_StartValue
		If ($3=!00-00-00!)
			
			LAST RECORD:C200([DIARY:12])
			SD_d_EndDate:=[DIARY:12]Date_Do_From:4
			$_l_EndValue:=Gen_DateStamp(SD_d_EndDate)
		End if 
		
	Else 
		If ($3=!00-00-00!)
			ORDER BY:C49([DIARY:12]; [DIARY:12]Date_Time_Stamp:45; <)
			FIRST RECORD:C50([DIARY:12])
			SD_d_EndDate:=[DIARY:12]Date_Do_From:4
			$_l_EndValue:=Gen_DateStamp(SD_d_EndDate)
		End if 
	End if 
	
	
	
	$_l_PersonRow:=Find in array:C230(SD_at_PersonInitials; SD_t_DiaryDefaultUser)
	If ($_l_PersonRow>0)  //it should be!!!!
		$_l_PersonClass:=SD_al_PersonClass{$_l_PersonRow}
	Else 
		$_l_PersonClass:=3
	End if 
	
	If ($1=<>PER_t_CurrentUserInitials) & ($_bo_noExtra=False:C215)
		
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
	
	If ($_bo_Extra)
		QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=$1)
		
		$_l_PersonID:=[PERSONNEL:11]Personnel_ID:48
		If ((Size of array:C274(<>SD_al_CombineGroupDiaries)>0) | (Size of array:C274(<>SD_al_CombinePersonDiaries)>0) | (Size of array:C274(<>SD_al_CombineResourceDiaries)>0)) | (SD3_bo_FloatingDiarydisplayed)
			CREATE EMPTY SET:C140([DIARY:12]; "TEMP")
			SD_GetOtherDiaries(0)
			CREATE SET:C116([DIARY:12]; "TEMP2")
			UNION:C120("TEMP"; "TEMP2"; "TEMP")
		Else 
			QUERY:C277([DIARY_ITEMOWNERS:106]; [DIARY_ITEMOWNERS:106]PERSONNEL_ID:2=$_l_PersonID)
			RELATE ONE SELECTION:C349([DIARY_ITEMOWNERS:106]; [DIARY:12])
			CREATE SET:C116([DIARY:12]; "TEMP")
			QUERY:C277([DIARY:12]; [DIARY:12]Person:8=$1)
			CREATE SET:C116([DIARY:12]; "TEMP2")
			UNION:C120("TEMP"; "TEMP2"; "TEMP")
			
		End if 
		CLEAR SET:C117("TEMP2")
		QUERY:C277([DIARY:12]; [DIARY:12]Action_Code:9#"EVENT"; *)
		QUERY:C277([DIARY:12];  & ; [DIARY:12]Done:14=False:C215)
		CREATE SET:C116([DIARY:12]; "DiarySet3")
		INTERSECTION:C121("TEMP"; "DiarySet3"; "DiarySet3")
		CLEAR SET:C117("TEMP")
		QUERY:C277([DIARY:12]; [DIARY:12]Date_Stamp:46<$_l_StartValue)
		CREATE SET:C116([DIARY:12]; "DiarySet2")
		INTERSECTION:C121("DiarySet2"; "DiarySet3"; "DiarySet2")
		CLEAR SET:C117("DiarySet3")
		//CREATE SET([DIARY];"DiarySet2")
		UNION:C120("DiarySet"; "DiarySet2"; "DiarySet")
		CLEAR SET:C117("DiarySet2")
	End if 
	
	
	
	USE SET:C118("Diaryset")
	QUERY:C277([DIARY:12]; [DIARY:12]Deleted:43#1)
	CREATE SET:C116([DIARY:12]; "Diaryset2")
	INTERSECTION:C121("DiarySet2"; "DiarySet"; "DiarySet")
	If ($_bo_ExcludeCompleted)
		QUERY:C277([DIARY:12]; [DIARY:12]Done:14=True:C214)
		CREATE SET:C116([DIARY:12]; "Diaryset2")
		DIFFERENCE:C122("DiarySet"; "DiarySet2"; "DiarySet")
	End if 
	If (SD_l_priorityQuery>0)
		
		QUERY:C277([DIARY:12]; [DIARY:12]Priority:17=String:C10(SD_l_priorityQuery))
		CREATE SET:C116([DIARY:12]; "Priority")
		INTERSECTION:C121("Diaryset"; "Priority"; "Diaryset")
		USE SET:C118("Diaryset")
		CLEAR SET:C117("Priority")
	End if 
	
	
	
	USE SET:C118("Diaryset")
	USE SET:C118("Diaryset")
	If (SD_t_ProcRelationActionID#"")
		QUERY:C277([DIARY:12]; [DIARY:12]Action_Code:9=SD_t_ProcRelationActionID)
		CREATE SET:C116([DIARY:12]; "Diaryset2")
		INTERSECTION:C121("DiarySet2"; "DiarySet"; "DiarySet")
		SD_t_ProcRelationActionID:=""
		
		USE SET:C118("Diaryset")
	End if 
	$_l_MaxRecords:=5000
	If (Records in selection:C76([DIARY:12])>$_l_MaxRecords)
		Gen_Confirm("There are over "+String:C10($_l_MaxRecords)+" records in this selection only "+String:C10($_l_MaxRecords)+" will display"; "Newest"; "Oldest")
		If (OK=0)
			ORDER BY:C49([DIARY:12]; [DIARY:12]Date_Time_Stamp:45; >)
			REDUCE SELECTION:C351([DIARY:12]; $_l_MaxRecords)
		Else 
			ORDER BY:C49([DIARY:12]; [DIARY:12]Date_Time_Stamp:45; <)
			REDUCE SELECTION:C351([DIARY:12]; $_l_MaxRecords)
		End if 
		CREATE SET:C116([DIARY:12]; "Diaryset")
		USE SET:C118("Diaryset")
	End if 
	
	If (Records in selection:C76([DIARY:12])>0)
		
		CREATE SET:C116([DIARY:12]; "DMaster")
		QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Date_Time_Stamp:45=0)
		CREATE SET:C116([DIARY:12]; "DiarysetX")
		INTERSECTION:C121("DiarySetX"; "DMaster"; "DiarysetX")
		USE SET:C118("DiarysetX")
		CLEAR SET:C117("DiarysetX")
		If (Records in selection:C76([DIARY:12])>0)
			READ WRITE:C146([DIARY:12])
			DB_lockFile(->[DIARY:12])
			APPLY TO SELECTION:C70([DIARY:12]; Trigger_setDiaryTimeStamp)
			
			AA_CheckFileUnlockedByTableNUM(Table:C252(->[DIARY:12]))
		End if 
		USE SET:C118("Diaryset")
		QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Display_Date_From:51=!00-00-00!)
		CREATE SET:C116([DIARY:12]; "DiarysetX")
		INTERSECTION:C121("DiarySetX"; "DMaster"; "DiarysetX")
		USE SET:C118("DiarysetX")
		CLEAR SET:C117("DiarysetX")
		If (Records in selection:C76([DIARY:12])>0)
			READ WRITE:C146([DIARY:12])
			DB_lockFile(->[DIARY:12])
			APPLY TO SELECTION:C70([DIARY:12]; Trigger_setDiaryDisplayData)
			
			AA_CheckFileUnlockedByTableNUM(Table:C252(->[DIARY:12]))
		End if 
		USE SET:C118("Diaryset")
		If (SD_bo_AgendaEnabled)
			QUERY SELECTION:C341([DIARY:12]; [DIARY:12]AGAccentColourBlue:62=0; *)
			QUERY SELECTION:C341([DIARY:12];  | ; [DIARY:12]AGAccentColourGreen:61=0; *)
			QUERY SELECTION:C341([DIARY:12];  | ; [DIARY:12]AGAccentColourRed:60=0; *)
			QUERY SELECTION:C341([DIARY:12];  | ; [DIARY:12]AGFillColourGreen:58=0; *)
			QUERY SELECTION:C341([DIARY:12];  | ; [DIARY:12]AGFillColourRed:57=0; *)
			QUERY SELECTION:C341([DIARY:12];  | ; [DIARY:12]AGFillColourBlue:59=0)
			CREATE SET:C116([DIARY:12]; "DiarysetX")
			INTERSECTION:C121("DiarySetX"; "DMaster"; "DiarysetX")
			USE SET:C118("DiarysetX")
			CLEAR SET:C117("DiarysetX")
			If (Records in selection:C76([DIARY:12])>0)
				READ WRITE:C146([DIARY:12])
				DB_lockFile(->[DIARY:12])
				LOAD RECORD:C52([DIARY:12])
				APPLY TO SELECTION:C70([DIARY:12]; AG_SetDiaryColours)
				
				AA_CheckFileUnlockedByTableNUM(Table:C252(->[DIARY:12]))
			End if 
			
			USE SET:C118("Diaryset")
		End if 
		
		// ORDER BY([DIARY];[DIARY]DateStamp;>;[DIARY]Time Do From;>)
		If (TESTAMOUNT=0)
			TESTAMOUNT:=1000
		End if 
		If (TESTAMOUNT>3000)
			TESTAMOUNT:=3000
		End if 
		
		// i
		
		
		// If (Undefined(SD_al_DateStamp))
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
			$_l_EmptyDateValueRow:=Find in array:C230(SD_ad_DateStampValues; !00-00-00!)
			If ($_l_EmptyDateValueRow>0)
				For ($_l_FillIndex; $_l_EmptyDateValueRow; Size of array:C274(SD_ad_DateStampValues))
					If (SD_ad_DateStampValues{$_l_FillIndex}=!00-00-00!)
						SD_ad_DateStampValues{$_l_FillIndex}:=Current date:C33(*)
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
			If ($_bo_noExtra=False:C215)
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
	
	
	MESSAGES ON:C181
	//$t3:=Milliseconds
	
	SET TIMER:C645(3600)
	
Else 
	//test new search mechanism
	Case of 
		: (Count parameters:C259=1)
			SD_Temp_SearchViaServer($1)
			
			
		: (Count parameters:C259=2)
			SD_Temp_SearchViaServer($1; $2)
			
		: (Count parameters:C259=3)
			SD_Temp_SearchViaServer($1; $2; $3)
			
		: (Count parameters:C259=4)
			If ($4=-1)
				SD_Temp_SearchViaServer($1; $2; $3; $4)
				
			End if 
		: (Count parameters:C259=5)
			SD_Temp_SearchViaServer($1; $2; $3; $4; $5)
			
	End case 
	
End if 
ERR_MethodTrackerReturn("SDiary_HL_QueryDiary"; $_t_oldMethodName)