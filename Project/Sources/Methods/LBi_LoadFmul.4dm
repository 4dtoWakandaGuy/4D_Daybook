//%attributes = {}

If (False:C215)
	//Project Method Name:      LBi_LoadFmul
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
	ARRAY LONGINT:C221($_al_FormulaColumns; 0)
	ARRAY TEXT:C222($_at_ArrayNames; 0)
	C_BOOLEAN:C305($_bo_ColumnHasFormula; $_bo_Continue; $_bo_FmulRec; $_bo_FormulaColumnsisSet; $_bo_FormulaIsField; DB_bo_RecordModified)
	C_DATE:C307(vDate)
	C_LONGINT:C283($_l_AreaType; $_l_CharacterPosition; $_l_CharacterPosition2; $_l_ColumnFormulaCell; $_l_DataType; $_l_DataType2; $_l_FieldIndex; $_l_FormulaMethodRow; $_l_Index; $_l_Index2; $_l_LastTableNumber)
	C_LONGINT:C283($_l_NumberOfColumns; $_l_NumberOfRecords; $_l_ProgressCount; $_l_ProgressEnd; $_l_TableIndex; $_l_TableNumber; $_l_Thermometer; LB_l_Longint; LBI_l_ForrnulaCheckType)
	C_PICTURE:C286(GEN_pic_LoadPicture)
	C_POINTER:C301($_ptr_areaTypeVariable; $_ptr_ArrayFieldPointers; $_ptr_ArrayOfArrays; $_Ptr_ArrayofFormulas; $_ptr_ArrPRec; $_ptr_ListboxSetup; $_Ptr_OutputField; $_ptr_Tables; $_Ptr_ThisColumnField; $1)
	C_REAL:C285(LB_r_Num; vAmount; vAmountR)
	C_TEXT:C284($_t_After; $_t_FieldName; $_t_FieldName2; $_t_Formula; $_t_oldMethodName; $_t_TableName; $_t_TableName2; $_t_ThisColumnData; vMTitle2; vT)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LBi_LoadFmul")

//This method is a direct replacement LB_LoadFMul
//10/11/2009



//ALLoadFmul - calculate any formulae
//See also ALArrUpdate
//When we go into the definitions editor the area which is normally an field based setup will get errors for

$_bo_ColumnHasFormula:=False:C215
$_bo_FmulRec:=False:C215
$_ptr_ListboxSetup:=$1
$_Ptr_ArrayofFormulas:=$_ptr_ListboxSetup->{6}

$_l_NumberOfColumns:=Size of array:C274($_Ptr_ArrayofFormulas->)
$_l_Thermometer:=0
If ($_l_NumberOfColumns>50)
	$_l_Thermometer:=OPEN_THERMOMETER("Finding forumlae..."; True:C214)  //added 27/06/08 -kmw
