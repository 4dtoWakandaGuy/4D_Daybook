//%attributes = {}
If (False:C215)
	//Project Method Name:      DYN_SQLIZE
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 06/03/2013 18:58
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_FieldIndexed; $_bo_FieldInvisible; $_bo_FieldUnique)
	C_LONGINT:C283($_l_CharacterIndex; $_l_FIeldIndex; $_l_FieldLength; $_l_FieldType; $_l_SpacePosition; $_l_TableIndex)
	C_POINTER:C301($_ptr_FieldPointer)
	C_TEXT:C284($_t_AddText; $_t_FieldName; $_t_NewFieldName; $_t_NewTableName; $_t_oldMethodName; $_t_ParentTable; $_t_String; $_t_TableName)
	C_TIME:C306($_ti_DocumentRef)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("DYN_SQLIZE")

$_ti_DocumentRef:=DB_CreateDocument(""; "Text")
For ($_l_TableIndex; 1; Get last table number:C254)
	If (Is table number valid:C999($_l_TableIndex))
		$_t_TableName:=Table name:C256($_l_TableIndex)
		$_l_SpacePosition:=Position:C15(" "; $_t_TableName)
		$_t_AddText:="$macroText:=Replace string($macroText;"
		
		If ($_l_SpacePosition>0)
			$_t_NewTableName:=Replace string:C233($_t_TableName; " "; "_")
			
			SEND PACKET:C103($_ti_DocumentRef; $_t_AddText+Char:C90(Quote:K15:44)+$_t_TableName+Char:C90(Quote:K15:44)+";"+Char:C90(Quote:K15:44)+$_t_NewTableName+Char:C90(Quote:K15:44)+")"+Char:C90(13))
		Else 
			$_t_NewTableName:=$_t_TableName
		End if 
		For ($_l_FIeldIndex; 1; Get last field number:C255($_l_TableIndex))
			If (Is field number valid:C1000($_l_TableIndex; $_l_FIeldIndex))
				$_ptr_FieldPointer:=Field:C253($_l_TableIndex; $_l_FIeldIndex)
				GET FIELD PROPERTIES:C258($_ptr_FieldPointer; $_l_FieldType; $_l_FieldLength; $_bo_FieldIndexed; $_bo_FieldUnique; $_bo_FieldInvisible)
				$_t_String:=String:C10($_l_FieldType)+Char:C90(9)+String:C10($_l_FieldLength)+Char:C90(9)+String:C10(Num:C11($_bo_FieldIndexed))+Char:C90(9)+String:C10(Num:C11($_bo_FieldUnique))+Char:C90(9)+String:C10(Num:C11($_bo_FieldInvisible))
				$_t_FieldName:=Field name:C257($_l_TableIndex; $_l_FIeldIndex)
				$_l_SpacePosition:=Position:C15(" "; $_t_FieldName)
				If ($_l_SpacePosition>0)
					$_t_NewFieldName:=Replace string:C233($_t_FieldName; " "; "_")
					SEND PACKET:C103($_ti_DocumentRef; $_t_AddText+Char:C90(Quote:K15:44)+"["+$_t_NewTableName+"]"+$_t_FieldName+Char:C90(Quote:K15:44)+";"+Char:C90(Quote:K15:44)+"["+$_t_NewTableName+"]"+$_t_NewFieldName+Char:C90(Quote:K15:44)+")"+Char:C90(13))
					
					//SEND PACKET($_ti_DocumentRef;Char(9)+$_t_FieldName+Char(9)+$_t_String)
					
					If (Type:C295($_ptr_FieldPointer->)=Is subtable:K8:11)
						SEND PACKET:C103($_ti_DocumentRef; "•")
						
					End if 
					//SEND PACKET($_ti_DocumentRef;Char(13))
				Else 
					If ($_t_FieldName="id_added_by_converter")
						$_t_NewFieldName:=Replace string:C233($_t_FieldName; "id_added_by_converter"; "ID")
						SEND PACKET:C103($_ti_DocumentRef; $_t_AddText+Char:C90(Quote:K15:44)+"["+$_t_NewTableName+"]"+$_t_FieldName+Char:C90(Quote:K15:44)+";"+Char:C90(Quote:K15:44)+"["+$_t_NewTableName+"]"+$_t_NewFieldName+Char:C90(Quote:K15:44)+")"+Char:C90(13))
						
					End if 
					If ($_t_FieldName="Parent_record_code")
						For ($_l_CharacterIndex; Length:C16($_t_NewTableName); 1; -1)
							If ($_t_NewTableName[[$_l_CharacterIndex]]="_")
								$_t_ParentTable:=Substring:C12($_t_NewTableName; 1; $_l_CharacterIndex-1)
								$_l_CharacterIndex:=0
							End if 
						End for 
						
						$_t_NewFieldName:=Replace string:C233($_t_FieldName; "Parent_record_code"; $_t_ParentTable+"_"+"Code")
						SEND PACKET:C103($_ti_DocumentRef; $_t_AddText+Char:C90(Quote:K15:44)+"["+$_t_NewTableName+"]"+$_t_FieldName+Char:C90(Quote:K15:44)+";"+Char:C90(Quote:K15:44)+"["+$_t_NewTableName+"]"+$_t_NewFieldName+Char:C90(Quote:K15:44)+")"+Char:C90(13))
					End if 
				End if 
			End if 
		End for 
	End if 
	
End for 
CLOSE DOCUMENT:C267($_ti_DocumentRef)
ERR_MethodTrackerReturn("EXP_STRUCT"; $_t_oldMethodName)