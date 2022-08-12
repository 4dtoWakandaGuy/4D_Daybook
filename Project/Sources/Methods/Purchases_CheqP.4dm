//%attributes = {}
If (False:C215)
	//Project Method Name:      Purchases_CheqP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/12/2009 16:23`Method: Purchases_CheqP
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SRP262; $_bo_AskPerIteration; $_bo_AutoIteration; $_bo_Continue; $_bo_OptionKey; $_bo_PdfOutputOK; $_bo_ToPDF; $_bo_ToScreenPreview; SR_bo_PageSetupDisplayed; SR_bo_PageSetupFound)
	C_DATE:C307(SRDate)
	C_LONGINT:C283($_l_Destination; $_l_Index; $_l_OK; $_l_PageSetupOptions; $_l_Result; $1; $2; SRPage; SRRecord; vSNo)
	C_POINTER:C301($_ptr_SRPrintArea)
	C_TEXT:C284($_t_DestinationDocumentName; $_t_DocPath; $_t_DocumentName; $_t_oldMethodName; $_t_PdfOutputDocPath)
	C_TIME:C306($_ti_DocumentRef; SRTime)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Purchases_CheqP")
If ((DB_GetModuleSettingByNUM(Module_ChequeWriter))>1)
	OK:=1
	If ($1=1)
		Gen_Confirm(Term_SLPLWT("Do you want to print a Cheque?"); "Yes"; "No")
		If (OK=1)
			Purchases_CheqO
			ONE RECORD SELECT:C189([PURCHASE_INVOICES:37])
			If (Form_SRProOK("Cheque"; ""))
				If ([DOCUMENTS:7]SR_PreMacro:16#"")
					Macro([DOCUMENTS:7]SR_PreMacro:16)
				End if 
				//$_t_ErrorMethod:=Method called on error
				//ON ERR CALL("")
				
				If (False:C215)
					If (OK=1)
						If (<>SRP262)
							$_ptr_SRPrintArea:=->[DOCUMENTS:7]SR_DOCUMENT_:4
						Else 
							
							$_ptr_SRPrintArea:=->[DOCUMENTS:7]SR_DOCUMENTXML_:34
						End if 
						//$_l_Index:=SR Print Report ($_ptr_SRPrintArea->;SR Print Option 4DPrintSettings;65535)
						$_l_Result:=SR_Print([DOCUMENTS:7]SR_DOCUMENTXML_:34; 0; SRP_Print_DestinationPrinter+SRP_Print_4DPageSetup; ""; 0; "")
						
						
						
					Else 
						$_l_Index:=-1
					End if 
					//ON ERR CALL($_t_ErrorMethod)
					$_l_OK:=$_l_Index+1  // NG Feb 2007 set to 1 if print is ok
				Else 
					SR_bo_PageSetupFound:=False:C215
					SR_bo_PageSetupDisplayed:=False:C215
					//TRACE
					$_l_OK:=PRINT_SetSIZE("A4"; "L"; [DOCUMENTS:7]Document_Code:1)
					If ($_l_OK>=0)
						If (SR_bo_PageSetupFound=False:C215)
							If (Not:C34(SR_bo_PageSetupDisplayed))
								PRINT SETTINGS:C106
								$_bo_Continue:=(OK=1)
							End if 
							If (OK=1)
								If (Is macOS:C1572) | (True:C214)
									GET PRINT OPTION:C734(9; $_l_Destination; $_t_DestinationDocumentName)
									
									
									//Gen_Confirm ("Print to PDF?";"Yes";"No")
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
											$_l_PageSetupOptions:=SRP_Print_4DPageSetup
											//SR Print Option 4DPrintSettings
									End case 
									OK:=1
								Else 
									$_bo_ToPDF:=False:C215
									$_bo_ToScreenPreview:=False:C215
									$_l_PageSetupOptions:=SRP_Print_4DPageSetup
									//SR Print Option 4DPrintSettings
								End if 
								If ($_bo_ToPDF) | ($_bo_ToScreenPreview)
									$_t_PdfOutputDocPath:=""
									If ($_bo_ToPDF)
										$_t_PdfOutputDocPath:=$_t_DestinationDocumentName
									End if 
									If ($_t_PdfOutputDocPath#"") | ($_bo_ToScreenPreview)
										$_bo_PdfOutputOK:=SuperReportToPDF(->[DOCUMENTS:7]Write_:5; $_t_PdfOutputDocPath; $_bo_ToScreenPreview; ->[DOCUMENTS:7]SR_DOCUMENTXML_:34)
										If ($_bo_PdfOutputOK)
											$_l_Result:=0
										End if 
									Else 
										$_l_Result:=-1
									End if 
								Else 
									//$_l_Result:=SR Print Report (DOCUMENTS]Write_;$_l_PageSetupOptions;65535)
									$_l_Result:=SR_Print([DOCUMENTS:7]SR_DOCUMENTXML_:34; 0; SRP_Print_DestinationPrinter+$_l_PageSetupOptions; ""; 0; "")
									
									PRT_SetPrinterPaperOptions([DOCUMENTS:7]Document_Code:1)
								End if 
								
								
								
								
								
							End if 
						Else 
							
							If (Not:C34(SR_bo_PageSetupDisplayed))
								PRINT SETTINGS:C106
							End if 
							If (OK=1)
								
								
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
											$_l_PageSetupOptions:=SRP_Print_4DPageSetup
											//SR Print Option 4DPrintSettings
											$_bo_ToScreenPreview:=False:C215
											$_bo_ToPDF:=False:C215
									End case 
									OK:=1
								Else 
									$_bo_ToScreenPreview:=False:C215
									$_bo_ToPDF:=False:C215
									$_l_PageSetupOptions:=SRP_Print_4DPageSetup
									//SR Print Option 4DPrintSettings
								End if 
								$_l_OK:=1
								
								
							Else 
								$_l_OK:=0
								$_bo_ToScreenPreview:=False:C215
								$_bo_ToPDF:=False:C215
							End if 
							If ($_l_OK=1)
								If ($_bo_ToPDF) | ($_bo_ToScreenPreview)
									$_t_PdfOutputDocPath:=""
									If ($_bo_ToPDF)
										$_t_PdfOutputDocPath:=$_t_DestinationDocumentName
									End if 
									If ($_t_PdfOutputDocPath#"") | ($_bo_ToScreenPreview)
										
										$_bo_PdfOutputOK:=SuperReportToPDF(->[DOCUMENTS:7]Write_:5; $_t_PdfOutputDocPath; $_bo_ToScreenPreview; ->[DOCUMENTS:7]SR_DOCUMENTXML_:34)
										
										If ($_bo_PdfOutputOK)
											$_l_Result:=0
											PRT_SetPrinterPaperOptions([DOCUMENTS:7]Document_Code:1)
										End if 
									Else 
										$_l_Result:=-1
									End if 
								Else 
									//$_l_Result:=SR Print Report ([DOCUMENTS]Write_;$_l_PageSetupOptions;65535)
									//SRP_Print_DestinationPrinter
									//SR_Print ($pSRXMLPtr->;1;SRP_Print_DestinationPrinter;"";0;"")
									$_l_Result:=SR_Print([DOCUMENTS:7]SR_DOCUMENTXML_:34; 0; SRP_Print_DestinationPrinter+$_l_PageSetupOptions; ""; 0; "")
									
									PRT_SetPrinterPaperOptions([DOCUMENTS:7]Document_Code:1)
								End if 
							End if 
							
						End if 
						
						
					End if 
				End if 
			Else 
				$_l_OK:=PRINT_SetSIZE("A4"; "P"; "Cheques")
				If ($_l_OK>=0)
					If ($_l_OK=1)
						PRINT SETTINGS:C106
						$_l_OK:=OK
					Else 
						$_l_OK:=1
					End if 
					If ($_l_OK=1)
						
						Print form:C5([PURCHASE_INVOICES:37]; "Cheques")
						PAGE BREAK:C6
						PRT_SetPrinterPaperOptions("Cheques")
					End if 
				End if 
			End if 
			
			If ((vSNo>0) & (OK=1) & ($_l_OK=1))  // NG Feb 2007 added this condition-see above
				Gen_Confirm(Term_SLPLWT("Was the Cheque printed correctly?"); "Yes"; "No")
				If (OK=1)
					Purchases_CheqN($2)
				End if 
			End if 
			
		End if 
		
	Else 
		Gen_Confirm(Term_SLPLWT("Do you want to print Cheques?"); "Yes"; "No")
		If (OK=1)
			
			FIRST RECORD:C50([PURCHASE_INVOICES:37])
			Purchases_CheqO
			$_l_Index:=1
			$_bo_OptionKey:=Gen_Option
			If (Form_SRProOK("Cheque"; ""))
				FIRST RECORD:C50([PURCHASE_INVOICES:37])
				While (Not:C34(End selection:C36([PURCHASE_INVOICES:37])))
					If ([DOCUMENTS:7]SR_PreMacro:16#"")
						Macro([DOCUMENTS:7]SR_PreMacro:16)
					End if 
					If (False:C215)
						PRINT SETTINGS:C106
						If (OK=1)
							If (<>SRP262)
								$_ptr_SRPrintArea:=->[DOCUMENTS:7]SR_DOCUMENT_:4
							Else 
								
								$_ptr_SRPrintArea:=->[DOCUMENTS:7]SR_DOCUMENTXML_:34
							End if 
							//$_l_Index:=SR Print Report ($_ptr_SRPrintArea->;SR Print Option 4DPrintSettings;65535)
							$_l_Result:=SR_Print([DOCUMENTS:7]SR_DOCUMENTXML_:34; 0; SRP_Print_DestinationPrinter+SRP_Print_4DPageSetup; ""; 0; "")
							
						Else 
							$_l_Index:=-1
						End if 
					Else 
						If (($_l_Index=1) | ($_bo_OptionKey=False:C215))
							SR_bo_PageSetupFound:=False:C215
							SR_bo_PageSetupDisplayed:=False:C215
							
							
							$_l_OK:=PRINT_SetSIZE("A4"; "L"; [DOCUMENTS:7]Document_Code:1)
							If ($_l_OK>=0)
								If (SR_bo_PageSetupFound=False:C215)
									If (Not:C34(SR_bo_PageSetupDisplayed))
										PRINT SETTINGS:C106
										$_bo_Continue:=(OK=1)
									End if 
								End if 
								If (OK=1)
									If (Is macOS:C1572) | (True:C214)
										GET PRINT OPTION:C734(9; $_l_Destination; $_t_DestinationDocumentName)
										
										
										//Gen_Confirm ("Print to PDF?";"Yes";"No")
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
												$_l_PageSetupOptions:=SRP_Print_4DPageSetup
												//SR Print Option 4DPrintSettings
										End case 
										OK:=1
									Else 
										$_bo_ToPDF:=False:C215
										$_bo_ToScreenPreview:=False:C215
										$_l_PageSetupOptions:=SRP_Print_4DPageSetup
										//SR Print Option 4DPrintSettings
									End if 
									If ($_bo_ToPDF) | ($_bo_ToScreenPreview)
										$_t_PdfOutputDocPath:=""
										If ($_bo_ToPDF)
											$_t_PdfOutputDocPath:=$_t_DestinationDocumentName
											If (Records in selection:C76([PURCHASE_INVOICES:37])>1)
												Gen_Confirm("Ask Pdf Name per Document or auto iterate?"; "Auto"; "Ask")
												If (OK=0)
													$_bo_AskPerIteration:=True:C214
													$_bo_AutoIteration:=False:C215
												Else 
													$_bo_AskPerIteration:=False:C215
													$_bo_AutoIteration:=True:C214
												End if 
											End if 
										End if 
										If ($_t_PdfOutputDocPath#"") | ($_bo_ToScreenPreview)
											$_bo_PdfOutputOK:=SuperReportToPDF(->[DOCUMENTS:7]Write_:5; $_t_PdfOutputDocPath; $_bo_ToScreenPreview; ->[DOCUMENTS:7]SR_DOCUMENTXML_:34)
											
											If ($_bo_PdfOutputOK)
												$_l_Result:=0
											End if 
										Else 
											$_l_Result:=-1
										End if 
									Else 
										//$_l_Result:=SR Print Report ([DOCUMENTS]Write_;$_l_PageSetupOptions;65535)
										$_l_Result:=SR_Print([DOCUMENTS:7]SR_DOCUMENTXML_:34; 0; SRP_Print_DestinationPrinter+$_l_PageSetupOptions; ""; 0; "")
										
										PRT_SetPrinterPaperOptions([DOCUMENTS:7]Document_Code:1)
									End if 
									
									
									
									
									
								End if 
							End if 
						Else 
							If ($_bo_ToPDF) | ($_bo_ToScreenPreview)
								Case of 
									: ($_bo_AskPerIteration)
										$_t_DocumentName:=Replace string:C233($_t_PdfOutputDocPath; ".PDF"; "")
										$_t_DocPath:=PathFromPathName($_t_DocumentName)
										$_ti_DocumentRef:=DB_CreateDocument(""; ".PDF"; "Name the PDF file"; False:C215; ->$_t_DocumentName; $_t_DocumentName)
										If ($_t_DocumentName#"")
											$_bo_PdfOutputOK:=SuperReportToPDF(->[DOCUMENTS:7]Write_:5; $_t_DocumentName+".pdf"; False:C215; ->[DOCUMENTS:7]SR_DOCUMENTXML_:34)
											
											If ($_bo_PdfOutputOK)
												$_l_Result:=0
												PRT_SetPrinterPaperOptions([DOCUMENTS:7]Document_Code:1)
											Else 
												$_l_Result:=-1
											End if 
										End if 
									: ($_bo_AutoIteration)
										$_t_DocumentName:=Replace string:C233($_t_PdfOutputDocPath; ".PDF"; "")
										$_bo_PdfOutputOK:=SuperReportToPDF(->[DOCUMENTS:7]Write_:5; $_t_DocumentName+"_"+String:C10($_l_Index)+".pdf"; False:C215; ->[DOCUMENTS:7]SR_DOCUMENTXML_:34)
										If ($_bo_PdfOutputOK)
											$_l_Result:=0
											PRT_SetPrinterPaperOptions([DOCUMENTS:7]Document_Code:1)
										Else 
											$_l_Result:=-1
										End if 
									: ($_bo_ToScreenPreview)
										$_bo_PdfOutputOK:=SuperReportToPDF(->[DOCUMENTS:7]Write_:5; $_t_PdfOutputDocPath; $_bo_ToScreenPreview; ->[DOCUMENTS:7]SR_DOCUMENTXML_:34)
										PRT_SetPrinterPaperOptions([DOCUMENTS:7]Document_Code:1)
										$_l_Result:=0
								End case 
							Else 
								//$_l_Result:=SR Print Report ($ReportField->;SR Print Option 4DPrintSettings;65535)
								$_l_Result:=SR_Print([DOCUMENTS:7]SR_DOCUMENTXML_:34; 0; SRP_Print_DestinationPrinter; ""; 0; "")
								PRT_SetPrinterPaperOptions([DOCUMENTS:7]Document_Code:1)
							End if 
							
							
							If (Not:C34(SR_bo_PageSetupDisplayed))
								PRINT SETTINGS:C106
							End if 
							If (OK=1)
								
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
											$_l_PageSetupOptions:=SRP_Print_4DPageSetup
											$_bo_ToScreenPreview:=False:C215
											$_bo_ToPDF:=False:C215
									End case 
									OK:=1
								Else 
									$_bo_ToScreenPreview:=False:C215
									$_bo_ToPDF:=False:C215
									$_l_PageSetupOptions:=SRP_Print_4DPageSetup
								End if 
								$_l_OK:=1
								
								
							Else 
								$_l_OK:=0
								$_bo_ToScreenPreview:=False:C215
								$_bo_ToPDF:=False:C215
							End if 
							If ($_l_OK=1)
								If ($_bo_ToPDF) | ($_bo_ToScreenPreview)
									$_t_PdfOutputDocPath:=""
									If ($_bo_ToPDF)
										$_t_PdfOutputDocPath:=$_t_DestinationDocumentName
									End if 
									If ($_t_PdfOutputDocPath#"") | ($_bo_ToScreenPreview)
										
										$_bo_PdfOutputOK:=SuperReportToPDF(->[DOCUMENTS:7]Write_:5; $_t_PdfOutputDocPath; $_bo_ToScreenPreview; ->[DOCUMENTS:7]SR_DOCUMENTXML_:34)
										
										
										If ($_bo_PdfOutputOK)
											$_l_Result:=0
											PRT_SetPrinterPaperOptions([DOCUMENTS:7]Document_Code:1)
										End if 
									Else 
										$_l_Result:=-1
									End if 
								Else 
									//$_l_Result:=SR Print Report ([DOCUMENTS]Write_;$_l_PageSetupOptions;65535)
									$_l_Result:=SR_Print([DOCUMENTS:7]SR_DOCUMENTXML_:34; 0; SRP_Print_DestinationPrinter; ""; 0; "")
									PRT_SetPrinterPaperOptions([DOCUMENTS:7]Document_Code:1)
								End if 
							End if 
							
						End if 
						
						
					End if 
					
					If ($_l_Result#0)
						If ($_l_Result#-1)
							Gen_Confirm("There was an error of type "+String:C10($_l_Index)+"Do you want to continue"; "Stop"; "Continue")
							If (OK=1)
								LAST RECORD:C200([PURCHASE_INVOICES:37])
							End if 
						Else 
							Gen_Alert("Printing cancelled")
							LAST RECORD:C200([PURCHASE_INVOICES:37])
						End if 
					Else 
						$_l_OK:=1
					End if 
					
					NEXT RECORD:C51([PURCHASE_INVOICES:37])
				End while 
				
			Else 
				If ($1=3)
					$_l_OK:=PRINT_SetSIZE("A4"; "P"; "Cheques3")
				Else 
					$_l_OK:=PRINT_SetSIZE("A4"; "P"; "Cheques")
				End if 
				If ($_l_OK>=0)
					If ($_l_OK=1)
						PRINT SETTINGS:C106
						$_l_OK:=OK
					Else 
						$_l_OK:=1
					End if 
					If ($_l_OK=1)
						$_l_Index:=1
						FIRST RECORD:C50([PURCHASE_INVOICES:37])
						While (Not:C34(End selection:C36([PURCHASE_INVOICES:37])))
							If ($_l_Index=3)
								Print form:C5([PURCHASE_INVOICES:37]; "Cheques3")
							Else 
								Print form:C5([PURCHASE_INVOICES:37]; "Cheques")
							End if 
							$_l_Index:=$_l_Index+1
							If ($_l_Index=4)
								$_l_Index:=1
							End if 
							NEXT RECORD:C51([PURCHASE_INVOICES:37])
						End while 
						PAGE BREAK:C6
					End if 
				End if 
			End if 
			
			If ((vSNo>0) & (OK=1) & ($_l_OK=1))
				Gen_Confirm(Term_SLPLWT("Were the Cheques printed correctly?"); "Yes"; "No")
				If (OK=1)
					Purchases_CheqN($2)
				End if 
			End if 
			
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Purchases_CheqP"; $_t_oldMethodName)
