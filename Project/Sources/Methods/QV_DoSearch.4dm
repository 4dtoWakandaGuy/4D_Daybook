//%attributes = {}
If (False:C215)
	//Project Method Name:      QV_DoSearch
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
	//ARRAY BOOLEAN(QV_abo_Exclude;0)
	//ARRAY BOOLEAN(QV_abo_include;0)
	ARRAY LONGINT:C221($_al_LevelsToSearch; 0)
	ARRAY LONGINT:C221($_al_LevelToSearchNum; 0)
	ARRAY LONGINT:C221($_al_YearsToSearch; 0)
	//ARRAY LONGINT(QV_al_GroupIDs;0)
	//ARRAY LONGINT(QV_al_Levels;0)
	//ARRAY LONGINT(QV_al_ListQualityYears;0)
	//ARRAY LONGINT(QV_al_QualityIDs;0)
	//ARRAY LONGINT(QV_al_QualityLevelLevels;0)
	//ARRAY LONGINT(QV_al_QualityLevels;0)
	//ARRAY LONGINT(QV_al_QualityQualityYears;0)
	//ARRAY LONGINT(QV_al_QualitySubLevels;0)
	//ARRAY LONGINT(QV_al_QualitySubYears;0)
	//ARRAY LONGINT(QV_al_QualityYears;0)
	//ARRAY TEXT(QV_at_LevelOptions;0)
	//ARRAY TEXT(QV_at_ListQualityYears;0)
	//ARRAY TEXT(QV_at_QualityLevels;0)
	//ARRAY TEXT(QV_at_QualitySubLevels;0)
	//ARRAY TEXT(QV_at_QualitySubYears;0)
	//ARRAY TEXT(QV_at_QueryType;0)
	//ARRAY TEXT(QV_at_YearOptions;0)
	C_BOOLEAN:C305($_bo_LevelExclude; $_bo_Rebuild; $_bo_YearExclude; $0; QV_bo_ReturnQuals)
	C_LONGINT:C283($_l_CurrentElement; $_l_ExpectedResults; $_l_ExpectedResultsGroup; $_l_Index; $_l_ItemID; $_l_LevelRow; $_l_LevelsIndex; $_l_ListID; $_l_QualityLevelRow; $_l_QueryLine; $_l_Table)
	C_LONGINT:C283($_l_x; $_l_YearRow; $_l_YearsIndex; $1; QV_l_SublevelslistID; QV_l_SubYearslistID)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("QV_DoSearch")
//this method only works with the qualities search
//as it used arrays to determine what to search for


//if     QV_bo_ReturnQuals is true then we actually want the quality records
CREATE EMPTY SET:C140([INFORMATION:55]; "QVrecords")
CREATE EMPTY SET:C140([INFORMATION:55]; "QVrecordsExclude")
CREATE EMPTY SET:C140(Table:C252($1)->; "QVTEMP")
CREATE EMPTY SET:C140(Table:C252($1)->; "QVTEMPEXCLUDE")
$0:=False:C215
$_l_QueryLine:=0
If (Gen_Option)
	$_bo_Rebuild:=True:C214
Else 
	$_bo_Rebuild:=False:C215
End if 