End if 
For ($_l_Index2; 1; $_l_NumberOfColumns)
	If ($_l_NumberOfColumns>50)
		SET_THERMOMETER("Finding forumlae..."; (($_l_Index2*100)\$_l_NumberOfColumns))  //added 27/06/08 -kmw
	End if 
	
	$_t_Formula:=$_Ptr_ArrayofFormulas->{$_l_Index2}
	
	If ($_Ptr_ArrayofFormulas->{$_l_Index2}#"")
		$_bo_ColumnHasFormula:=True:C214
		$_l_CharacterPosition2:=Position:C15("Macro_Result"; $_t_Formula)
		$_l_Index:=Position:C15("["; $_t_Formula)
		If ($_l_Index>0)  //| ($_l_CharacterPosition2>0)
			$_bo_FmulRec:=True:C214
			$_l_Index2:=$_l_NumberOfColumns
		End if 
	End if 
End for 

If ($_bo_ColumnHasFormula)  //If there are any Formulae
	$_ptr_ArrayFieldPointers:=$_ptr_ListboxSetup->{2}
	$_ptr_ArrayOfArrays:=$_ptr_ListboxSetup->{3}
	$_ptr_Tables:=$_ptr_ListboxSetup->{7}
	$_l_AreaType:=1
	$_ptr_areaTypeVariable:=->$_l_AreaType
	If (Size of array:C274($_ptr_ListboxSetup->)>=19)
		$_ptr_areaTypeVariable:=$_ptr_ListboxSetup->{19}
	End if 
	LBI_l_ForrnulaCheckType:=1
	If ($_ptr_areaTypeVariable->=3)
		LBI_l_ForrnulaCheckType:=3
	End if 
	
	
	SET AUTOMATIC RELATIONS:C310(True:C214; False:C215)
	$_bo_ColumnHasFormula:=DB_bo_RecordModified
	If ($_bo_FmulRec) | (True:C214)  //If there are any File references in the Formulae
		OK:=1
		$_l_Index:=1
		$_l_ProgressCount:=1  //added 27/06/08 -kmw
		$_l_ProgressEnd:=Records in selection:C76($_ptr_Tables->)  //added 27/06/08 -kmw
		
		FIRST RECORD:C50($_ptr_Tables->)
		While ((Not:C34(End selection:C36($_ptr_Tables->))) & (OK=1))  //Loop thru records first to avoid doing it twice for 2 columns
			//IDLE  ` 03/04/03 pb
			If ($_l_ProgressEnd>500)  //NG only do if more than 500 records
				If ($_l_Thermometer=0)
					$_l_Thermometer:=OPEN_THERMOMETER("Finding forumlae..."; True:C214)  //added 27/06/08 -kmw
				End if 
				SET_THERMOMETER("Calculating forumlae..."; (($_l_ProgressCount*100)\$_l_ProgressEnd))  //added 27/06/08 -kmw
			End if 
			$_l_ProgressCount:=$_l_ProgressCount+1  //added 27/06/08 -kmw
			
			For ($_l_Index2; 1; $_l_NumberOfColumns)  //Then loop thru the columns
				$_t_Formula:=$_Ptr_ArrayofFormulas->{$_l_Index2}
				$_bo_Continue:=False:C215
				Repeat 
					If ($_t_Formula#"")
						If ($_t_Formula[[Length:C16($_t_Formula)]]=" ") | ($_t_Formula[[Length:C16($_t_Formula)]]=Char:C90(13)) | ($_t_Formula[[Length:C16($_t_Formula)]]=Char:C90(9)) | ($_t_Formula[[Length:C16($_t_Formula)]]=Char:C90(10))
							$_t_Formula:=Substring:C12($_t_Formula; 1; Length:C16($_t_Formula)-1)
						Else 
							$_bo_Continue:=True:C214
						End if 
					Else 
						$_bo_Continue:=True:C214
					End if 
				Until ($_bo_Continue)
				$_bo_Continue:=False:C215
				Repeat 
					If ($_t_Formula#"")
						If ($_t_Formula[[1]]=" ")
							$_t_Formula:=Substring:C12($_t_Formula; 2)
						Else 
							$_bo_Continue:=True:C214
						End if 
					Else 
						$_bo_Continue:=True:C214
					End if 
				Until ($_bo_Continue)
				If ($_t_Formula#"")
					$_ptr_ArrPRec:=$_ptr_ArrayOfArrays->{$_l_Index2}
					$_Ptr_ThisColumnField:=$_ptr_ArrayFieldPointers->{$_l_Index2}
					$_l_DataType:=Type:C295(($_Ptr_ThisColumnField)->)
					
					$_t_Formula:=LBi_FmulReplace($_ptr_ListboxSetup; $_t_Formula; $_l_Index)
					$_t_Formula:=Replace string:C233($_t_Formula; Char:C90(13); "")
					$_t_Formula:=Replace string:C233($_t_Formula; Char:C90(10); "")
					$_t_Formula:=Replace string:C233($_t_Formula; Char:C90(9); "")
					
					vMTitle2:=$_t_Formula
					$_l_CharacterPosition:=Position:C15("["; $_t_Formula)
					$_bo_FormulaIsField:=False:C215
					
					If ($_t_Formula="Macro@")
						//make sure it says Macro_Result or Macro_Resultxt
						
						If (Position:C15("Macro_ResultTxt"; $_t_Formula)=0)
							If (Position:C15("Macro_Result"; $_t_Formula)=0)
								$_l_CharacterPosition2:=Position:C15("("; $_t_Formula)
								If ($_l_CharacterPosition2>0)
									$_t_After:=Substring:C12($_t_Formula; $_l_CharacterPosition2)
									$_t_Formula:="Macro_ResultTxt "+$_t_After
									$_l_DataType:=0
								End if 
							Else 
								$_l_DataType:=1
							End if 
						Else 
							$_l_DataType:=0
						End if 
					Else 
						If (($_t_Formula="Relate one@") | ($_t_Formula="LB_GetRelation@"))
							//do nothing
						Else 
							
							$_l_CharacterPosition:=Position:C15("["; $_t_Formula)
							$_bo_FormulaIsField:=False:C215
							//if the statement is a field rather than an formula of some kind
							If ($_l_CharacterPosition=1)
								$_l_TableNumber:=0
								$_l_CharacterPosition2:=Position:C15("]"; $_t_Formula)
								If ($_l_CharacterPosition2>0)
									$_t_TableName:=Substring:C12($_t_Formula; 2; $_l_CharacterPosition2-2)
									$_l_LastTableNumber:=Get last table number:C254
									For ($_l_TableIndex; 1; $_l_LastTableNumber)
										If (Is table number valid:C999($_l_TableIndex))
											$_t_TableName2:=Table name:C256(Table:C252($_l_TableIndex))
											If ($_t_TableName2=$_t_TableName)
												$_l_TableNumber:=$_l_TableIndex
												$_l_TableIndex:=$_l_LastTableNumber
											End if 
										End if 
									End for 
									If ($_l_TableNumber>0)
										$_t_FieldName:=Substring:C12($_t_Formula; $_l_CharacterPosition2+1)
										$_t_FieldName:=Replace string:C233($_t_FieldName; Char:C90(13); "")
										$_t_FieldName:=Replace string:C233($_t_FieldName; Char:C90(10); "")
										$_t_FieldName:=Replace string:C233($_t_FieldName; Char:C90(9); "")
										
										For ($_l_FieldIndex; 1; Get last field number:C255($_l_TableNumber))
											If (Is field number valid:C1000($_l_TableNumber; $_l_FieldIndex))
												$_t_FieldName2:=Field name:C257($_l_TableNumber; $_l_FieldIndex)
												If ($_t_FieldName2=$_t_FieldName)
													$_Ptr_OutputField:=Field:C253($_l_TableNumber; $_l_FieldIndex)
													$_bo_FormulaIsField:=True:C214
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
						: ($_bo_FormulaIsField)
							$_l_DataType2:=Type:C295($_Ptr_OutputField->)
							
							
							Case of 
								: ($_l_DataType2=0) | ($_l_DataType2=2)  //Field is Text/string
									Case of 
										: (Type:C295($_ptr_ArrPRec->{$_l_Index})=0) | (Type:C295($_ptr_ArrPRec->{$_l_Index})=2)  //Output is text
											$_ptr_ArrPRec->{$_l_Index}:=$_Ptr_OutputField->
										: (Type:C295($_ptr_ArrPRec->{$_l_Index})=Is real:K8:4) | (Type:C295($_ptr_ArrPRec->{$_l_Index})=Is longint:K8:6) | (Type:C295($_ptr_ArrPRec->{$_l_Index})=Is integer:K8:5)
											
											$_ptr_ArrPRec->{$_l_Index}:=Num:C11($_Ptr_OutputField->)
										: (Type:C295($_ptr_ArrPRec->{$_l_Index})=Is date:K8:7)
											$_ptr_ArrPRec->{$_l_Index}:=Date:C102($_Ptr_OutputField->)
										: (Type:C295($_ptr_ArrPRec->{$_l_Index})=Is time:K8:8)
											$_ptr_ArrPRec->{$_l_Index}:=Time:C179($_Ptr_OutputField->)
										: (Type:C295($_ptr_ArrPRec->{$_l_Index})=6)
											$_ptr_ArrPRec->{$_l_Index}:=($_Ptr_OutputField->="TRUE") | ($_Ptr_OutputField->="1")
											
									End case 
									
								: ($_l_DataType2=Is real:K8:4) | ($_l_DataType2=Is longint:K8:6) | ($_l_DataType2=Is integer:K8:5)
									Case of 
										: (Type:C295($_ptr_ArrPRec->{$_l_Index})=0) | (Type:C295($_ptr_ArrPRec->{$_l_Index})=2)
											
											$_ptr_ArrPRec->{$_l_Index}:=String:C10($_Ptr_OutputField->)
										: (Type:C295($_ptr_ArrPRec->{$_l_Index})=Is real:K8:4) | (Type:C295($_ptr_ArrPRec->{$_l_Index})=Is longint:K8:6) | (Type:C295($_ptr_ArrPRec->{$_l_Index})=Is integer:K8:5)
											
											$_ptr_ArrPRec->{$_l_Index}:=$_Ptr_OutputField->
										: (Type:C295($_ptr_ArrPRec->{$_l_Index})=Is date:K8:7)
											$_ptr_ArrPRec->{$_l_Index}:=!00-00-00!+$_Ptr_OutputField->
											
										: (Type:C295($_ptr_ArrPRec->{$_l_Index})=Is time:K8:8)
											$_ptr_ArrPRec->{$_l_Index}:=?00:00:00?+$_Ptr_OutputField->
											
											
										: (Type:C295($_ptr_ArrPRec->{$_l_Index})=6)
											$_ptr_ArrPRec->{$_l_Index}:=($_Ptr_OutputField->=1)
											
											
									End case 
									
								: ($_l_DataType2=Is date:K8:7)
									Case of 
										: (Type:C295($_ptr_ArrPRec->{$_l_Index})=0) | (Type:C295($_ptr_ArrPRec->{$_l_Index})=2)
											
											$_ptr_ArrPRec->{$_l_Index}:=String:C10($_Ptr_OutputField->)
										: (Type:C295($_ptr_ArrPRec->{$_l_Index})=Is real:K8:4) | (Type:C295($_ptr_ArrPRec->{$_l_Index})=Is longint:K8:6) | (Type:C295($_ptr_ArrPRec->{$_l_Index})=Is integer:K8:5)
											
											$_ptr_ArrPRec->{$_l_Index}:=$_Ptr_OutputField->-!00-00-00!
										: (Type:C295($_ptr_ArrPRec->{$_l_Index})=Is date:K8:7)
											$_ptr_ArrPRec->{$_l_Index}:=$_Ptr_OutputField->
											
										: (Type:C295($_ptr_ArrPRec->{$_l_Index})=Is time:K8:8)
											$_ptr_ArrPRec->{$_l_Index}:=?00:00:00?
											
											
										: (Type:C295($_ptr_ArrPRec->{$_l_Index})=6)
											$_ptr_ArrPRec->{$_l_Index}:=False:C215
											
											
									End case 
								: ($_l_DataType2=Is time:K8:8)
									Case of 
										: (Type:C295($_ptr_ArrPRec->{$_l_Index})=0) | (Type:C295($_ptr_ArrPRec->{$_l_Index})=2)
											
											$_ptr_ArrPRec->{$_l_Index}:=String:C10($_Ptr_OutputField->)
										: (Type:C295($_ptr_ArrPRec->{$_l_Index})=Is real:K8:4) | (Type:C295($_ptr_ArrPRec->{$_l_Index})=Is longint:K8:6) | (Type:C295($_ptr_ArrPRec->{$_l_Index})=Is integer:K8:5)
											
											$_ptr_ArrPRec->{$_l_Index}:=Time:C179($_Ptr_OutputField->)
										: (Type:C295($_ptr_ArrPRec->{$_l_Index})=Is date:K8:7)
											$_ptr_ArrPRec->{$_l_Index}:=!00-00-00!
											
										: (Type:C295($_ptr_ArrPRec->{$_l_Index})=Is time:K8:8)
											$_ptr_ArrPRec->{$_l_Index}:=$_Ptr_OutputField->
											
											
										: (Type:C295($_ptr_ArrPRec->{$_l_Index})=6)
											$_ptr_ArrPRec->{$_l_Index}:=?00:00:00?
											
											
									End case 
								: ($_l_DataType2=6)
									Case of 
										: (Type:C295($_ptr_ArrPRec->{$_l_Index})=0) | (Type:C295($_ptr_ArrPRec->{$_l_Index})=2)
											
											$_ptr_ArrPRec->{$_l_Index}:=String:C10($_Ptr_OutputField->)
										: (Type:C295($_ptr_ArrPRec->{$_l_Index})=Is real:K8:4) | (Type:C295($_ptr_ArrPRec->{$_l_Index})=Is longint:K8:6) | (Type:C295($_ptr_ArrPRec->{$_l_Index})=Is integer:K8:5)
											
											$_ptr_ArrPRec->{$_l_Index}:=Num:C11($_Ptr_OutputField->)
										: (Type:C295($_ptr_ArrPRec->{$_l_Index})=Is date:K8:7)
											$_ptr_ArrPRec->{$_l_Index}:=!00-00-00!
											
										: (Type:C295($_ptr_ArrPRec->{$_l_Index})=Is time:K8:8)
											$_ptr_ArrPRec->{$_l_Index}:=?00:00:00?
											
											
										: (Type:C295($_ptr_ArrPRec->{$_l_Index})=6)
											$_ptr_ArrPRec->{$_l_Index}:=$_Ptr_OutputField->
											
											
									End case 
									
							End case 
							
						: ($_t_Formula="Relate one@") | ($_t_Formula="LB_GetRelation@")
							//
							EXECUTE FORMULA:C63($_t_Formula)
						: (($_l_DataType=0) | ($_l_DataType=2) | ($_l_DataType=24))
							//
							If ($_l_CharacterPosition=0)
								EXECUTE FORMULA:C63("vT:="+$_t_Formula)
								If (OK=1)
									Case of 
										: (Type:C295($_ptr_ArrPRec->{$_l_Index})=0) | (Type:C295($_ptr_ArrPRec->{$_l_Index})=2)
											
											$_ptr_ArrPRec->{$_l_Index}:=vT
										: (Type:C295($_ptr_ArrPRec->{$_l_Index})=Is real:K8:4) | (Type:C295($_ptr_ArrPRec->{$_l_Index})=Is longint:K8:6) | (Type:C295($_ptr_ArrPRec->{$_l_Index})=Is integer:K8:5)
											
											$_ptr_ArrPRec->{$_l_Index}:=Num:C11(vT)
										: (Type:C295($_ptr_ArrPRec->{$_l_Index})=Is date:K8:7)
											$_ptr_ArrPRec->{$_l_Index}:=Date:C102(vT)
										: (Type:C295($_ptr_ArrPRec->{$_l_Index})=Is time:K8:8)
											$_ptr_ArrPRec->{$_l_Index}:=Time:C179(Vt)
										: (Type:C295($_ptr_ArrPRec->{$_l_Index})=6)
											$_ptr_ArrPRec->{$_l_Index}:=(Vt="TRUE") | (vt="1")
											
									End case 
								End if 
							Else 
								
								
								EXECUTE FORMULA:C63($_t_Formula)
								$_t_ThisColumnData:=$_Ptr_ThisColumnField->
								$_ptr_ArrPRec->{$_l_Index}:=$_t_ThisColumnData
								
							End if 
						: ($_l_DataType=1)
							$_l_CharacterPosition:=Position:C15("["; $_t_Formula)
							If ($_l_CharacterPosition=0)
								
								EXECUTE FORMULA:C63("vAmount:="+$_t_Formula)
								
								If (OK=1)
									//$_ptr_ArrPRec->{$_l_Index}:=vAmount
									Case of 
										: (Type:C295($_ptr_ArrPRec->{$_l_Index})=0) | (Type:C295($_ptr_ArrPRec->{$_l_Index})=2)
											
											$_ptr_ArrPRec->{$_l_Index}:=String:C10(vAmount)
										: (Type:C295($_ptr_ArrPRec->{$_l_Index})=Is real:K8:4) | (Type:C295($_ptr_ArrPRec->{$_l_Index})=Is longint:K8:6) | (Type:C295($_ptr_ArrPRec->{$_l_Index})=Is integer:K8:5)
											
											$_ptr_ArrPRec->{$_l_Index}:=vAmount
										: (Type:C295($_ptr_ArrPRec->{$_l_Index})=Is date:K8:7)
											$_ptr_ArrPRec->{$_l_Index}:=!00-00-00!+vAmount
											
										: (Type:C295($_ptr_ArrPRec->{$_l_Index})=Is time:K8:8)
											$_ptr_ArrPRec->{$_l_Index}:=?00:00:00?+vAmount
											
											
										: (Type:C295($_ptr_ArrPRec->{$_l_Index})=6)
											$_ptr_ArrPRec->{$_l_Index}:=(vAmount=1)
											
											
									End case 
								End if 
							Else 
								
								If (Position:C15("StockLev_Fmula"; $_t_Formula)>0)
									$_t_Formula:=Replace string:C233($_t_Formula; "->"; "")
									EXECUTE FORMULA:C63("vAmountR:="+$_t_Formula)
									$_ptr_ArrPRec->{$_l_Index}:=vAmountR
								Else 
									EXECUTE FORMULA:C63("vAmountR:="+$_t_Formula)
									$_ptr_ArrPRec->{$_l_Index}:=vAmountR
								End if 
								
								//$_ptr_ArrPRec->{$_l_Index}:=($_Ptr_ThisColumnField)->
							End if 
							
						: ($_l_DataType=4)
							$_l_CharacterPosition:=Position:C15("["; $_t_Formula)
							If ($_l_CharacterPosition=0)
								EXECUTE FORMULA:C63("vDate:="+$_t_Formula)
								
								If (OK=1)
									//$_ptr_ArrPRec->{$_l_Index}:=vDate
									Case of 
										: (Type:C295($_ptr_ArrPRec->{$_l_Index})=0) | (Type:C295($_ptr_ArrPRec->{$_l_Index})=2)
											
											$_ptr_ArrPRec->{$_l_Index}:=String:C10(vDate)
										: (Type:C295($_ptr_ArrPRec->{$_l_Index})=Is real:K8:4) | (Type:C295($_ptr_ArrPRec->{$_l_Index})=Is longint:K8:6) | (Type:C295($_ptr_ArrPRec->{$_l_Index})=Is integer:K8:5)
											
											$_ptr_ArrPRec->{$_l_Index}:=vDate-!00-00-00!
										: (Type:C295($_ptr_ArrPRec->{$_l_Index})=Is date:K8:7)
											$_ptr_ArrPRec->{$_l_Index}:=vDate
											
										: (Type:C295($_ptr_ArrPRec->{$_l_Index})=Is time:K8:8)
											$_ptr_ArrPRec->{$_l_Index}:=?00:00:00?
											
											
										: (Type:C295($_ptr_ArrPRec->{$_l_Index})=6)
											$_ptr_ArrPRec->{$_l_Index}:=False:C215
											
											
									End case 
								End if 
							Else 
								EXECUTE FORMULA:C63($_t_Formula)
								
								$_ptr_ArrPRec->{$_l_Index}:=($_Ptr_ThisColumnField)->
							End if 
							
						: ($_l_DataType=6)
							$_l_CharacterPosition:=Position:C15("["; $_t_Formula)
							If ($_l_CharacterPosition=0)
								EXECUTE FORMULA:C63("DB_bo_RecordModified:="+$_t_Formula)
								
								If (OK=1)
									//$_ptr_ArrPRec->{$_l_Index}:=DB_bo_RecordModified
									Case of 
										: (Type:C295($_ptr_ArrPRec->{$_l_Index})=0) | (Type:C295($_ptr_ArrPRec->{$_l_Index})=2)
											
											$_ptr_ArrPRec->{$_l_Index}:=String:C10(DB_bo_RecordModified)
										: (Type:C295($_ptr_ArrPRec->{$_l_Index})=Is real:K8:4) | (Type:C295($_ptr_ArrPRec->{$_l_Index})=Is longint:K8:6) | (Type:C295($_ptr_ArrPRec->{$_l_Index})=Is integer:K8:5)
											
											$_ptr_ArrPRec->{$_l_Index}:=Num:C11(DB_bo_RecordModified)
										: (Type:C295($_ptr_ArrPRec->{$_l_Index})=Is date:K8:7)
											$_ptr_ArrPRec->{$_l_Index}:=!00-00-00!
											
										: (Type:C295($_ptr_ArrPRec->{$_l_Index})=Is time:K8:8)
											$_ptr_ArrPRec->{$_l_Index}:=?00:00:00?
											
											
										: (Type:C295($_ptr_ArrPRec->{$_l_Index})=6)
											$_ptr_ArrPRec->{$_l_Index}:=DB_bo_RecordModified
											
											
									End case 
								End if 
							Else 
								
								//EXECUTE FORMULA($_t_Formula)
								
								$_ptr_ArrPRec->{$_l_Index}:=($_Ptr_ThisColumnField)->
							End if 
							
						: (($_l_DataType=8) | ($_l_DataType=9) | ($_l_DataType=11))
							$_l_CharacterPosition:=Position:C15("["; $_t_Formula)
							If ($_l_CharacterPosition=0)
								ARRAY TEXT:C222($_at_ArrayNames; 0)
								
								METHOD GET NAMES:C1166($_at_ArrayNames)
								$_l_FormulaMethodRow:=Find in array:C230($_at_ArrayNames; $_t_Formula)
								If ($_l_FormulaMethodRow>0)
									EXECUTE METHOD:C1007($_t_Formula; LB_r_Num)
									
									//how can i get a the value from this function without knowing the type it returns
								Else 
									EXECUTE FORMULA:C63("LB_r_Num:="+($_t_Formula))
								End if 
								
								If (OK=1)
									//$_ptr_ArrPRec->{$_l_Index}:=LB_r_Num
									Case of 
										: (Type:C295($_ptr_ArrPRec->{$_l_Index})=0) | (Type:C295($_ptr_ArrPRec->{$_l_Index})=2)
											
											$_ptr_ArrPRec->{$_l_Index}:=String:C10(LB_r_Num)
										: (Type:C295($_ptr_ArrPRec->{$_l_Index})=Is real:K8:4) | (Type:C295($_ptr_ArrPRec->{$_l_Index})=Is longint:K8:6) | (Type:C295($_ptr_ArrPRec->{$_l_Index})=Is integer:K8:5)
											
											$_ptr_ArrPRec->{$_l_Index}:=LB_r_Num
										: (Type:C295($_ptr_ArrPRec->{$_l_Index})=Is date:K8:7)
											$_ptr_ArrPRec->{$_l_Index}:=!00-00-00!+LB_r_Num
											
										: (Type:C295($_ptr_ArrPRec->{$_l_Index})=Is time:K8:8)
											$_ptr_ArrPRec->{$_l_Index}:=?00:00:00?+LB_r_Num
											
											
										: (Type:C295($_ptr_ArrPRec->{$_l_Index})=6)
											$_ptr_ArrPRec->{$_l_Index}:=(LB_r_Num=1)
											
											
									End case 
								End if 
							Else 
								
								
								EXECUTE FORMULA:C63($_t_Formula)
								
								$_ptr_ArrPRec->{$_l_Index}:=($_Ptr_ThisColumnField)->
								
							End if 
							
					End case 
					
				End if 
			End for 
			//ON ERR CALL($ErrorProc)  //added 02/07/08, kmw `Modified NG July 2008
			$_l_Index:=$_l_Index+1
			NEXT RECORD:C51($_ptr_Tables->)
		End while 
		
	Else 
		
		
		FIRST RECORD:C50($_ptr_Tables->)
		$_l_NumberOfRecords:=Records in selection:C76($_ptr_Tables->)
		ARRAY LONGINT:C221($_al_FormulaColumns; 0)
		$_bo_FormulaColumnsisSet:=False:C215  //set it to true after the first one
		For ($_l_Index; 1; $_l_NumberOfRecords)
			$_l_ColumnFormulaCell:=1
			For ($_l_Index2; 1; $_l_NumberOfColumns)  //Loop thru the columns first cos is more effic
				If ($_bo_FormulaColumnsisSet)  //just to the next column with a formula
					
					$_l_Index2:=$_al_FormulaColumns{$_l_ColumnFormulaCell}
					$_l_ColumnFormulaCell:=$_l_ColumnFormulaCell+1
				End if 
				$_t_Formula:=$_Ptr_ArrayofFormulas->{$_l_Index2}
				If ($_t_Formula#"")
					If (Not:C34($_bo_FormulaColumnsisSet))
						APPEND TO ARRAY:C911($_al_FormulaColumns; $_l_Index2)
					End if 
					If ($_l_NumberOfRecords>500)  //NG only do if more than 500 records
						If ($_l_Thermometer=0)
							$_l_Thermometer:=OPEN_THERMOMETER("Finding forumlae..."; True:C214)  //added 27/06/08 -kmw
						End if 
						SET_THERMOMETER("Calculating forumlae..."; (($_l_Index2*100)\$_l_NumberOfColumns))  //added 27/06/08 -kmw
					End if 
					$_ptr_ArrPRec:=$_ptr_ArrayOfArrays->{$_l_Index2}
					$_Ptr_ThisColumnField:=$_ptr_ArrayFieldPointers->{$_l_Index2}
					$_l_DataType:=Type:C295($_Ptr_ThisColumnField->)
					
					//then loop thru the array's 'records'
					OK:=1
					$_t_Formula:=$_Ptr_ArrayofFormulas->{$_l_Index2}
					$_t_Formula:=LBi_FmulReplace($_ptr_ListboxSetup; $_t_Formula; $_l_Index)
					If (Position:C15("Macro_ResultTxt"; $_t_Formula)=0)
						If (Position:C15("Macro_Result"; $_t_Formula)>0)
							$_l_CharacterPosition2:=Position:C15("("; $_t_Formula)
							If ($_l_CharacterPosition2>0)
								$_t_After:=Substring:C12($_t_Formula; $_l_CharacterPosition2)
								$_t_Formula:="Macro_Result"+$_t_After
								$_l_DataType:=9
							End if 
						Else 
							//If ($_l_DataType=0)
							//$_l_DataType:=1
						End if 
					Else 
						//$_l_DataType:=0
					End if 
					Case of 
							
							
						: ($_l_DataType=3)  //Picture field
							
							vmTitle2:=$_t_Formula
							EXECUTE FORMULA:C63("GEN_pic_LoadPicture:="+$_t_Formula)
							
							If (OK=1)
								$_ptr_ArrPRec->{$_l_Index}:=GEN_pic_LoadPicture
							Else 
								$_l_Index:=$_l_NumberOfRecords+1
							End if 
							
						: (($_l_DataType=0) | ($_l_DataType=2) | ($_l_DataType=24))
							vMTitle2:=$_t_Formula
							
							EXECUTE FORMULA:C63("vT:="+$_t_Formula)
							
							If (OK=1)
								$_ptr_ArrPRec->{$_l_Index}:=vT
							Else 
								$_l_Index:=$_l_NumberOfRecords+1
							End if 
						: ($_l_DataType=1)
							vMTitle2:=$_t_Formula
							EXECUTE FORMULA:C63("vAmount:="+$_t_Formula)
							If (OK=1)
								$_ptr_ArrPRec->{$_l_Index}:=vAmount
							Else 
								$_l_Index:=$_l_NumberOfRecords+1
							End if 
						: ($_l_DataType=4)
							vMTitle2:=$_t_Formula
							EXECUTE FORMULA:C63("vDate:="+$_t_Formula)
							If (OK=1)
								$_ptr_ArrPRec->{$_l_Index}:=vDate
							Else 
								$_l_Index:=$_l_NumberOfRecords+1
							End if 
							
						: ($_l_DataType=6)
							vMTitle2:=$_t_Formula
							EXECUTE FORMULA:C63("DB_bo_RecordModified:="+$_t_Formula)
							If (OK=1)
								$_ptr_ArrPRec->{$_l_Index}:=DB_bo_RecordModified
							Else 
								$_l_Index:=$_l_NumberOfRecords+1
							End if 
						: (($_l_DataType=8) | ($_l_DataType=9) | ($_l_DataType=11))
							vMTitle2:=$_t_Formula
							LB_l_Longint:=0
							EXECUTE FORMULA:C63("LB_l_Longint:="+$_t_Formula)
							If (OK=1)
								$_ptr_ArrPRec->{$_l_Index}:=LB_l_Longint
							Else 
								$_l_Index:=$_l_NumberOfRecords+1
							End if 
					End case 
					
				End if 
				If ($_bo_FormulaColumnsisSet)
					If ($_l_ColumnFormulaCell>Size of array:C274($_al_FormulaColumns))
						$_l_Index2:=$_l_NumberOfColumns
					End if 
				End if 
			End for 
			$_bo_FormulaColumnsisSet:=True:C214
			//NEXT RECORD($_ptr_Tables->)
		End for 
	End if 
	SET AUTOMATIC RELATIONS:C310(False:C215; False:C215)
	DB_bo_RecordModified:=$_bo_ColumnHasFormula
End if 
If ($_l_Thermometer>0)
	CLOSE_THERMOMETER  //added 27/06/08 -kmw
End if 
ERR_MethodTrackerReturn("LBi_LoadFmul"; $_t_oldMethodName)
