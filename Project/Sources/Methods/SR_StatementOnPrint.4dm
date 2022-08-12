//%attributes = {}
If (False:C215)
	//Project Method Name:      SR_StatementOnPrint
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009`Method: SR_StatementOnPrint
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY DATE(INV_ad_DueDates;0)
	//ARRAY DATE(INV_ad_InvoiceDates;0)
	//ARRAY REAL(INV_ar_DueAmounts;0)
	//ARRAY REAL(INV_ar_InvoicedAmounts;0)
	//ARRAY REAL(INV_ar_PaidAmounts;0)
	ARRAY TEXT:C222($_at_RemCompany; 0)
	ARRAY TEXT:C222($_at_RemEmailAddress; 0)
	//ARRAY TEXT(DOC_at_Attachments;0)
	//ARRAY TEXT(INV_at_InvoiceNumbers;0)
	//ARRAY TEXT(INV_at_YourInvoiceNumbers;0)
	//ARRAY TEXT(RPT_at_GenTypeOptions;0)
	//ARRAY TEXT(RPT_at_GenTypeSelCol1Desc;0)
	//ARRAY TEXT(RPT_at_GenTypeSelCol2Desc;0)
	//ARRAY TEXT(RPT_at_GenTypeSelCol3Desc;0)
	//ARRAY TEXT(RPT_at_GenTypeSelCol4Desc;0)
	//ARRAY TEXT(RPT_at_GenTypeSelGenType;0)
	//ARRAY TEXT(RPT_at_GenTypeSelRecCode;0)
	//ARRAY TEXT(SR_at_CompanyCodes;0)
	C_BLOB:C604(SR_blb_ReportDataBlob)
	C_BOOLEAN:C305(<>SRP262; $_bo_AskPerIteration; $_bo_AutoIteration; $_bo_ByPassEmailOption; $_bo_ContinuePrint; $_bo_FirstCompanyinWhileLoop; $_bo_GeneratePDF; $_bo_OptionKey; $_bo_PdfOutputOK; $_bo_PrintSettingsDialogBool; $_bo_PrintSettingsDisplayed)
	C_BOOLEAN:C305($_bo_SendEmail; $_bo_SendQuitley; $_bo_SRPreview; $_bo_ToPDF; $_bo_ToScreenPreview; $_bo_UsePDF995; DOC_bo_CompanyEmailOK; PDF_bo_995Enabled; RPT_bo_OverrideEmailScreen; SR_bo_PageSetupDisplayed; SR_bo_PageSetupFound)
	C_BOOLEAN:C305(SR_bo_Validated; vDontAutoClose)
	C_DATE:C307(SRDate)
	C_LONGINT:C283($_l_CompanyRow; $_l_Destination; $_l_docDoEmail; $_l_docDoPdf; $_l_GenTypeLoopIndex; $_l_Index; $_l_NumAsk; $_l_NumEmailOnly; $_l_NumPrintAndEmail; $_l_NumPrintOnly; $_l_OK)
	C_LONGINT:C283($_l_Options; $_l_Print; $_l_RecordCount; $_l_ReportsCompanyCount; $_l_Result; $_l_Set; $_l_SuperReportError; DOC_l_CopyToPrinter; DOC_l_docDoEmail; DOC_l_docDoPdf; DOC_l_DocDoPrint)
	C_LONGINT:C283(RPT_l_btnGenTypeSelCancel; RPT_l_btnGenTypeSelContinue; RPT_l_btnGenTypeSelToggleAll; SRPage; SRRecord; THERM_l_ThermoProc; xCancel; xOK)
	C_POINTER:C301($_Ptr_ReportField; $_Ptr_ReportPointer)
	C_REAL:C285(v0; v31; v61; v91; vTotal; vTotalReceived)
	C_TEXT:C284(<>STS_t_CRMDefaultAccountsRole; $_t_CompanyCode; $_t_DestinationFileName; $_t_DocumentName; $_t_DocumentPath; $_t_EmailAddress; $_t_GenerationType; $_t_InvoiceTitle; $_t_Message; $_t_oldMethodName; $_t_PdfOuputFilePath)
	C_TEXT:C284($_t_RememberSuperReportDoc; $_t_StatementPDFPathTxt; $_t_StatementTitle; $_t_WindowTitle; DOC_t_DocEmailFrom; DOC_t_DocumentName; DOC_t_EmailBody; DOC_t_EmailBodyReport; DOC_t_EmailFrom; DOC_t_EmailSendTo; DOC_t_EmailSendToName)
	C_TEXT:C284(DOC_t_EmailSubject; DOC_t_OutputFolderPath; DOC_t_TemplateCode; EMAIL_t_DocEmailRoletoText; Rep_t_docEmailToTxt; RPT_T_GenTypeSelFooter; RPT_t_GenTypeSelGenTypeHead; RPT_T_GenTypeSelHeader; RPT_T_GenTypeSelHeader1; RPT_T_GenTypeSelHeader2; RPT_T_GenTypeSelHeader3)
	C_TEXT:C284(RPT_T_GenTypeSelHeader4; RPT_T_GenTypeSelMainHeading; SR_t_ReportDataXML)
	C_TIME:C306($_ti_DocumentRef; SRTime)
End if 
//Code Starts Here

//TRACE
$_t_oldMethodName:=ERR_MethodTracker("SR_StatementOnPrint")

ARRAY TEXT:C222(INV_at_InvoiceNumbers; 0)
ARRAY TEXT:C222(SR_at_CompanyCodes; 0)
ARRAY DATE:C224(INV_ad_InvoiceDates; 0)
ARRAY TEXT:C222(INV_at_YourInvoiceNumbers; 0)
ARRAY REAL:C219(INV_ar_InvoicedAmounts; 0)
ARRAY REAL:C219(INV_ar_PaidAmounts; 0)
ARRAY REAL:C219(INV_ar_DueAmounts; 0)
ARRAY DATE:C224(INV_ad_DueDates; 0)
//</process>

//<interproc> `</interproc>

//<code>
//ON ERR CALL("test")
$_bo_OptionKey:=Gen_Option
$_bo_ContinuePrint:=False:C215
$_bo_UsePDF995:=False:C215
$_bo_SRPreview:=False:C215
$_bo_SendQuitley:=False:C215
COPY NAMED SELECTION:C331([INVOICES:39]; "$SortedOrder")

DISTINCT VALUES:C339([INVOICES:39]Company_Code:2; SR_at_CompanyCodes)
QUERY WITH ARRAY:C644([COMPANIES:2]Company_Code:1; SR_at_CompanyCodes)

Case of 
	: (Records in set:C195("UserSet")>0)  //user has highlighted some records
		USE SET:C118("UserSet")
		DISTINCT VALUES:C339([INVOICES:39]Company_Code:2; SR_at_CompanyCodes)
		QUERY WITH ARRAY:C644([COMPANIES:2]Company_Code:1; SR_at_CompanyCodes)
		$_bo_ContinuePrint:=True:C214
		
		If (Records in selection:C76([COMPANIES:2])>50)
			Gen_Confirm("Are you sure you want to generate more than 50 statements"; "Cancel"; "Print")
			$_bo_ContinuePrint:=OK=0
		End if 
		
	: (Records in selection:C76([COMPANIES:2])<=50)
		$_bo_ContinuePrint:=True:C214
		
	Else 
		Gen_Confirm("Are you sure you want to generate more than 50 statements"; "Cancel"; "Print")
		$_bo_ContinuePrint:=OK=0
