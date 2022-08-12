//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Reports_InLPB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/11/2009 09:12`Method: Reports_InLPB
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(SR_DOCUMENTXML)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	ARRAY POINTER:C280($_aptr_PrefsToLoad; 0)
	//ARRAY TEXT(<>DB_at_TableNames;0)
	//ARRAY TEXT(EMail_at_DocEmailTo;0)
	C_BLOB:C604($_blb_SrDocument)
	C_BOOLEAN:C305(<>PersAnOver; <>SRP262; DOC_bo_PDFPreventCopy; DOC_bo_PDFPreventEdit; DOC_bo_PDFPreventPrinting; PDF_bo_IsLicenced; PDF_bo_UserPassword)
	C_LONGINT:C283($_l_Error; $_l_offset; $_l_Source; DOC_l_CopyToPrinter; DOC_l_docDoEmail; DOC_l_docDoPdf; DOC_l_DocDoPrint; SR_DOCUMENT; vAdd; vOrdI)
	C_POINTER:C301($_ptr_Area; $_ptr_Hold; $_ptr_PrintSR; vFilePtr)
	C_TEXT:C284(<>Per_t_CurrentDefaultAnalCode; <>PER_t_CurrentUserInitials; $_t_DocEmailTo; $_t_oldMethodName; $_t_SrAreaXML; DB_t_ReportName; DOC_t_DocEmailFrom; DOC_t_DocumentName; DOC_t_EmailBodyReport; DOC_t_EmailSubject; DOC_t_TemplateCode)
	C_TEXT:C284(EMAIL_t_DocEmailRoletoText; email_t_Role; Rep_t_docEmailToTxt; SR_t_ReportDataXML; vButtDisREP; vStatus)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Reports_InLPB")

DOC_bo_PDFPreventCopy:=False:C215
DOC_bo_PDFPreventEdit:=False:C215
DOC_bo_PDFPreventPrinting:=False:C215
PDF_bo_UserPassword:=False:C215
PDF_EncyptLoadPrefs
PDF_bo_IsLicenced:=PDF_EncryptVerfifyLicence



//◊SRP262:=True
//TRACE
Doc_userIn13
If (<>SRP262)
	$_ptr_Hold:=->$_blb_SrDocument
	$_ptr_Area:=->SR_DOCUMENT
	$_ptr_PrintSR:=->[DOCUMENTS:7]SR_DOCUMENT_:4
Else 
	$_ptr_Hold:=->[DOCUMENTS:7]SR_DOCUMENTXML_:34
	
	$_ptr_Area:=->SR_DOCUMENTXML
	$_ptr_PrintSR:=->[DOCUMENTS:7]SR_DOCUMENTXML_:34
End if 
SR_LoadReport($_ptr_Area->; $_ptr_PrintSR->)

