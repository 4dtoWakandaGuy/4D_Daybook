//%attributes = {}
If (False:C215)
	//Project Method Name:      DEI_RecoverData
	//------------------ Method Notes ------------------
	//Recover Data method
	//$1 Pointer to string Array (31) with the table names to recover
	
	//------------------ Revision Control ----------------
	//Date Created: 13/04/2010 13:57
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_Documents; 0)
	C_BOOLEAN:C305($_bo_DocumentTableRecovered; $_bo_FieldIndexed; $_bo_FieldInvisible; $_bo_FieldUnique)
	C_LONGINT:C283($_l_DataPlusIndex; $_l_DocCount; $_l_FieldLength; $_l_FieldType; $_l_Index; $_l_RecordInSel; $_l_RecordNo; $_l_Table2Recover; $_l_TableNumber; $_l_Thermo; $_l_TotalDeleted)
	C_LONGINT:C283($0)
	C_POINTER:C301($_ptr_FieldPointer; $_ptr_RecoverDocs; $_ptr_RecoverTablesDisplay; $_ptr_Table; $1; $2)
	C_REAL:C285($_r_PercentageDone; $_r_RescueFolderSize)
	C_TEXT:C284($_t_DirectorySymbol; $_t_FreeSpaceVolume; $_t_MoveRescueDocument; $_t_oldMethodName; $_t_OldRecoveredPath; $_t_RescueDocument; $_t_RescueFolder; $_t_StructurePath; $_t_StructureVolume; $_t_tableName; $_t_ValidDocumentName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DEI_RecoverData")


If ((Not:C34(Is nil pointer:C315($1))) & (Count parameters:C259>0))
	
	$_t_StructurePath:=DB_StructureFolder
	$_t_RescueFolder:=$_t_StructurePath+"Rescue"
	
	ARRAY TEXT:C222($_at_Documents; 0)
	DOCUMENT LIST:C474($_t_RescueFolder; $_at_Documents)
	For ($_l_Index; 1; Size of array:C274($_at_Documents))
		$_r_RescueFolderSize:=$_r_RescueFolderSize+Get document size:C479($_t_RescueFolder+Folder separator:K24:12+$_at_Documents{$_l_Index})
	End for 
	
	$_t_FreeSpaceVolume:=DB_FindVolumeForSpace($_r_RescueFolderSize)
	$_t_StructureVolume:=DB_GetVolumeFromPath
	
	If ($_t_StructureVolume=$_t_FreeSpaceVolume)
		
		$_ptr_RecoverDocs:=$1
		
		If (Count parameters:C259>1)
			$_ptr_RecoverTablesDisplay:=$2
		End if 
		
		
		$_l_Table2Recover:=Size of array:C274($_ptr_RecoverDocs->)
		
		If ($_l_Table2Recover>0)
			
			CONFIRM:C162("Recover data from : "+String:C10($_l_Table2Recover)+" table(s)? WARNING - ALL RECORDS WILL BE DELETED! PROCEED?")
			
			If (OK=1)
				//recover data
				
				If (Test path name:C476($_t_RescueFolder)=Is a folder:K24:2)
					
					
					DB_SetAlltriggers(-1)
					For ($_l_DocCount; 1; $_l_Table2Recover)
						
						$_t_tableName:=$_ptr_RecoverDocs->{$_l_DocCount}
						$_l_TableNumber:=DEI_TableNum($_t_tableName)
						
						If ($_l_TableNumber>0)
							
							$_t_ValidDocumentName:="TBL"+String:C10($_l_TableNumber; "000")
							$_t_RescueDocument:=$_t_RescueFolder+Folder separator:K24:12+$_t_ValidDocumentName+".txt"
							
							If (Test path name:C476($_t_RescueDocument)=Is a document:K24:1)
								
								$_ptr_Table:=Table:C252($_l_TableNumber)
								
								If (Not:C34($_bo_DocumentTableRecovered))
									$_bo_DocumentTableRecovered:=$_t_tableName="FILES"
									If (Not:C34($_bo_DocumentTableRecovered))
										$_bo_DocumentTableRecovered:=Records in table:C83([IDENTIFIERS:16])>0
									End if 
								End if 
								
								If (Not:C34(Is nil pointer:C315($_ptr_Table)))
									$_l_Thermo:=OPEN_THERMOMETER("...recovering tables")
									If (Records in table:C83($_ptr_Table->)>0)
										$_l_Thermo:=OPEN_THERMOMETER("...deleting records from "+$_t_tableName)
										READ WRITE:C146($_ptr_Table->)
										ALL RECORDS:C47($_ptr_Table->)
										While (Records in selection:C76($_ptr_Table->)>0)
											REDUCE SELECTION:C351($_ptr_Table->; 250)
											DELETE SELECTION:C66($_ptr_Table->)
											FLUSH CACHE:C297
											DelayTicks(2)
											ALL RECORDS:C47($_ptr_Table->)
											$_l_TotalDeleted:=$_l_TotalDeleted+250
											$_r_PercentageDone:=($_l_TotalDeleted/Records in table:C83($_ptr_Table->))*100
											SET_THERMOMETER("...deleting records from "+$_t_tableName; $_r_PercentageDone)
										End while 
									End if 
									
									
									SET CHANNEL:C77(11)
									SET CHANNEL:C77(10; $_t_RescueDocument)
									
									RECEIVE VARIABLE:C81($_l_RecordInSel)
									If (OK=1)
										OK:=1
										$_l_RecordNo:=0
										If ($_l_RecordInSel=0)
											$_ptr_RecoverTablesDisplay->{$_l_DocCount}:=$_t_tableName+" (0)"
										End if 
										
										$_ptr_FieldPointer:=QV_GetIdField($_l_TableNumber)
										$_bo_FieldUnique:=False:C215
										If (Not:C34(Is nil pointer:C315($_ptr_FieldPointer)))
											
											GET FIELD PROPERTIES:C258($_ptr_FieldPointer; $_l_FieldType; $_l_FieldLength; $_bo_FieldIndexed; $_bo_FieldUnique; $_bo_FieldInvisible)
											
										End if 
										
										While (OK=1)
											RECEIVE RECORD:C79($_ptr_Table->)
											
											If (OK=1)
												//bsw 23/12/03 check if field is unique and values is not unique get new ids
												If (Not:C34(Is nil pointer:C315($_ptr_FieldPointer)) & ($_bo_DocumentTableRecovered))
													
													Case of 
														: ($_l_FieldType=Is longint:K8:6) | ($_l_FieldType=Is integer:K8:5)
															
															If ($_ptr_FieldPointer->=0)
																$_ptr_FieldPointer->:=AA_GetNextID($_ptr_FieldPointer)
															End if 
															
														: ($_l_FieldType=Is alpha field:K8:1)
															
															If ($_ptr_FieldPointer->="")
																$_ptr_FieldPointer->:=String:C10(AA_GetNextID($_ptr_FieldPointer))
															End if 
															
													End case 
												End if 
												//End bsw 23/12/03 check if field is unique and values is not u
												AA_CheckUUID(Table:C252($_ptr_Table))
												
												SAVE RECORD:C53($_ptr_Table->)
												$_l_RecordNo:=$_l_RecordNo+1
												$_r_PercentageDone:=($_l_RecordNo/$_l_RecordInSel)*100
												SET_THERMOMETER("...recovered "+String:C10(Records in table:C83($_ptr_Table->))+" from "+$_t_tableName+".txt"; $_r_PercentageDone)
												$_ptr_RecoverTablesDisplay->{$_l_DocCount}:=$_t_tableName+" ("+String:C10(Records in table:C83($_ptr_Table->))+")"
											End if 
										End while 
									End if 
									
									SET CHANNEL:C77(11)
									FLUSH CACHE:C297
									REDRAW WINDOW:C456
									
									$_t_MoveRescueDocument:=$_t_StructurePath+"Recovered"
									
									If (Test path name:C476($_t_MoveRescueDocument)#Is a folder:K24:2)
										CREATE FOLDER:C475($_t_MoveRescueDocument)
									End if 
									
									$_t_MoveRescueDocument:=$_t_MoveRescueDocument+Folder separator:K24:12+$_t_ValidDocumentName+".txt"
									
									If (Test path name:C476($_t_MoveRescueDocument)=Is a document:K24:1)
										$_t_OldRecoveredPath:=$_t_StructurePath+"Recovered_"+String:C10(Tickcount:C458)
										If (Test path name:C476($_t_OldRecoveredPath)#Is a folder:K24:2)
											CREATE FOLDER:C475($_t_OldRecoveredPath)
										End if 
										MOVE DOCUMENT:C540($_t_MoveRescueDocument; $_t_OldRecoveredPath+Folder separator:K24:12+$_t_ValidDocumentName+".txt")
									End if 
									
									MOVE DOCUMENT:C540($_t_RescueDocument; $_t_MoveRescueDocument)
								End if 
								
							End if 
						End if 
					End for 
					
				End if 
				CLOSE_THERMOMETER
				
				VER_SetDataFileVersion
				$0:=0
				
			Else 
				ALERT:C41("Recover failed, User cancelled the operation!")
				$0:=-1
				
			End if 
			
		Else 
			ALERT:C41("Recover failed, No table selected to rescue!")
			$0:=-2
			
		End if 
	Else 
		$_l_DataPlusIndex:=($_r_RescueFolderSize*2)
		ALERT:C41("A volume with at least "+String:C10($_l_DataPlusIndex)+" of free space is required for this operation!"+Char:C90(13)+"Try Volume: "+$_t_FreeSpaceVolume)
		$0:=-4
	End if 
Else 
	ALERT:C41("Recover failed, unexpected syntax error occurred!")
	$0:=-3
	
End if 
ERR_MethodTrackerReturn("DEI_RecoverData"; $_t_oldMethodName)