End case 
USE NAMED SELECTION:C332("$SortedOrder")

If ($_bo_ContinuePrint)
	
	CREATE SET:C116([INVOICES:39]; "invoicesToPrint")
	FIRST RECORD:C50([COMPANIES:2])
	Reports_prefsLoad([DOCUMENTS:7]Document_Code:1; ->DOC_t_TemplateCode; ->DOC_l_DocDoPrint; ->$_l_docDoPdf; ->$_l_docDoEmail; ->DOC_l_CopyToPrinter; ->DOC_t_DocumentName; ->DOC_t_DocEmailFrom; ->DOC_t_EmailSubject; ->DOC_t_EmailBodyReport; ->Rep_t_docEmailToTxt; ->EMAIL_t_DocEmailRoletoText)
	
	//Reports_prefsLoad   //load the print preference for the current super report
	If (False:C215)
		$_bo_GeneratePDF:=($_l_docDoPdf=1)
		$_bo_SendEmail:=($_l_docDoEmail=1)
		
		$_bo_ByPassEmailOption:=False:C215
		Case of 
			: (($_bo_OptionKey) & ($_bo_SendEmail))
				$_bo_SendEmail:=False:C215
				$_bo_GeneratePDF:=False:C215
				$_bo_ByPassEmailOption:=True:C214
				
			: (($_bo_OptionKey=False:C215) & ($_bo_SendEmail))
				$_bo_SendEmail:=True:C214
				
			Else   //do nothing
		End case 
	End if 
End if 

//******************************************************************  `Added 02/12/08 v631b120i -kmw *********************************************************************
$_t_CompanyCode:=[DOCUMENTS:7]Document_Code:1  //should be loaded
CREATE EMPTY SET:C140([COMPANIES:2]; "RPT_COMP_GENERATE_ASK")
CREATE EMPTY SET:C140([COMPANIES:2]; "RPT_COMP_GENERATE_EMAIL")
CREATE EMPTY SET:C140([COMPANIES:2]; "RPT_COMP_GENERATE_PRINT")
CREATE EMPTY SET:C140([COMPANIES:2]; "RPT_COMP_GENERATE_BOTH")
ORDER BY:C49([COMPANIES:2]; [COMPANIES:2]Company_Name:2)
FIRST RECORD:C50([COMPANIES:2])
$_l_RecordCount:=Records in selection:C76([COMPANIES:2])
//loop through invoices and create base sets based strictly on report options

ARRAY TEXT:C222($_at_RemCompany; 0)
ARRAY TEXT:C222($_at_RemEmailAddress; 0)


//track number of each setting type instead of just looking at number in set because later on we start mixing these sets together to end up with a simple set of print and a simple set of email.....this way we can still recall the original setting
$_l_NumPrintOnly:=0
$_l_NumEmailOnly:=0
$_l_NumPrintAndEmail:=0
$_l_NumAsk:=0

//OPEN_THERMOMETER ("Gathering print preferences...")    `Added kmw 26/02/09 v631b120o
//OPEN_AUTOTHERM ("Gathering print preferences...";300)  `Changed to autotherm -kmw 27/02/09 v631b120o
//OPEN_AUTOTHERM ("Gathering print preferences...";300;True)  `Disallow user interuption -kmw 02/03/09 v631b120o
OPEN_AUTOTHERM("Gathering print preferences..."; 300; True:C214; True:C214)  //Disallow user auto close -kmw 03/03/09 v631b120o

//******************************************
// -KMW 03/03/09 v631b120o - This block moved to prior to for loop as unneccessary to keep doing this
$_t_EmailAddress:=""
$_t_GenerationType:=""
//******************************************

For ($_l_Index; 1; $_l_RecordCount)
	
	
	//SET_THERMOMETER ("Gathering print preferences for "+String($_l_Index)+" of "+String($_l_RecordCount)+" companies...";($_l_Index*100)\$_l_RecordCount))    `Added kmw 26/02/09 v631b120o
	SET_AUTOTHERM("Gathering print preferences for "+String:C10($_l_Index)+" of "+String:C10($_l_RecordCount)+" companies..."; $_l_Index; $_l_RecordCount)  //Changed to autotherm -kmw 27/02/09 v631b120o
	
	//******************************************
	// -KMW 03/03/09 v631b120o - This block moved to prior to for loop as unneccessary to keep doing this
	//C_TEXT($_t_GenerationType)
	//C_TEXT($_t_EmailAddress)
	//$_t_EmailAddress:=""
	//$_t_GenerationType:=""
	//******************************************
	
	Reports_PrefsGet(->$_t_GenerationType; ->$_t_EmailAddress; [COMPANIES:2]Company_Code:1; [DOCUMENTS:7]Document_Code:1)
	
	If (False:C215)
		//******************** temp test added 10/12/08 -kmw v631b120k **************
		If (User in group:C338(Current user:C182; "Designer")) & (Not:C34(Application type:C494=4D Server:K5:6)) & (Not:C34(Is compiled mode:C492))
			
			$_t_EmailAddress:="kevin.williams@supportplan.com"
		End if 
		//****************************************************************************************
	End if 
	
	//For every company, remember email address that would get used if it was emailed - even if that is simply blank
	
	$_l_ReportsCompanyCount:=Size of array:C274($_at_RemCompany)+1
	INSERT IN ARRAY:C227($_at_RemCompany; $_l_ReportsCompanyCount)
	INSERT IN ARRAY:C227($_at_RemEmailAddress; $_l_ReportsCompanyCount)
	$_at_RemCompany{$_l_ReportsCompanyCount}:=[COMPANIES:2]Company_Code:1
	$_at_RemEmailAddress{$_l_ReportsCompanyCount}:=$_t_EmailAddress
	
	
	
	Case of 
		: ($_t_GenerationType="Print")
			ADD TO SET:C119([COMPANIES:2]; "RPT_COMP_GENERATE_PRINT")
			$_l_NumPrintOnly:=$_l_NumPrintOnly+1
		: ($_t_GenerationType="Email")
			ADD TO SET:C119([COMPANIES:2]; "RPT_COMP_GENERATE_EMAIL")
			$_l_NumEmailOnly:=$_l_NumEmailOnly+1
		: ($_t_GenerationType="Print AND Email")
			ADD TO SET:C119([COMPANIES:2]; "RPT_COMP_GENERATE_BOTH")
			$_l_NumPrintAndEmail:=$_l_NumPrintAndEmail+1
		: ($_t_GenerationType="Ask user at the time report generated.")
			ADD TO SET:C119([COMPANIES:2]; "RPT_COMP_GENERATE_ASK")
			$_l_NumAsk:=$_l_NumAsk+1
		Else   //shouldn't happen
			ADD TO SET:C119([COMPANIES:2]; "RPT_COMP_GENERATE_ASK")
			$_l_NumAsk:=$_l_NumAsk+1
	End case 
	NEXT RECORD:C51([COMPANIES:2])
