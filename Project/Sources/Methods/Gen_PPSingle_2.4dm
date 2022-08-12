//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_PPSingle_2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/07/2014 17:20
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(<>Form4DW)
	//C_UNKNOWN(<>FormMethod)
	//C_UNKNOWN(<>FormWPTit)
	//C_UNKNOWN(<>SRP262)
	//C_UNKNOWN(<>TextSize)
	//C_UNKNOWN($_14)
	//C_UNKNOWN($0)
	//C_UNKNOWN(MYNULL)
	//C_UNKNOWN(PRT_Count)
	//C_UNKNOWN(SR_Print)
	//C_UNKNOWN(SR_ReportDataXML)
	//C_UNKNOWN(vLayCode)
	//C_UNKNOWN(vt)
	//C_UNKNOWN(Vt_Line)
	//C_UNKNOWN(vText)
	//C_UNKNOWN(WR DELETE OFFSCREEN AREA)
	//C_UNKNOWN(WR PICTURE TO AREA)
	//C_UNKNOWN(Write_2)
	//C_UNKNOWN(xCancel)
	//C_UNKNOWN(xNext)
	ARRAY TEXT:C222($_at_TextArray; 0)
	C_BLOB:C604(SR_blb_ReportDataBLOB)
	C_BOOLEAN:C305(<>Form4DW; <>FormWPTit; <>SRP262; $_bo_AskPerIteration; $_bo_AutoIteration; $_bo_ByPassEmailOption; $_bo_Continue; $_bo_GeneratePDF; $_bo_OptionKey; $_bo_PdfOutputOK; $_bo_PrintDone)
	C_BOOLEAN:C305($_bo_PrintSettingsDisplayed; $_bo_ReportEmailError; $_bo_SendEMail; $_bo_SendEmailInternal; $_bo_SkipEmail; $_bo_SuperReportFound; $_bo_SuperReportFoundOK; $_bo_SuperReportOK; $_bo_ToPDF; $_bo_ToScreenPreview; $0)
	C_BOOLEAN:C305($13; PRT_bo_AskPerIteration; PRT_bo_AutoIteration; PRT_bo_HasBreakFooter; PRT_bo_ToPdf; PRT_bo_ToScreenPreview; SR_bo_PageSetupDisplayed; SR_bo_PageSetupFound; SR_bo_Validated; <>Faxing; $_bo_AskPerIteration)
	C_BOOLEAN:C305($_bo_AutoIteration; $_bo_ByPassEmailOption; $_bo_Continue; $_bo_GeneratePDF; $_bo_OptionKey; $_bo_PdfOutputOK; $_bo_PrintDone; $_bo_PrintSettingsDisplayed; $_bo_ReportEmailError; $_bo_SendEMail; $_bo_SendEmailInternal)
	C_BOOLEAN:C305($_bo_SkipEmail; $_bo_SuperReportFound; $_bo_SuperReportFoundOK; $_bo_ToPDF; $_bo_ToScreenPreview; $13; PRT_bo_AskPerIteration; PRT_bo_AutoIteration; PRT_bo_HasBreakFooter; PRT_bo_ToPdf; PRT_bo_ToScreenPreview)
	C_BOOLEAN:C305(SR_bo_PageSetupDisplayed; SR_bo_PageSetupFound; SR_bo_Validated)
	C_DATE:C307(SRDate)
	C_LONGINT:C283(<>FormMethod; <>TextSize; $_14; $_l_ArrayIndex; $_l_Destination; $_l_docDoEmail; $_l_docDoPdf; $_l_Email; $_l_Error; $_l_MaxPrrintHeight; $_l_NumberofCopies)
	C_LONGINT:C283($_l_OK; $_l_PageSetupOptions; $_l_PrintableWidth; $_l_Printed; $_l_PrintedHeight; $_l_PrintIndex; $_l_PrintoutIndex; $_l_RecordState; $_l_Result; $_l_Set; $9)
	C_LONGINT:C283(DOC_l_CopyToPrinter; DOC_l_docDoEmail; DOC_l_docDoEmailInternal; DOC_l_docDoPdf; DOC_l_DocDoPrint; PRT_Count; PRT_l_FooterSize; PRT_l_HeaderSize; PRT_l_MaxSize; PRT_l_PageNo; SRPage)
	C_LONGINT:C283(SRRecord; WRITE_2; xCancel; xNext; <>FaxMode; $_l_ArrayIndex; $_l_Destination; $_l_docDoEmail; $_l_docDoPdf; $_l_Email; $_l_Error)
	C_LONGINT:C283($_l_MaxPrrintHeight; $_l_NumberofCopies; $_l_OK; $_l_PageSetupOptions; $_l_PrintableWidth; $_l_Printed; $_l_PrintedHeight; $_l_PrintIndex; $_l_PrintoutIndex; $_l_RecordState; $_l_Result)
	C_LONGINT:C283($_l_Set; $14; $9; DOC_l_CopyToPrinter; DOC_l_docDoEmailInternal; DOC_l_DocDoPrint; PRT_l_FooterSize; PRT_l_HeaderSize; PRT_l_MaxSize; PRT_l_PageNo; PRT_l_PrintedLines)
	C_PICTURE:C286(SR_pic_ReportData)
	C_POINTER:C301($_ptr_RecordStateField; $_ptr_ReportFIeld; $_ptr_SRPrint; $_ptr_Table1; $_ptr_Table2; $1; $10; $2; $_ptr_RecordStateField; $_ptr_ReportFIeld; $_ptr_SRPrint)
	C_POINTER:C301($_ptr_Table1; $_ptr_Table2; $1; $10; $2)
	C_TEXT:C284($_t_15; $_t_16; $_t_AnalysisCode; $_t_ContactFaxNumber; $_t_ContactName; $_t_CurrentFormName; $_t_DestinationFileName; $_t_DocumentName; $_t_EmailAddress; $_t_ErrorMethod; $_t_ExecuteMethodName)
	C_TEXT:C284($_t_FaxNumber; $_t_FileName; $_t_FormName; $_t_GenerationType; $_t_HeaderName; $_t_oldMethodName; $_t_OutputFormName; $_t_PDFOutputFilePath; $_t_PrintFormMethod; $_t_PrintFormName; $_t_PrintFormName2)
	C_TEXT:C284($_t_PrintTitle; $11; $12; $15; $16; $3; $4; $5; $6; $7; $8)
	C_TEXT:C284(DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; DOC_t_DocEmailFrom; DOC_t_DocumentName; DOC_t_EmailBodyReport; DOC_t_EmailSubject; DOC_t_TemplateCode; EMAIL_t_DocEmailRoletoText; MYNULL; PRT_t_pdfOutputFilePath)
	C_TEXT:C284(vLayCode; vt; Vt_Line; vText; <>FormFont; $_t_15; $_t_16; $_t_AnalysisCode; $_t_ContactFaxNumber; $_t_ContactName; $_t_CurrentFormName)
	C_TEXT:C284($_t_DestinationFileName; $_t_DocumentName; $_t_EmailAddress; $_t_ErrorMethod; $_t_ExecuteMethodName; $_t_FaxNumber; $_t_FileName; $_t_FormName; $_t_GenerationType; $_t_HeaderName; $_t_oldMethodName)
	C_TEXT:C284($_t_OutputFormName; $_t_PDFOutputFilePath; $_t_PrintFormMethod; $_t_PrintFormName; $_t_PrintFormName2; $_t_PrintTitle; $11; $12; $15; $16; $3)
	C_TEXT:C284($4; $5; $6; $7; $8; DB_t_CurrentFormUsage; DOC_t_DocEmailFrom; DOC_t_DocumentName; DOC_t_EmailBodyReport; DOC_t_EmailSubject; DOC_t_TemplateCode)
	C_TEXT:C284(EMAIL_t_DocEmailRoletoText; PRT_t_pdfOutputFilePath; Rep_t_docEmailToTxt)
	C_TIME:C306($_ti_DocumentRef; SRTime; $_ti_DocumentRef)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("Gen_PPSingle_2")

$_l_NumberofCopies:=1
$0:=True:C214

//Method Gen_PPSingle_2
//this is a modification to Gen_PPSingle
//it is needed because GEn_ppSingle does not always work correctly
//if there is a subform in the print record-for printing subrecords
//and the information 'spills' past the end of the printable area some of the
//subrecords do not print
//the method addresses this printing problem
//by not using PRINT RECORD
//instead it uses PRINT FORM
//this prints the DETAIL area of the form
//so there are seperate forms for the header, body and footer sections
//we control the itterations of the subform section and printing multiple footers

MYNULL:=""
//TRACE
//investigate

