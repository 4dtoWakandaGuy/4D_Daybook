//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_ApplySearchFilters
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
	ARRAY LONGINT:C221($_al_DiaryIDS; 0)
	//ARRAY LONGINT(SD2_al_CombineGroupDiaries;0)
	//ARRAY LONGINT(SD2_al_CombinePersonDiaries;0)
	//ARRAY LONGINT(SD2_al_CombineResourceDiaries;0)
	C_DATE:C307(SD2_D_DateFromFilter; SD2_D_DatetoFilter)
	C_LONGINT:C283($_l_Priority; SD2_l_IncludeCompleted)
	C_TEXT:C284($_t_oldMethodName; SD_t_ActionFilter; SD_t_ActionFilterCode; SD_t_ContactFilter; SD_t_ContactFilterName; SD_t_PersonFilterInitials; SD_t_PersonFilterName; SD_t_Resultfilter; SD_t_ResultsFilter; SD_t_ResultsFilterCode; SD2_S5_PriorityFIlter)
	C_TEXT:C284(SD2_t_CompanyFilter; SD2_t_CompanyFilterName; SD2_t_Document; SD2_t_DocumentName; SD2_t_StatusFIlter)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_ApplySearchFilters")

USE SET:C118("SearchResults")  //added kmw - 02/07/08

If (SD2_l_IncludeCompleted=0)
	QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Done:14=False:C215)
End if 
$_l_Priority:=Num:C11(SD2_S5_PriorityFIlter)
If ($_l_Priority>0)
	QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Priority:17=String:C10($_l_Priority))
End if 
If (SD_t_PersonFilterName#"ALL")
	
	If (SD_t_PersonFilterInitials#"")
		QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Person:8=SD_t_PersonFilterInitials)
	Else 
		If (SD_t_PersonFilterName="Multiple Diaries")
			CREATE SET:C116([DIARY:12]; "$temp")
			SD_GetOtherDiaries(0; ->SD2_al_CombinePersonDiaries; ->SD2_al_CombineResourceDiaries; ->SD2_al_CombineGroupDiaries)
			
			CREATE SET:C116([DIARY:12]; "$temp2")
			INTERSECTION:C121("$temp"; "$temp2"; "$temp")
			USE SET:C118("$Temp")
			CLEAR SET:C117("$temp")
			CLEAR SET:C117("$Temp2")
		End if 
		
	End if 
End if 
If (SD_t_ActionFilter#"") & (SD_t_ActionFilter#"ALL")
	If (SD_t_ActionFilter#"Multiple Actions")  //So i can add that in
		QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Action_Code:9=SD_t_ActionFilterCode)
		
	End if 
End if 
If (SD2_t_StatusFIlter#"") & (SD2_t_StatusFIlter#"ALL")
	If (SD2_t_StatusFIlter#"Multiple Stati")  //So i can add that in
		QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Status:30=SD2_t_StatusFIlter)
		
	End if 
End if 
//If (SD_t_ResultsFilterCode#"") & (SD_t_ResultsFilter#"ALL")
If (SD_t_ResultsFilter#"") & (SD_t_ResultsFilter#"ALL")  //changed from above line to this on 11/07/08 -kmw (part of fixing problem with result filter NOT working)
	If (SD_t_Resultfilter#"Multiple Results")
		//QUERY SELECTION([DIARY];[DIARY]Result Code=SD_t_Resultfilter)
		QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Result_Code:11=SD_t_ResultsFilterCode)  //changed from above line to this on 11/07/08 -kmw (part of fixing problem with result filter NOT working - wther or not it was ok for it to use this var instead of code var that i've now changed it to it was mispelled anyway and so had effect of searching for result code of ""!)
		
	End if 
End if 
If (SD2_D_DateFromFilter>!00-00-00!)
	If (Records in selection:C76([DIARY:12])>0)
		CREATE SET:C116([DIARY:12]; "$Temp1")
		QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Done:14=True:C214; *)
		QUERY SELECTION:C341([DIARY:12];  & ; [DIARY:12]Date_Done_From:5>=SD2_D_DateFromFilter)
		If (Records in selection:C76([DIARY:12])>0)
			CREATE SET:C116([DIARY:12]; "$Temp2")
		Else 
			CREATE EMPTY SET:C140([DIARY:12]; "$Temp2")
		End if 
		
		USE SET:C118("$Temp1")
		QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Done:14=False:C215; *)
		QUERY SELECTION:C341([DIARY:12];  & ; [DIARY:12]Date_Do_From:4>=SD2_D_DateFromFilter)
		If (Records in selection:C76([DIARY:12])>0)
			CREATE SET:C116([DIARY:12]; "$Temp1")
		Else 
			CREATE EMPTY SET:C140([DIARY:12]; "$Temp1")
		End if 
		UNION:C120("$Temp1"; "$Temp2"; "$Temp1")
		USE SET:C118("$Temp1")
		CLEAR SET:C117("$Temp2")
		CLEAR SET:C117("$Temp1")
	End if 
End if 
If (SD2_D_DatetoFilter>!00-00-00!)
	If (Records in selection:C76([DIARY:12])>0)
		CREATE SET:C116([DIARY:12]; "$Temp1")
		QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Done:14=True:C214; *)
		QUERY SELECTION:C341([DIARY:12];  & ; [DIARY:12]Date_Done_To:34<=SD2_D_DatetoFilter)
		If (Records in selection:C76([DIARY:12])>0)
			CREATE SET:C116([DIARY:12]; "$Temp2")
		Else 
			CREATE EMPTY SET:C140([DIARY:12]; "$Temp2")
		End if 
		USE SET:C118("$Temp1")
		QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Done:14=False:C215; *)
		QUERY SELECTION:C341([DIARY:12];  & ; [DIARY:12]Date_Do_To:33<=SD2_D_DatetoFilter)
		If (Records in selection:C76([DIARY:12])>0)
			CREATE SET:C116([DIARY:12]; "$Temp1")
		Else 
			CREATE EMPTY SET:C140([DIARY:12]; "$Temp1")
		End if 
		UNION:C120("$Temp1"; "$Temp2"; "$Temp1")
		USE SET:C118("$Temp1")
		CLEAR SET:C117("$Temp2")
		CLEAR SET:C117("$Temp1")
	End if 
