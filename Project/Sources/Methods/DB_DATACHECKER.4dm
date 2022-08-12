//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_DATACHECKER
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 2/6/10 2:03 PM
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(DB_aI_ActiveTables;0)
	ARRAY POINTER:C280($_aptr_FieldsArray; 0)
	C_BOOLEAN:C305(<>DB_bo_ReloadPrefs; <>HoldServiceProcess; <>SYS_bo_QuitCalled; <>TransactionDisableValidation; $_bo_Exit; $_bo_FieldIndexed; $_bo_FieldUnique; $_bo_PsuedoUnique)
	C_DATE:C307($_d_CurrentDate)
	C_LONGINT:C283(<>DB_l_DATACHECKER; $_l_FieldIndex; $_l_FieldLength; $_l_FieldNumber; $_l_FieldType; $_l_Index3; $_l_LastFIeldNumber; $_l_RecordNumber; $_l_TableNumber; DB_l_cbdatacheckActive; DB_cb_IndexerActive)
	C_LONGINT:C283(DB_l_CurrentField; DB_l_CurrentTable)
	C_POINTER:C301($_ptr_Field; $_ptr_FieldPointer; $_ptr_TablePointer)
	C_TEXT:C284($_t_FieldName; $_t_FieldValueSTR; $_t_IndexName; $_t_oldMethodName; $_t_TableName)
	C_TIME:C306(DB_ti_cTImeEnd; DB_ti_cTimeStart)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_DATACHECKER")
