//%attributes = {}
If (False:C215)
	//Project Method Name:      QV_SaveQualities
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
	//ARRAY DATE(QV_ad_QualityDate;0)
	//ARRAY LONGINT(AL_al_ListItemIDS;0)
	//ARRAY LONGINT(QV_al_QualityDeletions;0)
	//ARRAY LONGINT(QV_al_QualityID;0)
	//ARRAY LONGINT(QV_al_QualityParentID;0)
	//ARRAY LONGINT(QV_al_QualityRecordID;0)
	//ARRAY LONGINT(QV_al_QualityYear;0)
	//ARRAY LONGINT(QV_al_QualityYears;0)
	//ARRAY LONGINT(QV_al_RelatedRecordNum;0)
	//ARRAY REAL(QV_ar_QualityLevel;0)
	//ARRAY TEXT(AA_at_ListItems;0)
	//ARRAY TEXT(QV_at_QualityCode;0)
	//ARRAY TEXT(QV_at_QualityDetail;0)
	C_BOOLEAN:C305($_bo_Ask; $_bo_Continue; $4)
	C_LONGINT:C283($_l_Count; $_l_CountRecords; $_l_Index; $_l_ListID; $_l_ListID2; $_l_ListIDRow; $_l_ListItemRow; $_l_RecordsIndex; $_l_TableValue; $2; $3)
	C_LONGINT:C283(QV_l_LastParam2; QV_l_SelectedQualityID)
	C_POINTER:C301($_ptr_Field)
	C_TEXT:C284($_t_ListName; $_t_oldMethodName; QV_t_QualitiesOwnerName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("QV_SaveQualities")

If (Count parameters:C259<4)
	QV_SaveCurrentQuality(True:C214; QV_l_SelectedQualityID)
Else 
	QV_SaveCurrentQuality($4; QV_l_SelectedQualityID)
End if 
If (Count parameters:C259>=4)
	$_bo_Ask:=$4
Else 
	$_bo_Ask:=False:C215
End if 
If (Size of array:C274(QV_al_QualityDeletions)>0)
	If ($_bo_Ask)
		//check if there are any changes
		$_l_Count:=0
		For ($_l_Index; 1; Size of array:C274(QV_al_QualityDeletions))
			If (QV_al_QualityDeletions{$_l_Index}#0)
				$_l_Count:=$_l_Count+1
			End if 
		End for 
		If ($_l_Count>0)
			//ask the user about saving them
			Gen_Confirm("Save Qualitative Information for "+QV_t_QualitiesOwnerName+" ?"; "Yes"; "No")
			$_bo_Continue:=(OK=1)
		Else 
			//nothing to update
			$_bo_Continue:=False:C215
		End if 
	Else 
		$_bo_Continue:=True:C214
	End if 
	If ($_bo_Continue)
		For ($_l_Index; 1; Size of array:C274(QV_al_QualityDeletions))
			READ WRITE:C146([INFORMATION:55])
			Case of 
				: (QV_al_QualityDeletions{$_l_Index}=-1)
					//this item needs updating
					Case of 
						: (QV_al_RelatedRecordNum{$_l_Index}>0)
							QUERY:C277([INFORMATION:55]; [INFORMATION:55]QualityRecordID:16=QV_al_QualityRecordID{$_l_Index})
							If (Records in selection:C76([INFORMATION:55])=0)
								CREATE RECORD:C68([INFORMATION:55])
								[INFORMATION:55]QualityRecordID:16:=QV_al_QualityRecordID{$_l_Index}
							End if 
							[INFORMATION:55]Description:3:=QV_at_QualityDetail{$_l_Index}
							[INFORMATION:55]Information_Level:4:=QV_ar_QualityLevel{$_l_Index}
							[INFORMATION:55]Year:5:=QV_al_QualityYear{$_l_Index}  //NG Checked April 2020
							[INFORMATION:55]Information_Date:8:=QV_ad_QualityDate{$_l_Index}
							[INFORMATION:55]Information_Code:9:=QV_at_QualityCode{$_l_Index}
							[INFORMATION:55]RelateTableRecordNumber:13:=QV_al_RelatedRecordNum{$_l_Index}
							[INFORMATION:55]RelatedTableNumber:11:=$2
							[INFORMATION:55]RelatedTableFieldNum:12:=$3
							
							//NG-CHECK HERE
							[INFORMATION:55]QualityID:14:=QV_al_QualityID{$_l_Index}
							QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=[INFORMATION:55]QualityID:14)
							[INFORMATION:55]SubGroup:6:=[LIST_ITEMS:95]List_Entry:2
							[INFORMATION:55]QualityGroupID:15:=QV_al_QualityParentID{$_l_Index}
							$_l_ListID:=[LIST_ITEMS:95]X_ListID:4
							QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ID:1=$_l_ListID)
							If (Records in selection:C76([X_LISTS:111])>0)
								$_t_ListName:=[X_LISTS:111]x_ListName:2
								ARRAY TEXT:C222(AA_at_ListItems; 0)  //NG MARCH 2004 these were not here
								ARRAY LONGINT:C221(AL_al_ListItemIDS; 0)
								$_l_ListID:=AA_LoadListByName("Qualities"; ->AA_at_ListItems; ->AL_al_ListItemIDS; False:C215)
								$_l_ListItemRow:=Find in array:C230(AL_al_ListItemIDS; QV_al_QualityParentID{$_l_Index})
								If ($_l_ListItemRow<0)
									$_l_ListItemRow:=0
								End if 
								If (AA_at_ListItems{$_l_ListItemRow}#$_t_ListName)
									$_l_ListItemRow:=Find in array:C230(AA_at_ListItems; $_t_ListName)
								End if 
								If ($_l_ListItemRow>0)
									[INFORMATION:55]QualityGroupID:15:=AL_al_ListItemIDS{$_l_ListItemRow}
									[INFORMATION:55]Group:2:=$_t_ListName
								End if 
							End if 
							DB_SaveRecord(->[INFORMATION:55])
							AA_CheckFileUnlocked(->[INFORMATION:55]QualityRecordID:16)
							QV_l_LastParam2:=0
						: (QV_al_RelatedRecordNum{$_l_Index}<0)
							USE SET:C118("RecordSelection")
							FIRST RECORD:C50(Table:C252($2)->)
							$_l_CountRecords:=Records in selection:C76(Table:C252($2)->)
							$_ptr_Field:=Field:C253($2; $3)
							For ($_l_RecordsIndex; 1; $_l_CountRecords)
								$_l_TableValue:=$_ptr_Field->
								//we have to check it does not exist already
								QUERY:C277([INFORMATION:55]; [INFORMATION:55]RelatedTableNumber:11=$2)
								CREATE SET:C116([INFORMATION:55]; "T1")
								QUERY:C277([INFORMATION:55]; [INFORMATION:55]RelatedTableFieldNum:12=$3)
								CREATE SET:C116([INFORMATION:55]; "T2")
								QUERY:C277([INFORMATION:55]; [INFORMATION:55]RelateTableRecordNumber:13=$_l_TableValue)
								CREATE SET:C116([INFORMATION:55]; "T3")
								QUERY:C277([INFORMATION:55]; [INFORMATION:55]QualityID:14=QV_al_QualityID{$_l_Index})
								CREATE SET:C116([INFORMATION:55]; "T4")
								INTERSECTION:C121("T1"; "T2"; "T1")
								CLEAR SET:C117("T2")
								INTERSECTION:C121("T1"; "T3"; "T1")
								CLEAR SET:C117("T3")
								INTERSECTION:C121("T1"; "T4"; "T1")
								CLEAR SET:C117("T4")
								USE SET:C118("T1")
								QV_l_LastParam2:=0
								If (Records in selection:C76([INFORMATION:55])=0)
									CREATE RECORD:C68([INFORMATION:55])
									[INFORMATION:55]Description:3:=QV_at_QualityDetail{$_l_Index}
									[INFORMATION:55]Information_Level:4:=QV_ar_QualityLevel{$_l_Index}
									[INFORMATION:55]Year:5:=QV_al_QualityYear{$_l_Index}  //NG Checked April 2020
									[INFORMATION:55]Information_Date:8:=QV_ad_QualityDate{$_l_Index}
									[INFORMATION:55]Information_Code:9:=QV_at_QualityCode{$_l_Index}
									[INFORMATION:55]RelateTableRecordNumber:13:=$_l_TableValue
									[INFORMATION:55]RelatedTableNumber:11:=$2
									[INFORMATION:55]RelatedTableFieldNum:12:=$3
									[INFORMATION:55]QualityID:14:=QV_al_QualityID{$_l_Index}
									[INFORMATION:55]QualityGroupID:15:=QV_al_QualityParentID{$_l_Index}
									$_l_ListID2:=[LIST_ITEMS:95]X_ListID:4
									QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ID:1=$_l_ListID2)
									If (Records in selection:C76([X_LISTS:111])>0)
										$_t_ListName:=[X_LISTS:111]x_ListName:2
										$_l_ListID:=AA_LoadListByName("Qualities"; ->AA_at_ListItems; ->AL_al_ListItemIDS; False:C215)
										$_l_ListIDRow:=Find in array:C230(AL_al_ListItemIDS; QV_al_QualityParentID{$_l_Index})
										If ($_l_ListIDRow<0)
											$_l_ListIDRow:=0
										End if 
										If (AA_at_ListItems{$_l_ListIDRow}#$_t_ListName)
											$_l_ListIDRow:=Find in array:C230(AA_at_ListItems; $_t_ListName)
										End if 
										If ($_l_ListIDRow>0)
											[INFORMATION:55]QualityGroupID:15:=AL_al_ListItemIDS{$_l_ListIDRow}
											[INFORMATION:55]Group:2:=$_t_ListName
										End if 
									End if 
									
									DB_SaveRecord(->[INFORMATION:55])
									AA_CheckFileUnlocked(->[INFORMATION:55]QualityRecordID:16)
								Else 
									If ([INFORMATION:55]Deleted:10=1)
										[INFORMATION:55]Deleted:10:=0
										DB_SaveRecord(->[INFORMATION:55])
										AA_CheckFileUnlocked(->[INFORMATION:55]QualityRecordID:16)
									End if 
									
								End if 
								
								
								NEXT RECORD:C51(Table:C252($2)->)
								
							End for 
							
					End case 
					
				: (QV_al_QualityDeletions{$_l_Index}=1)
					QUERY:C277([INFORMATION:55]; [INFORMATION:55]QualityRecordID:16=QV_al_QualityRecordID{$_l_Index})
					If (Records in selection:C76([INFORMATION:55])>0)
						[INFORMATION:55]Deleted:10:=1
						DB_SaveRecord(->[INFORMATION:55])
						AA_CheckFileUnlocked(->[INFORMATION:55]QualityRecordID:16)
						QV_l_LastParam2:=0
						
					End if 
			End case 
		End for 
		UNLOAD RECORD:C212([INFORMATION:55])
		READ ONLY:C145([INFORMATION:55])
	End if 
End if 
//we have only updated the values that were changed
ERR_MethodTrackerReturn("QV_SaveQualities"; $_t_oldMethodName)
