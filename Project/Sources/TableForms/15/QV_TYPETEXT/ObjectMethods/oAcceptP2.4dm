If (False:C215)
	//object Name: [USER]QV_TYPETEXT.Button5
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 11:14
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(QV_abo_Exclude;0)
	//ARRAY BOOLEAN(QV_abo_include;0)
	//ARRAY INTEGER(QV_ai_Exclude;0)
	//ARRAY INTEGER(QV_ai_include;0)
	//ARRAY LONGINT(AA_al_SubListItemsPOPIDs;0)
	//ARRAY LONGINT(QV_al_GroupIDs;0)
	//ARRAY LONGINT(QV_al_QualityGroupsIDs;0)
	//ARRAY LONGINT(QV_al_QualityIDs;0)
	//ARRAY LONGINT(QV_al_QualityLevelLevels;0)
	//ARRAY LONGINT(QV_al_QualityPropertiesNUM;0;0)
	//ARRAY LONGINT(QV_al_QualityQualityYears;0)
	//ARRAY LONGINT(QV_al_QualitySubGroupsIDs;0)
	//ARRAY LONGINT(QV_al_QualityYear;0)
	//ARRAY LONGINT(QV_al_QualityYears;0)
	//ARRAY LONGINT(QV_al_TableRestrictionIDs;0)
	//ARRAY REAL(QV_ar_QualityLevel;0)
	//ARRAY REAL(QV_ar_QualityLevels;0)
	//ARRAY TEXT(AA_at_SubSublistPOPNMs;0)
	//ARRAY TEXT(QV_at_GroupNames;0)
	//ARRAY TEXT(QV_at_GroupsPopUPNM;0)
	//ARRAY TEXT(QV_at_QualityGroups;0)
	//ARRAY TEXT(QV_at_QualityGroupsNM;0)
	//ARRAY TEXT(QV_at_QualityNames;0)
	//ARRAY TEXT(QV_at_QualityProperties;0;0)
	//ARRAY TEXT(QV_at_QualityPropertiesNAM;0;0)
	//ARRAY TEXT(QV_at_QualitySubGroups;0)
	//ARRAY TEXT(QV_at_QualitySubGroupsNM;0)
	//ARRAY TEXT(QV_at_TableRestrictionNMs;0)
	C_BOOLEAN:C305(QV_bo_AddAllowed)
	C_LONGINT:C283($_l_GroupsIndex; $_l_ListID; $_l_QualitiesIndex; $_l_Restriction; $_l_RestrictionListID; $_l_RestrictionsColumn; $_l_RestrictionsRow; $_l_SublistColumn; $_l_SublistID; $_l_SubListIndex; $_l_SubListNumber)
	C_LONGINT:C283($_l_TableItemID; $_l_TableRow; Badd; BDelete; Bedit; QV_HL_QualitiesList; QV_HL_QUALITIESLIST2; QV_l_CurrentMode; QV_l_DisplayedOwnerTableID; QV_l_QualityYear; QV_l_SelectedQualityID)
	C_REAL:C285(QV_R_QualityLevel)
	C_TEXT:C284($_t_oldMethodName; $_t_SublistSTR; QV_T_MultiADD; QV_t_QualitiesGroupName; QV_t_QualityDescription; QV_t_QualityName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].QV_TYPETEXT.Button5"; Form event code:C388)
