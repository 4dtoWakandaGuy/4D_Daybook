//%attributes = {}
If (False:C215)
	//Project Method Name:      TBI_ImportFrom2004
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/11/2009 09:30`Method: TBI_ImportFrom2004
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_aBo_FieldBooleanData; 0)
	ARRAY BOOLEAN:C223($_aBo_FieldisKey; 0)
	//ARRAY BOOLEAN(DB_abo_TableSelector;0)
	ARRAY DATE:C224($_ad_FieldDData; 0)
	ARRAY INTEGER:C220($_ai_FieldiData; 0)
	//ARRAY LONGINT(<>DB_al_TriggerTable;0)
	ARRAY LONGINT:C221($_al_FieldBlobIndex; 0)
	ARRAY LONGINT:C221($_al_FieldlData; 0)
	ARRAY LONGINT:C221($_al_FieldNumbers; 0)
	ARRAY LONGINT:C221($_al_TablesIndexNew; 0)
	ARRAY LONGINT:C221($_al_TablesIndexOld; 0)
	ARRAY LONGINT:C221($_al_TablesToImport; 0)
	//ARRAY LONGINT(DB_al_TableNumbers;0)
	ARRAY PICTURE:C279($_apic_FieldPictureData; 0)
	ARRAY POINTER:C280($_apo_FieldPointers; 0)
	ARRAY REAL:C219($_ar_FieldrData; 0)
	ARRAY TEXT:C222($_at_DocinText; 0)
	ARRAY TEXT:C222($_at_DocumentInText; 0)
	ARRAY TEXT:C222($_at_DocumentPaths; 0)
	ARRAY TEXT:C222($_at_FieldData; 0)
	ARRAY TEXT:C222($_at_NewFieldNames; 0; 0)
	ARRAY TEXT:C222($_at_NewtableName; 0)
	ARRAY TEXT:C222($_at_OldFIeldNames; 0; 0)
	ARRAY TEXT:C222($_at_OldTableImportType; 0)
	ARRAY TEXT:C222($_at_OldTableNames; 0)
	ARRAY TIME:C1223($_ati_FieldtimeData; 0)
	C_BLOB:C604($_blb_BlobData1; $_blb_BlobData2; $_blb_BlobData3; $_blb_Export; $_blb_Field; $_blb_Records)
	C_BOOLEAN:C305(<>SYS_bo_DuringInit; $_bo_Continue; $_bo_Delete; $_bo_ExportBoolean; $_bo_Ignore; $_bo_OK; $_bo_SaveRecord; $_bo_Update; $_bo_useNewStyle; $_bo_UseTab)
	C_DATE:C307($_d_ExportDate)
	C_LONGINT:C283($_l_AveragePerRecord; $_l_AverageSeconds; $_l_BlobSize2; $_l_CurrentWinRefOLD; $_l_ExportLongint; $_l_FieldCount; $_l_FIeldCounter; $_l_FieldRef; $_l_FieldType; $_l_FillFields; $_l_Index)
	C_LONGINT:C283($_l_LastFieldNumber; $_l_MessageCounter; $_l_NewTableRowRef; $_l_NextSequenceNum; $_l_OldIndex; $_l_Pos; $_l_PositionBreak; $_l_positionType; $_l_RecordCount; $_l_RecordNumber; $_l_RecordsInSelection)
	C_LONGINT:C283($_l_RecordstoGo; $_l_RowRef; $_l_ScreenCentre; $_l_SecondsToGo; $_l_SetupTables; $_l_TableCount; $_l_TableNumber; $_l_TableNumberPosition; $_l_TickCount; $_l_TIcksElapsed; $_l_TicksToGo)
	C_LONGINT:C283($_l_TotalFields; $_l_WIndowBottom; $_l_WIndowReference; $_l_WIndowRIght; $_l_WIndowTop; DB_l_Integrate; IMP_l_myFIeldNum; WIN_l_CurrentWinRef; xCancel; XNext; xOK)
	C_PICTURE:C286($_Pic_FieldPicture)
	C_POINTER:C301($_ptr_Field; $_ptr_Table; $_Ptr_TablePointer)
	C_REAL:C285($_r_DocumentSize; $_r_ExportReal)
	C_TEXT:C284($_t_CarriageReturn; $_t_COlumn1; $_t_COlumn2; $_t_COlumn3; $_t_COlumn4; $_t_CurrentNewTableName; $_t_CurrentOldTableName; $_t_DocinText; $_t_DocName; $_t_DocumentPath; $_t_ExportText)
	C_TEXT:C284($_t_FieldName; $_t_NewTableName; $_t_OldFIeldName; $_t_oldMethodName; $_t_Residualtext; $_t_Row; $_t_SUbrecordData; $_t_TableName)
	C_TIME:C306($_ti_Doc; $_ti_Document; $_ti_ExportTime)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("TBI_ImportFrom2004")
<>SYS_bo_DuringInit:=True:C214
//This method will import data from Daybook 2004.
$_l_Index:=1
ARRAY LONGINT:C221($_al_TablesIndexOld; 0)
ARRAY TEXT:C222($_at_OldTableNames; 0)
ARRAY TEXT:C222($_at_OldFIeldNames; 0; 0)
ARRAY TEXT:C222($_at_OldTableImportType; 0)
ARRAY LONGINT:C221($_al_TablesIndexNew; 0)
ARRAY TEXT:C222($_at_NewtableName; 0)
ARRAY TEXT:C222($_at_NewFieldNames; 0; 0)
Gen_Alert("Open the structure map document")

$_ti_Doc:=Open document:C264(""; "TEXT")
ARRAY TEXT:C222($_at_DocinText; 0)
Repeat 
	RECEIVE PACKET:C104($_ti_Doc; $_t_DocinText; 32000)
	If ($_t_DocinText#"")
		APPEND TO ARRAY:C911($_at_DocinText; $_t_DocinText)
		
	End if 
Until ($_t_DocinText="")
CLOSE DOCUMENT:C267($_ti_Doc)

$_t_Row:=""
$_t_CurrentOldTableName:=""
$_t_CurrentNewTableName:=""
For ($_l_SetupTables; 1; Size of array:C274($_at_DocinText))
	Repeat 
		$_l_Pos:=Position:C15(Char:C90(13); $_at_DocinText{$_l_SetupTables})
		If ($_l_Pos=0)
			$_l_Pos:=Position:C15(Char:C90(10); $_at_DocinText{$_l_SetupTables})
		End if 
		If ($_l_Pos>0)
			$_t_Row:=Substring:C12($_at_DocinText{$_l_SetupTables}; 1; $_l_Pos-1)
			$_at_DocinText{$_l_SetupTables}:=Substring:C12($_at_DocinText{$_l_SetupTables}; $_l_Pos+1)
			
		Else 
			If ($_l_SetupTables<Size of array:C274($_at_DocinText))
				$_at_DocinText{$_l_SetupTables+1}:=$_at_DocinText{$_l_SetupTables}+$_at_DocinText{$_l_SetupTables+1}
				$_at_DocinText{$_l_SetupTables}:=""
				$_t_Row:=""
			Else 
				//last entry
				$_t_Row:=$_at_DocinText{$_l_SetupTables}
				$_at_DocinText{$_l_SetupTables}:=""
			End if 
		End if 
		If ($_t_Row#"")
			//column 1 table name(old table)
			//columns 2 blank or type if table name filled else field name
			//column 3 table name new table
			//column 4 field name new field name
			//remember a field name or anything could be blank
			$_l_Pos:=Position:C15(Char:C90(9); $_t_Row)
			$_t_COlumn1:=Substring:C12($_t_Row; 1; $_l_Pos-1)
			$_t_Row:=Substring:C12($_t_Row; $_l_Pos+1)
			$_l_Pos:=Position:C15(Char:C90(9); $_t_Row)
			$_t_COlumn2:=Substring:C12($_t_Row; 1; $_l_Pos-1)
			$_t_Row:=Substring:C12($_t_Row; $_l_Pos+1)
			$_l_Pos:=Position:C15(Char:C90(9); $_t_Row)
			$_t_COlumn3:=Substring:C12($_t_Row; 1; $_l_Pos-1)
			$_t_COlumn4:=Substring:C12($_t_Row; $_l_Pos+1)
			If ($_t_COlumn1="ACCOUNTS")
				//TRACE
			End if 
			Case of 
				: ($_t_COlumn1#"")
					$_t_CurrentOldTableName:=$_t_COlumn1
					APPEND TO ARRAY:C911($_al_TablesIndexOld; $_l_Index)
					APPEND TO ARRAY:C911($_at_OldTableNames; $_t_COlumn1)
					INSERT IN ARRAY:C227($_at_OldFIeldNames; Size of array:C274($_at_OldFIeldNames)+1; 1)
					
					If ($_t_COlumn3#"")
						APPEND TO ARRAY:C911($_al_TablesIndexNew; $_l_Index)
						APPEND TO ARRAY:C911($_at_NewtableName; $_t_COlumn3)
						INSERT IN ARRAY:C227($_at_NewFIeldNames; Size of array:C274($_at_NewFIeldNames)+1; 1)
					Else 
						APPEND TO ARRAY:C911($_al_TablesIndexNew; $_l_Index)
						APPEND TO ARRAY:C911($_at_NewtableName; "")
						INSERT IN ARRAY:C227($_at_NewFIeldNames; Size of array:C274($_at_NewFIeldNames)+1; 1)
						
					End if 
					If ($_t_COlumn2="TAB")
						APPEND TO ARRAY:C911($_at_OldTableImportType; "TAB")
					Else 
						APPEND TO ARRAY:C911($_at_OldTableImportType; "")
						
					End if 
					$_l_Index:=$_l_Index+1
				: ($_t_COlumn3#"")
					If ($_t_COlumn3="SF_COMMS")
						//TRACE
					End if 
					APPEND TO ARRAY:C911($_al_TablesIndexNew; $_l_Index)
					APPEND TO ARRAY:C911($_at_NewtableName; $_t_COlumn3)
					INSERT IN ARRAY:C227($_at_NewFIeldNames; Size of array:C274($_at_NewFIeldNames)+1; 1)
					APPEND TO ARRAY:C911($_al_TablesIndexOld; $_l_Index)
					APPEND TO ARRAY:C911($_at_OldTableNames; "")
					INSERT IN ARRAY:C227($_at_OldFIeldNames; Size of array:C274($_at_OldFIeldNames)+1; 1)
					APPEND TO ARRAY:C911($_at_OldTableImportType; "")
					$_l_Index:=$_l_Index+1
					//$_l_Index
				: ($_t_COlumn2#"")
					APPEND TO ARRAY:C911($_at_OldFIeldNames{Size of array:C274($_at_OldFIeldNames)}; $_t_COlumn2)
					If ($_t_COlumn4#"")
						APPEND TO ARRAY:C911($_at_NewFIeldNames{Size of array:C274($_at_NewFIeldNames)}; $_t_COlumn4)
					Else 
						APPEND TO ARRAY:C911($_at_NewFIeldNames{Size of array:C274($_at_NewFIeldNames)}; "")
						
					End if 
				: ($_t_COlumn4#"")
					APPEND TO ARRAY:C911($_at_NewFIeldNames{Size of array:C274($_at_NewFIeldNames)}; $_t_COlumn4)
					APPEND TO ARRAY:C911($_at_OldFIeldNames{Size of array:C274($_at_OldFIeldNames)}; "")
					
			End case 
		End if 
		
		
	Until ($_at_DocinText{$_l_SetupTables}="")
	
End for 

//TRACE

//UNICODE TEST
$_t_CarriageReturn:=Char:C90(13)
$_bo_Delete:=False:C215
$_l_TableCount:=Get last table number:C254
$_l_RecordCount:=0
For ($_l_TableNumber; 1; $_l_TableCount)
	If (Is table number valid:C999($_l_TableNumber))
		$_ptr_Table:=Table:C252($_l_TableNumber)
		
		$_l_RecordCount:=$_l_RecordCount+Records in table:C83($_ptr_Table->)
		If ($_l_RecordCount>0)
			$_l_TableNumber:=$_l_TableCount
			
		End if 
	End if 
End for 
If ($_l_RecordCount>0)
	$_bo_Continue:=False:C215
	Gen_Confirm3("OK to import and replace records in ALL tables?"; "Yes"; "No"; "Select")
	Case of 
		: (xOK=1)
			$_bo_Continue:=True:C214
			ARRAY LONGINT:C221($_al_TablesToImport; $_l_TableCount)
			For ($_l_Index; 1; $_l_TableCount)
				$_al_TablesToImport{$_l_Index}:=1
			End for 
			$_bo_Delete:=True:C214
		: (xCancel=1)
		: (XNext=1)
			DB_l_Integrate:=0
			Open window:C153(400; 60; 260+400; Screen height:C188-20; 1)
			DIALOG:C40("TableSelector")
			CLOSE WINDOW:C154
			OK:=1
			ARRAY LONGINT:C221($_al_TablesToImport; $_l_TableCount)
			If (xOK=1)
				For ($_l_Index; 1; $_l_TableCount)
					$_l_TableNumberPosition:=Find in array:C230(DB_al_TableNumbers; $_l_Index)
					If ($_l_TableNumberPosition>0)
						If (DB_abo_TableSelector{$_l_TableNumberPosition})
							$_al_TablesToImport{$_l_Index}:=1
							$_bo_Continue:=True:C214
						End if 
					End if 
				End for 
				
			End if 
			$_bo_Delete:=(DB_l_Integrate=0)
	End case 
	
Else 
	$_bo_Delete:=True:C214  //in case records get created before the import on that table happens
	OK:=1
	$_bo_Continue:=True:C214
	ARRAY LONGINT:C221($_al_TablesToImport; $_l_TableCount)
	For ($_l_Index; 1; Size of array:C274($_al_TablesToImport))
		$_al_TablesToImport{$_l_Index}:=1
	End for 
End if 
If ($_bo_Continue)
	
	$_l_ScreenCentre:=(Screen width:C187-420)/2
	$_l_WIndowRIght:=$_l_ScreenCentre+420
	$_l_WIndowTop:=(Screen height:C188-230)/2
	$_l_WIndowBottom:=$_l_WIndowTop+230
	$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
	
	$_l_WIndowReference:=Open window:C153($_l_ScreenCentre; $_l_WIndowTop; $_l_WIndowRIght; $_l_WIndowBottom; 4; "Import records")
	WIN_l_CurrentWinRef:=$_l_WIndowReference
	
	
	ARRAY TEXT:C222($_at_DocumentPaths; 0)
	
	$_t_DocumentPath:=DB_SelectDocument(""; "TEXT"; "Select the file containing the First_Table to import"; 0; ->$_at_DocumentPaths)
	If (OK=1)
		$_t_DocumentPath:=PathFromPathName($_at_DocumentPaths{1})
		//TRACE
		For ($_l_TableNumber; 1; $_l_TableCount)  //redo 158 and 1
			If ($_al_TablesToImport{$_l_TableNumber}=1)
				If (Is table number valid:C999($_l_TableNumber))
					ERASE WINDOW:C160
					$_t_TableName:="TBL"+String:C10($_l_TableNumber; "000")+".txt"
					$_t_TableName:=Table name:C256($_l_TableNumber)
					$_ptr_Table:=Table:C252($_l_TableNumber)
					
					If (Size of array:C274(<>DB_al_TriggerTable)<$_l_TableNumber)
						ARRAY LONGINT:C221(<>DB_al_TriggerTable; $_l_TableNumber)
					End if 
					<>DB_al_TriggerTable{$_l_TableNumber}:=-1
					
					GOTO XY:C161(3; 2)
					MESSAGE:C88("Opening "+$_t_TableName+" data-file ..."+$_t_CarriageReturn)
					If (False:C215)
						$_bo_useNewStyle:=False:C215
						Case of 
							: ($_t_TableName="ADDRESS_FORMATS")
								$_t_TableName:="Address Formats"
							: ($_t_TableName="ACCOUNT BALANCES")
								$_t_TableName:="ACC BALANCES"
							: ($_t_TableName="Stock_Levels")
								$_t_TableName:="Stock levels"
							: ($_t_TableName="Additional_REcord_Analysis")
								$_t_TableName:="Furthers"
							: ($_t_TableName="WORKFLOW_CONTROL")
								$_t_TableName:="Sequences"
							: ($_t_TableName="CUSTOM_FIELDS")
								$_t_TableName:="Further Fields"
							: ($_t_TableName="TABLE_RECORD_STATES")
								$_t_TableName:="File States"
							: ($_t_TableName="CONTACTS_FURTHERS")
								
								$_t_TableName:="CONTACT_RECORD_ANALYSIS"
							: ($_t_TableName="COMPANIES_FURTHERS")
								
								$_t_TableName:="COMPANIES_RECORD_ANALYSIS"
							: ($_t_TableName="CONTRACTS_FURTHERS")
								
								$_t_TableName:="CONTRACT_RECORD_ANALYSIS"
							Else 
								//TRACE
								
						End case 
						If (Test path name:C476($_t_DocumentPath+$_t_TableName+"_.txt")=Is a document:K24:1)
							$_bo_useNewStyle:=True:C214
							
						End if 
					Else 
						//ARRAY LONGINT($_al_TablesIndexOld;0)
						//ARRAY TEXT($_at_OldTableNames;0)
						//ARRAY TEXT($_at_OldFIeldNames;0;0)
						//ARRAY TEXT($_at_OldTableImportType;0)
						//ARRAY LONGINT($_al_TablesIndexNew;0)
						//ARRAY TEXT($_at_NewtableName;0)
						//ARRAY TEXT($_at_NewFieldNames;0;0)
						
						$_l_RowRef:=0
						$_bo_UseTab:=False:C215
						//$_t_TableName:=""
						$_l_NewTableRowRef:=Find in array:C230($_at_NewtableName; $_t_TableName)
						$_t_NewTableName:=$_t_TableName
						If ($_l_NewTableRowRef>0)
							$_l_OldIndex:=$_al_TablesIndexNew{$_l_NewTableRowRef}
							$_l_RowRef:=Find in array:C230($_al_TablesIndexOld; $_l_OldIndex)
							If ($_l_RowRef>0)
								$_t_TableName:=$_at_OldTableNames{$_l_RowRef}
								$_bo_UseTab:=($_at_OldTableImportType{$_l_RowRef}="TAB")
							Else 
								$_bo_Ignore:=True:C214
							End if 
						Else 
							$_bo_Ignore:=True:C214
							
						End if 
					End if 
					Case of 
						: ($_bo_UseTab=False:C215)  //&( ($_t_TableName="CONTACTS") | ($_t_TableName="COMPANIES") | ($_t_TableName="PRODUCTS") | ($_t_TableName="PERSONNEL") | ($_t_TableName="CONTRACTS") | ($_t_TableName="SERVICE CALLS") | ($_t_TableName="TRANS IN") | ($_t_TableName="ACCOUNTS") | ($_t_TableName="REC JOURNALS") | ($_t_TableName="INVOICES") | ($_t_TableName="PURCHASE ORDERS") | ($_t_TableName="PURCHASES") | ($_t_TableName="CONTACTS_FURTHERS") | ($_t_TableName="CONTACTS_COMPANIES") | ($_t_TableName="COMPANIES_FURTHERS") | ($_t_TableName="PRODUCTS_SUPPLIERS") | ($_t_TableName="PERSONNEL_DIARY ACCESS") | ($_t_TableName="CONTRACTS_CONTACTS") | ($_t_TableName="SERVICE CALLS_PRODUCTS") | ($_t_TableName="TRANS IN_TRANS SUB") | ($_t_TableName="ACCOUNTS_LAYERS") | ($_t_TableName="ACCOUNTS_ANALYSES") | ($_t_TableName="REC JOURNALS_DATES") | ($_t_TableName="INVOICES_ITEMS") | ($_t_TableName="INVOICES_ALLOCATIONS") | ($_t_TableName="PURCHASE ORDERS_ITEMS") | ($_t_TableName="PURCHASES_ITEMS") | ($_t_TableName="PURCHASES_ALLOCATIONS") | ($_t_TableName="DOCUMENTS") | ($_bo_useNewStyle))
							
							
							If (Test path name:C476($_t_DocumentPath+$_t_TableName+".txt")=Is a document:K24:1) | (Test path name:C476($_t_DocumentPath+$_t_TableName+"_.txt")=Is a document:K24:1)
								TBL_EditIndexes($_l_TableNumber; False:C215)
								If ($_bo_useNewStyle)
									$_r_DocumentSize:=Get document size:C479($_t_DocumentPath+$_t_TableName+"_.txt")
								Else 
									$_r_DocumentSize:=Get document size:C479($_t_DocumentPath+$_t_TableName+".txt")
								End if 
								SET CHANNEL:C77(11)
								If ($_bo_useNewStyle)
									SET CHANNEL:C77(10; $_t_DocumentPath+$_t_TableName+"_.txt")
								Else 
									SET CHANNEL:C77(10; $_t_DocumentPath+$_t_TableName+".txt")
								End if 
								//The data is packed into a blob then the blob is in a text
								ARRAY TEXT:C222($_at_DocumentInText; 0)
								ARRAY TEXT:C222($_at_DocumentInText; 32000)
								
								SET BLOB SIZE:C606($_blb_Records; 0)
								$_t_Residualtext:=""
								
								
								SET BLOB SIZE:C606($_blb_Records; 0)
								
								$_t_ExportText:=""
								$_bo_ExportBoolean:=False:C215
								$_l_ExportLongint:=0
								$_r_ExportReal:=0
								$_l_ExportLongint:=0
								$_d_ExportDate:=!00-00-00!
								$_ti_ExportTime:=?00:00:00?
								$_t_ExportText:=""
								
								$_t_ExportText:="'"
								
								If (OK=1)
									//$_t_TableName:=DB_EditTableNames ($_t_TableName)
									
									If ($_r_DocumentSize>0)
										If ($_bo_Delete)
											ALL RECORDS:C47($_ptr_Table->)
											DELETE SELECTION:C66($_ptr_Table->)
										End if 
										
										$_l_LastFieldNumber:=Get last field number:C255($_l_TableNumber)
										$_l_TotalFields:=0
										For ($_l_FieldCount; 1; $_l_LastFieldNumber)
											If (Is field number valid:C1000($_l_TableNumber; $_l_FieldCount))
												$_l_TotalFields:=$_l_TotalFields+1
											End if 
										End for 
										ARRAY LONGINT:C221($_al_FieldNumbers; $_l_TotalFields)
										//ARRAY POINTER($_apo_FieldPointers;$_l_TotalFields)
										ARRAY BOOLEAN:C223($_aBo_FieldisKey; $_l_TotalFields)
										ARRAY TEXT:C222($_at_FieldData; 0)
										ARRAY INTEGER:C220($_ai_FieldiData; 0)
										ARRAY LONGINT:C221($_al_FieldlData; 0)
										ARRAY REAL:C219($_ar_FieldrData; 0)
										ARRAY DATE:C224($_ad_FieldDData; 0)
										ARRAY TIME:C1223($_ati_FieldtimeData; 0)
										ARRAY LONGINT:C221($_al_FieldBlobIndex; 0)  //index to blob var
										SET BLOB SIZE:C606($_blb_BlobData1; 0)
										SET BLOB SIZE:C606($_blb_BlobData2; 0)
										SET BLOB SIZE:C606($_blb_BlobData3; 0)
										ARRAY PICTURE:C279($_apic_FieldPictureData; 0)
										ARRAY BOOLEAN:C223($_aBo_FieldBooleanData; 0)
										
										Repeat   //Repeating records
											//Clear any arrays
											ARRAY TEXT:C222($_at_FieldData; 0)
											ARRAY INTEGER:C220($_ai_FieldiData; 0)
											ARRAY LONGINT:C221($_al_FieldlData; 0)
											ARRAY REAL:C219($_ar_FieldrData; 0)
											ARRAY DATE:C224($_ad_FieldDData; 0)
											ARRAY TIME:C1223($_ati_FieldtimeData; 0)
											ARRAY LONGINT:C221($_al_FieldBlobIndex; 0)  //index to blob var
											SET BLOB SIZE:C606($_blb_BlobData1; 0)
											SET BLOB SIZE:C606($_blb_BlobData2; 0)
											SET BLOB SIZE:C606($_blb_BlobData3; 0)
											ARRAY PICTURE:C279($_apic_FieldPictureData; 0)
											ARRAY BOOLEAN:C223($_aBo_FieldBooleanData; 0)
											//``
											ARRAY TEXT:C222($_at_FieldData; $_l_TotalFields)
											ARRAY INTEGER:C220($_ai_FieldiData; $_l_TotalFields)
											ARRAY LONGINT:C221($_al_FieldlData; $_l_TotalFields)
											ARRAY REAL:C219($_ar_FieldrData; $_l_TotalFields)
											ARRAY DATE:C224($_ad_FieldDData; $_l_TotalFields)
											ARRAY TIME:C1223($_ati_FieldtimeData; $_l_TotalFields)
											ARRAY LONGINT:C221($_al_FieldBlobIndex; $_l_TotalFields)  //index to blob var
											ARRAY PICTURE:C279($_apic_FieldPictureData; $_l_TotalFields)
											ARRAY BOOLEAN:C223($_aBo_FieldBooleanData; $_l_TotalFields)
											//```
											
											
											
											$_l_FIeldCounter:=0
											
											Repeat 
												
												CREATE RECORD:C68($_ptr_Table->)
												
												$_bo_SaveRecord:=False:C215
												
												Repeat 
													
													
													RECEIVE VARIABLE:C81($_t_FieldName)
													
													
													If ($_t_FieldName#"END_RECORD@")
														$_l_FieldType:=-1
														$_t_OldFIeldName:=$_t_FieldName
														$_l_FieldRef:=Find in array:C230($_at_OldFIeldNames{$_l_RowRef}; $_t_FieldName)
														If ($_l_FieldRef>0)
															$_t_FieldName:=$_at_NewFieldNames{$_l_NewTableRowRef}{$_l_FieldRef}
														Else 
															$_t_FieldName:=""
															
														End if 
														//ARRAY LONGINT($_al_TablesIndexOld;0)
														//ARRAY TEXT($_at_OldTableNames;0)
														//ARRAY TEXT($_at_OldFIeldNames;0;0)
														//ARRAY TEXT($_at_OldTableImportType;0)
														//ARRAY LONGINT($_al_TablesIndexNew;0)
														//ARRAY TEXT($_at_NewtableName;0)
														//ARRAY TEXT($_at_NewFieldNames;0;0)
														//$_l_RowRef:=0
														//$_t_FieldName:=DB_EditFieldNames ($_l_TableNumber;$_t_FieldName;->$_l_FieldType)
														$_l_FIeldCounter:=$_l_FIeldCounter+1
														If ($_t_FieldName#"") | ($_l_FieldType>=0)
															If ($_t_FieldName#"")
																EXECUTE FORMULA:C63("IMP_l_myFIeldNum:=FIELD(->["+$_t_NewTableName+"]"+$_t_FieldName+")")
																$_ptr_Field:=Field:C253($_l_TableNumber; IMP_l_myFIeldNum)
																
															Else 
																Case of 
																	: ($_l_FieldType=Is integer:K8:5)
																		$_ptr_Field:=->[COMPANIES:2]Size:15
																	: ($_l_FieldType=Is longint:K8:6)
																		$_ptr_Field:=->[COMPANIES:2]Deleted:61
																	: ($_l_FieldType=Is real:K8:4)
																		$_ptr_Field:=->[COMPANIES:2]Sales_Credit:35
																	: ($_l_FieldType=Is date:K8:7)
																		$_ptr_Field:=->[COMPANIES:2]Modified_Date:32
																	: ($_l_FieldType=Is time:K8:8)
																		$_ptr_Field:=->[DIARY:12]Time_Do_From:6
																	: ($_l_FieldType=Is BLOB:K8:12)
																		$_ptr_Field:=->[COMPANIES:2]Document_Print_Preferences:69
																	: ($_l_FieldType=Is picture:K8:10)
																		$_ptr_Field:=->[PICTURES:85]Picture:3
																	: ($_l_FieldType=Is boolean:K8:9)
																		$_ptr_Field:=->[COMPANIES:2]Invoice_Superior:57
																	: ($_l_FieldType=Is string var:K8:2)
																		$_ptr_Field:=->[COMPANIES:2]Company_Name:2
																	Else 
																		
																		$_ptr_Field:=->[COMPANIES:2]Comments:30
																End case 
																
															End if 
															RECEIVE VARIABLE:C81($_t_ExportText)
															$_t_ExportText:=Replace string:C233($_t_ExportText; "%CR"; Char:C90(13))
															$_t_ExportText:=Replace string:C233($_t_ExportText; "%TAB"; Char:C90(9))
															
															
															Case of 
																: (Type:C295($_ptr_Field->)=Is integer:K8:5) | ($_l_FieldType=Is integer:K8:5)
																	
																	$_l_ExportLongint:=Num:C11($_t_ExportText)
																	//BLOB TOVARIABLE($_blb_Records;$_l_ExportLongint;$BlobPosition)
																	
																	If ($_t_FieldName#"")
																		$_ptr_Field->:=$_l_ExportLongint
																		
																		$_bo_SaveRecord:=True:C214
																	Else 
																		If ($_l_FieldType=Is integer:K8:5)
																			$_t_FieldName:="NUL"
																		End if 
																	End if 
																: (Type:C295($_ptr_Field->)=Is real:K8:4) | ($_l_FieldType=Is real:K8:4)
																	//RECEIVE VARIABLE($_r_ExportReal)
																	$_r_ExportReal:=Num:C11($_t_ExportText)
																	//BLOB TO VARIABLE($_blb_Records;$_r_ExportReal;$BlobPosition)
																	If ($_t_FieldName#"")
																		$_ptr_Field->:=$_r_ExportReal
																		$_bo_SaveRecord:=True:C214
																	Else 
																		If ($_l_FieldType=Is real:K8:4)
																			$_t_FieldName:="NUL"
																		End if 
																	End if 
																: (Type:C295($_ptr_Field->)=Is longint:K8:6) | ($_l_FieldType=Is longint:K8:6)
																	//RECEIVE VARIABLE($_l_ExportLongint)
																	$_l_ExportLongint:=Num:C11($_t_ExportText)
																	If ($_t_FieldName#"")
																		//BLOB TO VARIABLE($_blb_Records;$_l_ExportLongint;$BlobPosition)
																		$_ptr_Field->:=$_l_ExportLongint
																		$_bo_SaveRecord:=True:C214
																	Else 
																		If ($_l_FieldType=Is longint:K8:6)
																			$_t_FieldName:="NUL"
																		End if 
																	End if 
																: (Type:C295($_ptr_Field->)=Is date:K8:7) | ($_l_FieldType=Is date:K8:7)
																	
																	$_d_ExportDate:=!00-00-00!
																	//RECEIVE VARIABLE($_d_ExportDate)
																	//RECEIVE VARIABLE($_t_ExportText)
																	$_d_ExportDate:=Date:C102($_t_ExportText)
																	If ($_t_FieldName#"")
																		//BLOB TO VARIABLE($_blb_Records;$_d_ExportDate;$BlobPosition)
																		$_ptr_Field->:=$_d_ExportDate
																		$_bo_SaveRecord:=True:C214
																	Else 
																		If ($_l_FieldType=Is date:K8:7)
																			$_t_FieldName:="NUL"
																		End if 
																	End if 
																: (Type:C295($_ptr_Field->)=Is time:K8:8) | ($_l_FieldType=Is time:K8:8)
																	//RECEIVE VARIABLE($_ti_ExportTime)
																	$_ti_ExportTime:=Time:C179($_t_ExportText)
																	If ($_t_FieldName#"")
																		//BLOB TO VARIABLE($_blb_Records;$_ti_ExportTime;$BlobPosition)
																		$_ptr_Field->:=$_ti_ExportTime
																		$_bo_SaveRecord:=True:C214
																		If ($_l_FieldType=Is time:K8:8)
																			$_t_FieldName:="NUL"
																		End if 
																	End if 
																: (Type:C295($_ptr_Field->)=Is BLOB:K8:12) | ($_l_FieldType=Is BLOB:K8:12)
																	If (False:C215)
																		
																		SET BLOB SIZE:C606($_blb_Field; 0)
																		RECEIVE VARIABLE:C81($_blb_Field)
																		If ($_t_FieldName#"")
																			//BLOB TO VARIABLE($_blb_Records;$_blb_Field;$BlobPosition)
																			//DECODE($_blb_Field)
																			$_l_BlobSize2:=BLOB size:C605($_blb_Field)
																			COPY BLOB:C558($_blb_Field; $_ptr_Field->; 0; 0; $_l_BlobSize2)
																			
																			
																			$_bo_SaveRecord:=True:C214
																		Else 
																			If ($_l_FieldType=Is BLOB:K8:12)
																				$_t_FieldName:="NUL"
																			End if 
																		End if 
																	Else 
																		If ($_t_ExportText#"")
																			$_l_positionType:=Position:C15(".txt"; $_t_ExportText)
																			If ($_l_positionType>0)
																				$_t_DocName:=FileNamefromPath($_t_ExportText)
																				If (Test path name:C476($_t_DocumentPath+$_t_DocName)=Is a document:K24:1)
																					//TRACE
																					DOCUMENT TO BLOB:C525($_t_DocumentPath+$_t_DocName; $_ptr_Field->)
																					
																					
																				End if   //RECEIVE VARIABLE($_t_DOcumentName)
																			End if 
																		End if 
																	End if 
																: (Type:C295($_ptr_Field->)=Is picture:K8:10) | ($_l_FieldType=Is picture:K8:10)
																	If (False:C215)
																		
																		SET BLOB SIZE:C606($_blb_Export; 0)
																		//BLOB TO VARIABLE($_blb_Records;$_blb_Export;$BlobPosition)
																		//DECODE($_blb_Export)
																		$_l_BlobSize2:=BLOB size:C605($_blb_Export)
																		RECEIVE VARIABLE:C81($_Pic_FieldPicture)
																		If ($_t_FieldName#"")
																			$_ptr_Field->:=$_Pic_FieldPicture
																			//BLOB TO PICTURE($_blb_Export;$_ptr_Field->;"JPEG")
																			$_bo_SaveRecord:=True:C214
																		Else 
																			If ($_l_FieldType=Is picture:K8:10)
																				$_t_FieldName:="NUL"
																			End if 
																		End if 
																	Else 
																		If ($_t_ExportText#"")
																			$_l_positionType:=Position:C15(".txt"; $_t_ExportText)
																			If ($_l_positionType>0)
																				$_t_DocName:=FileNamefromPath($_t_ExportText)
																				If (Test path name:C476($_t_DocumentPath+$_t_DocName)=Is a document:K24:1)
																					//TRACE
																					//DOCUMENT TO BLOB($_t_DocumentPath+$_t_DocName;$_ptr_Field->)
																					READ PICTURE FILE:C678($_t_DocumentPath+$_t_DocName; $_ptr_Field->)
																					
																				End if   //RECEIVE VARIABLE($_t_DOcumentName)
																			End if 
																		End if 
																		
																	End if 
																: (Type:C295($_ptr_Field->)=Is boolean:K8:9) | ($_l_FieldType=Is boolean:K8:9)
																	//RECEIVE VARIABLE($_bo_ExportBoolean)
																	$_bo_ExportBoolean:=($_t_ExportText="TRUE") | ($_t_ExportText="1")
																	
																	If ($_t_FieldName#"")
																		//BLOB TO VARIABLE($_blb_Records;$_bo_ExportBoolean;$BlobPosition)
																		$_ptr_Field->:=$_bo_ExportBoolean
																		$_bo_SaveRecord:=True:C214
																		If ($_l_FieldType=Is boolean:K8:9)
																			$_t_FieldName:="NUL"
																		End if 
																	End if 
																: (Type:C295($_ptr_Field->)=Is alpha field:K8:1) | ($_l_FieldType=Is string var:K8:2)
																	//RECEIVE VARIABLE($_t_ExportText)
																	//$_t_ExportText:=Replace string(
																	$_t_ExportText:=$_t_ExportText
																	If ($_t_FieldName#"")
																		//BLOB TO VARIABLE($_blb_Records;$_t_ExportText;$BlobPosition)
																		$_ptr_Field->:=$_t_ExportText
																		$_bo_SaveRecord:=True:C214
																	Else 
																		If ($_l_FieldType=Is string var:K8:2)
																			$_t_FieldName:="NUL"
																		End if 
																	End if 
																Else 
																	//RECEIVE VARIABLE($_t_ExportText)
																	If ($_t_FieldName#"")
																		//BLOB TO VARIABLE($_blb_Records;$_t_ExportText;$BlobPosition)
																		$_ptr_Field->:=$_t_ExportText
																		$_bo_SaveRecord:=True:C214
																	Else 
																		If ($_l_FieldType=Is text:K8:3)
																			$_t_FieldName:="NUL"
																		End if 
																	End if 
															End case 
														Else 
															RECEIVE VARIABLE:C81($_t_ExportText)
														End if 
														
													End if 
													
													
												Until ($_t_FieldName="END_RECORD@") | (($_t_FieldName="") & ($_t_OldFIeldName=""))  //| ($_l_FIeldCounter=$_l_TotalFields)
												
												If ($_bo_SaveRecord)
													Case of 
														: ($_l_TableNumber=Table:C252(->[CONTACTS:1]))
															If ([CONTACTS:1]Contact_Code:2="")
																Contact_Code
															End if 
														: ($_l_TableNumber=Table:C252(->[COMPANIES:2]))
															If ([COMPANIES:2]Company_Code:1="")
																Company_No
															End if 
														: ($_l_TableNumber=Table:C252(->[AREAS:3]))
															If ([AREAS:3]Area_Code:1="")
																
															End if 
													End case 
													
													DB_SaveRecord($_ptr_Table)
													$_l_MessageCounter:=$_l_MessageCounter+1
													$_l_RecordNumber:=(Records in table:C83($_ptr_Table->))
													If ($_l_RecordNumber=10)
														//TRACE
													End if 
													If ($_l_MessageCounter>=10)
														GOTO XY:C161(3; 6)
														MESSAGE:C88("Saving record "+String:C10($_l_RecordNumber)+" for table "+$_t_TableName)
														GOTO XY:C161(3; 10)
														$_l_MessageCounter:=0
													End if 
												End if 
												$_l_FIeldCounter:=0
												
											Until (OK=0)
											
											
											
											
										Until (OK=0)
										
										SET CHANNEL:C77(11)
										
										
									End if 
								End if 
								TBL_EditIndexes($_l_TableNumber; True:C214)
							End if 
							$_bo_Update:=True:C214
							
						Else 
							
							$_l_MessageCounter:=0
							If (Test path name:C476($_t_DocumentPath+$_t_TableName+".txt")=Is a document:K24:1)
								//TRACE
								$_ti_Document:=Open document:C264($_t_DocumentPath+$_t_TableName+".txt"; "TEXT")
								
								If ($_ti_Document#?00:00:00?)
									TBL_EditIndexes($_l_TableNumber; False:C215)
									Repeat 
										RECEIVE PACKET:C104($_ti_Document; $_t_SUbrecordData; Char:C90(10))
										
										
										If ($_t_SUbrecordData#"")
											ARRAY TEXT:C222($_at_FieldData; 0)
											
											Repeat 
												$_l_PositionBreak:=Position:C15("|"; $_t_SUbrecordData)
												If ($_l_PositionBreak>0)
													APPEND TO ARRAY:C911($_at_FieldData; Substring:C12($_t_SUbrecordData; 1; $_l_PositionBreak-1))
													$_at_FieldData{Size of array:C274($_at_FieldData)}:=Replace string:C233($_at_FieldData{Size of array:C274($_at_FieldData)}; "%CR"; Char:C90(13))
													$_at_FieldData{Size of array:C274($_at_FieldData)}:=Replace string:C233($_at_FieldData{Size of array:C274($_at_FieldData)}; "%TAB"; Char:C90(9))
													
													$_t_SUbrecordData:=Substring:C12($_t_SUbrecordData; $_l_PositionBreak+1)
												Else 
													APPEND TO ARRAY:C911($_at_FieldData; $_t_SUbrecordData)
													$_at_FieldData{Size of array:C274($_at_FieldData)}:=Replace string:C233($_at_FieldData{Size of array:C274($_at_FieldData)}; "%CR"; Char:C90(13))
													$_at_FieldData{Size of array:C274($_at_FieldData)}:=Replace string:C233($_at_FieldData{Size of array:C274($_at_FieldData)}; "%TAB"; Char:C90(9))
													
													
													$_t_SUbrecordData:=""
												End if 
											Until ($_t_SUbrecordData="")
											//we now have the record in arrays
											$_Ptr_TablePointer:=Table:C252($_l_TableNumber)
											CREATE RECORD:C68($_Ptr_TablePointer->)
											$_l_FieldType:=0
											For ($_l_FillFields; 1; Size of array:C274($_at_FieldData))
												// /
												If ($_at_OldFIeldNames{$_l_RowRef}{$_l_FillFields}#"")  //dont try to import to non rows
													$_t_FieldName:=$_at_NewFieldNames{$_l_NewTableRowRef}{$_l_FillFields}
													
													If ($_t_FieldName#"")
														
														EXECUTE FORMULA:C63("IMP_l_myFIeldNum:=FIELD(->["+$_t_NewTableName+"]"+$_t_FieldName+")")
														$_ptr_Field:=Field:C253($_l_TableNumber; IMP_l_myFIeldNum)
														
														
														
														// //
														//$_ptr_Field:=Field($_l_TableNumber;$_l_FillFields)
														
														Case of 
															: (Type:C295($_ptr_Field->)=Is integer:K8:5) | ($_l_FieldType=Is integer:K8:5)
																
																//BLOB TOVARIABLE($_blb_Records;$_l_ExportLongint;$BlobPosition)
																
																
																$_ptr_Field->:=Num:C11($_at_FieldData{$_l_FillFields})
																
																$_bo_SaveRecord:=True:C214
																
																
															: (Type:C295($_ptr_Field->)=Is real:K8:4) | ($_l_FieldType=Is real:K8:4)
																
																//BLOB TO VARIABLE($_blb_Records;$_r_ExportReal;$BlobPosition)
																
																$_ptr_Field->:=Num:C11($_at_FieldData{$_l_FillFields})
																$_bo_SaveRecord:=True:C214
																
															: (Type:C295($_ptr_Field->)=Is longint:K8:6) | ($_l_FieldType=Is longint:K8:6)
																
																
																//BLOB TO VARIABLE($_blb_Records;$_l_ExportLongint;$BlobPosition)
																$_ptr_Field->:=Num:C11($_at_FieldData{$_l_FillFields})
																$_bo_SaveRecord:=True:C214
																
															: (Type:C295($_ptr_Field->)=Is date:K8:7) | ($_l_FieldType=Is date:K8:7)
																
																
																//BLOB TO VARIABLE($_blb_Records;$_d_ExportDate;$BlobPosition)
																$_ptr_Field->:=Date:C102($_at_FieldData{$_l_FillFields})
																$_bo_SaveRecord:=True:C214
																
															: (Type:C295($_ptr_Field->)=Is time:K8:8) | ($_l_FieldType=Is time:K8:8)
																
																//BLOB TO VARIABLE($_blb_Records;$_ti_ExportTime;$BlobPosition)
																$_ptr_Field->:=Time:C179($_at_FieldData{$_l_FillFields})
																
															: (Type:C295($_ptr_Field->)=Is BLOB:K8:12) | ($_l_FieldType=Is BLOB:K8:12)
																//TRACE
															: (Type:C295($_ptr_Field->)=Is picture:K8:10) | ($_l_FieldType=Is picture:K8:10)
																//TRACE
															: (Type:C295($_ptr_Field->)=Is boolean:K8:9) | ($_l_FieldType=Is boolean:K8:9)
																$_ptr_Field->:=($_at_FieldData{$_l_FillFields}="1") | ($_at_FieldData{$_l_FillFields}="TRUE")
															: (Type:C295($_ptr_Field->)=Is alpha field:K8:1) | ($_l_FieldType=Is string var:K8:2)
																
																$_ptr_Field->:=$_at_FieldData{$_l_FillFields}
																$_bo_SaveRecord:=True:C214
																
															Else 
																
																$_ptr_Field->:=$_at_FieldData{$_l_FillFields}
																
														End case 
													End if 
												End if 
											End for 
											If ($_bo_SaveRecord)
												DB_SaveRecord($_Ptr_TablePointer)
												//SAVE RECORD($_Ptr_TablePointer->)
												$_l_MessageCounter:=$_l_MessageCounter+1
												$_l_RecordNumber:=(Records in table:C83($_Ptr_TablePointer->))
												If ($_l_RecordNumber=7561)
													//TRACE
												End if 
												
												If ($_l_MessageCounter>=10)
													GOTO XY:C161(3; 6)
													MESSAGE:C88("Saving record "+String:C10($_l_RecordNumber)+" for table "+$_t_NewTableName)
													GOTO XY:C161(3; 10)
													$_l_MessageCounter:=0
												End if 
											End if 
										End if 
										
									Until (OK=0)
									CLOSE DOCUMENT:C267($_ti_Document)
									
								End if 
								If (False:C215)
									//0//SET CHANNEL(11)
									//SET CHANNEL(10;$_t_DocumentPath+$_t_TableName+".txt")
									
									If (OK=1)
										$_r_DocumentSize:=Get document size:C479($_t_DocumentPath+$_t_TableName+".txt")
										If ($_r_DocumentSize>0)
											GOTO XY:C161(3; 4)
											MESSAGE:C88("Importing data for "+Table name:C256($_l_TableNumber))
											
											RECEIVE VARIABLE:C81($_l_RecordsInSelection)
											If (OK=1)
												RECEIVE VARIABLE:C81($_l_NextSequenceNum)
												If (OK=1)
													$_bo_OK:=True:C214
													
													//ALL RECORDS($_ptr_Table->)
													//DELETE SELECTION($_ptr_Table->)
													
													$_l_RecordNumber:=0
													$_l_TickCount:=Tickcount:C458
													$_l_MessageCounter:=0
													For ($_l_RecordNumber; 1; $_l_RecordsInSelection)
														RECEIVE RECORD:C79(Table:C252($_l_TableNumber)->)
														$_bo_OK:=(OK=1)
														If ($_bo_OK)
															GOTO XY:C161(3; 6)
															MESSAGE:C88("Saving record "+String:C10($_l_RecordNumber)+" of "+String:C10($_l_RecordsInSelection)+" in file.")
															$_l_MessageCounter:=$_l_MessageCounter+1
															If ($_l_MessageCounter>=10)
																$_l_TIcksElapsed:=Tickcount:C458-$_l_TickCount
																$_l_AveragePerRecord:=$_l_RecordNumber/$_l_TIcksElapsed
																$_l_RecordstoGo:=$_l_RecordsInSelection-$_l_RecordNumber
																$_l_TicksToGo:=$_l_RecordstoGo*$_l_AveragePerRecord
																$_l_SecondsToGo:=Int:C8($_l_TicksToGo/60)
																
																$_l_AverageSeconds:=Int:C8((Tickcount:C458-$_l_TickCount)/$_l_RecordNumber*($_l_RecordsInSelection-$_l_RecordNumber)/60)
																GOTO XY:C161(3; 10)
																MESSAGE:C88("Time to go is approx. "+String:C10($_l_AverageSeconds)+" seconds ...")
																GOTO XY:C161(3; 10)
																MESSAGE:C88("Time to go is approx. "+String:C10($_l_SecondsToGo)+" seconds ...")
																$_l_MessageCounter:=0
															End if 
															DB_SaveRecord(Table:C252($_l_TableNumber))
														End if 
														UNLOAD RECORD:C212(Table:C252($_l_TableNumber)->)
													End for 
												End if 
											End if 
										End if 
									End if 
									SET CHANNEL:C77(11)
									<>DB_al_TriggerTable{$_l_TableNumber}:=0
									UNLOAD RECORD:C212($_ptr_Table->)
									REDUCE SELECTION:C351($_ptr_Table->; 0)
									TBL_EditIndexes($_l_TableNumber; True:C214)
								End if 
							End if 
							$_bo_Update:=True:C214
							//  While (Sequence number($_ptr_Table->)<$_l_NextSequenceNum)
							//WE DONT NEED TO DO THIS
							//BECAUSE NOWHERE USES SEQUENCE NUMBERS NOW
							//CREATE RECORD($_ptr_Table->)
							//  DB_SaveRecord($_ptr_Table)
							// DELETE RECORD($_ptr_Table->)
							// End while
					End case 
					
				End if 
			End if 
		End for 
		
		CLOSE WINDOW:C154
		WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
	End if 
End if 
If ($_bo_Update)
	V11Upgrade
End if 

<>SYS_bo_DuringInit:=False:C215
ERR_MethodTrackerReturn("TBI_ImportFrom2004"; $_t_oldMethodName)
