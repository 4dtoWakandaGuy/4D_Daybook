//%attributes = {}
If (False:C215)
	//Project Method Name:      SDiary_HL_QueryDiaryONSERVER
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 11:47
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>SD_al_CombineGroupDiaries;0)
	//ARRAY LONGINT(<>SD_al_CombinePersonDiaries;0)
	//ARRAY LONGINT(<>SD_al_CombineResourceDiaries;0)
	//ARRAY LONGINT(<>SD_al_MonCombineGrpDiaries;0)
	//ARRAY LONGINT(<>SD_al_MonCombinePerDiaries;0)
	//ARRAY LONGINT(<>SD_al_MonCombineResDiaries;0)
	//ARRAY LONGINT(<>SD_al_SetRelationsTables;0)
	//ARRAY TEXT(<>SD_at_SetRelationCodes;0)
	//ARRAY TEXT(WS_at_DiaryVIewTab;0)
	C_BOOLEAN:C305($_bo_ExcludeCompleted; $_bo_Extra; $_bo_NoExtra; $_bo_NoSheduleSearch; $5; SD_bo_AgendaEnabled)
	C_DATE:C307($2; $3)
	C_LONGINT:C283($_l_CopyIndex; $_l_EndValue; $_l_PersonID; $_l_SearchIndex; $_l_SearchTable; $_l_StartValue; $1; $4; $6; $7; $9)
	C_LONGINT:C283(SD_l_priorityQuery; SD_l_StartOfPeriod)
	C_TEXT:C284($_t_oldMethodName; $_t_Search; $_t_SearchValue; $8; SD_t_ProcRelationActionID)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("SDiary_HL_QueryDiaryONSERVER")
REDUCE SELECTION:C351([DIARY:12]; 0)
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

$_bo_NoExtra:=False:C215

$_bo_ExcludeCompleted:=($9=0)
$_bo_NoSheduleSearch:=False:C215
If (Count parameters:C259>=6)
	If ($6=101)
		$_bo_NoSheduleSearch:=True:C214
		
	End if 
End if 
SD_l_priorityQuery:=0
If (Count parameters:C259>=7)
	SD_l_priorityQuery:=$7
End if 

