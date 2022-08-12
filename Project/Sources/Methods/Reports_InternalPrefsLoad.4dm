//%attributes = {}
If (False:C215)
	//Project Method Name:      Reports_InternalPrefsLoad
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/11/2009`Method: Reports_InternalPrefsLoad
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(DOC_abo_DocPdfPrefs;0)
	//ARRAY BOOLEAN(DOC_abo_EmailPrefs;0)
	//ARRAY TEXT(DOC_at_DocumentTypes;0)
	//ARRAY TEXT(DOC_at_EmailBody;0)
	//ARRAY TEXT(DOC_at_EmailFrom;0)
	//ARRAY TEXT(DOC_at_EmailSubject;0)
	//ARRAY TEXT(DOC_at_OutputFolderPath;0)
	//ARRAY TEXT(DOC_at_PDF995Path;0)
	//ARRAY TEXT(DOC_at_PDFTargetPath;0)
	//ARRAY TEXT(DOC_at_SavedPrefix;0)
	//ARRAY TEXT(PDF_at_995DocsDirPath;0)
	C_LONGINT:C283($_l_DocumentTypeRow; DOC_l_docDoEmailInternal; DOC_l_DocDoPDFInternal; DOC_l_DoPrintInternal)
	C_TEXT:C284($_t_FormName; $_t_oldMethodName; $1; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; DOC_t_DocumentNameInternal; DOC_t_EmailBodyInternal; Doc_t_EmailFromInternal; DOC_t_EmailSubjectInternal; DOC_t_INIFilePath)
	C_TEXT:C284(DOC_t_OutputFolderPath; DOC_t_OutputFolderPathInternal; DOC_t_TemplateCodeInternal)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Reports_InternalPrefsLoad")

DOC_l_DoPrintInternal:=1
DOC_l_DocDoPDFInternal:=0
DOC_l_docDoEmailInternal:=0
DOC_t_TemplateCodeInternal:=""

DOC_t_DocumentNameInternal:=""
Doc_t_EmailFromInternal:=""
DOC_t_EmailSubjectInternal:=""
DOC_t_EmailBodyInternal:=""
DOC_t_OutputFolderPathInternal:=""
DOC_t_INIFilePath:=""
DOC_t_OutputFolderPath:=""  //bwalia 20060926

If ((Is macOS:C1572=False:C215) | (Current user:C182="designer") | (Current user:C182="administrator"))  //Tue, Feb 7, 2006 bwalia: internal reports PDF prints are  only available on PC - as PDF995
	Doc_userPreferencesLoad  //get saved preferences
	
	$_t_FormName:=Doc_userPreferencesIndexGet(DB_t_CurrentFormUsage)
	
	$_l_DocumentTypeRow:=Find in array:C230(DOC_at_DocumentTypes; $_t_FormName)
	If ($_l_DocumentTypeRow>0)
		DOC_t_DocumentNameInternal:=DOC_at_SavedPrefix{$_l_DocumentTypeRow}
		DOC_t_OutputFolderPathInternal:=DOC_at_OutputFolderPath{$_l_DocumentTypeRow}
		
		DOC_l_docDoEmailInternal:=Num:C11(DOC_abo_EmailPrefs{$_l_DocumentTypeRow})
		Doc_t_EmailFromInternal:=DOC_at_EmailFrom{$_l_DocumentTypeRow}
		DOC_t_EmailBodyInternal:=DOC_at_EmailBody{$_l_DocumentTypeRow}
		DOC_t_EmailSubjectInternal:=DOC_at_EmailSubject{$_l_DocumentTypeRow}
		DOC_t_INIFilePath:=DOC_at_PDFTargetPath{$_l_DocumentTypeRow}
		DOC_l_DocDoPDFInternal:=Num:C11(DOC_abo_DocPdfPrefs{$_l_DocumentTypeRow})
	End if 
	
	Personnel_PDF_LoadPrefs  //also load this user prefs and override core prefs if provided
	$_l_DocumentTypeRow:=Personnel_PDF_GetPrefsElement
	
	If ($_l_DocumentTypeRow>0)
		If (DOC_at_PDF995Path{$_l_DocumentTypeRow}#"")
			DOC_t_INIFilePath:=DOC_at_PDF995Path{$_l_DocumentTypeRow}
		End if 
		If (PDF_at_995DocsDirPath{$_l_DocumentTypeRow}#"")  //bwalia 20060926
			DOC_t_OutputFolderPath:=PDF_at_995DocsDirPath{$_l_DocumentTypeRow}
		End if 
		
	End if 
	If (DOC_t_OutputFolderPathInternal="")
	End if 
End if 
//</code>

//<return>
//$0 :=
//</return>
ERR_MethodTrackerReturn("Reports_InternalPrefsLoad"; $_t_oldMethodName)
