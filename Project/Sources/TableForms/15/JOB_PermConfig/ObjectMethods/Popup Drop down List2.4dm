If (False:C215)
	//object Name: [USER]JOB_PermConfig.Popup Drop down List2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:24
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(QV_lb_QualityNames;0)
	//ARRAY BOOLEAN(QV_abo_QualitiesSelected;0)
	//ARRAY LONGINT(JOB_al_PermJobInfoQuals;0)
	//ARRAY LONGINT(QV_al_QualityGroupsIDs;0)
	//ARRAY LONGINT(QV_al_QualityPropertiesNUM;0;0)
	//ARRAY LONGINT(QV_al_QualitySubGroupsIDs;0)
	//ARRAY TEXT(JOB_at_PermJobInfos;0)
	//ARRAY TEXT(QV_at_QGrpProperties;0;0)
	//ARRAY TEXT(QV_at_QualityGroups;0)
	//ARRAY TEXT(QV_at_QualityGroupsNM;0)
	//ARRAY TEXT(QV_at_QualityProperties;0;0)
	//ARRAY TEXT(QV_at_QualityPropertiesNAM;0;0)
	//ARRAY TEXT(QV_at_QualitySubGroupsNM;0)
	C_BOOLEAN:C305($_bo_Continue)
	C_LONGINT:C283($_l_AccessLevel; $_l_event; $_l_FieldNumber; $_l_GroupRow; $_l_InformationTable; $_l_ListID; $_l_ListID2; $_l_ListItemID; $_l_PropertyColumn; $_l_Retries; $_l_SubListNUM)
	C_LONGINT:C283(bAddQual; bdelQual; JOB_l_QualityID; JOB_l_QualitySubList)
	C_TEXT:C284($_t_GroupName; $_t_oldMethodName; Job_t_DataName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].JOB_PermConfig.Popup Drop down List2"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (QV_at_QualityGroupsNM>0)
			If (QV_al_QualityGroupsIDs{QV_at_QualityGroupsNM}>0)
				Gen_Confirm("This information groups will be set as the groups to store tagged information in "+"for "+Job_t_DataName+". Are you sure you wish to do this"; "No"; "Yes")
				If (OK=0)
					$_bo_Continue:=True:C214
					$_l_ListItemID:=QV_al_QualityGroupsIDs{QV_at_QualityGroupsNM}
				Else 
					$_bo_Continue:=False:C215
				End if 
			Else 
				//Add a new group
				$_t_GroupName:=Gen_Request("Name the new information group")
				If ($_t_GroupName#"")
					$_l_GroupRow:=Find in array:C230(QV_at_QualityGroupsNM; $_t_GroupName)
					If ($_l_GroupRow>0)
						Gen_Alert("There is already a group called that")
						$_bo_Continue:=False:C215
					Else 
						$_bo_Continue:=True:C214
						//Add the group
						$_l_InformationTable:=Table:C252(->[INFORMATION:55])
						$_l_FieldNumber:=Field:C253(->[INFORMATION:55]QualityID:14)
						$_l_ListID:=AA_GetListID($_l_InformationTable; $_l_FieldNumber)
						$_l_Retries:=0
						While (Semaphore:C143("LoadingListofLists"))
							$_l_Retries:=$_l_Retries+1
							DelayTicks(2*$_l_Retries)
						End while 
						$_l_ListItemID:=AA_ListAddItembyID($_l_ListID; $_t_GroupName)
						//And we have to create a list with that name
						CREATE RECORD:C68([X_LISTS:111])
						[X_LISTS:111]x_ID:1:=AA_GetNextID(->[X_LISTS:111]x_ID:1)
						$_l_ListID2:=[X_LISTS:111]x_ID:1
						[X_LISTS:111]x_ListName:2:=$_t_GroupName
						$_l_AccessLevel:=0
						$_l_AccessLevel:=$_l_AccessLevel ?+ 5
						AA_SetListProperty("ACCESS"; $_l_AccessLevel)
						DB_SaveRecord(->[X_LISTS:111])
						READ WRITE:C146([LIST_ITEMS:95])
						QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=$_l_ListItemID)
						//$Attribute1:="Sublist:"+String($_l_ListID2)
						AA_SetListItemProperty("SUBLIST"; $_l_ListID2)
						//TEXT TO BLOB($attribute1+Char(13);[LIST_ITEMS]X_ItemAttributes;3)
						DB_SaveRecord(->[LIST_ITEMS:95])
						UNLOAD RECORD:C212([LIST_ITEMS:95])
						READ ONLY:C145([LIST_ITEMS:95])
						CLEAR SEMAPHORE:C144("LoadingListofLists")
						ARRAY TEXT:C222(QV_at_QualityGroupsNM; 0)
						ARRAY LONGINT:C221(QV_al_QualityGroupsIDs; 0)
						ARRAY TEXT:C222(QV_at_QualityGroups; 0)
						ARRAY TEXT:C222(QV_at_QualityProperties; 0; 0)
						ARRAY LONGINT:C221(QV_al_QualityPropertiesNUM; 0; 0)
						ARRAY TEXT:C222(QV_at_QualityPropertiesNAM; 0; 0)
						
						$_l_ListID:=AA_LoadList(->[INFORMATION:55]QualityID:14; ->QV_at_QualityGroupsNM; ->QV_al_QualityGroupsIDs; False:C215; ->QV_at_QualityGroups; ->QV_at_QualityProperties; ->QV_al_QualityPropertiesNUM; ->QV_at_QualityPropertiesNAM)
						
						SORT ARRAY:C229(QV_at_QualityGroupsNM; QV_al_QualityGroupsIDs; QV_at_QualityGroups; QV_at_QualityProperties; QV_al_QualityPropertiesNUM; QV_at_QualityPropertiesNAM)
						
						OBJECT SET VISIBLE:C603(QV_at_QualityGroupsNM; False:C215)
						OBJECT SET VISIBLE:C603(*; "oQualsPopUpLabel"; False:C215)
						$_l_GroupRow:=Find in array:C230(JOB_at_PermJobInfos; Job_t_DataName)
						JOB_al_PermJobInfoQuals{$_l_GroupRow}:=$_l_ListItemID  //the list item id of the subgroup item in the qualities list
						JOB_LoadInformationGroupLinks(False:C215)  // Thats it SAVED
					End if 
				End if 
			End if 
			If ($_bo_Continue)
				$_l_GroupRow:=Find in array:C230(QV_al_QualityGroupsIDs; $_l_ListItemID)
				If ($_l_GroupRow>0)
					$_l_SubListNUM:=0
					$_l_PropertyColumn:=Find in array:C230(QV_at_QualityProperties{$_l_GroupRow}; "SUBLIST")
					If ($_l_PropertyColumn>0)
						$_l_SubListNUM:=QV_al_QualityPropertiesNUM{$_l_GroupRow}{$_l_PropertyColumn}
					Else 
						QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=QV_al_QualityGroupsIDs{$_l_GroupRow})
						AA_GetListItemProperty("SUBLIST"; ->$_l_SubListNUM)
						
					End if 
					If ($_l_SubListNUM>0)
						//just to be safe
						JOB_l_QualitySubList:=$_l_SubListNUM
						
						//
						ARRAY TEXT:C222(QV_at_QGrpProperties; 0; 0)
						//ARRAY LONGINT(QV_al_agrpPropertiesNUM;0;0)
						//ARRAY STRING(55;QV_at_QGrpPropertiesSTR;0;0)
						
						AA_LoadListbyID($_l_SubListNUM; ->QV_at_QualitySubGroupsNM; ->QV_al_QualitySubGroupsIDs; False:C215)
						SORT ARRAY:C229(QV_at_QualitySubGroupsNM; QV_al_QualitySubGroupsIDs)
						JOB_l_QualityID:=$_l_ListItemID
						OBJECT SET VISIBLE:C603(QV_at_QualityGroupsNM; False:C215)
						OBJECT SET VISIBLE:C603(QV_lb_QualityNames; True:C214)
						OBJECT SET VISIBLE:C603(*; "oInfoLabel"; True:C214)
						OBJECT SET VISIBLE:C603(bdelQual; True:C214)
						OBJECT SET VISIBLE:C603(bAddQual; True:C214)
						
						
					Else 
						//none
						ARRAY BOOLEAN:C223(QV_abo_QualitiesSelected; 0)
					End if 
					//```
				End if 
				
			End if 
			
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ [USER].JOB_PermConfig.Popup Drop down List2"; $_t_oldMethodName)
