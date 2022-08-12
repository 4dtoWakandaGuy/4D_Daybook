If (False:C215)
	//object Name: [USER]QV_Groupings.Variable56
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
	//ARRAY LONGINT(SM_al_SearchIDs;0)
	//ARRAY TEXT(QV_at_DisplayNames;0)
	//ARRAY TEXT(QV_at_GroupNames;0)
	//ARRAY TEXT(QV_at_LabelNames;0)
	//ARRAY TEXT(QV_at_LevelOptions;0)
	//ARRAY TEXT(QV_at_QualityNames;0)
	//ARRAY TEXT(QV_at_YearOptions;0)
	//ARRAY TEXT(SM_at_SearchNames;0)
	C_BLOB:C604(SM_blb_SearchBlob)
	C_LONGINT:C283($_l_event; $_l_InformationTable)
	C_TEXT:C284($_t_ContextName; $_t_GroupName; $_t_oldMethodName; $_t_SearchName; QV_t_DefaultGroup)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].QV_Groupings.Variable56"; Form event code:C388)
$_l_event:=Form event code:C388
$_l_InformationTable:=Table:C252(->[INFORMATION:55])
$_t_ContextName:="Qualitative Information"

Case of 
	: ($_l_event=On Clicked:K2:4)
		If (SM_at_SearchNames>0)
			Case of 
				: (SM_al_SearchIDs{SM_at_SearchNames}>0)
					
					SM_al_SearchIDs{Size of array:C274(SM_al_SearchIDs)-1}:=-SM_al_SearchIDs{SM_at_SearchNames}
					
					SM_LoadSearchParameters(SM_al_SearchIDs{SM_at_SearchNames})
					
					
				: (SM_al_SearchIDs{SM_at_SearchNames}=-99998)  //Set user default
					
				: (SM_al_SearchIDs{SM_at_SearchNames}=-99999)  //Delete
					If (SM_al_SearchIDs{Size of array:C274(SM_al_SearchIDs)-1}<0)
						$_t_GroupName:=SM_at_SearchNames{Find in array:C230(SM_al_SearchIDs; Abs:C99(SM_al_SearchIDs{Size of array:C274(SM_al_SearchIDs)-1}))}
						Gen_Confirm("Delete Grouping "+$_t_GroupName+"?")
						If (ok=1)
							READ WRITE:C146([x_QUERY_PARAMETERS:134])
							QUERY:C277([x_QUERY_PARAMETERS:134]; [x_QUERY_PARAMETERS:134]X_ID:1=Abs:C99(SM_al_SearchIDs{Size of array:C274(SM_al_SearchIDs)-1}))
							
							If ([x_QUERY_PARAMETERS:134]X_OwnerID:2=0) & Not:C34((User in group:C338(Current user:C182; "Administrator")) | (User in group:C338(Current user:C182; "Designer")))
								Gen_Alert("This search can only be deleted by the administrator")
							Else 
								DB_DeletionControl(->[x_QUERY_PARAMETERS:134])
								
								DELETE RECORD:C58([x_QUERY_PARAMETERS:134])
								READ ONLY:C145([x_QUERY_PARAMETERS:134])
								//and reload--note not generic
								SM_LoadSearchParameterNames($_l_InformationTable-1; -1; -999)
								
							End if 
							
							
						End if 
					End if 
					SM_at_SearchNames:=0
				: (SM_al_SearchIDs{SM_at_SearchNames}<-99997)  //SEPERATOR
					SM_at_SearchNames:=0
				: (SM_al_SearchIDs{SM_at_SearchNames}<0)  //Resave
					//resave parameters
					//might want a save as option here
					SET BLOB SIZE:C606(SM_blb_SearchBlob; 0)
					SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->QV_at_GroupNames; ->QV_at_QualityNames; ->QV_al_GroupIDs; ->QV_al_QualityIDs; ->QV_al_QualityLevelLevels; ->QV_al_QualityQualityYears; ->QV_abo_include; ->QV_abo_Exclude; ->QV_at_LevelOptions; ->QV_at_YearOptions; ->QV_at_DisplayNames; ->QV_at_LabelNames; ->QV_al_LabelOrder)
					
					SM_SaveSearchParameters(Abs:C99(SM_al_SearchIDs{SM_at_SearchNames}); ""; $_l_InformationTable; -999; ->SM_blb_SearchBlob; -1)
					SM_at_SearchNames:=Find in array:C230(SM_al_SearchIDs; Abs:C99(SM_al_SearchIDs{SM_at_SearchNames}))
					
				Else 
					//name the search parameters
					If (Size of array:C274(QV_at_GroupNames)>0)
						//Only do if there are settings created.
						If (QV_t_DefaultGroup="")
							Gen_Confirm("Save new settings?"; "Yes"; "No")
							$_t_SearchName:=Gen_Request("Name This group"; "")
						Else 
							Gen_Confirm("Save settings for "+QV_t_DefaultGroup+"?"; "Yes"; "No")
							$_t_SearchName:=QV_t_DefaultGroup
						End if 
						If (Ok=1) & ($_t_SearchName#"")
							SET BLOB SIZE:C606(SM_blb_SearchBlob; 0)
							SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->QV_at_GroupNames; ->QV_at_QualityNames; ->QV_al_GroupIDs; ->QV_al_QualityIDs; ->QV_al_QualityLevelLevels; ->QV_al_QualityQualityYears; ->QV_abo_include; ->QV_abo_Exclude; ->QV_at_LevelOptions; ->QV_at_YearOptions; ->QV_at_DisplayNames; ->QV_at_LabelNames; ->QV_al_LabelOrder)
							
							
							SM_SaveSearchParameters(0; $_t_SearchName; $_l_InformationTable; -999; ->SM_blb_SearchBlob; -1)
							SM_LoadSearchParameterNames($_l_InformationTable; -1; -1; -999)
							
							SM_at_SearchNames:=Find in array:C230(SM_at_SearchNames; $_t_SearchName)
							SM_al_SearchIDs{Size of array:C274(SM_al_SearchIDs)-1}:=-SM_al_SearchIDs{SM_at_SearchNames}
							
							
						Else 
							SM_at_SearchNames:=0
							
							
						End if 
						
					End if 
					
					
			End case 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [USER].QV_Groupings.Variable56"; $_t_oldMethodName)
