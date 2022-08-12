//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_PrintSelectSRReport
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  25/03/2011 09:21 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(SR_ReportDataXML)
	//ARRAY LONGINT(DB_al_CurrentReportSortColumn;0)
	//ARRAY LONGINT(DB_al_ReportSortDirection;0)
	//ARRAY LONGINT(DB_al_SortOrder;0)
	C_BLOB:C604(SR_blb_ReportDataBLOB)
	C_BOOLEAN:C305(<>SRP262; $_bo_Continue; $_bo_NoScripts; $_bo_PdfOutputOK; $_bo_ToPDF; $_bo_ToScreenPreview; DB_bo_PrintReport; SR_bo_PageSetupDisplayed; SR_bo_PageSetupFound)
	C_LONGINT:C283($_l_CopiesIndex; $_l_Iterations; $_l_NumberOfCopies; $_l_offset; $_l_OK; $_l_Options; $_l_PrintDestination; $_l_RecordsinSelection; $_l_Result; DBQR_l_EDITORAREA; vControl)
	C_POINTER:C301($_ptr_SRData; $_ptr_SRReportSource; $_ptr_table)
	C_TEXT:C284($_t_CurrentPrinter; $_t_DestinationFileName; $_t_ErrorMethodName; $_t_oldMethodName; $_t_PdfOutputFilePath; DB_t_CurrentFormUsage)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_PrintSelectSRReport")