<>HoldServiceProcess:=False:C215  // this does not need to be a semaphore
//its only to reduce loading
<>DB_l_DATACHECKER:=Current process:C322
$_d_CurrentDate:=Current date:C33
$_bo_Exit:=False:C215
Repeat 
	DB_LoadDatacheckPrefs
	If (DB_l_cbdatacheckActive=1) | (DB_cb_IndexerActive=1)
		Repeat 
			While (Test semaphore:C652("NoINDEXING"))
				DelayTicks(60*5)
			End while 
			
			If (Current time:C178<DB_ti_cTimeStart)
				If (<>DB_bo_ReloadPrefs)
					DB_LoadDatacheckPrefs
				End if 
				
				DelayTicks(6*60)
			End if 
			
			
		Until ((Current time:C178>DB_ti_cTimeStart) | (<>SYS_bo_QuitCalled))
		If (Not:C34(<>SYS_bo_QuitCalled))
			If (<>DB_bo_ReloadPrefs)
				DB_LoadDatacheckPrefs
			End if 
			If (DB_ti_cTImeEnd<DB_ti_cTimeStart)
				$_d_CurrentDate:=Current date:C33
			Else 
				$_d_CurrentDate:=Current date:C33-1
			End if 
			If (DB_l_CurrentTable=0)
				DB_l_CurrentTable:=1
			Else 
				If (DB_l_CurrentTable>Get last table number:C254)
					DB_l_CurrentTable:=1
				End if 
				
			End if 
			If (DB_l_CurrentField=0)
				DB_l_CurrentField:=1
			Else 
				If (DB_l_CurrentField>Get last field number:C255(DB_l_CurrentTable))
					DB_l_CurrentField:=1
				End if 
				
			End if 
			//First we rebuild the indexes on the table
			
			If (DB_cb_IndexerActive=1)
				//NG MARCH 2004
				If (DB_l_CurrentTable>Size of array:C274(DB_aI_ActiveTables))
					DB_l_CurrentTable:=1
				End if 
				If (Is table number valid:C999(DB_l_CurrentTable))
					If (DB_aI_ActiveTables{DB_l_CurrentTable}=1)
						$_l_LastFIeldNumber:=Get last field number:C255(DB_l_CurrentTable)
						For ($_l_FieldIndex; DB_l_CurrentField; $_l_LastFIeldNumber)
							If (<>DB_bo_ReloadPrefs)
								DB_LoadDatacheckPrefs
							End if 
							GET FIELD PROPERTIES:C258(DB_l_CurrentTable; $_l_FieldIndex; $_l_FieldType; $_l_FieldLength; $_bo_FieldIndexed)
							If ($_bo_FieldIndexed)
								<>HoldServiceProcess:=True:C214
								$_ptr_FieldPointer:=Field:C253(DB_l_CurrentTable; $_l_FieldIndex)
								While (Test semaphore:C652("NoINDEXING"))
									DelayTicks(60*5)
								End while 
								
								SET INDEX:C344($_ptr_FieldPointer->; False:C215)
								FLUSH CACHE:C297
								While (Test semaphore:C652("NoINDEXING"))
									DelayTicks(60*5)
								End while 
								$_l_TableNumber:=DB_l_CurrentTable
								$_l_FieldNumber:=$_l_FieldIndex
								$_ptr_TablePointer:=Table:C252($_l_TableNumber)
								$_t_TableName:=Table name:C256($_ptr_TablePointer)
								$_ptr_FieldPointer:=Field:C253($_l_TableNumber; $_l_FieldNumber)
								$_t_FieldName:=Field name:C257($_ptr_FieldPointer)
								$_t_TableName:=Substring:C12($_t_TableName; 1; 3)
								ARRAY POINTER:C280($_aptr_FieldsArray; 1)
								$_aptr_FieldsArray{1}:=Field:C253($_l_TableNumber; $_l_FieldNumber)
								$_t_IndexName:=$_t_TableName+$_t_FieldName+"indx"
								$_t_IndexName:=Replace string:C233($_t_IndexName; " "; "")
								CREATE INDEX:C966($_ptr_TablePointer->; $_aptr_FieldsArray; Default index type:K58:2; $_t_IndexName)
								//SET INDEX($_ptr_FieldPointer->;True;100)
								<>HoldServiceProcess:=False:C215
								DB_l_CurrentField:=DB_l_CurrentField+1
							Else 
								If ($_l_FieldType=Is subtable:K8:11)
									<>HoldServiceProcess:=True:C214
									While (Test semaphore:C652("NoINDEXING"))
										DelayTicks(60*5)
									End while 
									DB_ReIndexSubtable(DB_l_CurrentTable; $_l_FieldIndex)
									<>HoldServiceProcess:=False:C215
								End if 
							End if 
							//if quitting exit here
							If (<>SYS_bo_QuitCalled) | (DB_cb_IndexerActive=0)
								$_l_FieldIndex:=$_l_LastFIeldNumber+1
								<>HoldServiceProcess:=False:C215
							End if 
							If (Not:C34(<>SYS_bo_QuitCalled))
								If (Current time:C178>=DB_ti_cTImeEnd) & (Current date:C33>$_d_CurrentDate)
									//time to stop
									<>HoldServiceProcess:=False:C215
									If (DB_ti_cTImeEnd<DB_ti_cTimeStart)
										$_d_CurrentDate:=Current date:C33
									Else 
										$_d_CurrentDate:=$_d_CurrentDate+1
									End if 
									Repeat 
										If (<>DB_bo_ReloadPrefs)
											DB_LoadDatacheckPrefs
										End if 
										If (Current time:C178<DB_ti_cTimeStart) & (Current date:C33>=$_d_CurrentDate)
											DelayTicks(60*60)
										End if 
									Until (Current time:C178>=DB_ti_cTimeStart) | (<>SYS_bo_QuitCalled) | (DB_cb_IndexerActive=0)
									
								End if 
							End if 
							
						End for 
						DB_l_CurrentField:=Get last field number:C255(DB_l_CurrentTable)
						DB_SaveDataCheckPrefs
					End if 
				End if 
			End if 
			If (Is table number valid:C999(DB_l_CurrentTable))
				If (DB_l_cbdatacheckActive=1) & (Not:C34(<>SYS_bo_QuitCalled))
					//next we can check for uniqueness
					If (<>DB_bo_ReloadPrefs)
						DB_LoadDatacheckPrefs
					End if 
					$_l_LastFIeldNumber:=Get last field number:C255(DB_l_CurrentTable)
					For ($_l_FieldIndex; 1; $_l_LastFIeldNumber)
						If (Is field number valid:C1000(DB_l_CurrentTable; $_l_FieldIndex))
							If (<>DB_bo_ReloadPrefs)
								DB_LoadDatacheckPrefs
							End if 
							
							GET FIELD PROPERTIES:C258(DB_l_CurrentTable; $_l_FieldIndex; $_l_FieldType; $_l_FieldLength; $_bo_FieldIndexed; $_bo_FieldUnique)
							$_bo_PsuedoUnique:=DB_PseudoUnique(DB_l_CurrentTable; $_l_FieldIndex)
							If ($_bo_FieldUnique) | ($_bo_PsuedoUnique)
								<>HoldServiceProcess:=True:C214
								
								ALL RECORDS:C47(Table:C252(DB_l_CurrentTable)->)
								FIRST RECORD:C50(Table:C252(DB_l_CurrentTable)->)
								$_l_RecordNumber:=Record number:C243(Table:C252(DB_l_CurrentTable)->)
								DB_Datacheckunique(DB_l_CurrentTable; $_l_FieldIndex; $_l_FieldType; $_l_FieldLength; $_bo_FieldIndexed; $_bo_FieldUnique)
								//if quitting exit here
								<>HoldServiceProcess:=False:C215
								If (<>SYS_bo_QuitCalled) | (DB_l_cbdatacheckActive=0)
									$_l_FieldIndex:=$_l_LastFIeldNumber+1
								End if 
							Else 
								If ($_l_FieldType=Is subtable:K8:11)
									//check subtables
									<>HoldServiceProcess:=True:C214
									DB_DataCheckSubtableUnique(DB_l_CurrentTable; $_l_FieldIndex)
									<>HoldServiceProcess:=False:C215
								End if 
								
							End if 
							If (<>SYS_bo_QuitCalled) | (DB_l_cbdatacheckActive=0)
								$_l_FieldIndex:=$_l_LastFIeldNumber+1
							End if 
							If (Not:C34(<>SYS_bo_QuitCalled))
								If (Current time:C178>=DB_ti_cTImeEnd) & (Current date:C33>$_d_CurrentDate)
									//time to stop
									<>HoldServiceProcess:=False:C215
									If (DB_ti_cTImeEnd<DB_ti_cTimeStart)
										$_d_CurrentDate:=Current date:C33
									Else 
										$_d_CurrentDate:=$_d_CurrentDate+1
									End if 
									Repeat 
										If (<>DB_bo_ReloadPrefs)
											DB_LoadDatacheckPrefs
										End if 
										If (Current time:C178<DB_ti_cTimeStart) & (Current date:C33>=$_d_CurrentDate)
											DelayTicks(60*60)
										End if 
									Until (Current time:C178>=DB_ti_cTimeStart) | (<>SYS_bo_QuitCalled) | (DB_l_cbdatacheckActive=0)
								End if 
							End if 
						End if 
					End for 
					
					//all fields in the table checked
					ALL RECORDS:C47(Table:C252(DB_l_CurrentTable)->)
					
					READ WRITE:C146(Table:C252(DB_l_CurrentTable)->)
					
					ALL RECORDS:C47(Table:C252(DB_l_CurrentTable)->)
					<>HoldServiceProcess:=True:C214
					For ($_l_Index3; 1; Records in selection:C76(Table:C252(DB_l_CurrentTable)->))
						<>HoldServiceProcess:=True:C214
						If (DB_l_CurrentTable=29)  //transactions
							While (Semaphore:C143("TRANSACTIONUPDATE"))
								UNLOAD RECORD:C212([TRANSACTIONS:29])
								DelayTicks(10)
							End while 
						End if 
						
						If (<>DB_bo_ReloadPrefs)
							DB_LoadDatacheckPrefs
						End if 
						For ($_l_FieldNumber; 1; Get last field number:C255(DB_l_CurrentTable))
							GET FIELD PROPERTIES:C258(DB_l_CurrentTable; $_l_FieldNumber; $_l_FieldType; $_l_FieldLength; $_bo_FieldIndexed; $_bo_FieldUnique)
							If ($_l_FieldType#Is subtable:K8:11)
								If (<>DB_bo_ReloadPrefs)
									DB_LoadDatacheckPrefs
								End if 
								$_ptr_Field:=Field:C253(DB_l_CurrentTable; $_l_FieldNumber)
								$_ptr_Field->:=$_ptr_Field->
							Else 
								DB_ResaveSubrecords(DB_l_CurrentTable; $_l_FieldNumber)
								If (<>SYS_bo_QuitCalled) | (DB_l_cbdatacheckActive=0)
									$_l_FieldNumber:=Get last field number:C255(DB_l_CurrentTable)+1
								End if 
							End if 
							
						End for 
						If (DB_l_CurrentTable=29)  //transactions
							<>TransactionDisableValidation:=True:C214
							SET PROCESS VARIABLE:C370(-1; <>TransactionDisableValidation; <>TransactionDisableValidation)
						End if 
						
						DB_SaveRecord(Table:C252(DB_l_CurrentTable))
						If (DB_l_CurrentTable=29)
							<>TransactionDisableValidation:=False:C215
							SET PROCESS VARIABLE:C370(-1; <>TransactionDisableValidation; <>TransactionDisableValidation)
							
						End if 
						CLEAR SEMAPHORE:C144("TRANSACTIONUPDATE")
						If (Not:C34(<>SYS_bo_QuitCalled))
							If (Current time:C178>=DB_ti_cTImeEnd) & (Current date:C33>$_d_CurrentDate)
								//time to stop
								<>HoldServiceProcess:=False:C215
								UNLOAD RECORD:C212(Table:C252(DB_l_CurrentTable)->)
								READ ONLY:C145(Table:C252(DB_l_CurrentTable)->)
								FLUSH CACHE:C297
								If (DB_ti_cTImeEnd<DB_ti_cTimeStart)
									$_d_CurrentDate:=Current date:C33
								Else 
									$_d_CurrentDate:=$_d_CurrentDate+1
								End if 
								Repeat 
									If (<>DB_bo_ReloadPrefs)
										DB_LoadDatacheckPrefs
									End if 
									If (Current time:C178<DB_ti_cTimeStart) & (Current date:C33>=$_d_CurrentDate)
										DelayTicks(60*60)
									End if 
								Until (Current time:C178>=DB_ti_cTimeStart) | (<>SYS_bo_QuitCalled) | (DB_l_cbdatacheckActive=0)
								READ WRITE:C146(Table:C252(DB_l_CurrentTable)->)
							End if 
						End if 
						
						NEXT RECORD:C51(Table:C252(DB_l_CurrentTable)->)
						//if quitting exit here
						If (<>SYS_bo_QuitCalled) | (DB_l_cbdatacheckActive=0)
							$_l_Index3:=Records in selection:C76(Table:C252(DB_l_CurrentTable)->)+1
						End if 
						
					End for 
					UNLOAD RECORD:C212(Table:C252(DB_l_CurrentTable)->)
					READ ONLY:C145(Table:C252(DB_l_CurrentTable)->)
					<>HoldServiceProcess:=False:C215
					FLUSH CACHE:C297
					
					
				End if 
			End if 
			DB_l_CurrentTable:=DB_l_CurrentTable+1
			DB_l_CurrentField:=1
			DB_SaveDataCheckPrefs
			
		End if 
	End if 
	
Until ((<>SYS_bo_QuitCalled) | ((DB_l_cbdatacheckActive=0) & (DB_cb_IndexerActive=0)))
<>HoldServiceProcess:=False:C215


<>DB_l_DATACHECKER:=0
ERR_MethodTrackerReturn("DB_DATACHECKER"; $_t_oldMethodName)