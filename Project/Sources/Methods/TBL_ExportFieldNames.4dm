//%attributes = {}
If (False:C215)
	//Project Method Name:      TBL_ExportFieldNames
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/02/2010 09:47
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_FieldsIndex; $_l_LastFieldNumber; $_l_LastTableNumber; $_l_TableIndex)
	C_TEXT:C284($_t_FieldName; $_t_oldMethodName; $_t_TableName)
	C_TIME:C306($_ti_DocumentRef)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("TBL_ExportFieldNames")
$_l_LastTableNumber:=Get last table number:C254
$_ti_DocumentRef:=Create document:C266(""; "TEXT")
For ($_l_TableIndex; 1; $_l_LastTableNumber)
	If (Is table number valid:C999($_l_TableIndex))
		$_l_LastFieldNumber:=Get last field number:C255($_l_TableIndex)
		$_t_TableName:=Table name:C256($_l_TableIndex)
		For ($_l_FieldsIndex; 1; $_l_LastFieldNumber)
			If (Is field number valid:C1000($_l_TableIndex; $_l_FieldsIndex))
				$_t_FieldName:=Field name:C257($_l_TableIndex; $_l_FieldsIndex)
				SEND PACKET:C103($_ti_DocumentRef; "["+$_t_TableName+"]"+$_t_FieldName+Char:C90(13))
				
			End if 
		End for 
		
	End if 
End for 
CLOSE DOCUMENT:C267($_ti_DocumentRef)
ERR_MethodTrackerReturn("TBL_ExportFieldNames"; $_t_oldMethodName)
