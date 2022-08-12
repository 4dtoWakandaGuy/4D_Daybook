//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_PPMulti
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/06/2014 11:44
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(<>Faxing)
	//C_UNKNOWN(<>FaxMode)
	//C_UNKNOWN(<>FormWPTit)
	//C_UNKNOWN(<>SRP262)
	//C_UNKNOWN($10)
	//C_UNKNOWN($2)
	//C_UNKNOWN($3)
	//C_UNKNOWN($6)
	//C_UNKNOWN($7)
	//C_UNKNOWN($8)
	//C_UNKNOWN($9)
	//C_UNKNOWN(k12003)
	//C_UNKNOWN(SR_Print)
	//C_UNKNOWN(vLayCode)
	//C_UNKNOWN(vText)
	//C_UNKNOWN(Write_2)
	//C_UNKNOWN(xNext)
	ARRAY TEXT:C222($_at_CompanyCodes; 0)
	ARRAY TEXT:C222($_at_ContactFaxNumbers; 0)
	ARRAY TEXT:C222($_at_ContactNames; 0)
	ARRAY TEXT:C222($_at_FaxNumbers; 0)
	C_BOOLEAN:C305(<>Faxing; <>FormWPTit; <>SRP262; $_bo_AskPeriteration; $_bo_AutoIteration; $_bo_Continue; $_bo_OptionKey; $_bo_PdfOutputOK; $_bo_ToPDF; $_bo_ToScreenPreview; $11)
	C_BOOLEAN:C305(SR_bo_PageSetupDisplayed; <>Form4DW; $_bo_AskPeriteration; $_bo_AutoIteration; $_bo_Continue; $_bo_OptionKey; $_bo_PdfOutputOK; $_bo_ToPDF; $_bo_ToScreenPreview; SR_bo_PageSetupDisplayed; SR_bo_PageSetupFound)
	C_DATE:C307(SRDate)
	C_LONGINT:C283(<>FaxMode; <>SYS_l_CancelProcess; $_l_CopiesIndex; $_l_Destination; $_l_Error; $_l_FaxCount; $_l_HandlingOptions; $_l_MultiFaxCount; $_l_NumberofCopies; $_l_OK; $_l_RecordIndex)
	C_LONGINT:C283($_l_RecordsCount; $_l_Result; $0; $7; SRPage; SRRecord; WRITE_2; xNext; <>FormMethod; <>SYS_l_CancelProcess; $_l_CopiesIndex)
	C_LONGINT:C283($_l_Destination; $_l_Error; $_l_FaxCount; $_l_HandlingOptions; $_l_MultiFaxCount; $_l_NumberofCopies; $_l_OK; $_l_RecordIndex; $_l_RecordsCount; $_l_Result)
	C_POINTER:C301($_ptr_ReportField; $8; $_ptr_ReportField; $1)
	C_TEXT:C284($_t_CurrentFormName; $_t_DestinationDocumentName; $_t_Docpath; $_t_DocumentName; $_t_ErrorHandlingMethod; $_t_ExecuteMethodName; $_t_oldMethodName; $_t_PdfOutputFilePath; $10; $12; $2)
	C_TEXT:C284($3; $4; $6; $9; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vLayCode; vText; $_t_CurrentFormName; $_t_DestinationDocumentName)
	C_TEXT:C284($_t_Docpath; $_t_DocumentName; $_t_ErrorHandlingMethod; $_t_ExecuteMethodName; $_t_oldMethodName; $_t_PdfOutputFilePath; $4; $5; DB_t_CurrentFormUsage)
	C_TIME:C306($_ti_DocumentRef; $_ti_DocumentRef; SRTime)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("Gen_PPMulti")



//Gen_PPMulti

$_l_NumberofCopies:=1


$_t_CurrentFormName:=DB_t_CurrentFormUsage
$_bo_OptionKey:=Gen_Option
DB_t_CurrentFormUsage:=$4
vLayCode:=""
Gen_PPMultiCS($1; "PPMulti")

