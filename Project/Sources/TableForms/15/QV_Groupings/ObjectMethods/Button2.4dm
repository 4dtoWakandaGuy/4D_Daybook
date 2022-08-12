If (False:C215)
	//object Name: [USER]QV_Groupings.Button2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(QV_ai_Exclude;0)
	//ARRAY INTEGER(QV_ai_include;0)
	//ARRAY LONGINT(QV_al_GroupIDs;0)
	//ARRAY LONGINT(QV_al_LabelOrder;0)
	//ARRAY LONGINT(QV_al_QualityIDs;0)
	//ARRAY LONGINT(QV_al_QualityLevelLevels;0)
	//ARRAY LONGINT(QV_al_QualityQualityYears;0)
	//ARRAY LONGINT(QV_at_QualityYears;0)
	//ARRAY LONGINT(SM_al_SearchIDs;0)
	//ARRAY TEXT(QV_at_DisplayNames;0)
	//ARRAY TEXT(QV_at_GroupNames;0)
	//ARRAY TEXT(QV_at_LabelNames;0)
	//ARRAY TEXT(QV_at_LevelOptions;0)
	//ARRAY TEXT(QV_at_QualityNames;0)
	//ARRAY TEXT(QV_at_YearOptions;0)
	//ARRAY TEXT(SM_at_SearchNames;0)
	C_BLOB:C604(SM_blb_SearchBlob)
	C_BOOLEAN:C305(QV_bo_ExactQualityMatchOnly)
	C_LONGINT:C283($_l_Index; $_l_InsertFrom; $_l_LastSort; $_l_NumberToAdd; $_l_TableNumber; QV_HL_QualitiesList; QV_l_insertExistingGroupPos)
	C_TEXT:C284($_t_LastLabelName; $_t_oldMethodName; $_t_SearchGroupName; QV_t_DefaultGroup; QV_T_QualitiesAsText; QV_T_QualitiesDropText)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].QV_Groupings.Button2"; Form event code:C388)

QV_bo_ExactQualityMatchOnly:=True:C214  //added 25/08/06 - kmw
QV_ParseText(QV_T_QualitiesDropText)
QV_bo_ExactQualityMatchOnly:=False:C215  //added 25/08/06 - kmw

//NG here we need to resize the additional arrays..and populate them.
//QV_at_DisplayNames;-QV_at_LabelNames. They will default to using the Values of ,QV_at_QualityNames,QV_at_GroupNames.
If (QV_l_insertExistingGroupPos=-1)  //kmw 18/09/06 (something similar originally added to QV_l_Powerview 25/08)
	ARRAY TEXT:C222(QV_at_DisplayNames; Size of array:C274(QV_at_QualityNames))
	ARRAY TEXT:C222(QV_at_LabelNames; Size of array:C274(QV_at_GroupNames))
	ARRAY LONGINT:C221(QV_al_LabelOrder; Size of array:C274(QV_at_GroupNames))
Else   //kmw 18/09/06 (something similar originally added to QV_l_Powerview 25/08)
	$_l_NumberToAdd:=Size of array:C274(QV_at_QualityNames)-Size of array:C274(QV_at_DisplayNames)  //kmw 18/09/06
	$_l_InsertFrom:=QV_l_insertExistingGroupPos-($_l_NumberToAdd-1)  //kmw 20/09/06 - if more than one added then QV_l_insertExistingGroupPos will actually be one after the final element added so need to allow for this
	INSERT IN ARRAY:C227(QV_at_DisplayNames; $_l_InsertFrom; $_l_NumberToAdd)  //kmw 18/09/06 (something similar originally added to QV_l_Powerview 25/08)
	INSERT IN ARRAY:C227(QV_at_LabelNames; $_l_InsertFrom; $_l_NumberToAdd)  //kmw 18/09/06 (something similar originally added to QV_l_Powerview 25/08)
	INSERT IN ARRAY:C227(QV_al_LabelOrder; $_l_InsertFrom; $_l_NumberToAdd)  //kmw 18/09/06 (something similar originally added to QV_l_Powerview 25/08)
End if   //kmw 18/09/06 (something similar originally added to QV_l_Powerview 25/08)


$_l_TableNumber:=Table:C252(->[INFORMATION:55])

