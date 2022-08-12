If (False:C215)
	//object Name: Object Name:      DB_QR_EDITOR.oDB_QR_EDITOR
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 06/03/2012 11:40
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(DB_al_REpFieldNum;0)
	//ARRAY LONGINT(DB_al_REPTableNum;0)
	//ARRAY LONGINT(DB_al_RowNumber;0)
	//ARRAY LONGINT(DBQR_al_FunctionType;0)
	ARRAY TEXT:C222($_at_ActiveTypes; 0)
	ARRAY TEXT:C222($_at_DocumentSIgnatures; 0)
	ARRAY TEXT:C222($_at_FormatNames; 0)
	//ARRAY TEXT(DBQR_at_FunctionCode;0)
	//ARRAY TEXT(DBQR_at_FunctionNames;0)
	C_BLOB:C604($_blb_DocumentBLOB)
	C_BOOLEAN:C305($_bo_AddFormula; $_bo_Exit; DB_bo_CurrentReportEdited; DB_bo_ShowSorts)
	C_LONGINT:C283($_l_CharacterPosition; $_l_CNumber; $_l_Column; $_l_ColumnHide; $_l_ColumnIndex; $_l_ColumnSize; $_l_event; $_l_FieldNumber; $_l_IndexRow; $_l_Length; $_l_NumberofColumns)
	C_LONGINT:C283($_l_Option1; $_l_Option2; $_l_Option3; $_l_PosCharET; $_l_RepeatedValue; $_l_Row; $_l_SourceProcess; $_l_SourceRow; $_l_TableNumber; $0; DB_l_CurrentDisplayedForm)
	C_LONGINT:C283(DBQR_l_EDITORAREA)
	C_POINTER:C301($_ptr_Field; $_ptr_sourceObject)
	C_TEXT:C284($_t_Character; $_t_Collapse; $_t_ColumnObject; $_t_ColumnTitle; $_t_ColumnValue; $_t_DisplayFormat; $_t_DocumentName; $_t_DocumentPath; $_t_DocumentType; $_t_Expand; $_t_FieldName)
	C_TEXT:C284($_t_Format; $_t_Formula; $_t_oldMethodName; $_t_SciptType; $_t_Script; $_t_ScriptText; $_t_Substring; $_t_VariableName; DB_T_CurrentReportName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ DB_QR_EDITOR.oDB_QR_EDITOR"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Drag Over:K2:13)
		_O_DRAG AND DROP PROPERTIES:C607($_ptr_sourceObject; $_l_SourceRow; $_l_SourceProcess)
		RESOLVE POINTER:C394($_ptr_sourceObject; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		If ($_l_SourceRow=-1)
			GET PASTEBOARD DATA TYPE:C958($_at_DocumentSIgnatures; $_at_ActiveTypes; $_at_FormatNames)
			If (Size of array:C274($_at_DocumentSIgnatures)>0)
				If ($_at_DocumentSIgnatures{1}="com.4d.private.file.url")
					$0:=0
				Else 
					$0:=-1
				End if 
			Else 
				$0:=-1
			End if 
		Else 
			If ($_l_SourceProcess=Current process:C322)
				
				$0:=-1
				
			Else 
				$0:=-1
			End if 
		End if 
	: ($_l_event=On Drop:K2:12)
		//TRACE
		_O_DRAG AND DROP PROPERTIES:C607($_ptr_sourceObject; $_l_SourceRow; $_l_SourceProcess)
		If ($_l_SourceRow=-1)
			ARRAY TEXT:C222($_at_DocumentSIgnatures; 0)
			ARRAY TEXT:C222($_at_ActiveTypes; 0)
			ARRAY TEXT:C222($_at_FormatNames; 0)
			GET PASTEBOARD DATA TYPE:C958($_at_DocumentSIgnatures; $_at_ActiveTypes; $_at_FormatNames)
			If (Size of array:C274($_at_DocumentSIgnatures)>0)
				If ($_at_DocumentSIgnatures{1}="com.4d.private.file.url")
					$_t_DocumentPath:=Get file from pasteboard:C976(1)
					$_t_DocumentType:=Substring:C12($_t_ColumnValue; Length:C16($_t_ColumnValue)-2)
					Case of 
						: ($_t_DocumentType="4qr")
							DOCUMENT TO BLOB:C525($_t_DocumentPath; $_blb_DocumentBLOB)
							QR BLOB TO REPORT:C771(DBQR_l_EDITORAREA; $_blb_DocumentBLOB)
							DB_bo_CurrentReportEdited:=False:C215
							$_t_DocumentName:=DocNameFromPath($_t_DocumentPath)
							
							DB_T_CurrentReportName:=$_t_DocumentName
							
					End case 
					
				End if 
			Else 
				
			End if 
		Else 
			RESOLVE POINTER:C394($_ptr_sourceObject; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
			If ($_l_SourceProcess=Current process:C322)
				DB_bo_CurrentReportEdited:=True:C214
				Case of 
					: ($_t_VariableName="DB_lb_AvailableFields")
						$_l_IndexRow:=$_l_SourceRow
						$_t_Collapse:=Char:C90(5125)
						$_t_Expand:=Char:C90(5121)
						If ($_l_IndexRow<=Size of array:C274(DB_al_RowNumber))
							
							$_l_Row:=DB_al_RowNumber{$_l_IndexRow}
							$_l_TableNumber:=(DB_al_REPTableNum{$_l_Row})
							$_ptr_Field:=Field:C253(DB_al_REPTableNum{$_l_Row}; DB_al_REpFieldNum{$_l_Row})
							$_l_NumberofColumns:=QR Count columns:C764(DBQR_l_EDITORAREA)
							$_t_ColumnValue:=""
							$_t_Formula:="LB_GetRelation ("+String:C10(DB_l_CurrentDisplayedForm)+";"+String:C10(DB_al_REPTableNum{$_l_Row})+")"
							
							
							$_l_Column:=Drop position:C608
							$_l_CNumber:=0
							
							
							
							If ((DB_al_REPTableNum{$_l_Row})#DB_l_CurrentDisplayedForm)
								//check if we already have a relationship
								$_bo_AddFormula:=True:C214
								For ($_l_ColumnIndex; 1; $_l_NumberofColumns)
									
									
									QR GET INFO COLUMN:C766(DBQR_l_EDITORAREA; $_l_ColumnIndex; $_t_ColumnTitle; $_t_ColumnObject; $_l_ColumnHide; $_l_ColumnSize; $_l_RepeatedValue; $_t_DisplayFormat)
									If ($_t_ColumnObject=$_t_Formula)
										$_bo_AddFormula:=False:C215
										$_l_ColumnIndex:=$_l_NumberofColumns
									End if 
								End for 
								If ($_bo_AddFormula)
									QR INSERT COLUMN:C748(DBQR_l_EDITORAREA; $_l_NumberofColumns+1; "LB_GetRelation("+String:C10(DB_l_CurrentDisplayedForm)+";"+String:C10(DB_al_REPTableNum{$_l_Row})+")")
									
									QR SET INFO COLUMN:C765(DBQR_l_EDITORAREA; $_l_NumberofColumns+1; "Relate"; "LB_GetRelation("+String:C10(DB_l_CurrentDisplayedForm)+";"+String:C10(DB_al_REPTableNum{$_l_Row})+")"; 1; 0; 1; "")
									
									$_l_NumberofColumns:=$_l_NumberofColumns+1
								End if 
							End if 
							QR INSERT COLUMN:C748(DBQR_l_EDITORAREA; $_l_NumberofColumns+1; $_ptr_Field)
							$_t_FieldName:=Field name:C257($_ptr_Field)
						End if 
						Case of 
							: (Type:C295($_ptr_Field->)=Is text:K8:3) | (Type:C295($_ptr_Field->)=Is alpha field:K8:1)
								
								QR SET INFO COLUMN:C765(DBQR_l_EDITORAREA; $_l_NumberofColumns+1; $_t_FieldName; $_ptr_Field; 0; 80; 1; "")
							Else 
								QR SET INFO COLUMN:C765(DBQR_l_EDITORAREA; $_l_NumberofColumns+1; $_t_FieldName; $_ptr_Field; 0; 80; 1; "###,###,###0.00")
						End case 
					: ($_t_VariableName="DB_lb_AvailableFunctions")
						$_l_IndexRow:=$_l_SourceRow
						If ($_l_IndexRow<=Size of array:C274(DBQR_at_FunctionNames))
							If (DBQR_al_FunctionType{$_l_IndexRow}=2)
								$_t_Formula:=DBQR_at_FunctionNames{$_l_IndexRow}
								$_l_NumberofColumns:=QR Count columns:C764(DBQR_l_EDITORAREA)
								$_t_ColumnValue:=""
								$_l_Column:=Drop position:C608
								$_l_CNumber:=0
								If ($_l_Column<0)
									$_l_Column:=0
								End if 
								QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1=DBQR_at_FunctionCode{DBQR_at_FunctionCode})
								$_t_ScriptText:=[SCRIPTS:80]Recording_Text:4
								$_l_Length:=Length:C16($_t_ScriptText)
								$_t_SciptType:=""
								$_bo_Exit:=False:C215
								$_l_PosCharET:=Position:C15(Char:C90(13); $_t_ScriptText)
								
								Repeat 
									
									If ($_l_Length>0)
										$_t_Character:=$_t_ScriptText[[$_l_Length]]
										
										If ($_t_Character=Char:C90(13)) | ($_l_PosCharET=0)
											If ($_l_PosCharET>0)
												$_t_Substring:=Substring:C12($_t_ScriptText; $_l_Length+1)
												$_t_ScriptText:=Substring:C12($_t_ScriptText; 1; $_l_Length-1)
											Else 
												$_t_Substring:=$_t_ScriptText
												$_t_ScriptText:=""
											End if 
											
											$_l_CharacterPosition:=Position:C15(":="; $_t_Substring)
											If ($_l_CharacterPosition>0)
												$_t_VariableName:=Substring:C12($_t_Substring; 1; $_l_CharacterPosition-1)
											End if 
											Case of 
												: ($_t_VariableName="VMResult")  //Numeric
													$_t_SciptType:="Macro Result"
													$_bo_Exit:=True:C214
												: ($_t_VariableName="VMResultLongint")  //NumericLongint
													$_t_SciptType:="Macro_Result_Long"
													$_bo_Exit:=True:C214
												: ($_t_VariableName="VMResultReal")  //NumericReal
													$_t_SciptType:="Macro_Result_Real"
													$_bo_Exit:=True:C214
												: ($_t_VariableName="VMResultText")  //
													$_t_SciptType:="Macro_Result_Text"
													$_bo_Exit:=True:C214
												: ($_t_VariableName="VMResultDate")  //Numeric
													$_t_SciptType:="Macro_Result_Date"
													$_bo_Exit:=True:C214
												: ($_t_VariableName="VMResultTime")  //Numeric
													$_t_SciptType:="Macro_Result_Time"
													$_bo_Exit:=True:C214
												: ($_t_VariableName="VMResultBoolean")  //Numeric
													$_t_SciptType:="Macro_Result_Boolean"
													$_bo_Exit:=True:C214
												: ($_t_VariableName="VMResultPicture")  //Numeric
													$_t_SciptType:="Macro_Result_Picture"
													$_bo_Exit:=True:C214
												: ($_t_VariableName="vText")  //this is the previous code-this will support this but we wont flag it up as an option
													$_t_SciptType:="Macro ResultTxt"
													$_bo_Exit:=True:C214
												Else 
													//Gen_Alert("Sorry the function "$_t_Formula
											End case 
											
										End if 
									Else 
										$_bo_Exit:=True:C214
									End if 
									$_l_Length:=$_l_Length-1
									$_l_PosCharET:=Position:C15(Char:C90(13); $_t_ScriptText)
								Until ($_bo_Exit) | ($_l_Length<1)
								If ($_t_SciptType="")
									Gen_Alert("Sorry the function "+DBQR_at_FunctionNames{$_l_IndexRow}+" Does not set an appropriate value, it must set one of the following VmResult, VmResultTEXT, vmResultDATE,  vmResultTIME, vmResultPICTURE, vmResultBOOLEAN,vmResultREAl, vmResultLONGINT"; "OK")
									
								Else 
									QR INSERT COLUMN:C748(DBQR_l_EDITORAREA; $_l_Column+1; $_t_SciptType+"("+Char:C90(34)+DBQR_at_FunctionCode{DBQR_at_FunctionCode}+Char:C90(34)+")")
									$_t_VariableName:=""
									$_t_Script:=""
									$_l_Option1:=0
									$_l_Option2:=0
									$_l_Option3:=0
									$_t_Format:=""
									QR GET INFO COLUMN:C766(DBQR_l_EDITORAREA; $_l_Column+1; $_t_VariableName; $_t_Script; $_l_Option1; $_l_Option2; $_l_Option3; $_t_Format)
									QR SET INFO COLUMN:C765(DBQR_l_EDITORAREA; $_l_Column+1; $_t_VariableName; $_t_SciptType+"("+Char:C90(34)+DBQR_at_FunctionCode{DBQR_at_FunctionCode}+Char:C90(34)+")"; 0; 50; 1; "")
									$_l_NumberofColumns:=$_l_NumberofColumns+1
								End if 
								
							Else 
								$_t_Formula:=DBQR_at_FunctionNames{$_l_IndexRow}
								$_l_NumberofColumns:=QR Count columns:C764(DBQR_l_EDITORAREA)
								$_t_ColumnValue:=""
								$_l_Column:=Drop position:C608
								$_l_CNumber:=0
								If ($_l_Column<0)
									$_l_Column:=0
								End if 
								QR INSERT COLUMN:C748(DBQR_l_EDITORAREA; $_l_Column+1; $_t_Formula)
								$_t_VariableName:=""
								QR GET INFO COLUMN:C766(DBQR_l_EDITORAREA; $_l_Column+1; $_t_VariableName; $_t_Formula; $_l_Option1; $_l_Option2; $_l_Option3; $_t_Format)
								QR SET INFO COLUMN:C765(DBQR_l_EDITORAREA; $_l_Column+1; $_t_VariableName; $_t_Formula; 0; 50; 1; "")
								
								$_l_NumberofColumns:=$_l_NumberofColumns+1
							End if 
						End if 
				End case 
				
			Else 
				
			End if 
		End if 
		If (DB_bo_ShowSorts)  //Sort columns are display-note the following uses the same code as the button to turn it on
			DBQR_ShowSortColumns
		End if 
	: ($_l_event=On Plug in Area:K2:16)
		
		//if we add or insert a column then we might need to adjust the sort column options
		If (DB_bo_ShowSorts)  //Sort columns are display-note the following uses the same code as the button to turn it on
			
			DBQR_ShowSortColumns
		End if 
	Else 
		//TRACE
		
End case 
ERR_MethodTrackerReturn("OBJ DB_QR_EDITOR.oDB_QR_EDITOR"; $_t_oldMethodName)