End for 


//CLOSE_THERMOMETER     `Added kmw 26/02/09 v631b120o
CLOSE_AUTOTHERM  //Changed to autotherm -kmw 27/02/09 v631b120o


//put "both" set into both the email and print
UNION:C120("RPT_COMP_GENERATE_EMAIL"; "RPT_COMP_GENERATE_BOTH"; "RPT_COMP_GENERATE_EMAIL")  //union email and both into email (email now contains any company that should be emailed)
UNION:C120("RPT_COMP_GENERATE_PRINT"; "RPT_COMP_GENERATE_BOTH"; "RPT_COMP_GENERATE_PRINT")  //union print and both into print (print now contains any company that should be printed)

//ask about  "ask" set and put each one into either email or print depending on result of ask
USE SET:C118("RPT_COMP_GENERATE_ASK")




//*************** begin if any of the companies were set (via company or report) to ASK at time of printing *************
If (Records in selection:C76([COMPANIES:2])>0)
	ORDER BY:C49([COMPANIES:2]; [COMPANIES:2]Company_Name:2)
	FIRST RECORD:C50([COMPANIES:2])
	
	//init arrays to zero in case this has been run before in same process
	ARRAY TEXT:C222(RPT_at_GenTypeSelRecCode; 0)
	ARRAY TEXT:C222(RPT_at_GenTypeSelCol1Desc; 0)
	ARRAY TEXT:C222(RPT_at_GenTypeSelCol2Desc; 0)
	ARRAY TEXT:C222(RPT_at_GenTypeSelCol3Desc; 0)
	ARRAY TEXT:C222(RPT_at_GenTypeSelCol4Desc; 0)
	ARRAY TEXT:C222(RPT_at_GenTypeSelGenType; 0)
	
	//$_l_RecordCount:=Records in selection([INVOICES])
	$_l_RecordCount:=Records in selection:C76([COMPANIES:2])  //KMW - 5/12/08, v631b120k - Corrected to base on number of company records
	
	SELECTION TO ARRAY:C260([COMPANIES:2]Company_Code:1; RPT_at_GenTypeSelRecCode)
	
	ARRAY TEXT:C222(RPT_at_GenTypeSelCol1Desc; $_l_RecordCount)
	ARRAY TEXT:C222(RPT_at_GenTypeSelCol2Desc; $_l_RecordCount)
	ARRAY TEXT:C222(RPT_at_GenTypeSelCol3Desc; $_l_RecordCount)
	ARRAY TEXT:C222(RPT_at_GenTypeSelCol4Desc; $_l_RecordCount)
	ARRAY TEXT:C222(RPT_at_GenTypeSelGenType; $_l_RecordCount)
	
	ORDER BY:C49([COMPANIES:2]; [COMPANIES:2]Company_Name:2)
	FIRST RECORD:C50([COMPANIES:2])
	
	//OPEN_AUTOTHERM ("Preparing Report Options...";300)  `Added autotherm -kmw 27/02/09 v631b120o
	//OPEN_AUTOTHERM("Preparing Report Options...";300;True)  `Disallow user interruption -kmw 27/02/09 v631b120o
	OPEN_AUTOTHERM("Preparing Report Options..."; 300; True:C214; True:C214)  //Disallow user auto close -kmw 03/03/09 v631b120o
	
	For ($_l_Index; 1; $_l_RecordCount)
		
		SET_AUTOTHERM("Preparing Report Options for "+String:C10($_l_Index)+" of "+String:C10($_l_RecordCount)+" companies..."; $_l_Index; $_l_RecordCount)  //Added autotherm -kmw 27/02/09 v631b120o
		
		
		RPT_at_GenTypeSelCol1Desc{$_l_Index}:=[COMPANIES:2]Company_Name:2
		
		USE SET:C118("invoicesToPrint")
		//sub select invoices
		QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Company_Code:2=[COMPANIES:2]Company_Code:1)
		
		ORDER BY:C49([INVOICES:39]Invoice_Date:4; >; [INVOICES:39]Invoice_Number:1; >)
		SELECTION TO ARRAY:C260([INVOICES:39]Invoice_Number:1; INV_at_InvoiceNumbers; [INVOICES:39]Invoice_Date:4; INV_ad_InvoiceDates; [INVOICES:39]Your_Order_Number:14; INV_at_YourInvoiceNumbers; [INVOICES:39]Total_Invoiced:5; INV_ar_InvoicedAmounts; [INVOICES:39]Total_Paid:6; INV_ar_PaidAmounts; [INVOICES:39]Total_Due:7; INV_ar_DueAmounts; [INVOICES:39]Due_Date:18; INV_ad_DueDates)
		
		SR_StatementonStart
		
		RPT_at_GenTypeSelCol2Desc{$_l_Index}:=String:C10(vTotal; "|Accounts")
		RPT_at_GenTypeSelCol3Desc{$_l_Index}:=String:C10(vTotalReceived; "|Accounts")
		
		$_l_CompanyRow:=Find in array:C230($_at_RemCompany; [COMPANIES:2]Company_Code:1)
		If ($_l_CompanyRow>0)  //Should be!
			RPT_at_GenTypeSelCol4Desc{$_l_Index}:=$_at_RemEmailAddress{$_l_CompanyRow}
		Else 
			RPT_at_GenTypeSelCol4Desc{$_l_Index}:=""
		End if 
		RPT_at_GenTypeSelGenType{$_l_Index}:="Email"
		
		
		NEXT RECORD:C51([COMPANIES:2])
	End for 
	
	CLOSE_AUTOTHERM  //Added autotherm -kmw 27/02/09 v631b120o
	
	
	ARRAY TEXT:C222(RPT_at_GenTypeOptions; 3)
	RPT_at_GenTypeOptions{1}:="Print"
	RPT_at_GenTypeOptions{2}:="Email"
	RPT_at_GenTypeOptions{3}:="Print AND Email"
	
	RPT_T_GenTypeSelHeader:="Company Code"
	RPT_T_GenTypeSelHeader1:="Company Name"
	RPT_T_GenTypeSelHeader2:="Total Amount"
	RPT_T_GenTypeSelHeader3:="Total Received"
	RPT_T_GenTypeSelHeader4:="Address used if emailed"
	
	RPT_t_GenTypeSelGenTypeHead:="Generate As"
	
	RPT_T_GenTypeSelMainHeading:="Click on 'Generate As' column to alter how individual statements should be genera"+"ted, or click 'Toggle All' to change them all at once."+".."
	
	
	Case of 
		: ($_l_NumPrintOnly>0) & ($_l_NumEmailOnly>0) & ($_l_NumPrintAndEmail>0)
			RPT_T_GenTypeSelFooter:="(NOTE: In addition to the "+String:C10($_l_NumAsk)+" statements listed above, "+String:C10($_l_NumPrintOnly)+" other statements will be printed, "+String:C10($_l_NumEmailOnly)+" other statements will be emailed and "+String:C10($_l_NumPrintAndEmail)+" other invoices will be printed and emailed.)"
		: ($_l_NumEmailOnly>0) & ($_l_NumPrintAndEmail>0)
			RPT_T_GenTypeSelFooter:="(NOTE: In addition to the "+String:C10($_l_NumAsk)+" statements listed above, "+String:C10($_l_NumEmailOnly)+" other statements will be emailed and "+String:C10($_l_NumPrintAndEmail)+" other statements will be printed and emailed.)"
		: ($_l_NumPrintOnly>0) & ($_l_NumPrintAndEmail>0)
			RPT_T_GenTypeSelFooter:="(NOTE: In addition to the "+String:C10($_l_NumAsk)+" statements listed above, "+String:C10($_l_NumPrintOnly)+" other statements will be printed and "+String:C10($_l_NumEmailOnly)+" other statements will be printed and emailed.)"
		: ($_l_NumPrintOnly>0) & ($_l_NumEmailOnly>0)
			RPT_T_GenTypeSelFooter:="(NOTE: In addition to the "+String:C10($_l_NumAsk)+" statements listed above, "+String:C10($_l_NumPrintOnly)+" other statements will be printed and "+String:C10($_l_NumEmailOnly)+" other statements will be emailed.)"
		: ($_l_NumPrintOnly>0)
			RPT_T_GenTypeSelFooter:="(NOTE: In addition to the "+String:C10($_l_NumAsk)+" statements listed above, "+String:C10($_l_NumPrintOnly)+" other statements will be printed.)"
		: ($_l_NumEmailOnly>0)
			RPT_T_GenTypeSelFooter:="(NOTE: In addition to the "+String:C10($_l_NumAsk)+" statements listed above, "+String:C10($_l_NumEmailOnly)+" other statements will be emailed.)"
			
		Else 
			RPT_T_GenTypeSelFooter:=""
	End case 
	
	RPT_l_btnGenTypeSelContinue:=0  //added v631b120p 13/03/09 -kmw
	RPT_l_btnGenTypeSelCancel:=0  //added v631b120p 13/03/09 -kmw
	RPT_l_btnGenTypeSelToggleAll:=0  //added v631b120p 13/03/09 -kmw
	
	DIALOG:C40([USER:15]; "RPT_BatchGenerateSelect")
	CLOSE WINDOW:C154  //added 27/11/08 v631b120i -kmw
	
	If (RPT_l_btnGenTypeSelContinue=1)  //added v631b120p 13/03/09 -kmw
		
		$_l_RecordCount:=Size of array:C274(RPT_at_GenTypeSelRecCode)
		
		For ($_l_Index; 1; $_l_RecordCount)
			QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=RPT_at_GenTypeSelRecCode{$_l_Index})
			Case of 
				: (RPT_at_GenTypeSelGenType{$_l_Index}="Print")
					ADD TO SET:C119([COMPANIES:2]; "RPT_COMP_GENERATE_PRINT")
					$_l_NumPrintOnly:=$_l_NumPrintOnly+1
					
				: (RPT_at_GenTypeSelGenType{$_l_Index}="Email")
					ADD TO SET:C119([COMPANIES:2]; "RPT_COMP_GENERATE_EMAIL")
					$_l_NumEmailOnly:=$_l_NumEmailOnly+1
					
				: (RPT_at_GenTypeSelGenType{$_l_Index}="Print AND Email")
					ADD TO SET:C119([COMPANIES:2]; "RPT_COMP_GENERATE_PRINT")
					ADD TO SET:C119([COMPANIES:2]; "RPT_COMP_GENERATE_EMAIL")
					$_l_NumPrintAndEmail:=$_l_NumPrintAndEmail+1
					
				Else 
					//shouldn't happen
			End case 
		End for 
	Else   //added v631b120p 13/03/09 -kmw
		$_bo_ContinuePrint:=False:C215  //added v631b120p 13/03/09 -kmw
	End if   //added v631b120p 13/03/09 -kmw
	