$_t_LastLabelName:=""
For ($_l_Index; 1; Size of array:C274(QV_at_DisplayNames))
	If (QV_at_DisplayNames{$_l_Index}="")
		If (QV_at_GroupNames{$_l_Index}="")
			//This is an item
			QV_at_DisplayNames{$_l_Index}:=QV_at_QualityNames{$_l_Index}
			QV_at_LabelNames{$_l_Index}:=$_t_LastLabelName
		Else 
			//This is a group
			If (QV_at_LabelNames{$_l_Index}="")
				QV_at_LabelNames{$_l_Index}:=QV_at_GroupNames{$_l_Index}
			End if 
			$_t_LastLabelName:=QV_at_LabelNames{$_l_Index}
		End if 
	Else 
		If (QV_at_LabelNames{$_l_Index}="")
			QV_at_LabelNames{$_l_Index}:=$_t_LastLabelName
		End if 
	End if 
End for 
$_l_LastSort:=0
For ($_l_Index; 1; Size of array:C274(QV_at_DisplayNames))
	If (QV_al_GroupIDs{$_l_Index}#0)
		If (QV_al_LabelOrder{$_l_Index}>$_l_LastSort)
			$_l_LastSort:=QV_al_LabelOrder{$_l_Index}
			
		End if 
	End if 
End for 
For ($_l_Index; 1; Size of array:C274(QV_at_DisplayNames))
	If (QV_al_GroupIDs{$_l_Index}#0)
		If (QV_al_LabelOrder{$_l_Index}=0)
			QV_al_LabelOrder{$_l_Index}:=$_l_LastSort+1
			$_l_LastSort:=$_l_LastSort+1
		End if 
	End if 
End for 
//AL_UpdateArrays (QV_l_Powerview;-2)

QV_T_QualitiesAsText:=""
//OK so here we want to save the group...
If (SM_at_SearchNames>0)
	Gen_Confirm("Save Changes to "+SM_at_SearchNames{SM_at_SearchNames}+"?"; "Yes"; "No")
	If (OK=1)
		SET BLOB SIZE:C606(SM_blb_SearchBlob; 0)
		SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->QV_at_GroupNames; ->QV_at_QualityNames; ->QV_al_GroupIDs; ->QV_al_QualityIDs; ->QV_al_QualityLevelLevels; ->QV_al_QualityQualityYears; ->QV_ai_include; ->QV_ai_Exclude; ->QV_at_LevelOptions; ->QV_at_YearOptions; ->QV_at_DisplayNames; ->QV_at_LabelNames; ->QV_al_LabelOrder)
		
		SM_SaveSearchParameters(Abs:C99(SM_al_SearchIDs{SM_at_SearchNames}); ""; $_l_TableNumber; -999; ->SM_blb_SearchBlob; -1)
		SM_at_SearchNames:=Find in array:C230(SM_al_SearchIDs; Abs:C99(SM_al_SearchIDs{SM_at_SearchNames}))
		
	End if 
Else 
	If (Size of array:C274(QV_at_GroupNames)>0)
		//Only do if there are settings created.
		If (QV_t_DefaultGroup="")
			Gen_Confirm("Save new settings?"; "Yes"; "No")
			$_t_SearchGroupName:=Gen_Request("Name This group"; "")
		Else 
			Gen_Confirm("Save settings for "+QV_t_DefaultGroup+"?"; "Yes"; "No")
			$_t_SearchGroupName:=QV_t_DefaultGroup
		End if 
		If (Ok=1) & ($_t_SearchGroupName#"")
			SET BLOB SIZE:C606(SM_blb_SearchBlob; 0)
			SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->QV_at_GroupNames; ->QV_at_QualityNames; ->QV_al_GroupIDs; ->QV_al_QualityIDs; ->QV_al_QualityLevelLevels; ->QV_al_QualityQualityYears; ->QV_ai_include; ->QV_ai_Exclude; ->QV_at_LevelOptions; ->QV_at_YearOptions; ->QV_at_DisplayNames; ->QV_at_LabelNames; ->QV_al_LabelOrder)
			
			
			SM_SaveSearchParameters(0; $_t_SearchGroupName; $_l_TableNumber; -999; ->SM_blb_SearchBlob; -1)
			SM_LoadSearchParameterNames($_l_TableNumber; -1; -1; -999)
			
			SM_at_SearchNames:=Find in array:C230(SM_at_SearchNames; $_t_SearchGroupName)
			SM_al_SearchIDs{Size of array:C274(SM_al_SearchIDs)-1}:=-SM_al_SearchIDs{SM_at_SearchNames}
			
			
		End if 
	End if 
	
End if 
CANCEL:C270
CLEAR LIST:C377(QV_HL_QualitiesList; *)
ERR_MethodTrackerReturn("OBJ [USER].QV_Groupings.Button2"; $_t_oldMethodName)
