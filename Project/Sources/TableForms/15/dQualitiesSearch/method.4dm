If (False:C215)
	//Table Form Method Name: Object Name:      [USER].dQualitiesSearch
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/11/2012 10:44
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
	//ARRAY LONGINT(QV_al_Levels;0)
	//ARRAY LONGINT(QV_al_QualityGroupsIDs;0)
	//ARRAY LONGINT(QV_al_QualityIDs;0)
	//ARRAY LONGINT(QV_al_QualityLevelLevels;0)
	//ARRAY LONGINT(QV_al_QualityPropertiesNUM;0;0)
	//ARRAY LONGINT(QV_al_QualityQualityYears;0)
	//ARRAY LONGINT(QV_al_QualitySubGroupsIDs;0)
	//ARRAY LONGINT(QV_al_QualityYears;0)
	//ARRAY LONGINT(QV_al_TableRestrictionIDs;0)
	//ARRAY TEXT(QV_at_GroupNames;0)
	//ARRAY TEXT(QV_at_LevelOptions;0)
	//ARRAY TEXT(QV_at_LevelsOptions;0)
	//ARRAY TEXT(QV_at_QualityGroups;0)
	//ARRAY TEXT(QV_at_QualityGroupsNM;0)
	//ARRAY TEXT(QV_at_QualityNames;0)
	//ARRAY TEXT(QV_at_QualityProperties;0;0)
	//ARRAY TEXT(QV_at_QualityPropertiesNAM;0;0)
	//ARRAY TEXT(QV_at_QualitySubGroups;0)
	//ARRAY TEXT(QV_at_QualitySubGroupsNM;0)
	//ARRAY TEXT(QV_at_QueryType;0)
	//ARRAY TEXT(QV_at_TableRestrictionNMs;0)
	//ARRAY TEXT(QV_at_YearOptions;0)
	//ARRAY TEXT(QV_at_YearsOptions;0)
	C_BLOB:C604(<>LoadedListBLOB)
	C_BOOLEAN:C305($_bo_Expanded; DB_bo_NoLoad; QV_bo_KeepWindowsize; QV_bo_ReturnQuals)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_CountColumns; $_l_CountListItems; $_l_defaultparams; $_l_event; $_l_Index; $_l_ItemReference; $_l_ListID; $_l_NewVersion; $_l_PitemID; $_l_PropertyRow)
	C_LONGINT:C283($_l_Restriction; $_l_RestrictionListID; $_l_RestrictionRow; $_l_SubIndex; $_l_SublistID; $_l_SubListNUM; $_l_Version; QV_HL_QualitiesList; QV_l_CurrentTable; QV_l_Powerview)
	C_TEXT:C284($_t_EmailText; $_t_ItemText; $_t_oldMethodName; QV_T_QualitiesAsTEXT)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [USER].dQualitiesSearch"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[USER:15]); "dQualitiesSearch")
		SM_LoadSearchParameterNames(Table:C252(->[INFORMATION:55]))
		If (Not:C34(QV_bo_KeepWindowsize))
			WS_AutoscreenSize(2; 383; 747)
		End if 
		ARRAY TEXT:C222(QV_at_QueryType; 2)
		QV_at_QueryType{1}:="With any...."
		QV_at_QueryType{2}:="With all..."
		QV_at_QueryType:=1
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
		$_l_PitemID:=0
		
		If (QV_l_CurrentTable>0)
			If (Is table number valid:C999(QV_l_CurrentTable))
				$_l_RestrictionRow:=Find in array:C230(QV_at_TableRestrictionNMs; Table name:C256(Table:C252(QV_l_CurrentTable)))
				If ($_l_RestrictionRow<0)
					$_l_PitemID:=AA_ListAddItembyID($_l_RestrictionListID; Table name:C256(Table:C252(QV_l_CurrentTable)))
					AA_LoadListbyID($_l_RestrictionListID; ->QV_at_TableRestrictionNMs; ->QV_al_TableRestrictionIDs)
				Else 
					$_l_PitemID:=QV_al_TableRestrictionIDs{$_l_RestrictionRow}
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
				$_l_Version:=[X_LISTS:111]X_ListVersion:5
			Else 
				$_l_Version:=-1
			End if 
			$_l_NewVersion:=-1
		Else 
			If ([X_LISTS:111]x_ID:1#$_l_ListID)
				QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ID:1=$_l_ListID)
			End if 
			$_l_Version:=-1
			If ([X_LISTS:111]X_ListVersion:5>0)
				$_l_NewVersion:=[X_LISTS:111]X_ListVersion:5
			Else 
				$_l_NewVersion:=-1
			End if 
		End if 
		If ($_l_Version=(<>QL_al_LoadedListVersion{1}+99))
			If (BLOB size:C605(<>LoadedListBLOB)>0)
				QV_HL_QualitiesList:=BLOB to list:C557(<>LoadedListBLOB)
			End if 
			
		Else 
			
			For ($_l_Index; 1; Size of array:C274(QV_at_QualityGroupsNM))
				QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=QV_al_QualityGroupsIDs)
				
				//the sub items are not built
				ARRAY TEXT:C222(QV_at_QualitySubGroupsNM; 0)
				ARRAY LONGINT:C221(QV_al_QualitySubGroupsIDs; 0)
				ARRAY TEXT:C222(QV_at_QualitySubGroups; 0)
				$_l_PropertyRow:=Find in array:C230(QV_at_QualityProperties{$_l_Index}; "Table Restriction")
				If ($_l_PropertyRow>0)
					$_l_Restriction:=QV_al_QualityPropertiesNUM{$_l_Index}{$_l_PropertyRow}
				Else 
					QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=QV_al_QualityGroupsIDs{$_l_Index})
					AA_GetListItemProperty("Table Restriction"; ->$_l_Restriction)
				End if 
				If ($_l_Restriction=0) | ($_l_Restriction=$_l_PitemID)
					$_l_SubListNUM:=0
					$_l_PropertyRow:=Find in array:C230(QV_at_QualityProperties{$_l_Index}; "SUBLIST")
					If ($_l_PropertyRow>0)
						$_l_SubListNUM:=QV_al_QualityPropertiesNUM{$_l_Index}{$_l_PropertyRow}
					Else 
						QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=QV_al_QualityGroupsIDs{$_l_Index})
						AA_GetListItemProperty("SUBLIST"; ->$_l_SubListNUM)
					End if 
					
					If ($_l_SubListNUM>0)
						//just to be safe
						AA_LoadListbyID($_l_SubListNUM; ->QV_at_QualitySubGroupsNM; ->QV_al_QualitySubGroupsIDs; False:C215)
						If (Size of array:C274(QV_at_QualitySubGroupsNM)>0)
							//only now do we do any appends
							SORT ARRAY:C229(QV_at_QualitySubGroupsNM; QV_al_QualitySubGroupsIDs)
							$_l_SublistID:=New list:C375
							For ($_l_SubIndex; 1; Size of array:C274(QV_at_QualitySubGroupsNM))
								APPEND TO LIST:C376($_l_SublistID; QV_at_QualitySubGroupsNM{$_l_SubIndex}; QV_al_QualitySubGroupsIDs{$_l_SubIndex})
							End for 
							APPEND TO LIST:C376(QV_HL_QualitiesList; QV_at_QualityGroupsNM{$_l_Index}; QV_al_QualityGroupsIDs{$_l_Index}; $_l_SublistID; True:C214)
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
		ARRAY LONGINT:C221(QV_al_QualityQualityYears; 0)  // NG Checked April 2020 WAS QV_at_Quality Years but LONGINT
		ARRAY INTEGER:C220(QV_ai_include; 0)
		ARRAY INTEGER:C220(QV_ai_Exclude; 0)
		ARRAY BOOLEAN:C223(QV_abo_include; 0)
		ARRAY BOOLEAN:C223(QV_abo_Exclude; 0)
		ARRAY TEXT:C222(QV_at_LevelOptions; 0)
		ARRAY TEXT:C222(QV_at_YearOptions; 0)
		//ARRAY INTEGER(QV_ai_Exclude;0)
		ARRAY TEXT:C222(QV_at_LevelsOptions; 6)
		ARRAY LONGINT:C221(QV_al_Levels; 6)
		
		QV_al_Levels{1}:=0
		QV_al_Levels{2}:=1
		QV_al_Levels{3}:=2
		QV_al_Levels{4}:=3
		QV_al_Levels{5}:=4
		QV_al_Levels{6}:=5
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
		QV_LBSetup  // 10/07/06 pb
		$_l_CountColumns:=LISTBOX Get number of columns:C831(QV_LB_Items)
		LB_SetEnterable(->QV_LB_Items; True:C214; 1)
		If ($_l_CountColumns>=6)
			LB_SetEnterable(->QV_LB_Items; True:C214; 5)
			LB_SetEnterable(->QV_LB_Items; True:C214; 6)
		End if 
		If ($_l_CountColumns>=8)
			LB_SetEnterable(->QV_LB_Items; True:C214; 7)
			LB_SetEnterable(->QV_LB_Items; True:C214; 8)
		End if 
		
		LB_SetEnterable(->QV_LB_Items; True:C214; 2)
		
		If (Is a list:C621(QV_HL_QualitiesList))
			$_l_CountListItems:=Count list items:C380(QV_HL_QualitiesList)
			
			For ($_l_Index; 1; $_l_CountListItems)
				GET LIST ITEM:C378(QV_HL_QualitiesList; $_l_Index; $_l_ItemReference; $_t_ItemText; $_l_SublistID; $_bo_Expanded)
				If ($_l_SublistID>0)
					SET LIST ITEM:C385(QV_HL_QualitiesList; $_l_ItemReference; $_t_ItemText; $_l_ItemReference; $_l_SublistID; False:C215)
				End if 
			End for 
			//////_o_REDRAW LIST(QV_HL_QualitiesList)
		End if 
		
		INT_SetDialog
		$_l_defaultparams:=Sm_SetUserSearchPrefs(False:C215; Table:C252(->[INFORMATION:55]); <>PER_l_CurrentUserID)
		If ($_l_defaultparams>0)
			SM_LoadSearchParameters($_l_defaultparams)
			
		End if 
End case 
ERR_MethodTrackerReturn("FM:dQualitiesSearch"; $_t_oldMethodName)