If (OK=1)
	If (Count parameters:C259>6)
		If ($7>0)
			$_bo_Continue:=Gen_PPChkSt($8; $7)
		Else 
			$_bo_Continue:=True:C214
		End if 
	Else 
		$_bo_Continue:=True:C214
	End if 
	If ($_bo_Continue)
		
		OK:=1
		If ($_bo_OptionKey)
			If ((<>FaxMode#0) & (Is Windows:C1573))
				
				If (Not:C34(Macro_AccTypeDEF("Efax_SendMulti")))
					$_l_RecordsCount:=Records in selection:C76($1->)
					ARRAY TEXT:C222($_at_CompanyCodes; $_l_RecordsCount)
					ARRAY TEXT:C222($_at_ContactNames; $_l_RecordsCount)
					ARRAY TEXT:C222($_at_FaxNumbers; $_l_RecordsCount)
					ARRAY TEXT:C222($_at_ContactFaxNumbers; $_l_RecordsCount)
					FIRST RECORD:C50($1->)
					$_l_RecordIndex:=1
					$_l_MultiFaxCount:=0
					$_l_FaxCount:=$_l_RecordsCount
					While ((Not:C34(End selection:C36($1->))) & (<>SYS_l_CancelProcess#Current process:C322))
						//EXECUTE FORMULA($6)
						$_t_ExecuteMethodName:=STR_RemoveLeadTrailSpace($6)
						EXECUTE METHOD:C1007($_t_ExecuteMethodName)
						
						vLayCode:=""
						$_at_CompanyCodes{$_l_RecordIndex}:=[COMPANIES:2]Company_Name:2
						$_at_ContactNames{$_l_RecordIndex}:=[CONTACTS:1]Contact_Name:31
						$_at_FaxNumbers{$_l_RecordIndex}:=Str_TelPrefStri(Str_TelStrip([COMPANIES:2]Fax:10))
						$_at_ContactFaxNumbers{$_l_RecordIndex}:=Str_TelPrefStri(Str_TelStrip([CONTACTS:1]Fax:19))
						If ($_at_ContactFaxNumbers{$_l_RecordIndex}#"")
							If ($_at_FaxNumbers{$_l_RecordIndex}="")
								$_at_FaxNumbers{$_l_RecordIndex}:=$_at_ContactFaxNumbers{$_l_RecordIndex}
							Else 
								$_l_MultiFaxCount:=$_l_MultiFaxCount+1
							End if 
						Else 
							If ($_at_FaxNumbers{$_l_RecordIndex}="")
								$_l_FaxCount:=$_l_FaxCount-1
							End if 
						End if 
						NEXT RECORD:C51($1->)
						$_l_RecordIndex:=$_l_RecordIndex+1
					End while 
					
					$_l_Error:=0
					Case of 
						: (<>FaxMode=1)
							$_l_Error:=Fax_FEStartM1(Fax_SPSubject($5))
						: (<>FaxMode=2)
							$_l_Error:=Fax_SPStartM1(Fax_SPSubject($5))
					End case 
					If ($_l_Error=0)
						
						If ($_l_MultiFaxCount>0)
							Gen_Confirm(String:C10($_l_MultiFaxCount)+" of "+String:C10($_l_RecordsCount)+" Fax Recipents have both a Company and a Contact Fax No.  Which do you want?"; "Contact"; "Company")
							If (OK=1)
								For ($_l_RecordIndex; 1; $_l_RecordsCount)
									$_at_FaxNumbers{$_l_RecordIndex}:=$_at_ContactFaxNumbers{$_l_RecordIndex}
								End for 
							Else 
								OK:=1
							End if 
						End if 
						
						If ($_l_FaxCount<$_l_RecordsCount)
							If ($_l_FaxCount<1)
								Gen_Confirm("You requested Fax-printing, but no valid Fax Nos were found."+"  Do you want to Print instead?"; "Print"; "Cancel")
								Fax_Cancel
								$_bo_OptionKey:=False:C215
							Else 
								Gen_Confirm3("You requested Fax-printing, but only "+String:C10($_l_FaxCount)+" of "+String:C10($_l_RecordsCount)+" valid Fax Nos were found."+"  Do you want to Fax those possible or to Print instead?"; "Fax "+String:C10($_l_FaxCount); "Cancel"; "Print")
								If ((OK=0) | (xNext=1))
									Fax_Cancel
									$_bo_OptionKey:=False:C215
								End if 
							End if 
						Else 
							Gen_Confirm3("You are about Fax "+String:C10($_l_FaxCount)+" Forms to the Fax Nos defined in the database."+Char:C90(13)+"Are you sure this is what you intend?"; "Fax"; "Cancel"; "Print")
							If ((OK=0) | (xNext=1))
								Fax_Cancel
								$_bo_OptionKey:=False:C215
							End if 
						End if 
						
					Else 
						Gen_Confirm("You requested Fax-printing, but could not be connected to a Fax server."+"  Do you want to Print it instead?"; "Print"; "Cancel")
						$_bo_OptionKey:=False:C215
					End if 
				End if 
				
			Else 
				$_bo_OptionKey:=False:C215
			End if 
		End if 
		
		If ($_bo_OptionKey)
			<>Faxing:=True:C214
		End if 
		
		If (OK=1)
			If ((<>FormMethod=2) & ($5#""))
				QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=$5)
			End if 
			If (<>FormMethod=2) & (Records in selection:C76([DOCUMENTS:7])>0) & ($5#"") & (Is macOS:C1572)
				If (<>Form4DW)
					Write_2:=WR New offscreen area:P12000:47  //wr new offscreen area
					WR PICTURE TO AREA:P12000:141(Write_2; [DOCUMENTS:7]Write_:5)
					WR SET SELECTION:P12000:3(Write_2; 0; 0)
					WR INSERT EXPRESSION:P12000:24(Write_2; $6)
					WR SET DOC PROPERTY:P12000:109(Write_2; wr view references:K12003:17; 0)
					WR PRINT MERGE:P12000:5(Write_2; Table:C252($1); 1)
					WR DELETE OFFSCREEN AREA:P12000:38(Write_2)
					
				Else 
					If ($_bo_OptionKey=False:C215)
						$_l_OK:=PRINT_SetSIZE("A4"; "P"; $2)
						If ($_l_OK>=0)
							If ($_l_OK=1)
								PRINT SETTINGS:C106
								$_l_OK:=OK
							Else 
								$_l_OK:=1
							End if 
						Else 
							$_l_OK:=0
						End if 
					End if 
					If ($_l_OK=1)
						
						$_l_RecordIndex:=1
						FIRST RECORD:C50($1->)
						While (Not:C34(End selection:C36($1->)))
							If ($6#"")
								//$_t_oldMethodName2:=ERR_MethodTracker ("EXECUTE: "+$6)
								//EXECUTE FORMULA($6)
								$_t_ExecuteMethodName:=STR_RemoveLeadTrailSpace($6)
								EXECUTE METHOD:C1007($_t_ExecuteMethodName)
							End if 
							vText:=Replace([DOCUMENTS:7]Text:3)
							$_l_Error:=0
							If ($_bo_OptionKey)
								If ($_at_FaxNumbers{$_l_RecordIndex}="")
									$_l_Error:=1
								Else 
									$_l_Error:=Fax_StartM2($_at_CompanyCodes{$_l_RecordIndex}; $_at_ContactNames{$_l_RecordIndex}; $_at_FaxNumbers{$_l_RecordIndex})
								End if 
							End if 
							If ($_l_Error=0)
								If (<>FormWPTit)
									Print form:C5([DOCUMENTS:7]; "Form_With_Title")
								Else 
									Print form:C5([DOCUMENTS:7]; "Form")
								End if 
								PAGE BREAK:C6
								PRT_SetPrinterPaperOptions($2)  //NG June 2005
							End if 
							$_l_RecordIndex:=$_l_RecordIndex+1
							If (($_bo_OptionKey) & (<>FaxMode=2))
								Fax_SPEndM2($_at_CompanyCodes{$_l_RecordIndex})
							End if 
							NEXT RECORD:C51($1->)
						End while 
						
					End if 
				End if 
				
			Else 
				If (Count parameters:C259>8)
					If (Form_SRProOK($9; $10))
						
						//   If ($_bo_OptionKey=False)
						//    $_l_Result:=SR Print Report ([DOCUMENTS]Write_;3;65535)
						//   Else
						FIRST RECORD:C50($1->)
						$_l_RecordIndex:=1
						OK:=1
						$_l_Result:=0
						$_bo_AskPeriteration:=False:C215
						$_bo_AutoIteration:=False:C215
						While ((Not:C34(End selection:C36($1->))) & (OK=1) & ($_l_Result=0) & (<>SYS_l_CancelProcess#Current process:C322))
							COPY NAMED SELECTION:C331($1->; "$Sel")
							ONE RECORD SELECT:C189($1->)
							$_l_Error:=0
							If ($_bo_OptionKey)
								If ($_at_FaxNumbers{$_l_RecordIndex}="")
									$_l_Error:=1
								Else 
									$_l_Error:=Fax_StartM2($_at_CompanyCodes{$_l_RecordIndex}; $_at_ContactNames{$_l_RecordIndex}; $_at_FaxNumbers{$_l_RecordIndex})
								End if 
							End if 
							If ($_l_Error=0)
								If ([DOCUMENTS:7]SR_PreMacro:16#"")
									Macro([DOCUMENTS:7]SR_PreMacro:16)
								End if 
								$_t_ErrorHandlingMethod:=Method called on error:C704
								
								ON ERR CALL:C155("")
								If (<>SRP262)
									$_ptr_ReportField:=->[DOCUMENTS:7]SR_DOCUMENT_:4
								Else 
									$_ptr_ReportField:=->[DOCUMENTS:7]SR_DOCUMENTXML_:34
								End if 
								
								If (($_l_RecordIndex=1) | ($_bo_OptionKey=False:C215))
									SR_bo_PageSetupFound:=False:C215
									SR_bo_PageSetupDisplayed:=False:C215
									$_l_OK:=PRINT_SetSIZE("A4"; "P"; [DOCUMENTS:7]Document_Code:1)
									If ($_l_OK>=0)
										$_l_OK:=1
										If (Not:C34(SR_bo_PageSetupFound))
											If (Not:C34(SR_bo_PageSetupDisplayed))
												
												PRINT SETTINGS:C106
											End if 
											If (OK=1)
												$_l_NumberofCopies:=0
												GET PRINT OPTION:C734(Number of copies option:K47:4; $_l_NumberofCopies)
												If ($_l_NumberofCopies=0)
													$_l_NumberofCopies:=1
												End if 
												If (Is macOS:C1572) | (True:C214)
													
													GET PRINT OPTION:C734(9; $_l_Destination; $_t_DestinationDocumentName)
													Case of 
														: ($_l_Destination=5)
															$_bo_ToScreenPreview:=True:C214
															$_bo_ToPDF:=False:C215
														: ($_l_Destination=3)
															$_bo_ToScreenPreview:=False:C215
															$_bo_ToPDF:=True:C214
															
														Else 
															$_bo_ToScreenPreview:=False:C215
															$_bo_ToPDF:=False:C215
															$_l_HandlingOptions:=SRP_Print_4DPageSetup
													End case 
													OK:=1
												Else 
													$_bo_ToPDF:=False:C215
													$_bo_ToScreenPreview:=False:C215
													$_l_HandlingOptions:=SRP_Print_4DPageSetup
												End if 
												
												$_l_OK:=OK
											End if 
											OK:=1
										Else 
											If (Not:C34(SR_bo_PageSetupDisplayed))
												PRINT SETTINGS:C106
											End if 
											If (OK=1)
												$_l_OK:=1
												$_l_NumberofCopies:=0
												GET PRINT OPTION:C734(Number of copies option:K47:4; $_l_NumberofCopies)
												If ($_l_NumberofCopies=0)
													$_l_NumberofCopies:=1
												End if 
												
												If (Is macOS:C1572) | (True:C214)
													GET PRINT OPTION:C734(9; $_l_Destination; $_t_DestinationDocumentName)
													Case of 
														: ($_l_Destination=5)
															$_bo_ToScreenPreview:=True:C214
															$_bo_ToPDF:=False:C215
														: ($_l_Destination=3)
															$_bo_ToScreenPreview:=False:C215
															$_bo_ToPDF:=True:C214
															
														Else 
															$_l_HandlingOptions:=SRP_Print_4DPageSetup
															$_bo_ToScreenPreview:=False:C215
															$_bo_ToPDF:=False:C215
													End case 
													OK:=1
												Else 
													$_bo_ToScreenPreview:=False:C215
													$_bo_ToPDF:=False:C215
													$_l_HandlingOptions:=SRP_Print_4DPageSetup
												End if 
												$_l_OK:=1
												
											Else 
												$_l_OK:=0
											End if 
											OK:=1
											
										End if 
										
										If (OK=1) & ($_l_OK=1)
											If ($_bo_ToPDF) | ($_bo_ToScreenPreview)
												$_bo_AskPeriteration:=False:C215
												$_bo_AutoIteration:=False:C215
												$_t_PdfOutputFilePath:=""
												If ($_bo_ToPDF)
													If (Records in selection:C76($1->)>1)
														Gen_Confirm("Ask Pdf Name per Document or auto iterate?"; "Auto"; "Ask")
														If (OK=0)
															$_bo_AskPeriteration:=True:C214
															$_bo_AutoIteration:=False:C215
														Else 
															$_bo_AskPeriteration:=False:C215
															$_bo_AutoIteration:=True:C214
														End if 
													End if 
													$_t_PdfOutputFilePath:=$_t_DestinationDocumentName
												End if 
												If ($_t_PdfOutputFilePath#"") | ($_bo_ToScreenPreview)
													For ($_l_CopiesIndex; 1; $_l_NumberofCopies)
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
												If ($_bo_OptionKey)
													For ($_l_CopiesIndex; 1; $_l_NumberofCopies)
														//$_l_Result:=SR Print Report ($_ptr_ReportField->;$_l_HandlingOptions;65535)
														$_l_Result:=SR_Print([DOCUMENTS:7]SR_DOCUMENTXML_:34; 0; SRP_Print_DestinationPrinter+$_l_HandlingOptions; ""; 0; "")
														
													End for 
												Else 
													For ($_l_CopiesIndex; 1; $_l_NumberofCopies)
														//$_l_Result:=SR Print Report ($_ptr_ReportField->;$_l_HandlingOptions;65535)
														$_l_Result:=SR_Print([DOCUMENTS:7]SR_DOCUMENTXML_:34; 0; SRP_Print_DestinationPrinter+$_l_HandlingOptions; ""; 0; "")
														
													End for 
												End if 
												PRT_SetPrinterPaperOptions([DOCUMENTS:7]Document_Code:1)
											End if 
										Else 
											$_l_Result:=-1
										End if 
									Else 
										$_l_Result:=-1
									End if 
								Else 
									//PRINT SETTINGS
									If ($_bo_ToPDF) | ($_bo_ToScreenPreview)
										Case of 
											: ($_bo_AskPeriteration)
												$_t_DocumentName:=Replace string:C233($_t_PdfOutputFilePath; ".PDF"; "")
												$_t_Docpath:=PathFromPathName($_t_DocumentName)
												$_ti_DocumentRef:=DB_CreateDocument(""; ".PDF"; "Name the PDF file"; False:C215; ->$_t_DocumentName; $_t_DocumentName)
												If ($_t_DocumentName#"")
													For ($_l_CopiesIndex; 1; $_l_NumberofCopies)
														$_bo_PdfOutputOK:=SuperReportToPDF(->[DOCUMENTS:7]Write_:5; $_t_DocumentName+".pdf"; False:C215; ->[DOCUMENTS:7]SR_DOCUMENTXML_:34)
														
													End for 
													If ($_bo_PdfOutputOK)
														$_l_Result:=0
														PRT_SetPrinterPaperOptions([DOCUMENTS:7]Document_Code:1)
													Else 
														$_l_Result:=-1
													End if 
												End if 
											: ($_bo_AutoIteration)
												$_t_DocumentName:=Replace string:C233($_t_PdfOutputFilePath; ".PDF"; "")
												For ($_l_CopiesIndex; 1; $_l_NumberofCopies)
													$_bo_PdfOutputOK:=SuperReportToPDF(->[DOCUMENTS:7]Write_:5; $_t_DocumentName+"_"+String:C10($_l_RecordIndex)+".pdf"; False:C215; ->[DOCUMENTS:7]SR_DOCUMENTXML_:34)
												End for 
												If ($_bo_PdfOutputOK)
													$_l_Result:=0
													PRT_SetPrinterPaperOptions([DOCUMENTS:7]Document_Code:1)
												Else 
													$_l_Result:=-1
												End if 
											: ($_bo_ToScreenPreview)
												For ($_l_CopiesIndex; 1; $_l_NumberofCopies)
													$_bo_PdfOutputOK:=SuperReportToPDF(->[DOCUMENTS:7]Write_:5; $_t_PdfOutputFilePath; $_bo_ToScreenPreview; ->[DOCUMENTS:7]SR_DOCUMENTXML_:34)
												End for 
												PRT_SetPrinterPaperOptions([DOCUMENTS:7]Document_Code:1)
												$_l_Result:=0
										End case 
									Else 
										For ($_l_CopiesIndex; 1; $_l_NumberofCopies)
											//$_l_Result:=SR Print Report ($_ptr_ReportField->;SRP_Print_4DPageSetup;65535)
											$_l_Result:=SR_Print([DOCUMENTS:7]SR_DOCUMENTXML_:34; 0; SRP_Print_DestinationPrinter+SRP_Print_4DPageSetup; ""; 0; "")
											
										End for 
										PRT_SetPrinterPaperOptions([DOCUMENTS:7]Document_Code:1)
									End if 
									
								End if 
								
								ON ERR CALL:C155($_t_ErrorHandlingMethod)
								If (vLayCode="")
									OK:=0
								Else 
									OK:=1
								End if 
								//  SRPurge
							End if 
							$_l_RecordIndex:=$_l_RecordIndex+1
							If (($_bo_OptionKey) & (<>FaxMode=2))
								Fax_SPEndM2($_at_CompanyCodes{$_l_RecordIndex})
							End if 
							USE NAMED SELECTION:C332("$Sel")
							NEXT RECORD:C51($1->)
						End while 
						//End if
						If (<>SYS_l_CancelProcess=Current process:C322)
							OK:=0
						End if 
						
					Else 
						
						FORM SET OUTPUT:C54($1->; $2)
						If ($_bo_OptionKey)
							
							FIRST RECORD:C50($1->)
							$_l_RecordIndex:=1
							OK:=1
							While ((Not:C34(End selection:C36($1->))) & (OK=1) & (<>SYS_l_CancelProcess#Current process:C322))
								$_l_Error:=0
								If ($_at_FaxNumbers{$_l_RecordIndex}="")
									$_l_Error:=1
								Else 
									$_l_Error:=Fax_StartM2($_at_CompanyCodes{$_l_RecordIndex}; $_at_ContactNames{$_l_RecordIndex}; $_at_FaxNumbers{$_l_RecordIndex})
								End if 
								If ($_l_Error=0)
									$_l_OK:=PRINT_SetSIZE("A4"; "P"; $2)
									If ($_l_OK>=0)
										PRINT RECORD:C71($1->; *)
									End if 
								End if 
								$_l_RecordIndex:=$_l_RecordIndex+1
								If (($_bo_OptionKey) & (<>FaxMode=2))
									Fax_SPEndM2($_at_CompanyCodes{$_l_RecordIndex})
								End if 
								NEXT RECORD:C51($1->)
							End while 
							
						Else 
							$_l_OK:=PRINT_SetSIZE("A4"; "P"; $2)
							If ($_l_OK>=0)
								PRINT SELECTION:C60($1->)
							End if 
						End if 
						FORM SET OUTPUT:C54($1->; $3)
					End if 
					
				Else 
					FORM SET OUTPUT:C54($1->; $2)
					If ($_bo_OptionKey)
						
						FIRST RECORD:C50($1->)
						$_l_RecordIndex:=1
						OK:=1
						While ((Not:C34(End selection:C36($1->))) & (OK=1) & (<>SYS_l_CancelProcess#Current process:C322))
							$_l_Error:=0
							If ($_at_FaxNumbers{$_l_RecordIndex}="")
								$_l_Error:=1
							Else 
								$_l_Error:=Fax_StartM2($_at_CompanyCodes{$_l_RecordIndex}; $_at_ContactNames{$_l_RecordIndex}; $_at_FaxNumbers{$_l_RecordIndex})
							End if 
							If ($_l_Error=0)
								$_l_OK:=PRINT_SetSIZE("A4"; "P"; $2)
								If ($_l_OK>=0)
									PRINT RECORD:C71($1->; *)
								End if 
							End if 
							$_l_RecordIndex:=$_l_RecordIndex+1
							If (($_bo_OptionKey) & (<>FaxMode=2))
								Fax_SPEndM2($_at_CompanyCodes{$_l_RecordIndex})
							End if 
							NEXT RECORD:C51($1->)
						End while 
						
					Else 
						$_l_OK:=PRINT_SetSIZE("A4"; "P"; $2)
						If ($_l_OK>=0)
							PRINT SELECTION:C60($1->)
						End if 
						
					End if 
					FORM SET OUTPUT:C54($1->; $3)
				End if 
				
			End if 
		End if 
		
		If ($_bo_OptionKey)
			Case of 
				: (<>FaxMode=1)
					PLUGCALL_Chooser("SetChooser")
					
				: (<>FaxMode=2)
					Fax_SPEndM1
			End case 
		End if 
	End if 
End if 
DB_t_CurrentFormUsage:=$_t_CurrentFormName
Gen_PPMultiUS("PPMulti")
<>Faxing:=False:C215
ERR_MethodTrackerReturn("Gen_PPMulti"; $_t_oldMethodName)
