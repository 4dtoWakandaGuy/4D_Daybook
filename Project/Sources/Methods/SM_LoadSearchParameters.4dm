//%attributes = {}
If (False:C215)
	//Project Method Name:      SM_LoadSearchParameters
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2013 12:28
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
	C_BOOLEAN:C305($2)
	C_LONGINT:C283($_l_FieldNumber; $_l_Index; $_l_offset; $_l_TableOrElement; $_l_Type; $0; $1)
	C_POINTER:C301($_ptr_Field)
	C_TEXT:C284($_t_oldMethodName; $_t_oldMethodName2; $_t_VariableName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("SM_LoadSearchParameters")


//This method loads search parameters from the blob
// this is generic but would get an error if the variable was not emphatically declared
$_l_offset:=0

If (Count parameters:C259>=1)
	QUERY:C277([x_QUERY_PARAMETERS:134]; [x_QUERY_PARAMETERS:134]X_ID:1=$1)
	If (Records in selection:C76([x_QUERY_PARAMETERS:134])=1)
		$_l_offset:=0
		ARRAY INTEGER:C220(QV_ai_include; 0)  //NG September 2006 these area only here to avoid an error loading an old search
		ARRAY INTEGER:C220(QV_ai_Exclude; 0)
		
		If (BLOB size:C605([x_QUERY_PARAMETERS:134]X_SearchValues:5)>0)
			While ($_l_offset<BLOB size:C605([x_QUERY_PARAMETERS:134]X_SearchValues:5))
				//each variable has
				// variable name
				$_t_VariableName:=BLOB to text:C555([x_QUERY_PARAMETERS:134]X_SearchValues:5; 2; $_l_offset)
				
				If ($_l_offset<BLOB size:C605([x_QUERY_PARAMETERS:134]X_SearchValues:5))
					
					$_l_TableOrElement:=BLOB to longint:C551([x_QUERY_PARAMETERS:134]X_SearchValues:5; 0; $_l_offset)
					If ($_l_offset<BLOB size:C605([x_QUERY_PARAMETERS:134]X_SearchValues:5))
						$_l_FieldNumber:=BLOB to longint:C551([x_QUERY_PARAMETERS:134]X_SearchValues:5; 0; $_l_offset)
						If ($_l_offset<BLOB size:C605([x_QUERY_PARAMETERS:134]X_SearchValues:5))
							Case of 
								: ($_t_VariableName#"")
									$_ptr_Field:=Get pointer:C304($_t_VariableName)
									$_l_Type:=Type:C295($_ptr_Field->)
									//if the array has not been initialized this gets an error
									If ($_l_Type=5)
										Case of 
											: ($_t_VariableName="SYS_at_RecordStateNames")
												ARRAY TEXT:C222(SYS_at_RecordStateNames; 0)
											: ($_t_VariableName="QV_at_QueryType")
												ARRAY TEXT:C222(QV_at_QueryType; 0)
											: ($_t_VariableName="QV_at_QualitySubGroupsNM")
												ARRAY TEXT:C222(QV_at_QualitySubGroupsNM; 0)
											: ($_t_VariableName="QV_al_QualitySubGroupsIDs")
												ARRAY LONGINT:C221(QV_al_QualitySubGroupsIDs; 0)
											: ($_t_VariableName="QV_at_QualitySubGroups")
												ARRAY TEXT:C222(QV_at_QualitySubGroups; 0)
											: ($_t_VariableName="QV_abo_include")
												ARRAY BOOLEAN:C223(QV_abo_include; 0)
											: ($_t_VariableName="QV_at_GroupNames")
												ARRAY TEXT:C222(QV_at_GroupNames; 0)
											: ($_t_VariableName="QV_at_QualityNames")
												ARRAY TEXT:C222(QV_at_QualityNames; 0)
											: ($_t_VariableName="QV_at_LevelOptions")
												ARRAY TEXT:C222(QV_at_LevelOptions; 0)
											: ($_t_VariableName="QV_al_QualityLevelLevels")
												ARRAY LONGINT:C221(QV_al_QualityLevelLevels; 0)
											: ($_t_VariableName="QV_at_YearOptions")
												ARRAY TEXT:C222(QV_at_YearOptions; 0)
											: ($_t_VariableName="QV_at_QualityYears")  //This stored as this but it is a longint array
												ARRAY LONGINT:C221(QV_al_QualityQualityYears; 0)
											: ($_t_VariableName="QV_al_QualityQualityYears")
												ARRAY LONGINT:C221(QV_al_QualityQualityYears; 0)
											: ($_t_VariableName="QV_abo_Exclude")
												ARRAY BOOLEAN:C223(QV_abo_Exclude; 0)
											: ($_t_VariableName="QV_ai_Exclude")
												ARRAY INTEGER:C220(QV_ai_Exclude; 0)
											: ($_t_VariableName="QV_ai_include")
												ARRAY INTEGER:C220(QV_ai_include; 0)
											: ($_t_VariableName="QV_al_GroupIDs")
												ARRAY LONGINT:C221(QV_al_GroupIDs; 0)
											: ($_t_VariableName="QV_al_QualityIDs")
												ARRAY LONGINT:C221(QV_al_QualityIDs; 0)
										End case 
									End if 
									$_t_oldMethodName2:=ERR_MethodTracker(String:C10($_l_Type)+$_t_VariableName)
									If ($_l_TableOrElement>0)
										//point to array element
										BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_ptr_Field->{$_l_TableOrElement}; $_l_offset)
										Case of 
											: ($_l_Type=Is longint:K8:6)
											: ($_l_Type=Is real:K8:4)
											: ($_l_Type=Is integer:K8:5)
										End case 
									Else 
										//BLOB TO VARIABLE([x_QUERY_PARAMETERS]X_SearchValues;$VAR;$_l_offset)
										
										BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_ptr_Field->; $_l_offset)
										
									End if 
									Case of 
										: ($_t_VariableName="QV_ai_include")
											//the array used in this specific case was changed...it was an integer array and now is boolean
											//The new array is QV_abo_include
											ARRAY BOOLEAN:C223(QV_abo_include; 0)
											ARRAY BOOLEAN:C223(QV_abo_include; Size of array:C274(QV_ai_include))
											For ($_l_Index; 1; Size of array:C274(QV_ai_include))
												QV_abo_include{$_l_Index}:=(QV_ai_include{$_l_Index}=1)
											End for 
											
										: ($_t_VariableName="QV_ai_Exclude")
											ARRAY BOOLEAN:C223(QV_abo_Exclude; 0)
											ARRAY BOOLEAN:C223(QV_abo_Exclude; Size of array:C274(QV_ai_Exclude))
											For ($_l_Index; 1; Size of array:C274(QV_ai_Exclude))
												QV_abo_Exclude{$_l_Index}:=(QV_ai_Exclude{$_l_Index}=1)
											End for 
											
											
									End case 
								: ($_l_TableOrElement>0)
									$_ptr_Field:=Field:C253($_l_TableOrElement; $_l_FieldNumber)
									BLOB TO VARIABLE:C533([x_QUERY_PARAMETERS:134]X_SearchValues:5; $_ptr_Field->; $_l_offset)
									
							End case 
							
						End if 
					End if 
				End if 
				
			End while 
		End if 
	End if 
	
End if 
If (Count parameters:C259>=2)
	If ($2)
		$0:=$_l_offset
	End if 
End if 
ERR_MethodTrackerReturn("SM_LoadSearchParameters"; $_t_oldMethodName)