//$_l_Error:=SR Set Area ($_ptr_Area->;$_ptr_PrintSR->)
If (vAdd=1)
	If ([DOCUMENTS:7]Document_Code:1="")
		If (DB_t_ReportName#"")
			[DOCUMENTS:7]Document_Code:1:="SR "+DB_t_ReportName
			//here i want to add in picking up a default version from the files
			
			
		Else 
			[DOCUMENTS:7]Document_Code:1:="SR"+Gen_CodePref(5; ->[DOCUMENTS:7]Document_Code:1; "SR")
		End if 
		GOTO OBJECT:C206([DOCUMENTS:7]Heading:2)
	End if 
	If ([DOCUMENTS:7]Person:10="")
		[DOCUMENTS:7]Person:10:=<>PER_t_CurrentUserInitials
	End if 
	If (([DOCUMENTS:7]Analysis_Code:12="") & (<>PersAnOver))
		[DOCUMENTS:7]Analysis_Code:12:=<>Per_t_CurrentDefaultAnalCode
	End if 
	
	If ([DOCUMENTS:7]Table_Number:11=0)
		If (vFilePtr=(->[USER:15]))
			[DOCUMENTS:7]Table_Number:11:=25  //Assume its Orders
		Else 
			[DOCUMENTS:7]Table_Number:11:=Table:C252(vFilePtr)
		End if 
		//..invesitgate
		//$_l_Error:=SR Get Area ($_ptr_Area->;$_ptr_Hold->)
		//$_l_Error:=SR_SaveReport ($_ptr_Area->;$_ptr_Hold->;0)
		//ALERT("2a")
		$_l_Error:=SR_SaveReport($_ptr_Area->; SR_t_ReportDataXML)
		
		$_ptr_Hold->:=SR_t_ReportDataXML
		
		//$_l_Error:=SR Main Table ($_ptr_Hold->;1;[DOCUMENTS]Table_Number;"")
		//Reports_InSRStr (write)
		//$_l_Errores:=SR_SetLongProperty ($_ptr_Hold->;SRP_DataSource_TableID;[DOCUMENTS]Table_Number)
		//$_l_Errores:=SR_SetTextProperty ($_ptr_Hold->;SRP_DataSource_Source;"1")
		//ALERT("2b")
		$_l_Source:=SR_GetLongProperty($_ptr_Area->; 1; SRP_Report_DataSource)
		//ALERT("2c")
		If ([DOCUMENTS:7]Table_Number:11>0) & (Is table number valid:C999([DOCUMENTS:7]Table_Number:11))
			SR_SetLongProperty($_ptr_Area->; $_l_Source; SRP_DataSource_TableID; [DOCUMENTS:7]Table_Number:11)
		End if 
		//ALERT("2d")
		
		
		//$_l_Error:=SR Set Area ($_ptr_Area->;$_ptr_Hold->)
	End if 
Else 
	//Reports_InSRStr (write)
	//$_l_Error:=SR On Event ($_ptr_Area->;0;"Reports_Event")
	GOTO OBJECT:C206($_ptr_Area->)
End if 
If (([DOCUMENTS:7]Table_Number:11>0) & ([DOCUMENTS:7]Table_Number:11<=Size of array:C274(<>DB_at_TableNames)))
	vStatus:=<>DB_at_TableNames{Find in array:C230(<>DB_al_TableNums; [DOCUMENTS:7]Table_Number:11)}
Else 
	vStatus:=""
End if 

//$_l_Error:=SR Set Area (Write;$pict)

//$_l_Error:=SR On Event ($_ptr_Area->;0;"Reports_Event")
vOrdI:=0  //used to store the ref to an expanded area


vButtDisREP:="I  PMO   SSSRCADT"
Input_Buttons(->[DOCUMENTS:7]; ->vButtDisREP)
Reports_prefsLoad([DOCUMENTS:7]Document_Code:1; ->DOC_t_TemplateCode; ->DOC_l_DocDoPrint; ->DOC_l_docDoPdf; ->DOC_l_docDoEmail; ->DOC_l_CopyToPrinter; ->DOC_t_DocumentName; ->DOC_t_DocEmailFrom; ->DOC_t_EmailSubject; ->DOC_t_EmailBodyReport; ->Rep_t_docEmailToTxt; ->EMAIL_t_DocEmailRoletoText)
ARRAY POINTER:C280($_aptr_PrefsToLoad; 0)
Reports_PrefsLoadNEW([DOCUMENTS:7]Document_Code:1; "REPORT"; ->$_aptr_PrefsToLoad; False:C215; Table:C252(->[DOCUMENTS:7]); 0)  //Added 02/12/08 v631b120i -kmw
Reports_PrefsSetVisibility
EMail_at_DocEmailTo:=Find in array:C230(EMail_at_DocEmailTo; Rep_t_docEmailToTxt)
If (EMail_at_DocEmailTo<1)
	EMail_at_DocEmailTo:=1
End if 
$_t_DocEmailTo:=""
If (Size of array:C274(EMail_at_DocEmailTo)>0)
	$_t_DocEmailTo:=EMail_at_DocEmailTo{EMail_at_DocEmailTo}
End if 

email_t_Role:=EMAIL_t_DocEmailRoletoText

Case of 
	: ($_t_DocEmailTo="Contact where Role is")
		OBJECT SET VISIBLE:C603(*; "emailRole@"; True:C214)
		
	Else 
		OBJECT SET VISIBLE:C603(*; "emailRole@"; False:C215)
End case 
EMail_at_DocEmailTo:=Find in array:C230(EMail_at_DocEmailTo; Rep_t_docEmailToTxt)
If (EMail_at_DocEmailTo<1)
	EMail_at_DocEmailTo:=1
End if 

If (Size of array:C274(EMail_at_DocEmailTo)>0)
	$_t_DocEmailTo:=EMail_at_DocEmailTo{EMail_at_DocEmailTo}
End if 


email_t_Role:=EMAIL_t_DocEmailRoletoText
If (PDF_bo_IsLicenced)
	If (BLOB size:C605([DOCUMENTS:7]PDF_Options:31)>0)
		$_l_offset:=0
		BLOB TO VARIABLE:C533([DOCUMENTS:7]PDF_Options:31; DOC_bo_PDFPreventCopy; $_l_offset)
		If (BLOB size:C605([DOCUMENTS:7]PDF_Options:31)>$_l_offset)
			BLOB TO VARIABLE:C533([DOCUMENTS:7]PDF_Options:31; DOC_bo_PDFPreventEdit; $_l_offset)
			If (BLOB size:C605([DOCUMENTS:7]PDF_Options:31)>$_l_offset)
				BLOB TO VARIABLE:C533([DOCUMENTS:7]PDF_Options:31; DOC_bo_PDFPreventPrinting; $_l_offset)
				If (BLOB size:C605([DOCUMENTS:7]PDF_Options:31)>$_l_offset)
					BLOB TO VARIABLE:C533([DOCUMENTS:7]PDF_Options:31; PDF_bo_UserPassword; $_l_offset)
				End if 
			End if 
		End if 
	End if 
Else 
	OBJECT SET VISIBLE:C603(*; "oPdfOptions@"; False:C215)
End if 

Case of 
	: ($_t_DocEmailTo="Contact where Role is")
		OBJECT SET VISIBLE:C603(*; "emailRole@"; True:C214)
		
	Else 
		OBJECT SET VISIBLE:C603(*; "emailRole@"; False:C215)
End case 

Input_Buttons(->[DOCUMENTS:7]; ->vButtDisREP)
ERR_MethodTrackerReturn("Reports_InLPB"; $_t_oldMethodName)
