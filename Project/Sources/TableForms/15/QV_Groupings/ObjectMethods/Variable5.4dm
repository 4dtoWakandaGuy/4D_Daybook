If (False:C215)
	//object Name: [USER]QV_Groupings.Variable5
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
	//ARRAY BOOLEAN(QV_abo_Exclude;0)
	//ARRAY BOOLEAN(QV_abo_include;0)
	//ARRAY LONGINT(QV_al_GroupIDs;0)
	//ARRAY LONGINT(QV_al_LabelOrder;0)
	//ARRAY LONGINT(QV_al_QualityIDs;0)
	//ARRAY LONGINT(QV_al_QualityLevelLevels;0)
	//ARRAY LONGINT(QV_al_QualityQualityYears;0)
	//ARRAY LONGINT(QV_at_QualityYears;0)
	//ARRAY TEXT(QV_at_DisplayNames;0)
	//ARRAY TEXT(QV_at_GroupNames;0)
	//ARRAY TEXT(QV_at_LabelNames;0)
	//ARRAY TEXT(QV_at_LevelOptions;0)
	//ARRAY TEXT(QV_at_QualityNames;0)
	//ARRAY TEXT(QV_at_YearOptions;0)
	C_LONGINT:C283($_l_Count; $_l_Index; LB_l_RowNumber)
	C_TEXT:C284($_t_oldMethodName; $_t_QualityName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].QV_Groupings.Variable5"; Form event code:C388)
//AL_GetPrevCell (QV_l_Powerview;bd36;LB_l_RowNumber)  ` area, column, row
If (LB_l_RowNumber>0)
	If (QV_al_GroupIDs{LB_l_RowNumber}=0)
		
		$_t_QualityName:=QV_at_QualityNames{LB_l_RowNumber}
		If (True:C214)  //($_t_QualityName#"")`altered to allow deletion of blank lines also, 23/08/06 - kmw
			Gen_Confirm("Remove "+$_t_QualityName+"?"; "No"; "Yes")
			If (OK=0)
				
				DELETE FROM ARRAY:C228(QV_at_GroupNames; LB_l_RowNumber; 1)
				DELETE FROM ARRAY:C228(QV_at_QualityNames; LB_l_RowNumber; 1)
				DELETE FROM ARRAY:C228(QV_al_GroupIDs; LB_l_RowNumber; 1)
				DELETE FROM ARRAY:C228(QV_al_QualityIDs; LB_l_RowNumber; 1)
				DELETE FROM ARRAY:C228(QV_al_QualityLevelLevels; LB_l_RowNumber; 1)
				DELETE FROM ARRAY:C228(QV_al_QualityQualityYears; LB_l_RowNumber; 1)
				DELETE FROM ARRAY:C228(QV_abo_include; LB_l_RowNumber; 1)
				DELETE FROM ARRAY:C228(QV_abo_Exclude; LB_l_RowNumber; 1)
				DELETE FROM ARRAY:C228(QV_at_LevelOptions; LB_l_RowNumber; 1)
				DELETE FROM ARRAY:C228(QV_at_YearOptions; LB_l_RowNumber; 1)
				//DELETE ELEMENT(QV_ai_Exclude;LB_l_RowNumber;1)
				//extra delete reomoved 20/08/06 -kmw
				DELETE FROM ARRAY:C228(QV_al_LabelOrder; LB_l_RowNumber; 1)
				DELETE FROM ARRAY:C228(QV_at_DisplayNames; LB_l_RowNumber; 1)
				DELETE FROM ARRAY:C228(QV_at_LabelNames; LB_l_RowNumber; 1)
				
				
			End if 
			
		End if 
		
		
	Else 
		Gen_Confirm("Remove the Group "+QV_at_GroupNames{LB_l_RowNumber}+"?"; "No"; "Yes")
		If (Ok=0)
			$_l_Count:=0
			For ($_l_Index; LB_l_RowNumber; Size of array:C274(QV_at_GroupNames))
				If ((QV_al_GroupIDs{$_l_Index}#0) & (QV_al_GroupIDs{$_l_Index}#QV_al_GroupIDs{LB_l_RowNumber}))  //| ($_l_Index=Size of array(QV_at_GroupNames))  `removed 23/08/06 - kmw (wasn't deleting very last line of final group)
					$_l_Index:=Size of array:C274(QV_at_GroupNames)+1
				Else 
					$_l_Count:=$_l_Count+1
				End if 
			End for 
			DELETE FROM ARRAY:C228(QV_at_GroupNames; LB_l_RowNumber; $_l_Count)
			DELETE FROM ARRAY:C228(QV_at_QualityNames; LB_l_RowNumber; $_l_Count)
			DELETE FROM ARRAY:C228(QV_al_GroupIDs; LB_l_RowNumber; $_l_Count)
			DELETE FROM ARRAY:C228(QV_al_QualityIDs; LB_l_RowNumber; $_l_Count)
			DELETE FROM ARRAY:C228(QV_al_QualityLevelLevels; LB_l_RowNumber; $_l_Count)
			DELETE FROM ARRAY:C228(QV_al_QualityQualityYears; LB_l_RowNumber; $_l_Count)
			DELETE FROM ARRAY:C228(QV_abo_include; LB_l_RowNumber; $_l_Count)
			DELETE FROM ARRAY:C228(QV_abo_Exclude; LB_l_RowNumber; $_l_Count)
			DELETE FROM ARRAY:C228(QV_at_LevelOptions; LB_l_RowNumber; $_l_Count)
			DELETE FROM ARRAY:C228(QV_at_YearOptions; LB_l_RowNumber; $_l_Count)
			//DELETE ELEMENT(QV_ai_Exclude;LB_l_RowNumber;$_l_Count)
			//extra delete reomoved 20/08/06 -kmw
			DELETE FROM ARRAY:C228(QV_al_LabelOrder; LB_l_RowNumber; $_l_Count)
			DELETE FROM ARRAY:C228(QV_at_DisplayNames; LB_l_RowNumber; $_l_Count)
			DELETE FROM ARRAY:C228(QV_at_LabelNames; LB_l_RowNumber; $_l_Count)
			//
		End if 
		
		
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [USER].QV_Groupings.Variable5"; $_t_oldMethodName)
