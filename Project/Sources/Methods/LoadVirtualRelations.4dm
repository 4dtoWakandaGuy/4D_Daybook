//%attributes = {}
If (False:C215)
	//Project Method Name:      LoadVirtualRelations
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/09/2009 11:56
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Continue)
	C_LONGINT:C283($_l_CountRecords; $_l_DataType; $_l_ManyorOne; $_l_RecordsIndex; $_l_TableFieldNumber; $_l_TableNumber; $1; $3; $4)
	C_POINTER:C301($_ptr_Field; $_ptr_FieldNamesArray; $_ptr_relatedField; $_ptr_RelationIdent; $8)
	C_TEXT:C284($_t_FieldName; $_t_FieldName2; $_t_oldMethodName; $_t_RelationshipsArrayName; $_t_RelationshipsVArrayName; $_t_TableFieldName; $_t_TableName; $_t_TableName2; $2; $5; $6)
	C_TEXT:C284($7)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LoadVirtualRelations")
//This method will load into array the data for related table information
//this is for virtual relations which save adding additional fields onto tables to  make lots of relations to other bits of the system.

//note this method does not define or seek to define what relations are possible..that is on a per form and per licence basis
//NOTE THAT YOU CANNOT USE SUBTABLES WITH THIS!!!!!!!!
If (Count parameters:C259>=5)
	$_l_TableNumber:=$1
	$_t_TableName:=$2
	$_l_ManyorOne:=$3
	$_l_TableFieldNumber:=$4
	$_t_TableFieldName:=$5
	$_t_RelationshipsArrayName:=$6
	$_t_RelationshipsVArrayName:=$7
	$_bo_Continue:=False:C215
	If ($_l_TableNumber>0)
		$_bo_Continue:=True:C214
		
	Else 
		If ($_t_TableName#"")
			For ($_l_RecordsIndex; 1; Get last table number:C254)
				If (Is table number valid:C999($_l_RecordsIndex))
					$_t_TableName2:=Table name:C256(Table:C252($_l_RecordsIndex))
					If ($_t_TableName2=$_t_TableName)
						$_l_TableNumber:=$_l_RecordsIndex
						$_bo_Continue:=True:C214
						$_l_RecordsIndex:=Get last table number:C254
					End if 
				End if 
			End for 
			
		End if 
	End if 
	If ($_bo_Continue)
		If ($_l_TableFieldNumber>0)
			$_bo_Continue:=True:C214
			
		Else 
			$_bo_Continue:=False:C215
			If ($_t_TableFieldName#"")
				
				For ($_l_RecordsIndex; 1; Get last field number:C255($_l_TableNumber))
					If (Is field number valid:C1000($_l_TableNumber; $_l_RecordsIndex))
						$_t_FieldName2:=Field name:C257(Field:C253($_l_TableNumber; $_l_RecordsIndex))
						If ($_t_FieldName2=$_t_TableFieldName)
							$_l_TableFieldNumber:=$_l_RecordsIndex
							$_bo_Continue:=True:C214
							$_l_RecordsIndex:=Get last field number:C255($_l_TableNumber)
						End if 
					End if 
				End for 
				
			End if 
		End if 
		
	End if 
	If ($_bo_Continue)
		$_ptr_FieldNamesArray:=Get pointer:C304($_t_RelationshipsArrayName)
		$_ptr_RelationIdent:=Get pointer:C304($_t_RelationshipsVArrayName)
		If (Not:C34(Is nil pointer:C315($_ptr_FieldNamesArray)))
			If (Not:C34(Is nil pointer:C315($_ptr_RelationIdent)))
				If (Size of array:C274($_ptr_FieldNamesArray->)>0)
					DELETE FROM ARRAY:C228($_ptr_FieldNamesArray->; 1; Size of array:C274($_ptr_FieldNamesArray->))
				End if 
				If (Size of array:C274($_ptr_RelationIdent->)>0)
					DELETE FROM ARRAY:C228($_ptr_RelationIdent->; 1; Size of array:C274($_ptr_RelationIdent->))
				End if 
				Case of 
					: ($_l_ManyorOne=1)  //Manys(this is the 'one' table
						QUERY:C277([xOtherRelations:138]; [xOtherRelations:138]xOneTableNUm:1=$_l_TableNumber; *)
						QUERY:C277([xOtherRelations:138];  & ; [xOtherRelations:138]xOneTableFieldNum:2=$_l_TableFieldNumber; *)
						$_ptr_Field:=Field:C253($_l_TableNumber; $_l_TableFieldNumber)
						$_l_DataType:=Type:C295($_ptr_Field->)
						Case of 
							: ($_l_DataType=Is alpha field:K8:1) | ($_l_DataType=Is text:K8:3)
								If (Count parameters:C259>=9)
									QUERY:C277([xOtherRelations:138];  & ; [xOtherRelations:138]xOneTableSTRreference:6=$8->; *)
								Else 
									$_ptr_relatedField:=Field:C253($_l_TableNumber; $_l_TableFieldNumber)
									QUERY:C277([xOtherRelations:138];  & ; [xOtherRelations:138]xOneTableSTRreference:6=$_ptr_relatedField->; *)
								End if 
							Else 
								If (Count parameters:C259>=9)
									QUERY:C277([xOtherRelations:138];  & ; [xOtherRelations:138]xOneTableLONGref:5=$8->; *)
								Else 
									$_ptr_relatedField:=Field:C253($_l_TableNumber; $_l_TableFieldNumber)
									QUERY:C277([xOtherRelations:138];  & ; [xOtherRelations:138]xOneTableLONGref:5=$_ptr_relatedField->; *)
								End if 
								
						End case 
						QUERY:C277([xOtherRelations:138])
						//ok so now we have some records
						$_l_CountRecords:=Records in selection:C76([xOtherRelations:138])
						INSERT IN ARRAY:C227($_ptr_FieldNamesArray->; Size of array:C274($_ptr_FieldNamesArray->)+1; $_l_CountRecords)
						INSERT IN ARRAY:C227($_ptr_RelationIdent->; Size of array:C274($_ptr_RelationIdent->)+1; $_l_CountRecords)
						For ($_l_RecordsIndex; 1; $_l_CountRecords)
							$_ptr_Field:=Field:C253([xOtherRelations:138]xManyTableNum:3; [xOtherRelations:138]xManyTableFieldNum:4)
							$_t_FieldName:=Field name:C257($_ptr_Field->)
							$_ptr_FieldNamesArray->{$_l_RecordsIndex}:=$_t_FieldName
							$_l_DataType:=Type:C295($_ptr_Field->)
							Case of 
								: ($_l_DataType=Is alpha field:K8:1) | ($_l_DataType=Is text:K8:3)
									$_ptr_RelationIdent->{$_l_RecordsIndex}:=[xOtherRelations:138]xManyTableSTRRef:8
								Else 
									$_ptr_RelationIdent->{$_l_RecordsIndex}:=String:C10([xOtherRelations:138]xManyTableLONGref:7)
									
							End case 
							
						End for 
						
				End case 
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("LoadVirtualRelations"; $_t_oldMethodName)