//%attributes = {}
If (False:C215)
	//Project Method Name:      LBi_ArrUpdate
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2013 12:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
	ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
	ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	//ARRAY TEXT(<>QV_at_QualitiesItemNames;0)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	ARRAY TEXT:C222($_at_NulArray; 0)
	C_BOOLEAN:C305($_bo_Empty; $_bo_False; $_bo_FormulaisField; $_bo_OK; $_bo_PopUp; $_bo_Related; $_bo_True; $3; DB_bo_RecordModified)
	C_DATE:C307(vDate)
	C_LONGINT:C283($_l_AreaType; $_l_CurrentField; $_l_CurrentField2; $_l_DataType2; $_l_EndTablePosition; $_l_FieldIndex; $_l_FieldNumber; $_l_FieldNumber2; $_l_index; $_l_LastFieldNumber; $_l_LastTableNumber)
	C_LONGINT:C283($_l_NumberofColumns; $_l_OpenBracketPosition; $_l_OpenTablePosition; $_l_TableIndex; $_l_TableNumber; $_l_TableNumber2; $_l_TestFieldNumber3; $_l_TestTableNumber; $_l_TestTableNumber2; $_l_TestTableNumber3; $_l_Type)
	C_LONGINT:C283($2)
	C_POINTER:C301($_ptr_areaTypeVariable; $_ptr_ArrayFields; $_ptr_ArrayFormulas; $_ptr_ArrayofArrayPointers; $_ptr_ArrayVariables; $_ptr_CellPointer; $_ptr_DataSource; $_ptr_FieldPointer; $_Ptr_LastColumn; $_ptr_LBTable; $_ptr_ListboxArea)
	C_POINTER:C301($_Ptr_ListBoxVar; $_Ptr_ListBoxVar2; $_ptr_OutputFieldFromFormula; $_ptr_RelatedField; $_Ptr_ThisColumnArray; $_ptr_VariablePointer2; $1)
	C_REAL:C285(LB_r_Num; vAmount)
	C_TEXT:C284($_t_After; $_t_CurrentErrorMethodName; $_t_DatabaseFieldName; $_t_DataString; $_t_DataTableName; $_t_FormulaFieldName; $_t_FormulaTableName; $_t_FormulaText; $_t_Group; $_t_oldMethodName; $_t_OldMethodName2)
	C_TEXT:C284($_t_VariableName; $_t_VariableName2; vMTitle2; vT)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("LBi_ArrUpdate")

//NG this method is a replacement for LBi_ArrUpdate
//ALArrUpdate - update arrays from record after mods

