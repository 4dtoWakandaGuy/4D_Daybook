//%attributes = {}
If (False:C215)
	//Project Method Name:      EXP_STRUCT
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/10/2013 21:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By 
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_FieldIndexed; $_bo_FieldInvisible; $_bo_FieldUnique)
	C_LONGINT:C283($_l_FieldIndex; $_l_FieldLength; $_l_FieldType; $_l_TableIndex)
	C_POINTER:C301($_ptr_FieldPointer)
	C_TEXT:C284($_t_FieldName; $_t_oldMethodName; $_t_String; $_t_TableName)
	C_TIME:C306($_ti_DocumentRef)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("EXP_STRUCT")

$_ti_DocumentRef:=DB_CreateDocument(""; "Text")
For ($_l_TableIndex; 1; Get last table number:C254)
	If (Is table number valid:C999($_l_TableIndex))
		$_t_TableName:=Table name:C256($_l_TableIndex)
		SEND PACKET:C103($_ti_DocumentRef; $_t_TableName+Char:C90(13))
		If (True:C214)
			For ($_l_FieldIndex; 1; Get last field number:C255($_l_TableIndex))
				If (Is field number valid:C1000($_l_TableIndex; $_l_FieldIndex))
					$_ptr_FieldPointer:=Field:C253($_l_TableIndex; $_l_FieldIndex)
					GET FIELD PROPERTIES:C258($_ptr_FieldPointer; $_l_FieldType; $_l_FieldLength; $_bo_FieldIndexed; $_bo_FieldUnique; $_bo_FieldInvisible)
					$_t_String:=String:C10($_l_FieldType)+Char:C90(9)+String:C10($_l_FieldLength)+Char:C90(9)+String:C10(Num:C11($_bo_FieldIndexed))+Char:C90(9)+String:C10(Num:C11($_bo_FieldUnique))+Char:C90(9)+String:C10(Num:C11($_bo_FieldInvisible))
					$_t_FieldName:=Field name:C257($_l_TableIndex; $_l_FieldIndex)
					SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+$_t_FieldName+Char:C90(9)+$_t_String)
					
					If (Type:C295($_ptr_FieldPointer->)=Is subtable:K8:11)
						SEND PACKET:C103($_ti_DocumentRef; "•")
						
					End if 
					SEND PACKET:C103($_ti_DocumentRef; Char:C90(13))
				End if 
			End for 
		End if 
	End if 
End for 
CLOSE DOCUMENT:C267($_ti_DocumentRef)
ERR_MethodTrackerReturn("EXP_STRUCT"; $_t_oldMethodName)