//%attributes = {}
If (False:C215)
	//Project Method Name:      QV_ShowQualities
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/11/2009`Method: QV_ShowQualities
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY DATE(QV_ad_QualityDate;0)
	//ARRAY LONGINT(AA_al_SubListItemsIDs;0)
	//ARRAY LONGINT(AA_al_SubListItemsPOPIDs;0)
	//ARRAY LONGINT(QV_al_GroupsPOPUPID;0)
	//ARRAY LONGINT(QV_al_PosQualityYear;0)
	//ARRAY LONGINT(QV_al_PosQualityYears;0)
	//ARRAY LONGINT(QV_al_QualityDeletions;0)
	//ARRAY LONGINT(QV_al_QualityGroupsIDs;0)
	//ARRAY LONGINT(QV_al_QualityGroupsUsed;0)
	//ARRAY LONGINT(QV_al_QualityID;0)
	//ARRAY LONGINT(QV_al_QualityParentID;0)
	//ARRAY LONGINT(QV_al_QualityPropertiesNUM;0;0)
	//ARRAY LONGINT(QV_al_QualityRecordID;0)
	//ARRAY LONGINT(QV_al_QualityYear;0)
	//ARRAY LONGINT(QV_al_RelatedRecordNum;0)
	//ARRAY LONGINT(QV_al_TableRestrictionIDs;0)
	//ARRAY REAL(QV_ar_QualityLevel;0)
	//ARRAY REAL(QV_ar_QualityLevels;0)
	//ARRAY TEXT(AA_at_SubSublistItemNMs;0)
	//ARRAY TEXT(AA_at_SubSublistPOPNMs;0)
	//ARRAY TEXT(QV_at_GroupsPopUPNM;0)
	//ARRAY TEXT(QV_at_QualityCode;0)
	//ARRAY TEXT(QV_at_QualityDetail;0)
	//ARRAY TEXT(QV_at_QualityGroups;0)
	//ARRAY TEXT(QV_at_QualityGroupsNM;0)
	//ARRAY TEXT(QV_at_QualityGroupsUSED;0)
	//ARRAY TEXT(QV_at_QualityProperties;0;0)
	//ARRAY TEXT(QV_at_QualityPropertiesNAM;0;0)
	//ARRAY TEXT(QV_at_TableRestrictionNMs;0)
	C_BOOLEAN:C305($_bo_Continue; $_bo_LoadHList; $6)
	C_LONGINT:C283($_l_Element; $_l_Filter; $_l_GroupIdPosition; $_l_GroupPosition; $_l_Index; $_l_Index2; $_l_listID; $_l_listitemID; $_l_PropertyEnd; $_l_PropertyID; $_l_RestrictedTableID)
	C_LONGINT:C283($_l_RestrictedtablePosition; $_l_RestrictionID; $_l_RestrictionListID; $_l_RetristionPropertyPosition; $_l_SublistIDPosition; $_l_SublistitemPosition; $_l_SubListNum; $_l_SublistPosition; $_l_SublistPropertyPosition; $_l_TablePosition; $_l_UsedGroupPosition)
	C_LONGINT:C283($0; $1; $2; $3; $4; Badd; BDelete; Bedit; QV_HL_QualitiesList; QV_HL_SUBLIST; QV_l_CurrentMode)
	C_LONGINT:C283(QV_l_LastParam2; QV_l_QualityYear; QV_l_SelectedQualityID)
	C_POINTER:C301($5)
	C_REAL:C285(QV_R_QualityLevel)
	C_TEXT:C284($_t_ApplicationVersion; $_t_ListIDString; $_t_oldMethodName; $_t_Properties; $_t_QualityGroupName; $_t_SublistItemName; QV_t_QualitiesGroupName; QV_t_QualityDescription; QV_t_QualityName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("QV_ShowQualities")
If (Count parameters:C259>=6)
	$_bo_LoadHList:=$6
Else 
	$_bo_LoadHList:=True:C214
End if 
If (Count parameters:C259>=4)
	$_l_Filter:=$4
Else 
	$_l_Filter:=0
End if 
ARRAY TEXT:C222(QV_at_QualityGroupsUSED; 0)
ARRAY LONGINT:C221(QV_al_QualityGroupsUsed; 0)
If (Count parameters:C259>=2)
	// the record ID LONGINT
	// the TABLE number
	//and  the field number
	If ($1>0)
		MESSAGES OFF:C175
		
		If (True:C214)
			//Rollo 5/11/2004
			QUERY:C277([INFORMATION:55]; [INFORMATION:55]RelateTableRecordNumber:13=$1; *)
			QUERY:C277([INFORMATION:55];  & ; [INFORMATION:55]RelatedTableNumber:11=$2; *)
			QUERY:C277([INFORMATION:55];  & ; [INFORMATION:55]RelatedTableFieldNum:12=$3; *)
			
			If (Count parameters:C259>=5)
				
				//NG April 2007. This allows us to only find qualites of particular groups
				If (Type:C295($5->)=Is longint:K8:6)
					If ($5->#0)
						QUERY:C277([INFORMATION:55];  & ; [INFORMATION:55]Deleted:10=0; *)
						//one type
						QUERY:C277([INFORMATION:55];  & ; [INFORMATION:55]QualityGroupID:15=$5->)
					Else 
						QUERY:C277([INFORMATION:55];  & ; [INFORMATION:55]Deleted:10=0)
					End if 
				Else 
					//Array of values
					QUERY:C277([INFORMATION:55];  & ; [INFORMATION:55]Deleted:10=0)
					CREATE SET:C116([INFORMATION:55]; "$T1")
					QUERY WITH ARRAY:C644([INFORMATION:55]QualityGroupID:15; $5->)
					CREATE SET:C116([INFORMATION:55]; "$T2")
					INTERSECTION:C121("$T1"; "$T2"; "$T1")
					USE SET:C118("$T1")
					CLEAR SET:C117("$T1")
					CLEAR SET:C117("$T2")
					
				End if 
			Else 
				QUERY:C277([INFORMATION:55];  & ; [INFORMATION:55]Deleted:10=0)
			End if 
		Else 
			QUERY:C277([INFORMATION:55]; [INFORMATION:55]RelateTableRecordNumber:13=$1)
			CREATE SET:C116([INFORMATION:55]; "T1")
			If (QV_l_LastParam2#$2)
				QUERY:C277([INFORMATION:55]; [INFORMATION:55]RelatedTableNumber:11=$2)
				CREATE SET:C116([INFORMATION:55]; "T2")
				QV_l_LastParam2:=$2
				QUERY:C277([INFORMATION:55]; [INFORMATION:55]RelatedTableFieldNum:12=$3)
				CREATE SET:C116([INFORMATION:55]; "T3")
			End if 
			QUERY:C277([INFORMATION:55]; [INFORMATION:55]Deleted:10=0)
			CREATE SET:C116([INFORMATION:55]; "T4")
			INTERSECTION:C121("T1"; "T2"; "T1")
			// CLEAR SET("T2")
			INTERSECTION:C121("T1"; "T3"; "T1")
			//CLEAR SET("T3")
			INTERSECTION:C121("T1"; "T4"; "T1")
			CLEAR SET:C117("T4")
			USE SET:C118("T1")
			CLEAR SET:C117("T1")
		End if 
		
	Else 
		REDUCE SELECTION:C351([INFORMATION:55]; 0)
	End if 
	
	
	If (Records in selection:C76([INFORMATION:55])>0)
		
		//This gives us all the qualities for this record
		//Now sort these by groups
		//ORDER BY([QUALITIES]QualityGroupID)
		ARRAY TEXT:C222(QV_at_QualityDetail; 0)
		ARRAY REAL:C219(QV_ar_QualityLevel; 0)
		ARRAY LONGINT:C221(QV_al_QualityYear; 0)
		ARRAY DATE:C224(QV_ad_QualityDate; 0)
		ARRAY LONGINT:C221(QV_al_RelatedRecordNum; 0)
		ARRAY LONGINT:C221(QV_al_QualityID; 0)
		ARRAY LONGINT:C221(QV_al_QualityParentID; 0)
		ARRAY LONGINT:C221(QV_al_QualityRecordID; 0)
		ARRAY LONGINT:C221(QV_al_QualityDeletions; 0)
		//QV_t_QualitiesOwnerName:=""
		QV_t_QualitiesGroupName:=""
		QV_t_QualityName:=""
		QV_t_QualityDescription:=""
		QV_R_QualityLevel:=0
		QV_l_QualityYear:=0
		
		SELECTION TO ARRAY:C260([INFORMATION:55]Description:3; QV_at_QualityDetail; [INFORMATION:55]Information_Level:4; QV_ar_QualityLevel; [INFORMATION:55]Year:5; QV_al_QualityYear; [INFORMATION:55]Information_Date:8; QV_ad_QualityDate; [INFORMATION:55]Information_Code:9; QV_at_QualityCode; [INFORMATION:55]RelateTableRecordNumber:13; QV_al_RelatedRecordNum; [INFORMATION:55]QualityID:14; QV_al_QualityID; [INFORMATION:55]QualityGroupID:15; QV_al_QualityParentID; [INFORMATION:55]QualityRecordID:16; QV_al_QualityRecordID)
		
		ARRAY LONGINT:C221(QV_al_QualityDeletions; Size of array:C274(QV_at_QualityDetail))  //now organise them into groups
		If ($_bo_LoadHList)
			If (Is a list:C621(QV_HL_QualitiesList))
				CLEAR LIST:C377(QV_HL_QualitiesList; *)
			End if 
		End if 
		//Now We load the Qualities list
		ARRAY TEXT:C222(QV_at_QualityGroupsNM; 0)
		ARRAY LONGINT:C221(QV_al_QualityGroupsIDs; 0)
		ARRAY TEXT:C222(QV_at_QualityGroups; 0)
		ARRAY TEXT:C222(QV_at_QualityProperties; 0; 0)
		ARRAY LONGINT:C221(QV_al_QualityPropertiesNUM; 0; 0)
		ARRAY TEXT:C222(QV_at_QualityPropertiesNAM; 0; 0)
		
		$_l_listID:=AA_LoadList(->[INFORMATION:55]QualityID:14; ->QV_at_QualityGroupsNM; ->QV_al_QualityGroupsIDs; False:C215; ->QV_at_QualityGroups; ->QV_at_QualityProperties; ->QV_al_QualityPropertiesNUM; ->QV_at_QualityPropertiesNAM)
		
		SORT ARRAY:C229(QV_at_QualityGroupsNM; QV_al_QualityGroupsIDs; QV_at_QualityGroups; QV_at_QualityProperties; QV_al_QualityPropertiesNUM; QV_at_QualityPropertiesNAM)
		
		If ($_bo_LoadHList)
			QV_HL_QualitiesList:=New list:C375
		End if 
		$_l_Element:=0
		ARRAY TEXT:C222(QV_at_QualityGroupsUSED; 0)
		ARRAY LONGINT:C221(QV_al_QualityGroupsUsed; 0)
		ARRAY LONGINT:C221(QV_al_QualityGroupsUsed; Size of array:C274(QV_at_QualityDetail))
		ARRAY TEXT:C222(QV_at_QualityGroupsUSED; Size of array:C274(QV_at_QualityDetail))
		For ($_l_Index; 1; Size of array:C274(QV_al_QualityGroupsUsed))
			$_l_UsedGroupPosition:=Find in array:C230(QV_al_QualityGroupsUsed; QV_al_QualityParentID{$_l_Index})
			If ($_l_UsedGroupPosition<0)
				$_l_Element:=$_l_Element+1
				$_l_GroupPosition:=Find in array:C230(QV_al_QualityGroupsIDs; QV_al_QualityParentID{$_l_Index})
				QV_al_QualityGroupsUsed{$_l_Element}:=QV_al_QualityParentID{$_l_Index}
				If ($_l_GroupPosition>0)
					QV_at_QualityGroupsUSED{$_l_Element}:=QV_at_QualityGroupsNM{Find in array:C230(QV_al_QualityGroupsIDs; QV_al_QualityParentID{$_l_Index})}
				Else 
					SHOW PROCESS:C325(Current process:C322)
					BRING TO FRONT:C326(Current process:C322)
					
					//the group ID is wrong!!!!
				End if 
				
				
			End if 
		End for 
		ARRAY LONGINT:C221(QV_al_QualityGroupsUsed; $_l_Element)
		ARRAY TEXT:C222(QV_at_QualityGroupsUSED; $_l_Element)
		//this has built the IDs of the QUALITIES GROUPS
		
		//here we build a Heirarchical list of the all the items
		// so we can use it for searching
		
		//Now we go through each of the quality groups that we have
		// and put an item into the HL
		//we then go trough QV_al_QualityParentID
		//we find the items
		//and append them to the HL as a sublist
		QV_HL_SubList:=0
		For ($_l_Index; 1; Size of array:C274(QV_al_QualityGroupsUsed))
			If (Count parameters:C259>=4)
				//filter
				$_bo_Continue:=False:C215
				If (QV_al_QualityGroupsUsed{$_l_Index}=$_l_Filter)
					$_bo_Continue:=True:C214
				End if 
				
			Else 
				$_bo_Continue:=True:C214
			End if 
			If ($_bo_Continue)
				//need to get the sublist here
				$_l_UsedGroupPosition:=Find in array:C230(QV_al_QualityGroupsIDs; QV_al_QualityGroupsUsed{$_l_Index})
				If ($_l_UsedGroupPosition<0)
					$_l_UsedGroupPosition:=Find in array:C230(QV_at_QualityGroupsNM; QV_at_QualityGroupsUSED{$_l_Index})
					If ($_l_UsedGroupPosition>0)
						QV_al_QualityGroupsUsed{$_l_Index}:=QV_al_QualityGroupsIDs{$_l_UsedGroupPosition}
					End if 
				End if 
				
				If ($_l_UsedGroupPosition>0)
					$_t_QualityGroupName:=QV_at_QualityGroupsNM{$_l_UsedGroupPosition}
					//$_t_Properties:=QV_at_QualityGroups{$ref}
					
					$_l_SublistPropertyPosition:=Find in array:C230(QV_at_QualityProperties{$_l_UsedGroupPosition}; "SUBLIST")
					If ($_l_SublistPropertyPosition>0)
						$_l_SubListNum:=QV_al_QualityPropertiesNUM{$_l_UsedGroupPosition}{$_l_SublistPropertyPosition}
						//it should be
						ARRAY TEXT:C222(AA_at_SubSublistItemNMs; 0)
						ARRAY LONGINT:C221(AA_al_SubListItemsIDs; 0)
						
						If ($_l_SubListNum>0)
							AA_LoadListbyID($_l_SubListNum; ->AA_at_SubSublistItemNMs; ->AA_al_SubListItemsIDs; False:C215)
							SORT ARRAY:C229(AA_at_SubSublistItemNMs; AA_al_SubListItemsIDs)
							For ($_l_Index2; 1; Size of array:C274(QV_al_QualityParentID))
								If (QV_al_QualityParentID{$_l_Index2}=QV_al_QualityGroupsUsed{$_l_Index})
									If (QV_HL_SubList=0)
										QV_HL_SubList:=New list:C375
									End if 
									$_l_SublistitemPosition:=Find in array:C230(AA_al_SubListItemsIDs; QV_al_QualityID{$_l_Index2})
									If ($_l_SublistitemPosition>0)  //it should be!!!
										$_t_ApplicationVersion:=Application version:C493
										
										$_t_SublistItemName:=AA_at_SubSublistItemNMs{$_l_SublistitemPosition}
										If (QV_ar_QualityLevel{$_l_Index2}#0)
											$_t_SublistItemName:=$_t_SublistItemName+"(Level:"+String:C10(QV_ar_QualityLevel{$_l_Index2})+")"
										End if 
										If (QV_at_QualityDetail{$_l_Index2}#"")
											$_t_SublistItemName:=$_t_SublistItemName+" (Desc:"+QV_at_QualityDetail{$_l_Index2}+")"
										End if 
										If (Num:C11($_t_ApplicationVersion)<670)
											If (Length:C16($_t_SublistItemName)>255)
												$_t_SublistItemName:=Substring:C12($_t_SublistItemName; 1; 255)
											End if 
										Else 
											If (Length:C16($_t_SublistItemName)>32)
												$_t_SublistItemName:=Substring:C12($_t_SublistItemName; 1; 32)
											End if 
										End if 
										
										APPEND TO LIST:C376(QV_HL_SubList; $_t_SublistItemName; QV_al_QualityRecordID{$_l_Index2})
										//note that the item ref here is the record
										//  number in the qualites table-NOT the q
									End if 
								End if 
							End for 
							//we have now built the sublist
							If (QV_HL_SubList>0)
								//the sublist is built-add the group in
								$_l_UsedGroupPosition:=Find in array:C230(QV_al_QualityGroupsIDs; QV_al_QualityGroupsUsed{$_l_Index})
								If ($_l_UsedGroupPosition>0)  //it better be!!!
									APPEND TO LIST:C376(QV_HL_QualitiesList; QV_at_QualityGroupsNM{$_l_UsedGroupPosition}; QV_al_QualityGroupsUsed{$_l_Index}; QV_HL_SubList; True:C214)
								End if 
								QV_HL_SubList:=0
							End if 
						End if 
						
					Else 
						//Just in case read the old way
						$_t_Properties:="WhatProperty"
						ARRAY TEXT:C222(AA_at_SubSublistItemNMs; 0)
						ARRAY LONGINT:C221(AA_al_SubListItemsIDs; 0)
						$_l_SublistPosition:=Position:C15("SUBLIST:"; $_t_Properties)
						If ($_l_SublistPosition>0)  //it better be!!!!!!
							$_t_Properties:=Substring:C12($_t_Properties; $_l_SublistPosition+Length:C16("SUBLIST:"); Length:C16($_t_Properties))
							$_l_PropertyEnd:=Position:C15(Char:C90(13); $_t_Properties)
							If ($_l_PropertyEnd>0)
								$_t_Properties:=Substring:C12($_t_Properties; 1; $_l_PropertyEnd-1)
							End if 
							$_l_SubListNum:=Num:C11($_t_Properties)
							If ($_l_SubListNum>0)
								AA_LoadListbyID($_l_SubListNum; ->AA_at_SubSublistItemNMs; ->AA_al_SubListItemsIDs; False:C215)
								SORT ARRAY:C229(AA_at_SubSublistItemNMs; AA_al_SubListItemsIDs)
								For ($_l_Index2; 1; Size of array:C274(QV_al_QualityParentID))
									If (QV_al_QualityParentID{$_l_Index2}=QV_al_QualityGroupsUsed{$_l_Index})
										If (QV_HL_SubList=0)
											QV_HL_SubList:=New list:C375
										End if 
										$_l_SublistIDPosition:=Find in array:C230(AA_al_SubListItemsIDs; QV_al_QualityID{$_l_Index2})
										If ($_l_SublistIDPosition>0)  //it should be!!!
											$_t_ApplicationVersion:=Application version:C493
											
											$_t_SublistItemName:=AA_at_SubSublistItemNMs{$_l_SublistIDPosition}
											If (QV_ar_QualityLevel{$_l_Index2}#0)
												$_t_SublistItemName:=$_t_SublistItemName+"(Level:"+String:C10(QV_ar_QualityLevel{$_l_Index2})+")"
											End if 
											If (QV_at_QualityDetail{$_l_Index2}#"")
												$_t_SublistItemName:=$_t_SublistItemName+" (Desc:"+QV_at_QualityDetail{$_l_Index2}+")"
											End if 
											If (Num:C11($_t_ApplicationVersion)<670)
												If (Length:C16($_t_SublistItemName)>255)
													$_t_SublistItemName:=Substring:C12($_t_SublistItemName; 1; 255)
												End if 
											Else 
												If (Length:C16($_t_SublistItemName)>32)
													$_t_SublistItemName:=Substring:C12($_t_SublistItemName; 1; 32)
												End if 
											End if 
											
											APPEND TO LIST:C376(QV_HL_SubList; $_t_SublistItemName; QV_al_QualityRecordID{$_l_Index2})
											//note that the item ref here is the record
											//  number in the qualites table-NOT the q
										End if 
									End if 
								End for 
								//we have now built the sublist
								If (QV_HL_SubList>0)
									//the sublist is built-add the group in
									$_l_GroupIdPosition:=Find in array:C230(QV_al_QualityGroupsIDs; QV_al_QualityGroupsUsed{$_l_Index})
									If ($_l_GroupIdPosition>0)  //it better be!!!
										APPEND TO LIST:C376(QV_HL_QualitiesList; QV_at_QualityGroupsNM{$_l_GroupIdPosition}; QV_al_QualityGroupsUsed{$_l_Index}; QV_HL_SubList; True:C214)
									End if 
									QV_HL_SubList:=0
								End if 
							End if 
						End if 
					End if 
				End if 
			End if   //`````
			
		End for 
		//we have now built the HL of these qualities
		//last job here is to build an array of the QUALITY GROUPS applicable to this tabl
		//first just check that the "TABLE RESTRICTION" Property exist
		$_l_RestrictionListID:=AA_GetListbyName("Table Restriction"; True:C214)
		ARRAY LONGINT:C221(QV_al_TableRestrictionIDs; 0)
		ARRAY TEXT:C222(QV_at_TableRestrictionNMs; 0)
		AA_LoadListbyID($_l_RestrictionListID; ->QV_at_TableRestrictionNMs; ->QV_al_TableRestrictionIDs)
		$_l_RestrictedtablePosition:=Find in array:C230(QV_at_TableRestrictionNMs; Table name:C256(Table:C252($2)))
		If ($_l_RestrictedtablePosition<0)
			$0:=AA_ListAddItembyID($_l_RestrictionListID; Table name:C256(Table:C252($2)))
			AA_LoadListbyID($_l_RestrictionListID; ->QV_at_TableRestrictionNMs; ->QV_al_TableRestrictionIDs)
		Else 
			$_l_RestrictedTableID:=QV_al_TableRestrictionIDs{$_l_RestrictedtablePosition}
		End if 
		ARRAY TEXT:C222(QV_at_GroupsPopUPNM; 0)
		ARRAY LONGINT:C221(QV_al_GroupsPOPUPID; 0)
		ARRAY TEXT:C222(QV_at_GroupsPopUPNM; Size of array:C274(QV_at_QualityGroupsNM))
		ARRAY LONGINT:C221(QV_al_GroupsPOPUPID; Size of array:C274(QV_at_QualityGroupsNM))
		$_l_Element:=0
		For ($_l_Index; 1; Size of array:C274(QV_at_QualityGroupsNM))
			//ARRAY STRING(55;QV_at_QualityProperties;0;0)
			//ARRAY LONGINT(QV_al_QualityPropertiesNUM;0;0)
			//ARRAY STRING(55;QV_at_QualityPropertiesNAM;0;0)
			$_l_RetristionPropertyPosition:=Find in array:C230(QV_at_QualityProperties{$_l_Index}; "Table Restriction")
			If ($_l_RetristionPropertyPosition>0)
				$_l_RestrictionID:=QV_al_QualityPropertiesNUM{$_l_Index}{$_l_RetristionPropertyPosition}
			Else 
				QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=QV_al_QualityGroupsIDs{$_l_Index})
				AA_GetListItemProperty("TABLE RESTRICTION"; ->$_l_RestrictionID)
				
				
			End if 
			If ($_l_RestrictionID=0) | ($_l_RestrictionID=$_l_RestrictedTableID)
				$_l_Element:=$_l_Element+1
				QV_at_GroupsPopUPNM{$_l_Element}:=QV_at_QualityGroupsNM{$_l_Index}
				QV_al_GroupsPOPUPID{$_l_Element}:=QV_al_QualityGroupsIDs{$_l_Index}
			End if 
		End for 
		//  QV_t_QualitiesGroupName
	Else 
		If (Is a list:C621(QV_HL_QualitiesList))
			CLEAR LIST:C377(QV_HL_QualitiesList; *)
		End if 
		QV_HL_QualitiesList:=New list:C375
		ARRAY TEXT:C222(QV_at_QualityDetail; 0)
		ARRAY REAL:C219(QV_ar_QualityLevel; 0)
		ARRAY LONGINT:C221(QV_al_QualityYear; 0)
		ARRAY DATE:C224(QV_ad_QualityDate; 0)
		ARRAY LONGINT:C221(QV_al_RelatedRecordNum; 0)
		ARRAY LONGINT:C221(QV_al_QualityID; 0)
		ARRAY LONGINT:C221(QV_al_QualityParentID; 0)
		ARRAY LONGINT:C221(QV_al_QualityRecordID; 0)
		ARRAY LONGINT:C221(QV_al_QualityGroupsUsed; 0)
		ARRAY TEXT:C222(QV_at_QualityGroupsNM; 0)
		ARRAY LONGINT:C221(QV_al_QualityGroupsIDs; 0)
		ARRAY TEXT:C222(QV_at_QualityGroups; 0)
		ARRAY TEXT:C222(QV_at_QualityCode; 0)
		ARRAY LONGINT:C221(QV_al_QualityDeletions; Size of array:C274(QV_at_QualityDetail))  //now organise them into groups
		ARRAY TEXT:C222(QV_at_QualityProperties; 0; 0)
		ARRAY LONGINT:C221(QV_al_QualityPropertiesNUM; 0; 0)
		ARRAY TEXT:C222(QV_at_QualityPropertiesNAM; 0; 0)
		$_l_listID:=AA_LoadList(->[INFORMATION:55]QualityID:14; ->QV_at_QualityGroupsNM; ->QV_al_QualityGroupsIDs; False:C215; ->QV_at_QualityGroups; ->QV_at_QualityProperties; ->QV_al_QualityPropertiesNUM; ->QV_at_QualityPropertiesNAM)
		SORT ARRAY:C229(QV_at_QualityGroupsNM; QV_al_QualityGroupsIDs; QV_at_QualityGroups; QV_at_QualityProperties; QV_al_QualityPropertiesNUM; QV_at_QualityPropertiesNAM)
		
		$_l_listID:=AA_GetListbyName("Table Restriction"; True:C214)
		ARRAY LONGINT:C221(QV_al_TableRestrictionIDs; 0)
		ARRAY TEXT:C222(QV_at_TableRestrictionNMs; 0)
		AA_LoadListbyID($_l_listID; ->QV_at_TableRestrictionNMs; ->QV_al_TableRestrictionIDs)
		$_l_TablePosition:=Find in array:C230(QV_at_TableRestrictionNMs; Table name:C256(Table:C252($2)))
		If ($_l_TablePosition<0)
			$_l_listitemID:=AA_ListAddItembyID($_l_listID; Table name:C256(Table:C252($2)))
		Else 
			$_l_listitemID:=QV_al_TableRestrictionIDs{$_l_TablePosition}
		End if 
		ARRAY TEXT:C222(QV_at_GroupsPopUPNM; 0)
		ARRAY LONGINT:C221(QV_al_GroupsPOPUPID; 0)
		ARRAY TEXT:C222(QV_at_GroupsPopUPNM; Size of array:C274(QV_at_QualityGroupsNM))
		ARRAY LONGINT:C221(QV_al_GroupsPOPUPID; Size of array:C274(QV_at_QualityGroupsNM))
		$_l_Element:=0
		For ($_l_Index; 1; Size of array:C274(QV_at_QualityGroupsNM))
			$_l_SublistPropertyPosition:=Find in array:C230(QV_at_QualityProperties{$_l_Index}; "Table Restriction")
			//$_t_Properties:=QV_at_QualityGroups{$_l_Index}
			$_t_ListIDString:=String:C10($_l_listID)
			If ($_l_SublistPropertyPosition>0)  //#"")
				$_l_PropertyID:=QV_al_QualityPropertiesNUM{$_l_Index}{$_l_SublistPropertyPosition}
				//$_l_SublistPosition:=Position($_t_ListIDString+",";$_t_Properties)
				If ($_l_PropertyID>0)
					
					If ($_l_listitemID=$_l_PropertyID)
						//use for this table
						$_l_Element:=$_l_Element+1
						QV_at_GroupsPopUPNM{$_l_Element}:=QV_at_QualityGroupsNM{$_l_Index}
						QV_al_GroupsPOPUPID{$_l_Element}:=QV_al_QualityGroupsIDs{$_l_Index}
					End if 
				Else 
					//no property of this type so no restriction
					$_l_Element:=$_l_Element+1
					QV_at_GroupsPopUPNM{$_l_Element}:=QV_at_QualityGroupsNM{$_l_Index}
					QV_al_GroupsPOPUPID{$_l_Element}:=QV_al_QualityGroupsIDs{$_l_Index}
				End if 
			Else 
				//no properties therefore no restricion
				$_l_Element:=$_l_Element+1
				QV_at_GroupsPopUPNM{$_l_Element}:=QV_at_QualityGroupsNM{$_l_Index}
				QV_al_GroupsPOPUPID{$_l_Element}:=QV_al_QualityGroupsIDs{$_l_Index}
			End if 
		End for 
		ARRAY TEXT:C222(QV_at_GroupsPopUPNM; $_l_Element)
		ARRAY LONGINT:C221(QV_al_GroupsPOPUPID; $_l_Element)
		
		QV_t_QualitiesGroupName:=""
		QV_t_QualityName:=""
		QV_t_QualityDescription:=""
		QV_R_QualityLevel:=0
		QV_l_QualityYear:=0
		//_o_DISABLE BUTTON(Bedit)
		//_o_DISABLE BUTTON(BDelete)
		OBJECT SET ENABLED:C1123(Bedit; False:C215)
		OBJECT SET ENABLED:C1123(Bdelete; False:C215)
		
		
	End if 