End if 
//*************** end if any of the companies were set (via company or report) to ASK at time of printing *************

//************************************************************************************************************************************************************

If ($_bo_ContinuePrint)  //added v631b120p 13/03/09 -kmw
	
	If (False:C215)
		
		If ($_bo_SendEmail)
			Gen_Confirm("Do you want to review and check emails and statement before sending it to clients"+"?"; "Send"; "View")
			$_bo_SendQuitley:=(OK=1)
		End if 
	End if 
	//Display message about how many invoices will be printed or emailed etc and if any emails ask user if they wish to review each one or just send.
	RPT_bo_OverrideEmailScreen:=False:C215
	Case of 
		: ($_l_NumPrintOnly>0) & ($_l_NumEmailOnly>0) & ($_l_NumPrintAndEmail>0)
			xCancel:=0
			xOK:=0
			$_t_Message:=String:C10($_l_NumPrintOnly)+" statements will be printed."
			$_t_Message:=$_t_Message+" "+String:C10($_l_NumEmailOnly)+" statements will be emailed."
			$_t_Message:=$_t_Message+" "+String:C10($_l_NumPrintAndEmail)+" statements will be printed and emailed."
			$_t_Message:=$_t_Message+Char:C90(13)
			$_t_Message:=$_t_Message+Char:C90(13)+"Do you want to review each email prior to sending it?"
			Gen_Confirm($_t_Message; "Review"; "Just Send")
			RPT_bo_OverrideEmailScreen:=(xCancel=1)
			
		: ($_l_NumPrintOnly>0) & ($_l_NumEmailOnly>0)
			xCancel:=0
			xOK:=0
			$_t_Message:=String:C10($_l_NumPrintOnly)+" statements will be printed."
			$_t_Message:=$_t_Message+" "+String:C10($_l_NumEmailOnly)+" statements will be emailed."
			$_t_Message:=$_t_Message+Char:C90(13)
			$_t_Message:=$_t_Message+Char:C90(13)+"Do you want to review each email prior to sending it?"
			Gen_Confirm($_t_Message; "Review"; "Just Send")
			RPT_bo_OverrideEmailScreen:=(xCancel=1)
			
		: ($_l_NumPrintOnly>0) & ($_l_NumPrintAndEmail>0)
			xCancel:=0
			xOK:=0
			$_t_Message:=String:C10($_l_NumPrintOnly)+" statements will be printed."
			$_t_Message:=$_t_Message+" "+String:C10($_l_NumPrintAndEmail)+" statements will be printed and emailed."
			$_t_Message:=$_t_Message+Char:C90(13)
			$_t_Message:=$_t_Message+Char:C90(13)+"Do you want to review each email prior to sending it?"
			Gen_Confirm($_t_Message; "Review"; "Just Send")
			RPT_bo_OverrideEmailScreen:=(xCancel=1)
			
		: ($_l_NumEmailOnly>0) & ($_l_NumPrintAndEmail>0)
			xCancel:=0
			xOK:=0
			$_t_Message:=String:C10($_l_NumEmailOnly)+" statements will be emailed."
			$_t_Message:=$_t_Message+" "+String:C10($_l_NumPrintAndEmail)+" statements will be printed and emailed."
			$_t_Message:=$_t_Message+Char:C90(13)
			$_t_Message:=$_t_Message+Char:C90(13)+"Do you want to review each email prior to sending it?"
			Gen_Confirm($_t_Message; "Review"; "Just Send")
			RPT_bo_OverrideEmailScreen:=(xCancel=1)
			
		: ($_l_NumPrintOnly>0)
			$_t_Message:=String:C10($_l_NumPrintOnly)+" statements will be printed."
			Gen_Alert($_t_Message)
			
		: ($_l_NumEmailOnly>0)
			xCancel:=0
			xOK:=0
			$_t_Message:=String:C10($_l_NumEmailOnly)+" statements will be emailed."
			$_t_Message:=$_t_Message+Char:C90(13)
			$_t_Message:=$_t_Message+Char:C90(13)+"Do you want to review each email prior to sending it?"
			Gen_Confirm($_t_Message; "Review"; "Just Send")
			RPT_bo_OverrideEmailScreen:=(xCancel=1)
		Else 
			//shouldn't happen!!!
	End case 
	
	$_t_GenerationType:=""
	
	
	For ($_l_GenTypeLoopIndex; 1; 2)  //Added 21/11/08 v631b120i -kmw
		
		
		Case of 
			: ($_l_GenTypeLoopIndex=1)
				USE SET:C118("RPT_COMP_GENERATE_PRINT")
				ORDER BY:C49([COMPANIES:2]; [COMPANIES:2]Company_Name:2)
				$_t_GenerationType:="PRINT"
				
			: ($_l_GenTypeLoopIndex=2)
				USE SET:C118("RPT_COMP_GENERATE_EMAIL")
				ORDER BY:C49([COMPANIES:2]; [COMPANIES:2]Company_Name:2)
				$_t_GenerationType:="EMAIL"
				
			Else   //shouldn't currently happen!
				$_t_GenerationType:="Ask user at the time report generated."
				REDUCE SELECTION:C351([COMPANIES:2]; 0)
		End case 
		
		
		//get a filename
		$_t_DocumentName:=DOC_t_DocumentName  //Fri, Feb 17, 2006 bwalia: changed to make sure it doesn't create statements in a loop
		
		//loop through all companies & print 1 super report per company
		
		$_bo_FirstCompanyinWhileLoop:=True:C214  //Added 04/12/08 v631b120j -kmw
		
		//******************************************************** Added autotherm -kmw 27/02/09 v631b120o ********************************************************
		Case of 
			: ($_t_GenerationType="PRINT")
				OPEN_THERMOMETER("Printing Statements..."; True:C214; True:C214)  //Changed to always display thermometer and not auto close - 02/03/09 -kmw v631b120o (we know printing/emailing takes a while and otherwise autotherm only opens after at least one email has already been sent which look sfunny)
			: ($_t_GenerationType="EMAIL")
				OPEN_THERMOMETER("Emailing Statements..."; True:C214; True:C214)  //Changed to always display thermometer - 02/03/09 -kmw v631b120o (we know printing/emailing takes a while and otherwise autotherm only opens after at least one email has already been sent which look sfunny)
			Else   //shouldn't happen at this stage
				OPEN_THERMOMETER("Generating Statements..."; True:C214; True:C214)  //Changed to always display thermometer - 02/03/09 -kmw v631b120o (we know printing/emailing takes a while and otherwise autotherm only opens after at least one email has already been sent which look sfunny)
		End case 
		
		$_l_RecordCount:=Records in selection:C76([COMPANIES:2])
		$_l_Index:=0
		$_bo_AskPerIteration:=True:C214
		$_bo_AutoIteration:=False:C215
		//****************************************************************************************************************************************************************
		$_t_WindowTitle:=Get window title:C450
		CREATE SET:C116([COMPANIES:2]; "$printSelection")
		
		
		For ($_l_Print; 1; $_l_RecordCount)
			USE SET:C118("$PrintSelection")
			GOTO SELECTED RECORD:C245([COMPANIES:2]; $_l_Print)
			
			$_t_StatementTitle:=[COMPANIES:2]Company_Name:2
			
			$_t_StatementTitle:=Replace string:C233($_t_StatementTitle; ":"; "")
			$_t_InvoiceTitle:=Replace string:C233($_t_StatementTitle; "/"; "_")
			$_t_StatementTitle:=Replace string:C233($_t_StatementTitle; "\\"; "_")
			
			SET WINDOW TITLE:C213($_t_StatementTitle)
			
			//******************************************************** Added autotherm -kmw 27/02/09 v631b120o ********************************************************
			$_l_Index:=$_l_Index+1
			Case of 
				: ($_t_GenerationType="PRINT")
					//SET_AUTOTHERM ("Printing Statements for "+String($_l_Index)+" of "+String($_l_RecordCount)+" companies...";$_l_Index;$_l_RecordCount)  `Changed to autotherm -kmw 27/02/09 v631b120o
					SET_THERMOMETER("Printing Statements for "+String:C10($_l_Index)+" of "+String:C10($_l_RecordCount)+" companies..."; (($_l_Index*100)\$_l_RecordCount))  //Changed to always display thermometer - 02/03/09 -kmw v631b120o (we know printing/emailing takes a while and otherwise autotherm only opens after at least one email has already been sent which look sfunny)
					
					
				: ($_t_GenerationType="EMAIL")
					//SET_AUTOTHERM ("Emailing Statements for "+String($_l_Index)+" of "+String($_l_RecordCount)+" companies...";$_l_Index;$_l_RecordCount)  `Changed to autotherm -kmw 27/02/09 v631b120o
					SET_THERMOMETER("Emailing Statements for "+String:C10($_l_Index)+" of "+String:C10($_l_RecordCount)+" companies..."; (($_l_Index*100)\$_l_RecordCount))  //Changed to always display thermometer - 02/03/09 -kmw v631b120o (we know printing/emailing takes a while and otherwise autotherm only opens after at least one email has already been sent which look sfunny)
					
					
				Else   //shouldn't happen at this stage
					//SET_AUTOTHERM ("Generating Statements for "+String($_l_Index)+" of "+String($_l_RecordCount)+" companies...";$_l_Index;$_l_RecordCount)  `Changed to autotherm -kmw 27/02/09 v631b120o
					SET_THERMOMETER("Generating Statements for "+String:C10($_l_Index)+" of "+String:C10($_l_RecordCount)+" companies..."; (($_l_Index*100)\$_l_RecordCount))  //Changed to always display thermometer - 02/03/09 -kmw v631b120o (we know printing/emailing takes a while and otherwise autotherm only opens after at least one email has already been sent which look sfunny)
					
					
					
			End case 
			//****************************************************************************************************************************************************************
			
			SET PROCESS VARIABLE:C370(THERM_l_ThermoProc; vDontAutoClose; True:C214)  //added 02/03/09 -kmw v631b120o (can be so long between emails we don't want window to auto close itself between calls from loop)
			
			
			//use set of invoices
			USE SET:C118("invoicesToPrint")
			//sub select invoices
			QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Company_Code:2=[COMPANIES:2]Company_Code:1)
			
			ORDER BY:C49([INVOICES:39]Invoice_Date:4; >; [INVOICES:39]Invoice_Number:1; >)
			SELECTION TO ARRAY:C260([INVOICES:39]Invoice_Number:1; INV_at_InvoiceNumbers; [INVOICES:39]Invoice_Date:4; INV_ad_InvoiceDates; [INVOICES:39]Your_Order_Number:14; INV_at_YourInvoiceNumbers; [INVOICES:39]Total_Invoiced:5; INV_ar_InvoicedAmounts; [INVOICES:39]Total_Paid:6; INV_ar_PaidAmounts; [INVOICES:39]Total_Due:7; INV_ar_DueAmounts; [INVOICES:39]Due_Date:18; INV_ad_DueDates)
			
			REDUCE SELECTION:C351([INVOICES:39]; 1)
			
			If (<>STS_t_CRMDefaultAccountsRole#"")
				QUERY:C277([CONTACTS:1]; [CONTACTS:1]Company_Code:1=[INVOICES:39]Company_Code:2; *)
				QUERY:C277([CONTACTS:1];  & ; [CONTACTS:1]Role:11=<>STS_t_CRMDefaultAccountsRole)  //get accountants contact
				//ask for email address
				Case of 
					: (Records in selection:C76([CONTACTS:1])>1)
						REDUCE SELECTION:C351([CONTACTS:1]; 1)
					Else 
						RELATE ONE:C42([INVOICES:39]Contact_Code:3)
				End case 
			Else 
				RELATE ONE:C42([INVOICES:39]Contact_Code:3)
			End if 
			
			
			//********************************* altered to use new functionality 25/11/08 v631b120i -kmw *********************************
			$_l_CompanyRow:=Find in array:C230($_at_RemCompany; [COMPANIES:2]Company_Code:1)
			$_t_EmailAddress:=$_at_RemEmailAddress{$_l_CompanyRow}
			DOC_t_EmailSendTo:=$_t_EmailAddress
			$_t_EmailAddress:=DOC_t_EmailSendTo
			//**********************************************************************************************************************************
			
			
			SR_StatementonStart
			
			$_bo_PdfOutputOK:=False:C215
			//Fri, Feb 17, 2006 root: reset the company name from preferences
			DOC_t_DocumentName:=$_t_DocumentName
			If (DOC_t_DocumentName="")
				DOC_t_DocumentName:="STATEMENT_<CompanyCode>"
			End if 
			
			DOC_t_DocumentName:=Doc_preferencesFileNameGet(DOC_t_DocumentName)  //resolve tokens like <MMDDYY>
			
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
					//********************** kmw 29/10/08 v631b120c - changed to use the document folder like it does in other parts of the code - just must have been missed in this place *****************************************
					//If (Application type=4D Client )
					//DOC_t_OutputFolderPath:=PDF995_filePathToDirPath (Application file)
					//Else
					//DOC_t_OutputFolderPath:=PDF995_filePathToDirPath (Structure file)
					//End if
					DOC_t_OutputFolderPath:=DB_GetDocumentPath
					//********************************************************************************************************************************************************************************************************
					DOC_t_OutputFolderPath:=DOC_t_OutputFolderPath+"Daybook_PDFs\\"
					
				End if 
				
				If (Test path name:C476(DOC_t_OutputFolderPath)#Is a folder:K24:2)
					CREATE FOLDER:C475(DOC_t_OutputFolderPath)
				End if 
			End if 
			
			$_t_PdfOuputFilePath:=DOC_t_OutputFolderPath+DOC_t_DocumentName+".PDF"
			SET WINDOW TITLE:C213(DOC_t_DocumentName)
			If (($_t_GenerationType="EMAIL"))  //& (DB_Macintosh ))
				$_bo_PdfOutputOK:=SuperReportToPDF(->[DOCUMENTS:7]Write_:5; $_t_PdfOuputFilePath; False:C215; ->[DOCUMENTS:7]SR_DOCUMENTXML_:34)
				PRT_SetPrinterPaperOptions([DOCUMENTS:7]Document_Code:1)
			Else 
				//platform is windows
				//NOTE about the above comment -kmw v631b120i - this code will also be run if its mac but not emailing
				
				PDF_bo_995Enabled:=False:C215
				
				If ($_t_GenerationType="EMAIL")
					Doc_InitPrintPreferences
				End if 
				
				//Commented this out 04/12/08 -kmw - use new settings instead
				//$_bo_PrintSettingsDialogBool:=(Not((PDF_bo_995Enabled) & ($_bo_SendEmail)))
				
				//Commented this out 04/12/08 -kmw - $_bo_SRPreview was always being set to false anyway.
				//If ($_bo_SRPreview)
				//$winRefInt:=SR Preview ([DOCUMENTS]Write_;50;50;Screen width-50;Screen height-50;8;"Preview";1)
				//End if
				
				//Commented this out 04/12/08 -kmw - use new settings instead
				//If ($_bo_PrintSettingsDialogBool=False)  `don't show any print dialogs
				//$_l_SuperReportError:=SR Print Report ([DOCUMENTS]Write_;0;0)
				//Else
				//  `Please note SR_Statement_onStart will be called on printing each invoice
				//$_l_SuperReportError:=SR Print Report ([DOCUMENTS]Write_;1+2+4;0)
				//End if
				
				//Use new functionality instead- 04/12/08 v631b120j -kmw
				If (<>SRP262)
					$_Ptr_ReportField:=->[DOCUMENTS:7]SR_DOCUMENT_:4
					SR_blb_ReportDataBlob:=[DOCUMENTS:7]SR_DOCUMENT_:4
					$_Ptr_ReportPointer:=->SR_blb_ReportDataBlob
				Else 
					$_Ptr_ReportField:=->[DOCUMENTS:7]SR_DOCUMENTXML_:34
					SR_t_ReportDataXML:=[DOCUMENTS:7]SR_DOCUMENTXML_:34  //make a copy of the report, we might modify i
					$_Ptr_ReportPointer:=->SR_t_ReportDataXML
				End if 
				Case of 
					: ($_t_GenerationType="EMAIL")  //don't show print dialog
						//$_l_SuperReportError:=SR Print Report ($_Ptr_ReportPointer->;SRP_Print_4DPageSetup;65535)
						$_l_SuperReportError:=SR_Print([DOCUMENTS:7]SR_DOCUMENTXML_:34; 0; SRP_Print_DestinationPrinter+SRP_Print_4DPageSetup; ""; 0; "")
						
					: ($_t_GenerationType="PRINT") & ($_bo_FirstCompanyinWhileLoop)  //show print dialog (first statement printed)
						//```
						//TRACE
						If (SR_bo_Validated=False:C215)
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
									End if 
									$_l_OK:=OK
									$_t_DestinationFileName:=""
									If ($_l_OK=1)
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
													$_l_Options:=SRP_Print_4DPageSetup
											End case 
											OK:=1
										Else 
											$_bo_ToScreenPreview:=False:C215
											$_bo_ToPDF:=False:C215
											$_l_Options:=SRP_Print_4DPageSetup
										End if 
									End if 
									
									
									
								Else 
									If (Not:C34(SR_bo_PageSetupDisplayed))
										PRINT SETTINGS:C106
									End if 
									
									$_l_OK:=ok
									If ($_l_OK=1)
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
								If ($_l_OK=1)
									$_l_Set:=1
								Else 
									$_l_Set:=-1
								End if 
							Else 
								$_l_Set:=-1
							End if 
						Else 
							If (Not:C34(SR_bo_PageSetupDisplayed))
								PRINT SETTINGS:C106
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
										$_l_Options:=SRP_Print_4DPageSetup
								End case 
								OK:=1
							Else 
								$_bo_ToScreenPreview:=False:C215
								$_bo_ToPDF:=False:C215
								$_l_Options:=SRP_Print_4DPageSetup
							End if 
							$_l_Set:=1
						End if 
						//TRACE
						
						If ($_l_Set=1)
							$_bo_AskPerIteration:=False:C215
							$_bo_AutoIteration:=False:C215
							If ($_bo_ToPDF) | ($_bo_ToScreenPreview)
								$_t_PdfOuputFilePath:=""
								If ($_bo_ToPDF)
									If (Records in set:C195("$PrintSelection")>1)
										Gen_Confirm("Ask Pdf Name per Document or auto iterate?"; "Auto"; "Ask")
										If (OK=0)
											$_bo_AskPerIteration:=True:C214
											$_bo_AutoIteration:=False:C215
										Else 
											$_bo_AskPerIteration:=False:C215
											$_bo_AutoIteration:=True:C214
										End if 
									End if 
									OK:=1
									$_t_PdfOuputFilePath:=$_t_DestinationFileName
								End if 
								If ($_t_PdfOuputFilePath#"") | ($_bo_ToScreenPreview)
									
									$_bo_PdfOutputOK:=SuperReportToPDF(->[DOCUMENTS:7]Write_:5; $_t_PdfOuputFilePath; $_bo_ToScreenPreview; ->[DOCUMENTS:7]SR_DOCUMENTXML_:34)
									
									If ($_bo_PdfOutputOK)
										$_l_Result:=0
										PRT_SetPrinterPaperOptions([DOCUMENTS:7]Document_Code:1)
									End if 
								Else 
									$_l_Result:=-1
								End if 
								
							Else 
								
								//$_l_Result:=SR Print Report ($_Ptr_ReportField->;$_l_Options;65535)
								$_l_Result:=SR_Print([DOCUMENTS:7]SR_DOCUMENTXML_:34; 0; SRP_Print_DestinationPrinter+$_l_Options; ""; 0; "")
								
								PRT_SetPrinterPaperOptions([DOCUMENTS:7]Document_Code:1)
							End if 
							
						Else 
							$_l_SuperReportError:=-1
						End if 
						
					: ($_t_GenerationType="PRINT") & ($_bo_FirstCompanyinWhileLoop=False:C215)  //don't show print dialog
						Case of 
							: ($_bo_AskPerIteration)
								//TRACE
								$_t_DocumentPath:=PathFromPathName($_t_PdfOuputFilePath)
								
								//$_t_DocumentName:=Get window title
								
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
								$_t_DocumentName:=Replace string:C233($_t_PdfOuputFilePath; ".PDF"; "")
								$_bo_PdfOutputOK:=SuperReportToPDF(->[DOCUMENTS:7]Write_:5; $_t_DocumentName+"_"+String:C10($_l_Index)+".pdf"; False:C215; ->[DOCUMENTS:7]SR_DOCUMENTXML_:34)
								If ($_bo_PdfOutputOK)
									$_l_Result:=0
									PRT_SetPrinterPaperOptions([DOCUMENTS:7]Document_Code:1)
								Else 
									$_l_Result:=-1
								End if 
							: ($_bo_ToScreenPreview)
								$_bo_PdfOutputOK:=SuperReportToPDF(->[DOCUMENTS:7]Write_:5; $_t_PdfOuputFilePath; $_bo_ToScreenPreview; ->[DOCUMENTS:7]SR_DOCUMENTXML_:34)
								$_l_Result:=0
								PRT_SetPrinterPaperOptions([DOCUMENTS:7]Document_Code:1)
							Else 
								//$_l_SuperReportError:=SR Print Report ($_Ptr_ReportPointer->;SRP_Print_4DPageSetup;65535)
								$_l_SuperReportError:=SR_Print([DOCUMENTS:7]SR_DOCUMENTXML_:34; 0; SRP_Print_DestinationPrinter+SRP_Print_4DPageSetup; ""; 0; "")
								
								PRT_SetPrinterPaperOptions([DOCUMENTS:7]Document_Code:1)
						End case 
				End case 
				
				Case of 
					: ($_t_GenerationType="EMAIL") & ($_l_SuperReportError=0)
						//PDF995_collectOutput ($_t_PdfOuputFilePath)  //pick up the PDF created by pdf955
						$_bo_PdfOutputOK:=Test path name:C476($_t_PdfOuputFilePath)=Is a document:K24:1
					: ($_t_GenerationType="PRINT")
						If ($_l_Result=0)
							$_bo_PdfOutputOK:=True:C214
						Else 
							$_bo_PdfOutputOK:=False:C215
						End if 
						
					Else 
						$_bo_PdfOutputOK:=False:C215
				End case 
				
			End if 
			CLEAR SEMAPHORE:C144("PDF_printing")
			If ($_bo_PdfOutputOK)  //HERE CHECK FOR PRINT TO PRTINT COPY
				
				MESSAGES OFF:C175
				
				If ($_t_GenerationType="EMAIL")
					//DOC_bo_CompanyEmailOK:=Company_docPrintPrefGet ("statements";"email")  `is company ok to receive this report
					//If ($_t_EmailAddress="")
					//$_t_EmailAddress:=Document_GetEmailAddresses ([DOCUMENTS]LDocument_Code;Rep_t_docEmailToTxt;EMAIL_t_DocEmailRoletoText;[INVOICES]Company Code)
					//End if
					
					//TRACE
					//NEEDS TO REMEMBER SUPER REPORT HERE. - currently is not
					
					$_t_RememberSuperReportDoc:=[DOCUMENTS:7]Document_Code:1  //added 10/12/08 v631b120k -kmw (emailing document geenrates a a new document record to record the email itself which means we lose current super report)
					
					//****************************NG and kw 25/03/09 v631b120o ***********************************
					//Document_EmailPDF ($_t_PdfOuputFilePath;$_t_EmailAddress;DOC_t_EmailSubject)
					
					
					//check for contact based on email here - but only if don't have a contact
					If ([CONTACTS:1]Contact_Code:2="")
						If ([COMPANIES:2]Company_Code:1#"")  //this should always be non-blank but just in case
							//we only have an email address (probably set up this way in print/email super report prefs - but lets try and see if we can deduce which contact it is.
							QUERY:C277([CONTACTS:1]; [CONTACTS:1]Company_Code:1=[COMPANIES:2]Company_Code:1; *)
							QUERY:C277([CONTACTS:1];  & ; [CONTACTS:1]Email_Address:35=$_t_EmailAddress)
							//NOTE: This is still a bit weak in that currently the above doesn't get an exact before @ and after @ NOR does it does it check for contacts that are linked to the current company via non-primary company - contact link.
						End if 
					End if 
					
					Case of 
						: ([CONTACTS:1]Contact_Code:2#"") & ([CONTACTS:1]Company_Code:1=[COMPANIES:2]Company_Code:1)
							Document_EmailPDF($_t_PdfOuputFilePath; $_t_EmailAddress; DOC_t_EmailSubject; ->[CONTACTS:1])
							
						: ([COMPANIES:2]Company_Code:1#"")
							
							If (True:C214)  //JUST AN IDEA - Need to discuss implications with Nigel...
								QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2="*UKNWN*")
								If (Records in selection:C76([CONTACTS:1])=0)
									READ WRITE:C146([CONTACTS:1])
									CREATE RECORD:C68([CONTACTS:1])
									[CONTACTS:1]Contact_Code:2:="*UKNWN*"
									[CONTACTS:1]x_ID:33:=AA_GetNextID(->[CONTACTS:1]x_ID:33)
									[CONTACTS:1]Contact_Name:31:=""  //"Unknown Email_Contact"
									[CONTACTS:1]Forename:4:=""  //"Unknown"
									[CONTACTS:1]Surname:5:=""  //"Email_Contact"
									[CONTACTS:1]Deleted:32:=1
									SAVE RECORD:C53([CONTACTS:1])
								End if 
							End if 
							Document_EmailPDF($_t_PdfOuputFilePath; $_t_EmailAddress; DOC_t_EmailSubject; ->[COMPANIES:2])
							
						Else   //this should never happen
							//this doesn't work very well if it happens but shouldn't happen at all!!!! this is because how can we be printing a statement for a company with no code
							
							If (True:C214)  //JUST AN IDEA - Need to discuss implications with Nigel...
								QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1="*UKNWN*")
								If (Records in selection:C76([COMPANIES:2])=0)
									READ WRITE:C146([COMPANIES:2])
									CREATE RECORD:C68([COMPANIES:2])
									[COMPANIES:2]Company_Code:1:="*UKNWN*"
									[COMPANIES:2]x_ID:63:=AA_GetNextID(->[COMPANIES:2]x_ID:63)
									[COMPANIES:2]Company_Name:2:=""  //"Unknown EMail_Contact"
									[COMPANIES:2]Private:37:=True:C214
									DB_SaveRecord(->[COMPANIES:2])
								End if 
								QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2="*UKNWN*")
								If (Records in selection:C76([CONTACTS:1])=0)
									READ WRITE:C146([CONTACTS:1])
									CREATE RECORD:C68([CONTACTS:1])
									[CONTACTS:1]Contact_Code:2:="*UKNWN*"
									[CONTACTS:1]x_ID:33:=AA_GetNextID(->[CONTACTS:1]x_ID:33)
									[CONTACTS:1]Contact_Name:31:=""  //"Unknown Email_Contact"
									[CONTACTS:1]Forename:4:=""  //"Unknown"
									[CONTACTS:1]Surname:5:=""  //"Email_Contact"
									[CONTACTS:1]Deleted:32:=1
									DB_SaveRecord(->[CONTACTS:1])
								End if 
							End if 
							Document_EmailPDF($_t_PdfOuputFilePath; $_t_EmailAddress; DOC_t_EmailSubject)
							
					End case 
					//******************************************************************************************************
					
					
					QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=$_t_RememberSuperReportDoc)  //added 10/12/08 v631b120k -kmw (emailing document geenrates a a new document record to record the email itself which means we lose current super report)
					
					
					//NOTE: v631b120i 25/11/08 -kmw - now uses new way of getting email address address...
					//....and also ignore the old style checking of email turned on at company level (email address...
					//... and seeing if its turned on at company level now all handled by new functionality)...
					//...Also Email_sendQuitely replaced with call to Document_EmailPDF instead (does a lot...
					//...more stuff including generating the email record etc....i have jsut recently modified...
					//...Document_EmailPDF so it looks for a var called RPT_bo_OverrideEmailScreen and if true...
					//...it sends the email quietly whilst still doin gall the other work required of it).
					//
					//....EXTRA INFO: Batch print invoice has been modified in a similar way
					
					If (False:C215)
						Case of 
							: ((DOC_bo_CompanyEmailOK) & ($_bo_SendQuitley))
								DOC_t_EmailSendTo:=$_t_EmailAddress
								
								ARRAY TEXT:C222(DOC_at_Attachments; 1)
								DOC_at_Attachments{1}:=$_t_PdfOuputFilePath
								//DOC_t_EmailSendTo:="balinder.singh@daybook.co.uk"
								
								If ((DOC_t_EmailSendTo="") & (Not:C34(Is compiled mode:C492)))
									//DOC_t_EmailSendTo:="balinder.singh@daybook.co.uk"
									//DOC_t_EmailSendToName:="Balinder Walia"
									
								End if 
								//DOC_t_EmailSendTo:="rollocarpenter@mac.com"
								Email_sendQuitely(DOC_t_EmailFrom; DOC_t_EmailSendTo; DOC_t_EmailSubject; DOC_t_EmailBody; ->DOC_at_Attachments; True:C214; DOC_t_EmailSendToName)
							Else 
								If ($_bo_SendQuitley=False:C215)
									Gen_Confirm("Do you want to eMail_Statement now?"; "Yes"; "No")
									$_bo_SendEmail:=OK=1
								End if 
								
								If ($_bo_SendEmail)
									Document_EmailPDF($_t_PdfOuputFilePath; $_t_EmailAddress; DOC_t_EmailSubject)
									
								Else 
									FileLaunch($_t_PdfOuputFilePath)  //Gen_Alert ("Booking confirmation printed to a PDF [Location: "+$_t_PdfOuputFilePath+"]")
								End if 
						End case 
					End if 
					
					
					//Else
					//FileLaunch ($_t_PdfOuputFilePath)
					//End if
				End if 
				
			End if   //added kmw 02/12/08 v631b120i
			
			NEXT RECORD:C51([COMPANIES:2])
			$_bo_FirstCompanyinWhileLoop:=False:C215  //Added 04/12/08 v631b120j -kmw
			
			If (Gen_Option) | ($_l_SuperReportError#0)
				CONFIRM:C162("Cancel printing process"; "Yes"; "No")
				If (OK=1)
					REDUCE SELECTION:C351([COMPANIES:2]; 0)
				End if 
			End if 
		End for 
		
		SET WINDOW TITLE:C213($_t_WindowTitle)
		
		SET PROCESS VARIABLE:C370(THERM_l_ThermoProc; vDontAutoClose; False:C215)  //added 02/03/09 -kmw v631b120o (reset auto close in case for some reason the manual close we are about to do fails)
		
		//CLOSE_AUTOTHERM   `Added autotherm -kmw 27/02/09 v631b120o
		CLOSE_THERMOMETER  //Changed to always display thermometer - 02/03/09 -kmw v631b120o (we know printing/emailing takes a while and otherwise autotherm only opens after at least one email has already been sent which look sfunny)
		
		
		
	End for 
	
	//RPT_bo_OverrideUsingRPTOption:=False
	RPT_bo_OverrideEmailScreen:=False:C215
	
	CLEAR SET:C117("invoicesToPrint")
	
	
End if   //added v631b120p 13/03/09 -kmw

ERR_MethodTrackerReturn("SR_StatementOnPrint"; $_t_oldMethodName)
