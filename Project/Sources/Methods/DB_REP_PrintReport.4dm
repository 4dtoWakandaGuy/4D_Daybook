//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_REP_PrintReport
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 29/06/2014 14:03
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(DB_al_CurrentReportSortColumn;0)
	//ARRAY LONGINT(DB_al_ReportSortDirection;0)
	C_BOOLEAN:C305($_bo_PdfOutputOK; $_bo_PrintDone; $_bo_PrintSettingsDisplayed; $_bo_ToPDF; $_bo_ToScreenPreview; SR_bo_PageSetupDisplayed; SR_bo_PageSetupFound)
	C_LONGINT:C283($_l_CopiesIndex; $_l_Destination; $_l_NumberOfCopies; $_l_OK; $_l_Options; $_l_Result; DB_l_ReportType; DBQR_l_EDITORAREA)
	C_TEXT:C284($_t_CurrentPrinter; $_t_DestinationFileName; $_t_ErrorMethodName; $_t_oldMethodName; $_t_oldMethodName2; $_t_PdfOutputFilePath)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("DB_REP_PrintReport")



Case of 
	: (DB_l_ReportType=SuperWrite Report Template)
		QR GET SORTS:C753(DBQR_l_EDITORAREA; DB_al_CurrentReportSortColumn; DB_al_ReportSortDirection)
		QR SET DESTINATION:C745(DBQR_l_EDITORAREA; qr printer:K14903:1)
		QR RUN:C746(DBQR_l_EDITORAREA)
		
		
	: (DB_l_ReportType=SuperReportReport Template)
		If ([DOCUMENTS:7]SR_PreMacro:16#"")
			Macro([DOCUMENTS:7]SR_PreMacro:16)
		End if 
		$_t_ErrorMethodName:=Method called on error:C704
		SR_bo_PageSetupFound:=False:C215
		SR_bo_PageSetupDisplayed:=False:C215
		$_l_OK:=PRINT_SetSIZE("A4"; "P"; [DOCUMENTS:7]Document_Code:1)
		If ($_l_OK>=0)
			$_t_CurrentPrinter:=Get current printer:C788
			$_l_OK:=1
			$_bo_PrintSettingsDisplayed:=False:C215
			If (Not:C34(SR_bo_PageSetupFound))
				If (Not:C34($_bo_PrintSettingsDisplayed))
					PRINT SETTINGS:C106
					$_l_OK:=OK
					$_t_CurrentPrinter:=Get current printer:C788
				Else 
					$_l_OK:=1
				End if 
				
				
				If ($_l_OK=1)
					$_l_NumberOfCopies:=0
					GET PRINT OPTION:C734(Number of copies option:K47:4; $_l_NumberOfCopies)
					If ($_l_NumberOfCopies=0)
						$_l_NumberOfCopies:=1
					End if 
					If (Is macOS:C1572) | (True:C214)
						$_t_CurrentPrinter:=Get current printer:C788
						GET PRINT OPTION:C734(9; $_l_Destination; $_t_DestinationFileName)
						Case of 
							: ($_l_Destination=5)
								$_bo_ToScreenPreview:=True:C214
								$_bo_ToPDF:=False:C215
								
							: ($_l_Destination=3)
								$_bo_ToScreenPreview:=False:C215
								$_bo_ToPDF:=True:C214
								$_t_oldMethodName2:=ERR_MethodTracker("Goes to PDF")
							Else 
								
								$_bo_ToScreenPreview:=False:C215
								$_bo_ToPDF:=False:C215
								$_l_Options:=SRP_Print_4DPageSetup
						End case 
						OK:=1
					Else 
						$_bo_ToScreenPreview:=False:C215
						$_bo_ToPDF:=False:C215
						$_l_Options:=SRP_Print_4DPageSetup
					End if 
				End if 
				//$options:=SRP_Print_4DPageSetup
			Else 
				If (Not:C34($_bo_PrintSettingsDisplayed))
					PRINT SETTINGS:C106
				End if 
				$_l_OK:=ok
				If ($_l_OK=1)
					$_l_NumberOfCopies:=0
					GET PRINT OPTION:C734(Number of copies option:K47:4; $_l_NumberOfCopies)
					If ($_l_NumberOfCopies=0)
						$_l_NumberOfCopies:=1
					End if 
					If (Is macOS:C1572) | (True:C214)
						$_t_CurrentPrinter:=Get current printer:C788
						GET PRINT OPTION:C734(9; $_l_Destination; $_t_DestinationFileName)
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
								$_l_Options:=SRP_Print_4DPageSetup
						End case 
						OK:=1
					Else 
						$_bo_ToScreenPreview:=False:C215
						$_bo_ToPDF:=False:C215
						$_l_Options:=SRP_Print_4DPageSetup
					End if 
				End if 
				
			End if 
			ON ERR CALL:C155("")
			
			If ($_l_OK=1)
				
				If ($_bo_ToPDF) | ($_bo_ToScreenPreview)
					$_t_PdfOutputFilePath:=""
					If ($_bo_ToPDF)
						
						$_t_PdfOutputFilePath:=$_t_DestinationFileName
					End if 
					If ($_t_PdfOutputFilePath#"") | ($_bo_ToScreenPreview)
						$_t_CurrentPrinter:=Get current printer:C788
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
					$_t_CurrentPrinter:=Get current printer:C788
					For ($_l_CopiesIndex; 1; $_l_NumberOfCopies)
						$_l_Result:=SR_Print([DOCUMENTS:7]SR_DOCUMENTXML_:34; 0; SRP_Print_DestinationPrinter+$_l_Options; ""; 0; "")
						
					End for 
					PRT_SetPrinterPaperOptions([DOCUMENTS:7]Document_Code:1)
				End if 
				
			Else 
				$_l_Result:=-1
				
			End if 
		Else 
			$_l_Result:=-1
		End if 
		ON ERR CALL:C155($_t_ErrorMethodName)
		$_bo_PrintDone:=($_l_Result=0)
		
		
		
	Else 
		
		
		
End case 
ERR_MethodTrackerReturn("DB_REP_PrintReport"; $_t_oldMethodName)