End if 
If (SD2_t_CompanyFilter#"") & (SD2_t_CompanyFilterName#"ALL")
	If (SD2_t_CompanyFilterName#"Multiple Companies")
		CREATE SET:C116([DIARY:12]; "$temp")
		QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Company_Code:1=SD2_t_CompanyFilter)
		CREATE SET:C116([DIARY:12]; "$Temp1")
		
		QUERY:C277([xDiaryRelations:137]; [xDiaryRelations:137]XRecord_Code:5=SD2_t_CompanyFilter; *)
		QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]xTableNUM:3=Table:C252(->[COMPANIES:2]))
		If (Records in selection:C76([xDiaryRelations:137])>0)
			SELECTION TO ARRAY:C260([xDiaryRelations:137]xDiaryID:1; $_al_DiaryIDS)
			QUERY WITH ARRAY:C644([DIARY:12]x_ID:50; $_al_DiaryIDS)
			If (Records in selection:C76([DIARY:12])>0)
				CREATE SET:C116([DIARY:12]; "$Temp2")
				INTERSECTION:C121("$Temp2"; "$Temp"; "$Temp")
				UNION:C120("$Temp"; "$Temp1"; "$Temp")
				CLEAR SET:C117("$Temp2")
			End if 
			USE SET:C118("$Temp")
			CLEAR SET:C117("$Temp")
			CLEAR SET:C117("$Temp1")
			
		End if 
	End if 
End if 
If (SD_t_ContactFilter#"") & (SD_t_ContactFilterName#"ALL")
	If (SD_t_ContactFilterName#"Multiple Companies")
		CREATE SET:C116([DIARY:12]; "$temp")
		QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Contact_Code:2=SD_t_ContactFilter)
		CREATE SET:C116([DIARY:12]; "$Temp1")
		
		QUERY:C277([xDiaryRelations:137]; [xDiaryRelations:137]XRecord_Code:5=SD_t_ContactFilter; *)
		QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]xTableNUM:3=Table:C252(->[CONTACTS:1]))
		If (Records in selection:C76([xDiaryRelations:137])>0)
			SELECTION TO ARRAY:C260([xDiaryRelations:137]xDiaryID:1; $_al_DiaryIDS)
			QUERY WITH ARRAY:C644([DIARY:12]x_ID:50; $_al_DiaryIDS)
			If (Records in selection:C76([DIARY:12])>0)
				CREATE SET:C116([DIARY:12]; "$Temp2")
				INTERSECTION:C121("$Temp2"; "$Temp"; "$Temp")
				UNION:C120("$Temp"; "$Temp1"; "$Temp")
				CLEAR SET:C117("$Temp2")
				
			End if 
		End if 
		USE SET:C118("$Temp")
		CLEAR SET:C117("$Temp")
		CLEAR SET:C117("$Temp1")
		
	End if 
End if 
If (SD2_t_Document#"") & (SD2_t_DocumentName#"Multiple Documents")
	QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Document_Code:15=SD2_t_Document+"@")
End if 




QUERY SELECTION:C341([DIARY:12]; [DIARY:12]ThreadID:64=0)  //dont show thread subitems
ERR_MethodTrackerReturn("SD2_ApplySearchFilters"; $_t_oldMethodName)
