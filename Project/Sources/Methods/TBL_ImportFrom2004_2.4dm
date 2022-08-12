//%attributes = {}

If (False:C215)
	//Database Method Name:      TBL_ImportFrom2004_2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  27/06/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_FieldBLBData; 0)
	ARRAY BOOLEAN:C223($_abo_FIeldisKey; 0)
	//ARRAY BOOLEAN(DB_abo_TableSelector;0)
	ARRAY DATE:C224($_ad_FieldDData; 0)
	ARRAY INTEGER:C220($_ai_FieldiData; 0)
	//ARRAY LONGINT(<>DB_al_TriggerTable;0)
	ARRAY LONGINT:C221($_al_FieldBIData; 0)
	ARRAY LONGINT:C221($_al_FieldLData; 0)
	ARRAY LONGINT:C221($_al_FieldNumbers; 0)
	ARRAY LONGINT:C221($_al_TablesToImport; 0)
	//ARRAY LONGINT(DB_al_TableNumbers;0)
	ARRAY PICTURE:C279($_aPic_FieldPIData; 0)
	ARRAY POINTER:C280($_aptr_FIeldPointers; 0)
	ARRAY REAL:C219($_ar_FieldRData; 0)
	ARRAY TEXT:C222($_at_DocumentInText; 0)
	ARRAY TEXT:C222($_at_DocumentPaths; 0)
	ARRAY TEXT:C222($_at_FieldTextData; 0)
	ARRAY TIME:C1223($_ati_FieldTimeData; 0)
	C_BLOB:C604($_blb_Data1; $_blb_Data2; $_blb_Data3; $_blb_Export; $_blb_Field; $_blb_Records)
	C_BOOLEAN:C305(<>SYS_bo_DuringInit; $_bo_Continue; $_bo_Delete; $_bo_ExporBoolean; $_bo_ok; $_bo_Save; $_bo_UseNewStyle)
	C_DATE:C307($_d_ExportDate)
	C_LONGINT:C283($_l_AvePerRecord; $_l_AverageSeconds; $_l_BlobSize2; $_l_CurrentWinRefOLD; $_l_DocumentSize; $_l_Element; $_l_ExportLongint; $_l_FIeldCount; $_l_FIeldCounter; $_l_FieldType; $_l_Index)
	C_LONGINT:C283($_l_LastFieldNumber; $_l_MessageCounter; $_l_NextSequenceNumber; $_l_RecordCount; $_l_RecordNumber; $_l_RecordsInSelection; $_l_RecordsToGo; $_l_ScreenCentre; $_l_SecordsToGo; $_l_TableCount; $_l_TableNumber)
	C_LONGINT:C283($_l_TableNumberPosition; $_l_Ticks; $_l_TicksCount; $_l_TicksElapsed; $_l_TicksToGo; $_l_TotalFIelds; $_l_TotalTextSize; $_l_WindowBottom; $_l_WindowReference; $_l_WindowRight; $_l_WindowTop)
	C_LONGINT:C283(DB_l_Integrate; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD; xCancel; XNext; xOK)
	C_PICTURE:C286($_Pic_FieldPicture)
	C_POINTER:C301($_ptr_Field; $_ptr_Table)
	C_REAL:C285($_r_ExportReal; $_r_PercentDone; IMP_l_FieldNumber)
	C_TEXT:C284($_t_CarriageReturn; $_t_DocumentPath; $_t_ExportText; $_t_FieldName; $_t_oldMethodName; $_t_RecordData; $_t_ResidualText; $_t_TableDocumentName; $_t_TableName)
	C_TIME:C306($_ti_DocumentRef; $_ti_ExportTime)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("TBL_ImportFrom2004_2")