$_ptr_Table1:=->MyNull
$_t_PrintFormName:=""
$_t_OutputFormName:=""
$_t_FormName:=""
$_t_PrintTitle:=""
$_t_PrintFormMethod:=""
$_l_RecordState:=0
$_ptr_RecordStateField:=->MYNull
$_t_PrintFormName2:=""
$_t_AnalysisCode:=""
$_bo_ReportEmailError:=False:C215
//note that $13($_bo_ReportEmailError) is used for email error message
$_14:=0
$_t_15:=""  //Added -kmw 27/11/08 v631b120i (allow passing an email type directly to this method which will override standard (old) email retreival functionality)

$_t_16:=""  //Added -kmw 25/11/08 v631b120i (allow passing an email address directly to this method which will override standard (old) email retreival functionality)

Case of 
	: (Count parameters:C259=1)
		$_ptr_Table1:=$1
	: (Count parameters:C259=2)
		$_ptr_Table1:=$1
		$_ptr_Table2:=$2
	: (Count parameters:C259=3)
		$_ptr_Table1:=$1
		$_ptr_Table2:=$2
		$_t_PrintFormName:=$3
		
	: (Count parameters:C259=4)
		$_ptr_Table1:=$1
		$_ptr_Table2:=$2
		$_t_PrintFormName:=$3
		$_t_PrintFormName2:=$4
		
	: (Count parameters:C259=5)
		$_ptr_Table1:=$1
		$_ptr_Table2:=$2
		$_t_PrintFormName:=$3
		$_t_PrintFormName2:=$4
		$_t_OutputFormName:=$5
		
		
	: (Count parameters:C259=6)
		$_ptr_Table1:=$1
		$_ptr_Table2:=$2
		$_t_PrintFormName:=$3
		$_t_PrintFormName2:=$4
		$_t_OutputFormName:=$5
		$_t_FormName:=$6
		
	: (Count parameters:C259=7)
		$_ptr_Table1:=$1
		$_ptr_Table2:=$2
		$_t_PrintFormName:=$3
		$_t_PrintFormName2:=$4
		$_t_OutputFormName:=$5
		$_t_FormName:=$6
		$_t_PrintTitle:=$7
	: (Count parameters:C259=8)
		$_ptr_Table1:=$1
		$_ptr_Table2:=$2
		$_t_PrintFormName:=$3
		$_t_PrintFormName2:=$4
		$_t_OutputFormName:=$5
		$_t_FormName:=$6
		$_t_PrintTitle:=$7
		$_t_PrintFormMethod:=$8
	: (Count parameters:C259=9)
		$_ptr_Table1:=$1
		$_ptr_Table2:=$2
		$_t_PrintFormName:=$3
		$_t_PrintFormName2:=$4
		$_t_OutputFormName:=$5
		$_t_FormName:=$6
		$_t_PrintTitle:=$7
		$_t_PrintFormMethod:=$8
		$_l_RecordState:=$9
	: (Count parameters:C259=10)
		$_ptr_Table1:=$1
		$_ptr_Table2:=$2
		$_t_PrintFormName:=$3
		$_t_PrintFormName2:=$4
		$_t_OutputFormName:=$5
		$_t_FormName:=$6
		$_t_PrintTitle:=$7
		$_t_PrintFormMethod:=$8
		$_l_RecordState:=$9
		$_ptr_RecordStateField:=$10
	: (Count parameters:C259=11)
		$_ptr_Table1:=$1
		$_ptr_Table2:=$2
		$_t_PrintFormName:=$3
		$_t_PrintFormName2:=$4
		$_t_OutputFormName:=$5
		$_t_FormName:=$6
		$_t_PrintTitle:=$7
		$_t_PrintFormMethod:=$8
		$_l_RecordState:=$9
		$_ptr_RecordStateField:=$10
		$_t_PrintFormName2:=$11
	: (Count parameters:C259=12)
		$_ptr_Table1:=$1
		$_ptr_Table2:=$2
		$_t_PrintFormName:=$3
		$_t_PrintFormName2:=$4
		$_t_OutputFormName:=$5
		$_t_FormName:=$6
		$_t_PrintTitle:=$7
		$_t_PrintFormMethod:=$8
		$_l_RecordState:=$9
		$_ptr_RecordStateField:=$10
		$_t_PrintFormName2:=$11
		$_t_AnalysisCode:=$12
	: (Count parameters:C259=13)
		$_ptr_Table1:=$1
		$_ptr_Table2:=$2
		$_t_PrintFormName:=$3
		$_t_PrintFormName2:=$4
		$_t_OutputFormName:=$5
		$_t_FormName:=$6
		$_t_PrintTitle:=$7
		$_t_PrintFormMethod:=$8
		$_l_RecordState:=$9
		$_ptr_RecordStateField:=$10
		$_t_PrintFormName2:=$11
		$_t_AnalysisCode:=$12
		$_bo_ReportEmailError:=$13
	: (Count parameters:C259=14)
		$_ptr_Table1:=$1
		$_ptr_Table2:=$2
		$_t_PrintFormName:=$3
		$_t_PrintFormName2:=$4
		$_t_OutputFormName:=$5
		$_t_FormName:=$6
		$_t_PrintTitle:=$7
		$_t_PrintFormMethod:=$8
		$_l_RecordState:=$9
		$_ptr_RecordStateField:=$10
		$_t_PrintFormName2:=$11
		$_t_AnalysisCode:=$12
		$_bo_ReportEmailError:=$13
		$_14:=$14
	: (Count parameters:C259=15)  //Added -kmw 27/11/08 v631b120i (allow passing an email type directly to this method which will override standard (old) functionality for working out which email address to use)
		$_ptr_Table1:=$1
		$_ptr_Table2:=$2
		$_t_PrintFormName:=$3
		$_t_PrintFormName2:=$4
		$_t_OutputFormName:=$5
		$_t_FormName:=$6
		$_t_PrintTitle:=$7
		$_t_PrintFormMethod:=$8
		$_l_RecordState:=$9
		$_ptr_RecordStateField:=$10
		$_t_PrintFormName2:=$11
		$_t_AnalysisCode:=$12
		$_bo_ReportEmailError:=$13
		$_14:=$14
		$_t_15:=$15  //report generation type (email, print)
	: (Count parameters:C259=16)  //Added -kmw 25/11/08 v631b120i (allow passing an email address directly to this method which will override standard (old) email retreival functionality)
		$_ptr_Table1:=$1
		$_ptr_Table2:=$2
		$_t_PrintFormName:=$3
		$_t_PrintFormName2:=$4
		$_t_OutputFormName:=$5
		$_t_FormName:=$6
		$_t_PrintTitle:=$7
		$_t_PrintFormMethod:=$8
		$_l_RecordState:=$9
		$_ptr_RecordStateField:=$10
		$_t_PrintFormName2:=$11
		$_t_AnalysisCode:=$12
		$_bo_ReportEmailError:=$13
		$_14:=$14
		$_t_15:=$15
		$_t_16:=$16  //email address if emailing
End case 

//NOTE THE INDIRECTE MAPPING ABOVE TO KEEP THINGS IN LINE WITH Gen_PPSingle
$_t_FileName:="Invoice  "+[INVOICES:39]Invoice_Number:1  // 05/04/04 pb

$_t_CurrentFormName:=DB_t_CurrentFormUsage
DB_t_CurrentFormUsage:=$_t_FormName
vLayCode:=""
If (Count parameters:C259>6)
	If ($_l_RecordState>0)
		$_bo_Continue:=Gen_PPChkStSing($_ptr_RecordStateField; $_l_RecordState)
	Else 
		$_bo_Continue:=True:C214
	End if 
Else 
	$_bo_Continue:=True:C214
