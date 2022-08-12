//%attributes = {}

If (False:C215)
	//Project Method Name:      DB_SetFormSortOrder
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
	//ARRAY LONGINT(<>FS_al_FormSortDirection;0)
	//ARRAY LONGINT(<>FS_al_FormSortFieldNum;0)
	//ARRAY LONGINT(<>FS_al_FormSortTableNum;0)
	//ARRAY LONGINT(DB_al_ContextTableNumber;0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
	ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
	//ARRAY POINTER(DB_apo_ContextPointers;0)
	//ARRAY TEXT(<>FS_at_FormReference;0)
	//ARRAY TEXT(<>FS_at_FormSortvariable;0)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	C_BOOLEAN:C305(<>FS_bo_FSettingsLoaded; $_bo_isSet; $_bo_ProcessVisible; $_bo_RelationFound; $_bo_SetSort; $_bo_SpecialSortOrder)
	C_LONGINT:C283($_l_ColumnIndex; $_l_ColumNumber; $_l_CurrentDisplayedForm; $_l_CurrentSortSetting; $_l_FieldIndex; $_l_NumberofColumns; $_l_OneField; $_l_OneTable; $_l_ProcessState; $_l_ProcessTime; $_l_SortDirection)
	C_LONGINT:C283($_l_SortRow; $_l_TableNumber; $_l_ThisHeaderVariableDefault; $3; $4; $FS_l_SortFieldNUM; $FS_l_SortFieldNUM2; DB_l_CurrentDisplayedForm; FS_l_SortDirection; FS_l_SortFieldNUM; FS_l_SortTableNUM)
	C_POINTER:C301($_ptr_areaTypeVariable; $_ptr_ArrayFieldPointers; $_ptr_ArrayReferences; $_Ptr_Field; $_ptr_Field2; $_ptr_ListboxArea; $_ptr_ListboxSetup; $_ptr_Table; $_ptr_Table2; $_Ptr_ThisHeaderVariable; $_Ptr_ThisHeaderVariableDefault)
	C_POINTER:C301($5)
	C_REAL:C285($0; $1)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_CurrentDefinitionsName; $_t_oldMethodName; $_t_processName; $2; DB_t_CurrentContext)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("DB_SetFormSortOrder")

ARRAY TEXT:C222($_at_ColumnNames; 0)
ARRAY TEXT:C222($_at_HeaderNames; 0)
ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)

If (Not:C34(<>FS_bo_FSettingsLoaded))
	FSettings_loadPreferences(<>PER_t_CurrentUserInitials)
End if 
//`ALERT("Stage 8B")


$_bo_SpecialSortOrder:=False:C215

