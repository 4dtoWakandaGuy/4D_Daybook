//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Gen_PPSingleEmail
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/06/2014 14:57
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(<>Form4DW)
	//C_UNKNOWN(<>FormWPTit)
	//C_UNKNOWN(<>iOS)
	//C_UNKNOWN(<>SRP262)
	//C_UNKNOWN($0)
	//C_UNKNOWN($11)
	//C_UNKNOWN($13)
	//C_UNKNOWN($14)
	//C_UNKNOWN($15)
	//C_UNKNOWN($2)
	//C_UNKNOWN($3)
	//C_UNKNOWN($4)
	//C_UNKNOWN($6)
	//C_UNKNOWN($7)
	//C_UNKNOWN($8)
	//C_UNKNOWN(DOC_PATHNAME)
	//C_UNKNOWN(k12003)
	//C_UNKNOWN(MYNULL)
	//C_UNKNOWN(SR_Print)
	//C_UNKNOWN(vLayCode)
	//C_UNKNOWN(vText)
	//C_UNKNOWN(Write_2)
	C_BLOB:C604(SR_blb_ReportDataBLOB)
	C_BOOLEAN:C305(<>Form4DW; <>FormWPTit; <>SRP262; $_bo_Continue; $_bo_Continue2; $_bo_Control; $_bo_generatePDFBool; $_bo_Invisible; $_bo_Locked; $_bo_pdfOutputOK; $_bo_PrintSet)
	C_BOOLEAN:C305($_bo_PrintSettingsDisplayed; $_bo_SendEmail; $12; PDF_bo_995Enabled; SR_bo_PageSetupDisplayed; SR_bo_PageSetupFound; SR_bo_Validated; <>Faxing; $_bo_Continue; $_bo_Continue2; $_bo_generatePDFBool)
	C_BOOLEAN:C305($_bo_Invisible; $_bo_Locked; $_bo_pdfOutputOK; $_bo_PrintDone; $_bo_PrintSet; $_bo_PrintSettingsDisplayed; $_bo_SendEmail; PDF_bo_995Enabled; SR_bo_PageSetupDisplayed; SR_bo_PageSetupFound; SR_bo_Validated)
	C_DATE:C307($_d_ModifiedOn; SRDate; $_d_CreatedOn; $_d_ModifiedOn)
	C_LONGINT:C283(<>iOS; $_l_4DWrite; $_l_EmailProcessType; $_l_OK; $_l_PathValid; $_l_PlugAvailable; $_l_ReportOptions; $_l_Result; $_l_Retries; $_l_Set; $0)
	C_LONGINT:C283($8; DOC_l_docDoEmail; DOC_l_docDoEmailInternal; DOC_l_docDoPdf; DOC_l_DocDoPDFInternal; SRPage; SRRecord; WRITE_2; <>FormMethod; $_l_4DWrite; $_l_EmailProcessType)
	C_LONGINT:C283($_l_OK; $_l_PathValid; $_l_PlugAvailable; $_l_ReportOptions; $_l_Result; $_l_Retries; $_l_Set; $_l_TimeOut; DOC_l_docDoEmail; DOC_l_docDoEmailInternal; DOC_l_docDoPdf)
	C_LONGINT:C283(DOC_l_DocDoPDFInternal)
	C_PICTURE:C286(SR_pic_ReportData)
	C_POINTER:C301($_Ptr_SRReportSource; $2; $9; $_Ptr_SRPrint; $_Ptr_SRReportSource)
	C_REAL:C285($1)
	C_TEXT:C284($_t_CurrentErrorMethod; $_t_CurrentFormUsage; $_t_CurrentWindowTitle; $_t_EmailAddress; $_t_ExecuteMethodName; $_t_GenerationType; $_t_oldMethodName; $_t_OSVersionNumber; $_t_pdfOutputFilePath; $_t_StatementPDFPathTxt; $11)
	C_TEXT:C284($13; $14; $15; $16; $3; $4; $5; $6; $7; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
	C_TEXT:C284(DOC_PATHNAME; DOC_t_DocumentName; DOC_t_DocumentNameInternal; DOC_t_OutputFolderPath; DOC_t_OutputFolderPathInternal; MYNULL; PDF_t_CURPDriver; PDF_t_CURPDriver2; PDF_t_CURPName2; PDF_t_CURPType; PDF_t_CURPType2)
	C_TEXT:C284(PDF_t_CURPZone; PDF_t_CURPZone2; vLayCode; vText; <>PER_t_CurrentUserInitials; $_t_CurrentErrorMethod; $_t_CurrentFormUsage; $_t_CurrentWindowTitle; $_t_EmailAddress; $_t_ExecuteMethodName; $_t_GenerationType)
	C_TEXT:C284($_t_oldMethodName; $_t_OSVersionNumber; $_t_pdfOutputFilePath; $_t_StatementPDFPathTxt; $10; $16; $5; DB_t_CurrentFormUsage; DOC_t_DocumentName; DOC_t_DocumentNameInternal; DOC_t_OutputFolderPath)
	C_TEXT:C284(DOC_t_OutputFolderPathInternal; PDF_t_CURPDriver; PDF_t_CURPDriver2; PDF_t_CURPName; PDF_t_CURPName2; PDF_t_CURPType; PDF_t_CURPType2; PDF_t_CURPZone; PDF_t_CURPZone2)
	C_TIME:C306($_ti_ModifiedAt; SRTime; $_ti_CreatedAt; $_ti_ModifiedAt)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("Gen_PPSingleEmail")

//GOTO RECORD($2->;$15)
//investigate
$_l_EmailProcessType:=$1

<>iOS:=Int:C8(Num:C11(DB_GetVersionNum(DBGetOSVersion)))


MYNULL:=""

If (Count parameters:C259>14)  // 05/04/04 pb
	DOC_PATHNAME:=$15
Else 
	DOC_PATHNAME:=""
End if 
$_t_CurrentFormUsage:=DB_t_CurrentFormUsage
DB_t_CurrentFormUsage:=$5
vLayCode:=""
If (Count parameters:C259>6)
	If ($8>0)
		//this is already checked so we could not be here    (see Gen_PPSingle)
		$_bo_Continue2:=True:C214
	Else 
		$_bo_Continue2:=True:C214
	End if 
Else 
	$_bo_Continue2:=True:C214
End if 
If ($_bo_Continue2)
	//do not test for CONTROL KEY!
	// Case of
	//  : ($1=1)  `use 4D write-but save a .doc
	//  $_l_4DWrite:=0
	// : ($1=2)  `print via pdf writer
	
	$_t_StatementPDFPathTxt:=""
	$_l_EmailProcessType:=995
	If ($_l_EmailProcessType=995)  //Wed, Feb 15, 2006 bwalia: using PDF995 check so don't try to use PDF Writer/Direct or anything else
		OK:=1  //means PDF995 is enabled as we checked in GenPPSingle else 995 is not passed on mac 995 mean PictPDF is enabled
	Else 
		
		$_t_OSVersionNumber:="10"
		$_l_OK:=PLUGCALL_PDFs("GETPRINTER"; ->PDF_t_CURPName2; ->PDF_t_CURPType2; ->PDF_t_CURPZone2; ->PDF_t_CURPDriver2)  //out 05/04/04 pb - done in SetMachinePDFWriter
		If (Int:C8(Num:C11($_t_OSVersionNumber))#10)
			$_l_OK:=SetMachinePDFWriter(<>PER_t_CurrentUserInitials)
		Else 
			$_l_OK:=1
		End if 
		$_l_4DWrite:=0
		// End case
		//DOC_PATHNAME:="" moved to top of method 05/04/04 pb
		//$_l_OK:=PLUGCALL_PDFs ("GETPATH";->DOC_PATHNAME)
		$_l_OK:=PLUGCALL_PDFs("GETPATH"; ->DOC_PATHNAME; ->PDF_t_CURPType; ->PDF_t_CURPZone; ->PDF_t_CURPDriver; DOC_PATHNAME)  // 05/04/04 pb
		$_l_PlugAvailable:=PLUGCALL_PDFs("Define"; ->DOC_PATHNAME)
		OK:=$_l_OK
		
	End if 
	
	If (OK=1)
		//-- Fri, Jan 20, 2006 bwalia: PDF995 related stuff -- actually hear
		PDF_bo_995Enabled:=False:C215
		$_bo_generatePDFBool:=False:C215
		$_bo_SendEmail:=DOC_l_docDoEmail=1
		$_bo_SendEmail:=True:C214
		DOC_l_docDoPdf:=1
		//$PRINTCOPY:=DOC_i_SendCopytoPrinter
		//NG May 2007-this should not use the document setting-we are sending an email
		$_bo_generatePDFBool:=((DOC_l_docDoPdf=1) & ($_l_EmailProcessType=995))
		$_bo_generatePDFBool:=(($_bo_generatePDFBool) | ($_bo_SendEmail))
		
		If ($_bo_generatePDFBool=False:C215)  //check internal form report preference are set to print PDF | Email
			$_bo_generatePDFBool:=((DOC_l_DocDoPDFInternal=1) & ($_l_EmailProcessType=995))
			If ($_bo_generatePDFBool)
				$_bo_SendEmail:=DOC_l_docDoEmailInternal=1
				DOC_t_OutputFolderPath:=DOC_t_OutputFolderPathInternal
				DOC_t_DocumentName:=DOC_t_DocumentNameInternal
			End if 
		Else 
			DOC_t_OutputFolderPath:=DOC_t_OutputFolderPathInternal
			
			
			//DOC_t_DocumentName:=DOC_PATHNAME
			DOC_t_DocumentName:=Doc_preferencesFileNameGet(DOC_t_DocumentName)  //kmw 17/10/08 v631b120a (changed to use resolved pdf setting if possible and if only if this is blank then use the default - previously this was the other way around?????)
			
			
		End if 
		
		//*********************************************** kmw 17/10/08 v631b120a ***********************************************
		// (Changed to use resolved pdf setting if possible and if only if this is blank then use the default - previously this was the other way around?????)
		
		//get a filename
		//Case of
		//: (DOC_t_DocumentName#"")
		//DOC_t_DocumentName:=Doc_preferencesFileNameGet (DOC_t_DocumentName)  `resolve tokens like <MMDDYY>
		//
		//Else
		//DOC_t_DocumentName:=DB_t_CurrentFormUsage  `default file name same as DB_t_CurrentFormUsage
		//
		//End case
		
		If (DOC_t_DocumentName="")
			Case of 
				: (DOC_PATHNAME#"")
					DOC_t_DocumentName:=DOC_PATHNAME
				Else 
					DOC_t_DocumentName:=DB_t_CurrentFormUsage  //default file name same as DB_t_CurrentFormUsage
			End case 
			
		End if 
		//***************************************************************************************************************************
		
		If (DOC_t_DocumentName#"")
			$_t_CurrentWindowTitle:=Get window title:C450
			SET WINDOW TITLE:C213(DOC_t_DocumentName)
		End if 
		
		If ((Test path name:C476(DOC_t_OutputFolderPath)#Is a folder:K24:2) | (DOC_t_OutputFolderPath=""))
			
			If (Is macOS:C1572)
				//If (Application type=4D Client )
				//DOC_t_OutputFolderPath:=PathFromPathName (Application file)
				//Else
				//DOC_t_OutputFolderPath:=PathFromPathName (Structure file)
				//End if
				DOC_t_OutputFolderPath:=DB_GetDocumentPath
				DOC_t_OutputFolderPath:=DOC_t_OutputFolderPath+"Daybook_PDFs:"
			Else 
				//If (Application type=4D Client )
				//DOC_t_OutputFolderPath:=PDF995_filePathToDirPath (Application file)
				//Else
				//DOC_t_OutputFolderPath:=PDF995_filePathToDirPath (Structure file)
				//End if
				DOC_t_OutputFolderPath:=DB_GetDocumentPath
				DOC_t_OutputFolderPath:=DOC_t_OutputFolderPath+"Daybook_PDFs\\"
				
			End if 
			
			If (Test path name:C476(DOC_t_OutputFolderPath)#Is a folder:K24:2)
				CREATE FOLDER:C475(DOC_t_OutputFolderPath)
			End if 
		End if 
		
		If ($_bo_generatePDFBool)
			Doc_InitPrintPreferences
			
		End if 
		
		$_t_pdfOutputFilePath:=DOC_t_OutputFolderPath+DOC_t_DocumentName+".PDF"
		//-- Fri, Jan 20, 2006 bwalia: PDF995 related stuff --
		
		If ((<>FormMethod=2) & ($6#""))
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=$6)
		End if 
		$_bo_PrintDone:=False:C215
		If (<>FormMethod=2) & (Records in selection:C76([DOCUMENTS:7])>0) & ($6#"") & (Is macOS:C1572)
			If (<>Form4DW)
				Write_2:=WR New offscreen area:P12000:47  //wr new offscreen area
				WR PICTURE TO AREA:P12000:141(Write_2; [DOCUMENTS:7]Write_:5)
				If ($7#"")
					//$_t_oldMethodName2:=ERR_MethodTracker ("EXECUTE: "+$7)
					//EXECUTE FORMULA($7)
					$_t_ExecuteMethodName:=STR_RemoveLeadTrailSpace($7)
					EXECUTE METHOD:C1007($_t_ExecuteMethodName)
				End if 
				WR SET DOC PROPERTY:P12000:109(Write_2; wr view references:K12003:17; 0)
				WR EXECUTE COMMAND:P12000:113(Write_2; 108)
				$_bo_PrintDone:=True:C214
				//WR O DO COMMAND (Write;111)
				WR DELETE OFFSCREEN AREA:P12000:38(Write_2)
			Else 
				//NG Feb 2007 need to test something here not sure why this first if statement loops to an
				$_l_OK:=0
				
				If ((Count parameters:C259#7) & (Not:C34(Gen_Control)))
					$_l_OK:=PRINT_SetSIZE("A4"; "P"; $3)
					
					If ($_l_OK=1)
						PRINT SETTINGS:C106
						$_l_OK:=OK
					Else 
						$_l_OK:=1
					End if 
				Else 
					$_l_OK:=0
				End if 
				If ($_l_OK=1)
					If ($7#"")
						//$_t_oldMethodName2:=ERR_MethodTracker ("EXECUTE: "+$7)
						//EXECUTE FORMULA($7)
						$_t_ExecuteMethodName:=STR_RemoveLeadTrailSpace($7)
						EXECUTE METHOD:C1007($_t_ExecuteMethodName)
					End if 
					vText:=Replace([DOCUMENTS:7]Text:3)
					If (<>FormWPTit)
						Print form:C5([DOCUMENTS:7]; "Form with Title")
					Else 
						Print form:C5([DOCUMENTS:7]; "Form")
					End if 
					PAGE BREAK:C6
					$_bo_PrintDone:=True:C214
					PRT_SetPrinterPaperOptions($3)  //NG June 2005
				Else 
					$_bo_PrintDone:=False:C215
				End if 
			End if 
			
		Else 
			If (Count parameters:C259>8)
				//here look for a macro
				
				$_bo_Continue:=Form_SRProOK($10+" Email"; $11)
				If (Records in selection:C76([DOCUMENTS:7])=0) | ($_bo_COntinue=False:C215)
					
					$_bo_Continue:=(Form_SRProOK($10; $11))
				End if 
				
				If ($_bo_Continue)
					
					COPY NAMED SELECTION:C331($2->; "$Sel")
					ONE RECORD SELECT:C189($2->)
					OK:=1
					//PRT_GetPrinterPaperOptions ("P";[DOCUMENTS]LDocument_Code)
					If ([DOCUMENTS:7]SR_PreMacro:16#"")
						Macro([DOCUMENTS:7]SR_PreMacro:16)
					End if 
					//PurchOrd_FormSR -NG THIS SHOULD NEVER HAVE BEEN HERE-WHY IS IT HERE!
					Case of   //-- Fri, Jan 20, 2006 bwalia: PDF995 related stuff --
						: (($_bo_generatePDFBool) & ($_l_EmailProcessType=995))  //& (DB_Macintosh ))
							$_bo_pdfOutputOK:=SuperReportToPDF(->[DOCUMENTS:7]Write_:5; $_t_pdfOutputFilePath; False:C215; ->[DOCUMENTS:7]SR_DOCUMENTXML_:34)
							If ($_bo_pdfOutputOK)
								$_bo_PrintDone:=True:C214
								//PRT_SetPrinterPaperOptions ([DOCUMENTS]LDocument_Code)
							End if 
						: ($_l_EmailProcessType=995)  //on windows PDF995 will print to windows and it will be be picked by Daybook
							
							//If (SR Validate (SR_pic_ReportData)=0)
							
							//$_l_Set:=SR Page Setup (SR_pic_ReportData)
							//End if
							If (<>SRP262)
								$_Ptr_SRReportSource:=->[DOCUMENTS:7]SR_DOCUMENT_:4
							Else 
								$_Ptr_SRReportSource:=->[DOCUMENTS:7]Write_:5
							End if 
							If (<>SRP262)
								SR_blb_ReportDataBLOB:=$_Ptr_SRReportSource->
								$_Ptr_SRPrint:=->SR_blb_ReportDataBLOB
							Else 
								SR_pic_ReportData:=$_Ptr_SRReportSource->
								$_Ptr_SRPrint:=->SR_pic_ReportData
							End if   //make a copy of the report, we might modify it
							If (Not:C34(SR_bo_Validated))
								If (<>SRP262)
									SR_blb_ReportDataBLOB:=$_Ptr_SRReportSource->
									$_Ptr_SRPrint:=->SR_blb_ReportDataBLOB
								Else 
									SR_pic_ReportData:=$_Ptr_SRReportSource->
									$_Ptr_SRPrint:=->SR_pic_ReportData
								End if 
								//SR_pic_ReportData:=[DOCUMENTS]Write_  `make a copy of the report, we might modify it
								SR_bo_Validated:=True:C214
								SR_bo_PageSetupFound:=False:C215
								SR_bo_PageSetupDisplayed:=False:C215
								$_l_OK:=PRINT_SetSIZE("A4"; "P"; [DOCUMENTS:7]Document_Code:1)
								If ($_l_OK>=0)
									$_l_OK:=1
									$_bo_PrintSettingsDisplayed:=False:C215
									If (Not:C34(SR_bo_PageSetupFound))
										$_bo_PrintSettingsDisplayed:=True:C214
										PRINT SETTINGS:C106(2)
										$_l_OK:=OK
										$_l_ReportOptions:=SRP_Print_4DPageSetup
										
									Else 
										If (SR_bo_PageSetupDisplayed)
											$_l_OK:=1
											$_l_ReportOptions:=SRP_Print_4DPageSetup
										Else 
											$_l_OK:=1
											$_l_ReportOptions:=SRP_Print_4DPageSetup+2
										End if 
										
									End if 
									
									If ($_l_OK=1)
										$_l_Set:=1
									Else 
										$_l_Set:=-1
									End if 
								Else 
									$_l_Set:=-1
								End if 
							Else 
								$_l_OK:=PRINT_SetSIZE("A4"; "P"; [DOCUMENTS:7]Document_Code:1)
								If ($_l_OK>=0)
									
									$_l_ReportOptions:=SRP_Print_4DPageSetup
								Else 
									$_l_Set:=-1
								End if 
							End if 
							If ($_l_Set=1)
								
								$_t_CurrentErrorMethod:=Method called on error:C704
								ON ERR CALL:C155("")
								
								//$_l_Result:=SR Print Report ($_Ptr_SRPrint->;$_l_ReportOptions;65535)
								$_l_Result:=SR_Print([DOCUMENTS:7]SR_DOCUMENTXML_:34; 0; SRP_Print_DestinationPrinter+$_l_ReportOptions; ""; 0; "")
								
								PRT_SetPrinterPaperOptions([DOCUMENTS:7]Document_Code:1)
								ON ERR CALL:C155($_t_CurrentErrorMethod)
								If ($_l_Result=0)
									$_bo_PrintDone:=True:C214
								End if 
							Else 
								$_bo_PrintDone:=False:C215
							End if 
						: (Gen_Control)
							//SR_pic_ReportData:=[DOCUMENTS]Write_  `make a copy of the report, we might modify it
							//If (SR Validate (SR_pic_ReportData)=0) | (SR Validate (SR_pic_ReportData)=1)
							
							//$_l_Set:=SR Page Setup (SR_pic_ReportData)
							//aElse
							//$_l_Set:=-1
							//End if
							If (<>SRP262)
								$_Ptr_SRReportSource:=->[DOCUMENTS:7]SR_DOCUMENT_:4
							Else 
								$_Ptr_SRReportSource:=->[DOCUMENTS:7]Write_:5
							End if 
							If (<>SRP262)
								SR_blb_ReportDataBLOB:=$_Ptr_SRReportSource->
								$_Ptr_SRPrint:=->SR_blb_ReportDataBLOB
							Else 
								SR_pic_ReportData:=$_Ptr_SRReportSource->
								$_Ptr_SRPrint:=->SR_pic_ReportData
							End if   //
							If (Not:C34(SR_bo_Validated))
								If (<>SRP262)
									SR_blb_ReportDataBLOB:=$_Ptr_SRReportSource->
									$_Ptr_SRPrint:=->SR_blb_ReportDataBLOB
								Else 
									SR_pic_ReportData:=$_Ptr_SRReportSource->
									$_Ptr_SRPrint:=->SR_pic_ReportData
								End if   // `make a copy of the report, we might modify it
								SR_bo_Validated:=True:C214
								$_l_OK:=PRINT_SetSIZE("A4"; "P"; [DOCUMENTS:7]Document_Code:1)
								If ($_l_OK>=0)
									$_l_OK:=1
									$_bo_PrintSettingsDisplayed:=False:C215
									If (Not:C34(SR_bo_PageSetupFound))
										$_bo_PrintSettingsDisplayed:=True:C214
										PRINT SETTINGS:C106(2)
										$_l_OK:=OK
										$_l_ReportOptions:=SRP_Print_4DPageSetup
									Else 
										$_l_OK:=1
										$_l_ReportOptions:=SRP_Print_4DPageSetup+2
									End if 
									
									If ($_l_OK=1)
										$_l_Set:=1
									Else 
										$_l_Set:=-1
									End if 
								Else 
									$_l_Set:=-1
								End if 
							Else 
								$_l_OK:=PRINT_SetSIZE("A4"; "P"; [DOCUMENTS:7]Document_Code:1)
								If ($_l_OK>=0)
									$_l_ReportOptions:=SRP_Print_4DPageSetup
								Else 
									$_l_Set:=-1
								End if 
							End if 
							
							If ($_l_Set=1) | ($_l_Set=0)
								$_t_CurrentErrorMethod:=Method called on error:C704
								ON ERR CALL:C155("")
								
								//$_l_Result:=SR Print Report ($_Ptr_SRPrint->;$_l_ReportOptions;65535)
								$_l_Result:=SR_Print([DOCUMENTS:7]SR_DOCUMENTXML_:34; 0; SRP_Print_DestinationPrinter+$_l_ReportOptions; ""; 0; "")
								
								
								PRT_SetPrinterPaperOptions([DOCUMENTS:7]Document_Code:1)
								ON ERR CALL:C155($_t_CurrentErrorMethod)
								$_bo_PrintDone:=($_l_Result=0)
							Else 
								$_bo_PrintDone:=False:C215
							End if 
						Else 
							//SR_pic_ReportData:=[DOCUMENTS]Write_  `make a copy of the report, we might modify it
							//If (SR Validate (SR_pic_ReportData)=0) | (SR Validate (SR_pic_ReportData)=1)
							
							//$`Set:=SR Page Setup (SR_pic_ReportData)
							//Else
							//$_l_Set:=-1
							//End if
							If (<>SRP262)
								$_Ptr_SRReportSource:=->[DOCUMENTS:7]SR_DOCUMENT_:4
							Else 
								$_Ptr_SRReportSource:=->[DOCUMENTS:7]Write_:5
							End if 
							If (<>SRP262)
								SR_blb_ReportDataBLOB:=$_Ptr_SRReportSource->
								$_Ptr_SRPrint:=->SR_blb_ReportDataBLOB
							Else 
								SR_pic_ReportData:=$_Ptr_SRReportSource->
								$_Ptr_SRPrint:=->SR_pic_ReportData
							End if   //
							If (Not:C34(SR_bo_Validated))
								If (<>SRP262)
									SR_blb_ReportDataBLOB:=$_Ptr_SRReportSource->
									$_Ptr_SRPrint:=->SR_blb_ReportDataBLOB
								Else 
									SR_pic_ReportData:=$_Ptr_SRReportSource->
									$_Ptr_SRPrint:=->SR_pic_ReportData
								End if   //  `make a copy of the report, we might modify it
								SR_bo_Validated:=True:C214
								$_l_OK:=PRINT_SetSIZE("A4"; "P"; [DOCUMENTS:7]Document_Code:1)
								If ($_l_OK>=1)
									$_l_OK:=1
									$_bo_PrintSettingsDisplayed:=False:C215
									If (Not:C34(SR_bo_PageSetupFound))
										$_bo_PrintSettingsDisplayed:=True:C214
										PRINT SETTINGS:C106(2)
										$_l_OK:=OK
										$_l_ReportOptions:=SRP_Print_4DPageSetup
									Else 
										$_l_OK:=1
										$_l_ReportOptions:=SRP_Print_4DPageSetup+2
									End if 
									
									If ($_l_OK=1)
										$_l_Set:=1
									Else 
										$_l_Set:=-1
									End if 
								Else 
									$_l_Set:=-1
								End if 
							Else 
								$_l_OK:=PRINT_SetSIZE("A4"; "P"; [DOCUMENTS:7]Document_Code:1)
								If ($_l_OK>=1)
									$_l_ReportOptions:=SRP_Print_4DPageSetup
								Else 
									$_l_Set:=-1
								End if 
							End if 
							If ($_l_Set=1) | ($_l_Set=0)
								$_t_CurrentErrorMethod:=Method called on error:C704
								ON ERR CALL:C155("")
								
								//$_l_Result:=SR Print Report ($_Ptr_SRPrint->;$_l_ReportOptions;65535)
								$_l_Result:=SR_Print([DOCUMENTS:7]SR_DOCUMENTXML_:34; 0; SRP_Print_DestinationPrinter+$_l_ReportOptions; ""; 0; "")
								
								PRT_SetPrinterPaperOptions([DOCUMENTS:7]Document_Code:1)
								ON ERR CALL:C155($_t_CurrentErrorMethod)
								$_bo_PrintDone:=($_l_Result=0)
							Else 
								$_bo_PrintDone:=False:C215
							End if 
					End case   //-- Fri, Jan 20, 2006 bwalia: PDF995 related stuff --
					// HERE-check if option to print to printere is also selected
					
					If (vLayCode="")
						OK:=0
					Else 
						OK:=1
					End if 
					USE NAMED SELECTION:C332("$Sel")
					CLEAR NAMED SELECTION:C333("$Sel")
				Else 
					$_bo_PrintDone:=True:C214
					FORM SET OUTPUT:C54($2->; $3)
					$_bo_PrintSet:=False:C215
					If ((Count parameters:C259=7) | (Gen_Control))
						$_bo_PrintSet:=True:C214
						//PRINT SETTINGS
						$_l_OK:=PRINT_SetSIZE("A4"; "P"; $3)
						If ($_l_OK>=0)
							$_bo_PrintDone:=True:C214
							PRINT RECORD:C71($2->; *)
						End if 
					Else 
						If (<>iOS#10)  // not Mac OSX 05/04/04 pb
							$_bo_PrintSet:=True:C214
							$_l_OK:=PRINT_SetSIZE("A4"; "P"; $3)
							If ($_l_OK>=0)
								If ($_l_OK=1)
									PRINT SETTINGS:C106
									$_l_OK:=OK
								Else 
									$_l_OK:=1
								End if 
							End if 
						Else 
							$_l_OK:=1
						End if 
						If ($_l_OK=1)
							PRINT RECORD:C71($2->; *)
							$_bo_PrintDone:=True:C214
							If ($_bo_PrintSet)
								PRT_SetPrinterPaperOptions($3)  //NG June 2005
							End if 
						End if 
					End if 
					FORM SET OUTPUT:C54($2->; $3)
				End if 
			Else 
				FORM SET OUTPUT:C54($2->; $3)
				$_bo_PrintDone:=False:C215
				If ((Count parameters:C259=7) | (Gen_Control))
					//   PRINT SETTINGS
					If (<>iOS#10)  // not Mac OSX 05/04/04 pb
						$_l_OK:=PRINT_SetSIZE("A4"; "P"; $3)
						If ($_l_OK>=0)
							PRINT RECORD:C71($2->; *)
							$_bo_PrintDone:=True:C214
						End if 
					End if 
				Else 
					If (<>iOS#10)  // not Mac OSX 05/04/04 pb
						$_l_OK:=PRINT_SetSIZE("A4"; "P"; $3)
						If ($_l_OK>=0)
							If ($_l_OK=1)
								PRINT SETTINGS:C106
								$_l_OK:=OK
							Else 
								$_l_OK:=1
							End if 
						End if 
					Else 
						$_l_OK:=1
					End if 
					If ($_l_OK=1)
						PRINT RECORD:C71($2->; *)
						$_bo_PrintDone:=True:C214
						PRT_SetPrinterPaperOptions($3)  //NG June 2005
					End if 
				End if 
				FORM SET OUTPUT:C54($2->; $4)
			End if 
		End if 
		
		If ($_bo_generatePDFBool) & ($_bo_PrintDone=True:C214)  //NG  January 2007--only pickup if printed  `-- Fri, Jan 20, 2006 bwalia: PDF995 related stuff --
			//PDF995_collectOutput ($_t_pdfOutputFilePath)  //pick up the PDF created by pdf955
			$_bo_pdfOutputOK:=Test path name:C476($_t_pdfOutputFilePath)=Is a document:K24:1
			
		Else 
			$_bo_pdfOutputOK:=Test path name:C476($_t_pdfOutputFilePath)=Is a document:K24:1  //NG January 2007
		End if 
		CLEAR SEMAPHORE:C144("PDF_printing")
		Case of   //-- Fri, Jan 20, 2006 bwalia: PDF995 related stuff --
			: ($_bo_pdfOutputOK)  //if company can receive eMail_Statement than prepare PDF and attach to an email
				MESSAGES OFF:C175
				If ($_bo_SendEmail)
					
					//******************************************************* changed to use new functionality v631b120i 25/11/08 -kmw ******************************************************
					If (Count parameters:C259>15)
						$_t_EmailAddress:=$16
					Else 
						Reports_PrefsGet(->$_t_GenerationType; ->$_t_EmailAddress; [COMPANIES:2]Company_Code:1; [DOCUMENTS:7]Document_Code:1)  //$_t_GenerationType gets ignored...by this stage we have already decided that it is an email (re-finding the email address  is just a ctach as it should have already been found and passed by now....as it is found at the same time that we figure out that we need to be emailing and we shouldn't be in this method unless we have checked this)
						$_t_EmailAddress:=$_t_EmailAddress
					End if 
					//NOTE: DELIBERATELY decided AGAINST using the following line (ie old way of doing it) as a catch all...
					//for instance if email is blank- this is because be have SPECIFIC rules provided for user to set-up....
					//and it is WRONG to overwrite them simply because we decide there MUST be an email address.....
					//ONE OF OUR RULES specificly states carry on anyway even if there is no email address......
					//the only thing we DO need to ensure in this siutation is that there is NO send quietly...
					//ie that it forces it to bring up the email screen...which is a reasonable thing to do if a user...
					//... insists that it should be emnailed even if no email address exists for a company
					
					//$_t_EmailAddress:=Document_GetEmailAddresses ([DOCUMENTS]LDocument_Code;Rep_t_docEmailToTxt;EMAIL_t_DocEmailRoletoText;$14)
					//****************************************************************************************************************************************************************
					
					//TRACE
					
					//C_BOOLEAN(RPT_bo_OverrideEmailScreen)
					
					//If (RPT_bo_OverrideEmailScreen)  `Added 25/11/08 -kmw
					//If ($_t_EmailAddress="")  `if no email address then display email screen even though RPT_bo_OverrideEmailScreen would inidctae user qishes to send quietly (which is set depending on results of earlier confirm message displayed to user)
					//Document_EmailPDF ($_t_pdfOutputFilePath;$_t_EmailAddress;DOC_t_DocumentName;$2)
					//Else
					//needs a quiet version of Document_EmailPDF
					//Document_EmailPDF ($_t_pdfOutputFilePath;$_t_EmailAddress;DOC_t_DocumentName;$2)
					//End if
					//Else
					//TRACE
					Document_EmailPDF($_t_pdfOutputFilePath; $_t_EmailAddress; DOC_t_DocumentName; $2)
					
				Else 
					FileLaunch($_t_pdfOutputFilePath)
				End if   //-- Fri, Jan 20, 2006 bwalia: PDF995 related stuff --
				
			: ($_l_EmailProcessType=995)  //using PDF995 check  `means PDF995 is enabled as we checked in GenPPSingle else 995 is not passed
				//-- Fri, Jan 20, 2006 bwalia: PDF995 related stuff --
				
			Else   //using some other PDF generating process `-- Fri, Jan 20, 2006 bwalia: PDF995 related stuff --
				
				$_l_OK:=PLUGCALL_PDFs("SETPRINTER"; ->PDF_t_CURPName2; ->PDF_t_CURPType2; ->PDF_t_CURPZone2; ->PDF_t_CURPDriver2)
				If (<>iOS>=10)
					SET PRINT OPTION:C733(9; 1)
					
				End if 
				
				$_l_TimeOut:=100
				$_l_Retries:=0
				Repeat 
					$_l_Retries:=$_l_Retries+1
					IDLE:C311
					If (DOC_PathName#"")
						$_l_PathValid:=Test path name:C476(DOC_PathName)
						If ($_l_PathValid#1)
							DelayTicks(60)
						End if 
					Else 
						Repeat 
							IDLE:C311
							GET DOCUMENT PROPERTIES:C477(DOC_PathName; $_bo_Locked; $_bo_Invisible; $_d_CreatedOn; $_ti_CreatedAt; $_d_ModifiedOn; $_ti_ModifiedAt)
							If ($_bo_Locked)
								DelayTicks(60)
							End if 
						Until (Not:C34($_bo_Locked))
					End if 
				Until ($_l_PathValid=1) | ($_l_Retries>$_l_TimeOut)
				
				//now launch the email and add the DOC_PATHNAME
				//as the attachment
				If ($_l_PathValid=1)
					zDiary_inEmail($14; $13; DOC_PathName)
				End if 
		End case 
	End if 
End if 
DB_t_CurrentFormUsage:=$_t_CurrentFormUsage
<>Faxing:=False:C215
If ($_bo_PrintDone)
	$0:=1
Else 
	$0:=0
End if 

If ($_t_CurrentWindowTitle#"")  //restore window title
	SET WINDOW TITLE:C213($_t_CurrentWindowTitle)
End if 
ERR_MethodTrackerReturn("Gen_PPSingleEmail"; $_t_oldMethodName)