If (QV_bo_AddAllowed)
	If (Is a list:C621(QV_HL_QualitiesList))
		Case of 
			: (QV_l_CurrentMode=2)
				//UNSAVED ITEM IS LOADED
				If (QV_T_MultiADD#"")
					$_l_RestrictionListID:=AA_GetListbyName("Table Restriction"; True:C214)
					ARRAY LONGINT:C221(QV_al_TableRestrictionIDs; 0)
					ARRAY TEXT:C222(QV_at_TableRestrictionNMs; 0)
					AA_LoadListbyID($_l_RestrictionListID; ->QV_at_TableRestrictionNMs; ->QV_al_TableRestrictionIDs)
					$_l_TableItemID:=0
					
					If (QV_l_DisplayedOwnerTableID>0)  //note :difference in this line compared to query window
						If (Is table number valid:C999(QV_l_DisplayedOwnerTableID))
							$_l_TableRow:=Find in array:C230(QV_at_TableRestrictionNMs; Table name:C256(Table:C252(QV_l_DisplayedOwnerTableID)))
							If ($_l_TableRow<0)
								$_l_TableItemID:=AA_ListAddItembyID($_l_RestrictionListID; Table name:C256(Table:C252(QV_l_DisplayedOwnerTableID)))
								AA_LoadListbyID($_l_RestrictionListID; ->QV_at_TableRestrictionNMs; ->QV_al_TableRestrictionIDs)
							Else 
								$_l_TableItemID:=QV_al_TableRestrictionIDs{$_l_TableRow}
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
					QV_HL_QualitiesList2:=New list:C375
					For ($_l_GroupsIndex; 1; Size of array:C274(QV_at_QualityGroupsNM))
						
						ARRAY TEXT:C222(QV_at_QualitySubGroupsNM; 0)
						ARRAY LONGINT:C221(QV_al_QualitySubGroupsIDs; 0)
						ARRAY TEXT:C222(QV_at_QualitySubGroups; 0)
						
						$_l_RestrictionsColumn:=Find in array:C230(QV_at_QualityProperties{$_l_GroupsIndex}; "Table Restriction")
						If ($_l_RestrictionsRow>0)
							$_l_Restriction:=QV_al_QualityPropertiesNUM{$_l_GroupsIndex}{$_l_RestrictionsRow}
						Else 
							$_l_Restriction:=0
						End if 
						$_l_Restriction:=AA_GetPRopertyNUM($_l_RestrictionListID; QV_at_QualityGroups{$_l_GroupsIndex})
						If ($_l_Restriction=0) | ($_l_Restriction=$_l_TableItemID)
							//load sublist
							$_l_SublistColumn:=Find in array:C230(QV_at_QualityProperties{$_l_GroupsIndex}; "SUBLIST")
							$_t_SublistSTR:=AA_GetProperty("SUBLIST"; QV_at_QualityGroups{$_l_GroupsIndex})
							If ($_l_SublistColumn>0)  //#"")
								$_l_SubListNumber:=QV_al_QualityPropertiesNUM{$_l_GroupsIndex}{$_l_SublistColumn}
								If ($_l_SubListNumber>0)
									//just to be safe
									AA_LoadListbyID($_l_SubListNumber; ->QV_at_QualitySubGroupsNM; ->QV_al_QualitySubGroupsIDs; False:C215; ->QV_at_QualitySubGroups)
									If (Size of array:C274(QV_at_QualitySubGroupsNM)>0)
										//only now do we do any appends
										$_l_SublistID:=New list:C375
										For ($_l_SubListIndex; 1; Size of array:C274(QV_at_QualitySubGroupsNM))
											
											APPEND TO LIST:C376($_l_SublistID; QV_at_QualitySubGroupsNM{$_l_SubListIndex}; QV_al_QualitySubGroupsIDs{$_l_SubListIndex})
										End for 
										APPEND TO LIST:C376(QV_HL_QualitiesList2; QV_at_QualityGroupsNM{$_l_GroupsIndex}; QV_al_QualityGroupsIDs{$_l_GroupsIndex}; $_l_SublistID; True:C214)
									End if 
								End if 
							Else 
								//no point in a group without items in here
							End if 
						End if 
					End for 
					ARRAY TEXT:C222(QV_at_GroupNames; 0)
					ARRAY TEXT:C222(QV_at_QualityNames; 0)
					ARRAY LONGINT:C221(QV_al_GroupIDs; 0)
					ARRAY LONGINT:C221(QV_al_QualityIDs; 0)
					ARRAY LONGINT:C221(QV_al_QualityLevelLevels; 0)
					ARRAY LONGINT:C221(QV_al_QualityQualityYears; 0)
					ARRAY INTEGER:C220(QV_ai_include; 0)
					ARRAY INTEGER:C220(QV_ai_Exclude; 0)
					ARRAY BOOLEAN:C223(QV_abo_include; 0)
					ARRAY BOOLEAN:C223(QV_abo_Exclude; 0)
					QV_ParseText(QV_T_MultiADD; False:C215; QV_HL_QualitiesList2)
					QV_T_MultiADD:=""
					For ($_l_QualitiesIndex; 1; Size of array:C274(QV_al_QualityIDs))
						If (QV_al_QualityIDs{$_l_QualitiesIndex}>0)
							QV_l_SelectedQualityID:=-2
							//QV_t_QualitiesGroupName:=QV_at_GroupNames{$_l_QualitiesIndex}
							QV_t_QualityName:=QV_at_QualityNames{$_l_QualitiesIndex}
							QV_t_QualityDescription:=""
							QV_R_QualityLevel:=0
							QV_l_QualityYear:=0
							QV_SaveCurrentQuality(False:C215; -1)
						Else 
							QV_t_QualitiesGroupName:=QV_at_GroupNames{$_l_QualitiesIndex}
						End if 
					End for 
					
					
				End if 
				
				QV_l_SelectedQualityID:=0
				QV_t_QualitiesGroupName:=""
				QV_t_QualityName:=""
				QV_t_QualityDescription:=""
				QV_R_QualityLevel:=0
				QV_l_QualityYear:=0
				OBJECT SET ENTERABLE:C238(QV_t_QualitiesGroupName; False:C215)
				OBJECT SET ENTERABLE:C238(QV_t_QualityName; False:C215)
				OBJECT SET ENTERABLE:C238(QV_t_QualityDescription; False:C215)
				ARRAY TEXT:C222(AA_at_SubSublistPOPNMs; 0)
				ARRAY LONGINT:C221(AA_al_SubListItemsPOPIDs; 0)
				OBJECT SET VISIBLE:C603(AA_at_SubSublistPOPNMs; False:C215)
				// SET ENTERABLE(QV_R_QualityLevel;False)
				OBJECT SET VISIBLE:C603(QV_ar_QualityLevels; False:C215)
				OBJECT SET VISIBLE:C603(*; "Picture25"; False:C215)
				OBJECT SET VISIBLE:C603(*; "Picture26"; False:C215)
				OBJECT SET VISIBLE:C603(*; "Picture27"; False:C215)
				OBJECT SET VISIBLE:C603(QV_at_GroupsPopUPNM; False:C215)
				OBJECT SET VISIBLE:C603(*; "Picture28"; False:C215)
				OBJECT SET VISIBLE:C603(QV_al_QualityYears; False:C215)  //NG Checked April 2020
				QV_al_QualityYear:=0  //NG Checked April 2020
				QV_ar_QualityLevel:=0
				GOTO OBJECT:C206(QV_HL_QualitiesList)
				OBJECT SET TITLE:C194(Badd; "Add")
				OBJECT SET TITLE:C194(BDelete; "Delete")
				OBJECT SET ENABLED:C1123(Bedit; False:C215)
				OBJECT SET ENABLED:C1123(BDelete; False:C215)
				QV_l_CurrentMode:=1
				FORM GOTO PAGE:C247(1)
				
		End case 
		
		
		
		
		
	End if 
End if 
CANCEL:C270
ERR_MethodTrackerReturn("OBJ [USER].QV_TYPETEXT.Button5"; $_t_oldMethodName)
