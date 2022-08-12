//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_CurrentSelectiontoXML
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/11/2012 12:16
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Continue; DB_bo_RecordModified)
	C_DATE:C307($_d_Date; vDate)
	C_LONGINT:C283($_l_CellsIndex; $_l_CharacterPosition; $_l_CharacterPosition2; $_l_DataType; $_l_Index; $_l_PageNumber; $_l_RecordCount; $_l_RowIDOffset; $_l_Table1; $_l_TableToGet; $1)
	C_LONGINT:C283($2; $3)
	C_POINTER:C301($_ptr_Field; $_ptr_Table; $_ptr_TableInput; $4; $5)
	C_REAL:C285(LB_r_Num; vAmount)
	C_TEXT:C284($_t_After; $_t_Data; $_t_DataRef; $_t_FieldElement; $_t_Formula; $_t_oldMethodName; $_t_PagesElement; $_t_RecordIDElement; $_t_RecordsElement; $_t_TotalElement; $_t_XMLVar)
	C_TEXT:C284($0; vMTitle2; Vt)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_CurrentSelectiontoXML")

If (Count parameters:C259>=3)
	$_ptr_TableInput:=Table:C252($1)
	$_l_RowIDOffset:=$2
	$_l_PageNumber:=$3
	//this formats the xml for JQGrid
	
	$_t_DataRef:=DOM Create XML Ref:C861("rows")
	$_t_PagesElement:=DOM Create XML element:C865($_t_DataRef; "page")
	DOM SET XML ELEMENT VALUE:C868($_t_PagesElement; $_l_PageNumber)
	$_t_TotalElement:=DOM Create XML element:C865($_t_DataRef; "total")
	DOM SET XML ELEMENT VALUE:C868($_t_TotalElement; 1000)
	$_t_RecordsElement:=DOM Create XML element:C865($_t_DataRef; "records")
	DOM SET XML ELEMENT VALUE:C868($_t_RecordsElement; Records in selection:C76($_ptr_TableInput->))
	COPY NAMED SELECTION:C331($_ptr_TableInput->; "$Temp")
	$_l_RecordCount:=Records in selection:C76($_ptr_TableInput->)
	READ ONLY:C145($_ptr_TableInput->)
	//TRACE
	FIRST RECORD:C50($_ptr_TableInput->)
	For ($_l_Index; 1; $_l_RecordCount)
		USE NAMED SELECTION:C332("$Temp")
		GOTO SELECTED RECORD:C245($_ptr_TableInput->; $_l_Index)
		$_t_RecordIDElement:=DOM Create XML element:C865($_t_DataRef; "row")
		DOM SET XML ATTRIBUTE:C866($_t_RecordIDElement; "id"; String:C10($_l_Index+$_l_RowIDOffset))
		//Here we have to deal with the column not being the same table OR the column having a formula
		//unlike on screen where we put a 'hidden' column with a relationship formula we get the related record NOW
		For ($_l_CellsIndex; 1; Size of array:C274($4->))
			If ($5->{$_l_CellsIndex}#"")  //There is a formula
				$_t_Formula:=$5->{$_l_CellsIndex}
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
					$_t_FieldElement:=DOM Create XML element:C865($_t_RecordIDElement; "cell")
					$_ptr_Field:=$4->{$_l_CellsIndex}
					$_l_DataType:=Type:C295(($_ptr_Field)->)
					$_t_Formula:=$_t_Formula
					vMTitle2:=$_t_Formula
					$_l_CharacterPosition:=Position:C15("["; $_t_Formula)
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
					End if 
					Case of 
							
						: ($_t_Formula="Relate one@") | ($_t_Formula="LB_GetRelation@")
							//TRACE
							EXECUTE FORMULA:C63($_t_Formula)
						: (($_l_DataType=0) | ($_l_DataType=2) | ($_l_DataType=24))
							
							If ($_l_CharacterPosition=0)
								EXECUTE FORMULA:C63("vT:="+$_t_Formula)
								DOM SET XML ELEMENT VALUE:C868($_t_FieldElement; Vt)
							Else 
								
								
								EXECUTE FORMULA:C63($_t_Formula)
								$_t_Data:=$_ptr_Field->
								DOM SET XML ELEMENT VALUE:C868($_t_FieldElement; $_t_Data)
							End if 
						: ($_l_DataType=1)
							$_l_CharacterPosition:=Position:C15("["; $_t_Formula)
							If ($_l_CharacterPosition=0)
								EXECUTE FORMULA:C63("vAmount:="+$_t_Formula)
								DOM SET XML ELEMENT VALUE:C868($_t_FieldElement; vAmount)
								
							Else 
								EXECUTE FORMULA:C63($_t_Formula)
								DOM SET XML ELEMENT VALUE:C868($_t_FieldElement; $_ptr_Field->)
								
								
							End if 
							
						: ($_l_DataType=4)
							$_l_CharacterPosition:=Position:C15("["; $_t_Formula)
							If ($_l_CharacterPosition=0)
								EXECUTE FORMULA:C63("vDate:="+$_t_Formula)
								DOM SET XML ELEMENT VALUE:C868($_t_FieldElement; vDate)
								
								
							Else 
								EXECUTE FORMULA:C63($_t_Formula)
								//NG 2020-this cannot be correct-
								$_d_Date:=($_ptr_Field)->
								DOM SET XML ELEMENT VALUE:C868($_t_FieldElement; $_d_Date)
								
							End if 
							
						: ($_l_DataType=6)
							$_l_CharacterPosition:=Position:C15("["; $_t_Formula)
							If ($_l_CharacterPosition=0)
								EXECUTE FORMULA:C63("DB_bo_RecordModified:="+$_t_Formula)
								DOM SET XML ELEMENT VALUE:C868($_t_FieldElement; DB_bo_RecordModified)
								
								
							Else 
								EXECUTE FORMULA:C63($_t_Formula)
								DOM SET XML ELEMENT VALUE:C868($_t_FieldElement; ($_ptr_Field)->)
								
								
							End if 
							
						: (($_l_DataType=8) | ($_l_DataType=9) | ($_l_DataType=11))
							$_l_CharacterPosition:=Position:C15("["; $_t_Formula)
							If ($_l_CharacterPosition=0)
								EXECUTE FORMULA:C63("LB_r_Num:="+$_t_Formula)
								
								DOM SET XML ELEMENT VALUE:C868($_t_FieldElement; LB_r_Num)
								
							Else 
								EXECUTE FORMULA:C63($_t_Formula)
								DOM SET XML ELEMENT VALUE:C868($_t_FieldElement; ($_ptr_Field)->)
								
								
							End if 
							
					End case 
					
				End if 
			Else 
				
				$_t_FieldElement:=DOM Create XML element:C865($_t_RecordIDElement; "cell")
				$_ptr_Table:=$4->{$_l_CellsIndex}
				If (Table:C252($_ptr_Table)=Table:C252($_ptr_TableInput))
					
					DOM SET XML ELEMENT VALUE:C868($_t_FieldElement; $_ptr_Table->)
				Else 
					
					$_l_TableToGet:=Table:C252($_ptr_Table)
					$_l_Table1:=Table:C252($_ptr_TableInput)
					$_t_Formula:="LB_GetRelation("+String:C10($_l_Table1)+";"+String:C10($_l_TableToGet)+")"
					EXECUTE FORMULA:C63($_t_Formula)
					DOM SET XML ELEMENT VALUE:C868($_t_FieldElement; ($_ptr_Table)->)
				End if 
			End if 
			
		End for 
		//NEXT RECORD([COMPANIES])
		
	End for 
	DOM EXPORT TO VAR:C863($_t_DataRef; $_t_XMLVar)
	$0:=$_t_XMLVar
	//DOM EXPORT TO FILE($_t_DataRef;"")
End if 
//Json...
//total": "xxx", "
//"page": "yyy",
//"records": "zzz",
//"rows": [
//{"id": "1","cell":["cell11","cell12","cell13"]},
//{"id": "2","cell":["cell21","cell22","cell23"]},
ERR_MethodTrackerReturn("DB_CurrentSelectiontoXML"; $_t_oldMethodName)