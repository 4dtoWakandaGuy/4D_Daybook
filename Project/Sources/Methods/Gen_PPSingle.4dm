//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_PPSingle
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 29/06/2014 14:03
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
	//C_UNKNOWN($0)
	//C_UNKNOWN(k12003)
	//C_UNKNOWN(SR_Print)
	//C_UNKNOWN(vLayCode)
	//C_UNKNOWN(vText)
	//C_UNKNOWN(Write_2)
	//C_UNKNOWN(xCancel)
	//C_UNKNOWN(xNext)
	C_BLOB:C604(SR_blb_ReportDataBLOB)
	C_BOOLEAN:C305(<>Form4DW; <>FormWPTit; <>SRP262; $_bo_ByPassEmailOption; $_bo_Continue; $_bo_GeneratePDF; $_bo_OptionKey; $_bo_Parameter11; $_bo_PDFOutputOK; $_bo_PrintDone; $_bo_SendEmail)
	C_BOOLEAN:C305($_bo_SendEmailInternal; $_bo_ShiftKeyDown; $_bo_SkipEmail; $_bo_SuperReportFoundOK; $_bo_ToPDF; $_bo_ToScreenPreview; $11; PRT_bo_NoSave; SR_bo_PageSetupDisplayed; SR_bo_Validated; <>Faxing)
	C_BOOLEAN:C305($_bo_ByPassEmailOption; $_bo_Continue; $_bo_GeneratePDF; $_bo_OptionKey; $_bo_Parameter11; $_bo_PDFOutputOK; $_bo_PrintDone; $_bo_PrintSettingsDisplayed; $_bo_SendEmail; $_bo_SendEmailInternal; $_bo_ShiftKeyDown)
	C_BOOLEAN:C305($_bo_SkipEmail; $_bo_SuperReportFoundOK; $_bo_ToPDF; $_bo_ToScreenPreview; $11; PRT_bo_NoSave; SR_bo_PageSetupDisplayed; SR_bo_PageSetupFound; SR_bo_Validated)
	C_DATE:C307(SRDate)
	C_LONGINT:C283(<>FormMethod; $_l_CopiesIndex; $_l_docDoEmail; $_l_docDoPdf; $_l_Email; $_l_Error; $_l_FaxMode; $_l_NumberofCopies; $_l_OK; $_l_Parameter7; $_l_Printed)
	C_LONGINT:C283($_l_PrintSet; $_l_Result; $_l_SROptions; $0; $7; DOC_l_CopyToPrinter; DOC_l_docDoEmail; DOC_l_docDoEmailInternal; DOC_l_docDoPdf; SRPage; SRRecord)
	C_LONGINT:C283(WRITE_2; xCancel; xNext; <>FaxMode; $_l_CopiesIndex; $_l_docDoEmail; $_l_docDoPdf; $_l_Email; $_l_Error; $_l_FaxMode; $_l_NumberofCopies)
	C_LONGINT:C283($_l_OK; $_l_Parameter7; $_l_PrintDestination; $_l_Printed; $_l_PrintSet; $_l_Result; $_l_SROptions; $7; DOC_l_CopyToPrinter; DOC_l_docDoEmailInternal; DOC_l_DocDoPrint)
	C_PICTURE:C286(SR_pic_ReportData)
	C_POINTER:C301($_ptr_Param8; $_ptr_ReportField; $_ptr_SRPrint; $1; $8; $_ptr_Param1; $_ptr_Param8; $_ptr_ReportField; $_ptr_SRPrint; $1; $8)
	C_TEXT:C284($_t_CurrentFormUsage; $_t_CurrentPrinter; $_t_DestinationFIleName; $_t_ErrorHandler; $_t_ExecuteMethodName; $_t_FaxCompany; $_t_oldMethodName; $_t_oldMethodName2; $_t_Param10; $_t_Param12; $_t_Param3)
	C_TEXT:C284($_t_Param4; $_t_Param5; $_t_Param6; $_t_Param9; $_t_Parameter13; $_t_Parameter14; $_t_PdfOutputFilePath; $_T_RememberSRTemplate; $_t_SREmailAddress; $10; $12)
	C_TEXT:C284($13; $14; $2; $3; $4; $5; $6; $9; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
	C_TEXT:C284(DOC_t_DocEmailFrom; DOC_t_DocumentName; DOC_t_EmailBodyReport; DOC_t_EmailSubject; DOC_t_TemplateCode; EMAIL_t_DocEmailRoletoText; PRT_T_NULSTRING; vLayCode; vText; $_t_ContactName; $_t_CurrentFormUsage)
	C_TEXT:C284($_t_CurrentPrinter; $_t_DestinationFIleName; $_t_ErrorHandler; $_t_ExecuteMethodName; $_t_FaxCompany; $_t_oldMethodName; $_t_oldMethodName2; $_t_Param10; $_t_Param12; $_t_Param2; $_t_Param3)
	C_TEXT:C284($_t_Param4; $_t_Param5; $_t_Param6; $_t_Param9; $_t_Parameter13; $_t_Parameter14; $_t_PdfOutputFilePath; $_T_RememberSRTemplate; $_t_SREmailAddress; $_T_SRGenerationType; $10)
	C_TEXT:C284($12; $13; $14; $2; $3; $4; $5; $6; $9; $FaxO; DB_t_CurrentFormUsage)
	C_TEXT:C284(DOC_t_DocEmailFrom; DOC_t_DocumentName; DOC_t_EmailBodyReport; DOC_t_EmailSubject; DOC_t_TemplateCode; EMAIL_t_DocEmailRoletoText; PRT_T_NULSTRING; Rep_t_docEmailToTxt)
	C_TIME:C306(SRTime)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("Gen_PPSingle")

If ($_l_NumberofCopies=0)
	$_l_NumberofCopies:=1
End if 
PRT_T_NULSTRING:=""

$_ptr_Param1:=->PRT_T_NULSTRING
$_t_Param2:=""
$_t_Param3:=""
$_t_Param4:=""
$_t_Param5:=""
$_t_Param6:=""
$_l_Parameter7:=0
$_ptr_Param8:=->PRT_T_NULSTRING
$_t_Param9:=""
$_t_Param10:=""
$_bo_Parameter11:=False:C215
$_t_Param12:=""  // 05/04/04 pb
Case of 
	: (Count parameters:C259=1)
		$_ptr_Param1:=$1
	: (Count parameters:C259=2)
		$_ptr_Param1:=$1
		$_t_Param2:=$2
	: (Count parameters:C259=3)
		$_ptr_Param1:=$1
		$_t_Param2:=$2
		$_t_Param3:=$3
	: (Count parameters:C259=4)
		$_ptr_Param1:=$1
		$_t_Param2:=$2
		$_t_Param3:=$3
		$_t_Param4:=$4
	: (Count parameters:C259=5)
		$_ptr_Param1:=$1
		$_t_Param2:=$2
		$_t_Param3:=$3
		$_t_Param4:=$4
		$_t_Param5:=$5
	: (Count parameters:C259=6)
		$_ptr_Param1:=$1
		$_t_Param2:=$2
		$_t_Param3:=$3
		$_t_Param4:=$4
		$_t_Param5:=$5
		$_t_Param6:=$6
	: (Count parameters:C259=7)
		$_ptr_Param1:=$1
		$_t_Param2:=$2
		$_t_Param3:=$3
		$_t_Param4:=$4
		$_t_Param5:=$5
		$_t_Param6:=$6
		$_l_Parameter7:=$7
	: (Count parameters:C259=8)
		$_ptr_Param1:=$1
		$_t_Param2:=$2
		$_t_Param3:=$3
		$_t_Param4:=$4
		$_t_Param5:=$5
		$_t_Param6:=$6
		$_l_Parameter7:=$7
		$_ptr_Param8:=$8
	: (Count parameters:C259=9)
		$_ptr_Param1:=$1
		$_t_Param2:=$2
		$_t_Param3:=$3
		$_t_Param4:=$4
		$_t_Param5:=$5
		$_t_Param6:=$6
		$_l_Parameter7:=$7
		$_ptr_Param8:=$8
		$_t_Param9:=$9
	: (Count parameters:C259=10)
		$_ptr_Param1:=$1
		$_t_Param2:=$2
		$_t_Param3:=$3
		$_t_Param4:=$4
		$_t_Param5:=$5
		$_t_Param6:=$6
		$_l_Parameter7:=$7
		$_ptr_Param8:=$8
		$_t_Param9:=$9
		$_t_Param10:=$10
	: (Count parameters:C259=11)
		$_ptr_Param1:=$1
		$_t_Param2:=$2
		$_t_Param3:=$3
		$_t_Param4:=$4
		$_t_Param5:=$5
		$_t_Param6:=$6
		$_l_Parameter7:=$7
		$_ptr_Param8:=$8
		$_t_Param9:=$9
		$_t_Param10:=$10
		$_bo_Parameter11:=$11
	: (Count parameters:C259=12)  // 05/04/04 pb
		$_ptr_Param1:=$1
		$_t_Param2:=$2
		$_t_Param3:=$3
		$_t_Param4:=$4
		$_t_Param5:=$5
		$_t_Param6:=$6
		$_l_Parameter7:=$7
		$_ptr_Param8:=$8
		$_t_Param9:=$9
		$_t_Param10:=$10
		$_bo_Parameter11:=$11
		$_t_Param12:=$12
	: (Count parameters:C259=13)  // added 27/11/08 -kmw v631b120i
		$_ptr_Param1:=$1
		$_t_Param2:=$2
		$_t_Param3:=$3
		$_t_Param4:=$4
		$_t_Param5:=$5
		$_t_Param6:=$6
		$_l_Parameter7:=$7
		$_ptr_Param8:=$8
		$_t_Param9:=$9
		$_t_Param10:=$10
		$_bo_Parameter11:=$11
		$_t_Param12:=$12
		$_t_Parameter13:=$13
	: (Count parameters:C259=14)  // added 27/11/08 -kmw v631b120i
		$_ptr_Param1:=$1
		$_t_Param2:=$2
		$_t_Param3:=$3
		$_t_Param4:=$4
		$_t_Param5:=$5
		$_t_Param6:=$6
		$_l_Parameter7:=$7
		$_ptr_Param8:=$8
		$_t_Param9:=$9
		$_t_Param10:=$10
		$_bo_Parameter11:=$11
		$_t_Param12:=$12
		$_t_Parameter13:=$13
		$_t_Parameter14:=$14
End case 


$_t_CurrentFormUsage:=DB_t_CurrentFormUsage
DB_t_CurrentFormUsage:=$_t_Param4
vLayCode:=""
If (Count parameters:C259>6)
	If ($_l_Parameter7>0)
		$_bo_Continue:=Gen_PPChkStSing($_ptr_Param8; $_l_Parameter7)
	Else 
		$_bo_Continue:=True:C214
	End if 
Else 
	$_bo_Continue:=True:C214
End if 
If ($_bo_Continue)
	If (Not:C34(PRT_bo_NoSave))
		DB_SaveRecord($_ptr_Param1)
	End if 
	PRT_bo_NoSave:=False:C215
	
	$_bo_OptionKey:=Gen_Option  //alt(option) key on Mac control Key on PC
	If ($_bo_OptionKey)
		//ALERT("OptionKeyPressed")
	End if 
	$_bo_ShiftKeyDown:=Shift down:C543  //and control key on Mac or Alt key on PC
	OK:=1
	$_bo_PrintDone:=False:C215
	$_bo_Continue:=True:C214
	//`NG Janaury 2007...OK Heres an interesting thing...if you hold down the alt key and your preference is set to ◊FormMethod=1 then the ALT key meant(in old times before emailing)
	//that you wanted the internal form rather than the super-report. so how do we alter this
	// so i am adding the $andAlt above
	$_bo_SkipEmail:=((<>FormMethod=1) & ($_bo_OptionKey=True:C214) & ($_bo_ShiftKeyDown=True:C214))  //if this returns false then we are skipping the superreport to print the internal form
	//NG-THis SHOULD FIRST LOOK FOR A VERSION OF THE REPORT FOR EMAIL WHICH IS STILL AN OPTION
	
	$_bo_SuperReportFoundOK:=(Form_SRProOK($_t_Param9+" Email"; $_t_Param10))  //Fri, Jan 20, 2006 bwalia: PDF995 related stuff
	If (Records in selection:C76([DOCUMENTS:7])=0) | ($_bo_SuperReportFoundOK=False:C215)
		
		$_bo_SuperReportFoundOK:=(Form_SRProOK($_t_Param9; $_t_Param10))
	End if 
	If ($_bo_SuperReportFoundOK)
		//ALERT("SuperreportFound")
	End if 
	//note: sr will be loaded if exists
	Reports_prefsLoad([DOCUMENTS:7]Document_Code:1; ->DOC_t_TemplateCode; ->DOC_l_DocDoPrint; ->$_l_docDoPdf; ->$_l_docDoEmail; ->DOC_l_CopyToPrinter; ->DOC_t_DocumentName; ->DOC_t_DocEmailFrom; ->DOC_t_EmailSubject; ->DOC_t_EmailBodyReport; ->Rep_t_docEmailToTxt; ->EMAIL_t_DocEmailRoletoText)
	//load the print preference for the current super report
	$_bo_GeneratePDF:=($_l_docDoPdf=1)
	$_bo_SendEmail:=$_l_docDoEmail=1
	If ($_bo_SendEmail)
		//ALERT("Default is send email")
	End if 
	Reports_InternalPrefsLoad(DB_t_CurrentFormUsage)
	$_bo_SendEmailInternal:=DOC_l_docDoEmailInternal=1
	
	//*********** overrides above- kmw 20/11/08 v631b120i - Use new settings instead  to work out if and how we are emailing and/or printing *******************
	//added kmw 20/11/08 v631b120i - Use new settings instead  to work out if and how we are emailing and/or printing
	Case of 
		: (Count parameters:C259>13)
			$_T_SRGenerationType:=$_t_Parameter13
			$_t_SREmailAddress:=$_t_Parameter14
		: (Count parameters:C259>12)
			$_T_SRGenerationType:=$_t_Parameter13  //if generation type but no email passed...assume that calling method either knows they are poassing a gen type that doesn't need email address or that they WANt a blank email addres....ie don't go and reload the pref
			$_t_SREmailAddress:=""
		Else 
			If ($_bo_SuperReportFoundOK)
				Reports_PrefsGet(->$_T_SRGenerationType; ->$_t_SREmailAddress; [COMPANIES:2]Company_Code:1; [DOCUMENTS:7]Document_Code:1)
			Else 
				//Eventually could call some kind of ReportsIn_PrefsGet (internal version of new report options functionality)
				$_T_SRGenerationType:="Print"  //Currently we simply enforce print only for internal reports
				$_t_SREmailAddress:=""
			End if 
	End case 
	
	Case of 
		: ($_T_SRGenerationType="Print")
			$_t_SREmailAddress:=""  //should have been set to blank anyway and given it will be print only this is probably not even checked later but just in case
			$_bo_SkipEmail:=True:C214
			$_bo_GeneratePDF:=False:C215
			$_bo_SendEmail:=False:C215
			$_bo_SendEmailInternal:=False:C215
		: ($_T_SRGenerationType="Email")
			$_bo_GeneratePDF:=True:C214
			$_bo_SendEmail:=True:C214
			$_bo_SendEmailInternal:=False:C215
		: ($_T_SRGenerationType="Print AND Email")
			$_bo_GeneratePDF:=True:C214
			$_bo_SendEmail:=True:C214
			$_bo_SendEmailInternal:=False:C215
		: ($_T_SRGenerationType="Ask user at the time report generated.")
			$_bo_GeneratePDF:=True:C214
			$_bo_SendEmail:=True:C214
			$_bo_SendEmailInternal:=False:C215
		Else   //shouldn't happen
			$_bo_GeneratePDF:=False:C215
			$_bo_SendEmail:=False:C215
			$_bo_SendEmailInternal:=False:C215
	End case 
	
	//**********************************************************************************************************************************************************
	
	
	
	
	$_bo_ByPassEmailOption:=False:C215
	Case of 
		: ($_bo_SkipEmail)
			$_bo_SendEmail:=False:C215
			$_bo_GeneratePDF:=False:C215
			$_bo_ByPassEmailOption:=True:C214
			$_bo_SendEmailInternal:=False:C215
		: (($_bo_OptionKey) & ($_bo_SendEmail) | ($_bo_SendEmailInternal))
			$_bo_SendEmail:=False:C215
			$_bo_GeneratePDF:=False:C215
			$_bo_ByPassEmailOption:=True:C214
			$_bo_SendEmailInternal:=False:C215
			//ALERT("ByPassEmail")
		: (($_bo_OptionKey=False:C215) & ($_bo_SendEmail))
			$_bo_SendEmail:=True:C214
			
		: (($_bo_OptionKey=False:C215) & ($_bo_SendEmailInternal))
			$_bo_SendEmailInternal:=True:C214
			
		Else   //do nothing
	End case 
	
	If (($_bo_SendEmail) | ($_bo_SendEmailInternal))  //bwalia user has a choice so ask if user wants to email print or cancel
		OK:=0
		xNext:=0
		xCancel:=0
		Case of   //added kmw v631b120i 20/11/08
			: ($_T_SRGenerationType="Print")
				xNext:=1
			: ($_T_SRGenerationType="Email")
				
			: ($_T_SRGenerationType="Print AND Email")
				
			: ($_T_SRGenerationType="Ask user at the time report generated.")
				Gen_Confirm3("What would you like to do with the printed report?"; "Email"; "Cancel"; "Print")
				
		End case 
		Case of 
			: (xNext=1)  //Print
				$_bo_SendEmail:=False:C215
				$_bo_GeneratePDF:=False:C215
				$_bo_ByPassEmailOption:=True:C214
				$_bo_SendEmailInternal:=False:C215
				
			: (xCancel=1)  //ALERT("Cancel")
				$_bo_Continue:=False:C215
			Else   //else email
		End case 
	End if 
	$_l_FaxMode:=<>FaxMode
	If (($_bo_Continue) & (($_bo_OptionKey) | ($_bo_SendEmail) | ($_bo_SendEmailInternal)))  //Fri, Jan 20, 2006 bwalia: PDF995 related stuff added
		Case of 
			: (($_bo_SendEmail) | ($_bo_SendEmailInternal))  //set in the document prefs to send orders/docs via PDF995
				$_l_Email:=995  //PDF995 has a code of 995 on mac it used to recognise PictPDF Plugin
				
			: ($_bo_ByPassEmailOption)
				$_l_Email:=0
				$_l_FaxMode:=0
			Else 
				$_l_Email:=EmailCheckPDFWriter
		End case 
		
		If (($_l_Email#995) & (<>FaxMode#0) & ($_l_FaxMode#0)) & (Is macOS:C1572)
			If ($_l_Email>0)  //email is possible
				CONFIRM:C162("Fax or Email?"; "FAX"; "E-mail")
				$_l_Email:=Num:C11(OK=0)
				//if they pressed ok $_l_Email is now 0
			End if 
			Case of 
				: ($_l_Email=0) & ($_l_FaxMode#0)
					//$_t_oldMethodName2:=ERR_MethodTracker ("EXECUTE: "+$_t_Param6)
					If (Not:C34(Macro_AccTypeDEF("Efax_SendSingle")))
						//EXECUTE FORMULA($_t_Param6)
						$_t_ExecuteMethodName:=STR_RemoveLeadTrailSpace($_t_Param6)
						EXECUTE METHOD:C1007($_t_ExecuteMethodName)
						vLayCode:=""
						$_t_FaxCompany:=Str_TelPrefStri(Str_TelStrip([COMPANIES:2]Fax:10))
						$FaxO:=Str_TelPrefStri(Str_TelStrip([CONTACTS:1]Fax:19))
						If ($FaxO#"")  //Don't do this for multiples
							If ($_t_FaxCompany="")
								$_t_FaxCompany:=$FaxO
							Else 
								Gen_Confirm("The Company Fax No is "+$_t_FaxCompany+Char:C90(13)+"The Contact Fax No is "+$FaxO+Char:C90(13)+"Which do you want?"; "Contact"; "Company")
								If (OK=1)
									$_t_FaxCompany:=$FaxO
								Else 
									OK:=1
								End if 
							End if 
						End if 
						If ($_t_FaxCompany#"")
							$_l_Error:=0
							$_t_ContactName:=[CONTACTS:1]Contact_Name:31
							Case of 
								: (<>FaxMode=1)
									$_l_Error:=Fax_FEStartM1(Fax_SPSubject($_t_Param5))
									If ($_l_Error=0)
										$_l_Error:=Fax_StartM2([COMPANIES:2]Company_Name:2; $_t_ContactName; $_t_FaxCompany)
									End if 
								: (<>FaxMode=2)
									$_l_Error:=Fax_SPStart(Fax_SPSubject($_t_Param5); [COMPANIES:2]Company_Name:2; $_t_ContactName; $_t_FaxCompany)
							End case 
							If ($_l_Error=0)
								Gen_Confirm3("You are about Fax to "+$_t_ContactName+(" of "*(Num:C11($_t_ContactName#"")))+[COMPANIES:2]Company_Name:2+" on "+$_t_FaxCompany+"."+Char:C90(13)+"Are you sure this is what you intend?"; "Fax"; "Cancel"; "Print")
								If ((OK=0) | (xNext=1))
									//set the chooser back to printer
									Fax_Cancel
									$_bo_PrintDone:=False:C215
									$_bo_OptionKey:=False:C215
								Else 
									$_bo_PrintDone:=True:C214
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
					//Gen_PPSingleEmail ($_l_Email;$_ptr_Param1;$_t_Param2;$_t_Param3;$_t_Param4;$_t_Param5;$_t_Param6;$_l_Parameter7;$_ptr_Param8;$_t_Param9;$_t_Param10;$_bo_Parameter11;[CONTACTS]Contact Code;[COMPANIES]Company Code)
					$_T_RememberSRTemplate:=[DOCUMENTS:7]Document_Code:1  //added 20/11/08 -kmw v631b120i
					$_l_Printed:=Gen_PPSingleEmail($_l_Email; $_ptr_Param1; $_t_Param2; $_t_Param3; $_t_Param4; $_t_Param5; $_t_Param6; $_l_Parameter7; $_ptr_Param8; $_t_Param9; $_t_Param10; $_bo_Parameter11; [CONTACTS:1]Contact_Code:2; [COMPANIES:2]Company_Code:1; $_t_Param12)  // 05/04/04 pb
					If ($_T_SRGenerationType="Print AND Email")  //added 20/11/08 -kmw v631b120i
						$_bo_Continue:=True:C214  //should have been this anyway but just in case
						QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=$_T_RememberSRTemplate)  //added 20/11/08 -kmw v631b120i.....we need to reload this because emailing unloads super report template due to it creating and saving an actual report document
					Else 
						$_bo_Continue:=False:C215
					End if 
					$_bo_PrintDone:=($_l_Printed=1)
			End case 
			
		Else 
			If ($_l_Email>0)
				//Gen_PPSingleEmail ($_l_Email;$_ptr_Param1;$_t_Param2;$_t_Param3;$_t_Param4;$_t_Param5;$_t_Param6;$_l_Parameter7;$_ptr_Param8;$_t_Param9;$_t_Param10;$_bo_Parameter11;[CONTACTS]Contact Code;[COMPANIES]Company Code)
				$_T_RememberSRTemplate:=[DOCUMENTS:7]Document_Code:1  //added 20/11/08 -kmw v631b120i
				$_l_Printed:=Gen_PPSingleEmail($_l_Email; $_ptr_Param1; $_t_Param2; $_t_Param3; $_t_Param4; $_t_Param5; $_t_Param6; $_l_Parameter7; $_ptr_Param8; $_t_Param9; $_t_Param10; $_bo_Parameter11; [CONTACTS:1]Contact_Code:2; [COMPANIES:2]Company_Code:1; $_t_Param12)  // 05/04/04 pb
				$_bo_PrintDone:=($_l_Printed=1)
				If ($_T_SRGenerationType="Print AND Email")  //added 20/11/08 -kmw v631b120i
					$_bo_Continue:=True:C214  //should have been this anyway but just in case
					QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=$_T_RememberSRTemplate)  //added 20/11/08 -kmw v631b120i.....we need to reload this because emailing unloads super report template due to it creating and saving an actual report document
				Else 
					$_bo_Continue:=False:C215
				End if 
			Else 
				$_bo_PrintDone:=False:C215
				$_bo_OptionKey:=False:C215
			End if 
			
		End if 
	End if 
	
	If ((OK=1) & ($_bo_Continue))
		//ALERT("Line 433")
		If ((<>FormMethod=2) & ($_t_Param5#""))
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=$_t_Param5)
		End if 
		If (<>FormMethod=2) & (Records in selection:C76([DOCUMENTS:7])>0) & ($_t_Param5#"") & (Is macOS:C1572)
			//ALERT("Method=2")
			
			If (<>Form4DW)
				Write_2:=WR New offscreen area:P12000:47  //wr new offscreen area
				WR PICTURE TO AREA:P12000:141(Write_2; [DOCUMENTS:7]Write_:5)
				If ($_t_Param6#"")
					//$_t_oldMethodName2:=ERR_MethodTracker ("EXECUTE: "+$_t_Param6)
					//EXECUTE FORMULA($_t_Param6)
					$_t_ExecuteMethodName:=STR_RemoveLeadTrailSpace($_t_Param6)
					EXECUTE METHOD:C1007($_t_ExecuteMethodName)
				End if 
				WR SET DOC PROPERTY:P12000:109(Write_2; wr view references:K12003:17; 0)
				//WR O DO COMMAND (Write;111)`this makes no sense
				WR DELETE OFFSCREEN AREA:P12000:38(Write_2)
				$_bo_PrintDone:=True:C214
			Else 
				If ((Count parameters:C259#7) & (Not:C34($_bo_OptionKey)))
					$_l_OK:=PRINT_SetSIZE("A4"; "P"; $_t_Param2)
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
				Else 
					$_l_OK:=1
				End if 
				If ($_l_OK=1)
					If ($_t_Param6#"")
						//$_t_oldMethodName2:=ERR_MethodTracker ("EXECUTE: "+$_t_Param6)
						//EXECUTE FORMULA($_t_Param6)
						$_t_ExecuteMethodName:=STR_RemoveLeadTrailSpace($_t_Param6)
						EXECUTE METHOD:C1007($_t_ExecuteMethodName)
					End if 
					vText:=Replace([DOCUMENTS:7]Text:3)
					If (<>FormWPTit)
						Print form:C5([DOCUMENTS:7]; "Form_With_Title")
					Else 
						Print form:C5([DOCUMENTS:7]; "Form")
					End if 
					PAGE BREAK:C6
					$_bo_PrintDone:=True:C214
					PRT_SetPrinterPaperOptions($_t_Param2)  //NG June 2005
				End if 
			End if 
			
		Else 
			//ALERT("Line 489")
			If (Count parameters:C259>8)
				//here look for a macro
				If ($_bo_SuperReportFoundOK)
					//ALERT("Will Use Superreport")
					
				End if 
				If ($_bo_SuperReportFoundOK)  //If (Form_SRProOK ($_t_Param9;$_t_Param10))
					COPY NAMED SELECTION:C331($_ptr_Param1->; "$Sel")
					ONE RECORD SELECT:C189($_ptr_Param1->)
					OK:=1
					//   If ((Count parameters=7) | ($_bo_OptionKey))
					//     SuperReport (File($_ptr_Param1);◊FormPath+$_t_Param5;1024)
					//    Else
					//    SuperReport (File($_ptr_Param1);◊FormPath+$_t_Param5;0)
					//    End if
					If ([DOCUMENTS:7]SR_PreMacro:16#"")
						Macro([DOCUMENTS:7]SR_PreMacro:16)
						OK:=1
					End if 
					$_t_CurrentPrinter:=Get current printer:C788
					$_t_oldMethodName2:=ERR_MethodTracker("Current printer is"+$_t_CurrentPrinter)
					
					If (<>SRP262)
						$_ptr_ReportField:=->[DOCUMENTS:7]SR_DOCUMENT_:4
					Else 
						$_ptr_ReportField:=->[DOCUMENTS:7]Write_:5
					End if 
					If (Not:C34(SR_bo_Validated))
						If (<>SRP262)
							SR_blb_ReportDataBLOB:=$_ptr_ReportField->
							$_ptr_SRPrint:=->SR_blb_ReportDataBLOB
						Else 
							SR_pic_ReportData:=$_ptr_ReportField->
							$_ptr_SRPrint:=->SR_pic_ReportData
						End if   //make a copy of the report, we might modify it
						SR_bo_Validated:=True:C214
						//If (SR Validate (SR_pic_ReportData)=0)
						//PRINT SETTINGS
						//$_l_PrintSet:=SR Page Setup (SR_pic_ReportData)
						//Else
						//PRINT SETTINGS
						If (ok=1)
							$_l_PrintSet:=1
						Else 
							$_l_PrintSet:=-1
						End if 
						//$_l_PrintSet:=SR Page Setup (SR_pic_ReportData)
						//End if
					Else 
						If (<>SRP262)
							SR_blb_ReportDataBLOB:=$_ptr_ReportField->
							$_ptr_SRPrint:=->SR_blb_ReportDataBLOB
						Else 
							SR_pic_ReportData:=$_ptr_ReportField->
							$_ptr_SRPrint:=->SR_pic_ReportData
						End if   //make a copy of the report, we might modify it
						$_l_PrintSet:=1
					End if 
					$_bo_PrintDone:=False:C215
					$_t_DestinationFIleName:=""
					If (($_l_PrintSet=1) | ($_l_PrintSet=0))
						$_t_ErrorHandler:=Method called on error:C704
						SR_bo_PageSetupFound:=False:C215
						SR_bo_PageSetupDisplayed:=False:C215
						$_l_OK:=PRINT_SetSIZE("A4"; "P"; [DOCUMENTS:7]Document_Code:1)
						If ($_l_OK>=0)
							$_t_CurrentPrinter:=Get current printer:C788
							$_t_oldMethodName2:=ERR_MethodTracker("Current printer is"+$_t_CurrentPrinter)
							
							$_l_OK:=1
							$_bo_PrintSettingsDisplayed:=False:C215
							If (Not:C34(SR_bo_PageSetupFound))
								If (Not:C34($_bo_PrintSettingsDisplayed))
									PRINT SETTINGS:C106
									$_l_OK:=OK
									$_t_CurrentPrinter:=Get current printer:C788
									$_t_oldMethodName2:=ERR_MethodTracker("Current printer is"+$_t_CurrentPrinter)
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
										$_t_CurrentPrinter:=Get current printer:C788
										$_t_oldMethodName2:=ERR_MethodTracker("Current printer is"+$_t_CurrentPrinter)
										
										GET PRINT OPTION:C734(9; $_l_PrintDestination; $_t_DestinationFIleName)
										Case of 
											: ($_l_PrintDestination=5)
												$_bo_ToScreenPreview:=True:C214
												$_bo_ToPDF:=False:C215
												
												$_t_oldMethodName2:=ERR_MethodTracker("Goes to print preview")
												
												
											: ($_l_PrintDestination=3)
												$_bo_ToScreenPreview:=False:C215
												$_bo_ToPDF:=True:C214
												$_t_oldMethodName2:=ERR_MethodTracker("Goes to PDF")
											Else 
												
												$_bo_ToScreenPreview:=False:C215
												$_bo_ToPDF:=False:C215
												$_l_SROptions:=SRP_Print_4DPageSetup
										End case 
										OK:=1
									Else 
										$_bo_ToScreenPreview:=False:C215
										$_bo_ToPDF:=False:C215
										$_l_SROptions:=SRP_Print_4DPageSetup
									End if 
								End if 
								//$_l_SROptions:=SRP_Print_4DPageSetup
							Else 
								If (Not:C34($_bo_PrintSettingsDisplayed))
									PRINT SETTINGS:C106
								End if 
								$_l_OK:=ok
								If ($_l_OK=1)
									$_l_NumberofCopies:=0
									GET PRINT OPTION:C734(Number of copies option:K47:4; $_l_NumberofCopies)
									If ($_l_NumberofCopies=0)
										$_l_NumberofCopies:=1
									End if 
									If (Is macOS:C1572) | (True:C214)
										
										$_t_CurrentPrinter:=Get current printer:C788
										$_t_oldMethodName2:=ERR_MethodTracker("Current printer is"+$_t_CurrentPrinter)
										
										GET PRINT OPTION:C734(9; $_l_PrintDestination; $_t_DestinationFIleName)
										Case of 
											: ($_l_PrintDestination=5)
												$_t_oldMethodName2:=ERR_MethodTracker("Goes to print preview")
												
												$_bo_ToScreenPreview:=True:C214
												$_bo_ToPDF:=False:C215
											: ($_l_PrintDestination=3)
												$_bo_ToScreenPreview:=False:C215
												$_bo_ToPDF:=True:C214
												$_t_oldMethodName2:=ERR_MethodTracker("Goes to PDF")
											Else 
												$_bo_ToScreenPreview:=False:C215
												$_bo_ToPDF:=False:C215
												$_l_SROptions:=SRP_Print_4DPageSetup
										End case 
										OK:=1
									Else 
										$_bo_ToScreenPreview:=False:C215
										$_bo_ToPDF:=False:C215
										$_l_SROptions:=SRP_Print_4DPageSetup
									End if 
								End if 
								
							End if 
							ON ERR CALL:C155("")
							
							If ($_l_OK=1)
								
								If ($_bo_ToPDF) | ($_bo_ToScreenPreview)
									$_t_PdfOutputFilePath:=""
									If ($_bo_ToPDF)
										
										$_t_PdfOutputFilePath:=$_t_DestinationFIleName
									End if 
									If ($_t_PdfOutputFilePath#"") | ($_bo_ToScreenPreview)
										$_t_CurrentPrinter:=Get current printer:C788
										$_t_oldMethodName2:=ERR_MethodTracker("Current printer is"+$_t_CurrentPrinter+" Just about to print")
										For ($_l_CopiesIndex; 1; $_l_NumberofCopies)
											$_bo_PDFOutputOK:=SuperReportToPDF(->[DOCUMENTS:7]Write_:5; $_t_PdfOutputFilePath; $_bo_ToScreenPreview; ->[DOCUMENTS:7]SR_DOCUMENTXML_:34)
											
										End for 
										If ($_bo_PDFOutputOK)
											$_l_Result:=0
											PRT_SetPrinterPaperOptions([DOCUMENTS:7]Document_Code:1)
										End if 
									Else 
										$_l_Result:=-1
									End if 
									
								Else 
									$_t_CurrentPrinter:=Get current printer:C788
									$_t_oldMethodName2:=ERR_MethodTracker("Current printer is"+$_t_CurrentPrinter+" Just about to print"+"Options are"+String:C10($_l_SROptions))
									For ($_l_CopiesIndex; 1; $_l_NumberofCopies)
										//ALERT("Size of XML="+String(Length([DOCUMENTS]SR_DOCUMENTXML_))+" About to print")
										//$_l_Result:=SR Print Report ($_ptr_ReportField->;$_l_SROptions;65535)
										$_l_Result:=SR_Print([DOCUMENTS:7]SR_DOCUMENTXML_:34; 0; SRP_Print_DestinationPrinter+$_l_SROptions; ""; 0; "")
										
									End for 
									PRT_SetPrinterPaperOptions([DOCUMENTS:7]Document_Code:1)
								End if 
								
							Else 
								$_l_Result:=-1
								
							End if 
						Else 
							$_l_Result:=-1
						End if 
						ON ERR CALL:C155($_t_ErrorHandler)
						$_bo_PrintDone:=($_l_Result=0)
						If (vLayCode="")
							OK:=0
						Else 
							OK:=1
						End if 
						
						USE NAMED SELECTION:C332("$Sel")
						CLEAR NAMED SELECTION:C333("$Sel")
					End if 
				Else 
					//ALERT("Will NOT Use Superreport")
					FORM SET OUTPUT:C54($_ptr_Param1->; $_t_Param2)
					If ((Count parameters:C259=7) | ($_bo_OptionKey))
						//PRINT SETTINGS
						$_l_OK:=PRINT_SetSIZE("A4"; "P"; $_t_Param2)
						$_bo_PrintDone:=False:C215
						If ($_l_OK>=0)  //Either the print setting was not displayed in PRINT_Setsize OR the settings were OK'd
							
							PRINT RECORD:C71($_ptr_Param1->; *)
							$_bo_PrintDone:=True:C214
						End if 
					Else 
						$_l_OK:=PRINT_SetSIZE("A4"; "P"; $_t_Param2)
						If ($_l_OK>=0)  //Either the print setting was not displayed in PRINT_Setsize OR the settings were OK'd
							If ($_l_OK=1)
								PRINT SETTINGS:C106
								$_l_OK:=OK
							Else 
								$_l_OK:=1
							End if 
							If ($_l_OK=1)
								$_bo_PrintDone:=True:C214
								PRINT RECORD:C71($_ptr_Param1->; *)
								PRT_SetPrinterPaperOptions($_t_Param2)
							Else 
								$_bo_PrintDone:=False:C215
								
							End if 
						Else 
							$_bo_PrintDone:=False:C215
						End if 
					End if 
					FORM SET OUTPUT:C54($_ptr_Param1->; $_t_Param3)
				End if 
				
			Else 
				
				FORM SET OUTPUT:C54($_ptr_Param1->; $_t_Param2)
				If ((Count parameters:C259=7) | ($_bo_OptionKey))
					//   PRINT SETTINGS
					$_l_OK:=PRINT_SetSIZE("A4"; "P"; $_t_Param2)
					$_bo_PrintDone:=False:C215
					If ($_l_OK>=0)  //Either the print setting was not displayed in PRINT_Setsize OR the settings were OK'd
						PRINT RECORD:C71($_ptr_Param1->; *)
						$_bo_PrintDone:=True:C214
					End if 
				Else 
					$_l_OK:=PRINT_SetSIZE("A4"; "P"; $_t_Param2)
					$_bo_PrintDone:=False:C215
					If ($_l_OK>=0)  //Either the print setting was not displayed in PRINT_Setsize OR the settings were OK'd
						If ($_l_OK=1)  //if COntinue=0 the print settings were displayed in Print_SetSize
							PRINT SETTINGS:C106
							$_l_OK:=OK
						Else 
							$_l_OK:=1
						End if 
						If ($_l_OK=1)
							PRINT RECORD:C71($_ptr_Param1->; *)
							PRT_SetPrinterPaperOptions($_t_Param2)
							$_bo_PrintDone:=True:C214
						Else 
							$_bo_PrintDone:=False:C215
						End if 
					Else 
						$_bo_PrintDone:=False:C215
					End if 
				End if 
				FORM SET OUTPUT:C54($_ptr_Param1->; $_t_Param3)
				
			End if 
		End if 
		
		If ($_bo_OptionKey)
			Case of 
				: (<>FaxMode=1)
					PLUGCALL_Chooser("SetChooser")
					
				: (<>FaxMode=2)
					Fax_SPEnd([COMPANIES:2]Company_Name:2)
			End case 
		End if 
		
	End if 
	If (Not:C34($_bo_PrintDone))
		$0:=0
	Else 
		$0:=1
	End if 
	
End if 
DB_t_CurrentFormUsage:=$_t_CurrentFormUsage
<>Faxing:=False:C215
ERR_MethodTrackerReturn("Gen_PPSingle"; $_t_oldMethodName)
