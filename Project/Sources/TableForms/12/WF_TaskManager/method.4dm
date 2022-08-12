
If (False:C215)
	//Object Name:      [DIARY].WF_TaskManager
	//------------------ Script Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  09/10/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(WF_lb_Actions;0)
	//ARRAY INTEGER(SD2_ad_DisplayDateFrom;0)
	ARRAY TEXT:C222($_at_DiaryCOdes; 0)
	ARRAY TEXT:C222($_at_WhoseDiary; 0)
	//ARRAY TEXT(SD_at_DisplayPersonCode;0)
	//ARRAY TEXT(SD2_at_ActionNames;0)
	//ARRAY TEXT(SD2_at_CampaignNames;0)
	//ARRAY TEXT(SD2_at_CampaignUUID;0)
	//ARRAY TEXT(SD2_at_CompanyNames;0)
	//ARRAY TEXT(SD2_At_DiaryCode;0)
	//ARRAY TEXT(SD2_at_DIsplayCompanyCode;0)
	//ARRAY TEXT(SD2_at_OwnerNames;0)
	//ARRAY TEXT(SD2_at_RelatedRecordCode;0)
	//ARRAY TEXT(SD2_at_RelatedTableName;0)
	//ARRAY TEXT(SD2_at_WFDiaryactions;0)
	//ARRAY TIME(SD2_ati_DisplayTimeFrom;0)
	C_BOOLEAN:C305(<>SYS_bo_QuitCalled; DB_bo_RefreshScreen; WFM_bo_InDC)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_BuildList; $_l_SIze; $_l_width; $_l_WindowID; ACCan_l_BUT1; ACCan_l_But2; ACCan_l_BUT3; ACCan_l_BUT4; ACCan_l_BUT5; ACCan_l_BUT6)
	C_LONGINT:C283(ACCan_l_BUT7; ACCan_l_BUT8; ACCan_l_BUT9; SD3_l_DiaryWorkflowWIndowID)
	C_OBJECT:C1216($_obj_DiaryAttributes; $_obj_GroupPrefs)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_oldMethodName; $_t_UpdaterMethod; ACCan_t_COL1; ACCan_t_COL2; ACCan_t_COL3; ACCan_t_COL4; ACCan_t_COL5; ACCan_t_COL6; ACCan_t_COL7; ACCan_t_COL8)
	C_TEXT:C284(ACCan_t_COL9; ACCan_t_HED1; ACCan_t_HED2; ACCan_t_HED3; ACCan_t_HED4; ACCan_t_HED5; ACCan_t_HED6; ACCan_t_HED7; ACCan_t_HED8; ACCan_t_HED9)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("FM [DIARY]WF_TaskManager"; Form event code:C388)
