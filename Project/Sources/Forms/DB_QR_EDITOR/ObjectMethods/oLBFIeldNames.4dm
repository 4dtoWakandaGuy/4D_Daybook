If (False:C215)
	//object Name: Object Name:      DB_QR_EDITOR.oLBFIeldNames
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/12/2011 03:03
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(DB_abo_Expanded;0)
	//ARRAY BOOLEAN(DB_abo_HasRelated;0)
	//ARRAY BOOLEAN(DB_lb_AvailableFields;0)
	//ARRAY LONGINT(DB_al_RELRelationFieldNum;0)
	//ARRAY LONGINT(DB_al_REpFieldNum;0)
	//ARRAY LONGINT(DB_al_REPTableNum;0)
	//ARRAY LONGINT(DB_al_RowNumber;0)
	//ARRAY PICTURE(DB_apic_ExpandCollapse;0)
	//ARRAY TEXT(DB_at_ExpandCollapse;0)
	//ARRAY TEXT(DB_at_RepFieldName;0)
	//ARRAY TEXT(DB_at_RowName;0)
	C_BOOLEAN:C305($_bo_AddFormula; DB_bo_ShowSorts)
	C_LONGINT:C283($_bo_RepeatedValue; $_l_CellNumber; $_l_Column; $_l_ColumnIndex; $_l_ColumnIndexnsert; $_l_ColumnSize; $_l_event; $_l_FieldNumber; $_l_Hide; $_l_Index; $_l_IndexRow)
	C_LONGINT:C283($_l_NumberofColumns; $_l_Row; $_l_RowNumber; $_l_TableNumber; DB_l_CurrentDisplayedForm; DB_l_ReportType; DBQR_l_EDITORAREA)
	C_PICTURE:C286($_pic_CollapsePicture; $_pic_ExpandPicture; $_pic_NoPicture)
	C_POINTER:C301($_ptr_Field)
	C_TEXT:C284($_t_Collapse; $_t_ColumnFormula; $_t_ColumnObject; $_t_ColumnTitle; $_t_ColumnValue; $_t_DisplayFormat; $_t_Expand; $_t_FieldName; $_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [projectForm]/DB_QR_EDITOR/oLBFIeldNames"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		LISTBOX GET CELL POSITION:C971(DB_lb_AvailableFields; $_l_Column; $_l_Row)
		Case of 
			: ($_l_Column=1)
				If ($_l_Row>0)
					$_t_Collapse:=Char:C90(5125)
					$_t_Expand:=Char:C90(5121)
					If (DB_abo_HasRelated{$_l_Row})
						If (DB_abo_Expanded{$_l_Row})
							//collapse it
							
							//GET PICTURE FROM LIBRARY(22553; $_pic_CollapsePicture)
							$_pic_CollapsePicture:=Get_Picture(22553)
							DB_abo_Expanded{$_l_Row}:=False:C215
							DB_at_ExpandCollapse{$_l_Row}:=$_t_Collapse
							$_l_CellNumber:=DB_al_RowNumber{$_l_Row}
							$_l_FieldNumber:=DB_al_REpFieldNum{$_l_CellNumber}
							For ($_l_Index; $_l_CellNumber+1; Size of array:C274(DB_al_REPTableNum))
								If (DB_al_RELRelationFieldNum{$_l_Index}=$_l_FieldNumber)
									$_l_RowNumber:=Find in array:C230(DB_al_RowNumber; $_l_Index)
									If ($_l_RowNumber>0)
										DELETE FROM ARRAY:C228(DB_abo_Expanded; $_l_RowNumber)
										DELETE FROM ARRAY:C228(DB_at_ExpandCollapse; $_l_RowNumber)
										DELETE FROM ARRAY:C228(DB_at_RowName; $_l_RowNumber)
										DELETE FROM ARRAY:C228(DB_al_RowNumber; $_l_RowNumber)
										DELETE FROM ARRAY:C228(DB_abo_HasRelated; $_l_RowNumber)
										
									Else 
										$_l_Index:=Size of array:C274(DB_al_REPTableNum)
									End if 
								End if 
							End for 
						Else 
							//Get Picture FROM LIBRARY(22554;$_pic_ExpandPicture)
							DB_abo_Expanded{$_l_Row}:=True:C214
							DB_at_ExpandCollapse{$_l_Row}:=$_t_Expand
							$_l_CellNumber:=DB_al_RowNumber{$_l_Row}
							$_l_FieldNumber:=DB_al_REpFieldNum{$_l_CellNumber}
							$_l_ColumnIndexnsert:=1
							//Get Picture FROM LIBRARY(417;$_pic_NoPicture)
							For ($_l_Index; $_l_CellNumber+1; Size of array:C274(DB_al_REPTableNum))
								If (DB_al_RELRelationFieldNum{$_l_Index}=$_l_FieldNumber)
									INSERT IN ARRAY:C227(DB_abo_Expanded; $_l_Row+$_l_ColumnIndexnsert; 1)
									INSERT IN ARRAY:C227(DB_at_ExpandCollapse; $_l_Row+$_l_ColumnIndexnsert; 1)
									INSERT IN ARRAY:C227(DB_at_RowName; $_l_Row+$_l_ColumnIndexnsert; 1)
									INSERT IN ARRAY:C227(DB_al_RowNumber; $_l_Row+$_l_ColumnIndexnsert; 1)
									INSERT IN ARRAY:C227(DB_abo_HasRelated; $_l_Row+$_l_ColumnIndexnsert; 1)
									DB_abo_Expanded{$_l_Row+$_l_ColumnIndexnsert}:=False:C215
									DB_at_ExpandCollapse{$_l_Row+$_l_ColumnIndexnsert}:=""
									DB_at_RowName{$_l_Row+$_l_ColumnIndexnsert}:=DB_at_RepFieldName{$_l_Index}
									DB_al_RowNumber{$_l_Row+$_l_ColumnIndexnsert}:=$_l_Index
									DB_abo_HasRelated{$_l_Row+$_l_ColumnIndexnsert}:=False:C215
									$_l_ColumnIndexnsert:=$_l_ColumnIndexnsert+1
								Else 
									//$_l_Index:=Size of array(DB_al_REPTableNum)
								End if 
							End for 
						End if 
					End if 
				End if 
		End case 
	: ($_l_event=On Double Clicked:K2:5)
		Case of 
			: (DB_l_ReportType=SuperReportReport Template)
				
			: (DB_l_ReportType=SuperWrite Report Template)
				LISTBOX GET CELL POSITION:C971(DB_lb_AvailableFields; $_l_Column; $_l_Row)
				$_l_IndexRow:=$_l_Row
				If ($_l_IndexRow<=Size of array:C274(DB_al_RowNumber))
					$_l_Row:=DB_al_RowNumber{$_l_IndexRow}
					$_l_TableNumber:=(DB_al_REPTableNum{$_l_Row})
					$_ptr_Field:=Field:C253(DB_al_REPTableNum{$_l_Row}; DB_al_REpFieldNum{$_l_Row})
					$_l_NumberofColumns:=QR Count columns:C764(DBQR_l_EDITORAREA)
					$_t_ColumnValue:=""
					$_t_ColumnFormula:="LB_GetRelation ("+String:C10(DB_l_CurrentDisplayedForm)+";"+String:C10(DB_al_REPTableNum{$_l_Row})+")"
					$_l_Column:=Drop position:C608
					
					
					
					
					If ((DB_al_REPTableNum{$_l_Row})#DB_l_CurrentDisplayedForm)
						//check if we already have a relationship
						$_bo_AddFormula:=True:C214
						For ($_l_ColumnIndex; 1; $_l_NumberofColumns)
							
							
							QR GET INFO COLUMN:C766(DBQR_l_EDITORAREA; $_l_ColumnIndex; $_t_ColumnTitle; $_t_ColumnObject; $_l_Hide; $_l_ColumnSize; $_bo_RepeatedValue; $_t_DisplayFormat)
							If ($_t_ColumnObject=$_t_ColumnFormula)
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
				
				
				
				If (DB_bo_ShowSorts=True:C214)  //Sort columns are display-note the following uses the same code as the button to turn it on
					DBQR_ShowSortColumns
				End if 
				
				
		End case 
End case 
ERR_MethodTrackerReturn("OBJ DB_QR_EDITOR.oLBFIeldNames"; $_t_oldMethodName)
