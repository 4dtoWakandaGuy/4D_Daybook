//%attributes = {}
If (False:C215)
	//Project Method Name:      QV_SaveFromPowerview
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
	//ARRAY LONGINT(QV_al_GroupIDs;0)
	//ARRAY LONGINT(QV_al_QualityDeletions;0)
	//ARRAY LONGINT(QV_al_QualityLevelLevels;0)
	//ARRAY LONGINT(QV_al_QualityQualityYears;0)
	//ARRAY LONGINT(QV_al_QualityRecordID;0)
	//ARRAY LONGINT(QV_al_RecordIDs;0)
	//ARRAY TEXT(QV_at_QualityNames;0)
	C_BOOLEAN:C305($_bo_Expanded)
	C_LONGINT:C283($_l_Index; $_l_ItemReference; $_l_ListItemRow; $_l_SelectedListItem; $_l_SublistID; QV_HL_QualitiesList; QV_l_QualityYear; QV_l_SelectedQualityID)
	C_REAL:C285(QV_R_QualityLevel)
	C_TEXT:C284($_t_ItemText; $_t_oldMethodName; $1; QV_t_QualitiesGroupName; QV_t_QualityDescription; QV_t_QualityName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("QV_SaveFromPowerview")
//this method will save the values in the powerview area

For ($_l_Index; 1; Size of array:C274(QV_al_GroupIDs))
	If (QV_abo_include{$_l_Index}=True:C214)
		//have to test if already saved
		QV_l_SelectedQualityID:=-2
		//`````
		//QV_t_QualitiesGroupName:=QV_at_GroupNames{$_l_Index}
		QV_t_QualityName:=QV_at_QualityNames{$_l_Index}
		QV_t_QualityDescription:=""
		QV_R_QualityLevel:=QV_al_QualityLevelLevels{$_l_Index}
		QV_l_QualityYear:=QV_al_QualityQualityYears{$_l_Index}  //NG Checked April 2020 this was QV_at_QualityYears but a longint array
		If (QV_al_RecordIDs{$_l_Index}>0)
			QV_SaveCurrentQuality(False:C215; QV_al_RecordIDs{$_l_Index})
		Else 
			QV_SaveCurrentQuality(False:C215; -1)
		End if 
		
	Else 
		If (QV_abo_Exclude{$_l_Index}=True:C214)
			If (QV_al_RecordIDs{$_l_Index}>0)
				$_l_SelectedListItem:=Selected list items:C379(QV_HL_QualitiesList)
				If ($_l_SelectedListItem>0)
					GET LIST ITEM:C378(QV_HL_QualitiesList; $_l_SelectedListItem; $_l_ItemReference; $_t_ItemText; $_l_SublistID; $_bo_Expanded)
					$_l_ListItemRow:=Find in array:C230(QV_al_QualityRecordID; QV_al_RecordIDs{$_l_Index})
					If ($_l_ListItemRow>0)
						QV_al_QualityDeletions{$_l_ListItemRow}:=1
						DELETE FROM LIST:C624(QV_HL_QualitiesList; QV_al_RecordIDs{$_l_Index})
					End if 
				End if 
			End if 
			
		End if 
		
		
	End if 
End for 
QV_l_SelectedQualityID:=0
QV_t_QualitiesGroupName:=""
QV_t_QualityName:=""
QV_t_QualityDescription:=""
QV_R_QualityLevel:=0
QV_l_QualityYear:=0
ERR_MethodTrackerReturn("QV_SaveFromPowerview"; $_t_oldMethodName)
