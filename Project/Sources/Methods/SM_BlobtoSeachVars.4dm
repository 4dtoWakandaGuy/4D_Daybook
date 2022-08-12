//%attributes = {}
If (False:C215)
	//Project Method Name:      SM_BlobtoSeachVars
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:    08/06/2010 15:35
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
	//ARRAY LONGINT(QV_al_QualityIDs;0)
	//ARRAY LONGINT(QV_al_QualityLevelLevels;0)
	//ARRAY LONGINT(QV_al_QualityQualityYears;0)
	//ARRAY LONGINT(QV_al_QualitySubGroupsIDs;0)
	//ARRAY LONGINT(QV_al_QualityYears;0)
	//ARRAY TEXT(QV_at_GroupNames;0)
	//ARRAY TEXT(QV_at_LevelOptions;0)
	//ARRAY TEXT(QV_at_QualityNames;0)
	//ARRAY TEXT(QV_at_QualitySubGroups;0)
	//ARRAY TEXT(QV_at_QualitySubGroupsNM;0)
	//ARRAY TEXT(QV_at_QueryType;0)
	//ARRAY TEXT(QV_at_YearOptions;0)
	//ARRAY TEXT(SYS_at_RecordStateNames;0)
	C_BOOLEAN:C305($_bo_NotFound)
	C_LONGINT:C283($_l_BlobSize; $_l_FieldNumber; $_l_offset; $_l_SetVarIndex; $_l_TableNumber; $_l_TableOrElement; $_l_VariableType)
	C_POINTER:C301($_ptr_PointerToVariable; $1; $10; $11; $12; $13; $14; $15; $16; $17; $18)
	C_POINTER:C301($19; $2; $20; $21; $22; $23; $24; $25; $26; $27; $28)
	C_POINTER:C301($29; $3; $4; $5; $6; $7; $8; $9)
	C_TEXT:C284($_t_oldMethodName; $_t_Parameter; $_t_VariableName; $_t_VariableName2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SM_BlobtoSeachVars")
$_t_Parameter:=""
$_l_offset:=0
$_l_BlobSize:=(BLOB size:C605($1->))
If ($_l_BlobSize>0)
	For ($_l_SetVarIndex; 2; Count parameters:C259)
		RESOLVE POINTER:C394(${$_l_SetVarIndex}; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_bo_NotFound:=True:C214
		$_l_offset:=0
		While ($_l_offset<$_l_BlobSize) & ($_bo_NotFound)
			$_t_VariableName2:=BLOB to text:C555($1->; 2; $_l_offset)
			If ($_l_offset<$_l_BlobSize)
				$_l_TableOrElement:=BLOB to longint:C551($1->; 0; $_l_offset)
				If ($_l_offset<$_l_BlobSize)
					$_l_FieldNumber:=BLOB to longint:C551($1->; 0; $_l_offset)
					If ($_l_offset<$_l_BlobSize)
						If ($_t_VariableName2=$_t_VariableName)
							//This is the correct variable
							$_bo_NotFound:=False:C215
							$_ptr_PointerToVariable:=Get pointer:C304($_t_VariableName2)
							$_l_VariableType:=Type:C295($_ptr_PointerToVariable->)
							//if the array has not been initialized this gets an error
							If ($_l_VariableType=5)
								Case of 
									: ($_t_VariableName2="SYS_at_RecordStateNames") | ($_t_VariableName2="aStName") | ($_t_VariableName2="SYS_aS29_RecordStateNames")
										ARRAY TEXT:C222(SYS_at_RecordStateNames; 0)
									: ($_t_VariableName2="QV_at_QueryType") | ($_t_VariableName2="QV_at_QueryType")
										ARRAY TEXT:C222(QV_at_QueryType; 0)
									: ($_t_VariableName2="QV_at_QualitySubGroupsNM") | ($_t_VariableName2="QV_at_QualitySubGroupsNM")
										ARRAY TEXT:C222(QV_at_QualitySubGroupsNM; 0)
									: ($_t_VariableName2="QV_al_QualitySubGroupsIDs") | ($_t_VariableName2="QV_al_QualitySubGroupsIDs")
										ARRAY LONGINT:C221(QV_al_QualitySubGroupsIDs; 0)
									: ($_t_VariableName2="QV_at_QualitySubGroups") | ($_t_VariableName2="QV_at_QualitySubGroups")
										ARRAY TEXT:C222(QV_at_QualitySubGroups; 0)
									: ($_t_VariableName2="QV_abo_include")
										ARRAY BOOLEAN:C223(QV_abo_include; 0)
									: ($_t_VariableName2="QV_at_GroupNames")
										ARRAY TEXT:C222(QV_at_GroupNames; 0)
									: ($_t_VariableName2="QV_at_QualityNames")
										ARRAY TEXT:C222(QV_at_QualityNames; 0)
									: ($_t_VariableName2="QV_at_LevelOptions")
										ARRAY TEXT:C222(QV_at_LevelOptions; 0)
									: ($_t_VariableName2="QV_al_QualityLevelLevels")
										ARRAY LONGINT:C221(QV_al_QualityLevelLevels; 0)
									: ($_t_VariableName2="QV_at_YearOptions")
										ARRAY TEXT:C222(QV_at_YearOptions; 0)
									: ($_t_VariableName2="QV_at_QualityYears")  //this was named this way but a longint array
										ARRAY LONGINT:C221(QV_al_QualityQualityYears; 0)
									: ($_t_VariableName2="QV_al_QualityQualityYears")
										ARRAY LONGINT:C221(QV_al_QualityQualityYears; 0)
									: ($_t_VariableName2="QV_abo_Exclude")
										ARRAY BOOLEAN:C223(QV_abo_Exclude; 0)
									: ($_t_VariableName2="QV_ai_Exclude")
										ARRAY INTEGER:C220(QV_ai_Exclude; 0)
									: ($_t_VariableName2="QV_ai_include")
										ARRAY INTEGER:C220(QV_ai_include; 0)
									: ($_t_VariableName2="QV_al_GroupIDs")
										ARRAY LONGINT:C221(QV_al_GroupIDs; 0)
									: ($_t_VariableName2="QV_al_QualityIDs")
										ARRAY LONGINT:C221(QV_al_QualityIDs; 0)
								End case 
							End if 
							If ($_l_TableOrElement>0)
								//point to array element
								BLOB TO VARIABLE:C533($1->; $_ptr_PointerToVariable->{$_l_TableOrElement}; $_l_offset)
								
							Else 
								BLOB TO VARIABLE:C533($1->; $_ptr_PointerToVariable->; $_l_offset)
								
							End if 
							
							
						End if 
						
						
					End if 
				End if 
				
			End if 
		End while 
		
	End for 
	
End if 
ERR_MethodTrackerReturn("SM_BlobtoSeachVars"; $_t_oldMethodName)