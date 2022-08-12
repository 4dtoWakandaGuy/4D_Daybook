//%attributes = {}
If (False:C215)
	//Project Method Name:      SSI_LoadRelationships
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 11:59
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SSI_AL_ManyField;0;0)
	//ARRAY LONGINT(SSI_al_ManyTable;0)
	//ARRAY LONGINT(SSI_al_OneField;0;0)
	//ARRAY LONGINT(SSI_al_Onetable;0;0)
	//ARRAY LONGINT(SSI_al_RelationType;0;0)
	//ARRAY TEXT(SSI_at_SubFieldNames;0)
	C_BOOLEAN:C305($_bo_Mandatory; $_bo_NonEnterable; $_bo_NonModifiable; SSI_Bo_AutoMany; SSI_bo_AutoOne; SSI_bo_FieldIndexed; SSI_bo_FieldInvisible; SSI_bo_FieldUnique)
	C_LONGINT:C283($_l_ArraySize; $_l_FieldsIndex; $_l_ManyTableRow; $_l_TableIndex; SSI_l_FieldLength; SSI_l_FieldType; SSI_l_OneField; SSI_l_oneTable)
	C_POINTER:C301($_Ptr_FieldPointer)
	C_TEXT:C284($_t_CompliantName; $_t_FieldName; $_t_ListName; $_t_oldMethodName; $_t_TableName)
	C_TIME:C306($_ti_DocumentRef)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SSI_LoadRelationships")
//This method will load the relationships available in the database
//note that this AUTO builds and then stores the relationships.
//When creating an OUTPUT or INPUT. the RELATED FIELD can then be selected and the primary relationships will be used to create a new path
ARRAY LONGINT:C221(SSI_al_ManyTable; 0)
ARRAY LONGINT:C221(SSI_AL_ManyField; 0; 0)
ARRAY LONGINT:C221(SSI_al_Onetable; 0; 0)
ARRAY LONGINT:C221(SSI_al_OneField; 0; 0)
ARRAY LONGINT:C221(SSI_al_RelationType; 0; 0)

$_ti_DocumentRef:=DB_CreateDocument(""; "TEXT")
For ($_l_TableIndex; 1; Get last table number:C254)
	If (Is table number valid:C999($_l_TableIndex))
		For ($_l_FieldsIndex; 1; Get last field number:C255($_l_TableIndex))
			If (Is field number valid:C1000($_l_TableIndex; $_l_FieldsIndex))
				$_t_FieldName:=Field name:C257($_l_TableIndex; $_l_FieldsIndex)
				$_t_TableName:=Table name:C256($_l_TableIndex)
				$_t_CompliantName:=Replace string:C233($_t_TableName+"_"+$_t_FieldName; " "; "")
				
				$_Ptr_FieldPointer:=Field:C253($_l_TableIndex; $_l_FieldsIndex)
				GET FIELD PROPERTIES:C258($_Ptr_FieldPointer; SSI_l_FieldType; SSI_l_FieldLength; SSI_bo_FieldIndexed; SSI_bo_FieldUnique; SSI_bo_FieldInvisible)
				GET FIELD ENTRY PROPERTIES:C685($_Ptr_FieldPointer; $_t_ListName; $_bo_Mandatory; $_bo_NonEnterable; $_bo_NonModifiable)
				
				
				
				If ($_bo_Mandatory=False:C215)
					SEND PACKET:C103($_ti_DocumentRef; $_t_TableName+Char:C90(9)+$_t_FieldName+Char:C90(9)+$_t_CompliantName+Char:C90(13))
				Else 
					SEND PACKET:C103($_ti_DocumentRef; $_t_TableName+Char:C90(9)+$_t_FieldName+Char:C90(9)+$_t_CompliantName+Char:C90(9)+"*"+Char:C90(13))
				End if 
				
				GET RELATION PROPERTIES:C686($_Ptr_FieldPointer; SSI_l_oneTable; SSI_l_OneField; SSI_bo_AutoOne; SSI_Bo_AutoMany)
				If (SSI_l_oneTable>0)
					$_l_ManyTableRow:=Find in array:C230(SSI_al_ManyTable; $_l_TableIndex)
					If ($_l_ManyTableRow<0)
						$_l_ArraySize:=Size of array:C274(SSI_al_ManyTable)+1
						INSERT IN ARRAY:C227(SSI_al_ManyTable; Size of array:C274(SSI_al_ManyTable)+1; 1)
						INSERT IN ARRAY:C227(SSI_AL_ManyField; $_l_ArraySize; 1)
						INSERT IN ARRAY:C227(SSI_al_Onetable; $_l_ArraySize; 1)
						INSERT IN ARRAY:C227(SSI_al_OneField; $_l_ArraySize; 1)
						INSERT IN ARRAY:C227(SSI_al_RelationType; $_l_ArraySize; 1)
						$_l_ManyTableRow:=$_l_ArraySize
					End if 
					SSI_al_ManyTable{$_l_ManyTableRow}:=$_l_TableIndex
					$_l_ArraySize:=Size of array:C274(SSI_AL_ManyField{$_l_ManyTableRow})+1
					INSERT IN ARRAY:C227(SSI_AL_ManyField{$_l_ManyTableRow}; $_l_ArraySize; 1)
					INSERT IN ARRAY:C227(SSI_al_Onetable{$_l_ManyTableRow}; $_l_ArraySize; 1)
					INSERT IN ARRAY:C227(SSI_al_OneField{$_l_ManyTableRow}; $_l_ArraySize; 1)
					INSERT IN ARRAY:C227(SSI_al_RelationType{$_l_ManyTableRow}; $_l_ArraySize; 1)
					SSI_AL_ManyField{$_l_ManyTableRow}{$_l_ArraySize}:=$_l_FieldsIndex
					SSI_al_Onetable{$_l_ManyTableRow}{$_l_ArraySize}:=SSI_l_oneTable
					SSI_al_OneField{$_l_ManyTableRow}{$_l_ArraySize}:=SSI_l_OneField
				End if 
				
			End if 
			
		End for 
	End if 
End for 
CLOSE DOCUMENT:C267($_ti_DocumentRef)
ERR_MethodTrackerReturn("SSI_LoadRelationships"; $_t_oldMethodName)