End if 
If ($_bo_Continue)
	
	DB_SaveRecord($_ptr_Table1)
	
	$_bo_OptionKey:=Gen_Option
	
	//Fri, Jan 20, 2006 bwalia: PDF995 related stuff
	$_bo_SuperReportFoundOK:=(Form_SRProOK($_t_PrintFormName2+" Email"; $_t_AnalysisCode))
	If (Records in selection:C76([DOCUMENTS:7])=0) | ($_bo_SuperReportFound=False:C215)
		
		$_bo_SuperReportFoundOK:=(Form_SRProOK($_t_PrintFormName2; $_t_AnalysisCode))
	End if 
	//note: sr will be loaded if exists
	Reports_prefsLoad([DOCUMENTS:7]Document_Code:1; ->DOC_t_TemplateCode; ->DOC_l_DocDoPrint; ->$_l_docDoPdf; ->$_l_docDoEmail; ->DOC_l_CopyToPrinter; ->DOC_t_DocumentName; ->DOC_t_DocEmailFrom; ->DOC_t_EmailSubject; ->DOC_t_EmailBodyReport; ->Rep_t_docEmailToTxt; ->EMAIL_t_DocEmailRoletoText)
	
	//Reports_prefsLoad   //load the print preference for the current super report
	$_bo_GeneratePDF:=($_l_docDoPdf=1)
	$_bo_SendEMail:=($_l_docDoEmail=1)
	
	Reports_InternalPrefsLoad(DB_t_CurrentFormUsage)
	$_bo_SendEmailInternal:=DOC_l_docDoEmailInternal=1
	
	$_bo_ByPassEmailOption:=False:C215
	Case of 
		: (($_bo_OptionKey) & ($_bo_SendEMail) | ($_bo_SendEmailInternal))
			$_bo_SendEMail:=False:C215
			$_bo_GeneratePDF:=False:C215
			$_bo_ByPassEmailOption:=True:C214
			$_bo_SendEmailInternal:=False:C215
			
		: (($_bo_OptionKey=False:C215) & ($_bo_SendEMail))
			$_bo_SendEMail:=True:C214
			
		: (($_bo_OptionKey=False:C215) & ($_bo_SendEmailInternal))
			$_bo_SendEmailInternal:=True:C214
			
		Else   //do nothing
	End case 
	
	OK:=1
	$_bo_Continue:=True:C214
	
	
	//  `*************** Added 21/11/08 v631b120i -kmw (override above setting so always true...we now control this using RPT_bo_OverrideUsingRPTOption instead (which was set based on  new prefs system *********************
	//$_bo_GeneratePDF:=True
	//$_bo_SendEMail:=True
	//$_bo_SendEmailInternal:=True
	//  `**********************************************************************************************************************************************************************************************************************
	
	
	//*********** overrides above- kmw 20/11/08 v631b120i - Use new settings instead  to work out if and how we are emailing and/or printing *******************
	//added kmw 20/11/08 v631b120i - Use new settings instead  to work out if and how we are emailing and/or printing
	Case of 
		: (Count parameters:C259>15)
			$_t_GenerationType:=$_t_15
			$_t_EmailAddress:=$_t_16
		: (Count parameters:C259>14)
			$_t_GenerationType:=$_t_15  //if generation type but no email passed...assume that calling method either knows they are poassing a gen type that doesn't need email address or that they WANt a blank email addres....ie don't go and reload the pref
			$_t_EmailAddress:=""
		Else 
			If ($_bo_SuperReportFoundOK)
				Reports_PrefsGet(->$_t_GenerationType; ->$_t_EmailAddress; [COMPANIES:2]Company_Code:1; [DOCUMENTS:7]Document_Code:1)
			Else 
				//Eventually could call some kind of ReportsIn_PrefsGet (internal version of new report options functionality)
				$_t_GenerationType:="Print"  //Currently we simply enforce print only for internal reports
				$_t_EmailAddress:=""
			End if 
	End case 
	
	
	Case of 
		: ($_t_GenerationType="Print")
			$_t_EmailAddress:=""  //should have been set to blank anyway and given it will be print only this is probably not even checked later but just in case
			$_bo_SkipEmail:=True:C214
			$_bo_GeneratePDF:=False:C215
			$_bo_SendEMail:=False:C215
			$_bo_SendEmailInternal:=False:C215
		: ($_t_GenerationType="Email")
			$_bo_GeneratePDF:=True:C214
			$_bo_SendEMail:=True:C214
			$_bo_SendEmailInternal:=False:C215
		: ($_t_GenerationType="Print AND Email")
			$_bo_GeneratePDF:=True:C214
			$_bo_SendEMail:=True:C214
			$_bo_SendEmailInternal:=False:C215
		: ($_t_GenerationType="Ask user at the time report generated.")
			$_bo_GeneratePDF:=True:C214
			$_bo_SendEMail:=True:C214
			$_bo_SendEmailInternal:=False:C215
		Else   //shouldn't happen
			$_bo_GeneratePDF:=True:C214
			$_bo_SendEMail:=True:C214
			$_bo_SendEmailInternal:=False:C215
	End case 
	
	//**********************************************************************************************************************************************************
	
	
	
	
	
	If (($_bo_SendEMail) | ($_bo_SendEmailInternal))  //bwalia user has a choice so ask if user wants to email print or cancel
		
		
		If (True:C214)  //new style of dterminging print option
			Case of 
				: ($_t_GenerationType="PRINT")
					xNext:=1
					xCancel:=0
					OK:=1
				: ($_t_GenerationType="EMAIL")
					xNext:=0
					xCancel:=0
					OK:=1
				: ($_t_GenerationType="Ask user at the time report generated.")
					xNext:=0
					xCancel:=0
					OK:=0
					Gen_Confirm3("What would you like to do with the printed report?"; "Email"; "Cancel"; "Print")
					
				Else   //shouldn't currently happen!
					xNext:=0
					xCancel:=0
					OK:=0
					Gen_Confirm3("What would you like to do with the printed report?"; "Email"; "Cancel"; "Print")
			End case 
		Else 
			If (Count parameters:C259>=14)
				If ($_14<2)
					xNext:=0
					xCancel:=0
					OK:=0
					Gen_Confirm3("What would you like to do with the printed report?"; "Email"; "Cancel"; "Print")
				Else 
					
					xNext:=0
					xCancel:=0
					OK:=0
					Gen_Confirm3("What would you like to do with the printed report?"; "Email"; "Cancel"; "Print")
				End if 
			Else 
				xNext:=0
				xCancel:=0
				OK:=0
				Gen_Confirm3("What would you like to do with the printed report?"; "Email"; "Cancel"; "Print")
			End if 
		End if 
		
		Case of 
			: (xNext=1)  //Print
				$_bo_SendEMail:=False:C215
				$_bo_GeneratePDF:=False:C215
				$_bo_ByPassEmailOption:=True:C214
				$_bo_SendEmailInternal:=False:C215
				
			: (xCancel=1)  //ALERT("Cancel")
				$_bo_Continue:=False:C215
				$0:=False:C215
			Else   //else email
		End case 
	End if 
	
	
	
	If (($_bo_Continue) & (($_bo_OptionKey) | ($_bo_SendEMail) | ($_bo_SendEmailInternal) | ($_bo_GeneratePDF)))
		
		Case of 
			: (($_bo_OptionKey) & ($_bo_SendEMail=False:C215))  //Fri, Feb 17, 2006 root: if user holds down the option and send email is disabled in prefs
				$_l_Email:=995
				
			: (($_bo_SendEMail) | ($_bo_SendEmailInternal) | ($_bo_GeneratePDF))  //set in the document prefs to send orders/docs via PDF995
				$_l_Email:=995  //PDF995 has a code of 995
				
			: ($_bo_ByPassEmailOption)
				$_l_Email:=0
				
			Else 
				$_l_Email:=EmailCheckPDFWriter
		End case 
		
		If (($_l_Email>0) & ($_bo_SuperReportFoundOK=False:C215))
			$_l_Email:=0
			Gen_Alert("You have selected to print Invoice to PDF file and email it. Please note this fun"+"ction is only"+" available for Super Report based Invoice template(s)!")
		End if 
		
		<>FaxMode:=0  //NG Oct 2004 -faxing out in this release
		
		If ((<>FaxMode#0) & (Is Windows:C1573))
			
			If ($_l_Email>0)  //email is possible
				CONFIRM:C162("Fax or Email?"; "FAX"; "E-mail")
				$_l_Email:=Num:C11(OK=0)
				//if they pressed ok $_l_Email is now 0
			End if 
			Case of 
				: ($_l_Email=0)
					If (Not:C34(Macro_AccTypeDEF("Efax_SendSingle")))
						//$_t_oldMethodName2:=ERR_MethodTracker ("EXECUTE: "+$_t_PrintFormMethod)
						
						//EXECUTE FORMULA($_t_PrintFormMethod)
						$_t_ExecuteMethodName:=STR_RemoveLeadTrailSpace($_t_PrintFormMethod)
						EXECUTE METHOD:C1007($_t_ExecuteMethodName)
						vLayCode:=""
						$_t_FaxNumber:=Str_TelPrefStri(Str_TelStrip([COMPANIES:2]Fax:10))
						$_t_ContactFaxNumber:=Str_TelPrefStri(Str_TelStrip([CONTACTS:1]Fax:19))
						If ($_t_ContactFaxNumber#"")  //Don't do this for multiples
							If ($_t_FaxNumber="")
								$_t_FaxNumber:=$_t_ContactFaxNumber
							Else 
								Gen_Confirm("The Company Fax No is "+$_t_FaxNumber+Char:C90(13)+"The Contact Fax No is "+$_t_ContactFaxNumber+Char:C90(13)+"Which do you want?"; "Contact"; "Company")
								If (OK=1)
									$_t_FaxNumber:=$_t_ContactFaxNumber
								Else 
									OK:=1
								End if 
							End if 
						End if 
						If ($_t_FaxNumber#"")
							$_l_Error:=0
							$_t_ContactName:=[CONTACTS:1]Contact_Name:31
							Case of 
								: (<>FaxMode=1)
									$_l_Error:=Fax_FEStartM1(Fax_SPSubject($_t_PrintTitle))
									If ($_l_Error=0)
										$_l_Error:=Fax_StartM2([COMPANIES:2]Company_Name:2; $_t_ContactName; $_t_FaxNumber)
									End if 
								: (<>FaxMode=2)
									$_l_Error:=Fax_SPStart(Fax_SPSubject($_t_PrintTitle); [COMPANIES:2]Company_Name:2; $_t_ContactName; $_t_FaxNumber)
							End case 
							If ($_l_Error=0)
								Gen_Confirm3("You are about Fax to "+$_t_ContactName+(" of "*(Num:C11($_t_ContactName#"")))+[COMPANIES:2]Company_Name:2+" on "+$_t_FaxNumber+"."+Char:C90(13)+"Are you sure this is what you intend?"; "Fax"; "Cancel"; "Print")
								If ((OK=0) | (xNext=1))
									//set the chooser back to printer
									Fax_Cancel
									$_bo_PrintDone:=False:C215
									$_bo_OptionKey:=False:C215
								Else 
									<>Faxing:=True:C214
								End if 
							Else 
								Gen_Confirm("You requested Fax-printing, but could not be connected to a Fax server."+"  Do you want to Print it instead?"; "Print"; "Cancel")
								$_bo_OptionKey:=False:C215
							End if 
						Else 
							Gen_Confirm("You requested Fax-printing, but no valid Fax No was found."+"  Do you want to Print it instead?"; "Print"; "Cancel")
							$_bo_OptionKey:=False:C215
						End if 
					End if 
					
				Else 
					//send via email
					//Gen_PPSingleEmail ($_l_Email;$_ptr_Table1;$_t_PrintFormName;$_t_OutputFormName;$_t_FormName;$_t_PrintTitle;$_t_PrintFormMethod;$_l_RecordState;$_ptr_RecordStateField;$_t_PrintFormName2;$_t_AnalysisCode;$_bo_ReportEmailError;[CONTACTS]Contact Code;[COMPANIES]Company Code)
					If (Count parameters:C259<=15)  //Added 25/11/08 -kmw v631b120i
						$_l_Printed:=Gen_PPSingleEmail($_l_Email; $_ptr_Table1; $_t_PrintFormName; $_t_OutputFormName; $_t_FormName; $_t_PrintTitle; $_t_PrintFormMethod; $_l_RecordState; $_ptr_RecordStateField; $_t_PrintFormName2; $_t_AnalysisCode; $_bo_ReportEmailError; [CONTACTS:1]Contact_Code:2; [COMPANIES:2]Company_Code:1; $_t_FileName)  // 13/04/04 pb
					Else   //Added 25/11/08 -kmw v631b120i
						$_l_Printed:=Gen_PPSingleEmail($_l_Email; $_ptr_Table1; $_t_PrintFormName; $_t_OutputFormName; $_t_FormName; $_t_PrintTitle; $_t_PrintFormMethod; $_l_RecordState; $_ptr_RecordStateField; $_t_PrintFormName2; $_t_AnalysisCode; $_bo_ReportEmailError; [CONTACTS:1]Contact_Code:2; [COMPANIES:2]Company_Code:1; $_t_FileName; $_t_EmailAddress)  //Added 25/11/08 -kmw v631b120i
					End if   //Added 25/11/08 -kmw v631b120i
					$_bo_Continue:=False:C215
					$_bo_PrintDone:=($_l_Printed=1)
			End case 
			
		Else 
			If ($_l_Email>0)
				//Gen_PPSingleEmail ($_l_Email;$_ptr_Table1;$_t_PrintFormName;$_t_OutputFormName;$_t_FormName;$_t_PrintTitle;$_t_PrintFormMethod;$_l_RecordState;$_ptr_RecordStateField;$_t_PrintFormName2;$_t_AnalysisCode;$_bo_ReportEmailError;[CONTACTS]Contact Code;[COMPANIES]Company Code)
				If (Count parameters:C259<=15)  //Added 25/11/08 -kmw v631b120i
					$_l_Printed:=Gen_PPSingleEmail($_l_Email; $_ptr_Table1; $_t_PrintFormName; $_t_OutputFormName; $_t_FormName; $_t_PrintTitle; $_t_PrintFormMethod; $_l_RecordState; $_ptr_RecordStateField; $_t_PrintFormName2; $_t_AnalysisCode; $_bo_ReportEmailError; [CONTACTS:1]Contact_Code:2; [COMPANIES:2]Company_Code:1; $_t_FileName)  // 13/04/04 pb
				Else   //Added 25/11/08 -kmw v631b120i
					$_l_Printed:=Gen_PPSingleEmail($_l_Email; $_ptr_Table1; $_t_PrintFormName; $_t_OutputFormName; $_t_FormName; $_t_PrintTitle; $_t_PrintFormMethod; $_l_RecordState; $_ptr_RecordStateField; $_t_PrintFormName2; $_t_AnalysisCode; $_bo_ReportEmailError; [CONTACTS:1]Contact_Code:2; [COMPANIES:2]Company_Code:1; $_t_FileName; $_t_EmailAddress)  //Added 25/11/08 -kmw v631b120i
				End if   //Added 25/11/08 -kmw v631b120i
				$_bo_Continue:=False:C215
				$_bo_PrintDone:=($_l_Printed=1)
			Else 
				$_bo_OptionKey:=False:C215
				
			End if 
			
		End if 
	End if 
	
	If ((OK=1) & ($_bo_Continue))
		If ((<>FormMethod=2) & ($_t_PrintTitle#""))
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=$_t_PrintTitle)
		End if 
		If ((<>FormMethod=2) & (Records in selection:C76([DOCUMENTS:7])>0) & ($_t_PrintTitle#"") & (Is Windows:C1573))
			
			If (<>Form4DW)
				//Write_2:=‘12000;47‘(wr new offscreen area)//wr new offscreen area
				WR PICTURE TO AREA:P12000:141(Write_2; [DOCUMENTS:7]Write_:5)
				If ($_t_PrintFormMethod#"")
					//$_t_oldMethodName2:=ERR_MethodTracker ("EXECUTE: "+$_t_PrintFormMethod)
					
					//EXECUTE FORMULA($_t_PrintFormMethod)
					$_t_ExecuteMethodName:=STR_RemoveLeadTrailSpace($_t_PrintFormMethod)
					EXECUTE METHOD:C1007($_t_ExecuteMethodName)
				End if 
				WR SET DOC PROPERTY:P12000:109(Write_2; wr view references:K12003:17; 0)
				//WR O DO COMMAND (Write;111)`this makes no sense
				$_bo_PrintDone:=True:C214
				WR EXECUTE COMMAND:P12000:113(Write_2; 108)
				WR DELETE OFFSCREEN AREA:P12000:38(Write_2)
			Else 
				If ((Count parameters:C259#7) & (Not:C34($_bo_OptionKey))) & ($_14<2)
					$_l_OK:=PRINT_SetSIZE("A4"; "P"; $_t_PrintFormName)
					If ($_l_OK=1)
						PRINT SETTINGS:C106
						$_l_OK:=OK
						
					Else 
						$_l_OK:=1
					End if 
				Else 
					$_l_OK:=1
				End if 
				If ($_l_OK=1)
					If ($_t_PrintFormMethod#"")
						//$_t_oldMethodName2:=ERR_MethodTracker ("EXECUTE: "+$_t_PrintFormMethod)
						
						//EXECUTE FORMULA($_t_PrintFormMethod)
						$_t_ExecuteMethodName:=STR_RemoveLeadTrailSpace($_t_PrintFormMethod)
						EXECUTE METHOD:C1007($_t_ExecuteMethodName)
					End if 
					vText:=Replace([DOCUMENTS:7]Text:3)
					If (<>FormWPTit)
						Print form:C5([DOCUMENTS:7]; "Form_With_Title")
					Else 
						Print form:C5([DOCUMENTS:7]; "Form")
					End if 
					PAGE BREAK:C6
					PRT_SetPrinterPaperOptions($_t_PrintFormName)
				Else 
					$0:=False:C215
				End if 
			End if 
			
		Else 
			If (Count parameters:C259>8)
				//here look for a macro
				
				If ($_bo_SuperReportFoundOK)
					
					COPY NAMED SELECTION:C331($_ptr_Table1->; "$Sel")
					ONE RECORD SELECT:C189($_ptr_Table1->)
					OK:=1
					//   If ((Count parameters=7) | ($_bo_OptionKey))
					//     SuperReport (File($_ptr_Table1);◊FormPath+$_t_PrintTitle;1024)
					//    Else
					//    SuperReport (File($_ptr_Table1);◊FormPath+$_t_PrintTitle;0)
					//    End if
					
					If ([DOCUMENTS:7]SR_PreMacro:16#"")
						//12/11/2009
						//ALERT("execute macro before printing we should get the page setup request")
						
						Macro([DOCUMENTS:7]SR_PreMacro:16)
					End if 
					
					
					If (Not:C34(SR_bo_Validated))
						SR_pic_ReportData:=[DOCUMENTS:7]Write_:5  //make a copy of the report, we might modify it
						SR_bo_Validated:=True:C214  //ALERT("here we should get the page setup request")
						
					End if 
					
					If ($_14<2)
						SR_bo_Validated:=True:C214
						SR_bo_PageSetupFound:=False:C215
						SR_bo_PageSetupDisplayed:=False:C215
						$_l_OK:=PRINT_SetSIZE("A4"; "P"; [DOCUMENTS:7]Document_Code:1)
						If ($_l_OK>=1)
							$_l_OK:=1
							$_bo_PrintSettingsDisplayed:=False:C215
							If (Not:C34(SR_bo_PageSetupFound))
								$_bo_PrintSettingsDisplayed:=True:C214
								If (Not:C34(SR_bo_PageSetupDisplayed))
									PRINT SETTINGS:C106
									$_l_OK:=OK
								Else 
									$_l_OK:=1
								End if 
								
								If ($_l_OK=1)
									$_l_NumberofCopies:=0
									GET PRINT OPTION:C734(Number of copies option:K47:4; $_l_NumberofCopies)
									If ($_l_NumberofCopies=0)
										$_l_NumberofCopies:=1
									End if 
									If (Is macOS:C1572) | (True:C214)
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
												$_l_PageSetupOptions:=SRP_Print_4DPageSetup
										End case 
										OK:=1
									Else 
										$_bo_ToScreenPreview:=False:C215
										$_bo_ToPDF:=False:C215
										$_l_PageSetupOptions:=SRP_Print_4DPageSetup
									End if 
								End if 
								
							Else 
								If (Not:C34($_bo_PrintSettingsDisplayed))
									PRINT SETTINGS:C106
									$_l_OK:=OK
								Else 
									$_l_OK:=1
								End if 
								
								If ($_l_OK=1)
									$_l_NumberofCopies:=0
									GET PRINT OPTION:C734(Number of copies option:K47:4; $_l_NumberofCopies)
									If ($_l_NumberofCopies=0)
										$_l_NumberofCopies:=1
									End if 
									If (Is macOS:C1572) | (True:C214)
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
												$_l_PageSetupOptions:=SRP_Print_4DPageSetup
										End case 
										OK:=1
									Else 
										$_bo_ToScreenPreview:=False:C215
										$_bo_ToPDF:=False:C215
										$_l_PageSetupOptions:=SRP_Print_4DPageSetup
									End if 
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
						//If (SR Validate (SR_pic_ReportData)=0)
						
						//$_l_Set:=SR Page Setup (SR_pic_ReportData)
						//Else
						//$_l_Set:=SR Page Setup (SR_pic_ReportData)
						//End if
						
						
					Else 
						
						$_l_PageSetupOptions:=SRP_Print_4DPageSetup
						$_l_NumberofCopies:=0
						GET PRINT OPTION:C734(Number of copies option:K47:4; $_l_NumberofCopies)
						If ($_l_NumberofCopies=0)
							$_l_NumberofCopies:=1
						End if 
						//ALERT("We did no get asked because the parameters was greater than 2")
						$_l_Set:=0
					End if 
					If ($_l_Set=0) | ($_l_Set=1)
						$_t_ErrorMethod:=Method called on error:C704
						ON ERR CALL:C155("")
						If (<>SRP262)
							$_ptr_ReportFIeld:=->[DOCUMENTS:7]SR_DOCUMENT_:4
						Else 
							$_ptr_ReportFIeld:=->[DOCUMENTS:7]SR_DOCUMENTXML_:34
						End if 
						If (<>SRP262)
							SR_blb_ReportDataBLOB:=$_ptr_ReportFIeld->
							$_ptr_SRPrint:=->SR_blb_ReportDataBLOB
						Else 
							SR_ReportDataXML:=$_ptr_ReportFIeld->
							$_ptr_SRPrint:=->SR_ReportDataXML
						End if   //
						
						If ($_bo_OptionKey)
							If (Not:C34($_bo_PrintSettingsDisplayed))
								PRINT SETTINGS:C106
								If ($_l_NumberofCopies=0)
									$_l_NumberofCopies:=0
									GET PRINT OPTION:C734(Number of copies option:K47:4; $_l_NumberofCopies)
									If ($_l_NumberofCopies=0)
										$_l_NumberofCopies:=1
									End if 
								End if 
								$_l_OK:=OK
							Else 
								$_l_OK:=1
								If ($_l_NumberofCopies=0)
									GET PRINT OPTION:C734(Number of copies option:K47:4; $_l_NumberofCopies)
									If ($_l_NumberofCopies=0)
										$_l_NumberofCopies:=1
									End if 
								End if 
							End if 
							If ($_l_OK=1)
								
								For ($_l_PrintoutIndex; 1; $_l_NumberofCopies)
									//$_l_Result:=SR Print Report ($SRPRintPTR->;$_l_PageSetupOptions;65535)
									$_l_Result:=SR_Print([DOCUMENTS:7]SR_DOCUMENTXML_:34; 0; SRP_Print_DestinationPrinter+$_l_PageSetupOptions; ""; 0; "")
									
									
								End for 
								PRT_SetPrinterPaperOptions([DOCUMENTS:7]Document_Code:1)
							Else 
								$_l_Result:=-1
							End if 
							ON ERR CALL:C155($_t_ErrorMethod)
						Else 
							If ($_14<2)
								
								If ($_l_NumberofCopies=0)
									$_l_NumberofCopies:=1
								End if 
								//PRINT SETTINGS
								If ($_bo_ToPDF) | ($_bo_ToScreenPreview)
									$_bo_AskPerIteration:=False:C215
									$_bo_AutoIteration:=False:C215
									$_t_PDFOutputFilePath:=""
									If ($_bo_ToPDF)
										If (PRT_Count>1)
											Gen_Confirm("Ask Pdf Name per Document or auto iterate?"; "Auto"; "Ask")
											If (OK=0)
												$_bo_AskPerIteration:=True:C214
												$_bo_AutoIteration:=False:C215
											Else 
												$_bo_AskPerIteration:=False:C215
												$_bo_AutoIteration:=True:C214
											End if 
										Else 
											
										End if 
										$_t_PDFOutputFilePath:=$_t_DestinationFileName
									End if 
									If ($_t_PDFOutputFilePath#"") | ($_bo_ToScreenPreview)
										For ($_l_PrintoutIndex; 1; $_l_NumberofCopies)
											$_bo_PdfOutputOK:=SuperReportToPDF(->[DOCUMENTS:7]Write_:5; $_t_PDFOutputFilePath; $_bo_ToScreenPreview; ->[DOCUMENTS:7]SR_DOCUMENTXML_:34)
										End for 
										If ($_bo_PdfOutputOK)
											$_l_Result:=0
										End if 
									Else 
										$_l_Result:=-1
									End if 
									
								Else 
									$_bo_AskPerIteration:=False:C215
									$_bo_AutoIteration:=False:C215
									$_t_PDFOutputFilePath:=""
									$_bo_ToScreenPreview:=False:C215
									If ($_bo_OptionKey)
										For ($_l_PrintoutIndex; 1; $_l_NumberofCopies)
											//$_l_Result:=SR Print Report ($SRPRintPTR->;$_l_PageSetupOptions;65535)
											$_l_Result:=SR_Print([DOCUMENTS:7]SR_DOCUMENTXML_:34; 0; SRP_Print_DestinationPrinter+$_l_PageSetupOptions; ""; 0; "")
											
											
										End for 
									Else 
										For ($_l_PrintoutIndex; 1; $_l_NumberofCopies)
											//$_l_Result:=SR Print Report ($SRPRintPTR->;$_l_PageSetupOptions;65535)
											$_l_Result:=SR_Print([DOCUMENTS:7]SR_DOCUMENTXML_:34; 0; SRP_Print_DestinationPrinter+$_l_PageSetupOptions; ""; 0; "")
											
											
										End for 
									End if 
									PRT_SetPrinterPaperOptions([DOCUMENTS:7]Document_Code:1)
								End if 
								PRT_bo_ToScreenPreview:=$_bo_ToScreenPreview
								PRT_bo_ToPdf:=$_bo_ToPDF
								PRT_bo_AskPerIteration:=$_bo_AskPerIteration
								PRT_t_pdfOutputFilePath:=$_t_PDFOutputFilePath
								PRT_bo_AutoIteration:=$_bo_AutoIteration
								//If (OK=1)
								//ALERT("Here we should get the printout happening")
								//$_l_Result:=SR Print Report ($SRPRintPTR->;$_l_PageSetupOptions;65535)
								//PRT_SetPrinterPaperOptions ([DOCUMENTS]LDocument_Code)
								//Else
								//$_l_Result:=-1
								//End if
							Else 
								//ALERT("Here we should get the printout happening")
								
								$_bo_ToScreenPreview:=PRT_bo_ToScreenPreview
								$_bo_ToPDF:=PRT_bo_ToPdf
								$_bo_AskPerIteration:=PRT_bo_AskPerIteration
								$_bo_AskPerIteration:=PRT_bo_AskPerIteration
								$_t_PDFOutputFilePath:=PRT_t_pdfOutputFilePath
								$_bo_AutoIteration:=PRT_bo_AutoIteration
								
								If ($_l_NumberofCopies=0)
									$_l_NumberofCopies:=1
								End if 
								If ($_bo_ToPDF) | ($_bo_ToScreenPreview)
									Case of 
										: ($_bo_AskPerIteration)
											$_t_DocumentName:=Get window title:C450
											//$_t_DocumentName:=Replace string($_t_PDFOutputFilePath;".PDF";"")
											$_ti_DocumentRef:=DB_CreateDocument($_t_DocumentName; ".PDF"; "Name the PDF file"; False:C215; ->$_t_DocumentName)
											If ($_t_DocumentName#"")
												For ($_l_PrintoutIndex; 1; $_l_NumberofCopies)
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
											$_t_DocumentName:=Replace string:C233($_t_PDFOutputFilePath; ".PDF"; "")
											For ($_l_PrintoutIndex; 1; $_l_NumberofCopies)
												If ($_l_PrintoutIndex>1)
													$_bo_PdfOutputOK:=SuperReportToPDF(->[DOCUMENTS:7]Write_:5; $_t_DocumentName+"_"+String:C10($_l_PrintoutIndex)+".pdf"; False:C215; ->[DOCUMENTS:7]SR_DOCUMENTXML_:34)
													
												Else 
													$_bo_PdfOutputOK:=SuperReportToPDF(->[DOCUMENTS:7]Write_:5; $_t_DocumentName+".pdf"; False:C215; ->[DOCUMENTS:7]SR_DOCUMENTXML_:34)
													
													
												End if 
											End for 
											If ($_bo_PdfOutputOK)
												$_l_Result:=0
												PRT_SetPrinterPaperOptions([DOCUMENTS:7]Document_Code:1)
											Else 
												$_l_Result:=-1
											End if 
										: ($_bo_ToScreenPreview)
											For ($_l_PrintoutIndex; 1; $_l_NumberofCopies)
												$_bo_PdfOutputOK:=SuperReportToPDF(->[DOCUMENTS:7]Write_:5; $_t_PDFOutputFilePath; $_bo_ToScreenPreview; ->[DOCUMENTS:7]SR_DOCUMENTXML_:34)
											End for 
											PRT_SetPrinterPaperOptions([DOCUMENTS:7]Document_Code:1)
									End case 
									
									
								Else 
									For ($_l_PrintoutIndex; 1; $_l_NumberofCopies)
										//$_l_Result:=SR Print Report ($SRPRintPTR->;SRP_Print_4DPageSetup;65535)
										$_l_Result:=SR_Print([DOCUMENTS:7]SR_DOCUMENTXML_:34; 0; SRP_Print_DestinationPrinter+SRP_Print_4DPageSetup; ""; 0; "")
										
									End for 
									PRT_SetPrinterPaperOptions([DOCUMENTS:7]Document_Code:1)
								End if 
								
								
							End if 
							ON ERR CALL:C155($_t_ErrorMethod)
							If ($_l_Result=0)
								$0:=True:C214
							Else 
								$0:=False:C215  //stop printing
							End if 
						End if 
						//ALERT("1")
						If (vLayCode="")
							OK:=0
						Else 
							OK:=1
						End if 
					Else 
						//ALERT("No print happened $_l_Settingreturned="+String($_l_Set))
						
						$0:=False:C215
					End if 
					FORM SET OUTPUT:C54($_ptr_Table1->; $_t_OutputFormName)
					USE NAMED SELECTION:C332("$Sel")
					CLEAR NAMED SELECTION:C333("$Sel")
				Else 
					//ALERT("Superreport is not found")
					
					//The form name passed in $2 is the base name for the header and footer forms
					//add _Header to it for the header and _Footer to it for the footer
					//if there is a break footer then return the flag in the header
					//and the break footer is called $_t_PrintFormName+"_BreakFooter"
					//Print header size tells us the size of the header
					//this is used to calculate how much room for subforms
					//the subform name
					//PRT_l_FooterSize has to also be set in the header form
					//so that we can calculate if we have enough room to print the next subform
					//Print Max size is also held in the header form so we can allow for different pri
					PRT_l_PageNo:=1
					PRT_bo_HasBreakFooter:=False:C215  // set this to true for a break footer
					PRT_l_MaxSize:=0
					PRT_l_HeaderSize:=0  //this will be set to the header size
					PRT_l_FooterSize:=0
					PRT_l_PrintedLines:=0
					
					$_t_HeaderName:=$_t_PrintFormName+"_Header"
					// PRINT FORM($_ptr_Table1;$_t_HeaderName)
					
					$_l_OK:=PRINT_SetSIZE("A4"; "P"; $_t_PrintFormName)
					If ($_l_OK>=0)
						GET PRINTABLE AREA:C703($_l_MaxPrrintHeight; $_l_PrintableWidth)
						
						If ((Count parameters:C259=7) | ($_bo_OptionKey))
							Print form:C5($_ptr_Table1->; $_t_HeaderName)
							$_l_PrintedHeight:=Get printed height:C702
							ARRAY TEXT:C222($_at_TextArray; 0)
							If ([INVOICES:39]Print_Comments:25)
								vt:=[INVOICES:39]Comments:12
							Else 
								vt:=""
							End if 
							vT2array(->$_at_TextArray; <>FormFont; <>TextSize)
							For ($_l_ArrayIndex; 1; Size of array:C274($_at_TextArray))
								Vt_Line:=$_at_TextArray{$_l_ArrayIndex}
								Print form:C5($1->; $_t_PrintFormName2+"_vt")
								$_l_PrintedHeight:=Get printed height:C702
							End for 
							FIRST RECORD:C50($2->)
							For ($_l_PrintIndex; 1; Records in selection:C76($2->))
								If (PRT_l_FooterSize+$_l_PrintedHeight+24>=$_l_MaxPrrintHeight)
									//this line will not print
									//so print footer and then another header
									Repeat 
										If (PRT_l_FooterSize+$_l_PrintedHeight+18<$_l_MaxPrrintHeight)
											Vt_Line:=""
											Print form:C5($1->; $_t_PrintFormName2+"_vt")
											$_l_PrintedHeight:=Get printed height:C702
										End if 
									Until (PRT_l_FooterSize+$_l_PrintedHeight+18>=$_l_MaxPrrintHeight)
									
									If (PRT_bo_HasBreakFooter)
										Print form:C5($1->; $_t_PrintFormName+"_BreakFooter")
										$_l_PrintedHeight:=Get printed height:C702
									Else 
										Print form:C5($1->; $_t_PrintFormName+"_Footer")
										$_l_PrintedHeight:=Get printed height:C702
									End if 
									PAGE BREAK:C6
									PRT_l_PageNo:=PRT_l_PageNo+1
									Print form:C5($_ptr_Table1->; $_t_HeaderName)
									$_l_PrintedHeight:=Get printed height:C702
									PRT_l_PrintedLines:=0
								End if 
								Print form:C5($1->; $_t_PrintFormName2)
								$_l_PrintedHeight:=Get printed height:C702
								//not that this form will not print vt
								//break Vt into lines
								ARRAY TEXT:C222($_at_TextArray; 0)
								vT2array(->$_at_TextArray; <>FormFont; <>TextSize)
								If (PRT_l_FooterSize+PRT_l_HeaderSize+PRT_l_PrintedLines+(18*Size of array:C274($_at_TextArray))>=$_l_MaxPrrintHeight)
									If (PRT_l_FooterSize+PRT_l_HeaderSize+(18*Size of array:C274($_at_TextArray))<$_l_MaxPrrintHeight)
										//the text will at least all fit on the next page-if it won't we might as well sta
										Repeat 
											If (PRT_l_FooterSize+$_l_PrintedHeight+18<$_l_MaxPrrintHeight)
												Vt_Line:=""
												Print form:C5($1->; $_t_PrintFormName2+"_vt")
												$_l_PrintedHeight:=Get printed height:C702
											End if 
										Until (PRT_l_FooterSize+$_l_PrintedHeight+18>=$_l_MaxPrrintHeight)
										If (PRT_bo_HasBreakFooter)
											Print form:C5($1->; $_t_PrintFormName+"_BreakFooter")
											$_l_PrintedHeight:=Get printed height:C702
										Else 
											Print form:C5($1->; $_t_PrintFormName+"_Footer")
											$_l_PrintedHeight:=Get printed height:C702
										End if 
										PAGE BREAK:C6
										PRT_l_PageNo:=PRT_l_PageNo+1
										Print form:C5($_ptr_Table1->; $_t_HeaderName)
										$_l_PrintedHeight:=Get printed height:C702
										PRT_l_PrintedLines:=0
									End if 
								End if 
								For ($_l_ArrayIndex; 1; Size of array:C274($_at_TextArray))
									Vt_Line:=$_at_TextArray{$_l_ArrayIndex}
									Print form:C5($1->; $_t_PrintFormName2+"_vt")
									$_l_PrintedHeight:=Get printed height:C702
								End for 
								NEXT RECORD:C51($2->)
							End for 
							//Now we print a footer
							Repeat 
								If (PRT_l_FooterSize+$_l_PrintedHeight+18<$_l_MaxPrrintHeight)
									Vt_Line:=""
									Print form:C5($1->; $_t_PrintFormName2+"_vt")
									$_l_PrintedHeight:=Get printed height:C702
								End if 
							Until (PRT_l_FooterSize+$_l_PrintedHeight+18>=$_l_MaxPrrintHeight)
							Print form:C5($1->; $_t_PrintFormName+"_Footer")
							$_l_PrintedHeight:=Get printed height:C702
							PAGE BREAK:C6
							PRT_SetPrinterPaperOptions($_t_PrintFormName)  //NG June 2005
						Else 
							
							If ($_14<2)
								PRINT_SetSIZE("A4"; "P"; $_t_PrintFormName)
								PRINT SETTINGS:C106
								
								
							End if 
							GET PRINTABLE AREA:C703($_l_MaxPrrintHeight; $_l_PrintableWidth)
							If (OK=1)
								
								
								//PRINT RECORD($_ptr_Table1->;*)
								Print form:C5($_ptr_Table1->; $_t_HeaderName)
								$_l_PrintedHeight:=Get printed height:C702
								ARRAY TEXT:C222($_at_TextArray; 0)
								If ([INVOICES:39]Print_Comments:25)
									vt:=[INVOICES:39]Comments:12
								Else 
									vt:=""
								End if 
								vT2array(->$_at_TextArray; <>FormFont; <>TextSize)
								For ($_l_ArrayIndex; 1; Size of array:C274($_at_TextArray))
									Vt_Line:=$_at_TextArray{$_l_ArrayIndex}
									Print form:C5($1->; $_t_PrintFormName2+"_vt")
									$_l_PrintedHeight:=Get printed height:C702
								End for 
								FIRST RECORD:C50($2->)
								For ($_l_PrintIndex; 1; Records in selection:C76($2->))
									If (PRT_l_FooterSize+$_l_PrintedHeight+24>=$_l_MaxPrrintHeight)
										//this line will not print
										//so print footer and then another header
										Repeat 
											If (PRT_l_FooterSize+$_l_PrintedHeight+18<$_l_MaxPrrintHeight)
												Vt_Line:=""
												Print form:C5($1->; $_t_PrintFormName2+"_vt")
												$_l_PrintedHeight:=Get printed height:C702
											End if 
										Until (PRT_l_FooterSize+$_l_PrintedHeight+18>=$_l_MaxPrrintHeight)
										
										If (PRT_bo_HasBreakFooter)
											Print form:C5($1->; $_t_PrintFormName+"_BreakFooter")
											$_l_PrintedHeight:=Get printed height:C702
										Else 
											Print form:C5($1->; $_t_PrintFormName+"_Footer")
											$_l_PrintedHeight:=Get printed height:C702
											
										End if 
										PAGE BREAK:C6
										PRT_l_PageNo:=PRT_l_PageNo+1
										Print form:C5($_ptr_Table1->; $_t_HeaderName)
										$_l_PrintedHeight:=Get printed height:C702
										PRT_l_PrintedLines:=0
									End if 
									Print form:C5($1->; $_t_PrintFormName2)
									$_l_PrintedHeight:=Get printed height:C702
									//not that this form will not print vt
									//break Vt into lines
									ARRAY TEXT:C222($_at_TextArray; 0)
									vT2array(->$_at_TextArray; <>FormFont; <>TextSize)
									If (PRT_l_FooterSize+$_l_PrintedHeight+(18*Size of array:C274($_at_TextArray))>=$_l_MaxPrrintHeight)
										If (PRT_l_FooterSize+PRT_l_HeaderSize+(18*Size of array:C274($_at_TextArray))<$_l_MaxPrrintHeight)
											//the text will at least all fit on the next page-if it won't we might as well sta
											Repeat 
												If (PRT_l_FooterSize+$_l_PrintedHeight+18<$_l_MaxPrrintHeight)
													Vt_Line:=""
													Print form:C5($1->; $_t_PrintFormName2+"_vt")
													$_l_PrintedHeight:=Get printed height:C702
												End if 
											Until (PRT_l_FooterSize+$_l_PrintedHeight+18>=$_l_MaxPrrintHeight)
											If (PRT_bo_HasBreakFooter)
												Print form:C5($1->; $_t_PrintFormName+"_BreakFooter")
												$_l_PrintedHeight:=Get printed height:C702
											Else 
												Print form:C5($1->; $_t_PrintFormName+"_Footer")
												$_l_PrintedHeight:=Get printed height:C702
											End if 
											PAGE BREAK:C6
											PRT_l_PageNo:=PRT_l_PageNo+1
											Print form:C5($_ptr_Table1->; $_t_HeaderName)
											$_l_PrintedHeight:=Get printed height:C702
											PRT_l_PrintedLines:=0
										End if 
									End if 
									For ($_l_ArrayIndex; 1; Size of array:C274($_at_TextArray))
										Vt_Line:=$_at_TextArray{$_l_ArrayIndex}
										Print form:C5($1->; $_t_PrintFormName2+"_vt")
										$_l_PrintedHeight:=Get printed height:C702
									End for 
									NEXT RECORD:C51($2->)
								End for 
								//Now we print a footer
								Repeat 
									If (PRT_l_FooterSize+$_l_PrintedHeight+18<$_l_MaxPrrintHeight)
										Vt_Line:=""
										Print form:C5($1->; $_t_PrintFormName2+"_vt")
										$_l_PrintedHeight:=Get printed height:C702
									End if 
								Until (PRT_l_FooterSize+$_l_PrintedHeight+18>=$_l_MaxPrrintHeight)
								Print form:C5($1->; $_t_PrintFormName+"_Footer")
								$_l_PrintedHeight:=Get printed height:C702
								PAGE BREAK:C6
								PRT_SetPrinterPaperOptions($_t_PrintFormName)
							End if 
							
						End if 
					Else 
						$0:=False:C215
					End if 
					FORM SET OUTPUT:C54($_ptr_Table1->; $_t_OutputFormName)
				End if 
				
			Else 
				
				FORM SET OUTPUT:C54($_ptr_Table1->; $_t_PrintFormName)
				If ((Count parameters:C259=7) | ($_bo_OptionKey))
					//   PRINT SETTINGS
					GET PRINTABLE AREA:C703($_l_MaxPrrintHeight; $_l_PrintableWidth)
					Print form:C5($_ptr_Table1->; $_t_HeaderName)
					$_l_PrintedHeight:=Get printed height:C702
					ARRAY TEXT:C222($_at_TextArray; 0)
					If ([INVOICES:39]Print_Comments:25)
						vt:=[INVOICES:39]Comments:12
					Else 
						vt:=""
					End if 
					vT2array(->$_at_TextArray; <>FormFont; <>TextSize)
					For ($_l_ArrayIndex; 1; Size of array:C274($_at_TextArray))
						Vt_Line:=$_at_TextArray{$_l_ArrayIndex}
						Print form:C5($1->; $_t_PrintFormName2+"_vt")
						$_l_PrintedHeight:=Get printed height:C702
					End for 
					FIRST RECORD:C50($2->)
					For ($_l_PrintIndex; 1; Records in selection:C76($2->))
						If (PRT_l_FooterSize+$_l_PrintedHeight+24>=$_l_MaxPrrintHeight)
							//this line will not print
							//so print footer and then another header
							Repeat 
								If (PRT_l_FooterSize+$_l_PrintedHeight+18<$_l_MaxPrrintHeight)
									Vt_Line:=""
									Print form:C5($1->; $_t_PrintFormName2+"_vt")
									$_l_PrintedHeight:=Get printed height:C702
								End if 
							Until (PRT_l_FooterSize+$_l_PrintedHeight+18>=$_l_MaxPrrintHeight)
							
							If (PRT_bo_HasBreakFooter)
								Print form:C5($1->; $_t_PrintFormName+"_BreakFooter")
								$_l_PrintedHeight:=Get printed height:C702
							Else 
								Print form:C5($1->; $_t_PrintFormName+"_Footer")
								
								$_l_PrintedHeight:=Get printed height:C702
							End if 
							PAGE BREAK:C6
							PRT_l_PageNo:=PRT_l_PageNo+1
							Print form:C5($_ptr_Table1->; $_t_HeaderName)
							$_l_PrintedHeight:=Get printed height:C702
							PRT_l_PrintedLines:=0
						End if 
						Print form:C5($1->; $_t_PrintFormName2)
						$_l_PrintedHeight:=Get printed height:C702
						//not that this form will not print vt
						//break Vt into lines
						ARRAY TEXT:C222($_at_TextArray; 0)
						vT2array(->$_at_TextArray; <>FormFont; <>TextSize)
						If (PRT_l_FooterSize+$_l_PrintedHeight+(18*Size of array:C274($_at_TextArray))>=$_l_MaxPrrintHeight)
							If (PRT_l_FooterSize+PRT_l_HeaderSize+(18*Size of array:C274($_at_TextArray))<$_l_MaxPrrintHeight)
								//the text will at least all fit on the next page-if it won't we might as well sta
								Repeat 
									If (PRT_l_FooterSize+$_l_PrintedHeight+18<$_l_MaxPrrintHeight)
										Vt_Line:=""
										Print form:C5($1->; $_t_PrintFormName2+"_vt")
										$_l_PrintedHeight:=Get printed height:C702
									End if 
								Until (PRT_l_FooterSize+$_l_PrintedHeight+18>=$_l_MaxPrrintHeight)
								If (PRT_bo_HasBreakFooter)
									Print form:C5($1->; $_t_PrintFormName+"_BreakFooter")
									$_l_PrintedHeight:=Get printed height:C702
								Else 
									Print form:C5($1->; $_t_PrintFormName+"_Footer")
									$_l_PrintedHeight:=Get printed height:C702
								End if 
								PAGE BREAK:C6
								PRT_l_PageNo:=PRT_l_PageNo+1
								Print form:C5($_ptr_Table1->; $_t_HeaderName)
								$_l_PrintedHeight:=Get printed height:C702
								PRT_l_PrintedLines:=0
							End if 
						End if 
						For ($_l_ArrayIndex; 1; Size of array:C274($_at_TextArray))
							Vt_Line:=$_at_TextArray{$_l_ArrayIndex}
							Print form:C5($1->; $_t_PrintFormName2+"_vt")
							$_l_PrintedHeight:=Get printed height:C702
						End for 
						NEXT RECORD:C51($2->)
					End for 
					//Now we print a footer
					Repeat 
						If (PRT_l_FooterSize+$_l_PrintedHeight+18<$_l_MaxPrrintHeight)
							Vt_Line:=""
							Print form:C5($1->; $_t_PrintFormName2+"_vt")
							$_l_PrintedHeight:=Get printed height:C702
						End if 
					Until (PRT_l_FooterSize+$_l_PrintedHeight+18>=$_l_MaxPrrintHeight)
					Print form:C5($1->; $_t_PrintFormName+"_Footer")
					$_l_PrintedHeight:=Get printed height:C702
					PAGE BREAK:C6
					
					//PRINT RECORD($_ptr_Table1->;*)
				Else 
					If ($_14<2)
						PRINT SETTINGS:C106
						
					End if 
					GET PRINTABLE AREA:C703($_l_MaxPrrintHeight; $_l_PrintableWidth)
					
					If (ok=1)
						Print form:C5($_ptr_Table1->; $_t_HeaderName)
						$_l_PrintedHeight:=Get printed height:C702
						ARRAY TEXT:C222($_at_TextArray; 0)
						If ([INVOICES:39]Print_Comments:25)
							vt:=[INVOICES:39]Comments:12
						Else 
							vt:=""
						End if 
						vT2array(->$_at_TextArray; <>FormFont; <>TextSize)
						For ($_l_ArrayIndex; 1; Size of array:C274($_at_TextArray))
							Vt_Line:=$_at_TextArray{$_l_ArrayIndex}
							Print form:C5($1->; $_t_PrintFormName2+"_vt")
							$_l_PrintedHeight:=Get printed height:C702
						End for 
						FIRST RECORD:C50($2->)
						For ($_l_PrintIndex; 1; Records in selection:C76($2->))
							If (PRT_l_FooterSize+$_l_PrintedHeight+24>=$_l_MaxPrrintHeight)
								//this line will not print
								//so print footer and then another header
								Repeat 
									If (PRT_l_FooterSize+$_l_PrintedHeight+18<$_l_MaxPrrintHeight)
										Vt_Line:=""
										Print form:C5($1->; $_t_PrintFormName2+"_vt")
										$_l_PrintedHeight:=Get printed height:C702
									End if 
								Until (PRT_l_FooterSize+$_l_PrintedHeight+18>=$_l_MaxPrrintHeight)
								
								If (PRT_bo_HasBreakFooter)
									Print form:C5($1->; $_t_PrintFormName+"_BreakFooter")
									$_l_PrintedHeight:=Get printed height:C702
								Else 
									Print form:C5($1->; $_t_PrintFormName+"_Footer")
									$_l_PrintedHeight:=Get printed height:C702
								End if 
								PAGE BREAK:C6
								PRT_l_PageNo:=PRT_l_PageNo+1
								Print form:C5($_ptr_Table1->; $_t_HeaderName)
								$_l_PrintedHeight:=Get printed height:C702
								PRT_l_PrintedLines:=0
							End if 
							Print form:C5($1->; $_t_PrintFormName2)
							$_l_PrintedHeight:=Get printed height:C702
							//not that this form will not print vt
							//break Vt into lines
							ARRAY TEXT:C222($_at_TextArray; 0)
							vT2array(->$_at_TextArray; <>FormFont; <>TextSize)
							If (PRT_l_FooterSize+$_l_PrintedHeight+(18*Size of array:C274($_at_TextArray))>=$_l_MaxPrrintHeight)
								If (PRT_l_FooterSize+PRT_l_HeaderSize+(18*Size of array:C274($_at_TextArray))<$_l_MaxPrrintHeight)
									//the text will at least all fit on the next page-if it won't we might as well sta
									Repeat 
										If (PRT_l_FooterSize+$_l_PrintedHeight+18<$_l_MaxPrrintHeight)
											Vt_Line:=""
											Print form:C5($1->; $_t_PrintFormName2+"_vt")
											$_l_PrintedHeight:=Get printed height:C702
										End if 
									Until (PRT_l_FooterSize+$_l_PrintedHeight+18>=$_l_MaxPrrintHeight)
									If (PRT_bo_HasBreakFooter)
										Print form:C5($1->; $_t_PrintFormName+"_BreakFooter")
										$_l_PrintedHeight:=Get printed height:C702
									Else 
										Print form:C5($1->; $_t_PrintFormName+"_Footer")
										$_l_PrintedHeight:=Get printed height:C702
									End if 
									PAGE BREAK:C6
									PRT_l_PageNo:=PRT_l_PageNo+1
									Print form:C5($_ptr_Table1->; $_t_HeaderName)
									$_l_PrintedHeight:=Get printed height:C702
									PRT_l_PrintedLines:=0
								End if 
							End if 
							For ($_l_ArrayIndex; 1; Size of array:C274($_at_TextArray))
								Vt_Line:=$_at_TextArray{$_l_ArrayIndex}
								Print form:C5($1->; $_t_PrintFormName2+"_vt")
								$_l_PrintedHeight:=Get printed height:C702
							End for 
							NEXT RECORD:C51($2->)
						End for 
						//Now we print a footer
						Repeat 
							If (PRT_l_FooterSize+$_l_PrintedHeight+18<$_l_MaxPrrintHeight)
								Vt_Line:=""
								Print form:C5($1->; $_t_PrintFormName2+"_vt")
								$_l_PrintedHeight:=Get printed height:C702
							End if 
						Until (PRT_l_FooterSize+$_l_PrintedHeight+18>=$_l_MaxPrrintHeight)
						Print form:C5($1->; $_t_PrintFormName+"_Footer")
						$_l_PrintedHeight:=Get printed height:C702
						PAGE BREAK:C6
						$0:=True:C214
					Else 
						$0:=False:C215
					End if 
					
				End if 
				FORM SET OUTPUT:C54($_ptr_Table1->; $_t_OutputFormName)
				
			End if 
		End if 
		//ALERT("2")
		If ($_bo_OptionKey)
			Case of 
				: ($_l_Email=995)  //23 Jan 2006 Balinder Walia: added
					
				: (<>FaxMode=1)
					PLUGCALL_Chooser("SetChooser")
				: (<>FaxMode=2)
					Fax_SPEnd([COMPANIES:2]Company_Name:2)
			End case 
		End if 
		
	End if 
End if 
//ALERT("3")

DB_t_CurrentFormUsage:=$_t_CurrentFormName
<>Faxing:=False:C215
ERR_MethodTrackerReturn("Gen_PPSingle_2"; $_t_oldMethodName)