//This method will import data from Daybook 2004.
//TRACE
//UNICODE TEST
$_t_CarriageReturn:=Char:C90(13)
$_bo_Delete:=False:C215
$_l_TableCount:=Get last table number:C254
$_l_RecordCount:=0
<>SYS_bo_DuringInit:=True:C214
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
	$_l_WindowRight:=$_l_ScreenCentre+420
	$_l_WindowTop:=(Screen height:C188-230)/2
	$_l_WindowBottom:=$_l_WindowTop+230
	$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
	
	$_l_WindowReference:=Open window:C153($_l_ScreenCentre; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom; 4; "Import records")
	WIN_l_CurrentWinRef:=$_l_WindowReference
	
	
	ARRAY TEXT:C222($_at_DocumentPaths; 0)
	
	$_t_DocumentPath:=DB_SelectDocument(""; "TEXT"; "Select the file containing the First_Table to import"; 0; ->$_at_DocumentPaths)
	If (OK=1)
		$_t_DocumentPath:=PathFromPathName($_at_DocumentPaths{1})
		//TRACE
		For ($_l_TableNumber; 1; $_l_TableCount)
			If ($_al_TablesToImport{$_l_TableNumber}=1)
				If (Is table number valid:C999($_l_TableNumber))
					ERASE WINDOW:C160
					$_t_TableDocumentName:="TBL"+String:C10($_l_TableNumber; "000")+".txt"
					$_t_TableName:=Table name:C256($_l_TableNumber)
					$_ptr_Table:=Table:C252($_l_TableNumber)
					
					If (Size of array:C274(<>DB_al_TriggerTable)<$_l_TableNumber)
						ARRAY LONGINT:C221(<>DB_al_TriggerTable; $_l_TableNumber)
					End if 
					<>DB_al_TriggerTable{$_l_TableNumber}:=-1
					
					GOTO XY:C161(3; 2)
					MESSAGE:C88("Opening "+$_t_TableDocumentName+" data-file ..."+$_t_CarriageReturn)
					$_bo_UseNewStyle:=False:C215
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
					End case 
					If (Test path name:C476($_t_DocumentPath+$_t_TableName+"_.txt")=Is a document:K24:1)
						$_bo_UseNewStyle:=True:C214
						
					End if 
					Case of 
						: ($_t_TableName="CONTACTS") | ($_t_TableName="COMPANIES") | ($_t_TableName="PRODUCTS") | ($_t_TableName="PERSONNEL") | ($_t_TableName="CONTRACTS") | ($_t_TableName="SERVICE CALLS") | ($_t_TableName="TRANS IN") | ($_t_TableName="ACCOUNTS") | ($_t_TableName="REC JOURNALS") | ($_t_TableName="INVOICES") | ($_t_TableName="PURCHASE ORDERS") | ($_t_TableName="PURCHASES") | ($_t_TableName="CONTACTS_FURTHERS") | ($_t_TableName="CONTACTS_COMPANIES") | ($_t_TableName="COMPANIES_FURTHERS") | ($_t_TableName="PRODUCTS_SUPPLIERS") | ($_t_TableName="PERSONNEL_DIARY ACCESS") | ($_t_TableName="CONTRACTS_CONTACTS") | ($_t_TableName="SERVICE CALLS_PRODUCTS") | ($_t_TableName="TRANS IN_TRANS SUB") | ($_t_TableName="ACCOUNTS_LAYERS") | ($_t_TableName="ACCOUNTS_ANALYSES") | ($_t_TableName="REC JOURNALS_DATES") | ($_t_TableName="INVOICES_ITEMS") | ($_t_TableName="INVOICES_ALLOCATIONS") | ($_t_TableName="PURCHASE ORDERS_ITEMS") | ($_t_TableName="PURCHASES_ITEMS") | ($_t_TableName="PURCHASES_ALLOCATIONS") | ($_t_TableName="DOCUMENTS") | ($_bo_UseNewStyle)
							
							
							If (Test path name:C476($_t_DocumentPath+$_t_TableName+".txt")=Is a document:K24:1) | (Test path name:C476($_t_DocumentPath+$_t_TableName+"_.txt")=Is a document:K24:1)
								TBL_EditIndexes($_l_TableNumber; False:C215)
								If ($_bo_UseNewStyle)
									$_l_DocumentSize:=Get document size:C479($_t_DocumentPath+$_t_TableName+"_.txt")
								Else 
									$_l_DocumentSize:=Get document size:C479($_t_DocumentPath+$_t_TableName+".txt")
								End if 
								//SET CHANNEL(11)
								If ($_bo_UseNewStyle)
									$_ti_DocumentRef:=Open document:C264($_t_DocumentPath+$_t_TableName+"_.txt")
									SET CHANNEL:C77(10; $_t_DocumentPath+$_t_TableName+"_.txt")
								Else 
									$_ti_DocumentRef:=Open document:C264($_t_DocumentPath+$_t_TableName+".txt")
									SET CHANNEL:C77(10; $_t_DocumentPath+$_t_TableName+".txt")
								End if 
								//The data is packed into a blob then the blob is in a text
								ARRAY TEXT:C222($_at_DocumentInText; 0)
								ARRAY TEXT:C222($_at_DocumentInText; 32000)
								
								SET BLOB SIZE:C606($_blb_Records; 0)
								$_t_ResidualText:=""
								$_l_Element:=1
								
								SET BLOB SIZE:C606($_blb_Records; 0)
								$_t_ExportText:=""
								$_bo_ExporBoolean:=False:C215
								$_l_ExportLongint:=0
								$_r_ExportReal:=0
								$_l_ExportLongint:=0
								$_d_ExportDate:=!00-00-00!
								$_ti_ExportTime:=?00:00:00?
								$_t_ExportText:=""
								$_t_ExportText:="'"
								
								If (OK=1)
									$_t_TableName:=DB_EditTableNames($_t_TableName)
									
									If ($_l_DocumentSize>0)
										If ($_bo_Delete)
											ALL RECORDS:C47($_ptr_Table->)
											DELETE SELECTION:C66($_ptr_Table->)
										End if 
										$_l_LastFieldNumber:=Get last field number:C255($_l_TableNumber)
										$_l_TotalFIelds:=0
										For ($_l_FIeldCount; 1; $_l_LastFieldNumber)
											If (Is field number valid:C1000($_l_TableNumber; $_l_FIeldCount))
												$_l_TotalFIelds:=$_l_TotalFIelds+1
											End if 
										End for 
										ARRAY LONGINT:C221($_al_FieldNumbers; $_l_TotalFIelds)
										ARRAY POINTER:C280($_aptr_FIeldPointers; $_l_TotalFIelds)
										ARRAY BOOLEAN:C223($_abo_FIeldisKey; $_l_TotalFIelds)
										ARRAY TEXT:C222($_at_FieldTextData; 0)
										ARRAY INTEGER:C220($_ai_FieldiData; 0)
										ARRAY LONGINT:C221($_al_FieldLData; 0)
										ARRAY REAL:C219($_ar_FieldRData; 0)
										ARRAY DATE:C224($_ad_FieldDData; 0)
										ARRAY TIME:C1223($_ati_FieldTimeData; 0)
										ARRAY LONGINT:C221($_al_FieldBIData; 0)  //index to blob var
										
										SET BLOB SIZE:C606($_blb_Data1; 0)
										SET BLOB SIZE:C606($_blb_Data2; 0)
										SET BLOB SIZE:C606($_blb_Data3; 0)
										ARRAY PICTURE:C279($_aPic_FieldPIData; 0)
										ARRAY BOOLEAN:C223($_abo_FieldBLBData; 0)
										
										Repeat   //Repeating records
											//Clear any arrays
											ARRAY TEXT:C222($_at_FieldTextData; 0)
											ARRAY INTEGER:C220($_ai_FieldiData; 0)
											ARRAY LONGINT:C221($_al_FieldLData; 0)
											ARRAY REAL:C219($_ar_FieldRData; 0)
											ARRAY DATE:C224($_ad_FieldDData; 0)
											ARRAY TIME:C1223($_ati_FieldTimeData; 0)
											ARRAY LONGINT:C221($_al_FieldBIData; 0)  //index to blob var
											
											SET BLOB SIZE:C606($_blb_Data1; 0)
											SET BLOB SIZE:C606($_blb_Data2; 0)
											SET BLOB SIZE:C606($_blb_Data3; 0)
											ARRAY PICTURE:C279($_aPic_FieldPIData; 0)
											ARRAY BOOLEAN:C223($_abo_FieldBLBData; 0)
											//``
											ARRAY TEXT:C222($_at_FieldTextData; $_l_TotalFIelds)
											ARRAY INTEGER:C220($_ai_FieldiData; $_l_TotalFIelds)
											ARRAY LONGINT:C221($_al_FieldLData; $_l_TotalFIelds)
											ARRAY REAL:C219($_ar_FieldRData; $_l_TotalFIelds)
											ARRAY DATE:C224($_ad_FieldDData; $_l_TotalFIelds)
											ARRAY TIME:C1223($_ati_FieldTimeData; $_l_TotalFIelds)
											ARRAY LONGINT:C221($_al_FieldBIData; $_l_TotalFIelds)  //index to blob var
											
											ARRAY PICTURE:C279($_aPic_FieldPIData; $_l_TotalFIelds)
											ARRAY BOOLEAN:C223($_abo_FieldBLBData; $_l_TotalFIelds)
											//```
											
											
											
											$_l_FIeldCounter:=0
											
											Repeat 
												
												CREATE RECORD:C68($_ptr_Table->)
												
												$_bo_Save:=False:C215
												
												Repeat 
													
													
													//RECEIVE VARIABLE($_t_FieldName)
													RECEIVE PACKET:C104($_ti_DocumentRef; $_t_RecordData; Char:C90(13))  //note that the export removed other char 13s and replaced them with a control char set
													
													
													
													If ($_t_FieldName#"END_RECORD@")
														$_l_FieldType:=-1
														$_t_FieldName:=DB_EditFieldNames($_l_TableNumber; $_t_FieldName; ->$_l_FieldType)
														$_l_FIeldCounter:=$_l_FIeldCounter+1
														If ($_t_FieldName#"") | ($_l_FieldType>=0)
															If ($_t_FieldName#"")
																EXECUTE FORMULA:C63("IMP_l_FieldNumber:=FIELD(->["+$_t_TableName+"]"+$_t_FieldName+")")
																$_ptr_Field:=Field:C253($_l_TableNumber; IMP_l_FieldNumber)
																
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
															
															
															
															Case of 
																: (Type:C295($_ptr_Field->)=Is integer:K8:5) | ($_l_FieldType=Is integer:K8:5)
																	
																	RECEIVE VARIABLE:C81($_l_ExportLongint)
																	//BLOB TOVARIABLE($_blb_Records;$_l_ExportLongint;$BlobPosition)
																	
																	If ($_t_FieldName#"")
																		$_ptr_Field->:=$_l_ExportLongint
																		
																		$_bo_Save:=True:C214
																	Else 
																		If ($_l_FieldType=Is integer:K8:5)
																			$_t_FieldName:="NUL"
																		End if 
																	End if 
																: (Type:C295($_ptr_Field->)=Is real:K8:4) | ($_l_FieldType=Is real:K8:4)
																	RECEIVE VARIABLE:C81($_r_ExportReal)
																	//BLOB TO VARIABLE($_blb_Records;$_r_ExportReal;$BlobPosition)
																	If ($_t_FieldName#"")
																		$_ptr_Field->:=$_r_ExportReal
																		$_bo_Save:=True:C214
																	Else 
																		If ($_l_FieldType=Is real:K8:4)
																			$_t_FieldName:="NUL"
																		End if 
																	End if 
																: (Type:C295($_ptr_Field->)=Is longint:K8:6) | ($_l_FieldType=Is longint:K8:6)
																	RECEIVE VARIABLE:C81($_l_ExportLongint)
																	If ($_t_FieldName#"")
																		//BLOB TO VARIABLE($_blb_Records;$_l_ExportLongint;$BlobPosition)
																		$_ptr_Field->:=$_l_ExportLongint
																		$_bo_Save:=True:C214
																	Else 
																		If ($_l_FieldType=Is longint:K8:6)
																			$_t_FieldName:="NUL"
																		End if 
																	End if 
																: (Type:C295($_ptr_Field->)=Is date:K8:7) | ($_l_FieldType=Is date:K8:7)
																	RECEIVE VARIABLE:C81($_d_ExportDate)
																	If ($_t_FieldName#"")
																		//BLOB TO VARIABLE($_blb_Records;$_d_ExportDate;$BlobPosition)
																		$_ptr_Field->:=$_d_ExportDate
																		$_bo_Save:=True:C214
																	Else 
																		If ($_l_FieldType=Is date:K8:7)
																			$_t_FieldName:="NUL"
																		End if 
																	End if 
																: (Type:C295($_ptr_Field->)=Is time:K8:8) | ($_l_FieldType=Is time:K8:8)
																	RECEIVE VARIABLE:C81($_ti_ExportTime)
																	If ($_t_FieldName#"")
																		//BLOB TO VARIABLE($_blb_Records;$_ti_ExportTime;$BlobPosition)
																		$_ptr_Field->:=$_ti_ExportTime
																		$_bo_Save:=True:C214
																		If ($_l_FieldType=Is time:K8:8)
																			$_t_FieldName:="NUL"
																		End if 
																	End if 
																: (Type:C295($_ptr_Field->)=Is BLOB:K8:12) | ($_l_FieldType=Is BLOB:K8:12)
																	
																	SET BLOB SIZE:C606($_blb_Field; 0)
																	RECEIVE VARIABLE:C81($_blb_Field)
																	If ($_t_FieldName#"")
																		//BLOB TO VARIABLE($_blb_Records;$_blb_Field;$BlobPosition)
																		//DECODE($_blb_Field)
																		$_l_BlobSize2:=BLOB size:C605($_blb_Field)
																		COPY BLOB:C558($_blb_Field; $_ptr_Field->; 0; 0; $_l_BlobSize2)
																		
																		
																		$_bo_Save:=True:C214
																	Else 
																		If ($_l_FieldType=Is BLOB:K8:12)
																			$_t_FieldName:="NUL"
																		End if 
																	End if 
																: (Type:C295($_ptr_Field->)=Is picture:K8:10) | ($_l_FieldType=Is picture:K8:10)
																	
																	SET BLOB SIZE:C606($_blb_Export; 0)
																	//BLOB TO VARIABLE($_blb_Records;$_blb_Export;$BlobPosition)
																	//DECODE($_blb_Export)
																	$_l_BlobSize2:=BLOB size:C605($_blb_Export)
																	
																	RECEIVE VARIABLE:C81($_Pic_FieldPicture)
																	If ($_t_FieldName#"")
																		$_ptr_Field->:=$_Pic_FieldPicture
																		//BLOB TO PICTURE($_blb_Export;$_ptr_Field->;"JPEG")
																		$_bo_Save:=True:C214
																	Else 
																		If ($_l_FieldType=Is picture:K8:10)
																			$_t_FieldName:="NUL"
																		End if 
																	End if 
																: (Type:C295($_ptr_Field->)=Is boolean:K8:9) | ($_l_FieldType=Is boolean:K8:9)
																	RECEIVE VARIABLE:C81($_bo_ExporBoolean)
																	If ($_t_FieldName#"")
																		//BLOB TO VARIABLE($_blb_Records;$_bo_ExporBoolean;$BlobPosition)
																		$_ptr_Field->:=$_bo_ExporBoolean
																		$_bo_Save:=True:C214
																		If ($_l_FieldType=Is boolean:K8:9)
																			$_t_FieldName:="NUL"
																		End if 
																	End if 
																: (Type:C295($_ptr_Field->)=Is alpha field:K8:1) | ($_l_FieldType=Is string var:K8:2)
																	RECEIVE VARIABLE:C81($_t_ExportText)
																	If ($_t_FieldName#"")
																		//BLOB TO VARIABLE($_blb_Records;$_t_ExportText;$BlobPosition)
																		$_ptr_Field->:=$_t_ExportText
																		$_bo_Save:=True:C214
																	Else 
																		If ($_l_FieldType=Is string var:K8:2)
																			$_t_FieldName:="NUL"
																		End if 
																	End if 
																Else 
																	RECEIVE VARIABLE:C81($_t_ExportText)
																	If ($_t_FieldName#"")
																		//BLOB TO VARIABLE($_blb_Records;$_t_ExportText;$BlobPosition)
																		$_ptr_Field->:=$_t_ExportText
																		$_bo_Save:=True:C214
																	Else 
																		If ($_l_FieldType=Is text:K8:3)
																			$_t_FieldName:="NUL"
																		End if 
																	End if 
															End case 
														End if 
														
													End if 
													
												Until ($_t_FieldName="END_RECORD@") | ($_t_FieldName="") | ($_l_FIeldCounter=$_l_TotalFIelds)
												If ($_bo_Save)
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
												
												
											Until (OK=0)
											
											
											
											
										Until (OK=0)
										
										SET CHANNEL:C77(11)
										
										
									End if 
								End if 
								TBL_EditIndexes($_l_TableNumber; True:C214)
							End if 
							
						Else 
							If (Test path name:C476($_t_DocumentPath+$_t_TableName+".txt")=Is a document:K24:1)
								TBL_EditIndexes($_l_TableNumber; False:C215)
								SET CHANNEL:C77(11)
								SET CHANNEL:C77(10; $_t_DocumentPath+$_t_TableName+".txt")
								
								If (OK=1)
									$_l_DocumentSize:=Get document size:C479($_t_DocumentPath+$_t_TableName+".txt")
									If ($_l_DocumentSize>0)
										GOTO XY:C161(3; 4)
										MESSAGE:C88("Importing data for "+Table name:C256($_l_TableNumber))
										
										RECEIVE VARIABLE:C81($_l_RecordsInSelection)
										If (OK=1)
											RECEIVE VARIABLE:C81($_l_NextSequenceNumber)
											If (OK=1)
												$_bo_ok:=True:C214
												
												ALL RECORDS:C47($_ptr_Table->)
												DELETE SELECTION:C66($_ptr_Table->)
												
												$_l_RecordNumber:=0
												$_l_TicksCount:=Tickcount:C458
												$_l_MessageCounter:=0
												For ($_l_RecordNumber; 1; $_l_RecordsInSelection)
													RECEIVE RECORD:C79(Table:C252($_l_TableNumber)->)
													$_bo_ok:=(OK=1)
													If ($_bo_ok)
														GOTO XY:C161(3; 6)
														MESSAGE:C88("Saving record "+String:C10($_l_RecordNumber)+" of "+String:C10($_l_RecordsInSelection)+" in file.")
														$_l_MessageCounter:=$_l_MessageCounter+1
														If ($_l_MessageCounter>=10)
															$_l_TicksElapsed:=Tickcount:C458-$_l_TicksCount
															$_l_AvePerRecord:=$_l_RecordNumber/$_l_TicksElapsed
															$_l_RecordsToGo:=$_l_RecordsInSelection-$_l_RecordNumber
															$_l_TicksToGo:=$_l_RecordsToGo*$_l_AvePerRecord
															$_l_SecordsToGo:=Int:C8($_l_TicksToGo/60)
															
															$_l_AverageSeconds:=Int:C8((Tickcount:C458-$_l_TicksCount)/$_l_RecordNumber*($_l_RecordsInSelection-$_l_RecordNumber)/60)
															GOTO XY:C161(3; 10)
															MESSAGE:C88("Time to go is approx. "+String:C10($_l_AverageSeconds)+" seconds ...")
															GOTO XY:C161(3; 10)
															MESSAGE:C88("Time to go is approx. "+String:C10($_l_SecordsToGo)+" seconds ...")
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
							//  While (Sequence number($_ptr_Table->)<$_l_NextSequenceNumber)
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
V11Upgrade
ERR_MethodTrackerReturn("TBL_ImportFrom2004_2"; $_t_oldMethodName)
