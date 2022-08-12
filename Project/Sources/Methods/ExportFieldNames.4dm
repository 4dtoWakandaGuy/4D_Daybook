//%attributes = {}
If (False:C215)
	//Project Method Name:      ExportFieldNames
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 11:58
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_FieldIndexed)
	C_LONGINT:C283($_l_FieldIndex; $_l_FieldLength; $_l_FieldType; $_l_TableIndex)
	C_TEXT:C284($_t_oldMethodName; $_t_TableName)
	C_TIME:C306($_ti_DocumentRef)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ExportFieldNames")
$_ti_DocumentRef:=DB_CreateDocument(""; "TEXT")

If ($_ti_DocumentRef#?00:00:00?)
	For ($_l_TableIndex; 1; Get last table number:C254)
		If (Is table number valid:C999($_l_TableIndex))
			$_t_TableName:=Table name:C256($_l_TableIndex)
			For ($_l_FieldIndex; 1; Get last field number:C255($_l_TableIndex))
				If (Is field number valid:C1000($_l_TableIndex; $_l_FieldIndex))
					GET FIELD PROPERTIES:C258($_l_TableIndex; $_l_FieldIndex; $_l_FieldType; $_l_FieldLength; $_bo_FieldIndexed)
					SEND PACKET:C103($_ti_DocumentRef; $_t_TableName+Char:C90(9)+Field name:C257($_l_TableIndex; $_l_FieldIndex)+Char:C90(9)+String:C10($_l_FieldType)+Char:C90(9)+String:C10($_l_FieldLength)+Char:C90(9)+String:C10(Num:C11($_bo_FieldIndexed))+Char:C90(13))
				End if 
			End for 
		End if 
	End for 
	CLOSE DOCUMENT:C267($_ti_DocumentRef)
	
	
	
	
	
End if 
ERR_MethodTrackerReturn("ExportFieldNames"; $_t_oldMethodName)