//this $3 is there to minimise the Relate ones, but it is possible
//that someone will put in a related field that is not linked to
//by the LPX or LPB procedure before it gets here - in which case
//the related data will not appear ... risk it?
If (Count parameters:C259>=1)
	$_Ptr_ListBoxVar:=$1
	RESOLVE POINTER:C394($_Ptr_ListBoxVar; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
	$_Ptr_ListBoxVar2:=Get pointer:C304($_t_VariableName)
	
	
	
	If (Type:C295($_Ptr_ListBoxVar->)=13)  //it is a 2D array
		
		
		$_ptr_ListboxArea:=$_Ptr_ListBoxVar2->{$_l_TableNumber}{1}
		$_ptr_ArrayFields:=$_Ptr_ListBoxVar2->{$_l_TableNumber}{2}
		$_ptr_ArrayofArrayPointers:=$_Ptr_ListBoxVar2->{$_l_TableNumber}{3}
		$_ptr_ArrayFormulas:=$_Ptr_ListBoxVar2->{$_l_TableNumber}{6}  //10
	Else 
		$_ptr_ListboxArea:=$_Ptr_ListBoxVar->{1}
		$_ptr_ArrayFields:=$_Ptr_ListBoxVar->{2}
		$_ptr_ArrayofArrayPointers:=$_Ptr_ListBoxVar->{3}
		$_ptr_ArrayFormulas:=$_Ptr_ListBoxVar->{6}  //10
		If (Size of array:C274($_Ptr_ListBoxVar->)>=19)
			$_ptr_areaTypeVariable:=$_Ptr_ListBoxVar->{19}
			$_l_AreaType:=$_ptr_areaTypeVariable->
		Else 
			$_l_AreaType:=1
		End if 
		
		$_l_NumberofColumns:=Size of array:C274($_ptr_ArrayFields->)
		//$_Ptr_ThisColumnArray
		$_Ptr_LastColumn:=$_ptr_ArrayFields->{$_l_NumberofColumns}
		$_l_Type:=Type:C295($_Ptr_LastColumn->)
		$_t_Group:=""
		If ($_l_AreaType<3)
			If ($_l_Type=7)  //If a subfile then don't do the last col, nor formuale--this will never be so now
				For ($_l_index; 1; $_l_NumberofColumns-1)
					If ($3)
						If ($_ptr_ArrayFormulas->{$_l_index}="Relate one@")
							RESOLVE POINTER:C394($_ptr_ArrayFormulas; $_t_VariableName2; $_l_TableNumber2; $_l_FieldNumber2)
							$_ptr_VariablePointer2:=Get pointer:C304($_t_VariableName2)
							
							
							If (Type:C295($_ptr_ArrayFormulas->)=13)  //it is a 2D array
								$_t_OldMethodName2:=ERR_MethodTracker("EXECUTE: "+$_ptr_VariablePointer2->{$_l_TableNumber2}{$_l_index})
								$_t_FormulaText:=$_ptr_VariablePointer2->{$_l_TableNumber2}{$_l_index}
								EXECUTE FORMULA:C63($_t_FormulaText)
							Else 
								$_t_OldMethodName2:=ERR_MethodTracker("EXECUTE: "+$_ptr_ArrayFormulas->{$_l_index})
								EXECUTE FORMULA:C63($_ptr_ArrayFormulas->{$_l_index})
							End if 
							
						End if 
					End if 
					
					RESOLVE POINTER:C394($_ptr_ArrayFields; $_t_VariableName2; $_l_TableNumber2; $_l_FieldNumber2)
					$_ptr_VariablePointer2:=Get pointer:C304($_t_VariableName2)
					
					If (Type:C295($_ptr_ArrayFields->)=13)  //it is a 2D array
						$_ptr_DataSource:=$_ptr_VariablePointer2->{$_l_TableNumber2}{$_l_index}
					Else 
						$_ptr_DataSource:=$_ptr_ArrayFields->{$_l_index}
					End if 
					
					$_l_TestTableNumber:=Table:C252(->[INFORMATION:55])
					$_l_CurrentField:=Field:C253(->[INFORMATION:55]SubGroup:6)
					$_l_TestTableNumber2:=Table:C252($_ptr_DataSource)
					$_l_CurrentField2:=Field:C253($_ptr_DataSource)
					$_bo_PopUp:=False:C215
					$_l_TestTableNumber3:=Table:C252(->[INFORMATION:55])
					$_l_TestFieldNumber3:=Field:C253(->[INFORMATION:55]Group:2)
					If ($_l_TestTableNumber3=$_l_TestTableNumber2)
						If ($_l_TestFieldNumber3=$_l_CurrentField2)
							$_t_Group:=$_ptr_DataSource->
						End if 
					End if 
					
					If ($_l_TestTableNumber=$_l_TestTableNumber2)
						If ($_l_CurrentField=$_l_CurrentField2)
							//THIS IS POINTING AT SUBGROUP
							//WE NEED TO MAKE SELECTION VIA POPUP
							If (Size of array:C274(<>QV_at_QualitiesItemNames)>0)
								//THEN WE HAVE A POP UP
								$_bo_PopUp:=True:C214
							End if 
						End if 
					End if 
					RESOLVE POINTER:C394($_ptr_ArrayofArrayPointers; $_t_VariableName2; $_l_TableNumber2; $_l_FieldNumber2)
					$_ptr_VariablePointer2:=Get pointer:C304($_t_VariableName2)
					
					If (Type:C295($_ptr_ArrayofArrayPointers->)=13)  //it is a 2D array
						$_Ptr_ThisColumnArray:=$_ptr_VariablePointer2->{$_l_TableNumber2}{$_l_index}
						RESOLVE POINTER:C394($_Ptr_ThisColumnArray; $_t_VariableName2; $_l_TableNumber2; $_l_FieldNumber2)
						$_ptr_VariablePointer2:=Get pointer:C304($_t_VariableName2)
						If (Type:C295($_Ptr_ThisColumnArray->)=13)  //it is a 2D array
							$_ptr_VariablePointer2->{$_l_TableNumber}{$2}:=$_ptr_DataSource->
							//  $_bo_Empty:=($_ptr_VariablePointer2->{$_l_TableNumber}{$2}="")
							
							Case of 
								: (Type:C295($_ptr_DataSource->)=24) | (Type:C295($_ptr_DataSource->)=2)
									
									$_bo_Empty:=($_ptr_VariablePointer2->{$_l_TableNumber}{$2}="")
								: (Type:C295($_ptr_DataSource->)=8) | (Type:C295($_ptr_DataSource->)=9) | (Type:C295($_ptr_DataSource->)=1)
									
									
									$_bo_Empty:=($_ptr_VariablePointer2->{$_l_TableNumber}{$2}=0)
								: (Type:C295($_ptr_DataSource->)=6)
									
									
									$_bo_Empty:=($_ptr_VariablePointer2->{$_l_TableNumber}{$2}=True:C214)
									
								: (Type:C295($_ptr_DataSource->)=4)
									
									
									$_bo_Empty:=($_ptr_VariablePointer2->{$_l_TableNumber}{$2}=!00-00-00!)
								: (Type:C295($_ptr_DataSource->)=11)
									
									
									$_bo_Empty:=($_ptr_VariablePointer2->{$_l_TableNumber}{$2}=?00:00:00?)
								Else 
									$_bo_Empty:=False:C215
							End case 
						Else 
							$_Ptr_ThisColumnArray->{$2}:=$_ptr_DataSource->
							//$_bo_Empty:=($_Ptr_ThisColumnArray->{$2}="")
							Case of 
								: (Type:C295($_Ptr_ThisColumnArray->{$2})=24) | (Type:C295($_Ptr_ThisColumnArray->{$2})=2)
									
									
									$_bo_Empty:=($_Ptr_ThisColumnArray->{$2}="")
								: (Type:C295($_Ptr_ThisColumnArray->{$2})=8) | (Type:C295($_Ptr_ThisColumnArray->{$2})=9) | (Type:C295($_Ptr_ThisColumnArray->{$2})=1)
									
									
									$_bo_Empty:=($_Ptr_ThisColumnArray->{$2}=0)
								: (Type:C295($_Ptr_ThisColumnArray->{$2})=6)
									
									
									$_bo_Empty:=($_Ptr_ThisColumnArray->{$2}=True:C214)
									
								: (Type:C295($_Ptr_ThisColumnArray->{$2})=4)
									
									
									$_bo_Empty:=($_Ptr_ThisColumnArray->{$2}=!00-00-00!)
								: (Type:C295($_Ptr_ThisColumnArray->{$2})=11)
									
									
									$_bo_Empty:=($_Ptr_ThisColumnArray->{$2}=?00:00:00?)
								Else 
									$_bo_Empty:=False:C215
							End case 
						End if 
					Else 
						
						$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_index}
						RESOLVE POINTER:C394($_Ptr_ThisColumnArray; $_t_VariableName2; $_l_TableNumber2; $_l_FieldNumber2)
						$_ptr_VariablePointer2:=Get pointer:C304($_t_VariableName2)
						If (Type:C295($_Ptr_ThisColumnArray->)=13)  //it is a 2D array
							$_ptr_VariablePointer2->{$_l_TableNumber}{$2}:=$_ptr_DataSource->
							Case of 
								: (Type:C295($_ptr_VariablePointer2->{$_l_TableNumber}{$2})=24) | (Type:C295($_ptr_VariablePointer2->{$_l_TableNumber}{$2})=2)
									$_bo_Empty:=($_ptr_VariablePointer2->{$_l_TableNumber}{$2}="")
								: (Type:C295($_ptr_VariablePointer2->{$_l_TableNumber}{$2})=8) | (Type:C295($_ptr_VariablePointer2->{$_l_TableNumber}{$2})=9) | (Type:C295($_ptr_VariablePointer2->{$_l_TableNumber}{$2})=1)
									$_bo_Empty:=($_ptr_VariablePointer2->{$_l_TableNumber}{$2}=0)
								: (Type:C295($_ptr_VariablePointer2->{$_l_TableNumber}{$2})=6)
									$_bo_Empty:=($_ptr_VariablePointer2->{$_l_TableNumber}{$2}=True:C214)
									
								: (Type:C295($_ptr_VariablePointer2->{$_l_TableNumber}{$2})=4)
									$_bo_Empty:=($_ptr_VariablePointer2->{$_l_TableNumber}{$2}=!00-00-00!)
								: (Type:C295($_ptr_VariablePointer2->{$_l_TableNumber}{$2})=11)
									$_bo_Empty:=($_ptr_VariablePointer2->{$_l_TableNumber}{$2}=?00:00:00?)
								Else 
									$_bo_Empty:=False:C215
							End case 
						Else 
							$_Ptr_ThisColumnArray->{$2}:=$_ptr_DataSource->
							Case of 
								: (Type:C295($_Ptr_ThisColumnArray->{$2})=24) | (Type:C295($_Ptr_ThisColumnArray->{$2})=2)
									$_bo_Empty:=($_Ptr_ThisColumnArray->{$2}="")
								: (Type:C295($_Ptr_ThisColumnArray->{$2})=8) | (Type:C295($_Ptr_ThisColumnArray->{$2})=9) | (Type:C295($_Ptr_ThisColumnArray->{$2})=1)
									$_bo_Empty:=($_Ptr_ThisColumnArray->{$2}=0)
								: (Type:C295($_Ptr_ThisColumnArray->{$2})=6)
									$_bo_Empty:=($_Ptr_ThisColumnArray->{$2}=True:C214)
									
								: (Type:C295($_Ptr_ThisColumnArray->{$2})=4)
									$_bo_Empty:=($_Ptr_ThisColumnArray->{$2}=!00-00-00!)
								: (Type:C295($_Ptr_ThisColumnArray->{$2})=11)
									$_bo_Empty:=($_Ptr_ThisColumnArray->{$2}=?00:00:00?)
								Else 
									$_bo_Empty:=False:C215
							End case 
						End if 
						
					End if 
					
					If ($_bo_Empty) & ($_bo_PopUp) & ($_t_Group#"")
						//SET THE TYPE TO POP UP
						//AL_SetEnterable ($_ptr_ListboxArea->;$_l_index;2;◊aQL;0)
					Else 
						If ($_l_TestTableNumber=$_l_TestTableNumber2)
							If ($_l_CurrentField=$_l_CurrentField2)
								//AL_SetEnterable ($_ptr_ListboxArea->;$_l_index;1)
							End if 
						End if 
					End if 
					
				End for 
			Else 
				$_bo_Related:=False:C215
				
				For ($_l_index; 1; $_l_NumberofColumns)
					
					RESOLVE POINTER:C394($_ptr_ArrayFields; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
					$_ptr_VariablePointer2:=Get pointer:C304($_t_VariableName)
					$_ptr_FieldPointer:=$_ptr_ArrayFields->{$_l_index}
					If (Type:C295($_ptr_ArrayFields->)=13)  //it is a 2D array
						$_ptr_DataSource:=$_ptr_ArrayVariables->{$_l_TableNumber}{$_l_index}
						RESOLVE POINTER:C394($_ptr_ArrayofArrayPointers; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
						$_ptr_VariablePointer2:=Get pointer:C304($_t_VariableName)
						
						If (Type:C295($_ptr_ArrayFields->)=13)  //it is a 2D array
							
							$_Ptr_ThisColumnArray:=$_ptr_VariablePointer2->{$_l_TableNumber}{$_l_index}
						Else 
							
							$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_index}
						End if 
						
					Else 
						$_ptr_DataSource:=$_ptr_ArrayFields->{$_l_index}
						RESOLVE POINTER:C394($_ptr_ArrayofArrayPointers; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
						$_ptr_VariablePointer2:=Get pointer:C304($_t_VariableName)
						
						If (Type:C295($_ptr_ArrayFields->)=13)  //it is a 2D array
							$_Ptr_ThisColumnArray:=$_ptr_VariablePointer2->{$_l_TableNumber}{$_l_index}
						Else 
							$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_index}
						End if 
						
					End if 
					
					$_l_TestTableNumber:=Table:C252(->[INFORMATION:55])
					$_l_CurrentField:=Field:C253(->[INFORMATION:55]SubGroup:6)
					$_l_TestTableNumber2:=Table:C252($_ptr_DataSource)
					$_l_CurrentField2:=Field:C253($_ptr_DataSource)
					$_bo_PopUp:=False:C215
					$_l_TestTableNumber3:=Table:C252(->[INFORMATION:55])
					$_l_TestFieldNumber3:=Field:C253(->[INFORMATION:55]Group:2)
					If ($_l_TestTableNumber3=$_l_TestTableNumber2)
						If ($_l_TestFieldNumber3=$_l_CurrentField2)
							$_t_Group:=$_ptr_DataSource->
						End if 
					End if 
					
					If ($_l_TestTableNumber=$_l_TestTableNumber2)
						If ($_l_CurrentField=$_l_CurrentField2)
							//THIS IS POINTING AT SUBGROUP
							//WE NEED TO MAKE SELECTION VIA POPUP
							If (Size of array:C274(<>QV_at_QualitiesItemNames)>0)
								//THEN WE HAVE A POP UP
								$_bo_PopUp:=True:C214
							End if 
						End if 
					End if 
					If ($3)
						
						If ($_bo_Related=False:C215)  //have to relate manually if the Files are different
							
							$_ptr_LBTable:=Table:C252(Table:C252($_ptr_DataSource))
							RESOLVE POINTER:C394($_Ptr_ListBoxVar; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
							$_ptr_ArrayVariables:=Get pointer:C304($_t_VariableName)
							If (Type:C295($_Ptr_ListBoxVar->)=13)  //it is a 2D array
								
								$_bo_OK:=($_ptr_ArrayVariables->{$_l_TableNumber}{7}#$_ptr_LBTable)
							Else 
								
								$_bo_OK:=($_ptr_LBTable#$_Ptr_ListBoxVar->{7})
							End if 
							If ($_bo_OK)  //WAS {10} until 4.0.038
								If (Type:C295($_Ptr_ListBoxVar->)=13)  //it is a 2D array
									GET AUTOMATIC RELATIONS:C899($_bo_True; $_bo_False)
									SET AUTOMATIC RELATIONS:C310(True:C214; False:C215)
									$_ptr_RelatedField:=$_ptr_ArrayVariables->{$_l_TableNumber}{7}
									RELATE ONE:C42($_ptr_RelatedField->)
									SET AUTOMATIC RELATIONS:C310($_bo_True; $_bo_False)
									
								Else 
									GET AUTOMATIC RELATIONS:C899($_bo_True; $_bo_False)
									SET AUTOMATIC RELATIONS:C310(True:C214; False:C215)
									
									$_ptr_RelatedField:=$_Ptr_ListBoxVar->{7}
									
									RELATE ONE:C42(($_ptr_RelatedField)->)
									SET AUTOMATIC RELATIONS:C310($_bo_True; $_bo_False)
									
									
								End if 
								$_bo_Related:=True:C214
								
							End if 
						Else 
							//is the talble of this column related to the 'current table' of the definitions area
							$_ptr_LBTable:=Table:C252(Table:C252($_ptr_DataSource))
							RESOLVE POINTER:C394($_Ptr_ListBoxVar; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
							$_ptr_ArrayVariables:=Get pointer:C304($_t_VariableName)
							If (Type:C295($_Ptr_ListBoxVar->)=13)  //it is a 2D array
								
								$_bo_OK:=($_ptr_ArrayVariables->{$_l_TableNumber}{7}#$_ptr_LBTable)
							Else 
								
								$_bo_OK:=($_ptr_LBTable#$_Ptr_ListBoxVar->{7})
							End if 
							
							If ($_bo_OK)
								//so what is the relation between
								LB_GetRelation(Table:C252($_Ptr_ListBoxVar->{7}); Table:C252($_ptr_LBTable))
								
							End if 
						End if 
					End if 
					
					RESOLVE POINTER:C394($_Ptr_ThisColumnArray; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
					$_ptr_ArrayVariables:=Get pointer:C304($_t_VariableName)
					If (Type:C295($_Ptr_ThisColumnArray->)=13)  //it is a 2D array
						
						If ($2<=Size of array:C274($_ptr_ArrayVariables->{$_l_TableNumber}))
							$_ptr_ArrayVariables->{$_l_TableNumber}{$2}:=$_ptr_DataSource->
							Case of 
								: (Type:C295($_ptr_DataSource->)=24) | (Type:C295($_ptr_DataSource->)=2)
									
									$_bo_OK:=($_ptr_ArrayVariables->{$_l_TableNumber}{$2}#"")
									
								: (Type:C295($_ptr_DataSource->)=8) | (Type:C295($_ptr_DataSource->)=9) | (Type:C295($_ptr_DataSource->)=1)
									
									$_bo_OK:=($_ptr_ArrayVariables->{$_l_TableNumber}{$2}#0)
									
								: (Type:C295($_ptr_DataSource->)=6)
									
									$_bo_OK:=($_ptr_ArrayVariables->{$_l_TableNumber}{$2}#True:C214)
									
								: (Type:C295($_ptr_DataSource->)=4)
									
									$_bo_OK:=($_ptr_ArrayVariables->{$_l_TableNumber}{$2}#!00-00-00!)
									
								: (Type:C295($_ptr_DataSource->)=11)
									
									$_bo_OK:=($_ptr_ArrayVariables->{$_l_TableNumber}{$2}#?00:00:00?)
									
								Else 
									$_bo_OK:=False:C215
							End case 
						Else 
							$_bo_OK:=False:C215
						End if 
						
					Else 
						
						If (Type:C295($_Ptr_ThisColumnArray->)#5)  //it is a dud
							
							If (Size of array:C274($_Ptr_ThisColumnArray->)>=$2)
								
								
								RESOLVE POINTER:C394($_Ptr_ThisColumnArray; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
								
								
								$_l_DataType2:=Type:C295($_Ptr_ThisColumnArray->)
								$_l_Type:=Type:C295($_ptr_DataSource->)
								//ALERT("TYPE="+String($_l_Type))
								//$_ptr_ArrayVariables:=->($_Ptr_ThisColumnArray->{$2})
								//$_ptr_ArrayVariables->:=$_ptr_DataSource->
								
								Case of 
									: (($_l_Type=24) | ($_l_Type=2) | ($_l_Type=0)) & (($_l_DataType2=21) | ($_l_DataType2=18))
										$_t_DataString:=$_ptr_DataSource->
										$_Ptr_ThisColumnArray->{$2}:=$_t_DataString
										$_bo_OK:=($_ptr_DataSource->#"")
										
									: (($_l_Type=8) | ($_l_Type=9) | ($_l_Type=1)) & (($_l_DataType2=15) | ($_l_DataType2=16) | ($_l_DataType2=14))
										$_Ptr_ThisColumnArray->{$2}:=$_ptr_DataSource->
										$_bo_OK:=($_Ptr_ThisColumnArray->#0)
										
									: ($_l_Type=6) & ($_l_DataType2=22)
										
										$_bo_OK:=($_Ptr_ThisColumnArray->#True:C214)
										
									: ($_l_Type=4) & ($_l_DataType2=17)
										
										$_bo_OK:=($_Ptr_ThisColumnArray->{$2}#!00-00-00!)
										
									: ($_l_Type=11) & ($_l_DataType2=16)
										
										$_bo_OK:=(Time:C179($_Ptr_ThisColumnArray->{$2})#?00:00:00?)
										
									Else 
										
										
										$_bo_OK:=False:C215
								End case 
							Else 
								$_bo_OK:=False:C215
							End if 
						End if 
					End if 
					
					
					If ($_bo_OK) & ($_bo_PopUp) & ($_t_Group#"")
						//SET THE TYPE TO POP UP
						ARRAY TEXT:C222($_at_ColumnNames; 0)
						ARRAY TEXT:C222($_at_HeaderNames; 0)
						ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
						ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
						ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
						ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
						
						
						LISTBOX GET ARRAYS:C832($_ptr_ListboxArea->; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)
						
						LB_SetChoiceList("GenPopUp"+String:C10($_l_index); -><>QV_at_QualitiesItemNames; $_aptr_ColumnVariables{$_l_index})
						
					Else 
						If ($_l_TestTableNumber=$_l_TestTableNumber2)
							If ($_l_CurrentField=$_l_CurrentField2)
								ARRAY TEXT:C222($_at_ColumnNames; 0)
								ARRAY TEXT:C222($_at_HeaderNames; 0)
								ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
								ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
								ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
								ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
								
								
								LISTBOX GET ARRAYS:C832($_ptr_ListboxArea->; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)
								ARRAY TEXT:C222($_at_NulArray; 0)
								LB_SetChoiceList("GenPopUp"+String:C10($_l_index); ->$_at_NulArray; $_aptr_ColumnVariables{$_l_index})
								//AL_SetEnterable ($_ptr_ListboxArea->;$_l_index;1)
							End if 
						End if 
						
					End if 
					RESOLVE POINTER:C394($_ptr_ArrayFormulas; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
					$_ptr_ArrayVariables:=Get pointer:C304($_t_VariableName)
					
					If (Type:C295($_Ptr_ThisColumnArray->)=13)  //it is a 2D array
						//$_bo_OK:=($_ptr_ArrayVariables->{$_l_TableNumber}{$_l_index}#"")
						
						
						$_ptr_CellPointer:=$_ptr_ArrayVariables->{$_l_TableNumber}{$_l_index}
						$_l_Type:=$_ptr_ArrayVariables->{$_l_TableNumber}{$_l_index}
						
						
						Case of 
							: (Type:C295($_l_Type)=24) | (Type:C295($_l_Type)=2)
								$_bo_OK:=($_ptr_ArrayVariables->{$_l_TableNumber}{$_l_index}#"")
							: (Type:C295($_l_Type)=8) | (Type:C295($_l_Type)=9) | (Type:C295($_l_Type)=1)
								$_bo_OK:=($_ptr_ArrayVariables->{$_l_TableNumber}{$_l_index}#0)
							: (Type:C295($_l_Type)=6)
								$_bo_OK:=($_ptr_ArrayVariables->{$_l_TableNumber}{$_l_index}#True:C214)
								
							: (Type:C295($_l_Type)=4)
								$_bo_OK:=($_ptr_ArrayVariables->{$_l_TableNumber}{$_l_index}#!00-00-00!)
							: (Type:C295($_ptr_ArrayVariables->{$_l_TableNumber}{$_l_index})=11)
								$_bo_OK:=($_ptr_ArrayVariables->{$_l_TableNumber}{$_l_index}#?00:00:00?)
							Else 
								$_bo_OK:=False:C215
						End case 
					Else 
						$_bo_OK:=($_ptr_ArrayFormulas->{$_l_index}#"")
					End if 
					
					If ($_bo_OK)  //Calculate the formula - see also ALLoadFmul
						RESOLVE POINTER:C394($_ptr_ArrayofArrayPointers; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
						$_ptr_ArrayVariables:=Get pointer:C304($_t_VariableName)
						If (Type:C295($_ptr_ArrayofArrayPointers->)=13)  //it is a 2D array
							$_Ptr_ThisColumnArray:=$_ptr_ArrayVariables->{$_l_TableNumber}{$_l_index}
							RESOLVE POINTER:C394($_ptr_ArrayFields; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
							$_ptr_ArrayVariables:=Get pointer:C304($_t_VariableName)
							If (Type:C295($_ptr_ArrayFields->)=13)  //it is a 2D array
								$_l_Type:=Type:C295(($_ptr_ArrayVariables->{$_l_TableNumber}{$_l_index})->)
							Else 
								$_l_Type:=Type:C295(($_ptr_ArrayFields->{$_l_index})->)
							End if 
							RESOLVE POINTER:C394($_ptr_ArrayFormulas; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
							$_ptr_ArrayVariables:=Get pointer:C304($_t_VariableName)
							If (Type:C295($_ptr_ArrayFormulas->)=13)  //it is a 2D array
								$_t_FormulaText:=LBi_FmulReplace($_Ptr_ListBoxVar; $_ptr_ArrayVariables->{$_l_TableNumber}{$_l_index}; $2)
							Else 
								$_t_FormulaText:=LBi_FmulReplace($_Ptr_ListBoxVar; $_ptr_ArrayFormulas->{$_l_index}; $2)
							End if 
						Else 
							$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_index}
							
							RESOLVE POINTER:C394($_ptr_ArrayFields; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
							$_ptr_ArrayVariables:=Get pointer:C304($_t_VariableName)
							If (Type:C295($_ptr_ArrayFields->)=13)  //it is a 2D array
								$_l_Type:=Type:C295(($_ptr_ArrayVariables->{$_l_TableNumber}{$_l_index})->)
							Else 
								$_l_Type:=Type:C295(($_ptr_ArrayFields->{$_l_index})->)
							End if 
							RESOLVE POINTER:C394($_ptr_ArrayFormulas; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
							$_ptr_ArrayVariables:=Get pointer:C304($_t_VariableName)
							
							If (Type:C295($_ptr_ArrayFormulas->)=13)  //it is a 2D array
								$_t_FormulaText:=LBi_FmulReplace($_Ptr_ListBoxVar; $_ptr_ArrayVariables->{$_l_TableNumber}{$_l_index}; $2)
							Else 
								$_t_FormulaText:=LBi_FmulReplace($_Ptr_ListBoxVar; $_ptr_ArrayFormulas->{$_l_index}; $2)
								
							End if 
							
						End if 
						$_t_CurrentErrorMethodName:=Method called on error:C704
						ON ERR CALL:C155("Error_Macro")
						vMTitle2:=$_t_FormulaText
						
						$_bo_FormulaisField:=False:C215
						If ($_t_FormulaText="Macro@") | ($_t_FormulaText="Script@")
							If (Position:C15("Macro_ResultTxt"; $_t_FormulaText)=0)
								If (Position:C15("Macro_Result"; $_t_FormulaText)=0)
									$_l_OpenBracketPosition:=Position:C15("("; $_t_FormulaText)
									If ($_l_OpenBracketPosition>0)
										$_t_After:=Substring:C12($_t_FormulaText; $_l_OpenBracketPosition+1)
										$_t_FormulaText:="Macro_ResultTxt"+$_t_After
										$_l_Type:=0
									End if 
								Else 
									$_l_Type:=1
								End if 
							Else 
								$_l_Type:=0
							End if 
						Else 
							If (($_t_FormulaText="Relate one@") | ($_t_FormulaText="LB_GetRelation@"))
								//do nothing
							Else 
								$_l_TableNumber:=0
								$_l_OpenTablePosition:=Position:C15("["; $_t_FormulaText)
								$_bo_FormulaisField:=False:C215
								//if the statement is a field rather than an formula of some kind
								If ($_l_OpenTablePosition=1)
									$_l_TableNumber:=0
									$_l_EndTablePosition:=Position:C15("]"; $_t_FormulaText)
									If ($_l_EndTablePosition>0)
										$_t_FormulaTableName:=Substring:C12($_t_FormulaText; 2; $_l_EndTablePosition-2)
										$_l_LastTableNumber:=Get last table number:C254
										For ($_l_TableIndex; 1; $_l_LastTableNumber)
											If (Is table number valid:C999($_l_TableIndex))
												$_t_DataTableName:=Table name:C256(Table:C252($_l_TableIndex))
												If ($_t_DataTableName=$_t_FormulaTableName)
													$_l_TableNumber:=$_l_TableIndex
													$_l_TableIndex:=$_l_LastTableNumber
												End if 
											End if 
										End for 
										If ($_l_TableNumber>0)
											$_t_FormulaFieldName:=Substring:C12($_t_FormulaText; $_l_EndTablePosition+1)
											$_t_FormulaFieldName:=Replace string:C233($_t_FormulaFieldName; Char:C90(13); "")
											$_t_FormulaFieldName:=Replace string:C233($_t_FormulaFieldName; Char:C90(10); "")
											$_t_FormulaFieldName:=Replace string:C233($_t_FormulaFieldName; Char:C90(9); "")
											$_l_LastFieldNumber:=Get last field number:C255($_l_TableNumber)
											For ($_l_FieldIndex; 1; $_l_LastFieldNumber)
												If (Is field number valid:C1000($_l_TableNumber; $_l_FieldIndex))
													$_t_DatabaseFieldName:=Field name:C257($_l_TableNumber; $_l_FieldIndex)
													If ($_t_DatabaseFieldName=$_t_FormulaFieldName)
														$_ptr_OutputFieldFromFormula:=Field:C253($_l_TableNumber; $_l_FieldIndex)
														$_bo_FormulaisField:=True:C214
														$_l_FieldIndex:=Get last field number:C255($_l_TableNumber)
													End if 
												End if 
											End for 
											
											
										End if 
									End if 
									
								End if 
							End if 
							
						End if 
						Case of 
							: ($_bo_FormulaisField)
								$_l_DataType2:=Type:C295($_ptr_OutputFieldFromFormula->)
								
								
								Case of 
									: ($_l_DataType2=0) | ($_l_DataType2=2)  //Field is Text/string
										Case of 
											: (Type:C295($_Ptr_ThisColumnArray->{$_l_index})=0) | (Type:C295($_Ptr_ThisColumnArray->{$_l_index})=2)  //Output is text
												$_Ptr_ThisColumnArray->{$_l_index}:=$_ptr_OutputFieldFromFormula->
											: (Type:C295($_Ptr_ThisColumnArray->{$_l_index})=Is real:K8:4) | (Type:C295($_Ptr_ThisColumnArray->{$_l_index})=Is longint:K8:6) | (Type:C295($_Ptr_ThisColumnArray->{$_l_index})=Is integer:K8:5)
												
												$_Ptr_ThisColumnArray->{$_l_index}:=Num:C11($_ptr_OutputFieldFromFormula->)
											: (Type:C295($_Ptr_ThisColumnArray->{$_l_index})=Is date:K8:7)
												$_Ptr_ThisColumnArray->{$_l_index}:=Date:C102($_ptr_OutputFieldFromFormula->)
											: (Type:C295($_Ptr_ThisColumnArray->{$_l_index})=Is time:K8:8)
												$_Ptr_ThisColumnArray->{$_l_index}:=Time:C179($_ptr_OutputFieldFromFormula->)
											: (Type:C295($_Ptr_ThisColumnArray->{$_l_index})=6)
												$_Ptr_ThisColumnArray->{$_l_index}:=($_ptr_OutputFieldFromFormula->="TRUE") | ($_ptr_OutputFieldFromFormula->="1")
												
										End case 
										
									: ($_l_DataType2=Is real:K8:4) | ($_l_DataType2=Is longint:K8:6) | ($_l_DataType2=Is integer:K8:5)
										Case of 
											: (Type:C295($_Ptr_ThisColumnArray->{$_l_index})=0) | (Type:C295($_Ptr_ThisColumnArray->{$_l_index})=2)
												
												$_Ptr_ThisColumnArray->{$_l_index}:=String:C10($_ptr_OutputFieldFromFormula->)
											: (Type:C295($_Ptr_ThisColumnArray->{$_l_index})=Is real:K8:4) | (Type:C295($_Ptr_ThisColumnArray->{$_l_index})=Is longint:K8:6) | (Type:C295($_Ptr_ThisColumnArray->{$_l_index})=Is integer:K8:5)
												
												$_Ptr_ThisColumnArray->{$_l_index}:=$_ptr_OutputFieldFromFormula->
											: (Type:C295($_Ptr_ThisColumnArray->{$_l_index})=Is date:K8:7)
												$_Ptr_ThisColumnArray->{$_l_index}:=!00-00-00!+$_ptr_OutputFieldFromFormula->
												
											: (Type:C295($_Ptr_ThisColumnArray->{$_l_index})=Is time:K8:8)
												$_Ptr_ThisColumnArray->{$_l_index}:=?00:00:00?+$_ptr_OutputFieldFromFormula->
												
												
											: (Type:C295($_Ptr_ThisColumnArray->{$_l_index})=6)
												$_Ptr_ThisColumnArray->{$_l_index}:=($_ptr_OutputFieldFromFormula->=1)
												
												
										End case 
										
									: ($_l_DataType2=Is date:K8:7)
										Case of 
											: (Type:C295($_Ptr_ThisColumnArray->{$_l_index})=0) | (Type:C295($_Ptr_ThisColumnArray->{$_l_index})=2)
												
												$_Ptr_ThisColumnArray->{$_l_index}:=String:C10($_ptr_OutputFieldFromFormula->)
											: (Type:C295($_Ptr_ThisColumnArray->{$_l_index})=Is real:K8:4) | (Type:C295($_Ptr_ThisColumnArray->{$_l_index})=Is longint:K8:6) | (Type:C295($_Ptr_ThisColumnArray->{$_l_index})=Is integer:K8:5)
												
												$_Ptr_ThisColumnArray->{$_l_index}:=$_ptr_OutputFieldFromFormula->-!00-00-00!
											: (Type:C295($_Ptr_ThisColumnArray->{$_l_index})=Is date:K8:7)
												$_Ptr_ThisColumnArray->{$_l_index}:=$_ptr_OutputFieldFromFormula->
												
											: (Type:C295($_Ptr_ThisColumnArray->{$_l_index})=Is time:K8:8)
												$_Ptr_ThisColumnArray->{$_l_index}:=?00:00:00?
												
												
											: (Type:C295($_Ptr_ThisColumnArray->{$_l_index})=6)
												$_Ptr_ThisColumnArray->{$_l_index}:=False:C215
												
												
										End case 
									: ($_l_DataType2=Is time:K8:8)
										Case of 
											: (Type:C295($_Ptr_ThisColumnArray->{$_l_index})=0) | (Type:C295($_Ptr_ThisColumnArray->{$_l_index})=2)
												
												$_Ptr_ThisColumnArray->{$_l_index}:=String:C10($_ptr_OutputFieldFromFormula->)
											: (Type:C295($_Ptr_ThisColumnArray->{$_l_index})=Is real:K8:4) | (Type:C295($_Ptr_ThisColumnArray->{$_l_index})=Is longint:K8:6) | (Type:C295($_Ptr_ThisColumnArray->{$_l_index})=Is integer:K8:5)
												
												$_Ptr_ThisColumnArray->{$_l_index}:=Time:C179($_ptr_OutputFieldFromFormula->)
											: (Type:C295($_Ptr_ThisColumnArray->{$_l_index})=Is date:K8:7)
												$_Ptr_ThisColumnArray->{$_l_index}:=!00-00-00!
												
											: (Type:C295($_Ptr_ThisColumnArray->{$_l_index})=Is time:K8:8)
												$_Ptr_ThisColumnArray->{$_l_index}:=$_ptr_OutputFieldFromFormula->
												
												
											: (Type:C295($_Ptr_ThisColumnArray->{$_l_index})=6)
												$_Ptr_ThisColumnArray->{$_l_index}:=?00:00:00?
												
												
										End case 
									: ($_l_DataType2=6)
										Case of 
											: (Type:C295($_Ptr_ThisColumnArray->{$_l_index})=0) | (Type:C295($_Ptr_ThisColumnArray->{$_l_index})=2)
												
												$_Ptr_ThisColumnArray->{$_l_index}:=String:C10($_ptr_OutputFieldFromFormula->)
											: (Type:C295($_Ptr_ThisColumnArray->{$_l_index})=Is real:K8:4) | (Type:C295($_Ptr_ThisColumnArray->{$_l_index})=Is longint:K8:6) | (Type:C295($_Ptr_ThisColumnArray->{$_l_index})=Is integer:K8:5)
												
												$_Ptr_ThisColumnArray->{$_l_index}:=Num:C11($_ptr_OutputFieldFromFormula->)
											: (Type:C295($_Ptr_ThisColumnArray->{$_l_index})=Is date:K8:7)
												$_Ptr_ThisColumnArray->{$_l_index}:=!00-00-00!
												
											: (Type:C295($_Ptr_ThisColumnArray->{$_l_index})=Is time:K8:8)
												$_Ptr_ThisColumnArray->{$_l_index}:=?00:00:00?
												
												
											: (Type:C295($_Ptr_ThisColumnArray->{$_l_index})=6)
												$_Ptr_ThisColumnArray->{$_l_index}:=$_ptr_OutputFieldFromFormula->
												
												
										End case 
										
								End case 
								
								
							: ($_t_FormulaText="Relate one@") | ($_t_FormulaText="LB_GetRelation@")
								
								EXECUTE FORMULA:C63($_t_FormulaText)
							: (($_l_Type=0) | ($_l_Type=2) | ($_l_Type=24))
								$_l_OpenTablePosition:=Position:C15("["; $_t_FormulaText)
								If ($_l_OpenTablePosition=0)
									$_t_OldMethodName2:=ERR_MethodTracker("EXECUTE: "+"vT:="+$_t_FormulaText)
									EXECUTE FORMULA:C63("vT:="+$_t_FormulaText)
									RESOLVE POINTER:C394($_Ptr_ThisColumnArray; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
									$_ptr_ArrayVariables:=Get pointer:C304($_t_VariableName)
									If (Type:C295($_Ptr_ThisColumnArray->)=13)  //it is a 2D array
										$_ptr_ArrayVariables->{$_l_TableNumber}{$2}:=vT
									Else 
										Case of 
											: (Type:C295($_Ptr_ThisColumnArray->{$2})=Is text:K8:3) | (Type:C295($_Ptr_ThisColumnArray->{$2})=Is alpha field:K8:1) | (Type:C295($_Ptr_ThisColumnArray->{$2})=Is string var:K8:2)
												$_Ptr_ThisColumnArray->{$2}:=vT
											: (Type:C295($_Ptr_ThisColumnArray->{$2})=Is date:K8:7)
												$_Ptr_ThisColumnArray->{$2}:=Date:C102(vT)
											: (Type:C295($_Ptr_ThisColumnArray->{$2})=Is time:K8:8)
												$_Ptr_ThisColumnArray->{$2}:=Time:C179(vT)
											: (Type:C295($_Ptr_ThisColumnArray->{$2})=Is integer:K8:5) | (Type:C295($_Ptr_ThisColumnArray->{$2})=Is longint:K8:6) | (Type:C295($_Ptr_ThisColumnArray->{$2})=Is real:K8:4)
												$_Ptr_ThisColumnArray->{$2}:=Num:C11(vT)
											: (Type:C295($_Ptr_ThisColumnArray->{$2})=Is boolean:K8:9)
												$_Ptr_ThisColumnArray->{$2}:=(Vt="TRUE") | (Vt="1")
												
										End case 
										
									End if 
								Else 
									EXECUTE FORMULA:C63($_t_FormulaText)
								End if 
								
								
							: ($_l_Type=1)
								$_l_OpenTablePosition:=Position:C15("["; $_t_FormulaText)
								If ($_l_OpenTablePosition=0)
									$_t_OldMethodName2:=ERR_MethodTracker("EXECUTE: "+"vAmount:="+$_t_FormulaText)
									EXECUTE FORMULA:C63("vAmount:="+$_t_FormulaText)
									RESOLVE POINTER:C394($_Ptr_ThisColumnArray; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
									$_ptr_ArrayVariables:=Get pointer:C304($_t_VariableName)
									
									If (Type:C295($_Ptr_ThisColumnArray->)=13)  //it is a 2D array
										$_ptr_ArrayVariables->{$_l_TableNumber}{$2}:=vAmount
									Else 
										//$_Ptr_ThisColumnArray->{$2}:=vAmount
										Case of 
											: (Type:C295($_Ptr_ThisColumnArray->{$2})=Is text:K8:3) | (Type:C295($_Ptr_ThisColumnArray->{$2})=Is alpha field:K8:1) | (Type:C295($_Ptr_ThisColumnArray->{$2})=Is string var:K8:2)
												$_Ptr_ThisColumnArray->{$2}:=String:C10(vAmount)
											: (Type:C295($_Ptr_ThisColumnArray->{$2})=Is date:K8:7)
												$_Ptr_ThisColumnArray->{$2}:=Date:C102(String:C10(vAmount))
											: (Type:C295($_Ptr_ThisColumnArray->{$2})=Is time:K8:8)
												$_Ptr_ThisColumnArray->{$2}:=Time:C179(Time string:C180(Vamount))
											: (Type:C295($_Ptr_ThisColumnArray->{$2})=Is integer:K8:5) | (Type:C295($_Ptr_ThisColumnArray->{$2})=Is longint:K8:6) | (Type:C295($_Ptr_ThisColumnArray->{$2})=Is real:K8:4)
												$_Ptr_ThisColumnArray->{$2}:=vAmount
											: (Type:C295($_Ptr_ThisColumnArray->{$2})=Is boolean:K8:9)
												$_Ptr_ThisColumnArray->{$2}:=(vAmount=1)
												
										End case 
										
									End if 
								Else 
									EXECUTE FORMULA:C63($_t_FormulaText)
								End if 
								
							: ($_l_Type=4)
								$_l_OpenTablePosition:=Position:C15("["; $_t_FormulaText)
								If ($_l_OpenTablePosition=0)
									$_t_OldMethodName2:=ERR_MethodTracker("EXECUTE: "+"vDate:="+$_t_FormulaText)
									EXECUTE FORMULA:C63("vDate:="+$_t_FormulaText)
									RESOLVE POINTER:C394($_Ptr_ThisColumnArray; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
									$_ptr_ArrayVariables:=Get pointer:C304($_t_VariableName)
									If (Type:C295($_Ptr_ThisColumnArray->)=13)  //it is a 2D array
										$_ptr_ArrayVariables->{$_l_TableNumber}{$2}:=vDate
									Else 
										//$_Ptr_ThisColumnArray->{$2}:=vDate
										Case of 
											: (Type:C295($_Ptr_ThisColumnArray->{$2})=Is text:K8:3) | (Type:C295($_Ptr_ThisColumnArray->{$2})=Is alpha field:K8:1) | (Type:C295($_Ptr_ThisColumnArray->{$2})=Is string var:K8:2)
												$_Ptr_ThisColumnArray->{$2}:=String:C10(vDate)
											: (Type:C295($_Ptr_ThisColumnArray->{$2})=Is date:K8:7)
												$_Ptr_ThisColumnArray->{$2}:=vDate
											: (Type:C295($_Ptr_ThisColumnArray->{$2})=Is time:K8:8)
												$_Ptr_ThisColumnArray->{$2}:=?00:00:00?
											: (Type:C295($_Ptr_ThisColumnArray->{$2})=Is integer:K8:5) | (Type:C295($_Ptr_ThisColumnArray->{$2})=Is longint:K8:6) | (Type:C295($_Ptr_ThisColumnArray->{$2})=Is real:K8:4)
												$_Ptr_ThisColumnArray->{$2}:=vDate-!00-00-00!
											: (Type:C295($_Ptr_ThisColumnArray->{$2})=Is boolean:K8:9)
												$_Ptr_ThisColumnArray->{$2}:=False:C215
												
										End case 
									End if 
								Else 
									EXECUTE FORMULA:C63($_t_FormulaText)
								End if 
								
								
							: ($_l_Type=6)
								$_l_OpenTablePosition:=Position:C15("["; $_t_FormulaText)
								If ($_l_OpenTablePosition=0)
									$_t_OldMethodName2:=ERR_MethodTracker("EXECUTE: "+"DB_bo_RecordModified:="+$_t_FormulaText)
									EXECUTE FORMULA:C63("DB_bo_RecordModified:="+$_t_FormulaText)
									If (Type:C295($_Ptr_ThisColumnArray->)=13)  //it is a 2D array
										$_ptr_ArrayVariables->{$_l_TableNumber}{$2}:=DB_bo_RecordModified
									Else 
										//$_Ptr_ThisColumnArray->{$2}:=DB_bo_RecordModified
										Case of 
											: (Type:C295($_Ptr_ThisColumnArray->{$2})=Is text:K8:3) | (Type:C295($_Ptr_ThisColumnArray->{$2})=Is alpha field:K8:1) | (Type:C295($_Ptr_ThisColumnArray->{$2})=Is string var:K8:2)
												$_Ptr_ThisColumnArray->{$2}:=String:C10(DB_bo_RecordModified)
											: (Type:C295($_Ptr_ThisColumnArray->{$2})=Is date:K8:7)
												$_Ptr_ThisColumnArray->{$2}:=!00-00-00!
											: (Type:C295($_Ptr_ThisColumnArray->{$2})=Is time:K8:8)
												$_Ptr_ThisColumnArray->{$2}:=?00:00:00?
											: (Type:C295($_Ptr_ThisColumnArray->{$2})=Is integer:K8:5) | (Type:C295($_Ptr_ThisColumnArray->{$2})=Is longint:K8:6) | (Type:C295($_Ptr_ThisColumnArray->{$2})=Is real:K8:4)
												$_Ptr_ThisColumnArray->{$2}:=Num:C11(DB_bo_RecordModified)
											: (Type:C295($_Ptr_ThisColumnArray->{$2})=Is boolean:K8:9)
												$_Ptr_ThisColumnArray->{$2}:=DB_bo_RecordModified
												
										End case 
									End if 
								Else 
									EXECUTE FORMULA:C63($_t_FormulaText)
								End if 
								RESOLVE POINTER:C394($_Ptr_ThisColumnArray; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
								$_ptr_ArrayVariables:=Get pointer:C304($_t_VariableName)
								
							: (($_l_Type=8) | ($_l_Type=9) | ($_l_Type=11))
								$_l_OpenTablePosition:=Position:C15("["; $_t_FormulaText)
								If ($_l_OpenTablePosition=0)
									$_t_OldMethodName2:=ERR_MethodTracker("EXECUTE: "+"LB_r_Num:="+$_t_FormulaText)
									
									EXECUTE FORMULA:C63("LB_r_Num:="+$_t_FormulaText)
									RESOLVE POINTER:C394($_Ptr_ThisColumnArray; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
									$_ptr_ArrayVariables:=Get pointer:C304($_t_VariableName)
									If (Type:C295($_Ptr_ThisColumnArray->)=13)  //it is a 2D array
										
										$_ptr_ArrayVariables->{$_l_TableNumber}{$2}:=LB_r_Num
										
									Else 
										
										//$_Ptr_ThisColumnArray->{$2}:=LB_r_Num
										Case of 
											: (Type:C295($_Ptr_ThisColumnArray->{$2})=Is text:K8:3) | (Type:C295($_Ptr_ThisColumnArray->{$2})=Is alpha field:K8:1) | (Type:C295($_Ptr_ThisColumnArray->{$2})=Is string var:K8:2)
												$_Ptr_ThisColumnArray->{$2}:=String:C10(LB_r_Num)
											: (Type:C295($_Ptr_ThisColumnArray->{$2})=Is date:K8:7)
												$_Ptr_ThisColumnArray->{$2}:=!00-00-00!+LB_r_Num
											: (Type:C295($_Ptr_ThisColumnArray->{$2})=Is time:K8:8)
												$_Ptr_ThisColumnArray->{$2}:=?00:00:00?+LB_r_Num
											: (Type:C295($_Ptr_ThisColumnArray->{$2})=Is integer:K8:5) | (Type:C295($_Ptr_ThisColumnArray->{$2})=Is longint:K8:6) | (Type:C295($_Ptr_ThisColumnArray->{$2})=Is real:K8:4)
												$_Ptr_ThisColumnArray->{$2}:=LB_r_Num
											: (Type:C295($_Ptr_ThisColumnArray->{$2})=Is boolean:K8:9)
												$_Ptr_ThisColumnArray->{$2}:=(LB_r_Num=1)
												
										End case 
									End if 
								Else 
									EXECUTE FORMULA:C63($_t_FormulaText)
								End if 
								
						End case 
						If ($_t_CurrentErrorMethodName#"")
							ON ERR CALL:C155($_t_CurrentErrorMethodName)
						Else 
							ON ERR CALL:C155("Error_Proc")
						End if   //added 02/07/08, kmw
					End if 
				End for 
			End if 
			
			
			//AL_UpdateArrays ($_ptr_ListboxArea»;-1)
			RESOLVE POINTER:C394($_ptr_ArrayofArrayPointers; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
			$_ptr_ArrayVariables:=Get pointer:C304($_t_VariableName)
			If (Type:C295($_ptr_ArrayofArrayPointers->)=13)  //it is a 2D array
				
				$_Ptr_ThisColumnArray:=$_ptr_ArrayVariables->{$_l_TableNumber}{1}
			Else 
				$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{1}
			End if 
			
			$_l_NumberofColumns:=Size of array:C274($_Ptr_ThisColumnArray->)
		End if 
	End if 
End if 

//AL_UpdateArrays ($_ptr_ListboxArea->;-2)
//AL_UpdateArrays ($_ptr_ListboxArea»;$_l_NumberofColumns)  `Is this really necessary? It goes beserk whatever
//AL_SetLine ($_ptr_ListboxArea»;0)
ERR_MethodTrackerReturn("LBi_ArrUpdate"; $_t_oldMethodName)