//%attributes = {}
If (False:C215)
	//Project Method Name:      EXP_RecordasXML
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/09/2012 14:13
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_FieldTypesNUM; 0)
	ARRAY LONGINT:C221($_al_ManyFieldNum; 0)
	ARRAY LONGINT:C221($_al_ManyTableNum; 0)
	ARRAY LONGINT:C221($_al_ThisTableField; 0)
	ARRAY TEXT:C222($_at_FieldTypesSTR; 0)
	C_BLOB:C604($_blb_Picture)
	C_BOOLEAN:C305($_bo_CloseHeader; $_bo_ManysFound; $_bo_OpenHeader; $_bo_SendInvisible; $_bo_SendRelatedMany; $_bo_SendRelatedOne; $3; $4; $5)
	C_LONGINT:C283($_l_CountFields2; $_l_ExportIndex2; $_l_FieldCount; $_l_FieldIndex; $_l_FieldLength; $_l_FieldType; $_l_FieldTypeRow; $_l_FindManyFieldsIndex; $_l_FindManyTablesIndex; $_l_ManyOutput; $_l_OneField)
	C_LONGINT:C283($_l_OneField2; $_l_OneTable; $_l_OneTable2; $_l_RecordNumber; $_l_RecordsCount; $2; $6)
	C_POINTER:C301($_Ptr_CurrentTable; $_ptr_Field; $_ptr_HomeField; $_ptr_ManyField; $_ptr_ManyTable)
	C_TEXT:C284($_t_FieldName; $_t_oldMethodName; $_t_TableName; $_t_TImeString)
	C_TIME:C306($_ti_TIme; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("EXP_RecordasXML")
//this method will export any record as xml.

//pass $6 as 2 to open but not close 1 to open and close  to get this to out put the table name-if we are sending multiple recods ony need the table name on the first record(and then close it on the last)
//This has some handling for sub records
//pass $6 as -1 to close the header
$_bo_ManysFound:=False:C215
If (Count parameters:C259>=2)
	If (Count parameters:C259>=3)
		$_bo_SendRelatedOne:=$3
	Else 
		$_bo_SendRelatedOne:=False:C215
	End if 
	If (Count parameters:C259>=4)
		
		$_bo_SendRelatedMany:=$4
	Else 
		$_bo_SendRelatedMany:=False:C215
	End if 
	If (Count parameters:C259>=5)
		$_bo_SendInvisible:=$5
	Else 
		$_bo_SendInvisible:=False:C215
	End if 
	If (Count parameters:C259>=6)
		$_bo_OpenHeader:=($6>0)
		$_bo_CloseHeader:=(Abs:C99($6)=1)
		
	Else 
		//Default is to open and close
		$_bo_OpenHeader:=True:C214
		$_bo_CloseHeader:=True:C214
	End if 
	If ($1#?00:00:00?)
		$_t_TableName:=Table name:C256($2)
		
		If ($_bo_OpenHeader)
			EXP_AddXMLelement($1; "Table_Name"; $_t_TableName; False:C215)
		End if 
		$_l_FieldCount:=Get last field number:C255($2)
		If ($_bo_OpenHeader)
			EXP_AddXMLelement($1; "Table_Num"; String:C10($2))  // Note send this on every record for ease and clarity
		End if 
		ARRAY TEXT:C222($_at_FieldTypesSTR; 11)  // so we can make the export
		ARRAY LONGINT:C221($_al_FieldTypesNUM; 11)
		$_al_FieldTypesNUM{1}:=0
		$_at_FieldTypesSTR{1}:="Alpha FIeld"
		$_al_FieldTypesNUM{2}:=30
		$_at_FieldTypesSTR{2}:="Binary Object"
		$_al_FieldTypesNUM{3}:=6
		$_at_FieldTypesSTR{3}:="Boolean"
		$_al_FieldTypesNUM{4}:=4
		$_at_FieldTypesSTR{4}:="Date"
		$_al_FieldTypesNUM{5}:=8
		$_at_FieldTypesSTR{5}:="Integer"
		$_al_FieldTypesNUM{6}:=9
		$_at_FieldTypesSTR{6}:="Long Integer"
		$_al_FieldTypesNUM{7}:=3
		$_at_FieldTypesSTR{7}:="Picture(as Binary object)"
		$_al_FieldTypesNUM{8}:=1
		$_at_FieldTypesSTR{8}:="Real Number(floating point)"
		$_al_FieldTypesNUM{9}:=7
		$_at_FieldTypesSTR{9}:="Subtable"
		$_al_FieldTypesNUM{10}:=2
		$_at_FieldTypesSTR{10}:="Text"
		$_al_FieldTypesNUM{11}:=11
		$_at_FieldTypesSTR{11}:="Time"
		$_Ptr_CurrentTable:=Table:C252($2)
		$_l_RecordNumber:=Record number:C243($_Ptr_CurrentTable->)
		
		
		EXP_AddXMLelement($1; "Record_Number"; String:C10($_l_RecordNumber); False:C215)
		If ($_l_FieldCount>0)
			For ($_l_FieldIndex; 1; $_l_FieldCount)
				$_t_FieldName:=Field name:C257($2; $_l_FieldIndex)
				EXP_AddXMLelement($1; "Field_Name"; $_t_FieldName; False:C215)
				GET FIELD PROPERTIES:C258($2; $_l_FieldIndex; $_l_FieldType; $_l_FieldLength)
				
				$_ptr_Field:=Field:C253($2; $_l_FieldIndex)
				$_l_FieldType:=Type:C295($_ptr_Field->)
				If ($_l_FieldType#7)
					EXP_AddXMLelement($1; "Field_Type"; String:C10($_l_FieldType))
					$_l_FieldTypeRow:=Find in array:C230($_al_FieldTypesNUM; $_l_FieldType)
					If ($_l_FieldType=0)
						EXP_AddXMLelement($1; "Field_TypeName"; $_at_FieldTypesSTR{$_l_FieldTypeRow}+"("+String:C10($_l_FieldLength)+")")
					Else 
						EXP_AddXMLelement($1; "Field_TypeName"; $_at_FieldTypesSTR{$_l_FieldTypeRow})
					End if 
					$_ptr_HomeField:=Field:C253($2; $_l_FieldIndex)
					Case of 
						: ($_l_FieldType=0) | ($_l_FieldType=2)  // string or text
							EXP_AddXMLelement($1; "Field_Data"; $_ptr_HomeField->)
						: ($_l_FieldType=6)  // boolean
							If ($_ptr_HomeField->)
								EXP_AddXMLelement($1; "Field_Data"; "TRUE")
							Else 
								EXP_AddXMLelement($1; "Field_Data"; "FALSE")
							End if 
						: ($_l_FieldType=4)  // date
							EXP_AddXMLelement($1; "Field_Data"; String:C10($_ptr_HomeField->; 8))
						: ($_l_FieldType=11)  // time
							
							$_ti_TIme:=$_ptr_HomeField->
							$_t_TImeString:=Time string:C180($_ti_TIme*1)
							EXP_AddXMLelement($1; "Field_Data"; $_t_TImeString)
						: ($_l_FieldType=8) | ($_l_FieldType=9) | ($_l_FieldType=1)  // integer longint or real
							EXP_AddXMLelement($1; "Field_Data"; String:C10($_ptr_HomeField->))
						: ($_l_FieldType=9)
							PICTURE TO BLOB:C692($_ptr_HomeField->; $_blb_Picture; "JPEG")
							EXP_AddXMLcDataElement($1; "FIeld_Data"; ->$_blb_Picture)
						: ($_l_FieldType=30)
							EXP_AddXMLcDataElement($1; "FIeld_Data"; $_ptr_HomeField)
					End case 
					If ($_bo_SendRelatedOne) | ($_bo_SendRelatedMany)
						//get relations
						If ($_bo_SendRelatedOne)
							GET RELATION PROPERTIES:C686($2; $_l_FieldIndex; $_l_OneTable; $_l_OneField)
							If ($_l_OneTable>0)
								$_ptr_HomeField:=Field:C253($2; $_l_FieldIndex)
								
								//$Value:=$_ptr_HomeField->
								$_ptr_ManyTable:=Table:C252($_l_OneTable)
								$_ptr_ManyField:=Field:C253($_l_OneTable; $_l_OneField)
								QUERY:C277($_ptr_ManyTable->; $_ptr_ManyField->=$_ptr_HomeField->)  // by the very nature of the relationship there is no need to test a type match
								If (Records in selection:C76($_ptr_ManyTable->)>0)
									//now send the record
									EXP_RecordasXML($1; $_l_OneTable; $_bo_SendRelatedOne; False:C215; $_bo_SendInvisible; 1)  //dont recurse to the manys from here as it will
								End if 
							End if 
						End if 
						If ($_bo_SendRelatedMany)
							//Because it is not possible to get the related many from this record we have to find if this is the related one of anything
							If ($_bo_ManysFound=False:C215)
								ARRAY LONGINT:C221($_al_ManyTableNum; 0)
								ARRAY LONGINT:C221($_al_ManyFieldNum; 0)
								ARRAY LONGINT:C221($_al_ThisTableField; 0)
								For ($_l_FindManyTablesIndex; 1; Get last table number:C254)
									If (Is table number valid:C999($_l_FindManyTablesIndex))
										
										$_l_CountFields2:=Get last field number:C255($_l_FindManyTablesIndex)
										For ($_l_FindManyFieldsIndex; 1; $_l_CountFields2)
											If (Is field number valid:C1000($_l_FindManyTablesIndex; $_l_FindManyFieldsIndex))
												GET RELATION PROPERTIES:C686($_l_FindManyTablesIndex; $_l_FindManyFieldsIndex; $_l_OneTable2; $_l_OneField2)
												If ($_l_OneTable2=$2)  //many relates to this table
													APPEND TO ARRAY:C911($_al_ManyTableNum; $_l_FindManyTablesIndex)
													APPEND TO ARRAY:C911($_al_ManyFieldNum; $_l_FindManyFieldsIndex)
													APPEND TO ARRAY:C911($_al_ThisTableField; $_l_OneField2)
												End if 
											End if 
										End for 
									End if 
								End for 
								$_bo_ManysFound:=True:C214
							End if 
							For ($_l_ManyOutput; 1; Size of array:C274($_al_ThisTableField))
								If ($_al_ThisTableField{$_l_ManyOutput}=$_l_FieldIndex)
									//there are manys related to this
									$_ptr_HomeField:=Field:C253($2; $_l_FieldIndex)
									
									
									$_ptr_ManyTable:=Table:C252($_al_ManyTableNum{$_l_ManyOutput})
									$_ptr_ManyField:=Field:C253($_al_ManyTableNum{$_l_ManyOutput}; $_al_ManyFieldNum{$_l_ManyOutput})
									QUERY:C277($_ptr_ManyTable->; $_ptr_ManyField->=$_ptr_HomeField->)  // by the very nature of the relationship there is no need to test a type match
									If (Records in selection:C76($_ptr_ManyTable->)>0)
										//now send the record
										//here we have multiple records
										FIRST RECORD:C50($_ptr_ManyTable->)
										$_l_RecordsCount:=Records in selection:C76($_ptr_ManyTable->)
										If ($_l_RecordsCount>1)
											For ($_l_ExportIndex2; 1; $_l_RecordsCount)
												Case of 
													: ($_l_ExportIndex2=1)  //open it-send the table name
														EXP_RecordasXML($1; $_al_ManyTableNum{$_l_ManyOutput}; $_bo_SendRelatedOne; $_bo_SendRelatedMany; $_bo_SendInvisible; 2)
													: ($_l_ExportIndex2=$_l_RecordsCount)  // close the table name subsection
														EXP_RecordasXML($1; $_al_ManyTableNum{$_l_ManyOutput}; $_bo_SendRelatedOne; $_bo_SendRelatedMany; $_bo_SendInvisible; -1)
														
													: ($_l_ExportIndex2=1)  //do not open or close the table name subseciton
														EXP_RecordasXML($1; $_al_ManyTableNum{$_l_ManyOutput}; $_bo_SendRelatedOne; $_bo_SendRelatedMany; $_bo_SendInvisible; -2)
												End case 
												NEXT RECORD:C51($_ptr_ManyTable->)
											End for 
										Else 
											EXP_RecordasXML($1; $_al_ManyTableNum{$_l_ManyOutput}; $_bo_SendRelatedOne; $_bo_SendRelatedMany; $_bo_SendInvisible; 1)
											
										End if 
										
									End if 
								End if 
							End for 
						End if 
						
					End if 
					//:=$4
				Else 
					//Subtable
					
					EXP_ADDSubtableData($1; $2; $_l_FieldIndex; $_bo_SendRelatedOne; $_bo_SendRelatedMany; $_bo_SendInvisible)
					
				End if 
				EXP_AddXMLelement($1; ""; ""; True:C214)  //just closes an element
			End for 
			
		End if 
		EXP_AddXMLelement($1; ""; ""; True:C214)  //just closes an element
		If ($_bo_CloseHeader)
			EXP_AddXMLelement($1; ""; ""; True:C214)
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("EXP_RecordasXML"; $_t_oldMethodName)