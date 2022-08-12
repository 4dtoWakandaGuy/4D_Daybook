//%attributes = {}
If (False:C215)
	//Project Method Name:      QV_SaveFromMultiAdd
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/01/2010 10:08
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
	//ARRAY LONGINT(QV_al_GroupIDs;0)
	//ARRAY LONGINT(QV_al_QualityGroupsIDs;0)
	//ARRAY LONGINT(QV_al_QualityIDs;0)
	//ARRAY LONGINT(QV_al_QualityLevelLevels;0)
	//ARRAY LONGINT(QV_al_QualityPropertiesNUM;0;0)
	//ARRAY LONGINT(QV_al_QualityQualityYears;0)
	//ARRAY LONGINT(QV_al_QualitySubGroupsIDs;0)
	//ARRAY LONGINT(QV_al_TableRestrictionIDs;0)
	//ARRAY LONGINT(QV_at_QualityYears;0)
	//ARRAY TEXT(QV_at_GroupNames;0)
	//ARRAY TEXT(QV_at_QualityGroups;0)
	//ARRAY TEXT(QV_at_QualityGroupsNM;0)
	//ARRAY TEXT(QV_at_QualityNames;0)
	//ARRAY TEXT(QV_at_QualityProperties;0;0)
	//ARRAY TEXT(QV_at_QualityPropertiesNAM;0;0)
	//ARRAY TEXT(QV_at_QualitySubGroups;0)
	//ARRAY TEXT(QV_at_QualitySubGroupsNM;0)
	//ARRAY TEXT(QV_at_TableRestrictionNMs;0)
	C_LONGINT:C283($_l_ListID; $_l_PropertyColumn; $_l_QualitiesIndex; $_l_Restriction; $_l_RestrictionsListID; $_l_RestrictionTableID; $_l_RestrictionTableRow; $_l_SublistID; $_l_SublistIndex; $_l_SubListNUM; QV_l_DisplayedOwnerTableID)
	C_LONGINT:C283(QV_l_QualityYear; QV_l_SelectedQualityID; $_l_GroupsIndex; $_l_ListID; $_l_PropertyColumn; $_l_QualitiesIndex; $_l_Restriction; $_l_RestrictionsListID; $_l_RestrictionTableID; $_l_RestrictionTableRow; $_l_SublistID)
	C_LONGINT:C283($_l_SublistIndex; $_l_SubListNUM; QV_HL_QUALITIESLIST2; QV_l_DisplayedOwnerTableID; QV_l_QualityYear; QV_l_SelectedQualityID)
	C_REAL:C285(QV_R_QualityLevel)
	C_TEXT:C284(QV_T_MultiADD; QV_t_QualitiesGroupName; QV_t_QualityDescription; QV_t_QualityName; $_t_oldMethodName; QV_T_MultiADD; QV_t_QualitiesGroupName; QV_t_QualityDescription; QV_t_QualityName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("QV_SaveFromMultiAdd")
$_l_RestrictionsListID:=AA_GetListbyName("Table Restriction"; True:C214)
ARRAY LONGINT:C221(QV_al_TableRestrictionIDs; 0)
ARRAY TEXT:C222(QV_at_TableRestrictionNMs; 0)
AA_LoadListbyID($_l_RestrictionsListID; ->QV_at_TableRestrictionNMs; ->QV_al_TableRestrictionIDs)
$_l_RestrictionTableID:=0

If (QV_l_DisplayedOwnerTableID>0)  //note :difference in this line compared to query window
	$_l_RestrictionTableRow:=Find in array:C230(QV_at_TableRestrictionNMs; Table name:C256(Table:C252(QV_l_DisplayedOwnerTableID)))
	If ($_l_RestrictionTableRow<0)
		$_l_RestrictionTableID:=AA_ListAddItembyID($_l_RestrictionsListID; Table name:C256(Table:C252(QV_l_DisplayedOwnerTableID)))
		AA_LoadListbyID($_l_RestrictionsListID; ->QV_at_TableRestrictionNMs; ->QV_al_TableRestrictionIDs)
	Else 
		$_l_RestrictionTableID:=QV_al_TableRestrictionIDs{$_l_RestrictionTableRow}
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
	$_l_PropertyColumn:=Find in array:C230(QV_at_QualityProperties{$_l_GroupsIndex}; "Table Restriction")
	$_l_Restriction:=0
	$_l_SubListNUM:=0
	//If ($_l_PropertyColumn>0)
	//$_l_Restriction:=QV_al_QualitySubGroupsIDs{$_l_GroupsIndex}{$_l_PropertyColumn}
	//End if 
	$_l_PropertyColumn:=Find in array:C230(QV_at_QualityProperties{$_l_GroupsIndex}; "Sublist")
	If ($_l_PropertyColumn>0)
		$_l_SubListNUM:=QV_al_QualityPropertiesNUM{$_l_GroupsIndex}{$_l_PropertyColumn}
	End if 
	If ($_l_SubListNUM>0)
		//just to be safe
		AA_LoadListbyID($_l_SubListNUM; ->QV_at_QualitySubGroupsNM; ->QV_al_QualitySubGroupsIDs; False:C215)
		If (Size of array:C274(QV_at_QualitySubGroupsNM)>0)
			//only now do we do any appends
			$_l_SublistID:=New list:C375
			For ($_l_SublistIndex; 1; Size of array:C274(QV_at_QualitySubGroupsNM))
				APPEND TO LIST:C376($_l_SublistID; QV_at_QualitySubGroupsNM{$_l_SublistIndex}; QV_al_QualitySubGroupsIDs{$_l_SublistIndex})
			End for 
			APPEND TO LIST:C376(QV_HL_QualitiesList2; QV_at_QualityGroupsNM{$_l_GroupsIndex}; QV_al_QualityGroupsIDs{$_l_GroupsIndex}; $_l_SublistID; True:C214)
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
ERR_MethodTrackerReturn("QV_SaveFromMultiAdd"; $_t_oldMethodName)