End if 
QV_l_CurrentMode:=1

QV_t_QualitiesGroupName:=""
OBJECT SET ENTERABLE:C238(QV_t_QualitiesGroupName; False:C215)
QV_t_QualityName:=""
OBJECT SET ENTERABLE:C238(QV_t_QualityName; False:C215)
QV_t_QualityDescription:=""
OBJECT SET ENTERABLE:C238(QV_t_QualityDescription; False:C215)
QV_R_QualityLevel:=0
OBJECT SET ENTERABLE:C238(QV_R_QualityLevel; False:C215)
QV_l_QualityYear:=0
OBJECT SET ENTERABLE:C238(QV_l_QualityYear; False:C215)
ARRAY REAL:C219(QV_ar_QualityLevels; 6)
For ($_l_Index; 1; 6)
	QV_ar_QualityLevels{$_l_Index}:=$_l_Index-1
End for 
OBJECT SET VISIBLE:C603(QV_ar_QualityLevels; False:C215)
ARRAY LONGINT:C221(QV_al_PosQualityYears; 10)  //NG CHecked April 2020
For ($_l_Index; 1; 10)
	QV_al_PosQualityYears{$_l_Index}:=(Year of:C25(Current date:C33))-($_l_Index-1)  //NG CHecked April 2020
End for 