DB_bo_PrintReport:=False:C215
DBI_MenuSelectRecords(Table name:C256(Table:C252(->[DOCUMENTS:7])); True:C214; "Print Report")
//If (DB_bo_PrintReport)
If (Records in selection:C76([DOCUMENTS:7])>=1)
	$_l_RecordsinSelection:=Records in selection:C76([DOCUMENTS:7])
	OK:=1
	//investigate Checked 30/06/2014
	If (OK=1)
		FIRST RECORD:C50([DOCUMENTS:7])
		If (<>SRP262)
			$_ptr_SRReportSource:=->[DOCUMENTS:7]SR_DOCUMENT_:4
			SR_blb_ReportDataBLOB:=[DOCUMENTS:7]SR_DOCUMENT_:4
			$_ptr_SRData:=->SR_blb_ReportDataBLOB
		Else 
			$_ptr_SRReportSource:=->[DOCUMENTS:7]SR_DOCUMENTXML_:34
			SR_ReportDataXML:=[DOCUMENTS:7]SR_DOCUMENTXML_:34  //make a copy of the report, we might modify i
			$_ptr_SRData:=->SR_ReportDataXML
		End if 
		$_l_Result:=0
		While ((OK=1) & (Not:C34(End selection:C36([DOCUMENTS:7])))) & ($_l_Result>=0)
			//DB_l_ReportType:=SuperReportReport Template
			//DB_l_ReportType:=SuperWrite Report Template
			
			If ([DOCUMENTS:7]Document_Class:14=SuperReportReport Template) | ([DOCUMENTS:7]Document_Code:1="SR @")
				
				If (DB_t_CurrentFormUsage="Mail")
					LOAD RECORD:C52([DOCUMENTS:7])
					If (<>SRP262)
						$_ptr_SRReportSource:=->[DOCUMENTS:7]SR_DOCUMENT_:4
						SR_blb_ReportDataBLOB:=[DOCUMENTS:7]SR_DOCUMENT_:4
						$_ptr_SRData:=->SR_blb_ReportDataBLOB
					Else 
						$_ptr_SRReportSource:=->[DOCUMENTS:7]SR_DOCUMENTXML_:34
						SR_ReportDataXML:=[DOCUMENTS:7]SR_DOCUMENTXML_:34  //make a copy of the report, we might modify i
						$_ptr_SRData:=->SR_ReportDataXML
					End if 
					//$res:=SR Main Table ($_ptr_SRReport->;2;vControl;"")
					//SR_SetLongProperty (DB_l_SRAREA;SRP_DataSource_Source;2)
					//SR_SetLongProperty ($report;$object;SRP_DataSource_Iterations;$_l_Iterations)
					//SR_SetLongProperty ($_ptr_SRReport->;SRP_DataSource_Iterations;vControl)
					SR_SetLongProperty($_ptr_SRData->; vControl; SRP_DataSource_Iterations)
					
					$_ptr_SRReportSource->:=$_ptr_SRData->
					DB_SaveRecord(->[DOCUMENTS:7])
				Else 
					If ([DOCUMENTS:7]Document_Font_Size:8>1)
						If (<>SRP262)
							$_ptr_SRReportSource:=->[DOCUMENTS:7]SR_DOCUMENT_:4
							SR_blb_ReportDataBLOB:=[DOCUMENTS:7]SR_DOCUMENT_:4
							$_ptr_SRData:=->SR_blb_ReportDataBLOB
						Else 
							$_ptr_SRReportSource:=->[DOCUMENTS:7]SR_DOCUMENTXML_:34
							SR_ReportDataXML:=[DOCUMENTS:7]SR_DOCUMENTXML_:34  //make a copy of the report, we might modify i
							$_ptr_SRData:=->SR_ReportDataXML
						End if 
						$_ptr_table:=Table:C252([DOCUMENTS:7]Table_Number:11)
						$_l_RecordsinSelection:=Records in selection:C76($_ptr_table->)
						$_l_Iterations:=(Int:C8($_l_RecordsinSelection/[DOCUMENTS:7]Document_Font_Size:8)+Num:C11(Int:C8($_l_RecordsinSelection/[DOCUMENTS:7]Document_Font_Size:8)#($_l_RecordsinSelection/[DOCUMENTS:7]Document_Font_Size:8)))
						//SR_SetLongProperty (DB_l_SRAREA;SRP_DataSource_ource;$_l_RecordsinSelection)
						
						//SR_SetLongProperty ($_ptr_SRReport->;SRP_DataSource_Iterations;$_l_Iterations)
						SR_SetLongProperty($_ptr_SRData->; $_l_Iterations; SRP_DataSource_Iterations)
						
						//$res:=SR Main Table ($_ptr_SRReport->;2;$_l_RecordsinSelection;"")
						$_ptr_SRReportSource->:=$_ptr_SRData->
						DB_SaveRecord(->[DOCUMENTS:7])
					End if 
				End if 
				If ([DOCUMENTS:7]SR_PreMacro:16#"")
					Macro([DOCUMENTS:7]SR_PreMacro:16)
				End if 
				$_t_ErrorMethodName:=Method called on error:C704
				ON ERR CALL:C155("")
				$_t_CurrentPrinter:=""
				$_bo_NoScripts:=True:C214
				QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1="PS"+[DOCUMENTS:7]Document_Code:1)
				If (Records in selection:C76([SCRIPTS:80])>0)
					$_t_CurrentPrinter:=Get current printer:C788
					Macro("PS"+[DOCUMENTS:7]Document_Code:1)
					$_bo_NoScripts:=False:C215
				Else 
					QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1="PSall")
					If (Records in selection:C76([SCRIPTS:80])>0)
						$_t_CurrentPrinter:=Get current printer:C788
						Macro("PSall")
						
						$_bo_NoScripts:=False:C215
					End if 
				End if 
				//Gen_Alert ("point 1")  `7/1/2010
				If (<>SRP262)
					$_ptr_SRReportSource:=->[DOCUMENTS:7]SR_DOCUMENT_:4
					SR_blb_ReportDataBLOB:=[DOCUMENTS:7]SR_DOCUMENT_:4
					$_ptr_SRData:=->SR_blb_ReportDataBLOB
				Else 
					$_ptr_SRReportSource:=->[DOCUMENTS:7]SR_DOCUMENTXML_:34
					SR_ReportDataXML:=[DOCUMENTS:7]SR_DOCUMENTXML_:34  //make a copy of the report, we might modify i
					$_ptr_SRData:=->SR_ReportDataXML
				End if 
				
				//If (SR Validate (SR_pic_ReportData)=0)
				SR_bo_PageSetupFound:=False:C215
				SR_bo_PageSetupDisplayed:=False:C215
				//TRACE
				$_l_OK:=PRINT_SetSIZE("A4"; "P"; [DOCUMENTS:7]Document_Code:1)
				If ($_l_OK>=0)
					If (SR_bo_PageSetupFound=False:C215)
						If (Not:C34(SR_bo_PageSetupDisplayed))
							PRINT SETTINGS:C106
							$_bo_Continue:=(OK=1)
						End if 
						If (OK=1)
							$_l_NumberOfCopies:=0
							GET PRINT OPTION:C734(Number of copies option:K47:4; $_l_NumberOfCopies)
							If ($_l_NumberOfCopies=0)
								$_l_NumberOfCopies:=1
							End if 
							If (Is macOS:C1572) | (True:C214)
								GET PRINT OPTION:C734(9; $_l_PrintDestination; $_t_DestinationFileName)
								
								
								//Gen_Confirm ("Print to PDF?";"Yes";"No")
								Case of 
									: ($_l_PrintDestination=5)
										$_bo_ToScreenPreview:=True:C214
										$_bo_ToPDF:=False:C215
									: ($_l_PrintDestination=3)
										$_bo_ToScreenPreview:=False:C215
										$_bo_ToPDF:=True:C214
										
									Else 
										$_bo_ToScreenPreview:=False:C215
										$_bo_ToPDF:=False:C215
										$_l_Options:=SRP_Print_4DPageSetup
								End case 
								OK:=1
							Else 
								$_bo_ToPDF:=False:C215
								$_bo_ToScreenPreview:=False:C215
								$_l_Options:=SRP_Print_4DPageSetup
							End if 
							If ($_bo_ToPDF) | ($_bo_ToScreenPreview)
								$_t_PdfOutputFilePath:=""
								If ($_bo_ToPDF)
									$_t_PdfOutputFilePath:=$_t_DestinationFileName
								End if 
								If ($_t_PdfOutputFilePath#"") | ($_bo_ToScreenPreview)
									For ($_l_CopiesIndex; 1; $_l_NumberOfCopies)
										$_bo_PdfOutputOK:=SuperReportToPDF(->[DOCUMENTS:7]Write_:5; $_t_PdfOutputFilePath; $_bo_ToScreenPreview; ->[DOCUMENTS:7]SR_DOCUMENTXML_:34)
									End for 
									If ($_bo_PdfOutputOK)
										$_l_Result:=0
									End if 
								Else 
									$_l_Result:=-1
								End if 
							Else 
								For ($_l_CopiesIndex; 1; $_l_NumberOfCopies)
									$_l_Result:=SR_Print([DOCUMENTS:7]SR_DOCUMENTXML_:34; 0; SRP_Print_DestinationPrinter+$_l_Options; ""; 0; "")
									
									
								End for 
								PRT_SetPrinterPaperOptions([DOCUMENTS:7]Document_Code:1)
							End if 
							
							
							
							
							
						End if 
					Else 
						
						If (Not:C34(SR_bo_PageSetupDisplayed))
							PRINT SETTINGS:C106
						End if 
						If (OK=1)
							$_l_NumberOfCopies:=0
							GET PRINT OPTION:C734(Number of copies option:K47:4; $_l_NumberOfCopies)
							If ($_l_NumberOfCopies=0)
								$_l_NumberOfCopies:=1
							End if 
							If ($_bo_NoScripts)
								
								If (Is macOS:C1572) | (True:C214)
									GET PRINT OPTION:C734(9; $_l_PrintDestination; $_t_DestinationFileName)
									Case of 
										: ($_l_PrintDestination=5)
											$_bo_ToScreenPreview:=True:C214
											$_bo_ToPDF:=False:C215
										: ($_l_PrintDestination=3)
											$_bo_ToScreenPreview:=False:C215
											$_bo_ToPDF:=True:C214
											
										Else 
											$_l_Options:=SRP_Print_4DPageSetup
											$_bo_ToScreenPreview:=False:C215
											$_bo_ToPDF:=False:C215
									End case 
									OK:=1
								Else 
									$_bo_ToScreenPreview:=False:C215
									$_bo_ToPDF:=False:C215
									$_l_Options:=SRP_Print_4DPageSetup
								End if 
								$_l_OK:=1
								
							Else 
								$_l_OK:=1
								$_bo_ToScreenPreview:=False:C215
								$_bo_ToPDF:=False:C215
								$_l_Options:=SRP_Print_4DPageSetup
							End if 
						Else 
							$_l_NumberOfCopies:=0
							GET PRINT OPTION:C734(Number of copies option:K47:4; $_l_NumberOfCopies)
							If ($_l_NumberOfCopies=0)
								$_l_NumberOfCopies:=1
							End if 
							$_l_OK:=0
							$_bo_ToScreenPreview:=False:C215
							$_bo_ToPDF:=False:C215
						End if 
						If ($_l_OK=1)
							If ($_bo_ToPDF) | ($_bo_ToScreenPreview)
								$_t_PdfOutputFilePath:=""
								If ($_bo_ToPDF)
									$_t_PdfOutputFilePath:=$_t_DestinationFileName
								End if 
								If ($_t_PdfOutputFilePath#"") | ($_bo_ToScreenPreview)
									For ($_l_CopiesIndex; 1; $_l_NumberOfCopies)
										$_bo_PdfOutputOK:=SuperReportToPDF(->[DOCUMENTS:7]Write_:5; $_t_PdfOutputFilePath; $_bo_ToScreenPreview; ->[DOCUMENTS:7]SR_DOCUMENTXML_:34)
									End for 
									If ($_bo_PdfOutputOK)
										$_l_Result:=0
										PRT_SetPrinterPaperOptions([DOCUMENTS:7]Document_Code:1)
									End if 
								Else 
									$_l_Result:=-1
								End if 
							Else 
								For ($_l_CopiesIndex; 1; $_l_NumberOfCopies)
									$_l_Result:=SR_Print([DOCUMENTS:7]SR_DOCUMENTXML_:34; 0; SRP_Print_DestinationPrinter+$_l_Options; ""; 0; "")
									
								End for 
								PRT_SetPrinterPaperOptions([DOCUMENTS:7]Document_Code:1)
							End if 
						End if 
						
					End if 
					If ($_t_CurrentPrinter#"")
						SET CURRENT PRINTER:C787($_t_CurrentPrinter)
					End if 
					ON ERR CALL:C155($_t_ErrorMethodName)
				End if 
			Else 
				DBQR_l_EDITORAREA:=QR New offscreen area:C735
				QR BLOB TO REPORT:C771(DBQR_l_EDITORAREA; [DOCUMENTS:7]DOC_BLOB:17)
				ARRAY LONGINT:C221(DB_al_CurrentReportSortColumn; 0)
				ARRAY LONGINT:C221(DB_al_SortOrder; 0)
				$_l_offset:=0
				BLOB TO VARIABLE:C533([DOCUMENTS:7]Options:32; DB_al_CurrentReportSortColumn; $_l_offset)
				If ($_l_offset<BLOB size:C605([DOCUMENTS:7]Options:32))
					BLOB TO VARIABLE:C533([DOCUMENTS:7]Options:32; DB_al_SortOrder; $_l_offset)
					
				Else 
					ARRAY LONGINT:C221(DB_al_SortOrder; Size of array:C274(DB_al_CurrentReportSortColumn))
					
				End if 
				QR SET SORTS:C752(DBQR_l_EDITORAREA; DB_al_CurrentReportSortColumn; DB_al_SortOrder)
				
				
				QR GET SORTS:C753(DBQR_l_EDITORAREA; DB_al_CurrentReportSortColumn; DB_al_ReportSortDirection)
				QR SET DESTINATION:C745(DBQR_l_EDITORAREA; qr printer:K14903:1)
				QR RUN:C746(DBQR_l_EDITORAREA)
				QR DELETE OFFSCREEN AREA:C754(DBQR_l_EDITORAREA)
				
				
			End if 
			
			NEXT RECORD:C51([DOCUMENTS:7])
		End while 
	End if 
End if 
//End if
ERR_MethodTrackerReturn("DB_PrintSelectSRReport"; $_t_oldMethodName)