Case of 
		
	: (Form event code:C388=On Outside Call:K2:11)
		SHOW PROCESS:C325(Current process:C322)
		
		If (<>SYS_bo_QuitCalled)
			CANCEL:C270
		Else 
			If (DB_bo_RefreshScreen)
				WFM_bo_InDC:=False:C215
				SET TIMER:C645(1*60)  //every 30 seconds
				DB_bo_RefreshScreen:=False:C215
			End if 
			
		End if 
		
	: (Form event code:C388=On Load:K2:1)
		///
		
		QUERY:C277([DIARY_ITEMOWNERS:106]; [DIARY_ITEMOWNERS:106]PERSONNEL_ID:2=<>PER_l_CurrentUserID)
		SELECTION TO ARRAY:C260([DIARY_ITEMOWNERS:106]DIARY_CODE:1; $_at_DiaryCOdes)
		QUERY WITH ARRAY:C644([DIARY:12]Diary_Code:3; $_at_DiaryCOdes)
		QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Done:14=False:C215)
		QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Date_Do_From:4<=Current date:C33)
		CREATE SET:C116([DIARY:12]; "GroupedItems")
		QUERY:C277([DIARY:12]; [DIARY:12]Done:14=False:C215; *)
		QUERY:C277([DIARY:12];  & ; [DIARY:12]Person:8=<>PER_t_CurrentUserInitials)
		QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Date_Do_From:4<=Current date:C33)
		CREATE SET:C116([DIARY:12]; "MyItems")
		
		QUERY:C277([DIARY_ITEMOWNERS:106]; [DIARY_ITEMOWNERS:106]PERSONNEL_ID:2=<>PER_l_CurrentUserID)
		ARRAY TEXT:C222($_at_WhoseDiary; 0)
		APPEND TO ARRAY:C911($_at_WhoseDiary; <>PER_t_CurrentUserInitials)
		$_obj_GroupPrefs:=SD_GetGroups(<>PER_l_CurrentUserID)
		OB SET:C1220($_obj_DiaryAttributes; "DiaryGroups"; $_obj_GroupPrefs)
		
		OB SET ARRAY:C1227($_obj_DiaryAttributes; "WhoseDiary"; $_at_WhoseDiary)
		OB SET:C1220($_obj_DiaryAttributes; "ToDate"; Current date:C33(*))
		OB SET:C1220($_obj_DiaryAttributes; "ClassName"; "Workflow")
		
		
		SD3_ClientSubscribe(SD3_l_DiaryWorkflowWIndowID; "WF_UpdateWorkflowWindow"; Table:C252(->[DIARY:12]); $_obj_DiaryAttributes)
		ARRAY TEXT:C222(SD2_At_DiaryCode; 0)
		ARRAY TEXT:C222(SD2_at_WFDiaryactions; 0)
		ARRAY DATE:C224(SD2_ad_DisplayDateFrom; 0)
		ARRAY TIME:C1223(SD2_ati_DisplayTimeFrom; 0)
		ARRAY TEXT:C222(SD2_at_RelatedTableName; 0)
		ARRAY TEXT:C222(SD2_at_RelatedRecordCode; 0)
		ARRAY TEXT:C222(SD_at_DisplayPersonCode; 0)
		ARRAY TEXT:C222(SD2_at_CampaignUUID; 0)
		ARRAY TEXT:C222(SD2_at_DIsplayCompanyCode; 0)
		///now really we will move this to be controlled by a different mechanism but right now
		//SET TIMER(30*60)  //every 30 seconds
		//SELECTION TO ARRAY([DIARY]Diary_Code;SD2_At_DiaryCode;[DIARY]Action_Code;SD2_at_WFDiaryactions;[DIARY]Display_Date_From;SD2_ad_DisplayDateFrom;[DIARY]Display_Time_From;SD2_ati_DisplayTimeFrom
		//;[DIARY]Company_Code;SD2_at_DIsplayCompanyCode;[DIARY]Person;SD_at_DisplayPersonCode;[DIARY]CampaignUUID;SD2_at_CampaignUUID)
		$_l_SIze:=Size of array:C274(SD2_at_WFDiaryactions)
		ARRAY TEXT:C222(SD2_at_CampaignNames; 0)
		ARRAY TEXT:C222(SD2_at_CampaignNames; $_l_SIze)
		ARRAY TEXT:C222(SD2_at_ActionNames; 0)
		ARRAY TEXT:C222(SD2_at_ActionNames; $_l_SIze)
		ARRAY TEXT:C222(SD2_at_OwnerNames; 0)
		ARRAY TEXT:C222(SD2_at_OwnerNames; $_l_SIze)
		ARRAY TEXT:C222(SD2_at_CompanyNames; 0)
		ARRAY TEXT:C222(SD2_at_CompanyNames; $_l_SIze)
		If (False:C215)
			
			For ($_l_BuildList; 1; Size of array:C274(SD2_at_WFDiaryactions))
				QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=SD2_at_WFDiaryactions{$_l_BuildList})
				SD2_at_ActionNames{$_l_BuildList}:=[ACTIONS:13]Action_Name:2
				If (Not:C34(UTIL_isUUIDNil(SD2_at_CampaignUUID{$_l_BuildList})))
					QUERY:C277([WORKFLOW_Campaign:209]; [WORKFLOW_Campaign:209]UUID:1=SD2_at_CampaignUUID{$_l_BuildList})
					SD2_at_CampaignNames{$_l_BuildList}:=[WORKFLOW_Campaign:209]Campaign_Name:2
				Else 
					SD2_at_CampaignNames{$_l_BuildList}:="N/A"
				End if 
				UNLOAD RECORD:C212([WORKFLOW_Campaign:209])
				If (SD_at_DisplayPersonCode{$_l_BuildList}="")
					SD2_at_OwnerNames{$_l_BuildList}:="Group task"
				Else 
					QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=SD_at_DisplayPersonCode{$_l_BuildList})
					SD2_at_OwnerNames{$_l_BuildList}:=[PERSONNEL:11]Name:2
				End if 
				UNLOAD RECORD:C212([PERSONNEL:11])
				If (SD2_at_DIsplayCompanyCode{$_l_BuildList}#"")
					QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=SD2_at_DIsplayCompanyCode{$_l_BuildList})
					SD2_at_CompanyNames{$_l_BuildList}:=[COMPANIES:2]Company_Name:2
				End if 
				UNLOAD RECORD:C212([COMPANIES:2])
				
			End for 
		End if 
		LB_SetupListbox(->WF_lb_Actions; "ACCan_t"; "ACCan_L"; 1; ->SD2_At_DiaryCode; ->SD2_at_WFDiaryactions; ->SD2_at_ActionNames; ->SD2_at_CampaignUUID; ->SD2_at_CampaignNames; ->SD2_at_DIsplayCompanyCode; ->SD2_at_CompanyNames; ->SD2_ad_DisplayDateFrom; ->SD2_ati_DisplayTimeFrom; ->SD_at_DisplayPersonCode; ->SD2_at_OwnerNames)
		
		LB_SetColumnHeaders(->WF_lb_Actions; "ACCan_L"; 1; "ActionCode"; "Diary"; "Action"; "CampaignID"; "Campaign"; "CompanyCode"; "Company Name"; "Date"; "Time"; "OwnerID"; "Owner")
		
		
		LB_SetColumnWidths(->WF_lb_Actions; "ACCan_t"; 1; 0; 0; 100; 0; 220; 0; 240; 60; 60; 0; 80)
		LB_SetScroll(->WF_lb_Actions; -3; -2)
		LB_StyleSettings(->WF_lb_Actions; "Black"; 9; "ACCan_t"; ->[DIARY:12])
		LB_SetEnterable(->WF_lb_Actions; False:C215; 0)
		LB_SetEnterable(->WF_lb_Actions; True:C214; 1)
		
		If (Size of array:C274(SD2_at_WFDiaryactions)>0)
			$_l_SIze:=(SD2_at_WFDiaryactions*20)
			Case of 
				: ($_l_SIze<200)
					$_l_SIze:=200
				: ($_l_SIze>400)
					$_l_SIze:=400
			End case 
			$_l_width:=0+100+0+220+0+240+60+60+0+80
			SET WINDOW RECT:C444((Screen width:C187-10)-$_l_width; (Screen height:C188-10)-($_l_SIze+50); (Screen width:C187-10); (Screen height:C188-10))
			OBJECT SET COORDINATES:C1248(*; "oWorkflowActions"; 2; 2; 2+$_l_width; 2+$_l_SIze)
			
			
			
		Else 
			HIDE PROCESS:C324(Current process:C322)
		End if 
		
	: (Form event code:C388=On Timer:K2:25)  //dont forget to stop and start the timer!
		If (False:C215)
			If (Not:C34(WFM_bo_InDC))
				SET TIMER:C645(30*60)  //every 30 seconds
				QUERY:C277([DIARY_ITEMOWNERS:106]; [DIARY_ITEMOWNERS:106]PERSONNEL_ID:2=<>PER_l_CurrentUserID)
				SELECTION TO ARRAY:C260([DIARY_ITEMOWNERS:106]DIARY_CODE:1; $_at_DiaryCOdes)
				QUERY WITH ARRAY:C644([DIARY:12]Diary_Code:3; $_at_DiaryCOdes)
				QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Done:14=False:C215)
				QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Date_Do_From:4<=Current date:C33)
				CREATE SET:C116([DIARY:12]; "GroupedItems")
				QUERY:C277([DIARY:12]; [DIARY:12]Done:14=False:C215; *)
				QUERY:C277([DIARY:12];  & ; [DIARY:12]Person:8=<>PER_t_CurrentUserInitials)
				QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Date_Do_From:4<=Current date:C33)
				CREATE SET:C116([DIARY:12]; "MyItems")
				UNION:C120("GroupedItems"; "MyItems"; "MyItems")
				USE SET:C118("MyItems")
				///now really we will move this to be controlled by a different mechanism but right now
				
				SELECTION TO ARRAY:C260([DIARY:12]Diary_Code:3; SD2_At_DiaryCode; [DIARY:12]Action_Code:9; SD2_at_WFDiaryactions; [DIARY:12]Display_Date_From:51; SD2_ad_DisplayDateFrom; [DIARY:12]Display_Time_From:53; SD2_ati_DisplayTimeFrom; [DIARY:12]Company_Code:1; SD2_at_DIsplayCompanyCode; [DIARY:12]Person:8; SD_at_DisplayPersonCode; [DIARY:12]CampaignUUID:80; SD2_at_CampaignUUID)
				$_l_SIze:=Size of array:C274(SD2_at_WFDiaryactions)
				ARRAY TEXT:C222(SD2_at_CampaignNames; 0)
				ARRAY TEXT:C222(SD2_at_CampaignNames; $_l_SIze)
				ARRAY TEXT:C222(SD2_at_ActionNames; 0)
				ARRAY TEXT:C222(SD2_at_ActionNames; $_l_SIze)
				ARRAY TEXT:C222(SD2_at_OwnerNames; 0)
				ARRAY TEXT:C222(SD2_at_OwnerNames; $_l_SIze)
				ARRAY TEXT:C222(SD2_at_CompanyNames; 0)
				ARRAY TEXT:C222(SD2_at_CompanyNames; $_l_SIze)
				
				For ($_l_BuildList; 1; Size of array:C274(SD2_at_WFDiaryactions))
					QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=SD2_at_WFDiaryactions{$_l_BuildList})
					SD2_at_ActionNames{$_l_BuildList}:=[ACTIONS:13]Action_Name:2
					If (Not:C34(UTIL_isUUIDNil(SD2_at_CampaignUUID{$_l_BuildList})))
						QUERY:C277([WORKFLOW_Campaign:209]; [WORKFLOW_Campaign:209]UUID:1=SD2_at_CampaignUUID{$_l_BuildList})
						SD2_at_CampaignNames{$_l_BuildList}:=[WORKFLOW_Campaign:209]Campaign_Name:2
					Else 
						SD2_at_CampaignNames{$_l_BuildList}:="N/A"
					End if 
					UNLOAD RECORD:C212([WORKFLOW_Campaign:209])
					If (SD_at_DisplayPersonCode{$_l_BuildList}="")
						SD2_at_OwnerNames{$_l_BuildList}:="Group task"
					Else 
						QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=SD_at_DisplayPersonCode{$_l_BuildList})
						SD2_at_OwnerNames{$_l_BuildList}:=[PERSONNEL:11]Name:2
					End if 
					UNLOAD RECORD:C212([PERSONNEL:11])
					If (SD2_at_DIsplayCompanyCode{$_l_BuildList}#"")
						QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=SD2_at_DIsplayCompanyCode{$_l_BuildList})
						SD2_at_CompanyNames{$_l_BuildList}:=[COMPANIES:2]Company_Name:2
					End if 
					UNLOAD RECORD:C212([COMPANIES:2])
					
				End for 
				
				If (Not:C34(WFM_bo_InDC))
					If (Size of array:C274(SD2_at_WFDiaryactions)>0)
						$_l_SIze:=(SD2_at_WFDiaryactions*20)
						Case of 
							: ($_l_SIze<200)
								$_l_SIze:=200
							: ($_l_SIze>400)
								$_l_SIze:=400
						End case 
						$_l_width:=0+100+0+220+0+240+60+60+0+80
						SET WINDOW RECT:C444((Screen width:C187-10)-$_l_width; (Screen height:C188-10)-($_l_SIze+50); (Screen width:C187-10); (Screen height:C188-10))
						OBJECT SET COORDINATES:C1248(*; "oWorkflowActions"; 2; 2; 2+$_l_width; 2+$_l_SIze)
						
						
					Else 
						HIDE PROCESS:C324(Current process:C322)
					End if 
				End if 
				
			End if 
		End if 
End case 
ERR_MethodTrackerReturn("FM [DIARY]WF_TaskManager"; $_t_oldMethodName)