If (Count parameters:C259>=6)
	Case of 
		: ($1>=0) & ($2>!00-00-00!) & ($3>!00-00-00!) & (Not:C34($_bo_NoSheduleSearch))
			
			
			$_l_PersonID:=[PERSONNEL:11]Personnel_ID:48
			If ((Size of array:C274(<>SD_al_MonCombineGrpDiaries{$4})>0) | (Size of array:C274(<>SD_al_MonCombinePerDiaries{$4})>0) | (Size of array:C274(<>SD_al_MonCombinePerDiaries{$4})>0)) | ($5)
				CREATE EMPTY SET:C140([DIARY:12]; "TEMP")
				If (Application type:C494=4D Server:K5:6)
					
					SD_GetGroups($1; False:C215)
					ARRAY LONGINT:C221(<>SD_al_CombinePersonDiaries; Size of array:C274(<>SD_al_MonCombinePerDiaries{$4}))
					ARRAY LONGINT:C221(<>SD_al_CombineGroupDiaries; Size of array:C274(<>SD_al_MonCombineGrpDiaries{$4}))
					ARRAY LONGINT:C221(<>SD_al_CombineResourceDiaries; Size of array:C274(<>SD_al_MonCombineResDiaries{$4}))
					For ($_l_CopyIndex; 1; Size of array:C274(<>SD_al_MonCombineGrpDiaries))
						<>SD_al_CombineGroupDiaries{$_l_CopyIndex}:=<>SD_al_MonCombineGrpDiaries{$4}{$_l_CopyIndex}
					End for 
					For ($_l_CopyIndex; 1; Size of array:C274(<>SD_al_MonCombinePerDiaries))
						<>SD_al_CombinePersonDiaries{$_l_CopyIndex}:=<>SD_al_MonCombinePerDiaries{$4}{$_l_CopyIndex}
					End for 
					For ($_l_CopyIndex; 1; Size of array:C274(<>SD_al_MonCombineResDiaries))
						<>SD_al_CombineResourceDiaries{$_l_CopyIndex}:=<>SD_al_MonCombineResDiaries{$4}{$_l_CopyIndex}
					End for 
					
				End if 
				
				SD_GetOtherDiaries(0)
				CREATE SET:C116([DIARY:12]; "TEMP2")
				UNION:C120("TEMP"; "TEMP2"; "TEMP")
			Else 
				QUERY:C277([DIARY_ITEMOWNERS:106]; [DIARY_ITEMOWNERS:106]PERSONNEL_ID:2=$_l_PersonID)
				RELATE ONE SELECTION:C349([DIARY_ITEMOWNERS:106]; [DIARY:12])
				CREATE SET:C116([DIARY:12]; "TEMP")
				QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=$1)
				QUERY:C277([DIARY:12]; [DIARY:12]Person:8=[PERSONNEL:11]Initials:1)
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
		: ($1>0) & ($2>!00-00-00!) & ($3=!00-00-00!) & (Not:C34($_bo_NoSheduleSearch))
			
			$_l_PersonID:=[PERSONNEL:11]Personnel_ID:48
			If ((Size of array:C274(<>SD_al_MonCombineGrpDiaries{$4})>0) | (Size of array:C274(<>SD_al_MonCombinePerDiaries{$4})>0) | (Size of array:C274(<>SD_al_MonCombinePerDiaries{$4})>0)) | ($5)
				CREATE EMPTY SET:C140([DIARY:12]; "TEMP")
				SD_GetGroups($1; False:C215)
				
				SD_GetOtherDiaries(0)
				CREATE SET:C116([DIARY:12]; "TEMP2")
				UNION:C120("TEMP"; "TEMP2"; "TEMP")
			Else 
				QUERY:C277([DIARY_ITEMOWNERS:106]; [DIARY_ITEMOWNERS:106]PERSONNEL_ID:2=$_l_PersonID)
				RELATE ONE SELECTION:C349([DIARY_ITEMOWNERS:106]; [DIARY:12])
				CREATE SET:C116([DIARY:12]; "TEMP")
				QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=$1)
				QUERY:C277([DIARY:12]; [DIARY:12]Person:8=[PERSONNEL:11]Initials:1)
				
				CREATE SET:C116([DIARY:12]; "TEMP2")
				UNION:C120("TEMP"; "TEMP2"; "TEMP")
				
			End if 
			
			QUERY:C277([DIARY:12]; [DIARY:12]Date_Stamp:46>=$_l_StartValue)
			CREATE SET:C116([DIARY:12]; "TEMP2")
			INTERSECTION:C121("TEMP"; "TEMP2"; "TEMP")
			USE SET:C118("TEMP")
			CLEAR SET:C117("TEMP")
			CLEAR SET:C117("TEMP2")
		: ($1>0) & ($2=!00-00-00!) & ($3>!00-00-00!) & (Not:C34($_bo_NoSheduleSearch))
			QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=$1)
			$_l_PersonID:=[PERSONNEL:11]Personnel_ID:48
			If ((Size of array:C274(<>SD_al_MonCombineGrpDiaries{$4})>0) | (Size of array:C274(<>SD_al_MonCombinePerDiaries{$4})>0) | (Size of array:C274(<>SD_al_MonCombinePerDiaries{$4})>0)) | ($5)
				CREATE EMPTY SET:C140([DIARY:12]; "TEMP")
				SD_GetGroups($1; False:C215)
				
				SD_GetOtherDiaries(0)
				CREATE SET:C116([DIARY:12]; "TEMP2")
				UNION:C120("TEMP"; "TEMP2"; "TEMP")
			Else 
				QUERY:C277([DIARY_ITEMOWNERS:106]; [DIARY_ITEMOWNERS:106]PERSONNEL_ID:2=$_l_PersonID)
				RELATE ONE SELECTION:C349([DIARY_ITEMOWNERS:106]; [DIARY:12])
				CREATE SET:C116([DIARY:12]; "TEMP")
				QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=$1)
				QUERY:C277([DIARY:12]; [DIARY:12]Person:8=[PERSONNEL:11]Initials:1)
				
				CREATE SET:C116([DIARY:12]; "TEMP2")
				UNION:C120("TEMP"; "TEMP2"; "TEMP")
				
			End if 
			
			
			QUERY:C277([DIARY:12];  & ; [DIARY:12]Date_Stamp:46<=$_l_EndValue)
			CREATE SET:C116([DIARY:12]; "TEMP2")
			INTERSECTION:C121("TEMP"; "TEMP2"; "TEMP")
			USE SET:C118("TEMP")
			CLEAR SET:C117("TEMP")
			CLEAR SET:C117("TEMP2")
		: ($1=0) & ($2>!00-00-00!) & ($3>!00-00-00!) & (Not:C34($_bo_NoSheduleSearch))
			QUERY:C277([DIARY:12]; [DIARY:12]Date_Stamp:46>=$_l_StartValue; *)
			QUERY:C277([DIARY:12];  & ; [DIARY:12]Date_Stamp:46<=$_l_EndValue)
		: ($1=0) & ($2>!00-00-00!) & ($3=!00-00-00!) & (Not:C34($_bo_NoSheduleSearch))
			QUERY:C277([DIARY:12]; [DIARY:12]Date_Stamp:46>=$_l_StartValue)
		: ($1=0) & ($2=!00-00-00!) & ($3>!00-00-00!) & (Not:C34($_bo_NoSheduleSearch))
			QUERY:C277([DIARY:12]; [DIARY:12]Date_Stamp:46<=$_l_EndValue)
		: ($1=0) & ($2=!00-00-00!) & ($3=!00-00-00!) & (Not:C34($_bo_NoSheduleSearch))
			$_bo_ExcludeCompleted:=False:C215
			$_bo_NoExtra:=True:C214
			If (Count parameters:C259>5)
				Case of 
					: ($6=-1)  //selection made(from diary manager!)
						//NO QUERY
					: ($6=101)
						$_bo_NoExtra:=False:C215
					Else 
						QUERY:C277([DIARY:12]; [DIARY:12]Deleted:43=0; *)
						For ($_l_SearchIndex; 1; Size of array:C274(<>SD_al_SetRelationsTables{$4}))
							$_l_SearchTable:=<>SD_al_SetRelationsTables{$4}{$_l_SearchIndex}
							$_t_SearchValue:=<>SD_at_SetRelationCodes{$4}{$_l_SearchIndex}
							Case of 
								: ($_l_SearchTable=2)  //companies(table num)
									QUERY:C277([DIARY:12];  & ; [DIARY:12]Company_Code:1=$_t_SearchValue)
								: ($_l_SearchTable=Table:C252(->[CONTACTS:1]))  //
									QUERY:C277([DIARY:12];  & ; [DIARY:12]Contact_Code:2=$_t_SearchValue)
								: ($_l_SearchTable=Table:C252(->[PRODUCTS:9]))  //product code
									QUERY:C277([DIARY:12];  & ; [DIARY:12]Product_Code:13=$_t_SearchValue)
								: ($_l_SearchTable=Table:C252(->[DOCUMENTS:7]))  //document code
									QUERY:C277([DIARY:12];  & ; [DIARY:12]Document_Code:15=$_t_SearchValue)
									
								: ($_l_SearchTable=Table:C252(->[JOBS:26]))  //Jobs_Code
									QUERY:C277([DIARY:12];  & ; [DIARY:12]Job_Code:19=$_t_SearchValue)
								: ($_l_SearchTable=Table:C252(->[ORDERS:24]))  //Orders_Code
									QUERY:C277([DIARY:12];  & ; [DIARY:12]Order_Code:26=$_t_SearchValue)
								: ($_l_SearchTable=Table:C252(->[SERVICE_CALLS:20]))  //service calls
									QUERY:C277([DIARY:12];  & ; [DIARY:12]Call_Code:25=$_t_SearchValue)
								: ($_l_SearchTable=Table:C252(->[DIARY:12]))  //service calls
									QUERY:C277([DIARY:12];  & ; [DIARY:12]Diary_Code:3=$_t_SearchValue)
									
							End case 
							
						End for 
						QUERY:C277([DIARY:12])
						
						
				End case 
			End if 
	End case 
	CREATE SET:C116([DIARY:12]; "DiarySet")
	$_bo_Extra:=False:C215
	If ($6=101) & ($_bo_NoExtra=False:C215)
		
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
		
		$_l_PersonID:=[PERSONNEL:11]Personnel_ID:48
		If ((Size of array:C274(<>SD_al_MonCombineGrpDiaries{$4})>0) | (Size of array:C274(<>SD_al_MonCombinePerDiaries{$4})>0) | (Size of array:C274(<>SD_al_MonCombinePerDiaries{$4})>0)) | ($5)
			CREATE EMPTY SET:C140([DIARY:12]; "TEMP")
			SD_GetGroups($1; False:C215)
			SD_GetOtherDiaries(0)
			CREATE SET:C116([DIARY:12]; "TEMP2")
			UNION:C120("TEMP"; "TEMP2"; "TEMP")
		Else 
			QUERY:C277([DIARY_ITEMOWNERS:106]; [DIARY_ITEMOWNERS:106]PERSONNEL_ID:2=$_l_PersonID)
			RELATE ONE SELECTION:C349([DIARY_ITEMOWNERS:106]; [DIARY:12])
			CREATE SET:C116([DIARY:12]; "TEMP")
			QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=$1)
			QUERY:C277([DIARY:12]; [DIARY:12]Person:8=[PERSONNEL:11]Initials:1)
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
	SD_t_ProcRelationActionID:=""
	If (Count parameters:C259>=8)
		SD_t_ProcRelationActionID:=$8
	End if 
	
	If (SD_t_ProcRelationActionID#"")
		QUERY:C277([DIARY:12]; [DIARY:12]Action_Code:9=SD_t_ProcRelationActionID)
		CREATE SET:C116([DIARY:12]; "Diaryset2")
		INTERSECTION:C121("DiarySet2"; "DiarySet"; "DiarySet")
		SD_t_ProcRelationActionID:=""
		
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
		
		
	End if 
	
	
	
End if 
ERR_MethodTrackerReturn("SDiary_HL_QueryDiaryONSERVER"; $_t_oldMethodName)