If (Count parameters:C259>=2)
	If (Count parameters:C259>=3)
		$_l_ColumNumber:=$3
	End if 
	//`ALERT("Stage 8C")
	If (Count parameters:C259>=4)
		$_l_SortDirection:=$4
	End if 
	If ($_l_ColumNumber>0)
		//This is a directive-update the column sorted by
	Else 
		//sort by the current column
		//what data is in the current column
		//NG 20/7/06 this method is a replacement for ALAreaSort
		//NG this method will sort the area list arrays. It is created so that any off screen values also get sorted.
		//`ALERT("Stage 8D")  //NG this method will sort the area list arrays. It is created so that any off screen values also get sorted.
		If (Count parameters:C259>=2)
			$_l_TableNumber:=$1
			//`ALERT("Stage 8C"+String($_l_TableNumber))
			If (Count parameters:C259<5)
				$_l_SortRow:=Find in array:C230(DB_al_ContextTableNumber; $_l_TableNumber)
				If ($_l_SortRow>0)  //it shoud be!
					//`ALERT("Stage 8D"+String($_l_TableNumber)+" "+String($_l_SortRow))
					$_ptr_ListboxSetup:=DB_aptr_ContextPointers{$_l_SortRow}
					$_ptr_ArrayReferences:=$_ptr_ListboxSetup->{9}
					$_t_CurrentDefinitionsName:=$_ptr_ArrayReferences->{6}
					$_ptr_ListboxArea:=$_ptr_ListboxSetup->{1}
				End if 
			Else 
				$_ptr_ListboxSetup:=$5
				$_ptr_ArrayReferences:=$_ptr_ListboxSetup->{9}
				$_t_CurrentDefinitionsName:=$_ptr_ArrayReferences->{6}
				$_ptr_ListboxArea:=$_ptr_ListboxSetup->{1}
				$_l_SortRow:=1
			End if 
			
			If ($_l_SortRow>0)  //it shoud be!
				//`ALERT("Stage 8D"+String($_l_TableNumber)+" "+String($_l_SortRow))
				
				LISTBOX GET ARRAYS:C832($_ptr_ListboxArea->; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)
				//If the variable is set to 1, the column is sorted in ascending order and the sor;
				//If the variable is set to 2, the column is sorted in descending order and the so
				
				$_ptr_areaTypeVariable:=$_ptr_ListboxSetup->{19}
				If ($2#"")
					$_t_CurrentDefinitionsName:=$_t_CurrentDefinitionsName+" "+$2
				End if 
				//`ALERT("Stage 8E"+String($_l_TableNumber)+" "+String($_l_SortRow)+" "+$_t_CurrentDefinitionsName)
				
				If ($1=Table:C252(->[INVOICES:39]))
					//this allows for different sort prefs for different views
					//these use the same form but are different processes
					PROCESS PROPERTIES:C336(Current process:C322; $_t_processName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible)
					$_t_CurrentDefinitionsName:=$_t_CurrentDefinitionsName+" "+$_t_processName
					
					$_t_CurrentDefinitionsName:=Substring:C12($_t_CurrentDefinitionsName; 1; 55)
					
					
				End if 
				$_bo_SetSort:=True:C214
				$_l_CurrentDisplayedForm:=DB_l_CurrentDisplayedForm
				If (<>FS_bo_FSettingsLoaded)
					//`ALERT("Stage 8F"+String($_l_TableNumber)+" "+String($_l_SortRow)+" "+$_t_CurrentDefinitionsName)
					
					If (FS_l_SortTableNUM=0)  //coming into the form -read from the arrays
						//`ALERT("Stage 8G"+String($_l_TableNumber)+" "+String($_l_SortRow)+" "+$_t_CurrentDefinitionsName+"Getting Sort Table")
						
						While (Semaphore:C143("$WriteFormsortPref"))
							DelayTicks(2)
						End while 
						//`ALERT("Stage 8H"+String($_l_TableNumber)+" "+String($_l_SortRow)+" "+$_t_CurrentDefinitionsName)
						
						$_l_SortRow:=Find in array:C230(<>FS_at_FormReference; $_t_CurrentDefinitionsName)
						//`ALERT("Stage 8I"+String($_l_TableNumber)+" New-"+String($_l_SortRow)+" "+$_t_CurrentDefinitionsName)
						
						If ($_l_SortRow>0)
							FS_l_SortDirection:=Abs:C99(<>FS_al_FormSortDirection{$_l_SortRow})
							//`ALERT("Stage 8J"+String($_l_TableNumber)+" "+String($_l_SortRow)+" "+$_t_CurrentDefinitionsName+" "+String(FS_l_SortDirection))
							
							If (False:C215)
								If (FS_l_SortDirection>=0)
									FS_l_SortDirection:=1
								End if 
								If (FS_l_SortDirection<0)
									FS_l_SortDirection:=2
								End if 
							End if 
							//`ALERT("Stage 8K"+String($_l_TableNumber)+" "+String($_l_SortRow)+" "+$_t_CurrentDefinitionsName+" "+String(FS_l_SortDirection)+"FIeld"+String(FS_l_SortFieldNUM))
							FS_t_SortVariableName:=<>FS_at_FormSortvariable{$_l_SortRow}
							FS_l_SortFieldNUM:=<>FS_al_FormSortFieldNum{$_l_SortRow}  //Longint
							//NOTE THIS IS THE FIELD NOT THE COLUMN
							If ($_bo_SetSort)
								$_bo_SpecialSortOrder:=False:C215
								
								
								If (FS_l_SortFieldNUM>=0)
									$_ptr_Table:=Table:C252(<>FS_al_FormSortTableNum{$_l_SortRow})
									
									FS_l_SortTableNUM:=<>FS_al_FormSortTableNum{$_l_SortRow}
									Case of 
										: (<>FS_al_FormSortTableNum{$_l_SortRow}=Table:C252(->[COMPANIES:2]))
											//if(FS_l_SortFieldNUM=FIeld(»[companies]
										: (<>FS_al_FormSortTableNum{$_l_SortRow}=Table:C252(->[CONTACTS:1]))
											If (FS_l_SortFieldNUM=Field:C253(->[CONTACTS:1]Email_Address:35))
												//`ALERT("Stage 8L"+String($_l_TableNumber)+" "+String($_l_SortRow)+" "+$_t_CurrentDefinitionsName+" "+String(FS_l_SortDirection)+"FIeld"+String(FS_l_SortFieldNUM)+" Sorted by email")
												
												$_bo_SpecialSortOrder:=True:C214
												$FS_l_SortFieldNUM:=Field:C253(->[CONTACTS:1]Email_Before_At:30)
												$FS_l_SortFieldNUM2:=Field:C253(->[CONTACTS:1]EMail_After_At:24)
											End if 
											
									End case 
									$_ptr_ArrayFieldPointers:=$_ptr_ListboxSetup->{2}
									$_l_NumberofColumns:=Size of array:C274($_ptr_ArrayFieldPointers->)
									$_ptr_ListboxArea:=$_ptr_ListboxSetup->{1}
									$_bo_isSet:=False:C215
									For ($_l_ColumnIndex; 1; $_l_NumberofColumns)
										
										If (FS_l_SortFieldNUM=Field:C253($_ptr_ArrayFieldPointers->{$_l_ColumnIndex})) & (Table:C252($_ptr_ArrayFieldPointers->{$_l_ColumnIndex})=FS_l_SortTableNUM)
											
											If (FS_l_SortDirection<2)
												If (Size of array:C274($_aptr_HeaderVariables)>=$_l_ColumnIndex)
													$_Ptr_ThisHeaderVariable:=$_aptr_HeaderVariables{$_l_ColumnIndex}
													$_Ptr_ThisHeaderVariable->:=FS_l_SortDirection
												End if 
												
												If (FS_l_SortTableNUM#$_l_TableNumber)
													$_bo_RelationFound:=False:C215
													For ($_l_FieldIndex; 1; Get last field number:C255($_l_TableNumber))
														If (Is field number valid:C1000($_l_TableNumber; $_l_FieldIndex))
															GET RELATION PROPERTIES:C686($_l_TableNumber; $_l_FieldIndex; $_l_OneTable; $_l_OneField)
															If ($_l_OneTable=FS_l_SortTableNUM)
																$_Ptr_Field:=Field:C253($_l_TableNumber; $_l_FieldIndex)
																SET FIELD RELATION:C919($_Ptr_Field->; Automatic:K51:4; Manual:K51:3)
																$_bo_RelationFound:=True:C214
																$_l_FieldIndex:=99999
															End if 
														End if 
													End for 
													If (Not:C34($_bo_RelationFound))
														SET AUTOMATIC RELATIONS:C310(True:C214; True:C214)
													End if 
													//`ALERT("Stage 8L"+String($_l_TableNumber)+" "+String($_l_SortRow)+" "+$_t_CurrentDefinitionsName+" "+String(FS_l_SortDirection)+"FIeld"+String(FS_l_SortFieldNUM)+"Auto relations true")
													If ($_ptr_areaTypeVariable-><3)  //array based)
														LISTBOX SORT COLUMNS:C916($_ptr_ListboxArea->; $_l_ColumnIndex; <)
													Else 
														
														$_ptr_Table2:=Table:C252($_l_CurrentDisplayedForm)
														$_ptr_Table:=Table:C252(<>FS_al_FormSortTableNum{$_l_SortRow})
														$_ptr_Field:=Field:C253(<>FS_al_FormSortTableNum{$_l_SortRow}; FS_l_SortFieldNUM)
														If ($_bo_SpecialSortOrder)
															$_ptr_Field:=Field:C253(<>FS_al_FormSortTableNum{$_l_SortRow}; $FS_l_SortFieldNUM)
															$_ptr_Field2:=Field:C253(<>FS_al_FormSortTableNum{$_l_SortRow}; $FS_l_SortFieldNUM2)
															//`ALERT("Stage 8M"+String($_l_TableNumber)+" "+String($_l_SortRow)+" "+$_t_CurrentDefinitionsName+" "+String(FS_l_SortDirection)+"FIeld"+String(FS_l_SortFieldNUM)+"Special Sort")
															If (Not:C34(Is nil pointer:C315($_ptr_Table2))) & (Not:C34(Is nil pointer:C315($_ptr_Field))) & (Not:C34(Is nil pointer:C315($_ptr_Field2)))
																ORDER BY:C49($_ptr_Table2->; $_ptr_Field->; $_ptr_Field2->; <)
																//`ALERT("Stage 8N"+String($_l_TableNumber)+" "+String($_l_SortRow)+" "+$_t_CurrentDefinitionsName+" "+String(FS_l_SortDirection)+"FIeld"+String(FS_l_SortFieldNUM)+"Special Sort-done")
															End if 
														Else 
															//`ALERT("Stage 8M"+String($_l_TableNumber)+" "+String($_l_SortRow)+" "+$_t_CurrentDefinitionsName+" "+String(FS_l_SortDirection)+"FIeld"+String(FS_l_SortFieldNUM)+"Sort")
															If (Not:C34(Is nil pointer:C315($_ptr_Table2))) & (Not:C34(Is nil pointer:C315($_ptr_Field)))
																ORDER BY:C49($_ptr_Table2->; $_ptr_Field->; <)
															End if   //`ALERT("Stage 8N"+String($_l_TableNumber)+" "+String($_l_SortRow)+" "+$_t_CurrentDefinitionsName+" "+String(FS_l_SortDirection)+"FIeld"+String(FS_l_SortFieldNUM)+"Sort-done")
														End if 
														//`ALERT("Stage 8P"+String($_l_TableNumber)+" "+String($_l_SortRow)+" "+$_t_CurrentDefinitionsName+" "+String(FS_l_SortDirection)+"FIeld"+String(FS_l_SortFieldNUM)+"Sort done")
														
													End if 
													SET AUTOMATIC RELATIONS:C310(False:C215; False:C215)
												Else 
													//`ALERT("Stage 8L_1"+String($_l_TableNumber)+" "+String($_l_SortRow)+" "+$_t_CurrentDefinitionsName+" "+String(FS_l_SortDirection)+"FIeld"+String(FS_l_SortFieldNUM)+"Auto relations true")
													
													//AL_SetSort NG TODO:($_ptr_ListboxArea->;$_l_ColumnIndex)
													If ($_ptr_areaTypeVariable-><3)  //array based)
														LISTBOX SORT COLUMNS:C916($_ptr_ListboxArea->; $_l_ColumnIndex; >)
													Else 
														$_ptr_Table:=Table:C252(<>FS_al_FormSortTableNum{$_l_SortRow})
														$_ptr_Field:=Field:C253(<>FS_al_FormSortTableNum{$_l_SortRow}; FS_l_SortFieldNUM)
														If ($_bo_SpecialSortOrder)
															$_ptr_Field:=Field:C253(<>FS_al_FormSortTableNum{$_l_SortRow}; $FS_l_SortFieldNUM)
															$_ptr_Field2:=Field:C253(<>FS_al_FormSortTableNum{$_l_SortRow}; $FS_l_SortFieldNUM2)
															//`ALERT("Stage 8M_1"+String($_l_TableNumber)+" "+String($_l_SortRow)+" "+$_t_CurrentDefinitionsName+" "+String(FS_l_SortDirection)+"FIeld"+String(FS_l_SortFieldNUM)+"Special Sort")
															If (Not:C34(Is nil pointer:C315($_ptr_Table))) & (Not:C34(Is nil pointer:C315($_ptr_Field))) & (Not:C34(Is nil pointer:C315($_ptr_Field2)))
																ORDER BY:C49($_ptr_Table->; $_ptr_Field->; $_ptr_Field2->; >)
															End if   //`ALERT("Stage 8N_1"+String($_l_TableNumber)+" "+String($_l_SortRow)+" "+$_t_CurrentDefinitionsName+" "+String(FS_l_SortDirection)+"FIeld"+String(FS_l_SortFieldNUM)+"Special Sort Done")
															
														Else 
															//`ALERT("Stage 8M_1"+String($_l_TableNumber)+" "+String($_l_SortRow)+" "+$_t_CurrentDefinitionsName+" "+String(FS_l_SortDirection)+"FIeld"+String(FS_l_SortFieldNUM)+"Sort")
															If (Not:C34(Is nil pointer:C315($_ptr_Table))) & (Not:C34(Is nil pointer:C315($_ptr_Field)))
																ORDER BY:C49($_ptr_Table->; $_ptr_Field->; >)
															End if   //`ALERT("Stage 8N_1"+String($_l_TableNumber)+" "+String($_l_SortRow)+" "+$_t_CurrentDefinitionsName+" "+String(FS_l_SortDirection)+"FIeld"+String(FS_l_SortFieldNUM)+"Sort Done")
														End if 
													End if 
													//```ALERT("Stage 8P_1"+String($_l_TableNumber)+" "+String($_l_SortRow)+" "+$_t_CurrentDefinitionsName+" "+String(FS_l_SortDirection)+"FIeld"+String(FS_l_SortFieldNUM)+"Sort done")
													
												End if 
												
											Else 
												//AL_SetSort NG TODO:($_ptr_ListboxArea->;-($_l_ColumnIndex))
												
												If (Size of array:C274($_aptr_HeaderVariables)>=$_l_ColumnIndex)
													$_Ptr_ThisHeaderVariable:=$_aptr_HeaderVariables{$_l_ColumnIndex}
													$_Ptr_ThisHeaderVariable->:=FS_l_SortDirection
												End if 
												If (FS_l_SortTableNUM#$_l_TableNumber)
													//`ALERT("Stage 8L_2"+String($_l_TableNumber)+" "+String($_l_SortRow)+" "+$_t_CurrentDefinitionsName+" "+String(FS_l_SortDirection)+"FIeld"+String(FS_l_SortFieldNUM)+"Auto relations true")
													
													$_bo_RelationFound:=False:C215
													For ($_l_FieldIndex; 1; Get last field number:C255($_l_TableNumber))
														If (Is field number valid:C1000($_l_TableNumber; $_l_FieldIndex))
															GET RELATION PROPERTIES:C686($_l_TableNumber; $_l_FieldIndex; $_l_OneTable; $_l_OneField)
															If ($_l_OneTable=FS_l_SortTableNUM)
																$_Ptr_Field:=Field:C253($_l_TableNumber; $_l_FieldIndex)
																SET FIELD RELATION:C919($_Ptr_Field->; Automatic:K51:4; Manual:K51:3)
																$_bo_RelationFound:=True:C214
																$_l_FieldIndex:=99999
															End if 
														End if 
													End for 
													If (Not:C34($_bo_RelationFound))
														SET AUTOMATIC RELATIONS:C310(True:C214; True:C214)
													End if 
													If ($_ptr_areaTypeVariable-><3)  //array based)
														LISTBOX SORT COLUMNS:C916($_ptr_ListboxArea->; $_l_ColumnIndex; <)
													Else 
														
														$_ptr_Table2:=Table:C252($_l_CurrentDisplayedForm)
														$_ptr_Table:=Table:C252(<>FS_al_FormSortTableNum{$_l_SortRow})
														$_ptr_Field:=Field:C253(<>FS_al_FormSortTableNum{$_l_SortRow}; FS_l_SortFieldNUM)
														
														
														If ($_bo_SpecialSortOrder)
															$_ptr_Field:=Field:C253(<>FS_al_FormSortTableNum{$_l_SortRow}; $FS_l_SortFieldNUM)
															$_ptr_Field2:=Field:C253(<>FS_al_FormSortTableNum{$_l_SortRow}; $FS_l_SortFieldNUM2)
															//`ALERT("Stage 8M-2"+String($_l_TableNumber)+" "+String($_l_SortRow)+" "+$_t_CurrentDefinitionsName+" "+String(FS_l_SortDirection)+"FIeld"+String(FS_l_SortFieldNUM)+"Special Sort")
															If (Not:C34(Is nil pointer:C315($_ptr_Table2))) & (Not:C34(Is nil pointer:C315($_ptr_Field))) & (Not:C34(Is nil pointer:C315($_ptr_Field2)))
																ORDER BY:C49($_ptr_Table2->; $_ptr_Field->; $_ptr_Field2->; <)
															End if   //`ALERT("Stage 8n-2"+String($_l_TableNumber)+" "+String($_l_SortRow)+" "+$_t_CurrentDefinitionsName+" "+String(FS_l_SortDirection)+"FIeld"+String(FS_l_SortFieldNUM)+"Spercial sort done")
															
														Else 
															//`ALERT("Stage 8M-2"+String($_l_TableNumber)+" "+String($_l_SortRow)+" "+$_t_CurrentDefinitionsName+" "+String(FS_l_SortDirection)+"FIeld"+String(FS_l_SortFieldNUM)+"Sort")
															If (Not:C34(Is nil pointer:C315($_ptr_Table2))) & (Not:C34(Is nil pointer:C315($_ptr_Field)))
																ORDER BY:C49($_ptr_Table2->; $_ptr_Field->; <)
															End if   //`ALERT("Stage 8M-2"+String($_l_TableNumber)+" "+String($_l_SortRow)+" "+$_t_CurrentDefinitionsName+" "+String(FS_l_SortDirection)+"FIeld"+String(FS_l_SortFieldNUM)+"Sort done")
															
														End if 
													End if 
													SET AUTOMATIC RELATIONS:C310(False:C215; False:C215)
												Else 
													//`ALERT("Stage 8L_3"+String($_l_TableNumber)+" "+String($_l_SortRow)+" "+$_t_CurrentDefinitionsName+" "+String(FS_l_SortDirection)+"FIeld"+String(FS_l_SortFieldNUM)+"Auto relations true")
													
													If ($_ptr_areaTypeVariable-><3)  //array based)
														LISTBOX SORT COLUMNS:C916($_ptr_ListboxArea->; $_l_ColumnIndex; <)
													Else 
														$_ptr_Table:=Table:C252(<>FS_al_FormSortTableNum{$_l_SortRow})
														$_ptr_Field:=Field:C253(<>FS_al_FormSortTableNum{$_l_SortRow}; FS_l_SortFieldNUM)
														
														
														If ($_bo_SpecialSortOrder)
															$_ptr_Field:=Field:C253(<>FS_al_FormSortTableNum{$_l_SortRow}; $FS_l_SortFieldNUM)
															$_ptr_Field2:=Field:C253(<>FS_al_FormSortTableNum{$_l_SortRow}; $FS_l_SortFieldNUM2)
															//`ALERT("Stage 8M-3"+String($_l_TableNumber)+" "+String($_l_SortRow)+" "+$_t_CurrentDefinitionsName+" "+String(FS_l_SortDirection)+"FIeld"+String(FS_l_SortFieldNUM)+"Special Sort")
															If (Not:C34(Is nil pointer:C315($_ptr_Table))) & (Not:C34(Is nil pointer:C315($_ptr_Field))) & (Not:C34(Is nil pointer:C315($_ptr_Field2)))
																ORDER BY:C49($_ptr_Table->; $_ptr_Field->; $_ptr_Field2->; <)
															End if   //`ALERT("Stage 8N-3"+String($_l_TableNumber)+" "+String($_l_SortRow)+" "+$_t_CurrentDefinitionsName+" "+String(FS_l_SortDirection)+"FIeld"+String(FS_l_SortFieldNUM)+"Special Sort done")
															
														Else 
															//`ALERT("Stage 8M-3"+String($_l_TableNumber)+" "+String($_l_SortRow)+" "+$_t_CurrentDefinitionsName+" "+String(FS_l_SortDirection)+"FIeld"+String(FS_l_SortFieldNUM)+" Sort")
															If (Not:C34(Is nil pointer:C315($_ptr_Table))) & (Not:C34(Is nil pointer:C315($_ptr_Field)))
																ORDER BY:C49($_ptr_Table->; $_ptr_Field->; <)
															End if 
															
															//`ALERT("Stage 8N-3"+String($_l_TableNumber)+" "+String($_l_SortRow)+" "+$_t_CurrentDefinitionsName+" "+String(FS_l_SortDirection)+"FIeld"+String(FS_l_SortFieldNUM)+"Special Sort")
															
														End if 
													End if 
												End if 
											End if 
											$_bo_isSet:=True:C214
											$_l_ColumnIndex:=999999
										End if 
									End for 
									//`ALERT("Stage 8Q")
									
									If (Not:C34($_bo_isSet))
										//AL_SetSort NG TODO:($_ptr_ListboxArea->;0)
										If ($_ptr_areaTypeVariable-><3)  //array based)
											//`ALERT("Stage 8R")
											
											LISTBOX SORT COLUMNS:C916($_ptr_ListboxArea->; 0; >)
											//`ALERT("Stage 8S")
											
										End if 
									End if 
									
								Else 
									//`ALERT("Stage 8T")
									
									//TRACE//=this should not happen
									If (False:C215)
										$_ptr_ListboxArea:=$_ptr_ListboxSetup->{1}
										
										//Sort field is actually a column(subtable)
										If (Abs:C99(FS_l_SortDirection)<=1)
											LISTBOX SORT COLUMNS:C916($_ptr_ListboxArea->; Abs:C99(FS_l_SortFieldNUM); >)
										Else 
											LISTBOX SORT COLUMNS:C916($_ptr_ListboxArea->; Abs:C99(FS_l_SortFieldNUM); <)
										End if 
									End if 
								End if 
								
							Else 
								
							End if 
						End if 
						CLEAR SEMAPHORE:C144("$WriteFormsortPref")
					Else 
						//ALERT("Stage 8U")
						
						//read from the variables
						$_l_SortRow:=Find in array:C230(<>FS_at_FormReference; $_t_CurrentDefinitionsName)
						If ($_l_SortRow>0)
							//ALERT("Stage 8U-1"+String($_l_TableNumber)+" "+String($_l_SortRow)+" "+$_t_CurrentDefinitionsName+" "+String(FS_l_SortDirection)+"FIeld"+String(FS_l_SortFieldNUM))
							
							FS_t_SortVariableName:=<>FS_at_FormSortvariable{$_l_SortRow}
							FS_l_SortFieldNUM:=<>FS_al_FormSortFieldNum{$_l_SortRow}  //Longint
							FS_l_SortDirection:=Abs:C99(<>FS_al_FormSortDirection{$_l_SortRow})
							If ($_bo_SetSort)
								//ALERT("Stage 8M-3"+String($_l_TableNumber)+" "+String($_l_SortRow)+" "+$_t_CurrentDefinitionsName+" "+String(FS_l_SortDirection)+"FIeld"+String(FS_l_SortFieldNUM)+"Set Sort")
								
								If (FS_l_SortFieldNUM>=0)
									//ALERT("Stage 8M-3A")
									FS_l_SortTableNUM:=<>FS_al_FormSortTableNum{$_l_SortRow}
									$_ptr_ArrayFieldPointers:=$_ptr_ListboxSetup->{2}
									$_l_NumberofColumns:=Size of array:C274($_ptr_ArrayFieldPointers->)
									$_ptr_ListboxArea:=$_ptr_ListboxSetup->{1}
									$_bo_isSet:=False:C215
									//ALERT("Stage 8M-3B")
									For ($_l_ColumnIndex; 1; $_l_NumberofColumns)
										//ALERT("Stage 8M-3C")
										If (FS_l_SortFieldNUM=Field:C253($_ptr_ArrayFieldPointers->{$_l_ColumnIndex})) & (Table:C252($_ptr_ArrayFieldPointers->{$_l_ColumnIndex})=FS_l_SortTableNUM)
											//ALERT("Stage 8M-3D")
											$_l_ThisHeaderVariableDefault:=1
											$_Ptr_ThisHeaderVariable:=->$_Ptr_ThisHeaderVariableDefault
											If (Size of array:C274($_aptr_HeaderVariables)>=$_l_ColumnIndex)
												$_Ptr_ThisHeaderVariable:=$_aptr_HeaderVariables{$_l_ColumnIndex}
											End if 
											
											$_l_CurrentSortSetting:=$_Ptr_ThisHeaderVariable->
											If (False:C215)
												If ($_l_CurrentSortSetting=1)
													If (FS_l_SortDirection<0)
														FS_l_SortDirection:=1
													End if 
												End if 
												If ($_l_CurrentSortSetting=2)
													If (FS_l_SortDirection>0)
														FS_l_SortDirection:=-1
													End if 
												End if 
											End if 
											
											If (FS_l_SortDirection<2)
												//ALERT("Stage 8M-3E")
												If (Size of array:C274($_aptr_HeaderVariables)>=$_l_ColumnIndex)
													$_Ptr_ThisHeaderVariable->:=1
												End if 
												If (FS_l_SortTableNUM#$_l_TableNumber)
													//ALERT("Stage 8M-3F")
													$_bo_RelationFound:=False:C215
													For ($_l_FieldIndex; 1; Get last field number:C255($_l_TableNumber))
														If (Is field number valid:C1000($_l_TableNumber; $_l_FieldIndex))
															GET RELATION PROPERTIES:C686($_l_TableNumber; $_l_FieldIndex; $_l_OneTable; $_l_OneField)
															If ($_l_OneTable=FS_l_SortTableNUM)
																$_Ptr_Field:=Field:C253($_l_TableNumber; $_l_FieldIndex)
																SET FIELD RELATION:C919($_Ptr_Field->; Automatic:K51:4; Manual:K51:3)
																$_bo_RelationFound:=True:C214
																$_l_FieldIndex:=99999
															End if 
														End if 
													End for 
													If (Not:C34($_bo_RelationFound))
														SET AUTOMATIC RELATIONS:C310(True:C214; True:C214)
													End if 
													If ($_ptr_areaTypeVariable-><3)  //array based)
														//ALERT("Stage 8M-3G")
														LISTBOX SORT COLUMNS:C916($_ptr_ListboxArea->; $_l_ColumnIndex; >)
													Else 
														
														//ALERT("Stage 8M-3H")
														$_bo_SpecialSortOrder:=False:C215
														$_ptr_Table2:=Table:C252($_l_CurrentDisplayedForm)
														$_ptr_Table:=Table:C252(FS_l_SortTableNUM)
														$_ptr_Field:=Field:C253(FS_l_SortTableNUM; FS_l_SortFieldNUM)
														Case of 
															: (FS_l_SortTableNUM=Table:C252(->[COMPANIES:2]))
																//ALERT("Stage 8M-3I")
																//if(FS_l_SortFieldNUM=FIeld(»[companies]
															: (FS_l_SortTableNUM=Table:C252(->[CONTACTS:1]))
																If (FS_l_SortFieldNUM=Field:C253(->[CONTACTS:1]Email_Address:35))
																	//ALERT("Stage 8U"+String($_l_TableNumber)+" "+String($_l_SortRow)+" "+$_t_CurrentDefinitionsName+" "+String(FS_l_SortDirection)+"FIeld"+String(FS_l_SortFieldNUM)+"Sort by email")
																	
																	$_bo_SpecialSortOrder:=True:C214
																	$FS_l_SortFieldNUM:=Field:C253(->[CONTACTS:1]Email_Before_At:30)
																	$FS_l_SortFieldNUM2:=Field:C253(->[CONTACTS:1]EMail_After_At:24)
																	$_ptr_Field:=Field:C253(FS_l_SortTableNUM; $FS_l_SortFieldNUM)
																	$_ptr_Field2:=Field:C253(FS_l_SortTableNUM; $FS_l_SortFieldNUM2)
																End if 
																
														End case 
														If ($_bo_SpecialSortOrder)
															//ALERT("Stage 8u"+String($_l_TableNumber)+" "+String($_l_SortRow)+" "+$_t_CurrentDefinitionsName+" "+String(FS_l_SortDirection)+"FIeld"+String(FS_l_SortFieldNUM)+"Special Sort")
															If (Not:C34(Is nil pointer:C315($_ptr_Table2))) & (Not:C34(Is nil pointer:C315($_ptr_Field))) & (Not:C34(Is nil pointer:C315($_ptr_Field2)))
																ORDER BY:C49($_ptr_Table2->; $_ptr_Field->; $_ptr_Field2->; >)
															End if 
															//ALERT("Stage 8U"+String($_l_TableNumber)+" "+String($_l_SortRow)+" "+$_t_CurrentDefinitionsName+" "+String(FS_l_SortDirection)+"FIeld"+String(FS_l_SortFieldNUM)+"Special Sort done")
															
														Else 
															//ALERT("Stage 8u"+String($_l_TableNumber)+" "+String($_l_SortRow)+" "+$_t_CurrentDefinitionsName+" "+String(FS_l_SortDirection)+"FIeld"+String(FS_l_SortFieldNUM)+"Special Sort")
															If (Not:C34(Is nil pointer:C315($_ptr_Table2))) & (Not:C34(Is nil pointer:C315($_ptr_Field)))
																ORDER BY:C49($_ptr_Table2->; $_ptr_Field->; >)
															End if   //ALERT("Stage 8U"+String($_l_TableNumber)+" "+String($_l_SortRow)+" "+$_t_CurrentDefinitionsName+" "+String(FS_l_SortDirection)+"FIeld"+String(FS_l_SortFieldNUM)+"Special Sort done")
															
														End if 
													End if 
													SET AUTOMATIC RELATIONS:C310(False:C215; False:C215)
												Else 
													//ALERT("Stage 8U2"+String($_l_TableNumber)+" "+String($_l_SortRow)+" "+$_t_CurrentDefinitionsName+" "+String(FS_l_SortDirection)+"FIeld"+String(FS_l_SortFieldNUM))
													If ($_l_ColumnIndex<=Size of array:C274($_aptr_HeaderVariables))
														$_Ptr_ThisHeaderVariable:=$_aptr_HeaderVariables{$_l_ColumnIndex}
													Else 
														$_l_ThisHeaderVariableDefault:=1
														$_Ptr_ThisHeaderVariable:=->$_l_ThisHeaderVariableDefault
													End if 
													$_l_CurrentSortSetting:=$_Ptr_ThisHeaderVariable->
													//AL_SetSort NG TODO:($_ptr_ListboxArea->;$_l_ColumnIndex)
													//SORT LISTBOX COLUMNS($_ptr_ListboxArea->;$_l_ColumnIndex;>)
													If ($_ptr_areaTypeVariable-><3)  //array based)
														LISTBOX SORT COLUMNS:C916($_ptr_ListboxArea->; $_l_ColumnIndex; >)
													Else 
														$_bo_SpecialSortOrder:=False:C215
														$_ptr_Table:=Table:C252(FS_l_SortTableNUM)
														$_ptr_Field:=Field:C253(FS_l_SortTableNUM; FS_l_SortFieldNUM)
														Case of 
															: (FS_l_SortTableNUM=Table:C252(->[COMPANIES:2]))
																//if(FS_l_SortFieldNUM=FIeld(»[companies]
															: (FS_l_SortTableNUM=Table:C252(->[CONTACTS:1]))
																If (FS_l_SortFieldNUM=Field:C253(->[CONTACTS:1]Email_Address:35))
																	$_bo_SpecialSortOrder:=True:C214
																	//ALERT("Stage 8U2"+String($_l_TableNumber)+" "+String($_l_SortRow)+" "+$_t_CurrentDefinitionsName+" "+String(FS_l_SortDirection)+"FIeld"+String(FS_l_SortFieldNUM)+"Sort by email")
																	
																	$FS_l_SortFieldNUM:=Field:C253(->[CONTACTS:1]Email_Before_At:30)
																	$FS_l_SortFieldNUM2:=Field:C253(->[CONTACTS:1]EMail_After_At:24)
																	$_ptr_Field:=Field:C253(FS_l_SortTableNUM; $FS_l_SortFieldNUM)
																	$_ptr_Field2:=Field:C253(FS_l_SortTableNUM; $FS_l_SortFieldNUM2)
																End if 
																
														End case 
														If ($_bo_SpecialSortOrder)
															//ALERT("Stage 8U2"+String($_l_TableNumber)+" "+String($_l_SortRow)+" "+$_t_CurrentDefinitionsName+" "+String(FS_l_SortDirection)+"FIeld"+String(FS_l_SortFieldNUM)+"Special Sort")
															If (Not:C34(Is nil pointer:C315($_ptr_Table))) & (Not:C34(Is nil pointer:C315($_ptr_Field))) & (Not:C34(Is nil pointer:C315($_ptr_Field2)))
																ORDER BY:C49($_ptr_Table->; $_ptr_Field->; $_ptr_Field2->; >)
															End if   //ALERT("Stage 8U2"+String($_l_TableNumber)+" "+String($_l_SortRow)+" "+$_t_CurrentDefinitionsName+" "+String(FS_l_SortDirection)+"FIeld"+String(FS_l_SortFieldNUM)+"Special Sort done")
															
														Else 
															If (Not:C34(Is nil pointer:C315($_ptr_Table))) & (Not:C34(Is nil pointer:C315($_ptr_Field)))
																ORDER BY:C49($_ptr_Table->; $_ptr_Field->; >)
															End if   //ALERT("Stage 8U2"+String($_l_TableNumber)+" "+String($_l_SortRow)+" "+$_t_CurrentDefinitionsName+" "+String(FS_l_SortDirection)+"FIeld"+String(FS_l_SortFieldNUM)+"Sort done")
															
														End if 
														
													End if 
												End if 
												
											Else 
												If (Size of array:C274($_aptr_HeaderVariables)>=$_l_ColumnIndex)
													$_Ptr_ThisHeaderVariable->:=2
												End if 
												If (FS_l_SortTableNUM#$_l_TableNumber)
													$_bo_RelationFound:=False:C215
													For ($_l_FieldIndex; 1; Get last field number:C255($_l_TableNumber))
														If (Is field number valid:C1000($_l_TableNumber; $_l_FieldIndex))
															GET RELATION PROPERTIES:C686($_l_TableNumber; $_l_FieldIndex; $_l_OneTable; $_l_OneField)
															If ($_l_OneTable=FS_l_SortTableNUM)
																$_Ptr_Field:=Field:C253($_l_TableNumber; $_l_FieldIndex)
																SET FIELD RELATION:C919($_Ptr_Field->; Automatic:K51:4; Manual:K51:3)
																$_bo_RelationFound:=True:C214
																$_l_FieldIndex:=99999
															End if 
														End if 
													End for 
													If (Not:C34($_bo_RelationFound))
														SET AUTOMATIC RELATIONS:C310(True:C214; True:C214)
													End if 
													If ($_ptr_areaTypeVariable-><3)  //array based)
														LISTBOX SORT COLUMNS:C916($_ptr_ListboxArea->; $_l_ColumnIndex; <)
													Else 
														$_bo_SpecialSortOrder:=False:C215
														$_ptr_Table2:=Table:C252($_l_CurrentDisplayedForm)
														$_ptr_Table:=Table:C252(FS_l_SortTableNUM)
														$_ptr_Field:=Field:C253(FS_l_SortTableNUM; FS_l_SortFieldNUM)
														Case of 
															: (FS_l_SortTableNUM=Table:C252(->[COMPANIES:2]))
																//if(FS_l_SortFieldNUM=FIeld(»[companies]
															: (FS_l_SortTableNUM=Table:C252(->[CONTACTS:1]))
																If (FS_l_SortFieldNUM=Field:C253(->[CONTACTS:1]Email_Address:35))
																	$_bo_SpecialSortOrder:=True:C214
																	$FS_l_SortFieldNUM:=Field:C253(->[CONTACTS:1]Email_Before_At:30)
																	$FS_l_SortFieldNUM2:=Field:C253(->[CONTACTS:1]EMail_After_At:24)
																	$_ptr_Field:=Field:C253(FS_l_SortTableNUM; $FS_l_SortFieldNUM)
																	$_ptr_Field2:=Field:C253(FS_l_SortTableNUM; $FS_l_SortFieldNUM2)
																End if 
																
														End case 
														If (Not:C34(Is nil pointer:C315($_ptr_Table2))) & (Not:C34(Is nil pointer:C315($_ptr_Field)))
															
															If ($_bo_SpecialSortOrder)
																ORDER BY:C49($_ptr_Table2->; $_ptr_Field->; $_ptr_Field2->; <)
															Else 
																ORDER BY:C49($_ptr_Table2->; $_ptr_Field->; <)
															End if 
														End if 
													End if 
													SET AUTOMATIC RELATIONS:C310(False:C215; False:C215)
												Else 
													//AL_SetSort NG TODO:($_ptr_ListboxArea->;-$_l_ColumnIndex)
													If ($_ptr_areaTypeVariable-><3)  //array based)
														LISTBOX SORT COLUMNS:C916($_ptr_ListboxArea->; $_l_ColumnIndex; <)
													Else 
														$_bo_SpecialSortOrder:=False:C215
														$_ptr_Table:=Table:C252(FS_l_SortTableNUM)
														$_ptr_Field:=Field:C253(FS_l_SortTableNUM; FS_l_SortFieldNUM)
														Case of 
															: (FS_l_SortTableNUM=Table:C252(->[COMPANIES:2]))
																//if(FS_l_SortFieldNUM=FIeld(»[companies]
															: (FS_l_SortTableNUM=Table:C252(->[CONTACTS:1]))
																If (FS_l_SortFieldNUM=Field:C253(->[CONTACTS:1]Email_Address:35))
																	$_bo_SpecialSortOrder:=True:C214
																	$FS_l_SortFieldNUM:=Field:C253(->[CONTACTS:1]Email_Before_At:30)
																	$FS_l_SortFieldNUM2:=Field:C253(->[CONTACTS:1]EMail_After_At:24)
																	$_ptr_Field:=Field:C253(FS_l_SortTableNUM; $FS_l_SortFieldNUM)
																	$_ptr_Field2:=Field:C253(FS_l_SortTableNUM; $FS_l_SortFieldNUM2)
																End if 
																
														End case 
														If (Not:C34(Is nil pointer:C315($_ptr_Table))) & (Not:C34(Is nil pointer:C315($_ptr_Field)))
															
															If ($_bo_SpecialSortOrder)
																If (Not:C34(Is nil pointer:C315($_ptr_Field2)))
																	ORDER BY:C49($_ptr_Table->; $_ptr_Field->; $_ptr_Field2->; <)
																End if 
															Else 
																ORDER BY:C49($_ptr_Table->; $_ptr_Field->; <)
															End if 
														End if 
													End if 
												End if 
												
											End if 
											$_bo_isSet:=True:C214
											$_l_ColumnIndex:=999999
										End if 
									End for 
									If (Not:C34($_bo_isSet))
										//AL_SetSort NG TODO:($_ptr_ListboxArea->;0)
										//SORT LISTBOX COLUMNS($_ptr_ListboxArea->;0;<)
									End if 
								Else 
									//Sort field is actually a column(subtable)
									If (False:C215)
										$_ptr_ListboxArea:=$_ptr_ListboxSetup->{1}
										If (FS_l_SortDirection>=0)
											//AL_SetSort NG TODO:($_ptr_ListboxArea->;Abs(FS_l_SortFieldNUM))
											
											LISTBOX SORT COLUMNS:C916($_ptr_ListboxArea->; Abs:C99(FS_l_SortFieldNUM); >)
										Else 
											//AL_SetSort NG TODO:($_ptr_ListboxArea->;-(Abs(FS_l_SortFieldNUM)))
											LISTBOX SORT COLUMNS:C916($_ptr_ListboxArea->; Abs:C99(FS_l_SortFieldNUM); <)
										End if 
									End if 
								End if 
								
							Else 
								
								
								$0:=Abs:C99(FS_l_SortFieldNUM)
							End if 
						Else 
							$_ptr_ListboxArea:=$_ptr_ListboxSetup->{1}
							LISTBOX SORT COLUMNS:C916($_ptr_ListboxArea->; 0; >)
						End if 
					End if 
				End if 
			End if 
		End if 
	End if 
End if 
DB_UpdateScreenInfo(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
ERR_MethodTrackerReturn("DB_SetFormSortOrder"; $_t_oldMethodName)