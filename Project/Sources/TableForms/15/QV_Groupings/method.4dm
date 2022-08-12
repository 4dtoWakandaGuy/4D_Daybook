If (False:C215)
	//Table Form Method Name: [USER]QV_Groupings
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/03/2010 18:23
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(QV_abo_Exclude;0)
	//ARRAY BOOLEAN(QV_abo_include;0)
	//ARRAY BOOLEAN(QV_LB_Items;0)
	//ARRAY INTEGER(QV_ai_Exclude;0)
	//ARRAY INTEGER(QV_ai_include;0)
	//ARRAY LONGINT(<>QL_al_LoadedListVersion;0)
	//ARRAY LONGINT(<>QV_al_LoadedList;0)
	//ARRAY LONGINT(QV_al_GroupIDs;0)
	//ARRAY LONGINT(QV_al_LabelOrder;0)
	//ARRAY LONGINT(QV_al_QualityGroupsIDs;0)
	//ARRAY LONGINT(QV_al_QualityIDs;0)
	//ARRAY LONGINT(QV_al_QualityLevelLevels;0)
	//ARRAY LONGINT(QV_al_QualityPropertiesNUM;0;0)
	//ARRAY LONGINT(QV_al_QualityQualityYears;0)
	//ARRAY LONGINT(QV_al_QualitySubGroupsIDs;0)
	//ARRAY LONGINT(QV_al_TableRestrictionIDs;0)
	//ARRAY LONGINT(QV_at_QualityYears;0)
	//ARRAY LONGINT(SM_al_SearchIDs;0)
	//ARRAY TEXT(QV_at_DisplayNames;0)
	//ARRAY TEXT(QV_at_GroupNames;0)
	//ARRAY TEXT(QV_at_LabelNames;0)
	//ARRAY TEXT(QV_at_LevelOptions;0)
	//ARRAY TEXT(QV_at_LevelsOptions;0)
	//ARRAY TEXT(QV_at_QualityGroups;0)
	//ARRAY TEXT(QV_at_QualityGroupsNM;0)
	//ARRAY TEXT(QV_at_QualityNames;0)
	//ARRAY TEXT(QV_at_QualityProperties;0;0)
	//ARRAY TEXT(QV_at_QualityPropertiesNAM;0;0)
	//ARRAY TEXT(QV_at_QualitySubGroups;0)
	//ARRAY TEXT(QV_at_QualitySubGroupsNM;0)
	//ARRAY TEXT(QV_at_TableRestrictionNMs;0)
	//ARRAY TEXT(QV_at_YearOptions;0)
	//ARRAY TEXT(QV_at_YearsOptions;0)
	//ARRAY TEXT(SM_at_SearchNames;0)
	C_BLOB:C604(<>LoadedListBLOB)
	C_BOOLEAN:C305($_bo_Expanded; DB_bo_NoLoad; QV_bo_ReturnQuals)
	C_LONGINT:C283($_l_CountListItems; $_l_DefaultGroupRow; $_l_event; $_l_Index; $_l_ItemReference; $_l_ListID; $_l_NewVersion; $_l_Restriction; $_l_RestrictionItemID; $_l_RestrictionListID; $_l_SubListID)
	C_LONGINT:C283($_l_SublistIndex; $_l_SublistNUM; $_l_SublistRow; $_l_VersionLoaded; APPL_l_BUT1; APPL_l_BUT2; APPL_l_BUT3; APPL_l_BUT4; APPL_l_BUT5; APPL_l_BUT7; APPL_l_BUT8)
	C_LONGINT:C283(APPL_l_BUT9; APPL_L6; QV_HL_QualitiesList; QV_l_CurrentTable; QV_l_Powerview)
	C_TEXT:C284($_t_ItemText; $_t_oldMethodName; oApplicants_COL1; oApplicants_COL2; oApplicants_COL3; oApplicants_COL4; oApplicants_COL5; oApplicants_COL6; oApplicants_COL7; oApplicants_COL8; oApplicants_COL9)
	C_TEXT:C284(oApplicants_HED1; oApplicants_HED2; oApplicants_HED3; oApplicants_HED4; oApplicants_HED5; oApplicants_HED6; oApplicants_HED7; oApplicants_HED8; oApplicants_HED9; QV_t_DefaultGroup; QV_T_QualitiesAsTEXT)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [USER].QV_Groupings"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[USER:15]); "QV_Groupings")
		//OK so a little note here. For the purposes of this form the following arrays are of no interest
		//ARRAY LONGINT(QV_al_QualityLevelLevels;0)
		//ARRAY LONGINT(QV_al_QualityQualityYears;0)
		//ARRAY INTEGER(QV_ai_include;0)
		//ARRAY INTEGER(QV_ai_Exclude;0)
		//ARRAY STRING(25;QV_at_LevelOptions;0)
		//ARRAY STRING(25;QV_at_YearOptions;0)
		//ARRAY INTEGER(QV_ai_Exclude;0)
		//ARRAY STRING(25;QV_at_LevelsOptions;6)
		//ARRAY STRING(25;QV_at_YearsOptions;6)
		//However  because not including those arrays will be difficult(many of the sub routines add elements etc.
		//Those arrays WILL exist However they are not going to be displayed in the area list area and of course will not be populated.
		//The following two arrays are used(which are not used elsewhere-these are manually filled by the user
		//QV_at_DisplayNames;-QV_at_LabelNames. They will default to using the Values of ,QV_at_QualityNames,QV_at_GroupNames.
		SM_LoadSearchParameterNames(Table:C252(->[INFORMATION:55]); -1; -1; -999)
		
		WS_AutoscreenSize(3; 480; 486)
		SET WINDOW TITLE:C213("Quality Group Displays")
		
		//ARRAY STRING(20;QV_at_QueryType;2)
		//QV_at_QueryType{1}:="With any...."
		//QV_at_QueryType{2}:="With all..."
		//QV_at_QueryType:=1
		ARRAY LONGINT:C221(<>QV_al_LoadedList; 1)
		ARRAY LONGINT:C221(<>QL_al_LoadedListVersion; 1)
		
		//the above WILL be a powerview area but at the moment is an area list one
		
		QV_T_QualitiesAsTEXT:=""
		//Load the qualities for this table to
		//an Heirarchical list(for lazy/help)
		$_l_RestrictionListID:=AA_GetListbyName("Table Restriction"; True:C214)
		ARRAY LONGINT:C221(QV_al_TableRestrictionIDs; 0)
		ARRAY TEXT:C222(QV_at_TableRestrictionNMs; 0)
		AA_LoadListbyID($_l_RestrictionListID; ->QV_at_TableRestrictionNMs; ->QV_al_TableRestrictionIDs)
		$_l_RestrictionItemID:=0
		
		If (QV_l_CurrentTable>0)
			If (Is table number valid:C999(QV_l_CurrentTable))
				$_l_DefaultGroupRow:=Find in array:C230(QV_at_TableRestrictionNMs; Table name:C256(Table:C252(QV_l_CurrentTable)))
				If ($_l_DefaultGroupRow<0)
					$_l_RestrictionItemID:=AA_ListAddItembyID($_l_RestrictionListID; Table name:C256(Table:C252(QV_l_CurrentTable)))
					AA_LoadListbyID($_l_RestrictionListID; ->QV_at_TableRestrictionNMs; ->QV_al_TableRestrictionIDs)
				Else 
					$_l_RestrictionItemID:=QV_al_TableRestrictionIDs{$_l_DefaultGroupRow}
				End if 
			End if 
		End if 
		ARRAY TEXT:C222(QV_at_QualityGroupsNM; 0)
		ARRAY LONGINT:C221(QV_al_QualityGroupsIDs; 0)
		ARRAY TEXT:C222(QV_at_QualityGroups; 0)
		ARRAY TEXT:C222(QV_at_QualityProperties; 0; 0)
		ARRAY LONGINT:C221(QV_al_QualityPropertiesNUM; 0; 0)
		ARRAY TEXT:C222(QV_at_QualityPropertiesNAM; 0; 0)
		
		$_l_ListID:=AA_LoadList(->[INFORMATION:55]QualityID:14; ->QV_at_QualityGroupsNM; ->QV_al_QualityGroupsIDs; False:C215; ->QV_at_QualityGroups; ->QV_at_QualityProperties; ->QV_al_QualityPropertiesNUM; ->QV_at_QualityPropertiesNAM)
		
		SORT ARRAY:C229(QV_at_QualityGroupsNM; QV_al_QualityGroupsIDs; QV_at_QualityGroups; QV_at_QualityProperties; QV_al_QualityPropertiesNUM; QV_at_QualityPropertiesNAM)
		QV_HL_QualitiesList:=New list:C375
		If (<>QV_al_LoadedList{1}=-($_l_ListID+QV_l_CurrentTable))
			If ([X_LISTS:111]x_ID:1#$_l_ListID)
				QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ID:1=$_l_ListID)
			End if 
			If ([X_LISTS:111]X_ListVersion:5>0)
				$_l_VersionLoaded:=[X_LISTS:111]X_ListVersion:5
			Else 
				$_l_VersionLoaded:=-1
			End if 
			$_l_NewVersion:=-1
		Else 
			If ([X_LISTS:111]x_ID:1#$_l_ListID)
				QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ID:1=$_l_ListID)
			End if 
			$_l_VersionLoaded:=-1
			If ([X_LISTS:111]X_ListVersion:5>0)
				$_l_NewVersion:=[X_LISTS:111]X_ListVersion:5
			Else 
				$_l_NewVersion:=-1
			End if 
		End if 
		If ($_l_VersionLoaded=(<>QL_al_LoadedListVersion{1}+99))
			If (BLOB size:C605(<>LoadedListBLOB)>0)
				QV_HL_QualitiesList:=BLOB to list:C557(<>LoadedListBLOB)
			End if 
			
		Else 
			
			For ($_l_Index; 1; Size of array:C274(QV_at_QualityGroupsNM))
				QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=QV_al_QualityGroupsIDs{$_l_Index})
				
				//the sub items are not built
				ARRAY TEXT:C222(QV_at_QualitySubGroupsNM; 0)
				ARRAY LONGINT:C221(QV_al_QualitySubGroupsIDs; 0)
				ARRAY TEXT:C222(QV_at_QualitySubGroups; 0)
				
				
				//$_l_SublistRow:=Find in array(QV_at_QualityProperties{$_l_DefaultGroupRow};"Table Restriction")
				$_l_SublistRow:=Find in array:C230(QV_at_QualityProperties{$_l_Index}; "Table Restriction")  //changed to $_l_Index to fix bug with repeating the same list of qualities under each sub group as per discussion with Nigel on 12/05/08 -kmw
				
				
				$_l_Restriction:=0
				If ($_l_SublistRow>0)
					//$_l_Restriction:=QV_al_QualityPropertiesNUM{$_l_DefaultGroupRow}{$_l_SublistRow}
					$_l_Restriction:=QV_al_QualityPropertiesNUM{$_l_Index}{$_l_SublistRow}  //changed to $_l_Index to fix bug with repeating the same list of qualities under each sub group as per discussion with Nigel on 12/05/08 -kmw
				Else 
					//QUERY([LIST_ITEMS];[LIST_ITEMS]x_ID=QV_al_QualityGroupsIDs{$_l_DefaultGroupRow})
					QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=QV_al_QualityGroupsIDs{$_l_Index})  //changed to $_l_Index to fix bug with repeating the same list of qualities under each sub group as per discussion with Nigel on 12/05/08 -kmw AA_GetListItemProperty ("TABLE RESTRICTION";->$_l_Restriction)
					
				End if 
				
				If ($_l_Restriction=0) | ($_l_Restriction=$_l_RestrictionItemID)
					//load sublist
					//$_l_SublistRow:=Find in array(QV_at_QualityProperties{$_l_DefaultGroupRow};"SUBLIST")
					$_l_SublistRow:=Find in array:C230(QV_at_QualityProperties{$_l_Index}; "SUBLIST")  //changed to $_l_Index to fix bug with repeating the same list of qualities under each sub group as per discussion with Nigel on 12/05/08 -kmw
					$_l_SublistNUM:=0
					If ($_l_SublistRow>0)
						//$_l_SublistNUM:=QV_al_QualityPropertiesNUM{$_l_DefaultGroupRow}{$_l_SublistRow}
						$_l_SublistNUM:=QV_al_QualityPropertiesNUM{$_l_Index}{$_l_SublistRow}  //changed to $_l_Index to fix bug with repeating the same list of qualities under each sub group as per discussion with Nigel on 12/05/08 -kmw
					Else 
						QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=QV_al_QualityGroupsIDs{$_l_Index})  //changed to $_l_Index to fix bug with repeating the same list of qualities under each sub group as per discussion with Nigel on 12/05/08 -kmw
						AA_GetListItemProperty("SUBLIST"; ->$_l_SublistNUM)
						
					End if 
					If ($_l_SublistNUM>0)
						//just to be safe
						AA_LoadListbyID($_l_SublistNUM; ->QV_at_QualitySubGroupsNM; ->QV_al_QualitySubGroupsIDs; False:C215)
						If (Size of array:C274(QV_at_QualitySubGroupsNM)>0)
							//only now do we do any appends
							SORT ARRAY:C229(QV_at_QualitySubGroupsNM; QV_al_QualitySubGroupsIDs)
							$_l_SubListID:=New list:C375
							For ($_l_SublistIndex; 1; Size of array:C274(QV_at_QualitySubGroupsNM))
								APPEND TO LIST:C376($_l_SubListID; QV_at_QualitySubGroupsNM{$_l_SublistIndex}; QV_al_QualitySubGroupsIDs{$_l_SublistIndex})
							End for 
							APPEND TO LIST:C376(QV_HL_QualitiesList; QV_at_QualityGroupsNM{$_l_Index}; QV_al_QualityGroupsIDs{$_l_Index}; $_l_SubListID; True:C214)
						End if 
						
					Else 
						//no point in a group without items in here
					End if 
				End if 
				
				
				
				
			End for 
			<>QL_al_LoadedListVersion{1}:=$_l_NewVersion
			<>QV_al_LoadedList{1}:=$_l_ListID+QV_l_CurrentTable
			
			LIST TO BLOB:C556(QV_HL_QualitiesList; <>LoadedListBLOB)
		End if 
		//Now set up the area list area
		//this will be changed to powerview
		ARRAY TEXT:C222(QV_at_GroupNames; 0)
		ARRAY TEXT:C222(QV_at_QualityNames; 0)
		ARRAY LONGINT:C221(QV_al_GroupIDs; 0)
		ARRAY LONGINT:C221(QV_al_QualityIDs; 0)
		ARRAY LONGINT:C221(QV_al_QualityLevelLevels; 0)
		ARRAY LONGINT:C221(QV_al_QualityQualityYears; 0)  //NG CHecked April 2020
		ARRAY INTEGER:C220(QV_ai_include; 0)
		ARRAY INTEGER:C220(QV_ai_Exclude; 0)
		ARRAY BOOLEAN:C223(QV_abo_include; 0)
		ARRAY BOOLEAN:C223(QV_abo_Exclude; 0)
		
		ARRAY TEXT:C222(QV_at_LevelOptions; 0)
		ARRAY TEXT:C222(QV_at_YearOptions; 0)
		
		//``
		//NG 28/7/2006
		ARRAY LONGINT:C221(QV_al_LabelOrder; 0)
		
		ARRAY TEXT:C222(QV_at_DisplayNames; 0)
		ARRAY TEXT:C222(QV_at_LabelNames; 0)
		//``
		ARRAY TEXT:C222(QV_at_LevelsOptions; 6)
		ARRAY TEXT:C222(QV_at_YearsOptions; 6)
		QV_at_LevelsOptions{1}:="Equal to"
		QV_at_LevelsOptions{2}:="Greater Than"
		QV_at_LevelsOptions{3}:="Greater Than or Equal to"
		QV_at_LevelsOptions{4}:="Less Than"
		QV_at_LevelsOptions{5}:="Less Than or Equal to"
		QV_at_LevelsOptions{6}:="Not Equal to"
		QV_at_YearsOptions{1}:="Equal to"
		QV_at_YearsOptions{2}:="Greater Than"
		QV_at_YearsOptions{3}:="Greater Than or Equal to"
		QV_at_YearsOptions{4}:="Less than"
		QV_at_YearsOptions{5}:="Less Than or Equal to"
		QV_at_YearsOptions{6}:="Not Equal to"
		//NG Julyt 2006 it is below this point that this form is different to the DQualitiesSeach
		//````
		
		LB_SetupListbox(->QV_LB_Items; "oApplicants"; "APPL_L"; 1; ->QV_al_LabelOrder; ->QV_at_GroupNames; ->QV_at_LabelNames; ->QV_at_DisplayNames; ->QV_at_QualityNames)
		
		LB_SetColumnHeaders(->QV_LB_Items; "APPL_L"; 1; "Display Order"; "Group"; "Heading Label"; "Sub-group"; "Displayed as ")
		LB_SetColumnWidths(->QV_LB_Items; "oApplicants"; 1; 35; 90; 90; 140; 90; 140)
		
		LB_SetScroll(->QV_LB_Items; -2; -3)
		LB_SETENTRYOPTIONS  // doesn't actually do anything ...
		LB_StyleSettings(->QV_LB_Items; "blue"; 9; "oApplicants"; ->[CONTACTS:1])
		LB_SetScroll(->QV_LB_Items; -2; -2)
		LB_SetEnterable(->QV_LB_Items; True:C214; 1)
		LB_SetEnterable(->QV_LB_Items; False:C215; 2)
		LB_SetEnterable(->QV_LB_Items; True:C214; 3)
		LB_SetEnterable(->QV_LB_Items; True:C214; 4)
		LB_SetEnterable(->QV_LB_Items; True:C214; 5)
		
		
		LB_SetFormat(->QV_LB_Items; 2; "#######0;-#######0;"; 1; 1; Align center:K42:3)
		//AL_SetEnterable (QV_l_Powerview;3;0;"";0)
		//AL_SetEnterable (QV_l_Powerview;1;0;"";0)
		//AL_SetEnterable (QV_l_Powerview;4;0;"";0)
		// AL_SetEnterable (QV_l_Powerview;5;0;"";0)
		// AL_SetEnterable (QV_l_Powerview;6;0;"";0)
		//we will set specific cells when they exist
		
		If (Is a list:C621(QV_HL_QualitiesList))
			$_l_CountListItems:=Count list items:C380(QV_HL_QualitiesList)
			
			For ($_l_Index; 1; $_l_CountListItems)
				GET LIST ITEM:C378(QV_HL_QualitiesList; $_l_Index; $_l_ItemReference; $_t_ItemText; $_l_SubListID; $_bo_Expanded)
				If ($_l_SubListID>0)
					SET LIST ITEM:C385(QV_HL_QualitiesList; $_l_ItemReference; $_t_ItemText; $_l_ItemReference; $_l_SubListID; False:C215)
				End if 
			End for 
			//////_o_REDRAW LIST(QV_HL_QualitiesList)
		End if 
		If (QV_t_DefaultGroup#"")  // A groups is set to display
			$_l_DefaultGroupRow:=Find in array:C230(SM_at_SearchNames; QV_t_DefaultGroup)
			
			If ($_l_DefaultGroupRow>0)
				SM_at_SearchNames:=$_l_DefaultGroupRow
				SM_al_SearchIDs{Size of array:C274(SM_al_SearchIDs)-1}:=-SM_al_SearchIDs{SM_at_SearchNames}
				
				SM_LoadSearchParameters(SM_al_SearchIDs{SM_at_SearchNames})
			End if 
		End if 
		INT_SetDialog
		
End case 
ERR_MethodTrackerReturn("FM:QV_Groupings"; $_t_oldMethodName)