For ($_l_Index; 1; Size of array:C274(QV_abo_include))
	//If (QV_ai_include{$_l_Index}=1)
	If (QV_abo_include{$_l_Index}=True:C214)
		$_l_QueryLine:=$_l_QueryLine+1
		//get the set
		$0:=True:C214
		$_l_Table:=$1
		If (QV_al_GroupIDs{$_l_Index}>0)
			If (QV_bo_ReturnQuals)
				QUERY:C277([INFORMATION:55]; [INFORMATION:55]QualityGroupID:15=QV_al_GroupIDs{$_l_Index})
				CREATE SET:C116([INFORMATION:55]; "QVrecords2")
				$_l_ExpectedResultsGroup:=Records in selection:C76([INFORMATION:55])
			Else 
				QUERY:C277([INFORMATION:55]; [INFORMATION:55]QualityGroupID:15=QV_al_GroupIDs{$_l_Index}; *)
				QUERY:C277([INFORMATION:55];  & ; [INFORMATION:55]RelatedTableNumber:11=$_l_Table; *)
				QUERY:C277([INFORMATION:55];  & ; [INFORMATION:55]Deleted:10=0)
				$_l_ExpectedResultsGroup:=Records in selection:C76([INFORMATION:55])
				UNLOAD RECORD:C212([INFORMATION:55])
			End if 
			If ($_bo_Rebuild)
				//force rebuild  list
				READ WRITE:C146([USER_SETS:105])
				QUERY:C277([USER_SETS:105]; [USER_SETS:105]SET_ID:3=QV_al_GroupIDs{$_l_Index}; *)
				QUERY:C277([USER_SETS:105];  & ; [USER_SETS:105]Set_Table:5=$_l_Table)
				If (Records in selection:C76([USER_SETS:105])>0)
					DELETE SELECTION:C66([USER_SETS:105])
				End if 
			End if 
			
			READ ONLY:C145([USER_SETS:105])
			QUERY:C277([USER_SETS:105]; [USER_SETS:105]SET_ID:3=QV_al_GroupIDs{$_l_Index}; *)
			QUERY:C277([USER_SETS:105];  & ; [USER_SETS:105]Set_Table:5=$_l_Table)
			If (Records in selection:C76([USER_SETS:105])>1)
				READ WRITE:C146([USER_SETS:105])
				QUERY:C277([USER_SETS:105]; [USER_SETS:105]SET_ID:3=QV_al_GroupIDs{$_l_Index}; *)
				QUERY:C277([USER_SETS:105];  & ; [USER_SETS:105]Set_Table:5=$_l_Table)
				DELETE SELECTION:C66([USER_SETS:105])
				READ ONLY:C145([USER_SETS:105])
			End if 
			If (Records in selection:C76([USER_SETS:105])=0)
				QV_UpdateSet($_l_Table; -QV_al_GroupIDs{$_l_Index}; 0)
				QUERY:C277([USER_SETS:105]; [USER_SETS:105]SET_ID:3=QV_al_GroupIDs{$_l_Index}; *)
				QUERY:C277([USER_SETS:105];  & ; [USER_SETS:105]Set_Table:5=$_l_Table)
			End if 
			QV_loadset($1; "QVTEMPADD")
			If (Records in set:C195("QVTEMPADD")#$_l_ExpectedResultsGroup)
				READ WRITE:C146([USER_SETS:105])
				QUERY:C277([USER_SETS:105]; [USER_SETS:105]SET_ID:3=QV_al_GroupIDs{$_l_Index}; *)
				QUERY:C277([USER_SETS:105];  & ; [USER_SETS:105]Set_Table:5=$_l_Table)
				DELETE SELECTION:C66([USER_SETS:105])
				READ ONLY:C145([USER_SETS:105])
				QV_UpdateSet($_l_Table; -QV_al_GroupIDs{$_l_Index}; 0)
				QUERY:C277([USER_SETS:105]; [USER_SETS:105]SET_ID:3=QV_al_GroupIDs{$_l_Index}; *)
				QUERY:C277([USER_SETS:105];  & ; [USER_SETS:105]Set_Table:5=$_l_Table)
				QV_loadset($1; "QVTEMPADD")
			End if 
		End if 
		If (QV_al_QualityIDs{$_l_Index}>0)
			If (QV_bo_ReturnQuals)
				QUERY:C277([INFORMATION:55]; [INFORMATION:55]QualityID:14=QV_al_QualityIDs{$_l_Index})
				$_l_ExpectedResults:=Records in selection:C76([INFORMATION:55])
				CREATE SET:C116([INFORMATION:55]; "QVrecords2")
			Else 
				QUERY:C277([INFORMATION:55]; [INFORMATION:55]QualityID:14=QV_al_QualityIDs{$_l_Index}; *)
				QUERY:C277([INFORMATION:55];  & ; [INFORMATION:55]RelatedTableNumber:11=$_l_Table; *)
				QUERY:C277([INFORMATION:55];  & ; [INFORMATION:55]Deleted:10=0)
				$_l_ExpectedResults:=Records in selection:C76([INFORMATION:55])
				UNLOAD RECORD:C212([INFORMATION:55])
			End if 
			If ($_bo_Rebuild)
				//force rebuild  list
				READ WRITE:C146([USER_SETS:105])
				QUERY:C277([USER_SETS:105]; [USER_SETS:105]SET_ID:3=QV_al_QualityIDs{$_l_Index}; *)
				QUERY:C277([USER_SETS:105];  & ; [USER_SETS:105]Set_Table:5=$_l_Table)
				If (Records in selection:C76([USER_SETS:105])>0)
					DELETE SELECTION:C66([USER_SETS:105])
				End if 
			End if 
			
			READ ONLY:C145([USER_SETS:105])
			QUERY:C277([USER_SETS:105]; [USER_SETS:105]SET_ID:3=QV_al_QualityIDs{$_l_Index}; *)
			QUERY:C277([USER_SETS:105];  & ; [USER_SETS:105]Set_Table:5=$_l_Table)
			If (Records in selection:C76([USER_SETS:105])>1)
				READ WRITE:C146([USER_SETS:105])
				QUERY:C277([USER_SETS:105]; [USER_SETS:105]SET_ID:3=QV_al_QualityIDs{$_l_Index}; *)
				QUERY:C277([USER_SETS:105];  & ; [USER_SETS:105]Set_Table:5=$_l_Table)
				DELETE SELECTION:C66([USER_SETS:105])
				READ ONLY:C145([USER_SETS:105])
			End if 
			If (Records in selection:C76([USER_SETS:105])=0)
				QV_UpdateSet($_l_Table; QV_al_QualityIDs{$_l_Index}; 0)
				QUERY:C277([USER_SETS:105]; [USER_SETS:105]SET_ID:3=QV_al_QualityIDs{$_l_Index}; *)
				QUERY:C277([USER_SETS:105];  & ; [USER_SETS:105]Set_Table:5=$_l_Table)
			End if 
			QV_loadset($1; "QVTEMPADD")
			
			
			If (Records in set:C195("QVTEMPADD")#$_l_ExpectedResults)
				READ WRITE:C146([USER_SETS:105])
				QUERY:C277([USER_SETS:105]; [USER_SETS:105]SET_ID:3=QV_al_QualityIDs{$_l_Index}; *)
				QUERY:C277([USER_SETS:105];  & ; [USER_SETS:105]Set_Table:5=$_l_Table)
				DELETE SELECTION:C66([USER_SETS:105])
				READ ONLY:C145([USER_SETS:105])
				QV_UpdateSet($_l_Table; QV_al_QualityIDs{$_l_Index}; 0)
				QUERY:C277([USER_SETS:105]; [USER_SETS:105]SET_ID:3=QV_al_QualityIDs{$_l_Index}; *)
				QUERY:C277([USER_SETS:105];  & ; [USER_SETS:105]Set_Table:5=$_l_Table)
				QV_loadset($1; "QVTEMPADD")
			End if 
		End if 
		
		If (QV_al_QualityIDs{$_l_Index}>0)
			
			//here if the user has entered a level check the level is at least the entered val
			
			$_bo_LevelExclude:=False:C215
			If (QV_al_QualityLevelLevels{$_l_Index}>0) & (QV_al_QualityIDs{$_l_Index}>0)
				ARRAY TEXT:C222(QV_at_QualityLevels; 0)
				ARRAY LONGINT:C221(QV_al_QualityLevels; 0)
				//bsw this is where levels are populated from
				$_l_ListID:=AA_LoadListByName("Information Levels"; ->QV_at_QualityLevels; ->QV_al_QualityLevels; False:C215)
				//`````
				QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ListName:2="SubLevels_"+String:C10(QV_al_QualityIDs{$_l_Index}))
				If (Records in selection:C76([X_LISTS:111])=0)  //this make a sublist------but a hidden one
					CREATE RECORD:C68([X_LISTS:111])
					[X_LISTS:111]x_ListName:2:="SubLevels_"+String:C10(QV_al_QualityIDs{$_l_Index})
					AA_SetListProperty("ACCESS"; 32)
					DB_SaveRecord(->[X_LISTS:111])
					QV_l_SublevelslistID:=[X_LISTS:111]x_ID:1
				Else 
					QV_l_SublevelslistID:=[X_LISTS:111]x_ID:1
				End if 
				ARRAY TEXT:C222(QV_at_QualitySubLevels; 0)
				ARRAY LONGINT:C221(QV_al_QualitySubLevels; 0)
				AA_LoadListbyID(QV_l_SublevelslistID; ->QV_at_QualitySubLevels; ->QV_al_QualitySubLevels; False:C215)
				
				ARRAY LONGINT:C221($_al_LevelsToSearch; 0)
				ARRAY LONGINT:C221($_al_LevelToSearchNum; 0)
				ARRAY LONGINT:C221($_al_LevelsToSearch; Size of array:C274(QV_al_QualityLevels))  //Was QV_al_QualityLevels
				ARRAY LONGINT:C221($_al_LevelToSearchNum; Size of array:C274(QV_al_QualityLevels))  //Was QV_al_QualityLevels
				
				
				Case of 
						//: (QV_at_LevelOptions{$_l_Index}="Equal to") | (QV_at_LevelOptions{$_l_Index}="Not Equal to")
					: (QV_at_LevelOptions{$_l_Index}="Equal to") | (QV_at_LevelOptions{$_l_Index}="Not Equal to") | (QV_at_LevelOptions{$_l_Index}="=") | (QV_at_LevelOptions{$_l_Index}="#")
						//$_bo_LevelExclude:=(QV_at_LevelOptions{$_l_Index}="Not Equal to")
						$_bo_LevelExclude:=((QV_at_LevelOptions{$_l_Index}="Not Equal to") | (QV_at_LevelOptions{$_l_Index}="#"))
						$_l_QualityLevelRow:=Find in array:C230(QV_at_QualityLevels; String:C10(QV_al_QualityLevelLevels{$_l_Index}))  //QV_at_QualityLevels was QV_at_QualityLevels
						If ($_l_QualityLevelRow<0)
							$_l_ItemID:=AA_ListAddItembyID($_l_ListID; String:C10(QV_al_QualityLevelLevels{$_l_Index}))
							AA_LoadListbyID($_l_ListID; ->QV_at_QualityLevels; ->QV_al_QualityLevels; False:C215)
							
							$_l_QualityLevelRow:=Find in array:C230(QV_at_QualitySubLevels; String:C10(QV_al_QualityLevelLevels{$_l_Index}))
							If ($_l_QualityLevelRow<0)
								$_l_ItemID:=AA_ListAddItembyID(QV_l_SublevelslistID; String:C10(QV_al_QualityLevelLevels{$_l_Index}))
								AA_LoadListbyID(QV_l_SublevelslistID; ->QV_at_QualitySubLevels; ->QV_al_QualitySubLevels; False:C215)
								
							Else 
								$_l_ItemID:=QV_al_QualitySubLevels{$_l_QualityLevelRow}
							End if 
							
						Else 
							$_l_ItemID:=QV_al_QualityLevels{$_l_QualityLevelRow}
							
						End if 
						$_l_QualityLevelRow:=Find in array:C230(QV_at_QualitySubLevels; String:C10(QV_al_QualityLevelLevels{$_l_Index}))
						If ($_l_QualityLevelRow<0)
							$_l_ItemID:=AA_ListAddItembyID(QV_l_SublevelslistID; String:C10(QV_al_QualityLevelLevels{$_l_Index}))
							AA_LoadListbyID(QV_l_SublevelslistID; ->QV_at_QualitySubLevels; ->QV_al_QualitySubLevels; False:C215)
							
						Else 
							$_l_ItemID:=QV_al_QualitySubLevels{$_l_QualityLevelRow}
						End if 
						$_al_LevelsToSearch{1}:=$_l_ItemID
						$_al_LevelToSearchNum{1}:=QV_al_QualityLevelLevels{$_l_Index}
						ARRAY LONGINT:C221($_al_LevelsToSearch; 1)
						ARRAY LONGINT:C221($_al_LevelToSearchNum; 1)
						//: (QV_at_LevelOptions{$_l_Index}="Less than")
					: (QV_at_LevelOptions{$_l_Index}="Less than") | (QV_at_LevelOptions{$_l_Index}="<")
						$_l_CurrentElement:=0
						For ($_l_LevelsIndex; 1; Size of array:C274(QV_al_Levels))
							If (QV_al_Levels{$_l_LevelsIndex}<QV_al_QualityLevelLevels{$_l_Index})
								$_l_CurrentElement:=$_l_CurrentElement+1
								$_l_QualityLevelRow:=Find in array:C230(QV_at_QualityLevels; String:C10(QV_al_Levels{$_l_LevelsIndex}))
								If ($_l_QualityLevelRow<0)
									$_l_ItemID:=AA_ListAddItembyID($_l_ListID; String:C10(QV_al_Levels{$_l_LevelsIndex}))
									AA_LoadListbyID($_l_ListID; ->QV_at_QualityLevels; ->QV_al_QualityLevels; False:C215)  //QV_at_QualityLevels was QV_at_QualityLevels and QV_al_QualityLevels was QV_at_QualityLevels
									
									ARRAY LONGINT:C221($_al_LevelsToSearch; Size of array:C274(QV_al_QualityLevels))
									ARRAY LONGINT:C221($_al_LevelToSearchNum; Size of array:C274(QV_al_QualityLevels))
								Else 
									$_l_ItemID:=QV_al_QualityLevels{$_l_QualityLevelRow}
								End if 
								$_l_QualityLevelRow:=Find in array:C230(QV_at_QualitySubLevels; String:C10(QV_al_Levels{$_l_LevelsIndex}))
								If ($_l_QualityLevelRow<0)
									$_l_ItemID:=AA_ListAddItembyID(QV_l_SublevelslistID; String:C10(QV_al_Levels{$_l_LevelsIndex}))
									AA_LoadListbyID(QV_l_SublevelslistID; ->QV_at_QualitySubLevels; ->QV_al_QualitySubLevels; False:C215)
									
								Else 
									$_l_ItemID:=QV_al_QualitySubLevels{$_l_QualityLevelRow}  // Was QV_al_QualitySublevels
								End if 
								
								$_al_LevelsToSearch{$_l_CurrentElement}:=$_l_ItemID
								$_al_LevelToSearchNum{$_l_CurrentElement}:=QV_al_Levels{$_l_LevelsIndex}
							Else 
								$_l_LevelsIndex:=Size of array:C274(QV_al_Levels)
							End if 
							
						End for 
						ARRAY LONGINT:C221($_al_LevelsToSearch; $_l_CurrentElement)
						ARRAY LONGINT:C221($_al_LevelToSearchNum; $_l_CurrentElement)
						//: (QV_at_LevelOptions{$_l_Index}="Less than or Equal to")
					: (QV_at_LevelOptions{$_l_Index}="Less than or Equal to") | (QV_at_LevelOptions{$_l_Index}="<=")
						$_l_CurrentElement:=0
						For ($_l_LevelsIndex; 1; Size of array:C274(QV_al_Levels))
							If (QV_al_Levels{$_l_LevelsIndex}<=QV_al_QualityLevelLevels{$_l_Index})
								$_l_CurrentElement:=$_l_CurrentElement+1
								$_l_QualityLevelRow:=Find in array:C230(QV_at_QualityLevels; String:C10(QV_al_Levels{$_l_LevelsIndex}))  //QV_at_Qualitylevels was QV_t_a_QualityLevels
								If ($_l_QualityLevelRow<0)
									$_l_ItemID:=AA_ListAddItembyID($_l_ListID; String:C10(QV_al_Levels{$_l_LevelsIndex}))
									AA_LoadListbyID($_l_ListID; ->QV_at_QualityLevels; ->QV_al_QualityLevels; False:C215)  //QV_at_QualityLevels was QV_at_QualityLevels
									
									ARRAY LONGINT:C221($_al_LevelsToSearch; Size of array:C274(QV_al_QualityLevels))  //Was QV_al_QualityLevels
									ARRAY LONGINT:C221($_al_LevelToSearchNum; Size of array:C274(QV_al_QualityLevels))  //Was QV_al_QualityLevels
								Else 
									$_l_ItemID:=QV_al_QualityLevels{$_l_QualityLevelRow}  //Was QV_al_QualityLevels
								End if 
								$_l_QualityLevelRow:=Find in array:C230(QV_at_QualitySubLevels; String:C10(QV_al_Levels{$_l_LevelsIndex}))
								If ($_l_QualityLevelRow<0)
									$_l_ItemID:=AA_ListAddItembyID(QV_l_SublevelslistID; String:C10(QV_al_Levels{$_l_LevelsIndex}))
									AA_LoadListbyID(QV_l_SublevelslistID; ->QV_at_QualitySubLevels; ->QV_al_QualitySubLevels; False:C215)
									
								Else 
									$_l_ItemID:=QV_al_QualitySubLevels{$_l_QualityLevelRow}  //was QV_al_QualitySublevels
								End if 
								
								$_al_LevelsToSearch{$_l_CurrentElement}:=$_l_ItemID
								$_al_LevelToSearchNum{$_l_CurrentElement}:=QV_al_Levels{$_l_LevelsIndex}
							Else 
								$_l_LevelsIndex:=Size of array:C274(QV_al_Levels)
							End if 
							
						End for 
						ARRAY LONGINT:C221($_al_LevelToSearchNum; $_l_CurrentElement)
						ARRAY LONGINT:C221($_al_LevelsToSearch; $_l_CurrentElement)
						//: (QV_at_LevelOptions{$_l_Index}="Greater than")
					: (QV_at_LevelOptions{$_l_Index}="Greater than") | (QV_at_LevelOptions{$_l_Index}=">")
						$_l_CurrentElement:=0
						For ($_l_LevelsIndex; Size of array:C274(QV_al_Levels); 1; -1)
							If (QV_al_Levels{$_l_LevelsIndex}>QV_al_QualityLevelLevels{$_l_Index})
								$_l_CurrentElement:=$_l_CurrentElement+1
								$_l_QualityLevelRow:=Find in array:C230(QV_at_QualityLevels; String:C10(QV_al_Levels{$_l_LevelsIndex}))  //was QV_at_QualityLevels
								If ($_l_QualityLevelRow<0)
									$_l_ItemID:=AA_ListAddItembyID($_l_ListID; String:C10(QV_al_Levels{$_l_LevelsIndex}))
									AA_LoadListbyID($_l_ListID; ->QV_at_QualityLevels; ->QV_al_QualityLevels; False:C215)  //QV_at_QualityLevels was QV_at_QualityLevels and QV_al_QualityLevels was QV_al_QualityLevels
									
									ARRAY LONGINT:C221($_al_LevelsToSearch; Size of array:C274(QV_al_QualityLevels))  //Was QV_al_QualityLevels
									ARRAY LONGINT:C221($_al_LevelToSearchNum; Size of array:C274(QV_al_QualityLevels))  //Was QV_al_QualityLevels
								Else 
									$_l_ItemID:=QV_al_QualityLevels{$_l_QualityLevelRow}
								End if 
								$_l_QualityLevelRow:=Find in array:C230(QV_at_QualitySubLevels; String:C10(QV_al_Levels{$_l_LevelsIndex}))  // was QV_at_QualitySublevels
								If ($_l_QualityLevelRow<0)
									$_l_ItemID:=AA_ListAddItembyID(QV_l_SublevelslistID; String:C10(QV_al_Levels{$_l_LevelsIndex}))
									AA_LoadListbyID(QV_l_SublevelslistID; ->QV_at_QualitySubLevels; ->QV_al_QualitySubLevels; False:C215)  //QV_AL_QualitySubLevels was QV_al_QualitySublevels
								Else 
									$_l_ItemID:=QV_al_QualitySubLevels{$_l_QualityLevelRow}
								End if 
								
								$_al_LevelsToSearch{$_l_CurrentElement}:=$_l_ItemID
								$_al_LevelToSearchNum{$_l_CurrentElement}:=QV_al_Levels{$_l_LevelsIndex}
							Else 
								$_l_LevelsIndex:=1
							End if 
							
						End for 
						ARRAY LONGINT:C221($_al_LevelsToSearch; $_l_CurrentElement)
						ARRAY LONGINT:C221($_al_LevelToSearchNum; $_l_CurrentElement)
						//: (QV_at_LevelOptions{$_l_Index}="Greater than or Equal to")
					: (QV_at_LevelOptions{$_l_Index}="Greater than or Equal to") | (QV_at_LevelOptions{$_l_Index}=">=")
						$_l_CurrentElement:=0
						For ($_l_LevelsIndex; Size of array:C274(QV_al_Levels); 1; -1)
							If (QV_al_Levels{$_l_LevelsIndex}>=QV_al_QualityLevelLevels{$_l_Index})
								$_l_CurrentElement:=$_l_CurrentElement+1
								$_l_QualityLevelRow:=Find in array:C230(QV_at_QualityLevels; String:C10(QV_al_Levels{$_l_LevelsIndex}))  //QV_at_Quality levels was QV_at_QualityLevels
								If ($_l_QualityLevelRow<0)
									$_l_ItemID:=AA_ListAddItembyID($_l_ListID; String:C10(QV_al_Levels{$_l_LevelsIndex}))
									AA_LoadListbyID($_l_ListID; ->QV_at_QualityLevels; ->QV_al_QualityLevels; False:C215)  //QV_at_QualityLevels was QV_at_QualityLevels. QV_al_QualityLevels was QV_al_QualityLevels
									
									ARRAY LONGINT:C221($_al_LevelsToSearch; Size of array:C274(QV_al_QualityLevels))  //THis was QV_al_QualityLevels
									ARRAY LONGINT:C221($_al_LevelToSearchNum; Size of array:C274(QV_al_QualityLevels))  //THis was QV_al_QualityLevels
								Else 
									$_l_ItemID:=QV_al_QualityLevels{$_l_QualityLevelRow}  //NG this was QV_al_QualityLevels
								End if 
								$_l_QualityLevelRow:=Find in array:C230(QV_at_QualitySubLevels; String:C10(QV_al_Levels{$_l_LevelsIndex}))
								If ($_l_QualityLevelRow<0)
									$_l_ItemID:=AA_ListAddItembyID(QV_l_SublevelslistID; String:C10(QV_al_Levels{$_l_LevelsIndex}))
									AA_LoadListbyID(QV_l_SublevelslistID; ->QV_at_QualitySubLevels; ->QV_al_QualitySubLevels; False:C215)
									
								Else 
									$_l_ItemID:=QV_al_QualitySubLevels{$_l_QualityLevelRow}
								End if 
								
								$_al_LevelsToSearch{$_l_CurrentElement}:=$_l_ItemID
								$_al_LevelToSearchNum{$_l_CurrentElement}:=QV_al_Levels{$_l_LevelsIndex}
							Else 
								$_l_LevelsIndex:=1
							End if 
							
						End for 
						ARRAY LONGINT:C221($_al_LevelsToSearch; $_l_CurrentElement)
						ARRAY LONGINT:C221($_al_LevelToSearchNum; $_l_CurrentElement)
				End case 
				//NG Feb 2004 the levelids are now unique to the quailty id!!!!
				CREATE EMPTY SET:C140(Table:C252($1)->; "MULTIUNION")
				USE SET:C118("QVTEMPADD")
				CREATE EMPTY SET:C140(Table:C252($1)->; "QVTEMPADD3")
				For ($_l_LevelsIndex; 1; Size of array:C274($_al_LevelsToSearch))
					If ($_bo_Rebuild)
						//force rebuild  list
						READ WRITE:C146([USER_SETS:105])
						QUERY:C277([USER_SETS:105]; [USER_SETS:105]SET_ID:3=$_al_LevelsToSearch{$_l_LevelsIndex}; *)
						QUERY:C277([USER_SETS:105];  & ; [USER_SETS:105]Set_Table:5=$_l_Table)
						If (Records in selection:C76([USER_SETS:105])>0)
							DELETE SELECTION:C66([USER_SETS:105])
						End if 
					End if 
					READ ONLY:C145([USER_SETS:105])
					QUERY:C277([USER_SETS:105]; [USER_SETS:105]SET_ID:3=$_al_LevelsToSearch{$_l_LevelsIndex}; *)
					QUERY:C277([USER_SETS:105];  & ; [USER_SETS:105]Set_Table:5=$_l_Table)
					If (Records in selection:C76([USER_SETS:105])>1)
						READ WRITE:C146([USER_SETS:105])
						QUERY:C277([USER_SETS:105]; [USER_SETS:105]SET_ID:3=$_al_LevelsToSearch{$_l_LevelsIndex}; *)
						QUERY:C277([USER_SETS:105];  & ; [USER_SETS:105]Set_Table:5=$_l_Table)
						DELETE SELECTION:C66([USER_SETS:105])
						READ ONLY:C145([USER_SETS:105])
						
					End if 
					If (Records in selection:C76([USER_SETS:105])=0)
						QV_UpdateSet($_l_Table; $_al_LevelsToSearch{$_l_LevelsIndex}; 0; False:C215; 2)
						QUERY:C277([USER_SETS:105]; [USER_SETS:105]SET_ID:3=$_al_LevelsToSearch{$_l_LevelsIndex}; *)
						QUERY:C277([USER_SETS:105];  & ; [USER_SETS:105]Set_Table:5=$_l_Table)
					End if 
					
					$_l_x:=Find in array:C230(QV_al_QualityLevels; $_al_LevelsToSearch{$_l_LevelsIndex})
					QUERY:C277([INFORMATION:55]; [INFORMATION:55]QualityID:14=QV_al_QualityIDs{$_l_Index}; *)
					QUERY:C277([INFORMATION:55];  & ; [INFORMATION:55]RelatedTableNumber:11=$_l_Table; *)
					QUERY:C277([INFORMATION:55];  & ; [INFORMATION:55]Information_Level:4=$_al_LevelToSearchNum{$_l_LevelsIndex}; *)
					QUERY:C277([INFORMATION:55];  & ; [INFORMATION:55]Deleted:10=0)
					$_l_ExpectedResults:=Records in selection:C76([INFORMATION:55])
					UNLOAD RECORD:C212([INFORMATION:55])
					QV_loadset($1; "QVTEMPADD2")
					If (Records in set:C195("QVTEMPADD2")#$_l_ExpectedResults)
						READ WRITE:C146([USER_SETS:105])
						QUERY:C277([USER_SETS:105]; [USER_SETS:105]SET_ID:3=$_al_LevelsToSearch{$_l_LevelsIndex}; *)
						QUERY:C277([USER_SETS:105];  & ; [USER_SETS:105]Set_Table:5=$_l_Table)
						If (Records in selection:C76([USER_SETS:105])>0)
							DELETE SELECTION:C66([USER_SETS:105])
						End if 
						QV_UpdateSet($_l_Table; $_al_LevelsToSearch{$_l_LevelsIndex}; 0; False:C215; 2)
						QUERY:C277([USER_SETS:105]; [USER_SETS:105]SET_ID:3=$_al_LevelsToSearch{$_l_LevelsIndex}; *)
						QUERY:C277([USER_SETS:105];  & ; [USER_SETS:105]Set_Table:5=$_l_Table)
						QV_loadset($1; "QVTEMPADD2")
					End if 
					INTERSECTION:C121("QVTEMPADD"; "QVTEMPADD2"; "QVTEMPADD3")
					
					
					If (Not:C34($_bo_LevelExclude))
						UNION:C120("MULTIUNION"; "QVTEMPADD3"; "MULTIUNION")
					Else 
						//there is only one level in an exclude
						DIFFERENCE:C122("QVTEMPADD"; "MULTIUNION"; "MULTIUNION")
					End if 
					
				End for 
				USE SET:C118("MULTIUNION")
				CREATE SET:C116(Table:C252($1)->; "QVTEMPADD")
				
				
			End if 
			//start here
			$_bo_YearExclude:=False:C215
			If (QV_al_QualityYears{$_l_Index}>0)
				ARRAY TEXT:C222(QV_at_ListQualityYears; 0)
				ARRAY LONGINT:C221(QV_al_ListQualityYears; 0)
				$_l_ListID:=AA_LoadListByName("Information Years"; ->QV_at_ListQualityYears; ->QV_al_ListQualityYears; False:C215)
				ARRAY LONGINT:C221($_al_YearsToSearch; Size of array:C274(QV_al_QualityYears))
				//````
				QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ListName:2="SubYears_"+String:C10(QV_al_QualityIDs{$_l_Index}))
				If (Records in selection:C76([X_LISTS:111])=0)  //this make a sublist------but a hidden one
					CREATE RECORD:C68([X_LISTS:111])
					[X_LISTS:111]x_ListName:2:="SubYears_"+String:C10(QV_al_QualityIDs{$_l_Index})
					AA_SetListProperty("ACCESS"; 32)
					DB_SaveRecord(->[X_LISTS:111])
					QV_l_SubYearslistID:=[X_LISTS:111]x_ID:1
				Else 
					QV_l_SubYearslistID:=[X_LISTS:111]x_ID:1
				End if 
				ARRAY TEXT:C222(QV_at_QualitySubYears; 0)
				ARRAY LONGINT:C221(QV_al_QualitySubYears; 0)
				AA_LoadListbyID(QV_l_SubYearslistID; ->QV_at_QualitySubYears; ->QV_al_QualitySubYears; False:C215)
				
				//```
				Case of 
					: (QV_at_YearOptions{$_l_Index}="Equal to") | (QV_at_YearOptions{$_l_Index}="Not Equal to")
						$_bo_YearExclude:=(QV_at_YearOptions{$_l_Index}="Not Equal to")
						$_l_YearRow:=Find in array:C230(QV_at_ListQualityYears; String:C10(QV_al_QualityQualityYears{$_l_Index}))
						If ($_l_YearRow<0)
							$_l_ItemID:=AA_ListAddItembyID($_l_ListID; String:C10(QV_al_QualityQualityYears{$_l_Index}))
							ARRAY LONGINT:C221($_al_YearsToSearch; Size of array:C274(QV_al_ListQualityYears))
						Else 
							$_l_ItemID:=QV_al_ListQualityYears{$_l_YearRow}
						End if 
						$_l_YearRow:=Find in array:C230(QV_at_QualitySubYears; String:C10(QV_al_QualityQualityYears{$_l_Index}))
						If ($_l_YearRow<0)
							$_l_ItemID:=AA_ListAddItembyID(QV_l_SubYearslistID; String:C10(QV_al_QualityLevelLevels{$_l_Index}))
							AA_LoadListbyID(QV_l_SubYearslistID; ->QV_at_QualitySubYears; ->QV_al_QualitySubYears; False:C215)
							
						Else 
							$_l_ItemID:=QV_al_QualitySubYears{$_l_YearRow}
						End if 
						
						$_al_YearsToSearch{1}:=$_l_ItemID
						ARRAY LONGINT:C221($_al_YearsToSearch; 1)
					: (QV_at_YearOptions{$_l_Index}="Less than")
						$_l_CurrentElement:=0
						For ($_l_LevelsIndex; 1; Size of array:C274(QV_al_ListQualityYears))
							If (QV_al_ListQualityYears{$_l_LevelsIndex}<QV_al_QualityQualityYears{$_l_Index})  //NG Checked April 2020
								$_l_CurrentElement:=$_l_CurrentElement+1
								$_l_YearRow:=Find in array:C230(QV_at_ListQualityYears; String:C10(QV_al_ListQualityYears{$_l_LevelsIndex}))
								If ($_l_YearRow<0)
									$_l_ItemID:=AA_ListAddItembyID($_l_ListID; String:C10(QV_al_ListQualityYears{$_l_LevelsIndex}))
									ARRAY LONGINT:C221($_al_YearsToSearch; Size of array:C274(QV_al_ListQualityYears))
								Else 
									$_l_ItemID:=QV_al_ListQualityYears{$_l_YearRow}
								End if 
								$_l_YearRow:=Find in array:C230(QV_at_QualitySubYears; String:C10(QV_al_ListQualityYears{$_l_LevelsIndex}))
								//End if 
								If ($_l_YearRow<0)
									$_l_ItemID:=AA_ListAddItembyID(QV_l_SubYearslistID; String:C10(QV_al_ListQualityYears{$_l_LevelsIndex}))
									AA_LoadListbyID(QV_l_SubYearslistID; ->QV_at_QualitySubYears; ->QV_al_QualitySubYears; False:C215)
									
								Else 
									$_l_ItemID:=QV_al_QualitySubYears{$_l_YearRow}
								End if 
								
								$_al_YearsToSearch{$_l_CurrentElement}:=$_l_ItemID
							Else 
								$_l_LevelsIndex:=Size of array:C274(QV_al_ListQualityYears)
							End if 
						End for 
						ARRAY LONGINT:C221($_al_YearsToSearch; $_l_CurrentElement)
					: (QV_at_YearOptions{$_l_Index}="Less than or Equal to")
						$_l_CurrentElement:=0
						For ($_l_LevelsIndex; 1; Size of array:C274(QV_al_ListQualityYears))
							If (QV_al_ListQualityYears{$_l_LevelsIndex}<=QV_al_QualityQualityYears{$_l_Index})
								$_l_CurrentElement:=$_l_CurrentElement+1
								$_l_YearRow:=Find in array:C230(QV_at_ListQualityYears; String:C10(QV_al_ListQualityYears{$_l_LevelsIndex}))
								If ($_l_YearRow<0)
									$_l_ItemID:=AA_ListAddItembyID($_l_ListID; String:C10(QV_al_ListQualityYears{$_l_LevelsIndex}))
									ARRAY LONGINT:C221($_al_YearsToSearch; Size of array:C274(QV_al_ListQualityYears))
								Else 
									$_l_ItemID:=QV_al_ListQualityYears{$_l_YearRow}
								End if 
								$_l_YearRow:=Find in array:C230(QV_at_QualitySubYears; String:C10(QV_al_ListQualityYears{$_l_LevelsIndex}))
								If ($_l_YearRow<0)
									$_l_ItemID:=AA_ListAddItembyID(QV_l_SubYearslistID; String:C10(QV_al_ListQualityYears{$_l_LevelsIndex}))
									AA_LoadListbyID(QV_l_SubYearslistID; ->QV_at_QualitySubYears; ->QV_al_QualitySubYears; False:C215)
									
								Else 
									$_l_ItemID:=QV_al_QualitySubYears{$_l_YearRow}
								End if 
								
								$_al_YearsToSearch{$_l_CurrentElement}:=$_l_ItemID
							Else 
								$_l_LevelsIndex:=Size of array:C274(QV_al_ListQualityYears)
							End if 
						End for 
						ARRAY LONGINT:C221($_al_YearsToSearch; $_l_CurrentElement)
					: (QV_at_YearOptions{$_l_Index}="Greater than")
						$_l_CurrentElement:=0
						For ($_l_LevelsIndex; Size of array:C274(QV_al_ListQualityYears); 1; -1)
							If (QV_al_ListQualityYears{$_l_LevelsIndex}>QV_al_QualityQualityYears{$_l_Index})  //NG Checked April 2020
								$_l_CurrentElement:=$_l_CurrentElement+1
								$_l_YearRow:=Find in array:C230(QV_at_ListQualityYears; String:C10(QV_al_ListQualityYears{$_l_LevelsIndex}))
								If ($_l_YearRow<0)
									$_l_ItemID:=AA_ListAddItembyID($_l_ListID; String:C10(QV_al_ListQualityYears{$_l_LevelsIndex}))
									ARRAY LONGINT:C221($_al_YearsToSearch; Size of array:C274(QV_al_ListQualityYears))
								Else 
									$_l_ItemID:=QV_al_ListQualityYears{$_l_YearRow}
								End if 
								$_l_YearRow:=Find in array:C230(QV_at_QualitySubYears; String:C10(QV_al_ListQualityYears{$_l_LevelsIndex}))
								If ($_l_YearRow<0)
									$_l_ItemID:=AA_ListAddItembyID(QV_l_SubYearslistID; String:C10(QV_al_ListQualityYears{$_l_LevelsIndex}))
									AA_LoadListbyID(QV_l_SubYearslistID; ->QV_at_QualitySubYears; ->QV_al_QualitySubYears; False:C215)
									
								Else 
									$_l_ItemID:=QV_al_QualitySubYears{$_l_YearRow}
								End if 
								
								$_al_YearsToSearch{$_l_CurrentElement}:=$_l_ItemID
							Else 
								$_l_LevelsIndex:=1
							End if 
						End for 
						ARRAY LONGINT:C221($_al_YearsToSearch; $_l_CurrentElement)
					: (QV_at_YearOptions{$_l_Index}="Greater than or Equal to")
						$_l_CurrentElement:=0
						For ($_l_LevelsIndex; Size of array:C274(QV_al_ListQualityYears); 1; -1)
							If (QV_al_ListQualityYears{$_l_LevelsIndex}>=QV_al_QualityYears{$_l_Index})
								$_l_CurrentElement:=$_l_CurrentElement+1
								$_l_YearRow:=Find in array:C230(QV_at_ListQualityYears; String:C10(QV_al_ListQualityYears{$_l_LevelsIndex}))
								If ($_l_YearRow<0)
									$_l_ItemID:=AA_ListAddItembyID($_l_ListID; String:C10(QV_al_ListQualityYears{$_l_LevelsIndex}))
									ARRAY LONGINT:C221($_al_YearsToSearch; Size of array:C274(QV_al_QualityYears))
								Else 
									$_l_ItemID:=QV_al_ListQualityYears{$_l_YearRow}
								End if 
								$_l_YearRow:=Find in array:C230(QV_at_QualitySubYears; String:C10(QV_al_ListQualityYears{$_l_LevelsIndex}))
								If ($_l_YearRow<0)
									$_l_ItemID:=AA_ListAddItembyID(QV_l_SubYearslistID; String:C10(QV_al_ListQualityYears{$_l_LevelsIndex}))
									AA_LoadListbyID(QV_l_SubYearslistID; ->QV_at_QualitySubYears; ->QV_al_QualitySubYears; False:C215)
									
								Else 
									$_l_ItemID:=QV_al_QualitySubYears{$_l_YearRow}
								End if 
								
								$_al_YearsToSearch{$_l_CurrentElement}:=$_l_ItemID
							Else 
								$_l_LevelsIndex:=1
							End if 
						End for 
						ARRAY LONGINT:C221($_al_YearsToSearch; $_l_CurrentElement)
				End case 
				CREATE EMPTY SET:C140(Table:C252($1)->; "MULTIUNION")
				CREATE EMPTY SET:C140(Table:C252($1)->; "QVTEMPADD3")
				For ($_l_YearsIndex; 1; Size of array:C274($_al_YearsToSearch))
					QUERY:C277([INFORMATION:55]; [INFORMATION:55]QualityID:14=QV_al_QualityIDs{$_l_Index}; *)
					QUERY:C277([INFORMATION:55];  & ; [INFORMATION:55]RelatedTableNumber:11=$_l_Table; *)
					QUERY:C277([INFORMATION:55];  & ; [INFORMATION:55]Year:5=Num:C11(QV_at_ListQualityYears{$_l_YearsIndex}); *)
					
					QUERY:C277([INFORMATION:55];  & ; [INFORMATION:55]Deleted:10=0)
					$_l_ExpectedResults:=Records in selection:C76([INFORMATION:55])
					
					If ($_bo_Rebuild)
						//force rebuild  list
						READ WRITE:C146([USER_SETS:105])
						QUERY:C277([USER_SETS:105]; [USER_SETS:105]SET_ID:3=$_al_YearsToSearch{$_l_YearsIndex}; *)
						QUERY:C277([USER_SETS:105];  & ; [USER_SETS:105]Set_Table:5=$_l_Table)
						If (Records in selection:C76([USER_SETS:105])>0)
							DELETE SELECTION:C66([USER_SETS:105])
						End if 
					End if 
					READ ONLY:C145([USER_SETS:105])
					QUERY:C277([USER_SETS:105]; [USER_SETS:105]SET_ID:3=$_al_YearsToSearch{$_l_YearsIndex}; *)
					QUERY:C277([USER_SETS:105];  & ; [USER_SETS:105]Set_Table:5=$_l_Table)
					If (Records in selection:C76([USER_SETS:105])>1)
						READ WRITE:C146([USER_SETS:105])
						QUERY:C277([USER_SETS:105]; [USER_SETS:105]SET_ID:3=$_al_YearsToSearch{$_l_YearsIndex}; *)
						QUERY:C277([USER_SETS:105];  & ; [USER_SETS:105]Set_Table:5=$_l_Table)
						DELETE SELECTION:C66([USER_SETS:105])
						READ ONLY:C145([USER_SETS:105])
					End if 
					
					If (Records in selection:C76([USER_SETS:105])=0)
						QV_UpdateSet($_l_Table; $_al_YearsToSearch{$_l_YearsIndex}; 0; False:C215; 3)
						QUERY:C277([USER_SETS:105]; [USER_SETS:105]SET_ID:3=$_al_YearsToSearch{$_l_YearsIndex}; *)
						QUERY:C277([USER_SETS:105];  & ; [USER_SETS:105]Set_Table:5=$_l_Table)
					End if 
					//``
					QV_loadset($1; "QVTEMPADD2")
					If (Records in set:C195("QVTEMPADD2")#$_l_ExpectedResults)
						READ WRITE:C146([USER_SETS:105])
						QUERY:C277([USER_SETS:105]; [USER_SETS:105]SET_ID:3=$_al_YearsToSearch{$_l_YearsIndex}; *)
						QUERY:C277([USER_SETS:105];  & ; [USER_SETS:105]Set_Table:5=$_l_Table)
						If (Records in selection:C76([USER_SETS:105])>0)
							DELETE SELECTION:C66([USER_SETS:105])
						End if 
						QV_UpdateSet($_l_Table; $_al_YearsToSearch{$_l_YearsIndex}; 0; False:C215; 3)
						QUERY:C277([USER_SETS:105]; [USER_SETS:105]SET_ID:3=$_al_YearsToSearch{$_l_YearsIndex}; *)
						QUERY:C277([USER_SETS:105];  & ; [USER_SETS:105]Set_Table:5=$_l_Table)
						
						QV_loadset($1; "QVTEMPADD2")
					End if 
					//`
					
					INTERSECTION:C121("QVTEMPADD"; "QVTEMPADD2"; "QVTEMPADD3")
					
					If (Not:C34($_bo_YearExclude))
						UNION:C120("MULTIUNION"; "QVTEMPADD3"; "MULTIUNION")
					Else 
						DIFFERENCE:C122("QVTEMPADD"; "MULTIUNION"; "MULTIUNION")
					End if 
				End for 
				USE SET:C118("MULTIUNION")
				CREATE EMPTY SET:C140(Table:C252($1)->; "QVTEMPADD")
				
			End if 
		End if 
		
		
		Case of 
			: (QV_at_QueryType=1) | ($_l_QueryLine=1)
				//any(add sets together   )
				UNION:C120("QVTEMP"; "QVTEMPADD"; "QVTEMP")
				If (QV_bo_ReturnQuals)
					UNION:C120("QVrecords"; "QVrecords2"; "QVrecords")
					CLEAR SET:C117("QVrecords2")
				End if 
			: (QV_at_QueryType=2)
				//all intersect sets
				INTERSECTION:C121("QVTEMP"; "QVTEMPADD"; "QVTEMP")
				If (QV_bo_ReturnQuals)
					INTERSECTION:C121("QVrecords"; "QVrecords2"; "QVrecords")
					CLEAR SET:C117("QVrecords2")
				End if 
		End case 
	End if 
	If (QV_abo_Exclude{$_l_Index}=True:C214)
		
		$_l_Table:=$1
		If (QV_al_GroupIDs{$_l_Index}>0)
			UNLOAD RECORD:C212([INFORMATION:55])
			If (QV_bo_ReturnQuals)
				QUERY:C277([INFORMATION:55]; [INFORMATION:55]QualityGroupID:15=QV_al_GroupIDs{$_l_Index})
				$_l_ExpectedResultsGroup:=Records in selection:C76([INFORMATION:55])
				CREATE SET:C116([INFORMATION:55]; "QVrecords2")
			Else 
				QUERY:C277([INFORMATION:55]; [INFORMATION:55]QualityGroupID:15=QV_al_GroupIDs{$_l_Index}; *)
				QUERY:C277([INFORMATION:55];  & ; [INFORMATION:55]RelatedTableNumber:11=$_l_Table; *)
				QUERY:C277([INFORMATION:55];  & ; [INFORMATION:55]Deleted:10=0)
				$_l_ExpectedResultsGroup:=Records in selection:C76([INFORMATION:55])
				
				
			End if 
			If ($_bo_Rebuild)
				//force rebuild  list
				READ WRITE:C146([USER_SETS:105])
				QUERY:C277([USER_SETS:105]; [USER_SETS:105]SET_ID:3=QV_al_GroupIDs{$_l_Index}; *)
				QUERY:C277([USER_SETS:105];  & ; [USER_SETS:105]Set_Table:5=$_l_Table)
				If (Records in selection:C76([USER_SETS:105])>0)
					DELETE SELECTION:C66([USER_SETS:105])
				End if 
			End if 
			
			READ ONLY:C145([USER_SETS:105])
			QUERY:C277([USER_SETS:105]; [USER_SETS:105]SET_ID:3=QV_al_GroupIDs{$_l_Index}; *)
			QUERY:C277([USER_SETS:105];  & ; [USER_SETS:105]Set_Table:5=$_l_Table)
			If (Records in selection:C76([USER_SETS:105])>1)
				READ WRITE:C146([USER_SETS:105])
				QUERY:C277([USER_SETS:105]; [USER_SETS:105]SET_ID:3=QV_al_GroupIDs{$_l_Index}; *)
				QUERY:C277([USER_SETS:105];  & ; [USER_SETS:105]Set_Table:5=$_l_Table)
				DELETE SELECTION:C66([USER_SETS:105])
				READ ONLY:C145([USER_SETS:105])
			End if 
			If (Records in selection:C76([USER_SETS:105])=0)
				QV_UpdateSet($_l_Table; -QV_al_GroupIDs{$_l_Index}; 0)
				QUERY:C277([USER_SETS:105]; [USER_SETS:105]SET_ID:3=QV_al_GroupIDs{$_l_Index}; *)
				QUERY:C277([USER_SETS:105];  & ; [USER_SETS:105]Set_Table:5=$_l_Table)
			End if 
			QV_loadset($1; "QVTEMPADD")
			If (Records in set:C195("QVTEMPADD")#$_l_ExpectedResultsGroup)
				READ WRITE:C146([USER_SETS:105])
				QUERY:C277([USER_SETS:105]; [USER_SETS:105]SET_ID:3=QV_al_GroupIDs{$_l_Index}; *)
				QUERY:C277([USER_SETS:105];  & ; [USER_SETS:105]Set_Table:5=$_l_Table)
				If (Records in selection:C76([USER_SETS:105])>0)
					DELETE SELECTION:C66([USER_SETS:105])
				End if 
				QV_UpdateSet($_l_Table; -QV_al_GroupIDs{$_l_Index}; 0)
				QUERY:C277([USER_SETS:105]; [USER_SETS:105]SET_ID:3=QV_al_GroupIDs{$_l_Index}; *)
				QUERY:C277([USER_SETS:105];  & ; [USER_SETS:105]Set_Table:5=$_l_Table)
				QV_loadset($1; "QVTEMPADD")
				
			End if 
		End if 
		If (QV_al_QualityIDs{$_l_Index}>0)
			If (QV_bo_ReturnQuals)
				QUERY:C277([INFORMATION:55]; [INFORMATION:55]QualityID:14=QV_al_QualityIDs{$_l_Index})
				CREATE SET:C116([INFORMATION:55]; "QVrecords2")
			Else 
				QUERY:C277([INFORMATION:55]; [INFORMATION:55]QualityID:14=QV_al_QualityIDs{$_l_Index}; *)
				QUERY:C277([INFORMATION:55];  & ; [INFORMATION:55]RelatedTableNumber:11=$_l_Table; *)
				QUERY:C277([INFORMATION:55];  & ; [INFORMATION:55]Deleted:10=0)
				$_l_ExpectedResults:=Records in selection:C76([INFORMATION:55])
				UNLOAD RECORD:C212([INFORMATION:55])
			End if 
			If ($_bo_Rebuild)
				//force rebuild  list
				READ WRITE:C146([USER_SETS:105])
				QUERY:C277([USER_SETS:105]; [USER_SETS:105]SET_ID:3=QV_al_QualityIDs{$_l_Index}; *)
				QUERY:C277([USER_SETS:105];  & ; [USER_SETS:105]Set_Table:5=$_l_Table)
				If (Records in selection:C76([USER_SETS:105])>0)
					DELETE SELECTION:C66([USER_SETS:105])
				End if 
			End if 
			
			READ ONLY:C145([USER_SETS:105])
			QUERY:C277([USER_SETS:105]; [USER_SETS:105]SET_ID:3=QV_al_QualityIDs{$_l_Index}; *)
			QUERY:C277([USER_SETS:105];  & ; [USER_SETS:105]Set_Table:5=$_l_Table)
			If (Records in selection:C76([USER_SETS:105])>1)
				READ WRITE:C146([USER_SETS:105])
				QUERY:C277([USER_SETS:105]; [USER_SETS:105]SET_ID:3=QV_al_QualityIDs{$_l_Index}; *)
				QUERY:C277([USER_SETS:105];  & ; [USER_SETS:105]Set_Table:5=$_l_Table)
				DELETE SELECTION:C66([USER_SETS:105])
				READ ONLY:C145([USER_SETS:105])
			End if 
			If (Records in selection:C76([USER_SETS:105])=0)
				QV_UpdateSet($_l_Table; QV_al_QualityIDs{$_l_Index}; 0)
				QUERY:C277([USER_SETS:105]; [USER_SETS:105]SET_ID:3=QV_al_QualityIDs{$_l_Index}; *)
				QUERY:C277([USER_SETS:105];  & ; [USER_SETS:105]Set_Table:5=$_l_Table)
			End if 
			QV_loadset($1; "QVTEMPADD")
			If (Records in set:C195("QVTEMPADD")#$_l_ExpectedResults)
				READ WRITE:C146([USER_SETS:105])
				QUERY:C277([USER_SETS:105]; [USER_SETS:105]SET_ID:3=QV_al_QualityIDs{$_l_Index}; *)
				QUERY:C277([USER_SETS:105];  & ; [USER_SETS:105]Set_Table:5=$_l_Table)
				DELETE SELECTION:C66([USER_SETS:105])
				READ ONLY:C145([USER_SETS:105])
				QV_UpdateSet($_l_Table; QV_al_QualityIDs{$_l_Index}; 0)
				QUERY:C277([USER_SETS:105]; [USER_SETS:105]SET_ID:3=QV_al_QualityIDs{$_l_Index}; *)
				QUERY:C277([USER_SETS:105];  & ; [USER_SETS:105]Set_Table:5=$_l_Table)
				QV_loadset($1; "QVTEMPADD")
			End if 
			If (QV_al_QualityIDs{$_l_Index}>0)
				
				//here if the user has entered a level check the level is at least the entered val
				$_bo_LevelExclude:=False:C215
				If (QV_al_QualityLevelLevels{$_l_Index}>0) & (QV_al_QualityIDs{$_l_Index}>0)
					ARRAY TEXT:C222(QV_at_QualityLevels; 0)
					ARRAY LONGINT:C221(QV_al_QualityLevels; 0)
					$_l_ListID:=AA_LoadListByName("Information Levels"; ->QV_at_QualityLevels; ->QV_al_QualityLevels; False:C215)
					//`````
					QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ListName:2="SubLevels_"+String:C10(QV_al_QualityIDs{$_l_Index}))
					If (Records in selection:C76([X_LISTS:111])=0)  //this make a sublist------but a hidden one
						CREATE RECORD:C68([X_LISTS:111])
						[X_LISTS:111]x_ListName:2:="SubLevels_"+String:C10(QV_al_QualityIDs{$_l_Index})
						AA_SetListProperty("ACCESS"; 32)
						DB_SaveRecord(->[X_LISTS:111])
						QV_l_SublevelslistID:=[X_LISTS:111]x_ID:1
					Else 
						QV_l_SublevelslistID:=[X_LISTS:111]x_ID:1
					End if 
					ARRAY TEXT:C222(QV_at_QualitySubLevels; 0)
					ARRAY LONGINT:C221(QV_al_QualitySubLevels; 0)
					AA_LoadListbyID(QV_l_SublevelslistID; ->QV_at_QualitySubLevels; ->QV_al_QualitySubLevels; False:C215)
					
					ARRAY LONGINT:C221($_al_LevelsToSearch; 0)
					ARRAY LONGINT:C221($_al_LevelToSearchNum; 0)
					ARRAY LONGINT:C221($_al_LevelsToSearch; Size of array:C274(QV_al_QualityLevels))
					ARRAY LONGINT:C221($_al_LevelToSearchNum; Size of array:C274(QV_al_QualityLevels))
					
					Case of 
							//: (QV_at_LevelOptions{$_l_Index}="Equal to") | (QV_at_LevelOptions{$_l_Index}="Not Equal to")
						: (QV_at_LevelOptions{$_l_Index}="Equal to") | (QV_at_LevelOptions{$_l_Index}="Not Equal to") | (QV_at_LevelOptions{$_l_Index}="=") | (QV_at_LevelOptions{$_l_Index}="#")
							//$_bo_LevelExclude:=(QV_at_LevelOptions{$_l_Index}="Not Equal to")
							$_bo_LevelExclude:=((QV_at_LevelOptions{$_l_Index}="Not Equal to") | (QV_at_LevelOptions{$_l_Index}="#"))
							$_l_LevelRow:=Find in array:C230(QV_at_QualityLevels; String:C10(QV_al_QualityLevelLevels{$_l_Index}))
							If ($_l_LevelRow<0)
								$_l_ItemID:=AA_ListAddItembyID($_l_ListID; String:C10(QV_al_QualityLevelLevels{$_l_Index}))
								AA_LoadListbyID($_l_ListID; ->QV_at_QualityLevels; ->QV_al_QualityLevels; False:C215)
								ARRAY LONGINT:C221($_al_LevelsToSearch; Size of array:C274(QV_al_QualityLevels))
								ARRAY LONGINT:C221($_al_LevelToSearchNum; Size of array:C274(QV_al_QualityLevels))
								
								$_l_LevelRow:=Find in array:C230(QV_at_QualitySubLevels; String:C10(QV_al_QualityLevelLevels{$_l_Index}))
								If ($_l_LevelRow<0)
									$_l_ItemID:=AA_ListAddItembyID(QV_l_SublevelslistID; String:C10(QV_al_QualityLevelLevels{$_l_Index}))
									AA_LoadListbyID(QV_l_SublevelslistID; ->QV_at_QualitySubLevels; ->QV_al_QualitySubLevels; False:C215)
									
								Else 
									$_l_ItemID:=QV_al_QualitySubLevels{$_l_LevelRow}
								End if 
								
							Else 
								$_l_ItemID:=QV_al_QualityLevels{$_l_LevelRow}
								
							End if 
							$_l_LevelRow:=Find in array:C230(QV_at_QualitySubLevels; String:C10(QV_al_QualityLevelLevels{$_l_Index}))
							If ($_l_LevelRow<0)
								$_l_ItemID:=AA_ListAddItembyID(QV_l_SublevelslistID; String:C10(QV_al_QualityLevelLevels{$_l_Index}))
								AA_LoadListbyID(QV_l_SublevelslistID; ->QV_at_QualitySubLevels; ->QV_al_QualitySubLevels; False:C215)
								
							Else 
								$_l_ItemID:=QV_al_QualitySubLevels{$_l_LevelRow}
							End if 
							$_al_LevelsToSearch{1}:=$_l_ItemID
							$_al_LevelToSearchNum{1}:=QV_al_QualityLevelLevels{$_l_Index}
							ARRAY LONGINT:C221($_al_LevelsToSearch; 1)
							ARRAY LONGINT:C221($_al_LevelToSearchNum; 1)
							//: (QV_at_LevelOptions{$_l_Index}="Less than")
						: (QV_at_LevelOptions{$_l_Index}="Less than") | (QV_at_LevelOptions{$_l_Index}="<")
							$_l_CurrentElement:=0
							For ($_l_LevelsIndex; 1; Size of array:C274(QV_al_Levels))
								If (QV_al_Levels{$_l_LevelsIndex}<QV_al_QualityLevelLevels{$_l_Index})
									$_l_CurrentElement:=$_l_CurrentElement+1
									$_l_LevelRow:=Find in array:C230(QV_at_QualityLevels; String:C10(QV_al_Levels{$_l_LevelsIndex}))
									If ($_l_LevelRow<0)
										$_l_ItemID:=AA_ListAddItembyID($_l_ListID; String:C10(QV_al_Levels{$_l_LevelsIndex}))
										AA_LoadListbyID($_l_ListID; ->QV_at_QualityLevels; ->QV_al_QualityLevels; False:C215)
										
										ARRAY LONGINT:C221($_al_LevelsToSearch; Size of array:C274(QV_al_QualityLevels))
										ARRAY LONGINT:C221($_al_LevelToSearchNum; Size of array:C274(QV_al_QualityLevels))
										
									Else 
										$_l_ItemID:=QV_al_QualityLevels{$_l_LevelRow}
									End if 
									$_l_LevelRow:=Find in array:C230(QV_at_QualitySubLevels; String:C10(QV_al_Levels{$_l_LevelsIndex}))
									If ($_l_LevelRow<0)
										$_l_ItemID:=AA_ListAddItembyID(QV_l_SublevelslistID; String:C10(QV_al_Levels{$_l_LevelsIndex}))
										AA_LoadListbyID(QV_l_SublevelslistID; ->QV_at_QualitySubLevels; ->QV_al_QualitySubLevels; False:C215)
										
									Else 
										$_l_ItemID:=QV_al_QualitySubLevels{$_l_LevelRow}
									End if 
									
									$_al_LevelsToSearch{$_l_CurrentElement}:=$_l_ItemID
									$_al_LevelToSearchNum{$_l_CurrentElement}:=QV_al_Levels{$_l_LevelsIndex}
								Else 
									$_l_LevelsIndex:=Size of array:C274(QV_al_Levels)
								End if 
								
							End for 
							ARRAY LONGINT:C221($_al_LevelsToSearch; $_l_CurrentElement)
							ARRAY LONGINT:C221($_al_LevelToSearchNum; $_l_CurrentElement)
							//: (QV_at_LevelOptions{$_l_Index}="Less than or Equal to")
						: (QV_at_LevelOptions{$_l_Index}="Less than or Equal to") | (QV_at_LevelOptions{$_l_Index}="<=")
							$_l_CurrentElement:=0
							For ($_l_LevelsIndex; 1; Size of array:C274(QV_al_Levels))
								If (QV_al_Levels{$_l_LevelsIndex}<=QV_al_QualityLevelLevels{$_l_Index})
									$_l_CurrentElement:=$_l_CurrentElement+1
									$_l_LevelRow:=Find in array:C230(QV_at_QualityLevels; String:C10(QV_al_Levels{$_l_LevelsIndex}))
									If ($_l_LevelRow<0)
										$_l_ItemID:=AA_ListAddItembyID($_l_ListID; String:C10(QV_al_Levels{$_l_LevelsIndex}))
										AA_LoadListbyID($_l_ListID; ->QV_at_QualityLevels; ->QV_al_QualityLevels; False:C215)
										
										ARRAY LONGINT:C221($_al_LevelsToSearch; Size of array:C274(QV_al_QualityLevels))
										ARRAY LONGINT:C221($_al_LevelToSearchNum; Size of array:C274(QV_al_QualityLevels))
										
									Else 
										$_l_ItemID:=QV_al_QualityLevels{$_l_LevelRow}
									End if 
									$_l_LevelRow:=Find in array:C230(QV_at_QualitySubLevels; String:C10(QV_al_Levels{$_l_LevelsIndex}))
									If ($_l_LevelRow<0)
										$_l_ItemID:=AA_ListAddItembyID(QV_l_SublevelslistID; String:C10(QV_al_Levels{$_l_LevelsIndex}))
										AA_LoadListbyID(QV_l_SublevelslistID; ->QV_at_QualitySubLevels; ->QV_al_QualitySubLevels; False:C215)
										
									Else 
										$_l_ItemID:=QV_al_QualitySubLevels{$_l_LevelRow}
									End if 
									
									$_al_LevelsToSearch{$_l_CurrentElement}:=$_l_ItemID
									$_al_LevelToSearchNum{$_l_CurrentElement}:=QV_al_Levels{$_l_LevelsIndex}
								Else 
									$_l_LevelsIndex:=Size of array:C274(QV_al_Levels)
								End if 
								
							End for 
							ARRAY LONGINT:C221($_al_LevelToSearchNum; $_l_CurrentElement)
							ARRAY LONGINT:C221($_al_LevelsToSearch; $_l_CurrentElement)
							//: (QV_at_LevelOptions{$_l_Index}="Greater than")
						: (QV_at_LevelOptions{$_l_Index}="Greater than") | (QV_at_LevelOptions{$_l_Index}=">")
							$_l_CurrentElement:=0
							For ($_l_LevelsIndex; Size of array:C274(QV_al_Levels); 1; -1)
								If (QV_al_Levels{$_l_LevelsIndex}>QV_al_QualityLevelLevels{$_l_Index})
									$_l_CurrentElement:=$_l_CurrentElement+1
									$_l_LevelRow:=Find in array:C230(QV_at_QualityLevels; String:C10(QV_al_Levels{$_l_LevelsIndex}))
									If ($_l_LevelRow<0)
										$_l_ItemID:=AA_ListAddItembyID($_l_ListID; String:C10(QV_al_Levels{$_l_LevelsIndex}))
										AA_LoadListbyID($_l_ListID; ->QV_at_QualityLevels; ->QV_al_QualityLevels; False:C215)
										
										ARRAY LONGINT:C221($_al_LevelsToSearch; Size of array:C274(QV_al_QualityLevels))
										ARRAY LONGINT:C221($_al_LevelToSearchNum; Size of array:C274(QV_al_QualityLevels))
										
									Else 
										$_l_ItemID:=QV_al_QualityLevels{$_l_LevelRow}
									End if 
									$_l_LevelRow:=Find in array:C230(QV_at_QualitySubLevels; String:C10(QV_al_Levels{$_l_LevelsIndex}))
									If ($_l_LevelRow<0)
										$_l_ItemID:=AA_ListAddItembyID(QV_l_SublevelslistID; String:C10(QV_al_Levels{$_l_LevelsIndex}))
										AA_LoadListbyID(QV_l_SublevelslistID; ->QV_at_QualitySubLevels; ->QV_al_QualitySubLevels; False:C215)
										
									Else 
										$_l_ItemID:=QV_al_QualitySubLevels{$_l_LevelRow}
									End if 
									
									$_al_LevelsToSearch{$_l_CurrentElement}:=$_l_ItemID
									$_al_LevelToSearchNum{$_l_CurrentElement}:=QV_al_Levels{$_l_LevelsIndex}
								Else 
									$_l_LevelsIndex:=1
								End if 
								
							End for 
							ARRAY LONGINT:C221($_al_LevelsToSearch; $_l_CurrentElement)
							ARRAY LONGINT:C221($_al_LevelToSearchNum; $_l_CurrentElement)
							//: (QV_at_LevelOptions{$_l_Index}="Greater than or Equal to")
						: (QV_at_LevelOptions{$_l_Index}="Greater than or Equal to") | (QV_at_LevelOptions{$_l_Index}=">=")
							$_l_CurrentElement:=0
							For ($_l_LevelsIndex; Size of array:C274(QV_al_Levels); 1; -1)
								If (QV_al_Levels{$_l_LevelsIndex}>=QV_al_QualityLevelLevels{$_l_Index})
									$_l_CurrentElement:=$_l_CurrentElement+1
									$_l_LevelRow:=Find in array:C230(QV_at_QualityLevels; String:C10(QV_al_Levels{$_l_LevelsIndex}))
									If ($_l_LevelRow<0)
										$_l_ItemID:=AA_ListAddItembyID($_l_ListID; String:C10(QV_al_Levels{$_l_LevelsIndex}))
										AA_LoadListbyID($_l_ListID; ->QV_at_QualityLevels; ->QV_al_QualityLevels; False:C215)
										ARRAY LONGINT:C221($_al_LevelsToSearch; Size of array:C274(QV_al_QualityLevels))
										ARRAY LONGINT:C221($_al_LevelToSearchNum; Size of array:C274(QV_al_QualityLevels))
										
									Else 
										$_l_ItemID:=QV_al_QualityLevels{$_l_LevelRow}
									End if 
									$_l_LevelRow:=Find in array:C230(QV_at_QualitySubLevels; String:C10(QV_al_Levels{$_l_LevelsIndex}))
									If ($_l_LevelRow<0)
										$_l_ItemID:=AA_ListAddItembyID(QV_l_SublevelslistID; String:C10(QV_al_Levels{$_l_LevelsIndex}))
										AA_LoadListbyID(QV_l_SublevelslistID; ->QV_at_QualitySubLevels; ->QV_al_QualitySubLevels; False:C215)
										
									Else 
										$_l_ItemID:=QV_al_QualitySubLevels{$_l_LevelRow}
									End if 
									
									$_al_LevelsToSearch{$_l_CurrentElement}:=$_l_ItemID
									$_al_LevelToSearchNum{$_l_CurrentElement}:=QV_al_Levels{$_l_LevelsIndex}
								Else 
									$_l_LevelsIndex:=1
								End if 
								
							End for 
							ARRAY LONGINT:C221($_al_LevelsToSearch; $_l_CurrentElement)
							ARRAY LONGINT:C221($_al_LevelToSearchNum; $_l_CurrentElement)
					End case 
					
					CREATE EMPTY SET:C140(Table:C252($1)->; "MULTIUNION")
					USE SET:C118("QVTEMPADD")
					CREATE EMPTY SET:C140(Table:C252($1)->; "QVTEMPADD3")
					For ($_l_LevelsIndex; 1; Size of array:C274($_al_LevelsToSearch))
						If ($_bo_Rebuild)
							//force rebuild  list
							READ WRITE:C146([USER_SETS:105])
							QUERY:C277([USER_SETS:105]; [USER_SETS:105]SET_ID:3=$_al_LevelsToSearch{$_l_LevelsIndex}; *)
							QUERY:C277([USER_SETS:105];  & ; [USER_SETS:105]Set_Table:5=$_l_Table)
							If (Records in selection:C76([USER_SETS:105])>0)
								DELETE SELECTION:C66([USER_SETS:105])
							End if 
						End if 
						READ ONLY:C145([USER_SETS:105])
						QUERY:C277([USER_SETS:105]; [USER_SETS:105]SET_ID:3=$_al_LevelsToSearch{$_l_LevelsIndex}; *)
						QUERY:C277([USER_SETS:105];  & ; [USER_SETS:105]Set_Table:5=$_l_Table)
						
						If (Records in selection:C76([USER_SETS:105])>1)
							READ WRITE:C146([USER_SETS:105])
							QUERY:C277([USER_SETS:105]; [USER_SETS:105]SET_ID:3=$_al_LevelsToSearch{$_l_LevelsIndex}; *)
							QUERY:C277([USER_SETS:105];  & ; [USER_SETS:105]Set_Table:5=$_l_Table)
							DELETE SELECTION:C66([USER_SETS:105])
							READ ONLY:C145([USER_SETS:105])
						End if 
						If (Records in selection:C76([USER_SETS:105])=0)
							QV_UpdateSet($_l_Table; $_al_LevelsToSearch{$_l_LevelsIndex}; 0; False:C215; 2)
							QUERY:C277([USER_SETS:105]; [USER_SETS:105]SET_ID:3=$_al_LevelsToSearch{$_l_LevelsIndex}; *)
							QUERY:C277([USER_SETS:105];  & ; [USER_SETS:105]Set_Table:5=$_l_Table)
						End if 
						$_l_x:=Find in array:C230(QV_al_QualityLevels; $_al_LevelsToSearch{$_l_LevelsIndex})
						QUERY:C277([INFORMATION:55]; [INFORMATION:55]QualityID:14=QV_al_QualityIDs{$_l_Index}; *)
						QUERY:C277([INFORMATION:55];  & ; [INFORMATION:55]RelatedTableNumber:11=$_l_Table; *)
						QUERY:C277([INFORMATION:55];  & ; [INFORMATION:55]Information_Level:4=$_al_LevelToSearchNum{$_l_LevelsIndex}; *)
						
						QUERY:C277([INFORMATION:55];  & ; [INFORMATION:55]Deleted:10=0)
						$_l_ExpectedResults:=Records in selection:C76([INFORMATION:55])
						UNLOAD RECORD:C212([INFORMATION:55])
						
						QV_loadset($1; "QVTEMPADD2")
						If (Records in set:C195("QVTEMPADD2")#$_l_ExpectedResults)
							READ WRITE:C146([USER_SETS:105])
							QUERY:C277([USER_SETS:105]; [USER_SETS:105]SET_ID:3=$_al_LevelsToSearch{$_l_LevelsIndex}; *)
							QUERY:C277([USER_SETS:105];  & ; [USER_SETS:105]Set_Table:5=$_l_Table)
							If (Records in selection:C76([USER_SETS:105])>0)
								DELETE SELECTION:C66([USER_SETS:105])
							End if 
							QV_UpdateSet($_l_Table; $_al_LevelsToSearch{$_l_LevelsIndex}; 0; False:C215; 2)
							QUERY:C277([USER_SETS:105]; [USER_SETS:105]SET_ID:3=$_al_LevelsToSearch{$_l_LevelsIndex}; *)
							QUERY:C277([USER_SETS:105];  & ; [USER_SETS:105]Set_Table:5=$_l_Table)
							QV_loadset($1; "QVTEMPADD2")
						End if 
						
						INTERSECTION:C121("QVTEMPADD"; "QVTEMPADD2"; "QVTEMPADD3")
						If (Not:C34($_bo_LevelExclude))
							UNION:C120("MULTIUNION"; "QVTEMPADD3"; "MULTIUNION")
						Else 
							//there is only one level in an exclude
							DIFFERENCE:C122("QVTEMPADD"; "MULTIUNION"; "MULTIUNION")
						End if 
						
					End for 
					USE SET:C118("MULTIUNION")
					CREATE SET:C116(Table:C252($1)->; "QVTEMPADD")
					
					
				End if 
				$_bo_YearExclude:=False:C215
				If (QV_al_QualityQualityYears{$_l_Index}>0)  //NG Checked April 2020
					ARRAY TEXT:C222(QV_at_ListQualityYears; 0)
					ARRAY LONGINT:C221(QV_al_ListQualityYears; 0)
					$_l_ListID:=AA_LoadListByName("Information Years"; ->QV_at_ListQualityYears; ->QV_al_ListQualityYears; False:C215)
					ARRAY LONGINT:C221($_al_YearsToSearch; Size of array:C274(QV_al_ListQualityYears))
					//````
					QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ListName:2="SubYears_"+String:C10(QV_al_QualityIDs{$_l_Index}))
					If (Records in selection:C76([X_LISTS:111])=0)  //this make a sublist------but a hidden one
						CREATE RECORD:C68([X_LISTS:111])
						[X_LISTS:111]x_ListName:2:="SubYears_"+String:C10(QV_al_QualityIDs{$_l_Index})
						AA_SetListProperty("ACCESS"; 32)
						DB_SaveRecord(->[X_LISTS:111])
						QV_l_SubYearslistID:=[X_LISTS:111]x_ID:1
					Else 
						QV_l_SubYearslistID:=[X_LISTS:111]x_ID:1
					End if 
					ARRAY TEXT:C222(QV_at_QualitySubYears; 0)
					ARRAY LONGINT:C221(QV_al_QualitySubYears; 0)
					AA_LoadListbyID(QV_l_SubYearslistID; ->QV_at_QualitySubYears; ->QV_al_QualitySubYears; False:C215)
					
					//```
					Case of 
						: (QV_at_YearOptions{$_l_Index}="Equal to") | (QV_at_YearOptions{$_l_Index}="Not Equal to")
							$_bo_YearExclude:=(QV_at_YearOptions{$_l_Index}="Not Equal to")
							$_l_YearRow:=Find in array:C230(QV_at_ListQualityYears; String:C10(QV_al_QualityQualityYears{$_l_Index}))
							If ($_l_YearRow<0)
								$_l_ItemID:=AA_ListAddItembyID($_l_ListID; String:C10(QV_al_QualityQualityYears{$_l_Index}))  //NG Checked April 2020
								ARRAY LONGINT:C221($_al_YearsToSearch; Size of array:C274(QV_al_ListQualityYears))
							Else 
								$_l_ItemID:=QV_al_ListQualityYears{$_l_YearRow}
							End if 
							$_l_YearRow:=Find in array:C230(QV_at_QualitySubYears; String:C10(QV_al_QualityQualityYears{$_l_Index}))  //NG Checked April 2020
							If ($_l_YearRow<0)
								$_l_ItemID:=AA_ListAddItembyID(QV_l_SubYearslistID; String:C10(QV_al_QualityLevelLevels{$_l_Index}))
								AA_LoadListbyID(QV_l_SubYearslistID; ->QV_at_QualitySubYears; ->QV_al_QualitySubYears; False:C215)
								
							Else 
								$_l_ItemID:=QV_al_QualitySubYears{$_l_YearRow}
							End if 
							
							$_al_YearsToSearch{1}:=$_l_ItemID
							ARRAY LONGINT:C221($_al_YearsToSearch; 1)
						: (QV_at_YearOptions{$_l_Index}="Less than")
							$_l_CurrentElement:=0
							For ($_l_LevelsIndex; 1; Size of array:C274(QV_al_ListQualityYears))
								If (QV_al_ListQualityYears{$_l_LevelsIndex}<QV_al_QualityQualityYears{$_l_Index})  //NG CHecked April 2020
									$_l_CurrentElement:=$_l_CurrentElement+1
									$_l_YearRow:=Find in array:C230(QV_al_QualityQualityYears; String:C10(QV_al_ListQualityYears{$_l_LevelsIndex}))  //NG CHecked April 2020
									If ($_l_YearRow<0)
										$_l_ItemID:=AA_ListAddItembyID($_l_ListID; String:C10(QV_al_ListQualityYears{$_l_LevelsIndex}))
										ARRAY LONGINT:C221($_al_YearsToSearch; Size of array:C274(QV_al_ListQualityYears))
									Else 
										$_l_ItemID:=QV_al_ListQualityYears{$_l_YearRow}
									End if 
									$_l_YearRow:=Find in array:C230(QV_at_QualitySubYears; String:C10(QV_al_ListQualityYears{$_l_LevelsIndex}))
									If ($_l_YearRow<0)
										$_l_ItemID:=AA_ListAddItembyID(QV_l_SubYearslistID; String:C10(QV_al_ListQualityYears{$_l_LevelsIndex}))
										AA_LoadListbyID(QV_l_SubYearslistID; ->QV_at_QualitySubYears; ->QV_al_QualitySubYears; False:C215)
										
									Else 
										$_l_ItemID:=QV_al_QualitySubYears{$_l_YearRow}
									End if 
									
									$_al_YearsToSearch{$_l_CurrentElement}:=$_l_ItemID
								Else 
									$_l_LevelsIndex:=Size of array:C274(QV_al_ListQualityYears)
								End if 
							End for 
							ARRAY LONGINT:C221($_al_YearsToSearch; $_l_CurrentElement)
						: (QV_at_YearOptions{$_l_Index}="Less than or Equal to")
							$_l_CurrentElement:=0
							For ($_l_LevelsIndex; 1; Size of array:C274(QV_al_ListQualityYears))
								If (QV_al_ListQualityYears{$_l_LevelsIndex}<=QV_al_QualityQualityYears{$_l_Index})  //NG Checked April 2020
									$_l_CurrentElement:=$_l_CurrentElement+1
									$_l_YearRow:=Find in array:C230(QV_at_ListQualityYears; String:C10(QV_al_ListQualityYears{$_l_LevelsIndex}))
									If ($_l_YearRow<0)
										$_l_ItemID:=AA_ListAddItembyID($_l_ListID; String:C10(QV_al_ListQualityYears{$_l_LevelsIndex}))
										ARRAY LONGINT:C221($_al_YearsToSearch; Size of array:C274(QV_al_ListQualityYears))
									Else 
										$_l_ItemID:=QV_al_ListQualityYears{$_l_YearRow}
									End if 
									$_l_YearRow:=Find in array:C230(QV_at_QualitySubYears; String:C10(QV_al_ListQualityYears{$_l_LevelsIndex}))
									If ($_l_YearRow<0)
										$_l_ItemID:=AA_ListAddItembyID(QV_l_SubYearslistID; String:C10(QV_al_ListQualityYears{$_l_LevelsIndex}))
										AA_LoadListbyID(QV_l_SubYearslistID; ->QV_at_QualitySubYears; ->QV_al_QualitySubYears; False:C215)
										
									Else 
										$_l_ItemID:=QV_al_QualitySubYears{$_l_YearRow}
									End if 
									
									$_al_YearsToSearch{$_l_CurrentElement}:=$_l_ItemID
								Else 
									$_l_LevelsIndex:=Size of array:C274(QV_al_ListQualityYears)
								End if 
							End for 
							ARRAY LONGINT:C221($_al_YearsToSearch; $_l_CurrentElement)
						: (QV_at_YearOptions{$_l_Index}="Greater than")
							$_l_CurrentElement:=0
							For ($_l_LevelsIndex; Size of array:C274(QV_al_ListQualityYears); 1; -1)
								If (QV_al_ListQualityYears{$_l_LevelsIndex}>QV_al_QualityQualityYears{$_l_Index})  //NG Checked April 2020
									$_l_CurrentElement:=$_l_CurrentElement+1
									$_l_YearRow:=Find in array:C230(QV_at_ListQualityYears; String:C10(QV_al_ListQualityYears{$_l_LevelsIndex}))
									If ($_l_YearRow<0)
										$_l_ItemID:=AA_ListAddItembyID($_l_ListID; String:C10(QV_al_ListQualityYears{$_l_LevelsIndex}))
										ARRAY LONGINT:C221($_al_YearsToSearch; Size of array:C274(QV_al_ListQualityYears))
									Else 
										$_l_ItemID:=QV_al_ListQualityYears{$_l_YearRow}
									End if 
									$_l_YearRow:=Find in array:C230(QV_at_QualitySubYears; String:C10(QV_al_ListQualityYears{$_l_LevelsIndex}))
									If ($_l_YearRow<0)
										$_l_ItemID:=AA_ListAddItembyID(QV_l_SubYearslistID; String:C10(QV_al_ListQualityYears{$_l_LevelsIndex}))
										AA_LoadListbyID(QV_l_SubYearslistID; ->QV_at_QualitySubYears; ->QV_al_QualitySubYears; False:C215)
										
									Else 
										$_l_ItemID:=QV_al_QualitySubYears{$_l_YearRow}
									End if 
									
									$_al_YearsToSearch{$_l_CurrentElement}:=$_l_ItemID
								Else 
									$_l_LevelsIndex:=1
								End if 
							End for 
							ARRAY LONGINT:C221($_al_YearsToSearch; $_l_CurrentElement)
						: (QV_at_YearOptions{$_l_Index}="Greater than or Equal to")
							$_l_CurrentElement:=0
							For ($_l_LevelsIndex; Size of array:C274(QV_al_ListQualityYears); 1; -1)
								If (QV_al_ListQualityYears{$_l_LevelsIndex}>=QV_al_QualityQualityYears{$_l_Index})  //NG Checked April 2020
									$_l_CurrentElement:=$_l_CurrentElement+1
									$_l_YearRow:=Find in array:C230(QV_at_ListQualityYears; String:C10(QV_al_ListQualityYears{$_l_LevelsIndex}))
									If ($_l_YearRow<0)
										$_l_ItemID:=AA_ListAddItembyID($_l_ListID; String:C10(QV_al_ListQualityYears{$_l_LevelsIndex}))
										ARRAY LONGINT:C221($_al_YearsToSearch; Size of array:C274(QV_al_ListQualityYears))
									Else 
										$_l_ItemID:=QV_al_ListQualityYears{$_l_YearRow}
									End if 
									$_l_YearRow:=Find in array:C230(QV_at_QualitySubYears; String:C10(QV_al_ListQualityYears{$_l_LevelsIndex}))
									If ($_l_YearRow<0)
										$_l_ItemID:=AA_ListAddItembyID(QV_l_SubYearslistID; String:C10(QV_al_ListQualityYears{$_l_LevelsIndex}))
										AA_LoadListbyID(QV_l_SubYearslistID; ->QV_at_QualitySubYears; ->QV_al_QualitySubYears; False:C215)
										
									Else 
										$_l_ItemID:=QV_al_QualitySubYears{$_l_YearRow}
									End if 
									
									$_al_YearsToSearch{$_l_CurrentElement}:=$_l_ItemID
								Else 
									$_l_LevelsIndex:=1
								End if 
							End for 
							ARRAY LONGINT:C221($_al_YearsToSearch; $_l_CurrentElement)
					End case 
					CREATE EMPTY SET:C140(Table:C252($1)->; "MULTIUNION")
					CREATE EMPTY SET:C140(Table:C252($1)->; "QVTEMPADD3")
					For ($_l_YearsIndex; 1; Size of array:C274($_al_YearsToSearch))
						QUERY:C277([INFORMATION:55]; [INFORMATION:55]QualityID:14=QV_al_QualityIDs{$_l_Index}; *)
						QUERY:C277([INFORMATION:55];  & ; [INFORMATION:55]RelatedTableNumber:11=$_l_Table; *)
						QUERY:C277([INFORMATION:55];  & ; [INFORMATION:55]Year:5=Num:C11(QV_at_ListQualityYears{$_l_YearsIndex}); *)
						QUERY:C277([INFORMATION:55];  & ; [INFORMATION:55]Deleted:10=0)
						$_l_ExpectedResults:=Records in selection:C76([INFORMATION:55])
						
						If ($_bo_Rebuild)
							//force rebuild  list
							READ WRITE:C146([USER_SETS:105])
							QUERY:C277([USER_SETS:105]; [USER_SETS:105]SET_ID:3=$_al_YearsToSearch{$_l_YearsIndex}; *)
							QUERY:C277([USER_SETS:105];  & ; [USER_SETS:105]Set_Table:5=$_l_Table)
							If (Records in selection:C76([USER_SETS:105])>0)
								DELETE SELECTION:C66([USER_SETS:105])
							End if 
						End if 
						READ ONLY:C145([USER_SETS:105])
						QUERY:C277([USER_SETS:105]; [USER_SETS:105]SET_ID:3=$_al_YearsToSearch{$_l_YearsIndex}; *)
						QUERY:C277([USER_SETS:105];  & ; [USER_SETS:105]Set_Table:5=$_l_Table)
						
						If (Records in selection:C76([USER_SETS:105])>1)
							READ WRITE:C146([USER_SETS:105])
							QUERY:C277([USER_SETS:105]; [USER_SETS:105]SET_ID:3=$_al_YearsToSearch{$_l_YearsIndex}; *)
							QUERY:C277([USER_SETS:105];  & ; [USER_SETS:105]Set_Table:5=$_l_Table)
							DELETE SELECTION:C66([USER_SETS:105])
							READ ONLY:C145([USER_SETS:105])
						End if 
						If (Records in selection:C76([USER_SETS:105])=0)
							QV_UpdateSet($_l_Table; $_al_YearsToSearch{$_l_YearsIndex}; 0; False:C215; 3)
							QUERY:C277([USER_SETS:105]; [USER_SETS:105]SET_ID:3=$_al_YearsToSearch{$_l_YearsIndex}; *)
							QUERY:C277([USER_SETS:105];  & ; [USER_SETS:105]Set_Table:5=$_l_Table)
						End if 
						QV_loadset($1; "QVTEMPADD2")
						If (Records in set:C195("QVTEMPADD2")#$_l_ExpectedResults)
							READ WRITE:C146([USER_SETS:105])
							QUERY:C277([USER_SETS:105]; [USER_SETS:105]SET_ID:3=$_al_YearsToSearch{$_l_YearsIndex}; *)
							QUERY:C277([USER_SETS:105];  & ; [USER_SETS:105]Set_Table:5=$_l_Table)
							If (Records in selection:C76([USER_SETS:105])>0)
								DELETE SELECTION:C66([USER_SETS:105])
							End if 
							QV_UpdateSet($_l_Table; $_al_YearsToSearch{$_l_YearsIndex}; 0; False:C215; 3)
							QUERY:C277([USER_SETS:105]; [USER_SETS:105]SET_ID:3=$_al_YearsToSearch{$_l_YearsIndex}; *)
							QUERY:C277([USER_SETS:105];  & ; [USER_SETS:105]Set_Table:5=$_l_Table)
							
							QV_loadset($1; "QVTEMPADD2")
						End if 
						
						INTERSECTION:C121("QVTEMPADD"; "QVTEMPADD2"; "QVTEMPADD3")
						
						If (Not:C34($_bo_YearExclude))
							UNION:C120("MULTIUNION"; "QVTEMPADD3"; "MULTIUNION")
						Else 
							DIFFERENCE:C122("QVTEMPADD"; "MULTIUNION"; "MULTIUNION")
						End if 
					End for 
					USE SET:C118("MULTIUNION")
					CREATE EMPTY SET:C140(Table:C252($1)->; "QVTEMPADD")
					
				End if 
			End if 
			
		End if 
		
		UNION:C120("QVTEMPEXCLUDE"; "QVTEMPADD"; "QVTEMPEXCLUDE")
		If (QV_bo_ReturnQuals)
			UNION:C120("QVrecordsExclude"; "QVrecords2"; "QVrecordsExclude")
			CLEAR SET:C117("QVrecords2")
		End if 
	End if 
	
	//get the set
	//always add these together
	
End for 
//Finally take the Excludes away
If (Records in set:C195("QVTEMPEXCLUDE")>0)
	DIFFERENCE:C122("QVTEMP"; "QVTEMPEXCLUDE"; "QVTEMP")
	If (Records in set:C195("QVrecordsExclude")>0)
		DIFFERENCE:C122("QVRecords"; "QVRecordsExclude"; "QVRecords")
	End if 
End if 

//USE SET("QVTEMP")
ERR_MethodTrackerReturn("QV_DoSearch"; $_t_oldMethodName)