SORT ARRAY:C229(QV_at_QualityGroupsUSED; QV_al_QualityGroupsUsed)
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

OBJECT SET VISIBLE:C603(QV_ar_QualityLevels; False:C215)
OBJECT SET VISIBLE:C603(*; "Picture25"; False:C215)
OBJECT SET VISIBLE:C603(*; "Picture26"; False:C215)
OBJECT SET VISIBLE:C603(*; "Picture27"; False:C215)
OBJECT SET VISIBLE:C603(QV_at_GroupsPopUPNM; False:C215)
OBJECT SET VISIBLE:C603(*; "Picture28"; False:C215)
OBJECT SET VISIBLE:C603(QV_al_PosQualityYears; False:C215)  //NG CHecked April 2020
QV_al_PosQualityYear:=0  ////NG CHecked April 2020
QV_ar_QualityLevel:=0
GOTO OBJECT:C206(QV_HL_QualitiesList)
OBJECT SET TITLE:C194(Badd; "Add")
OBJECT SET TITLE:C194(BDelete; "Delete")
OBJECT SET ENABLED:C1123(Bedit; False:C215)
OBJECT SET ENABLED:C1123(Bdelete; False:C215)
//_o_DISABLE BUTTON(Bedit)
//_o_DISABLE BUTTON(Bdelete)
QV_l_CurrentMode:=1
ERR_MethodTrackerReturn("QV_ShowQualities"; $_t_oldMethodName)
