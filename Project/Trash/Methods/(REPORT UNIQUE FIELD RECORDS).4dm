//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      REPORT UNIQUE FIELD RECORDS
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
	ARRAY LONGINT:C221($_al_LongintFIeldValues; 0)
	ARRAY REAL:C219($_ar_RealFieldValues; 0)
	ARRAY TEXT:C222($_at_AlphaFieldValues; 0)
	C_BOOLEAN:C305($_bo_FieldIndexed; $_bo_FieldInvisible; $_bo_FieldUnique)
	C_LONGINT:C283($_l_FieldLength; $_l_FieldType)
	C_POINTER:C301($_ptr_FieldPointer; $_ptr_Table)
	C_REAL:C285($_l_FieldIndex; $_l_RecordsIndex; $_l_TableIndex; $_l_ValuesIndex)
	C_TEXT:C284($_t_oldMethodName)
	C_TIME:C306($_ti_ExportDocument)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("REPORT UNIQUE FIELD RECORDS")
$_ti_ExportDocument:=DB_CreateDocument("")

For ($_l_TableIndex; 1; Get last table number:C254)
	
	If (Is table number valid:C999($_l_TableIndex))
		$_ptr_Table:=Table:C252($_l_TableIndex)
		For ($_l_FieldIndex; 1; Get last field number:C255($_l_TableIndex))
			If (Is field number valid:C1000($_l_TableIndex; $_l_FieldIndex))
				GET FIELD PROPERTIES:C258($_l_TableIndex; $_l_FieldIndex; $_l_FieldType; $_l_FieldLength; $_bo_FieldIndexed; $_bo_FieldUnique; $_bo_FieldInvisible)
				If ($_bo_FieldUnique)
					$_ptr_FieldPointer:=Field:C253($_l_TableIndex; $_l_FieldIndex)
					ALL RECORDS:C47($_ptr_Table->)
					Case of 
						: ($_l_FieldType=0)
							ARRAY TEXT:C222($_at_AlphaFieldValues; 0)
							DISTINCT VALUES:C339($_ptr_FieldPointer->; $_at_AlphaFieldValues)
							If (Size of array:C274($_at_AlphaFieldValues)#Records in selection:C76($_ptr_Table->))
								For ($_l_ValuesIndex; 1; Size of array:C274($_at_AlphaFieldValues))
									QUERY:C277($_ptr_Table->; $_ptr_FieldPointer->=$_at_AlphaFieldValues{$_l_ValuesIndex})
									If (Records in selection:C76($_ptr_Table->)>1)
										For ($_l_RecordsIndex; 1; Records in selection:C76($_ptr_Table->))
											SEND PACKET:C103($_ti_ExportDocument; Table name:C256($_ptr_Table)+Char:C90(Tab:K15:37))
											SEND PACKET:C103($_ti_ExportDocument; Field name:C257($_ptr_FieldPointer)+Char:C90(Tab:K15:37))
											SEND PACKET:C103($_ti_ExportDocument; $_ptr_FieldPointer->+Char:C90(Carriage return:K15:38))
											NEXT RECORD:C51($_ptr_Table->)
										End for 
									End if 
								End for 
							End if 
						: ($_l_FieldType=1)
							ARRAY REAL:C219($_ar_RealFieldValues; 0)
							DISTINCT VALUES:C339($_ptr_FieldPointer->; $_ar_RealFieldValues)
							If (Size of array:C274($_ar_RealFieldValues)#Records in selection:C76($_ptr_Table->))
								For ($_l_ValuesIndex; 1; Size of array:C274($_ar_RealFieldValues))
									QUERY:C277($_ptr_Table->; $_ptr_FieldPointer->=$_ar_RealFieldValues{$_l_ValuesIndex})
									If (Records in selection:C76($_ptr_Table->)>1)
										For ($_l_RecordsIndex; 1; Records in selection:C76($_ptr_Table->))
											SEND PACKET:C103($_ti_ExportDocument; Table name:C256($_ptr_Table)+Char:C90(Tab:K15:37))
											SEND PACKET:C103($_ti_ExportDocument; Field name:C257($_ptr_FieldPointer)+Char:C90(Tab:K15:37))
											SEND PACKET:C103($_ti_ExportDocument; $_ptr_FieldPointer->+Char:C90(Carriage return:K15:38))
											NEXT RECORD:C51($_ptr_Table->)
										End for 
									End if 
								End for 
							End if 
						: (($_l_FieldType=0) | ($_l_FieldType=0))
							ARRAY LONGINT:C221($_al_LongintFIeldValues; 0)
							DISTINCT VALUES:C339($_ptr_FieldPointer->; $_al_LongintFIeldValues)
							If (Size of array:C274($_al_LongintFIeldValues)#Records in selection:C76($_ptr_Table->))
								For ($_l_ValuesIndex; 1; Size of array:C274($_al_LongintFIeldValues))
									QUERY:C277($_ptr_Table->; $_ptr_FieldPointer->=$_al_LongintFIeldValues{$_l_ValuesIndex})
									If (Records in selection:C76($_ptr_Table->)>1)
										For ($_l_RecordsIndex; 1; Records in selection:C76($_ptr_Table->))
											SEND PACKET:C103($_ti_ExportDocument; Table name:C256($_ptr_Table)+Char:C90(Tab:K15:37))
											SEND PACKET:C103($_ti_ExportDocument; Field name:C257($_ptr_FieldPointer)+Char:C90(Tab:K15:37))
											SEND PACKET:C103($_ti_ExportDocument; $_ptr_FieldPointer->+Char:C90(Carriage return:K15:38))
											NEXT RECORD:C51($_ptr_Table->)
										End for 
									End if 
								End for 
							End if 
					End case 
				End if 
			End if 
		End for 
	End if 
End for 

Close_DocUMENT($_ti_ExportDocument)

//ALERT("Done")
Gen_Alert("Done.")
ERR_MethodTrackerReturn("REPORT UNIQUE FIELD RECORDS"; $_t_oldMethodName)